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

-- ----- fragment: minion_1-samuel_11.sql (1 Samuel 11) -----
-- Chapter: 1 Samuel 11 — Nahash the Ammonite besieges Jabesh-gilead, demanding the right eyes of
-- every man for a reproach upon all Yashar'el (Israel) (11:1-3). The tidings reach Gibeah and the
-- people weep (11:4-5). ★ *And the Spirit of Elohim (God) came upon Saul when he heard those tidings,
-- and his anger was kindled greatly* (11:6) — the Spirit-empowered deliverer, the judge-pattern: he
-- hews the yoke of oxen, musters all Yashar'el and Yahudah (11:7-8), and delivers Jabesh, slaying the
-- Ammonites until the heat of the day (11:9-11). The people would put the doubters to death, but Saul
-- shows mercy in the hour of victory — *There shall not a man be put to death this day: for to day
-- Yahuah (LORD) hath wrought salvation in Yashar'el (Israel)* (11:13). The kingdom is *renewed* at
-- Gilgal with peace offerings and great rejoicing (11:14-15). The Spirit-on-the-deliverer weaves
-- FORWARD to the true Anointed on whom the Spirit rests (Luke 4:18) — NOT a separate co-equal divine
-- person, but the one Ruach of Yahuah resting on the chosen.
-- Tag: 1sa11   Temp view: _s340_1sa11_lookup
-- Sort band: base 36650, step 3 -> threads at 36650, 36653, 36656, 36659 (4 threads)
-- Source of EVERY row: 'canon','1-samuel',11,v
--
-- 1 Samuel 11 coverage:
--   v.1-5 (Nahash besieges Jabesh-gilead; the right eyes; a reproach on Yashar'el; the people weep)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in THREAD 2 prose (the cry for a saviour answered) — the besieged people who need a deliverer
--   ★★★ v.6 (the Spirit of Elohim came upon Saul; his anger kindled greatly)
--        NT:     ★★ Luke 4:18 (The Spirit of Yahuah is upon me, because he hath anointed me)
--        Extras: none warranted
--        Tanakh: ★★★ Judges 3:10 (the Spirit of Yahuah came upon him, and he judged Yashar'el, and went out
--                to war), ★★ Judges 6:34 (the Spirit of Yahuah came upon Gideon, and he blew a trumpet),
--                ★★ Judges 11:29 (the Spirit of Yahuah came upon Jephthah) — THREAD 1
--   ★★ v.11, v.13 (Saul delivers Jabesh; Yahuah hath wrought salvation in Yashar'el)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★★ Judges 3:9 (Yahuah raised up a deliverer... who delivered them), ★★ 2 Samuel 19:9 (The
--                king saved us out of the hand of our enemies) — THREAD 2
--   ★★ v.12-13 (the people would slay the doubters; Saul: there shall not a man be put to death this day)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★★ 2 Samuel 19:22 (shall there any man be put to death this day in Yashar'el? for do not I
--                know that I am this day king over Yashar'el?) — THREAD 3
--   ★★ v.14-15 (renew the kingdom at Gilgal; peace offerings; rejoiced greatly)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★★ 1 Samuel 10:8 (Gilgal... sacrifice sacrifices of peace offerings), ★ 1 Samuel 12:1
--                (Behold, I have hearkened unto your voice... and have made a king over you) — THREAD 4
--   v.7-10 (the yoke of oxen hewed; the muster of Yashar'el and Yahudah; the answer to Jabesh) — held in
--        THREAD 1/2 prose (the Spirit-roused muster of both houses)
--        NT: none warranted   Extras: none warranted   Tanakh: held in prose
--
-- Threads (slug — target libraries):
--   1. 1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer — NT (Luke 4) + Tanakh (Judges 3, Judges 6, Judges 11) [free]
--      (★★★ the Spirit upon the deliverer — the judge-pattern — forward to the true Anointed; the one Ruach, NOT a separate divine person)
--   2. 1-samuel-11-yahuah-hath-wrought-salvation-in-yashar-el-the-king-who-saves — Tanakh (Judges 3, 2 Samuel 19) [free]
--      (★★ the besieged people cry; Yahuah raises a deliverer; the king who saves)
--   3. 1-samuel-11-there-shall-not-a-man-be-put-to-death-this-day-mercy-in-the-day-of-victory — Tanakh (2 Samuel 19) [free]
--      (★★ mercy not vengeance in the hour of salvation; the same word on David's lips the day his kingdom is established)
--   4. 1-samuel-11-renew-the-kingdom-at-gilgal-peace-offerings-and-rejoicing — Tanakh (1 Samuel 10, 1 Samuel 12) [free]
--      (★★ the kingdom renewed at Gilgal with peace offerings before Yahuah; the king made before Yahuah)
--
-- Framing notes:
--   ★★★ THE SPIRIT UPON THE DELIVERER (THREAD 1): *the Spirit of Elohim (God) came upon Saul when he
--      heard those tidings, and his anger was kindled greatly* (11:6) is the judge-pattern exactly — the
--      same Ruach that *came upon* Othniel (Judges 3:10), upon Gideon (Judges 6:34), upon Jephthah
--      (Judges 11:29). It is the one Spirit of Yahuah resting on the man He raises to save His people,
--      reaching its term in the true Anointed: *The Spirit of Yahuah (Lord) is upon me, because he hath
--      anointed me* (Luke 4:18). NOT a separate co-equal divine person but the Father's own Spirit upon
--      the chosen deliverer.
--   ★★ THE KING WHO SAVES (THREAD 2): the besieged of Jabesh need a saviour, and Saul delivers — *Yahuah
--      (LORD) hath wrought salvation in Yashar'el (Israel)* (11:13). The judge-cycle named the answer:
--      *Yahuah (LORD) raised up a deliverer... who delivered them* (Judges 3:9); and Yashar'el will later
--      confess of the king, *The king saved us out of the hand of our enemies* (2 Samuel 19:9). The
--      salvation is Yahuah's, wrought through the anointed He raises.
--   ★★ MERCY IN THE DAY OF VICTORY (THREAD 3): the people would slay the men who doubted Saul, but he
--      will not — *There shall not a man be put to death this day: for to day Yahuah (LORD) hath wrought
--      salvation in Yashar'el (Israel)* (11:13). David speaks the very same on the day his kingdom is
--      restored — *shall there any man be put to death this day in Yashar'el (Israel)? for do not I know
--      that I am this day king over Yashar'el (Israel)?* (2 Samuel 19:22). The day of salvation is the
--      day of mercy, not vengeance; victims, not enemies.
--   ★★ THE KINGDOM RENEWED AT GILGAL (THREAD 4): *Come, and let us go to Gilgal, and renew the kingdom
--      there* (11:14); and there *they made Saul king before Yahuah (LORD)... and there they sacrificed
--      sacrifices of peace offerings before Yahuah (LORD); and there Saul and all the men of Yashar'el
--      (Israel) rejoiced greatly* (11:15). Gilgal was already appointed for peace offerings before Yahuah
--      (1 Samuel 10:8), and Samuel will testify he *made a king over* them (12:1). The throne is set
--      before Yahuah with sacrifice and joy.
--   VERSES WITH NO SEPARATE ADD: v.1-5 (the siege, the right eyes, the weeping — held in THREAD 2 prose,
--      the besieged who need a saviour); v.7-10 (the yoke of oxen, the muster of both houses, the answer
--      to Jabesh — held in THREAD 1/2 prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s340_1sa11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the Spirit of Elohim came upon Saul — the Spirit-empowered deliverer
    ('canon','1-samuel',11,6,'canon','judges',3,10,'free',
      E'*And the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war: and Yahuah (LORD) delivered Chushan-rishathaim king of Mesopotamia into his hand; and his hand prevailed against Chushan-rishathaim* (Judges 3:10). This is the judge-pattern exactly: the Spirit comes upon the man Yahuah raises, and he goes out to save. So with Saul — *the Spirit of Elohim (God) came upon Saul when he heard those tidings, and his anger was kindled greatly* (1 Samuel 11:6). The first deliverer of the kingship is roused as Othniel was: one Ruach of Yahuah upon the chosen.'),
    ('canon','1-samuel',11,6,'canon','judges',6,34,'free',
      E'*But the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet; and Abi-ezer was gathered after him* (Judges 6:34). As the Spirit upon Gideon turned a fearful man into a deliverer who mustered Yashar''el with a trumpet, so *the Spirit of Elohim (God) came upon Saul* (1 Samuel 11:6), and he hewed the yoke of oxen and sent through all the coasts of Yashar''el (Israel) to gather them (11:7). The same Spirit, the same summons, the same one Ruach of Yahuah raising up a saviour.'),
    ('canon','1-samuel',11,6,'canon','judges',11,29,'free',
      E'*Then the Spirit of Yahuah (LORD) came upon Jephthah, and he passed over Gilead, and Manasseh, and passed over Mizpeh of Gilead, and from Mizpeh of Gilead he passed over unto the children of Ammon* (Judges 11:29). Jephthah, Spirit-empowered, marched against the children of Ammon — the very enemy Saul faces when *the Spirit of Elohim (God) came upon* him (1 Samuel 11:6) and he delivered Jabesh-gilead from Nahash the Ammonite. The Spirit-roused deliverer against Ammon is one continuous pattern; Saul stands in the line of the judges.'),
    ('canon','1-samuel',11,6,'canon','luke',4,18,'free',
      E'*The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind, to set at liberty them that are bruised* (Luke 4:18). The Ruach that *came upon Saul* (1 Samuel 11:6) to deliver Jabesh from the threat of the gouged-out eye reaches its term in the true Anointed, on whom the Spirit rests to bring *recovering of sight to the blind* and liberty to the bruised. The Spirit upon the deliverer is the Father''s one Spirit on His chosen — never a second, co-equal deity, but Yahuah''s own Ruach resting where He wills.')
,
    -- THREAD 2 (★★): Yahuah hath wrought salvation in Yashar'el — the king who saves
    ('canon','1-samuel',11,13,'canon','judges',3,9,'free',
      E'*And when the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised up a deliverer to the children of Yashar''el (Israel), who delivered them, even Othniel the son of Kenaz, Caleb''s younger brother* (Judges 3:9). The cry of besieged Jabesh and the weeping at Gibeah (1 Samuel 11:4) are answered as the judge-cycle was answered: Yahuah raises a deliverer and saves His people. Saul says it plainly — *to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (11:13). The salvation is Yahuah''s, wrought through the man He raises up.'),
    ('canon','1-samuel',11,13,'canon','2-samuel',19,9,'free',
      E'*And all the people were at strife throughout all the tribes of Yashar''el (Israel), saying, The king saved us out of the hand of our enemies, and he delivered us out of the hand of the Philistines* (2 Samuel 19:9). The confession Yashar''el makes of David — *the king saved us* — is first earned by Saul at Jabesh, when *Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (1 Samuel 11:13) through his hand. The throne is given to save the people; the anointed king is Yahuah''s instrument of deliverance.')
,
    -- THREAD 3 (★★): there shall not a man be put to death this day — mercy in the day of victory
    ('canon','1-samuel',11,13,'canon','2-samuel',19,22,'free',
      E'*And David said, What have I to do with you, ye sons of Zeruiah, that ye should this day be adversaries unto me? shall there any man be put to death this day in Yashar''el (Israel)? for do not I know that I am this day king over Yashar''el (Israel)?* (2 Samuel 19:22). David, on the day his kingdom is restored, refuses to slay Shimei who had cursed him — the very mercy Saul shows at the height of his victory: *There shall not a man be put to death this day: for to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (1 Samuel 11:13). The day of salvation is the day of mercy, not vengeance; the king who is Yahuah''s deliverer spares rather than destroys his own.')
,
    -- THREAD 4 (★★): renew the kingdom at Gilgal — peace offerings and rejoicing
    ('canon','1-samuel',11,15,'canon','1-samuel',10,8,'free',
      E'*And thou shalt go down before me to Gilgal; and, behold, I will come down unto thee, to offer burnt offerings, and to sacrifice sacrifices of peace offerings: seven days shalt thou tarry, till I come to thee, and shew thee what thou shalt do* (1 Samuel 10:8). Gilgal was already appointed by Samuel for peace offerings before Yahuah; there the kingdom is now renewed — *there they sacrificed sacrifices of peace offerings before Yahuah (LORD); and there Saul and all the men of Yashar''el (Israel) rejoiced greatly* (1 Samuel 11:15). The throne is set before Yahuah at the appointed place, with the sacrifices of peace.'),
    ('canon','1-samuel',11,14,'canon','1-samuel',12,1,'free',
      E'*And Samuel said unto all Yashar''el (Israel), Behold, I have hearkened unto your voice in all that ye said unto me, and have made a king over you* (1 Samuel 12:1). Samuel''s word at Gilgal — *Come, and let us go to Gilgal, and renew the kingdom there* (1 Samuel 11:14) — is the deed he testifies to in the very next breath: he *made a king over* Yashar''el. The renewing at Gilgal is Samuel''s public confirmation of the throne the people had demanded, now established before Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer',
       E'The Spirit of Elohim came upon Saul — the Spirit-empowered deliverer',
       E'When the messengers of besieged Jabesh-gilead reach Gibeah and the people lift up their voices and weep (1 Samuel 11:4), the deliverer is roused not by his own strength but by the Spirit: *And the Spirit of Elohim (God) came upon Saul when he heard those tidings, and his anger was kindled greatly* (11:6). He hews a yoke of oxen and sends the pieces through all the coasts of Yashar''el (Israel), and *the fear of Yahuah (LORD) fell on the people, and they came out with one consent* (11:7) — both houses, *the children of Yashar''el (Israel)* and *the men of Yahudah (Judah)* (11:8). This is the judge-pattern exactly. The same Ruach *came upon* Othniel — *the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war* (Judges 3:10); *came upon Gideon, and he blew a trumpet* (Judges 6:34); *came upon Jephthah*, who *passed over... unto the children of Ammon* (Judges 11:29) — the very enemy Saul now faces. It is the one Spirit of Yahuah resting on the man He raises to save His people, never a separate co-equal divine person beside Him. And it reaches its term in the true Anointed, on whom the Spirit rests without measure: *The Spirit of Yahuah (Lord) is upon me, because he hath anointed me to preach the gospel to the poor... to preach deliverance to the captives, and recovering of sight to the blind* (Luke 4:18) — the Spirit that roused Saul against the threat of the gouged-out eye now bringing recovering of sight to the blind. The Father''s one Ruach upon His chosen deliverer.',
       sv.verse_id, ev.verse_id, 'free', 36650
  FROM _s340_1sa11_lookup sv, _s340_1sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=11 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-11-yahuah-hath-wrought-salvation-in-yashar-el-the-king-who-saves',
       E'Yahuah hath wrought salvation in Yashar''el — the king who saves',
       E'Nahash the Ammonite besieges Jabesh-gilead and demands a covenant of mutilation — *that I may thrust out all your right eyes, and lay it for a reproach upon all Yashar''el (Israel)* (1 Samuel 11:2); the people of Gibeah hear and weep (11:4). The cry of the besieged is answered as the judge-cycle answered every cry: *when the children of Yashar''el (Israel) cried unto Yahuah (LORD), Yahuah (LORD) raised up a deliverer to the children of Yashar''el (Israel), who delivered them* (Judges 3:9). Saul puts the people in three companies and slays the Ammonites until the heat of the day (11:11), and names the source of the victory: *to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (11:13). The salvation is Yahuah''s, wrought through the man He raises up — and this is what the throne is for. Yashar''el will later confess the same of David: *The king saved us out of the hand of our enemies, and he delivered us out of the hand of the Philistines* (2 Samuel 19:9). The anointed king is Yahuah''s instrument of deliverance; the saving is His.',
       sv.verse_id, ev.verse_id, 'free', 36653
  FROM _s340_1sa11_lookup sv, _s340_1sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-11-there-shall-not-a-man-be-put-to-death-this-day-mercy-in-the-day-of-victory',
       E'There shall not a man be put to death this day — mercy in the day of victory',
       E'In the flush of the deliverance, the people turn on those who had once doubted Saul: *Who is he that said, Shall Saul reign over us? bring the men, that we may put them to death* (1 Samuel 11:12). But the Spirit-roused deliverer will not avenge himself in his hour of triumph: *And Saul said, There shall not a man be put to death this day: for to day Yahuah (LORD) hath wrought salvation in Yashar''el (Israel)* (11:13). The day Yahuah saves is no day for the king to shed the blood of his own. David speaks the very same word on the day his kingdom is restored, when Abishai would slay Shimei who had cursed him: *shall there any man be put to death this day in Yashar''el (Israel)? for do not I know that I am this day king over Yashar''el (Israel)?* (2 Samuel 19:22). The anointed who is Yahuah''s instrument of salvation answers the gift of victory with mercy, not vengeance — sparing his own rather than destroying them, dismantling the threat without making enemies of the people.',
       sv.verse_id, ev.verse_id, 'free', 36656
  FROM _s340_1sa11_lookup sv, _s340_1sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-11-renew-the-kingdom-at-gilgal-peace-offerings-and-rejoicing',
       E'Renew the kingdom at Gilgal — peace offerings and rejoicing before Yahuah',
       E'With Jabesh delivered and the doubters spared, Samuel gathers Yashar''el to the appointed place: *Come, and let us go to Gilgal, and renew the kingdom there* (1 Samuel 11:14). And there the throne is established before Yahuah with sacrifice and joy: *And all the people went to Gilgal; and there they made Saul king before Yahuah (LORD) in Gilgal; and there they sacrificed sacrifices of peace offerings before Yahuah (LORD); and there Saul and all the men of Yashar''el (Israel) rejoiced greatly* (11:15). Gilgal had already been marked out by Samuel for the peace offerings: *thou shalt go down before me to Gilgal... to sacrifice sacrifices of peace offerings* (1 Samuel 10:8). And the renewing is the very deed Samuel testifies to in the next breath: *Behold, I have hearkened unto your voice in all that ye said unto me, and have made a king over you* (1 Samuel 12:1). The kingdom the people had demanded is now confirmed publicly, before Yahuah, at His appointed place — sealed with the offerings of peace and the great rejoicing of all the men of Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 36659
  FROM _s340_1sa11_lookup sv, _s340_1sa11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the Spirit of Yahuah (LORD) came upon him, and he judged Yashar''el (Israel), and went out to war* (Judges 3:10) — the judge-pattern exactly: the Spirit upon Othniel as upon Saul (1 Samuel 11:6); one Ruach of Yahuah upon the deliverer He raises.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the Spirit of Yahuah (LORD) came upon Gideon, and he blew a trumpet* (Judges 6:34) — as the Spirit turned Gideon into a deliverer who mustered Yashar''el, so it came upon Saul (1 Samuel 11:6), who summoned all the coasts of Yashar''el; same Spirit, same summons.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=6 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the Spirit of Yahuah (LORD) came upon Jephthah... unto the children of Ammon* (Judges 11:29) — Spirit-empowered against the SAME enemy, Ammon, that Saul faces when the Spirit comes upon him (1 Samuel 11:6); one continuous pattern of the deliverer.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *The Spirit of Yahuah (Lord) is upon me, because he hath anointed me... recovering of sight to the blind* (Luke 4:18) — the Spirit upon Saul against the threat of the gouged-out eye (1 Samuel 11:6) reaches its term in the true Anointed; the Father''s one Ruach, never a second deity.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-the-spirit-of-elohim-came-upon-saul-the-spirit-empowered-deliverer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) raised up a deliverer... who delivered them* (Judges 3:9) — the cry of besieged Jabesh and the weeping at Gibeah (1 Samuel 11:4) answered as the judge-cycle was; Yahuah saves through the man He raises (1 Samuel 11:13).'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-yahuah-hath-wrought-salvation-in-yashar-el-the-king-who-saves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The king saved us out of the hand of our enemies* (2 Samuel 19:9) — the confession Yashar''el makes of David is first earned by Saul at Jabesh, when *Yahuah hath wrought salvation in Yashar''el* through his hand (1 Samuel 11:13); the throne is given to save.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-yahuah-hath-wrought-salvation-in-yashar-el-the-king-who-saves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *shall there any man be put to death this day in Yashar''el (Israel)? for do not I know that I am this day king over Yashar''el (Israel)?* (2 Samuel 19:22) — David''s mercy the day his kingdom is restored echoes Saul''s *There shall not a man be put to death this day* (1 Samuel 11:13); the day of salvation is the day of mercy, not vengeance.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=19 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-there-shall-not-a-man-be-put-to-death-this-day-mercy-in-the-day-of-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt go down before me to Gilgal... to sacrifice sacrifices of peace offerings* (1 Samuel 10:8) — Gilgal already appointed for the peace offerings; there the kingdom is renewed with those very sacrifices and great rejoicing (1 Samuel 11:15).'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=15
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-renew-the-kingdom-at-gilgal-peace-offerings-and-rejoicing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Behold, I have hearkened unto your voice... and have made a king over you* (1 Samuel 12:1) — Samuel''s word at Gilgal, *renew the kingdom there* (1 Samuel 11:14), is the deed he testifies to next; the throne the people demanded, publicly confirmed before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=11 AND sv.verse_number=14
  JOIN _s340_1sa11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-11-renew-the-kingdom-at-gilgal-peace-offerings-and-rejoicing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_12.sql (1 Samuel 12) -----
-- 1 Samuel 12 — Samuel's farewell / the covenant-lawsuit at the making of the king
-- TAG: 1sa12   VIEW: _s340_1sa12_lookup   SORT BAND: base 36675 step 3 (36675..36690)
-- SOURCE rows all: 'canon','1-samuel',12,v
--
-- 1 Samuel 12 coverage:
--   v.1-5  (whose ox have I taken — the clean-handed judge):
--          NT:     Acts 13:20-22 (the line of judges down to Samuel, then Saul, then David)
--          Extras: Ecclesiasticus (Sirach) 46:19 — 'I have not taken any man's goods, so much as a shoe'
--          Tanakh: 1 Samuel 8:3 (his own sons took bribes — the contrast that forced the king); Psalm 94:21 (condemn innocent blood / the bribed throne 94:20)
--   v.6-11 (the recital of Yahuah's righteous acts — covenant-lawsuit history):
--          NT:     Acts 13:17-21 (Paul's same recital: Egypt, wilderness, judges, then the king)
--          Extras: none warranted (Sirach 46 reserved for the Samuel verses below)
--          Tanakh: Joshua 24:2-13 (Joshua's identical farewell-recital at Shechem); Deuteronomy 31 (the covenant set before the people)
--   v.12-15 (a king demanded though Yahuah was king; fear/serve/obey or the hand against you):
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 8:7 (they have not rejected thee but me, that I should not reign); Deuteronomy 31:16-17 (the covenant breach foreknown)
--   v.16-18 (thunder and rain in wheat harvest — the sign):
--          NT:     none warranted
--          Extras: Ecclesiasticus (Sirach) 46:16-17 — 'Yahuah thundered from heaven... made his voice to be heard'
--          Tanakh: 1 Samuel 7:9-10 (Samuel's lamb + Yahuah's thunder routs the Philistines — the same intercessor, the same thunder)
--   v.19-21,24 (fear not; turn not aside; serve with all your heart; vain things cannot deliver):
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Joshua 24:14 (fear Yahuah, serve in sincerity and truth, put away the strange gods); Deuteronomy 31:6 (fear not... he will not fail nor forsake)
--   v.22 (★★★ ANTI-REPLACEMENT KEYSTONE — Yahuah will NOT forsake his people for his great name's sake):
--          NT:     Romans 11:1-2 (Hath Elohim cast away his people? Elohim forbid... God hath not cast away his people which he foreknew)
--          Extras: none warranted
--          Tanakh: Psalm 94:14 (Yahuah will not cast off his people, neither will he forsake his inheritance); Deuteronomy 31:6 (he will not fail thee nor forsake thee)
--   v.23 (★★ I will teach you the good and the right way + Samuel's ceaseless intercession; Torah-way taught, never abolished):
--          NT:     Romans 11:2 (Elias maketh intercession — the prophet who pleads for Israel)
--          Extras: Ecclesiasticus (Sirach) 46:13-15 (Samuel beloved of Elohim; by the law of Yahuah he judged; a true and faithful prophet)
--          Tanakh: Deuteronomy 31:11-12 (read this law before all Israel that they may learn and fear); Joshua 24:25 (a covenant, a statute and an ordinance set before them)
--
-- THREADS (6):
--   1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge        [extras: Sirach + canon: 1 Sam 8, Acts 13, Psalm 94]
--   1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts     [canon: Joshua 24, Deuteronomy 31, Acts 13]
--   1-samuel-12-they-have-rejected-me-that-i-should-not-reign       [canon: 1 Samuel 8, Deuteronomy 31]
--   1-samuel-12-thunder-and-rain-in-wheat-harvest-the-sign          [extras: Sirach + canon: 1 Samuel 7]
--   1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name     [canon: Romans 11, Psalm 94, Deuteronomy 31] ★★★ keystone
--   1-samuel-12-i-will-teach-you-the-good-and-the-right-way         [extras: Sirach + canon: Romans 11, Deuteronomy 31, Joshua 24]
--
-- Contested/load-bearing framing:
--   v.22 is the anti-replacement spine: read FORWARD it is Romans 11:1-2 verbatim in force — Elohim hath
--     NOT cast away his people; the casting-away is unthinkable BECAUSE of his great Name and his own pleasure,
--     not Israel's merit. The Torah-way Samuel teaches in v.23-24 is never abolished — it is 'the good and the
--     right way' he still teaches AND the truth in which they still serve. Samuel = a type of the Formed
--     Intercessor who ceases not to pray (Romans 11:2 / Hebrews 7:25 frame), but kept here within the canon.

CREATE TEMP VIEW _s340_1sa12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: whose ox have I taken — the clean-handed judge (12:3-5)
    ('canon','1-samuel',12,3,'canon','1-samuel',8,3,'free',
      E'Samuel''s clean-handed challenge — *whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed? or of whose hand have I received any bribe to blind mine eyes therewith?* (1 Samuel 12:3) — is set against the very corruption that forced the king: *And his sons walked not in his ways, but turned aside after lucre, and took bribes, and perverted judgment* (1 Samuel 8:3). The faithful judge takes no bribe; it was the bribe-taking of the next generation, not Samuel''s hand, that drove the people to demand a king.'),
    ('canon','1-samuel',12,3,'apocrypha','ecclesiasticus',46,19,'extras',
      E'The library''s own praise of Samuel echoes this verse: *And before his long sleep he made protestations in the sight of Yahuah (God) and his anointed, I have not taken any man''s goods, so much as a shoe: and no man did accuse him* (Ecclesiasticus 46:19) — the very farewell of *whose ox have I taken... or of whose hand have I received any bribe* (1 Samuel 12:3), remembered down the centuries as the mark of the true judge.'),
    ('canon','1-samuel',12,5,'canon','acts',13,20,'free',
      E'Paul names this same Samuel as the hinge of the judges: *And after that he gave unto them judges about the space of four hundred and fifty years, until Samuel the prophet* (Acts 13:20). Samuel''s witness *that ye have not found ought in my hand* (1 Samuel 12:5) closes the age of the judges; the king he is about to confirm opens the next.'),
    ('canon','1-samuel',12,3,'canon','psalms',94,21,'free',
      E'The bribe Samuel refused — *of whose hand have I received any bribe to blind mine eyes therewith?* (1 Samuel 12:3) — is the very evil the psalmist sets against the righteous: *They gather themselves together against the soul of the righteous, and condemn the innocent blood* (Psalm 94:21), the throne *which frameth mischief by a law* (Psalm 94:20). Samuel''s clean hand is the opposite of the bribed seat that condemns the innocent.'),

    -- Thread 2: that I may reason with you of all the righteous acts (12:6-11)
    ('canon','1-samuel',12,7,'canon','joshua',24,2,'free',
      E'Samuel''s covenant-lawsuit — *that I may reason with you before Yahuah (LORD) of all the righteous acts of Yahuah (LORD), which he did to you and to your fathers* (1 Samuel 12:7) — is the very pattern Joshua used at Shechem a generation before: *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham* (Joshua 24:2). The faithful leader rehearses Yahuah''s saving acts before charging the people to serve him.'),
    ('canon','1-samuel',12,8,'canon','joshua',24,5,'free',
      E'The exodus stands at the centre of Samuel''s recital — *then Yahuah (LORD) sent Moses and Aaron, which brought forth your fathers out of Egypt* (1 Samuel 12:8) — exactly as in Joshua''s: *I sent Moses also and Aaron, and I plagued Egypt, according to that which I did among them: and afterward I brought you out* (Joshua 24:5). One saving history, retold by every covenant-witness.'),
    ('canon','1-samuel',12,6,'canon','acts',13,17,'free',
      E'Paul preaches the same recital in the Pisidian synagogue: *The Elohim (God) of this people of Yashar''el (Israel) chose our fathers, and exalted the people when they dwelt as strangers in the land of Egypt, and with an high arm brought he them out of it* (Acts 13:17) — the very acts Samuel sets before Israel: *It is Yahuah (LORD) that advanced Moses and Aaron, and that brought your fathers up out of the land of Egypt* (1 Samuel 12:6). The covenant-history is one story from the judges to the apostles.'),
    ('canon','1-samuel',12,11,'canon','acts',13,20,'free',
      E'The judges Samuel lists — *And Yahuah (LORD) sent Jerubbaal, and Bedan, and Jephthah, and Samuel, and delivered you out of the hand of your enemies* (1 Samuel 12:11) — are the very deliverers Paul gathers up: *he gave unto them judges about the space of four hundred and fifty years, until Samuel the prophet* (Acts 13:20). Samuel closes his own list with his own name; the apostle closes it the same way.'),

    -- Thread 3: they have rejected me, that I should not reign (12:12-15)
    ('canon','1-samuel',12,12,'canon','1-samuel',8,7,'free',
      E'Samuel exposes the heart of the demand — *ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12) — naming what Yahuah had already told him: *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). The king was not a neutral request; it was the people putting a man on the throne where Yahuah was already King.'),
    ('canon','1-samuel',12,14,'canon','deuteronomy',31,6,'free',
      E'The condition Samuel sets — *If ye will fear Yahuah (LORD), and serve him, and obey his voice, and not rebel against the commandment of Yahuah (LORD)* (1 Samuel 12:14) — is the Torah-charge Moses left: *Be strong and of a good courage, fear not... for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). To fear and obey Yahuah is not a new law for the monarchy; it is the standing covenant under which even the king must walk.'),
    ('canon','1-samuel',12,15,'canon','deuteronomy',31,17,'free',
      E'The warning of v.15 — *But if ye will not obey the voice of Yahuah (LORD), but rebel against the commandment of Yahuah (LORD), then shall the hand of Yahuah (LORD) be against you, as it was against your fathers* (1 Samuel 12:15) — is the covenant-curse Moses foretold: *Then my anger shall be kindled against them in that day, and I will forsake them, and I will hide my face from them* (Deuteronomy 31:17). The curse is the consequence of rebellion, never the Torah itself.'),

    -- Thread 4: thunder and rain in wheat harvest — the sign (12:16-18)
    ('canon','1-samuel',12,17,'canon','1-samuel',7,10,'free',
      E'The thunder Samuel calls down — *I will call unto Yahuah (LORD), and he shall send thunder and rain; that ye may perceive and see that your wickedness is great* (1 Samuel 12:17) — is the same heavenly thunder that answered his prayer at Mizpeh: *but Yahuah (LORD) thundered with a great thunder on that day upon the Philistines, and discomfited them* (1 Samuel 7:10). The same intercessor, the same answering thunder — first to save Israel, now to convict her.'),
    ('canon','1-samuel',12,18,'canon','1-samuel',7,9,'free',
      E'Samuel''s prayer is heard instantly — *So Samuel called unto Yahuah (LORD); and Yahuah (LORD) sent thunder and rain that day* (1 Samuel 12:18) — exactly as at Mizpeh: *And Samuel took a sucking lamb, and offered it for a burnt offering wholly unto Yahuah (LORD): and Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9). The man whose word brings the thunder is the man who has ceased not to pray for the people.'),
    ('canon','1-samuel',12,18,'apocrypha','ecclesiasticus',46,17,'extras',
      E'The library remembers this very thunder: *He called upon the mighty Yahuah (God), when his enemies pressed upon him on every side, when he offered the sucking lamb. And Yahuah (God) thundered from heaven, and with a great noise made his voice to be heard* (Ecclesiasticus 46:16-17) — the heavenly answer to Samuel''s prayer, *and Yahuah (LORD) sent thunder and rain that day: and all the people greatly feared Yahuah (LORD) and Samuel* (1 Samuel 12:18).'),

    -- Thread 5: ★★★ Yahuah will not forsake his people for his great name's sake (12:22)
    ('canon','1-samuel',12,22,'canon','romans',11,1,'free',
      E'This is the anti-replacement spine of the whole canon: *For Yahuah (LORD) will not forsake his people for his great name''s sake: because it hath pleased Yahuah (LORD) to make you his people* (1 Samuel 12:22) — and Paul, a thousand years on, asks and answers the same: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Yahuah does not forsake Yashar''el for his own great Name''s sake; the people he chose, he keeps.'),
    ('canon','1-samuel',12,22,'canon','romans',11,2,'free',
      E'Paul presses it home with the same certainty Samuel gives: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the very ground of *Yahuah (LORD) will not forsake his people for his great name''s sake* (1 Samuel 12:22). The keeping rests on Yahuah''s foreknowing pleasure, not on the people''s worthiness, which is precisely why even after *ye have done all this wickedness* (12:20) he will not let them go.'),
    ('canon','1-samuel',12,22,'canon','psalms',94,14,'free',
      E'The psalmist sings the same promise word for word: *For Yahuah (LORD) will not cast off his people, neither will he forsake his inheritance* (Psalm 94:14) — the very assurance Samuel gives: *For Yahuah (LORD) will not forsake his people for his great name''s sake: because it hath pleased Yahuah (LORD) to make you his people* (1 Samuel 12:22). His inheritance is not cast off; his people are not forsaken.'),
    ('canon','1-samuel',12,22,'canon','deuteronomy',31,6,'free',
      E'The pledge reaches back to Moses: *Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). What Moses promised the nation, Samuel reaffirms at the founding of the kingdom — *Yahuah (LORD) will not forsake his people for his great name''s sake* (1 Samuel 12:22) — one unbroken covenant from the wilderness to the throne.'),

    -- Thread 6: ★★ I will teach you the good and the right way (12:23-24)
    ('canon','1-samuel',12,23,'canon','romans',11,2,'free',
      E'Samuel binds his intercession to a holy obligation — *Moreover as for me, Elohim (God) forbid that I should sin against Yahuah (LORD) in ceasing to pray for you* (1 Samuel 12:23) — the very office Paul names of the prophet who pleads for Israel: *Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel)* (Romans 11:2). The prophet who will not cease to pray stands in the line that runs to the Formed Intercessor who ever liveth to make intercession.'),
    ('canon','1-samuel',12,23,'apocrypha','ecclesiasticus',46,13,'extras',
      E'The library''s memorial of Samuel frames v.23 exactly: *Samuel, the prophet of Yahuah (God), beloved of his Elohim (God)... By the law of Yahuah (God) he judged the congregation* (Ecclesiasticus 46:13-14). Samuel''s promise *I will teach you the good and the right way* (1 Samuel 12:23) is the Torah-way — *by the law of Yahuah he judged* — taught, never abolished.'),
    ('canon','1-samuel',12,23,'canon','deuteronomy',31,12,'free',
      E'The *good and the right way* Samuel will teach (1 Samuel 12:23) is the Torah Moses commanded be read to the whole nation: *Gather the people together, men, and women, and children... that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12). The way taught is the law learned and kept.'),
    ('canon','1-samuel',12,24,'canon','joshua',24,14,'free',
      E'Samuel''s closing charge — *Only fear Yahuah (LORD), and serve him in truth with all your heart: for consider how great things he hath done for you* (1 Samuel 12:24) — is the very word with which Joshua sealed his own farewell: *Now therefore fear Yahuah (LORD), and serve him in sincerity and in truth... and serve ye Yahuah (LORD)* (Joshua 24:14). To fear Yahuah and serve him in truth is the single, standing demand of the covenant from Shechem to the throne.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge',
  E'Whose Ox Have I Taken — the Clean-Handed Judge',
  E'Samuel sets his whole record before Yahuah and his anointed and asks the people to convict him if they can: *whose ox have I taken? or whose ass have I taken? or whom have I defrauded? whom have I oppressed? or of whose hand have I received any bribe to blind mine eyes therewith? and I will restore it you* (1 Samuel 12:3). They answer, *Thou hast not defrauded us, nor oppressed us, neither hast thou taken ought of any man''s hand* (12:4), and he seals it: *Yahuah (LORD) is witness against you, and his anointed is witness this day, that ye have not found ought in my hand* (12:5).\n\nThe contrast is sharp and deliberate. It was not Samuel''s hand but his sons'' that forced the king: *And his sons walked not in his ways, but turned aside after lucre, and took bribes, and perverted judgment* (1 Samuel 8:3). The bribe Samuel refused is the very evil the psalmist sets against the righteous — the throne *which frameth mischief by a law* and they that *condemn the innocent blood* (Psalm 94:20-21). And the restored library remembers him by this very mark: *I have not taken any man''s goods, so much as a shoe: and no man did accuse him* (Ecclesiasticus 46:19). Paul gathers the whole age into one line: *he gave unto them judges about the space of four hundred and fifty years, until Samuel the prophet* (Acts 13:20). The clean-handed judge closes the era; the king opens the next.',
  sv.verse_id, ev.verse_id, 'extras', 36675
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts',
  E'That I May Reason With You — the Recital of Yahuah''s Righteous Acts',
  E'Before he confirms the king, Samuel holds the covenant-lawsuit: *Now therefore stand still, that I may reason with you before Yahuah (LORD) of all the righteous acts of Yahuah (LORD), which he did to you and to your fathers* (1 Samuel 12:7). He rehearses the saving history — *It is Yahuah (LORD) that advanced Moses and Aaron, and that brought your fathers up out of the land of Egypt* (12:6), the cry in Egypt and the deliverance through *Moses and Aaron* (12:8), the cycle of forgetting and crying out and the judges *Jerubbaal, and Bedan, and Jephthah, and Samuel* (12:11).\n\nThis is the same pattern Joshua used at Shechem a generation before, opening with the fathers — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham* (Joshua 24:2) — and centring on the exodus: *I sent Moses also and Aaron, and I plagued Egypt... and afterward I brought you out* (Joshua 24:5). It is the very recital Paul preaches in the synagogue at Antioch in Pisidia: *The Elohim (God) of this people of Yashar''el (Israel) chose our fathers, and exalted the people when they dwelt as strangers in the land of Egypt, and with an high arm brought he them out of it* (Acts 13:17), down through *judges... until Samuel the prophet* (Acts 13:20). One saving history, retold by Joshua, by Samuel, by the apostle — the unbroken testimony of what Yahuah did for his people.',
  sv.verse_id, ev.verse_id, 'free', 36678
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-they-have-rejected-me-that-i-should-not-reign',
  E'When Yahuah Was Your King — They Have Rejected Me',
  E'Samuel names the demand for what it was: *And when ye saw that Nahash the king of the children of Ammon came against you, ye said unto me, Nay; but a king shall reign over us: when Yahuah Elohaychem (the LORD your God) was your king* (1 Samuel 12:12). This is the verdict Yahuah had already given him: *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). The king was not a neutral request; it set a man on the throne where Yahuah was already King.\n\nYet the covenant is not torn up. Samuel sets the same condition over the new monarchy that has always stood: *If ye will fear Yahuah (LORD), and serve him, and obey his voice, and not rebel against the commandment of Yahuah (LORD), then shall both ye and also the king that reigneth over you continue following Yahuah Elohaychem (the LORD your God)* (12:14) — the Torah-charge Moses left, *fear not... he will not fail thee, nor forsake thee* (Deuteronomy 31:6). And the warning is the covenant-curse Moses foretold: *then shall the hand of Yahuah (LORD) be against you, as it was against your fathers* (12:15), even as *I will forsake them, and I will hide my face from them* (Deuteronomy 31:17). The hand against them is the consequence of rebellion — never the Torah itself, which remains the very way of life set before king and people alike.',
  sv.verse_id, ev.verse_id, 'free', 36681
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-thunder-and-rain-in-wheat-harvest-the-sign',
  E'Thunder and Rain in Wheat Harvest — the Sign',
  E'Samuel seals the lawsuit with a sign out of season: *Is it not wheat harvest to day? I will call unto Yahuah (LORD), and he shall send thunder and rain; that ye may perceive and see that your wickedness is great, which ye have done in the sight of Yahuah (LORD), in asking you a king* (1 Samuel 12:17). At harvest the sky is dry; thunder and rain then are no accident but Yahuah''s own answer to his prophet. *So Samuel called unto Yahuah (LORD); and Yahuah (LORD) sent thunder and rain that day: and all the people greatly feared Yahuah (LORD) and Samuel* (12:18).\n\nIt is the same heavenly thunder that answered him at Mizpeh, when his lamb and his cry routed the Philistines — *And Samuel took a sucking lamb, and offered it for a burnt offering wholly unto Yahuah (LORD): and Samuel cried unto Yahuah (LORD) for Yashar''el (Israel); and Yahuah (LORD) heard him* (1 Samuel 7:9), and *Yahuah (LORD) thundered with a great thunder on that day upon the Philistines, and discomfited them* (1 Samuel 7:10). The restored library remembers this very thunder: *He called upon the mighty Yahuah (God)... when he offered the sucking lamb. And Yahuah (God) thundered from heaven, and with a great noise made his voice to be heard* (Ecclesiasticus 46:16-17). The same intercessor, the same answering thunder — first to save Israel, now to bring her to fear.',
  sv.verse_id, ev.verse_id, 'extras', 36684
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name',
  E'Yahuah Will Not Forsake His People for His Great Name''s Sake',
  E'After the thunder the people cry out in terror — *Pray for thy servants unto Yahuah Elohayka (the LORD thy God), that we die not* (1 Samuel 12:19) — and Samuel answers with the great anti-replacement word of the whole canon. *Fear not: ye have done all this wickedness: yet turn not aside from following Yahuah (LORD), but serve Yahuah (LORD) with all your heart* (12:20), *for Yahuah (LORD) will not forsake his people for his great name''s sake: because it hath pleased Yahuah (LORD) to make you his people* (1 Samuel 12:22). The keeping rests not on the people''s worthiness — they had just sinned grievously — but on Yahuah''s own great Name and his own pleasure.\n\nThis is exactly Paul''s answer a thousand years on: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1), *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). It is the psalmist''s song word for word: *For Yahuah (LORD) will not cast off his people, neither will he forsake his inheritance* (Psalm 94:14). And it reaches back to Moses: *he will not fail thee, nor forsake thee* (Deuteronomy 31:6). Yahuah does not unmake the people he chose; Yashar''el is not replaced, not cast off, not exchanged for another — kept for his Name''s sake from the wilderness, through the throne, to the apostle.',
  sv.verse_id, ev.verse_id, 'free', 36687
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-12-i-will-teach-you-the-good-and-the-right-way',
  E'I Will Teach You the Good and the Right Way — Ceaseless Intercession',
  E'Samuel will not lay down either office Yahuah gave him. He binds his prayer to a holy obligation: *Moreover as for me, Elohim (God) forbid that I should sin against Yahuah (LORD) in ceasing to pray for you* (1 Samuel 12:23) — and to that he joins the teaching of the way: *but I will teach you the good and the right way: Only fear Yahuah (LORD), and serve him in truth with all your heart: for consider how great things he hath done for you* (12:23-24). The prophet who will not cease to intercede is the same prophet who keeps teaching the Torah-way.\n\nThe office of the praying prophet is the very one Paul names: *Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God)* (Romans 11:2) — the line that runs forward to the Formed Intercessor who ever liveth to plead for his people. And *the good and the right way* is no new law: the library remembers that *Samuel, the prophet of Yahuah (God), beloved of his Elohim (God)... by the law of Yahuah (God) he judged the congregation* (Ecclesiasticus 46:13-14); it is the Torah Moses commanded be read to all the people *that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12). And it is the single, standing demand with which Joshua too sealed his farewell: *Now therefore fear Yahuah (LORD), and serve him in sincerity and in truth... and serve ye Yahuah (LORD)* (Joshua 24:14). The way is taught, learned, and kept — never abolished.',
  sv.verse_id, ev.verse_id, 'extras', 36690
  FROM _s340_1sa12_lookup sv, _s340_1sa12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 8:3 — *his sons... took bribes, and perverted judgment*: the corruption Samuel''s clean hand stands against.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ecclesiasticus 46:19 — *I have not taken any man''s goods, so much as a shoe*: the library''s memorial of Samuel''s clean hands.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 13:20 — *judges... until Samuel the prophet*: Samuel''s clean witness closes the age of the judges.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 94:21 — *condemn the innocent blood*: the bribed throne that frames mischief by a law, the opposite of Samuel''s seat.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-whose-ox-have-i-taken-the-clean-handed-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood*: Joshua''s farewell-recital, the same covenant-lawsuit pattern.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 24:5 — *I sent Moses also and Aaron, and I plagued Egypt*: the exodus at the centre of every covenant-recital.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 13:17 — *exalted the people... in the land of Egypt, and with an high arm brought he them out*: Paul preaches the same saving history.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=6
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 13:20 — *judges... until Samuel the prophet*: the apostle closes the list of deliverers with Samuel, as Samuel does himself.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-may-reason-with-you-of-all-the-righteous-acts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 8:7 — *they have rejected me, that I should not reign over them*: the verdict beneath the demand for a king.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=12
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-they-have-rejected-me-that-i-should-not-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 31:6 — *he will not fail thee, nor forsake thee*: the standing Torah-charge under which even the king must walk.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-they-have-rejected-me-that-i-should-not-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 31:17 — *I will forsake them, and I will hide my face from them*: the covenant-curse of rebellion, never the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=15
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-they-have-rejected-me-that-i-should-not-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 7:10 — *Yahuah thundered with a great thunder... upon the Philistines*: the same answering thunder, first to save Israel.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=17
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-thunder-and-rain-in-wheat-harvest-the-sign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 7:9 — *Samuel cried unto Yahuah for Yashar''el; and Yahuah heard him*: the intercessor whose prayer brings the thunder down.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-thunder-and-rain-in-wheat-harvest-the-sign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ecclesiasticus 46:17 — *Yahuah thundered from heaven... made his voice to be heard*: the library remembers Samuel''s very thunder.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-thunder-and-rain-in-wheat-harvest-the-sign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 (★★★ keystone)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 11:1 — *Hath Elohim cast away his people? Elohim forbid*: Paul''s answer is Samuel''s, a thousand years on.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 11:2 — *Elohim hath not cast away his people which he foreknew*: kept by foreknowing pleasure, not by worthiness.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 94:14 — *Yahuah will not cast off his people, neither will he forsake his inheritance*: the same promise, word for word.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 31:6 — *he will not fail thee, nor forsake thee*: the pledge that reaches back to Moses.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=22
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-yahuah-will-not-forsake-his-people-for-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 11:2 — *Elias... maketh intercession to Elohim*: the office of the praying prophet Samuel will not lay down.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-will-teach-you-the-good-and-the-right-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ecclesiasticus 46:13 — *Samuel... beloved of his Elohim... by the law of Yahuah he judged*: the good and right way is the Torah-way.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=46 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-will-teach-you-the-good-and-the-right-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 31:12 — *learn... and observe to do all the words of this law*: the Torah read to all the people, the way taught and kept.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-will-teach-you-the-good-and-the-right-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Joshua 24:14 — *fear Yahuah, and serve him in sincerity and in truth*: the single standing demand sealing Joshua''s farewell too.'
  FROM cross_reference_threads t
  JOIN _s340_1sa12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s340_1sa12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-12-i-will-teach-you-the-good-and-the-right-way'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_13.sql (1 Samuel 13) -----
--
-- 1 Samuel 13 — Saul presumes at Gilgal; the kingdom not established; the FIRST pointer to
--   David, a man after Yahuah's own heart. Tag 1sa13. Sort band base 36700, step 3.
--
-- FRAMEWORK: Saul tarries the appointed seven days but the people scatter and Samuel delays;
--   he forces himself and offers the burnt offering that was not his to offer (13:8-12) —
--   presumption usurping what Yahuah commanded, the very pattern Uzziah will repeat (2 Chr 26)
--   and the thing Samuel will name plainly at the Amalek failure: to OBEY is better than
--   sacrifice (1 Sam 15:22). The verdict (13:13-14): *thou hast not kept the commandment of
--   Yahuah Elohayka* — Torah-obedient kingship is the throne's condition, not flesh; so the
--   kingdom shall not continue in Saul, and *Yahuah hath sought him a man after his own heart*
--   — the FIRST canon pointer to David, the Davidic-covenant seed line, quoted forward by Paul
--   (Acts 13:22) and sung in the oath-covenant of Psalm 89, chosen by the heart not the stature
--   (1 Sam 16:7). The Philistine oppression: no smith, no sword in Yashar'el (13:19-22).
--
-- 1 Samuel 13 coverage:
--   v.8-12  NT:     none warranted (presumption motif weaves Tanakh-laterally + verdict to Acts)
--           Extras: none warranted
--           Tanakh: 2 Chronicles 26:16-21 (Uzziah burns incense, presumes priestly act → leprous);
--                   1 Samuel 15:22 (to obey is better than sacrifice)
--   v.13    NT:     none warranted
--           Extras: none warranted
--           Tanakh: 1 Kings 11:11 (Solomon: kept not my covenant → I will rend the kingdom);
--                   1 Samuel 15:22-23 (rejected the word of Yahuah → rejected from being king)
--   v.14    NT:     Acts 13:22 (David... a man after mine own heart, shall fulfil all my will)
--           Extras: none warranted
--           Tanakh: 1 Samuel 16:7 (Yahuah looketh on the heart); 1 Samuel 16:13 (Spirit came on
--                   David); Psalm 89:3-4,20 (covenant sworn to David my servant; thy seed for ever)
--   v.19-22 NT:     none warranted
--           Extras: none warranted
--           Tanakh: none warranted (oppression-detail; framed in prose within the heart-thread? no —
--                   kept as its own thread, no external add warranted, recorded below)
--
-- THREADS (4):
--   1-samuel-13-saul-forced-himself-and-offered-the-burnt-offering   [Tanakh] presumption vs obedience
--        members: 2chr26:18 (Uzziah trespass), 2chr26:19 (leprosy rose), 1sa15:22 (obey>sacrifice)
--   1-samuel-13-thou-hast-not-kept-the-commandment-thy-kingdom-shall-not-continue  [Tanakh] Torah-kingship/throne-condition
--        members: 1ki11:11 (kept not my covenant → rend kingdom), 1sa15:23 (rejected word → rejected king)
--   1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart      [Tanakh+NT] the David/Davidic-seed pointer
--        members: acts13:22 (a man after mine own heart), 1sa16:7 (looketh on the heart),
--                 1sa16:13 (Spirit came on David), ps89:3 (covenant with David), ps89:20 (found David my servant)
--   1-samuel-13-no-smith-found-throughout-all-the-land-of-yasharel    [Tanakh] Philistine oppression / disarmed Israel
--        members: (no external add warranted — single-verse motif; thread carries the chapter detail)
--   NOTE: thread #4 would be a member-less thread → DROPPED. The Philistine-oppression detail is
--         instead woven into the prose where it sets the strait that pressured Saul; no smith/sword
--         verse warrants a curated cross-library member, so per the brief (3-8 curated threads,
--         "none warranted" valid) it is NOT given a standalone empty thread. 3 threads result.
--
-- THREE THREADS, 9 cross_reference rows, 9 member rows.

CREATE TEMP VIEW _s340_1sa13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Saul forced himself and offered the burnt offering — presumption vs obedience
    ('canon','1-samuel',13,9,'canon','2-chronicles',26,18,'free',
      E'*And they withstood Uzziah the king, and said unto him, It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron, that are consecrated to burn incense: go out of the sanctuary; for thou hast trespassed* (2 Chronicles 26:18). Saul ''*forced himself therefore, and offered a burnt offering*'' (1 Samuel 13:12) — the same presumption: a king laying hold of what Yahuah did not give him to do. The throne is not a license to seize the altar; the priest''s office and the prophet''s set time were Yahuah''s order, and Saul overstepped it as Uzziah would.'),
    ('canon','1-samuel',13,9,'canon','2-chronicles',26,19,'free',
      E'*Then Uzziah was wroth, and had a censer in his hand to burn incense: and while he was wroth with the priests, the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar* (2 Chronicles 26:19). Where Saul ''*offered the burnt offering*'' he was not commanded to offer (1 Samuel 13:9), Uzziah''s grasping at the censer brought leprosy in the very act — the presumption of office, struck at the altar. Both kings learn the kingdom is held by obedience, not by seizing the sacred.'),
    ('canon','1-samuel',13,12,'canon','1-samuel',15,22,'free',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Saul''s plea — ''*I forced myself therefore, and offered a burnt offering*'' (1 Samuel 13:12) — already meets its answer: the burnt offering he reached for cannot stand in for the obedience he withheld. The verse Samuel will speak at Amalek is the verdict over Gilgal too.'),
    -- Thread 2: Thou hast not kept the commandment — thy kingdom shall not continue (Torah-kingship)
    ('canon','1-samuel',13,13,'canon','1-kings',11,11,'free',
      E'*Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). The same sentence falls on Saul: ''*thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God)... now would Yahuah have established thy kingdom upon Yashar''el for ever*'' (1 Samuel 13:13). The throne is conditioned on keeping the covenant-word — the Torah is the king''s charter, never a curse; break it and the kingdom is rent, whether from Saul or from Solomon.'),
    ('canon','1-samuel',13,13,'canon','1-samuel',15,23,'free',
      E'*For rebellion is as the sin of witchcraft, and stubbornness is as iniquity and idolatry. Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). Samuel''s charge at Gilgal — ''*thou hast not kept the commandment of Yahuah*'' (1 Samuel 13:13) — is the first stroke; the rejection of the word that unseats Saul is the same disobedience named outright at the Amalek failure. Not flesh nor crown but keeping Yahuah''s word holds the kingdom.'),
    -- Thread 3: Yahuah hath sought him a man after his own heart — the David / Davidic-seed pointer
    ('canon','1-samuel',13,14,'canon','acts',13,22,'free',
      E'*And when he had removed him, he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). Paul, preaching in the synagogue, quotes Samuel''s word at Gilgal forward: ''*Yahuah hath sought him a man after his own heart*'' (1 Samuel 13:14) is the FIRST pointer to David, and through David''s seed to the Saviour (Acts 13:23). The man-after-Yahuah''s-heart is the Torah-obedient king, the line the covenant runs through.'),
    ('canon','1-samuel',13,14,'canon','1-samuel',16,7,'free',
      E'*But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah seeth not as man seeth; for man looketh on the outward appearance, but Yahuah looketh on the heart* (1 Samuel 16:7). What ''*a man after his own heart*'' (1 Samuel 13:14) means is unfolded three chapters on: Saul stood head and shoulders above the people in stature, but the chosen king is weighed by the heart Yahuah sees, not the frame man sees.'),
    ('canon','1-samuel',13,14,'canon','1-samuel',16,13,'free',
      E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward. So Samuel rose up, and went to Ramah* (1 Samuel 16:13). The man Yahuah ''*sought*'' (1 Samuel 13:14) is found and anointed: the oil poured and the Spirit resting on David is the heart-king the verdict at Gilgal first announced — the throne now established in the seed Yahuah chose.'),
    ('canon','1-samuel',13,14,'canon','psalms',89,3,'free',
      E'*I have made a covenant with my chosen, I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations. Selah* (Psalm 89:3-4). The kingdom that ''*shall not continue*'' in Saul (1 Samuel 13:14) is sworn for ever to David: the man-after-Yahuah''s-heart becomes the covenant head whose seed and throne are established to all generations — the Davidic-seed promise that carries to the Branch.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-13-saul-forced-himself-and-offered-the-burnt-offering',
       E'Saul forced himself and offered the burnt offering — presumption is not worship',
       E'The set time held: seven days, *according to the set time that Samuel had appointed* (1 Samuel 13:8). But the people scattered, Samuel delayed, and the Philistines massed; so Saul reached for what was not his — *And Saul said, Bring hither a burnt offering to me, and peace offerings. And he offered the burnt offering* (1 Samuel 13:9), confessing, *I forced myself therefore, and offered a burnt offering* (1 Samuel 13:12). This is the king seizing the altar under pressure, the same presumption Uzziah will repeat: *they withstood Uzziah the king, and said unto him, It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron... go out of the sanctuary; for thou hast trespassed* (2 Chronicles 26:18), and *the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar* (2 Chronicles 26:19) — struck in the very act of grasping the sacred. The verdict is one Samuel will speak plainly at Amalek: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). A forced offering cannot stand in for the obedience withheld; the throne is held by hearkening, never by seizing the holy.',
       sv.verse_id, ev.verse_id, 'free', 36700
  FROM _s340_1sa13_lookup sv, _s340_1sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=13 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-13-thou-hast-not-kept-the-commandment-thy-kingdom-shall-not-continue',
       E'Thou hast not kept the commandment — thy kingdom shall not continue',
       E'Samuel''s sentence names the one thing that loses a throne: *And Samuel said to Saul, Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God), which he commanded thee: for now would Yahuah (LORD) have established thy kingdom upon Yashar''el (Israel) for ever* (1 Samuel 13:13). The kingship is conditioned on keeping the covenant-word — the Torah is the king''s charter, the inheritance, never the curse. The same verdict falls on Solomon: *Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). And the rejection is named outright when Saul fails again at Amalek: *Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). Not stature, not the crown already on his head, but keeping Yahuah''s word holds Yashar''el''s throne — break it and the kingdom is rent.',
       sv.verse_id, ev.verse_id, 'free', 36703
  FROM _s340_1sa13_lookup sv, _s340_1sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart',
       E'Yahuah hath sought him a man after his own heart — the first pointer to David',
       E'In the very breath that unseats Saul''s dynasty, the Davidic line is foretold: *But now thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah hath commanded him to be captain over his people, because thou hast not kept that which Yahuah commanded thee* (1 Samuel 13:14). This is the FIRST pointer to David — the throne to be established not in Saul''s flesh but in the man Yahuah chooses by the heart. Paul reads it forward in the synagogue: *I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22), and through David''s seed the Saviour comes (Acts 13:23). What the heart-standard means is unfolded at the anointing: *Yahuah seeth not as man seeth; for man looketh on the outward appearance, but Yahuah looketh on the heart* (1 Samuel 16:7) — Saul stood head and shoulders above the people, but the chosen king is weighed by the heart, then *Samuel took the horn of oil, and anointed him... and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). And the man Yahuah sought becomes the covenant head: *I have made a covenant with my chosen, I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:3-4). The man-after-Yahuah''s-heart is the Torah-obedient king, the seed line the promise runs through to the Branch.',
       sv.verse_id, ev.verse_id, 'free', 36706
  FROM _s340_1sa13_lookup sv, _s340_1sa13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Members thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 26:18 — *It appertaineth not unto thee... thou hast trespassed*: Uzziah, like Saul, a king seizing the altar he was not given to touch.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-saul-forced-himself-and-offered-the-burnt-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 26:19 — *the leprosy even rose up in his forehead... from beside the incense altar*: presumption of office struck in the very act.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-saul-forced-himself-and-offered-the-burnt-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 15:22 — *to obey is better than sacrifice*: the verdict over Gilgal, spoken plainly at Amalek; a forced offering cannot cover withheld obedience.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-saul-forced-himself-and-offered-the-burnt-offering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 11:11 — *thou hast not kept my covenant and my statutes... I will surely rend the kingdom from thee*: the same throne-condition, the same sentence, falling on Solomon.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-thou-hast-not-kept-the-commandment-thy-kingdom-shall-not-continue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 15:23 — *thou hast rejected the word of Yahuah, he hath also rejected thee from being king*: the disobedience at Gilgal named outright, the throne lost for not keeping the word.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-thou-hast-not-kept-the-commandment-thy-kingdom-shall-not-continue'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Acts 13:22 — *I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will*: Paul quotes Gilgal''s word forward as the first pointer to David and his seed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 16:7 — *Yahuah looketh on the heart*: what a man-after-Yahuah''s-heart means; the king weighed by the heart, not the stature Saul had.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 16:13 — *the Spirit of Yahuah came upon David from that day forward*: the man Yahuah sought is found and anointed, the throne established in the chosen seed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 89:3-4 — *I have sworn unto David my servant, Thy seed will I establish for ever*: the man-after-Yahuah''s-heart becomes the covenant head whose seed and throne are sworn to all generations.'
  FROM cross_reference_threads t
  JOIN _s340_1sa13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s340_1sa13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-13-yahuah-hath-sought-him-a-man-after-his-own-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_14.sql (1 Samuel 14) -----
--
-- Book/chapter: 1 Samuel 14    Tag: 1sa14    View: _s340_1sa14_lookup
-- Sort band: base 36725, step 3  ->  36725, 36728, 36731
--
-- 1 Samuel 14 coverage:
--   v.6  (no restraint to Yahuah to save by many or by few)
--        NT:     Hebrews 11:34 (out of weakness made strong, turned to flight the armies of the aliens) -> THREAD 1
--        Extras: none warranted
--        Tanakh: Judges 7:2,7 (Gideon's 300); Zechariah 4:6 (not by might, nor by power, but by my spirit);
--                2 Chronicles 14:11 (it is nothing with thee to help, whether with many, or with them that have
--                no power); 1 Samuel 17:47 (Yahuah saveth not with sword and spear) -> THREAD 1
--   v.12 (Yahuah hath delivered them into the hand of Yashar'el) -> THREAD 1 (faith of the climb)
--   v.13-15 (Jonathan climbs, they fell before him, the earth quaked, very great trembling) -> THREAD 1 source
--   v.23 (So Yahuah saved Yashar'el that day) -> THREAD 1 source anchor-end
--        NT/Extras/Tanakh as v.6
--   v.24 (Saul's rash oath: Cursed be the man that eateth any food until evening) -> THREAD 3 source
--        NT:     none warranted (the people's rescue echoes forward only thematically)
--        Extras: none warranted
--        Tanakh: Judges 11:35 (Jephthah's rash vow: I have opened my mouth unto Yahuah, and I cannot go back) -> THREAD 3
--   v.27,29 (Jonathan tastes honey, eyes enlightened; My father hath troubled the land) -> THREAD 3 source
--   v.32-34 (people eat with the blood; ye have transgressed; sin not against Yahuah in eating with the blood) -> THREAD 2 source
--        NT:     Acts 15:20, 15:29 (abstain from blood / from things strangled) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Genesis 9:4 (flesh with the life thereof, which is the blood thereof, shall ye not eat);
--                Leviticus 7:26 (ye shall eat no manner of blood); Leviticus 17:10-11 (I will set my face against
--                that soul that eateth blood; for the life of the flesh is in the blood); Deuteronomy 12:23
--                (the blood is the life; thou mayest not eat the life with the flesh) -> THREAD 2
--   v.35 (Saul built an altar unto Yahuah) -> THREAD 2 anchor-end
--   v.45 (Shall Jonathan die, who hath wrought this great salvation? the people rescued Jonathan) -> THREAD 3 source anchor-end
--   v.47-52 (Saul's wars, house of Saul) -> narrative epilogue; none warranted
--
-- THREADS:
--   1sa14-no-restraint-to-yahuah-to-save-by-many-or-by-few  (free) -> Tanakh (Judges, Zechariah, 2 Chron, 1 Sam) + NT (Hebrews)
--   1sa14-they-did-eat-with-the-blood-and-saul-built-an-altar (free) -> Tanakh (Genesis, Leviticus x2, Deut) + NT (Acts)
--   1sa14-the-rash-oath-troubled-the-land-the-people-rescued-the-saviour (free) -> Tanakh (Judges)
--
-- Framework-load-bearing framing:
--   * 14:6 keystone — salvation is Yahuah's, never the arm of flesh; few-not-many is the canon's recurring grammar
--     (Gideon's 300, Zerubbabel's "not by might", Asa's "nothing with thee to help", David vs the uncircumcised),
--     and Hebrews 11 reads these very deliverers as faith. Forward weave, NOT replacement.
--   * 14:32-34 — the blood-prohibition is Torah from Noah (Gen 9), through Leviticus and Deuteronomy, STILL binding
--     in Acts 15 upon the gathered nations; Torah affirmed, never abolished.
--   * 14:24,45 — Saul's man-made oath (NOT a Torah command) troubles the land and would have slain the innocent
--     deliverer; the people deliver Jonathan. Jephthah's parallel rash vow shows the harm of the unconsidered word.

CREATE TEMP VIEW _s340_1sa14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: no restraint to save by many or by few
    ('canon','1-samuel',14,6,'canon','judges',7,2,'free',
      E'*And Yahuah (LORD) said unto Gideon, The people that are with thee are too many for me to give the Midianites into their hands, lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (Judges 7:2). Jonathan''s creed — *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) — is the very thing Yahuah engineered with Gideon: thin the host so the deliverance is unmistakably His, not the arm of flesh.'),
    ('canon','1-samuel',14,6,'canon','judges',7,7,'free',
      E'*And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place* (Judges 7:7). Three hundred against a host *like grasshoppers for multitude* answers *to save by many or by few* (1 Samuel 14:6) — two men against a garrison, three hundred against an army: the number is nothing to Yahuah.'),
    ('canon','1-samuel',14,6,'canon','zechariah',4,6,'free',
      E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Jonathan''s *no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) is the same word in arms that Zechariah hears in building — the work and the war alike are won by Yahuah''s Spirit, not by human strength.'),
    ('canon','1-samuel',14,6,'canon','2-chronicles',14,11,'free',
      E'*And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee* (2 Chronicles 14:11). Asa of Yahudah (Judah) prays Jonathan''s confession back to Yahuah — *no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6); the same trust runs both houses.'),
    ('canon','1-samuel',14,6,'canon','1-samuel',17,47,'free',
      E'*And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is Yahuah''s (LORD''S), and he will give you into our hands* (1 Samuel 17:47). What Jonathan ventures against the garrison — *no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) — David preaches to Goliath: the deliverance belongs to Yahuah, who needs neither numbers nor weapons.'),
    ('canon','1-samuel',14,6,'canon','hebrews',11,34,'free',
      E'*Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). The roll of faith reads exactly these deliverances — *out of weakness were made strong* is the two men climbing on hands and feet (1 Samuel 14:13); *no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) is what faith looks like in battle.'),
    ('canon','1-samuel',14,12,'canon','1-samuel',17,47,'free',
      E'*And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is Yahuah''s (LORD''S)* (1 Samuel 17:47). Jonathan reads the Philistines'' taunt as Yahuah''s own sign — *Come up after me: for Yahuah (LORD) hath delivered them into the hand of Yashar''el (Israel)* (1 Samuel 14:12) — the same certainty David carries into the valley.'),
    ('canon','1-samuel',14,23,'canon','judges',7,7,'free',
      E'*And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you* (Judges 7:7). The chapter''s verdict — *So Yahuah (LORD) saved Yashar''el (Israel) that day* (1 Samuel 14:23) — is Gideon''s verdict again: when the few go up, it is Yahuah who saves, and the credit is His.'),

    -- THREAD 2: they did eat with the blood; Saul built an altar
    ('canon','1-samuel',14,32,'canon','genesis',9,4,'free',
      E'*But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4). The people *did eat them with the blood* (1 Samuel 14:32) — breaking the oldest standing command, given to Noah for all flesh long before Sinai; the prohibition of blood is not a ceremony but the reverence of life itself.'),
    ('canon','1-samuel',14,32,'canon','leviticus',17,11,'free',
      E'*For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul* (Leviticus 17:11). When the famished people *did eat them with the blood* (1 Samuel 14:32) they seized the very thing Yahuah reserved to Himself — the life, the means of atonement — and so *the people sin against Yahuah (LORD)* (1 Samuel 14:33).'),
    ('canon','1-samuel',14,33,'canon','leviticus',7,26,'free',
      E'*Moreover ye shall eat no manner of blood, whether it be of fowl or of beast, in any of your dwellings* (Leviticus 7:26). The cry *Behold, the people sin against Yahuah (LORD), in that they eat with the blood* (1 Samuel 14:33) names the exact statute transgressed; Saul''s rebuke, *Ye have transgressed*, is Torah enforced, not abolished.'),
    ('canon','1-samuel',14,33,'canon','leviticus',17,10,'free',
      E'*And whatsoever man there be of the house of Yashar''el (Israel)... that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people* (Leviticus 17:10). The gravity behind *the people sin against Yahuah (LORD), in that they eat with the blood* (1 Samuel 14:33) is this: eating blood sets Yahuah''s own face against the eater.'),
    ('canon','1-samuel',14,34,'canon','deuteronomy',12,23,'free',
      E'*Only be sure that thou eat not the blood: for the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23). Saul''s remedy — *slay them here, and eat; and sin not against Yahuah (LORD) in eating with the blood* (1 Samuel 14:34) — is simply obedience to this command: drain the blood, for the life is not man''s to consume.'),
    ('canon','1-samuel',14,34,'canon','acts',15,20,'free',
      E'*But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood* (Acts 15:20). The same command Saul presses on the people — *sin not against Yahuah (LORD) in eating with the blood* (1 Samuel 14:34) — the apostles lay on the gathered nations centuries later; the blood-prohibition stands unbroken from Noah through Acts.'),
    ('canon','1-samuel',14,34,'canon','acts',15,29,'free',
      E'*That ye abstain from meats offered to idols, and from blood, and from things strangled, and from fornication: from which if ye keep yourselves, ye shall do well* (Acts 15:29). What Saul commands — *and eat; and sin not against Yahuah (LORD) in eating with the blood* (1 Samuel 14:34) — Yaaqob (James) and the elders re-issue as binding; Torah on blood was never repealed.'),

    -- THREAD 3: the rash oath troubled the land; the people rescued the saviour
    ('canon','1-samuel',14,24,'canon','judges',11,35,'free',
      E'*And it came to pass, when he saw her... Alas, my daughter! thou hast brought me very low... for I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35). Saul''s self-imposed curse — *Cursed be the man that eateth any food until evening* (1 Samuel 14:24) — is Jephthah''s tragedy in another key: the rash word, never commanded by Yahuah, recoils upon the speaker''s own household.'),
    ('canon','1-samuel',14,29,'canon','judges',11,35,'free',
      E'*for I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35). Jonathan''s plain verdict — *My father hath troubled the land* (1 Samuel 14:29) — is what Jephthah''s vow proves: an oath spoken without Torah''s wisdom does not bind Yahuah, it only afflicts the innocent.'),
    ('canon','1-samuel',14,45,'canon','judges',7,7,'free',
      E'*And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand* (Judges 7:7). The people plead, *Shall Jonathan die, who hath wrought this great salvation in Yashar''el (Israel)?* (1 Samuel 14:45) — they recognise in Jonathan the deliverer Yahuah used, as Gideon was used; a man through whom Yahuah saved is not to be slain by a man''s rash oath.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few', E'No restraint to Yahuah to save by many or by few', E'Jonathan and his armourbearer climb alone against the Philistine garrison on his confession: *Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). He reads the enemy''s taunt as Yahuah''s sign — *Come up after me: for Yahuah (LORD) hath delivered them into the hand of Yashar''el (Israel)* (1 Samuel 14:12) — and two men with a quaking earth rout a host: *So Yahuah (LORD) saved Yashar''el (Israel) that day* (1 Samuel 14:23).\n\nThis is the canon''s recurring grammar of deliverance. Yahuah thins Gideon''s army on purpose — *The people that are with thee are too many for me... lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (Judges 7:2) — until *By the three hundred men that lapped will I save you* (Judges 7:7). Zechariah hears the same word over the rebuilding: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Asa of Yahudah (Judah) prays it back: *it is nothing with thee to help, whether with many, or with them that have no power* (2 Chronicles 14:11). David preaches it to Goliath: *Yahuah (LORD) saveth not with sword and spear* (1 Samuel 17:47). And Hebrews reads all these deliverers as faith — *out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). The salvation is Yahuah''s; the number is nothing to Him.',
       sv.verse_id, ev.verse_id, 'free', 36725
  FROM _s340_1sa14_lookup sv, _s340_1sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=14 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar', E'They did eat with the blood, and Saul built an altar', E'Famished from Saul''s oath, the people fall on the spoil: *and the people did eat them with the blood* (1 Samuel 14:32). It is reported as sin — *Behold, the people sin against Yahuah (LORD), in that they eat with the blood* (1 Samuel 14:33) — and Saul both rebukes and remedies it: *slay them here, and eat; and sin not against Yahuah (LORD) in eating with the blood* (1 Samuel 14:34), then *Saul built an altar unto Yahuah (LORD)* (1 Samuel 14:35).\n\nThe blood-prohibition is one unbroken cord through the whole library. It is given to Noah for all flesh: *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4). It is statute in Leviticus: *ye shall eat no manner of blood* (Leviticus 7:26), with its reason — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls* (Leviticus 17:11) — and its sanction: *I will even set my face against that soul that eateth blood* (Leviticus 17:10). Deuteronomy repeats it: *the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23). And the apostles lay it, unrepealed, on the gathered nations: *that they abstain... from blood* (Acts 15:20), *from which if ye keep yourselves, ye shall do well* (Acts 15:29). The Torah on blood was never abolished; reverence for the life that is in it runs from Noah to Acts.',
       sv.verse_id, ev.verse_id, 'free', 36728
  FROM _s340_1sa14_lookup sv, _s340_1sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=14 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-14-the-rash-oath-troubled-the-land-the-people-rescued-the-saviour', E'The rash oath troubled the land; the people rescued the saviour', E'Saul binds his army with a self-made curse: *Cursed be the man that eateth any food until evening, that I may be avenged on mine enemies* (1 Samuel 14:24). Jonathan, who did not hear it, tastes honey and his eyes are enlightened, then names the harm plainly: *My father hath troubled the land* (1 Samuel 14:29). The oath nearly kills the very man Yahuah used to save Yashar''el (Israel); when the lot falls on Jonathan, the people will not let the rash word stand: *Shall Jonathan die, who hath wrought this great salvation in Yashar''el (Israel)?... So the people rescued Jonathan, that he died not* (1 Samuel 14:45).\n\nThe unconsidered oath is its own kind of tragedy in the canon. Jephthah''s parallel vow recoils on his own house: *Alas, my daughter!... for I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35). A word spoken without Torah''s wisdom does not bind Yahuah — it only afflicts the innocent. And the people''s instinct is right: the man through whom Yahuah saved, as He saved by Gideon''s few — *By the three hundred men that lapped will I save you* (Judges 7:7) — is not to be slain to satisfy a king''s rash mouth. They rescue the deliverer, and Yahuah''s salvation is honoured, not the curse.',
       sv.verse_id, ev.verse_id, 'free', 36731
  FROM _s340_1sa14_lookup sv, _s340_1sa14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=14 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*lest Yashar''el (Israel) vaunt themselves against me, saying, Mine own hand hath saved me* (Judges 7:2) — Yahuah thins the army so the glory is unmistakably His.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By the three hundred men that lapped will I save you* (Judges 7:7) — the few against the many, that the deliverance be Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the same word over the work as over the war.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*it is nothing with thee to help, whether with many, or with them that have no power* (2 Chronicles 14:11) — Asa of Yahudah prays Jonathan''s confession back to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) saveth not with sword and spear* (1 Samuel 17:47) — David preaches to Goliath what Jonathan ventured at the garrison.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*out of weakness were made strong... turned to flight the armies of the aliens* (Hebrews 11:34) — faith reads these very deliverances.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the battle is Yahuah''s (LORD''S)* (1 Samuel 17:47) — Jonathan and David share one certainty: the LORD has already delivered.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=12
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*By the three hundred men that lapped will I save you* (Judges 7:7) — Gideon''s verdict echoed in *So Yahuah (LORD) saved Yashar''el (Israel) that day*.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=23
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-no-restraint-to-yahuah-to-save-by-many-or-by-few'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) — the oldest standing command, given to Noah for all flesh.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=32
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For the life of the flesh is in the blood... it is the blood that maketh an atonement for the soul* (Leviticus 17:11) — the people seized what Yahuah reserved to Himself.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=32
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*ye shall eat no manner of blood... in any of your dwellings* (Leviticus 7:26) — the exact statute named when *the people sin against Yahuah (LORD)*.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=33
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=7 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will even set my face against that soul that eateth blood* (Leviticus 17:10) — the gravity behind the cry of transgression.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=33
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the blood is the life; and thou mayest not eat the life with the flesh* (Deuteronomy 12:23) — Saul''s remedy is simple obedience to this command.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=34
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*that they abstain... from things strangled, and from blood* (Acts 15:20) — the apostles lay the same command on the gathered nations.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=34
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*from blood... if ye keep yourselves, ye shall do well* (Acts 15:29) — the blood-prohibition stands unrepealed from Noah through Acts.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=34
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-they-did-eat-with-the-blood-and-saul-built-an-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have opened my mouth unto Yahuah (LORD), and I cannot go back* (Judges 11:35) — Jephthah''s rash vow, the same tragedy as Saul''s self-imposed curse.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=24
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=11 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-the-rash-oath-troubled-the-land-the-people-rescued-the-saviour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou hast brought me very low... I cannot go back* (Judges 11:35) — *My father hath troubled the land*: the unconsidered oath afflicts the innocent.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=29
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=11 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-the-rash-oath-troubled-the-land-the-people-rescued-the-saviour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*By the three hundred men that lapped will I save you* (Judges 7:7) — the people recognise in Jonathan the deliverer Yahuah used, as He used Gideon''s few.'
  FROM cross_reference_threads t
  JOIN _s340_1sa14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=14 AND sv.verse_number=45
  JOIN _s340_1sa14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-14-the-rash-oath-troubled-the-land-the-people-rescued-the-saviour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_15.sql (1 Samuel 15) -----
--
-- Chapter: 1 Samuel 15 — Saul, Amalek, and "to obey is better than sacrifice"
-- Tag: 1sa15   View: _s340_1sa15_lookup
-- Sort band: base 36750, step 3  (36750, 36753, 36756, 36759, 36762)
--
-- 1 Samuel 15 coverage:
--   v.2-3  (smite Amalek, the seed-war remembrance)
--          NT:     none warranted
--          Extras: none warranted (Jubilees/Jasher carry Amalek but no clean obey-this-oath verse)
--          Tanakh: Exodus 17:14,16 (Yahuah's sworn war with Amalek); Deuteronomy 25:17,19 (Remember/blot out Amalek)
--   v.17-19 (the journey, sinners the Amalekites, didst not obey)  -> folded into Amalek + obedience threads
--   v.9,15,21 (spared the best, "to sacrifice unto Yahuah")
--          NT:     Matthew 9:13; Matthew 12:7; Mark 12:33  (mercy/obedience > sacrifice)
--          Extras: Ecclesiasticus 35:1-2  (he that keepeth the law brings offerings enough)
--          Tanakh: Hosea 6:6; Micah 6:6-8; Psalm 51:16-17; Jeremiah 7:22-23
--   v.22-23 (★★★ to obey is better than sacrifice; rebellion as witchcraft)  -> KEYSTONE obedience thread
--   v.11,13,24 (it repenteth me; hath not performed my commandments; I have transgressed)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 13:13-14 (the earlier Gilgal rejection — same sin, same verdict)
--   v.23,26,28 (rejected from being king; kingdom rent, given to a better neighbour = David)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 13:14 (a man after his own heart — David foretold)
--   v.29 (★★ the Strength of Yashar'el will not lie nor repent; not a man)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 23:19 (Elohim is not a man, that he should lie) — Formed/Formless, unchanging counsel
--   v.32-35 (Agag hewn in pieces; Samuel mourned; Yahuah repented) -> framed within obedience + Strength threads
--
-- Threads (5):
--   1-samuel-15-the-sworn-war-with-amalek-blot-out-the-remembrance      [Tanakh] free
--   1-samuel-15-to-obey-is-better-than-sacrifice                        [Tanakh+NT+Extras] extras
--   1-samuel-15-rebellion-is-as-the-sin-of-witchcraft-the-rejected-king [Tanakh] free
--   1-samuel-15-the-kingdom-rent-and-given-to-a-neighbour-better-than-thou [Tanakh] free
--   1-samuel-15-the-strength-of-yasharel-will-not-lie-nor-repent        [Tanakh] free
--
-- Contested/load-bearing framing:
--   * 15:22-23 is NOT an abolition of the sacrificial Torah but its very heart: the burnt offering
--     was always meant to flow from an obeying heart (Jer 7:22-23). Hosea 6:6 / Micah 6:8 / Ps 51:16-17
--     and Sirach 35:1-2 all read the same — obedience IS the offering, not its replacement.
--   * 15:29 the Strength of Yashar'el "will not lie nor repent" reads WITH 15:11/15:35 ("it repenteth me")
--     not against it: the unchanging counsel of Yahuah (Num 23:19, the Formed Son who bears the Name and
--     led Yashar'el) over against relational grief — NOT a mutable god, NOT a co-equal trinity person.
--   * Amalek = the standing seed-war oath (Gen 3:15 enmity), conduct-within-covenant judgment, NOT ethnic hatred.

CREATE TEMP VIEW _s340_1sa15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the sworn war with Amalek
    ('canon','1-samuel',15,2,'canon','exodus',17,16,'free',
     E'*For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16). When Samuel says *I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt* (1 Samuel 15:2), he is invoking the oath sworn at Rephidim — the standing seed-war that runs from the enmity of Genesis 3:15. Saul is sent to execute a war Yahuah Himself swore, not a private vendetta.'),
    ('canon','1-samuel',15,2,'canon','exodus',17,14,'free',
     E'*And Yahuah (LORD) said unto Moses, Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14). Saul''s commission to *utterly destroy* Amalek (1 Samuel 15:3) is the carrying-out of this written memorial; *I remember that which Amalek did* (15:2) is Yahuah keeping His own book.'),
    ('canon','1-samuel',15,3,'canon','deuteronomy',25,17,'free',
     E'*Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt* (Deuteronomy 25:17). The command *Now go and smite Amalek, and utterly destroy all that they have* (1 Samuel 15:3) is Torah-rooted obedience to the standing charge — Amalek *smote the hindmost of thee, even all that were feeble behind thee* (Deut 25:18), and *he feared not Elohim (God).*'),
    ('canon','1-samuel',15,3,'canon','deuteronomy',25,19,'free',
     E'*Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about... that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19). Saul''s *utterly destroy all that they have, and spare them not* (1 Samuel 15:3) is exactly this blotting-out — and his sparing of Agag and the spoil (15:9) is the breaking of *thou shalt not forget it.*'),

    -- THREAD 2: to obey is better than sacrifice (KEYSTONE)
    ('canon','1-samuel',15,22,'canon','hosea',6,6,'free',
     E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Samuel''s verdict — *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice* (1 Samuel 15:22) — is the same word Hosea sings: the offering was never the point; the obeying heart that brings it is. This is the heart of the sacrificial Torah, not its abolition.'),
    ('canon','1-samuel',15,22,'canon','micah',6,8,'free',
     E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Micah''s answer to *shall I come before him with burnt offerings... thousands of rams?* (Micah 6:6-7) is Samuel''s answer to Saul: not *the fat of rams* (1 Samuel 15:22) but the walk of obedience Yahuah requires.'),
    ('canon','1-samuel',15,22,'canon','micah',6,7,'free',
     E'*Will Yahuah (LORD) be pleased with thousands of rams, or with ten thousands of rivers of oil?* (Micah 6:7). Saul claimed the spared sheep and oxen were *to sacrifice unto Yahuah Elohayka (the LORD thy God)* (1 Samuel 15:15,21); Micah names the very delusion — no quantity of rams substitutes for *obeying the voice of Yahuah (LORD)* (15:22).'),
    ('canon','1-samuel',15,22,'canon','psalms',51,16,'free',
     E'*For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering* (Psalm 51:16). David — the very *neighbour... better than thou* (1 Samuel 15:28) to whom the kingdom passes — learned what Saul would not: *to obey is better than sacrifice* (15:22), for *the sacrifices of Elohim (God) are a broken spirit* (Ps 51:17).'),
    ('canon','1-samuel',15,22,'canon','psalms',51,17,'free',
     E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). Against Saul''s self-justifying *I have performed the commandment of Yahuah (LORD)* (1 Samuel 15:13), David models the contrite heart that *to hearken than the fat of rams* (15:22) requires — the obedience Yahuah delights in.'),
    ('canon','1-samuel',15,22,'canon','jeremiah',7,22,'free',
     E'*For I spake not unto your fathers, nor commanded them in the day that I brought them out of the land of Egypt, concerning burnt offerings or sacrifices* (Jeremiah 7:22). Jeremiah, like Samuel, sets the founding charge above the ritual: the offering was never the first word — *Obey my voice, and I will be your Elohim (God), and ye shall be my people* (Jer 7:23) is. *To obey is better than sacrifice* (1 Samuel 15:22) is the older law of the altar itself.'),
    ('canon','1-samuel',15,22,'canon','jeremiah',7,23,'free',
     E'*But this thing commanded I them, saying, Obey my voice, and I will be your Elohim (God), and ye shall be my people: and walk ye in all the ways that I have commanded you, that it may be well unto you* (Jeremiah 7:23). This is precisely Samuel''s scale: *obeying the voice of Yahuah (LORD)* (1 Samuel 15:22) outweighs every ram, because the walking-in-His-ways is what the sacrifices were always meant to crown.'),
    ('canon','1-samuel',15,22,'canon','matthew',9,13,'free',
     E'*But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13). Yahusha (Jesus) sends the Pharisees back to the same word Samuel spoke and Hosea sang — *to obey is better than sacrifice* (1 Samuel 15:22) — the Formed Son quoting the law of mercy over ritual He Himself gave through Samuel.'),
    ('canon','1-samuel',15,22,'canon','matthew',12,7,'free',
     E'*But if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). Twice Yahusha (Jesus) presses Hosea 6:6 — the same verdict Samuel laid on Saul: ceremony divorced from an obeying, merciful heart is rejected, for *to hearken than the fat of rams* (1 Samuel 15:22) is what Yahuah requires.'),
    ('canon','1-samuel',15,22,'canon','mark',12,33,'free',
     E'*And to love him with all the heart, and with all the understanding, and with all the soul, and with all the strength, and to love his neighbour as himself, is more than all whole burnt offerings and sacrifices* (Mark 12:33). The discreet scribe Yahusha (Jesus) calls *not far from the kingdom of Elohim (God)* (Mark 12:34) has understood what Saul never did: obedient love *is more than all whole burnt offerings* — *to obey is better than sacrifice* (1 Samuel 15:22).'),
    ('canon','1-samuel',15,22,'apocrypha','ecclesiasticus',35,1,'extras',
     E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Ecclesiasticus 35:1). The wisdom of Yashar''el (Israel) reads Samuel exactly: the keeping of Torah IS the acceptable offering — obedience does not abolish the altar but fills it. *To obey is better than sacrifice* (1 Samuel 15:22) because obedience is the offering Yahuah was always after.'),
    ('canon','1-samuel',15,22,'apocrypha','ecclesiasticus',35,2,'extras',
     E'*He that requiteth a goodturn offers fine flour; and he that gives alms sacrificeth praise* (Ecclesiasticus 35:2). Ben Sira binds righteous deeds to the sacrificial vocabulary itself, the same fusion Samuel makes when he weighs *obeying the voice of Yahuah (LORD)* against *burnt offerings and sacrifices* (1 Samuel 15:22) — the deed of obedience is the truer flour and praise.'),

    -- THREAD 3: rebellion as witchcraft / the rejected king (the recurring sin)
    ('canon','1-samuel',15,11,'canon','1-samuel',13,13,'free',
     E'*And Samuel said to Saul, Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God), which he commanded thee* (1 Samuel 13:13). Yahuah''s word *It repenteth me that I have set up Saul to be king: for he is turned back from following me, and hath not performed my commandments* (1 Samuel 15:11) is the second sounding of a verdict already given at Gilgal — the same king, the same disobedience, the same place.'),
    ('canon','1-samuel',15,24,'canon','1-samuel',13,13,'free',
     E'*And Samuel said to Saul, Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God)* (1 Samuel 13:13). Saul''s confession *I have transgressed the commandment of Yahuah (LORD), and thy words: because I feared the people, and obeyed their voice* (1 Samuel 15:24) names the exact failure Samuel had already rebuked at the first Gilgal sacrifice — fearing the people over obeying Yahuah.'),

    -- THREAD 4: the kingdom rent and given to a neighbour better than thou (David)
    ('canon','1-samuel',15,28,'canon','1-samuel',13,14,'free',
     E'*But now thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people, because thou hast not kept that which Yahuah (LORD) commanded thee* (1 Samuel 13:14). When Samuel declares *Yahuah (LORD) hath rent the kingdom of Yashar''el (Israel) from thee this day, and hath given it to a neighbour of thine, that is better than thou* (1 Samuel 15:28), the *neighbour... better than thou* is that man after Yahuah''s own heart — David, already foretold at Gilgal.'),

    -- THREAD 5: the Strength of Yashar'el will not lie nor repent
    ('canon','1-samuel',15,29,'canon','numbers',23,19,'free',
     E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). Samuel''s word *the Strength of Yashar''el (Israel) will not lie nor repent: for he is not a man, that he should repent* (1 Samuel 15:29) is Balaam''s oracle exactly — the unchanging counsel of the Formed Son who bears the Name and leads Yashar''el. The relational grief of *it repenteth me* (15:11) and *Yahuah (LORD) repented* (15:35) is His sorrow over Saul, never a mutable purpose.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-15-the-sworn-war-with-amalek-blot-out-the-remembrance',
  E'The sworn war with Amalek — blot out the remembrance',
  E'Samuel''s charge does not come out of nowhere: *I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt* (1 Samuel 15:2). It reaches back to a sworn oath. At Rephidim, after Amalek attacked, *Yahuah (LORD) said unto Moses, Write this for a memorial in a book... for I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14), and *Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16). Torah seals it as a standing charge: *Remember what Amalek did unto thee by the way... How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God)* (Deuteronomy 25:17-18), *that thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19). So Saul''s *Now go and smite Amalek, and utterly destroy all that they have, and spare them not* (1 Samuel 15:3) is the execution of an oath Yahuah Himself swore — the standing seed-war (Genesis 3:15), conduct-within-covenant judgment, never ethnic hatred. Saul''s sparing of Agag and *the best of the sheep, and of the oxen* (15:9) is therefore not mercy but the breaking of *thou shalt not forget it.*',
  sv.verse_id, ev.verse_id, 'free', 36750
  FROM _s340_1sa15_lookup sv, _s340_1sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-15-to-obey-is-better-than-sacrifice',
  E'To obey is better than sacrifice',
  E'Saul spared the best of the flocks and named it worship: *the people spared the best of the sheep and of the oxen, to sacrifice unto Yahuah Elohayka (the LORD thy God)* (1 Samuel 15:15,21). Samuel answers with the verse that anchors the whole sacrificial Torah: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). This is not the abolition of the altar but its heart. Hosea sings it: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Micah presses the same: *shall I come before him with burnt offerings... thousands of rams, or with ten thousands of rivers of oil?... He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:6-8). David — the *neighbour... better than thou* (15:28) about to receive the kingdom — knows it from the ash of his own sin: *thou desirest not sacrifice... The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:16-17). Jeremiah grounds it in the founding charge itself: *I spake not unto your fathers... concerning burnt offerings or sacrifices: But this thing commanded I them, saying, Obey my voice* (Jeremiah 7:22-23). The wisdom of Yashar''el (Israel) says it plainly: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Ecclesiasticus 35:1-2) — obedience IS the offering, not its replacement. And the Formed Son, walking in flesh, twice sends the Pharisees back to Hosea''s word: *I will have mercy, and not sacrifice* (Matthew 9:13; 12:7), commending the scribe who saw that obedient love *is more than all whole burnt offerings and sacrifices* (Mark 12:33). The thread is one law of the altar from Moses to Messiah — the sacrifice was always meant to flow from an obeying heart, and severed from it, it is rejected.',
  sv.verse_id, ev.verse_id, 'extras', 36753
  FROM _s340_1sa15_lookup sv, _s340_1sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=15 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-15-rebellion-is-as-the-sin-of-witchcraft-the-rejected-king',
  E'Rebellion is as the sin of witchcraft — the recurring failure',
  E'*For rebellion is as the sin of witchcraft, and stubbornness is as iniquity and idolatry. Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). The verdict is not new. At the first Gilgal, when Saul forced himself and offered the burnt offering, *Samuel said to Saul, Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God), which he commanded thee* (1 Samuel 13:13). Now Yahuah''s word comes again: *It repenteth me that I have set up Saul to be king: for he is turned back from following me, and hath not performed my commandments* (1 Samuel 15:11). And Saul''s own confession names the same root each time — *I have transgressed the commandment of Yahuah (LORD), and thy words: because I feared the people, and obeyed their voice* (1 Samuel 15:24). The fear of the people over the voice of Yahuah is the iniquity Samuel calls witchcraft and idolatry: trading the word of Yahuah for the will of the crowd. It is the same man, the same sin, the same place, the same verdict — twice spoken, finally sealed.',
  sv.verse_id, ev.verse_id, 'free', 36756
  FROM _s340_1sa15_lookup sv, _s340_1sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=15 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-15-the-kingdom-rent-and-given-to-a-neighbour-better-than-thou',
  E'The kingdom rent and given to a neighbour better than thou',
  E'As Samuel turned to go, Saul *laid hold upon the skirt of his mantle, and it rent* (1 Samuel 15:27), and the torn cloak became the sign: *Yahuah (LORD) hath rent the kingdom of Yashar''el (Israel) from thee this day, and hath given it to a neighbour of thine, that is better than thou* (1 Samuel 15:28). That neighbour is not unnamed. Already at the first Gilgal, Samuel had foretold him: *thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people* (1 Samuel 13:14). The *man after his own heart* and the *neighbour... better than thou* are one — David, the shepherd-king through whom the seed of promise and the throne of Yashar''el (Israel) will run toward the Branch, the Formed Son who is great David''s greater Son. The kingdom is not lost to Yashar''el; it is moved to the line that will carry the promise.',
  sv.verse_id, ev.verse_id, 'free', 36759
  FROM _s340_1sa15_lookup sv, _s340_1sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=15 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-15-the-strength-of-yasharel-will-not-lie-nor-repent',
  E'The Strength of Yashar''el will not lie nor repent',
  E'In the same chapter that says twice *It repenteth me that I have set up Saul* (1 Samuel 15:11) and *Yahuah (LORD) repented that he had made Saul king* (1 Samuel 15:35), Samuel declares the opposite-seeming word: *the Strength of Yashar''el (Israel) will not lie nor repent: for he is not a man, that he should repent* (1 Samuel 15:29). The two are not a contradiction. The first is Yahuah''s relational grief over a king who turned back; the second is His unchanging counsel, which no man''s failure can bend. The word is Balaam''s oracle exactly: *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). The *Strength of Yashar''el* is the Formed Son — the One who bears the Name, who appeared and led Yashar''el (Israel) out of Egypt and through the wilderness, Yahuah who has a Father. He is not a man that He should be mutable; His purpose for His people and His seed stands, even as He grieves over Saul. The grief is real; the counsel is firm.',
  sv.verse_id, ev.verse_id, 'free', 36762
  FROM _s340_1sa15_lookup sv, _s340_1sa15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=15 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (15,2,'canon','exodus',17,16,1,E'Exodus 17:16 — *Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation:* the oath Samuel invokes.'),
    (15,2,'canon','exodus',17,14,2,E'Exodus 17:14 — *Write this for a memorial in a book... for I will utterly put out the remembrance of Amalek:* the written charge Yahuah is keeping.'),
    (15,3,'canon','deuteronomy',25,17,3,E'Deuteronomy 25:17 — *Remember what Amalek did unto thee by the way:* the Torah-rooted standing command Saul executes.'),
    (15,3,'canon','deuteronomy',25,19,4,E'Deuteronomy 25:19 — *blot out the remembrance of Amalek... thou shalt not forget it:* the very word Saul breaks by sparing Agag and the spoil.')
  ) AS m(srcv_n,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-15-the-sworn-war-with-amalek-blot-out-the-remembrance'
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=m.srcv
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members (KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (15,22,'canon','hosea',6,6,1,E'Hosea 6:6 — *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings:* the same verdict Samuel lays on Saul.'),
    (15,22,'canon','micah',6,7,2,E'Micah 6:7 — *Will Yahuah (LORD) be pleased with thousands of rams...?* — the delusion of substituting sacrifice for obedience.'),
    (15,22,'canon','micah',6,8,3,E'Micah 6:8 — *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly:* the requirement above the rams.'),
    (15,22,'canon','psalms',51,16,4,E'Psalm 51:16 — *thou desirest not sacrifice... thou delightest not in burnt offering:* David, the better neighbour, learned it.'),
    (15,22,'canon','psalms',51,17,5,E'Psalm 51:17 — *the sacrifices of Elohim (God) are a broken spirit:* the contrite heart Saul would not bring.'),
    (15,22,'canon','jeremiah',7,22,6,E'Jeremiah 7:22 — *I spake not unto your fathers... concerning burnt offerings or sacrifices:* the founding charge above the ritual.'),
    (15,22,'canon','jeremiah',7,23,7,E'Jeremiah 7:23 — *Obey my voice, and I will be your Elohim (God):* the older law of the altar — obedience first.'),
    (15,22,'canon','matthew',9,13,8,E'Matthew 9:13 — *I will have mercy, and not sacrifice:* the Formed Son sends the Pharisees back to Hosea''s word.'),
    (15,22,'canon','matthew',12,7,9,E'Matthew 12:7 — *I will have mercy, and not sacrifice, ye would not have condemned the guiltless:* Hosea 6:6 pressed a second time.'),
    (15,22,'canon','mark',12,33,10,E'Mark 12:33 — obedient love *is more than all whole burnt offerings and sacrifices:* the scribe near the kingdom understood what Saul did not.'),
    (15,22,'apocrypha','ecclesiasticus',35,1,11,E'Ecclesiasticus 35:1 — *He that keepeth the law brings offerings enough:* obedience IS the offering, not its replacement.'),
    (15,22,'apocrypha','ecclesiasticus',35,2,12,E'Ecclesiasticus 35:2 — *he that gives alms sacrificeth praise:* righteous deeds spoken in sacrificial vocabulary, the fusion Samuel makes.')
  ) AS m(srcv_n,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-15-to-obey-is-better-than-sacrifice'
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=m.srcv
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (15,11,'canon','1-samuel',13,13,1,E'1 Samuel 13:13 — *Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka:* the verdict first sounded at the earlier Gilgal sacrifice.'),
    (15,24,'canon','1-samuel',13,13,2,E'1 Samuel 13:13 — Saul''s confession (*because I feared the people, and obeyed their voice*) names the same failure Samuel already rebuked.')
  ) AS m(srcv_n,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-15-rebellion-is-as-the-sin-of-witchcraft-the-rejected-king'
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=m.srcv
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (15,28,'canon','1-samuel',13,14,1,E'1 Samuel 13:14 — *Yahuah (LORD) hath sought him a man after his own heart:* the *neighbour... better than thou* foretold at Gilgal = David.')
  ) AS m(srcv_n,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-15-the-kingdom-rent-and-given-to-a-neighbour-better-than-thou'
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=m.srcv
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (15,29,'canon','numbers',23,19,1,E'Numbers 23:19 — *Elohim (God) is not a man, that he should lie... neither the son of Adam, that he should repent:* Balaam''s oracle, the unchanging counsel of the Formed Son.')
  ) AS m(srcv_n,srcv,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='1-samuel-15-the-strength-of-yasharel-will-not-lie-nor-repent'
  JOIN _s340_1sa15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=15 AND sv.verse_number=m.srcv
  JOIN _s340_1sa15_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_16.sql (1 Samuel 16) -----
--
-- 1 Samuel 16 — Samuel sent to Beth-lehem; David anointed; the Spirit of Yahuah comes upon him;
--   the Spirit departs from Saul. KEYSTONE chapter. Tag 1sa16. Sort band base 36775, step 3.
--
-- FRAMEWORK: Yahuah refuses Eliab''s stature and weighs the heart — *Yahuah seeth not as man
--   seeth; for man looketh on the outward appearance, but Yahuah looketh on the heart* (16:7) —
--   the direct rebuke of the flesh-credential that crowned Saul (9:2, head and shoulders above
--   the people) and the standard by which the living-stone is chosen, *disallowed indeed of men,
--   but chosen of Elohim* (1 Pet 2:4). The youngest, *he keepeth the sheep* (16:11), is fetched
--   from the flock — the shepherd-king taken *from the sheepfolds* (Ps 78:70), the ruler out of
--   *Beth-lehem Ephratah* (Micah 5:2). The horn of oil is poured and *the Spirit of Yahuah came
--   upon David from that day forward* (16:13): the anointed (Mashiach) shepherd-king on whom the
--   Spirit rests — *the spirit of Yahuah shall rest upon him* (Isa 11:1-2), the Branch out of
--   Jesse''s root, the seed of David through whom the Saviour comes (Acts 13:22-23), the Formed
--   Son who took flesh as David''s seed (NOT co-equal-trinity, NOT Arian — the Spirit OF Yahuah
--   rests upon the chosen one). And the Spirit *departed from Saul* (16:14), Yahuah''s withdrawal
--   from the king who rejected the word — the opposite of David''s plea *take not thy holy spirit
--   from me* (Ps 51:11).
--
-- 1 Samuel 16 coverage:
--   v.6-7   NT:     1 Peter 2:4 (living stone, disallowed of men but chosen of Elohim);
--                   2 Corinthians 10:7 (do ye look on things after the outward appearance)
--           Extras: none warranted
--           Tanakh: 1 Samuel 9:2 (Saul higher than any of the people — the stature refused);
--                   Psalm 89:20 (I have found David my servant — the heart-chosen king)
--   v.11-12 NT:     none warranted (shepherd-from-the-flock weaves Tanakh-laterally + to Micah)
--           Extras: none warranted
--           Tanakh: Psalm 78:70 (took him from the sheepfolds); Psalm 78:71 (from following the
--                   ewes... to feed Jacob his people); Micah 5:2 (out of Beth-lehem Ephratah the ruler)
--   v.13    NT:     Acts 13:22 (David... a man after mine own heart); Acts 13:23 (of this man''s
--                   seed... a Saviour, Yahusha)
--           Extras: none warranted
--           Tanakh: Isaiah 11:1 (rod out of the stem of Jesse, a Branch); Isaiah 11:2 (the spirit
--                   of Yahuah shall rest upon him); Psalm 89:20 (with my holy oil have I anointed him)
--   v.14    NT:     none warranted
--           Extras: none warranted
--           Tanakh: 1 Samuel 18:12 (Yahuah was departed from Saul); 1 Samuel 28:15 (Elohim is
--                   departed from me, answereth me no more); Psalm 51:11 (take not thy holy spirit from me)
--   v.15-23 NT:     none warranted
--           Extras: none warranted
--           Tanakh: none warranted (David the harper soothing Saul — narrative bridge; the evil-spirit
--                   theme carried in the v.14 withdrawal thread; no external add warranted)
--
-- THREADS (4):
--   1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance      [Tanakh+NT] election by heart not flesh/stature
--        members: 1sa9:2 (Saul higher than any), ps89:20 (found David my servant), 1pet2:4 (chosen of Elohim, disallowed of men), 2cor10:7 (look on outward appearance)
--   1-samuel-16-he-keepeth-the-sheep-the-shepherd-taken-from-the-flock      [Tanakh] David from the sheepfolds, the Beth-lehem shepherd-ruler
--        members: ps78:70 (took him from the sheepfolds), ps78:71 (from following the ewes to feed Jacob), micah5:2 (out of Beth-lehem Ephratah the ruler)
--   1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david    [Tanakh+NT] the anointed shepherd-king/the Branch with the Spirit
--        members: isa11:1 (rod/Branch out of Jesse), isa11:2 (spirit of Yahuah rests upon him), ps89:20 (with my holy oil anointed him), acts13:22 (David a man after mine own heart), acts13:23 (of his seed a Saviour, Yahusha)
--   1-samuel-16-the-spirit-of-yahuah-departed-from-saul                     [Tanakh] Yahuah's withdrawal from the rejected king
--        members: 1sa18:12 (Yahuah departed from Saul), 1sa28:15 (Elohim departed, answereth no more), ps51:11 (take not thy holy spirit from me)

CREATE TEMP VIEW _s340_1sa16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Yahuah looketh on the heart, not the outward appearance
    ('canon','1-samuel',16,7,'canon','1-samuel',9,2,'free',
      E'*And he had a son, whose name was Saul, a choice young man, and a goodly: and there was not among the children of Yashar''el (Israel) a goodlier person than he: from his shoulders and upward he was higher than any of the people* (1 Samuel 9:2). This is the very stature Yahuah now refuses in Eliab — ''*Look not on his countenance, or on the height of his stature... for Yahuah seeth not as man seeth; for man looketh on the outward appearance, but Yahuah looketh on the heart*'' (1 Samuel 16:7). Saul was chosen for the frame man sees and failed; the next king is weighed by the heart Yahuah sees.'),
    ('canon','1-samuel',16,7,'canon','psalms',89,20,'free',
      E'*I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). What the heart-standard finds is named outright in the covenant-psalm: the king Yahuah sees and chooses is David, the servant anointed with the holy oil. ''*Yahuah looketh on the heart*'' (1 Samuel 16:7) is the searching that lands on the man after his own heart, not on the goodliest stature.'),
    ('canon','1-samuel',16,7,'canon','1-peter',2,4,'free',
      E'*To whom coming, as unto a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4). The pattern of election is one: ''*man looketh on the outward appearance, but Yahuah looketh on the heart*'' (1 Samuel 16:7). The stone men disallow, Yahuah chooses; the son passed over by his own household is the one Yahuah anoints — David''s election by the heart is the shape of the chosen, precious One disallowed of men.'),
    ('canon','1-samuel',16,7,'canon','2-corinthians',10,7,'free',
      E'*Do ye look on things after the outward appearance?* (2 Corinthians 10:7). Paul presses the very question Samuel had to unlearn at Beth-lehem: the eye that judges by the visible frame judges wrongly. ''*Man looketh on the outward appearance, but Yahuah looketh on the heart*'' (1 Samuel 16:7) — the same correction, that Yahuah''s reckoning is not man''s sight.'),
    -- Thread 2: He keepeth the sheep — the shepherd taken from the flock
    ('canon','1-samuel',16,11,'canon','psalms',78,70,'free',
      E'*He chose David also his servant, and took him from the sheepfolds* (Psalm 78:70). The youngest, who ''*keepeth the sheep*'' (1 Samuel 16:11) and is fetched from the flock to be anointed, is the very David the psalm sings of — chosen and taken from the sheepfolds. The shepherd of the flock is made shepherd of the people.'),
    ('canon','1-samuel',16,11,'canon','psalms',78,71,'free',
      E'*From following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71). David ''*keepeth the sheep*'' (1 Samuel 16:11) and is brought in from the flock — and that flock-keeping is the apprenticeship of the throne: the one who followed the ewes is set to feed Jacob, Yahuah''s own inheritance, the shepherd-king pattern.'),
    ('canon','1-samuel',16,12,'canon','micah',5,2,'free',
      E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). Samuel comes to Beth-lehem and Yahuah says of the shepherd-boy, ''*Arise, anoint him: for this is he*'' (1 Samuel 16:12). The town of David''s anointing is the town from which the ruler over Yashar''el comes forth — the Beth-lehem shepherd-king whose goings forth are from everlasting, the seed of David who takes flesh.'),
    -- Thread 3: The horn of oil, and the Spirit of Yahuah came upon David
    ('canon','1-samuel',16,13,'canon','isaiah',11,1,'free',
      E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). David, the son of Jesse anointed at Beth-lehem (1 Samuel 16:13), is the stem from which the Branch grows: the Davidic seed-line planted here flowers in the Messiah, the rod out of Jesse — the throne established in the root the oil now touches.'),
    ('canon','1-samuel',16,13,'canon','isaiah',11,2,'free',
      E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). What comes upon David when ''*the Spirit of Yahuah (LORD) came upon David from that day forward*'' (1 Samuel 16:13) is the same Spirit prophesied to rest on the Branch out of Jesse — the anointed shepherd-king bearing the Spirit OF Yahuah, the Formed Son drawn from the Formless who took flesh as David''s seed, on whom the fulness of the Spirit rests.'),
    ('canon','1-samuel',16,13,'canon','psalms',89,20,'free',
      E'*I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). The horn of oil Samuel pours (1 Samuel 16:13) is the holy oil of the covenant-psalm: David anointed is Yahuah''s found servant, the king sworn the everlasting throne. The oil that runs over the shepherd-boy is the seal of the Davidic covenant.'),
    ('canon','1-samuel',16,13,'canon','acts',13,22,'free',
      E'*And when he had removed him, he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). Paul preaches the Beth-lehem anointing forward: the David on whom ''*the Spirit of Yahuah came... from that day forward*'' (1 Samuel 16:13) is the man after Yahuah''s own heart, raised up to be king — the heart-chosen shepherd Samuel anointed with the horn of oil.'),
    ('canon','1-samuel',16,13,'canon','acts',13,23,'free',
      E'*Of this man''s seed hath Elohim (God) according to his promise raised unto Yashar''el (Israel) a Saviour, Yahusha (Jesus)* (Acts 13:23). The Spirit-anointed David of 1 Samuel 16:13 is the head of the seed-line through which the Saviour comes: the oil poured on the shepherd at Beth-lehem opens onto the promise that out of David''s seed Yahuah raises Yahusha — the Branch, the Formed Son who took flesh as David''s offspring.'),
    -- Thread 4: The Spirit of Yahuah departed from Saul
    ('canon','1-samuel',16,14,'canon','1-samuel',18,12,'free',
      E'*And Saul was afraid of David, because Yahuah (LORD) was with him, and was departed from Saul* (1 Samuel 18:12). The withdrawal first stated here — ''*the Spirit of Yahuah (LORD) departed from Saul*'' (1 Samuel 16:14) — is the shadow that grows over the rest of his reign: the Spirit that rests on David is the very presence gone from Saul, and the rejected king dreads the man Yahuah is with.'),
    ('canon','1-samuel',16,14,'canon','1-samuel',28,15,'free',
      E'*And Saul answered, I am sore distressed; for the Philistines make war against me, and Elohim (God) is departed from me, and answereth me no more, neither by prophets, nor by dreams* (1 Samuel 28:15). Saul''s end confesses what began at the anointing of David: ''*the Spirit of Yahuah departed from Saul, and an evil spirit from Yahuah troubled him*'' (1 Samuel 16:14). The king who rejected the word of Yahuah is left without answer — the silence is the ripened withdrawal.'),
    ('canon','1-samuel',16,14,'canon','psalms',51,11,'free',
      E'*Cast me not away from thy presence; and take not thy holy spirit from me* (Psalm 51:11). David''s plea is the mirror of Saul''s loss: he has seen ''*the Spirit of Yahuah departed from Saul*'' (1 Samuel 16:14) and prays the contrary for himself, that the Spirit which came upon him at Beth-lehem not be taken away. To lose Yahuah''s presence is the one ruin the anointed king fears above all.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance',
       E'Yahuah looketh on the heart, not the outward appearance',
       E'When the eldest is brought near, Samuel''s eye does what man''s eye always does: *Surely the LORD''S anointed is before him* (1 Samuel 16:6). But Yahuah refuses him — *Look not on his countenance, or on the height of his stature; because I have refused him: for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). This is the undoing of the flesh-credential that crowned Saul: *there was not among the children of Yashar''el (Israel) a goodlier person than he: from his shoulders and upward he was higher than any of the people* (1 Samuel 9:2) — chosen for the frame man sees, and failed. The heart-search lands instead on David: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). And the pattern runs the whole library: the chosen one is *a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4), so that Paul can press the very correction Samuel had to learn — *Do ye look on things after the outward appearance?* (2 Corinthians 10:7). Election is by the heart Yahuah sees, never the stature man admires.',
       sv.verse_id, ev.verse_id, 'free', 36775
  FROM _s340_1sa16_lookup sv, _s340_1sa16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-16-he-keepeth-the-sheep-the-shepherd-taken-from-the-flock',
       E'He keepeth the sheep — the shepherd taken from the flock',
       E'The chosen king is not in the house when Samuel arrives: *There remaineth yet the youngest, and, behold, he keepeth the sheep* (1 Samuel 16:11); he must be sent for and fetched from the flock, and when he comes Yahuah says, *Arise, anoint him: for this is he* (1 Samuel 16:12). This flock-keeping is the throne''s apprenticeship sung in the psalm: *He chose David also his servant, and took him from the sheepfolds: from following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:70-71) — the one who guarded sheep is set to shepherd the people. And the town of his anointing is the town the prophet names for the everlasting ruler: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). The shepherd-boy of Beth-lehem is the shepherd-king, and his town the well-spring of the Ruler whose seed takes flesh.',
       sv.verse_id, ev.verse_id, 'free', 36778
  FROM _s340_1sa16_lookup sv, _s340_1sa16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david',
       E'The horn of oil, and the Spirit of Yahuah came upon David',
       E'The keystone of the chapter: *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The oil is the holy oil of the covenant — *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20) — and the Spirit that comes upon the shepherd-king is the very Spirit prophesied to rest on the Branch out of David''s line: *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD)* (Isaiah 11:2). David anointed is the head of the seed-line, the man after Yahuah''s own heart: *I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22), and *Of this man''s seed hath Elohim (God) according to his promise raised unto Yashar''el (Israel) a Saviour, Yahusha (Jesus)* (Acts 13:23). The horn of oil over the shepherd at Beth-lehem opens onto the Messiah — the anointed One on whom the Spirit OF Yahuah rests, the Formed Son drawn from the Formless Father, who took flesh as David''s seed; not a co-equal person and not a creature, but Yahuah''s Anointed bearing his Father''s Spirit.',
       sv.verse_id, ev.verse_id, 'free', 36781
  FROM _s340_1sa16_lookup sv, _s340_1sa16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-16-the-spirit-of-yahuah-departed-from-saul',
       E'The Spirit of Yahuah departed from Saul',
       E'In the same breath that the Spirit rests on David, it is withdrawn from the rejected king: *But the Spirit of Yahuah (LORD) departed from Saul, and an evil spirit from Yahuah (LORD) troubled him* (1 Samuel 16:14). This withdrawal is the shadow that lengthens over the rest of his reign — *And Saul was afraid of David, because Yahuah (LORD) was with him, and was departed from Saul* (1 Samuel 18:12) — and it ripens into the silence of his end: *Elohim (God) is departed from me, and answereth me no more, neither by prophets, nor by dreams* (1 Samuel 28:15). The king who rejected the word of Yahuah is left without his presence. It is precisely this loss that David, fallen and repentant, prays never to suffer: *Cast me not away from thy presence; and take not thy holy spirit from me* (Psalm 51:11). The presence that came upon David and departed from Saul is the one treasure the anointed king fears to lose.',
       sv.verse_id, ev.verse_id, 'free', 36784
  FROM _s340_1sa16_lookup sv, _s340_1sa16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Members thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 9:2 — *from his shoulders and upward he was higher than any of the people*: the stature that crowned Saul, the flesh-credential Yahuah now refuses in Eliab.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 89:20 — *I have found David my servant; with my holy oil have I anointed him*: the heart-search lands on the chosen king, not the goodliest stature.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Peter 2:4 — *a living stone, disallowed indeed of men, but chosen of Elohim*: the chosen-by-Yahuah / disallowed-by-men pattern David''s election sets.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Corinthians 10:7 — *Do ye look on things after the outward appearance?*: Paul presses the very correction Samuel had to learn at Beth-lehem.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-yahuah-looketh-on-the-heart-not-the-outward-appearance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 78:70 — *He chose David also his servant, and took him from the sheepfolds*: the shepherd-boy who keepeth the sheep, fetched from the flock to be anointed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=11
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=70
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-he-keepeth-the-sheep-the-shepherd-taken-from-the-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 78:71 — *he brought him to feed Jacob his people, and Yashar''el his inheritance*: flock-keeping is the apprenticeship of the shepherd-king.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=11
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=71
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-he-keepeth-the-sheep-the-shepherd-taken-from-the-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Micah 5:2 — *out of thee shall he come forth... that is to be ruler in Yashar''el; whose goings forth have been... from everlasting*: the Beth-lehem of David''s anointing is the town of the everlasting Ruler.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=12
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-he-keepeth-the-sheep-the-shepherd-taken-from-the-flock'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 11:1 — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots*: David the son of Jesse is the stem from which the Branch grows.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 11:2 — *the spirit of Yahuah shall rest upon him*: the same Spirit that came upon David, resting in fulness on the Branch — the Formed Son bearing the Father''s Spirit.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:20 — *with my holy oil have I anointed him*: the horn of oil Samuel pours is the holy oil of the Davidic covenant.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Acts 13:22 — *I have found David the son of Jesse, a man after mine own heart*: Paul preaches the Beth-lehem anointing forward — the heart-chosen Spirit-anointed king.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 13:23 — *Of this man''s seed... a Saviour, Yahusha*: the Spirit-anointed David is head of the seed-line through which the Saviour comes.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=13
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-horn-of-oil-and-the-spirit-of-yahuah-came-upon-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 18:12 — *Yahuah was with him, and was departed from Saul*: the withdrawal of v.14 lengthening into Saul''s dread of the man Yahuah is with.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-spirit-of-yahuah-departed-from-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 28:15 — *Elohim is departed from me, and answereth me no more*: the ripened silence of the king from whom the Spirit departed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-spirit-of-yahuah-departed-from-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 51:11 — *take not thy holy spirit from me*: David''s plea is the mirror of Saul''s loss — the one ruin the anointed king fears above all.'
  FROM cross_reference_threads t
  JOIN _s340_1sa16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s340_1sa16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-16-the-spirit-of-yahuah-departed-from-saul'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_17.sql (1 Samuel 17) -----
--
-- Book/chapter: 1 Samuel 17    Tag: 1sa17    View: _s340_1sa17_lookup
-- Sort band: base 36800, step 3  ->  36800, 36803, 36806, 36809, 36812, 36815
--
-- KEYSTONE CHAPTER: David and Goliath. The shepherd-champion who stands for his people,
-- slays the defier of the living Elohim with a stone, and confesses the battle is Yahuah's.
--
-- 1 Samuel 17 coverage:
--   v.8-10  (Goliath: choose you a man... let him come down to me; I defy the armies of Yashar'el)
--        NT:     Hebrews 11:33-34 (through faith subdued kingdoms... turned to flight the armies of the aliens) -> THREAD 6
--        Extras: none warranted
--        Tanakh: 1 Samuel 17:51-52 (one man's victory becomes the people's rout) -> THREAD 6
--   v.15,34-37 (David from the sheep; the lion and the bear; Yahuah will deliver me)
--        NT:     Hebrews 11:32-34 (David also... subdued kingdoms, stopped the mouths of lions) -> THREAD 3
--        Extras: none warranted
--        Tanakh: 1 Samuel 16:11-13 (the youngest, who keepeth the sheep, anointed); Psalm 144:1
--                (teacheth my hands to war) -> THREAD 3
--   v.26,36 (who is this uncircumcised Philistine, that he should defy the armies of the living Elohim)
--        NT:     1 John 4:4 (greater is he that is in you, than he that is in the world) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Deuteronomy 20:1-4 (be not afraid... Yahuah Elohaychem goeth with you, to fight for you);
--                1 Samuel 14:6 (no restraint to Yahuah to save by many or by few) -> THREAD 2
--   v.45-47 (I come to thee in the name of Yahuah Tseva'ot... Yahuah saveth not with sword and spear;
--            the battle is Yahuah's)  -- ★★★ keystone confession
--        NT:     none warranted directly (Heb 11 carried on THREAD 3/6)
--        Extras: 1 Maccabees 3:18-19 (the victory of battle stands not in the multitude of an host;
--                but strength comes from heaven) -> THREAD 1
--        Tanakh: Zechariah 4:6 (not by might, nor by power, but by my spirit); 2 Chronicles 20:15
--                (the battle is not yours, but Elohim's); 2 Chronicles 20:17 (stand ye still, and see
--                the salvation of Yahuah); 1 Samuel 14:6 -> THREAD 1
--   v.40,49-51 (five smooth stones; the stone sunk into his forehead; he fell upon his face; cut off his head)
--        NT:     Romans 16:20 (the Elohim of peace shall bruise Satan under your feet shortly) -> THREAD 4
--        Extras: none warranted
--        Tanakh: Genesis 3:15 (it shall bruise thy head, and thou shalt bruise his heel) -> THREAD 4
--   v.32-33,38-40 (David refuses Saul's armour; takes staff, sling, five stones — the weak made the deliverer)
--        NT:     none warranted directly
--        Extras: none warranted
--        Tanakh: handled within THREAD 5 (the youth, the despised, the chosen vessel)
--   v.42-44 (the Philistine disdained him; cursed David by his gods) -> THREAD 5 source (the despised deliverer)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 16:7 (Yahuah seeth not as man seeth; man looketh on the outward appearance,
--                but Yahuah looketh on the heart) -> THREAD 5
--   v.1-7,11-14,16-25,27-31,52-58 (setting, ranks, forty days, Eliab's rebuke, the rout, Saul's enquiry)
--        narrative scaffolding; framework weight carried by the threads above; none warranted standalone
--
-- THREADS:
--   1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear (extras)
--        -> Tanakh (Zechariah, 2 Chronicles x2, 1 Samuel 14) + Extras (1 Maccabees)
--   1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim (free)
--        -> Tanakh (Deuteronomy, 1 Samuel 14) + NT (1 John)
--   1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear (free)
--        -> Tanakh (1 Samuel 16, Psalm 144) + NT (Hebrews)
--   1-samuel-17-the-stone-that-smote-the-defiers-head-the-seed-bruises-the-serpent (free)
--        -> Tanakh (Genesis) + NT (Romans)
--   1-samuel-17-the-despised-youth-yahuah-looketh-on-the-heart (free)
--        -> Tanakh (1 Samuel 16)
--   1-samuel-17-one-champion-stands-and-the-whole-people-prevail (free)
--        -> Tanakh (1 Samuel 17) + NT (Hebrews)
--
-- Framework-load-bearing framing:
--   * 17:45-47 ★★★ keystone — David frames the duel as Yahuah's own war: the deliverance belongs to
--     Yahuah Tseva'ot, won by His Spirit and not the arm of flesh. Bound to Zechariah's "not by might",
--     Jehoshaphat's "the battle is not yours, but Elohim's", Jonathan's "many or few", and the
--     extra-canonical witness of 1 Maccabees ("strength comes from heaven"). Forward/lateral weave, the
--     canon's recurring grammar of deliverance — NEVER human triumphalism.
--   * 17:26,36 — the uncircumcised defier of the LIVING Elohim is the serpent-seed posture (Gen 3:15
--     enmity); David's indignation is covenant zeal, and Deut 20 is the Torah ground for fearlessness in
--     Yahuah's battle. 1 John 4:4 (greater is he that is in you) reads forward, the overcomer's confidence.
--   * 17:49-51 ★★ — the unlikely deliverer crushes the giant's head with a stone: the seed of the woman
--     bruising the serpent's head (Gen 3:15), which Romans 16:20 carries to its consummation. The Formed-
--     Son type: David the anointed shepherd-champion (one man's victory = the people's salvation).
--   * 17:15,34-37 — David comes FROM THE SHEEP; the shepherd who fought lion and bear is the anointed of
--     1 Sam 16 and the warrior-king of Psalm 144 ("teacheth my hands to war"). Hebrews 11 reads David and
--     the prophets as faith. A type of the Anointed Shepherd, NOT mere heroism.
--   * 17:42 — the Philistine DISDAINED him "for he was but a youth"; man looks on the outward appearance,
--     Yahuah on the heart (1 Sam 16:7). The despised chosen vessel is the canon's pattern.

CREATE TEMP VIEW _s340_1sa17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the battle is Yahuah's; he saveth not with sword and spear
    ('canon','1-samuel',17,47,'canon','zechariah',4,6,'free',
      E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). David''s confession in the valley — *Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S* (1 Samuel 17:47) — is the same word Zechariah hears over the rebuilding: deliverance is won by Yahuah''s Spirit, never the arm of flesh.'),
    ('canon','1-samuel',17,47,'canon','2-chronicles',20,15,'free',
      E'*Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). Jehoshaphat hears in Yahudah (Judah) exactly what David proclaims in the valley of Elah — *the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47); the war belongs to Yahuah, and so does the victory.'),
    ('canon','1-samuel',17,47,'canon','2-chronicles',20,17,'free',
      E'*Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem* (2 Chronicles 20:17). The same trust David carries against Goliath — *Yahuah (LORD) saveth not with sword and spear* (1 Samuel 17:47) — Yahuah speaks back to Yahudah: stand still, and watch Me save.'),
    ('canon','1-samuel',17,47,'canon','1-samuel',14,6,'free',
      E'*Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). Jonathan ventured against the garrison on this creed, and David preaches it whole in the valley — *Yahuah (LORD) saveth not with sword and spear* (1 Samuel 17:47): the number and the weapon are nothing to Yahuah.'),
    ('canon','1-samuel',17,47,'apocrypha','1-maccabees',3,18,'extras',
      E'*To whom Judas answered, It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company* (1 Maccabees 3:18). Generations later Yahudah Maccabee, facing a mighty host with a small company, confesses David''s very creed — *Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S* (1 Samuel 17:47); the deliverance is reckoned to Yahuah, not to numbers.'),
    ('canon','1-samuel',17,47,'apocrypha','1-maccabees',3,19,'extras',
      E'*For the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:19). This is the marrow of David''s word to the assembly — *all this assembly shall know that Yahuah (LORD) saveth not with sword and spear* (1 Samuel 17:47); the strength that wins the field comes down from Yahuah, and the host learns it.'),

    -- THREAD 2: who is this uncircumcised, that he should defy the living Elohim
    ('canon','1-samuel',17,26,'canon','deuteronomy',20,1,'free',
      E'*When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee, which brought thee up out of the land of Egypt* (Deuteronomy 20:1). David''s indignation — *who is this uncircumcised Philistine, that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26) — is the Torah''s own posture: the size of the champion is nothing where Yahuah goes out with His people.'),
    ('canon','1-samuel',17,26,'canon','deuteronomy',20,4,'free',
      E'*For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4). While the host is dismayed, David alone speaks Torah''s confidence — *who is this uncircumcised Philistine, that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26); Yahuah Himself goes out to fight for His people, so the defier defies the living Elohim, not merely men.'),
    ('canon','1-samuel',17,36,'canon','1-samuel',14,6,'free',
      E'*for there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). David counts the giant as one more lion or bear — *this uncircumcised Philistine shall be as one of them, seeing he hath defied the armies of the living Elohim (God)* (1 Samuel 17:36) — the same fearless reckoning Jonathan made: against the living Elohim no Philistine, great or small, can stand.'),
    ('canon','1-samuel',17,36,'canon','1-john',4,4,'free',
      E'*Ye are of Elohim (God), little children, and have overcome them: because greater is he that is in you, than he that is in the world* (1 John 4:4). David''s certainty that the defier of *the armies of the living Elohim (God)* (1 Samuel 17:36) is already overcome is the overcomer''s confidence carried forward: the One who is in His own is greater than every champion of the world.'),

    -- THREAD 3: the shepherd from the sheep who slew the lion and the bear
    ('canon','1-samuel',17,34,'canon','1-samuel',16,11,'free',
      E'*And he said, There remaineth yet the youngest, and, behold, he keepeth the sheep. And Samuel said unto Jesse, Send and fetch him: for we will not sit down till he come hither* (1 Samuel 16:11). The shepherd who tells Saul *Thy servant kept his father''s sheep, and there came a lion, and a bear* (1 Samuel 17:34) is the same youngest son fetched from the flock and anointed; the keeper of the sheep is Yahuah''s chosen deliverer.'),
    ('canon','1-samuel',17,37,'canon','1-samuel',16,13,'free',
      E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). David''s confidence — *Yahuah (LORD) that delivered me out of the paw of the lion, and out of the paw of the bear, he will deliver me out of the hand of this Philistine* (1 Samuel 17:37) — rests on this: the Spirit of Yahuah came upon the anointed shepherd, and the same Yahuah who guarded the flock will guard His people.'),
    ('canon','1-samuel',17,37,'canon','psalms',144,1,'free',
      E'*Blessed be Yahuah (LORD) my strength, which teacheth my hands to war, and my fingers to fight* (Psalm 144:1). The shepherd who slew lion and bear and trusts Yahuah to deliver him from the Philistine — *he will deliver me out of the hand of this Philistine* (1 Samuel 17:37) — sings later as king the source of that skill: it was Yahuah who taught his hands to war.'),
    ('canon','1-samuel',17,37,'canon','hebrews',11,32,'free',
      E'*And what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson, and of Jephthae; of David also, and Samuel, and of the prophets* (Hebrews 11:32). The roll of faith names David among the deliverers; his word to Saul — *Yahuah (LORD)... will deliver me out of the hand of this Philistine* (1 Samuel 17:37) — is the very faith Hebrews remembers, the trust that subdued kingdoms.'),
    ('canon','1-samuel',17,34,'canon','hebrews',11,33,'free',
      E'*Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33). David''s shepherd-testimony — *there came a lion, and a bear, and took a lamb out of the flock... and slew him* (1 Samuel 17:34-35) — is read by Hebrews as faith that *stopped the mouths of lions*; the hand that guarded the flock is the hand of faith.'),

    -- THREAD 4: the stone that smote the defier's head; the seed bruises the serpent
    ('canon','1-samuel',17,49,'canon','genesis',3,15,'free',
      E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The first promise sets the seed of the woman against the serpent''s seed, head against heel — and here the unlikely deliverer''s stone *sunk into his forehead* (1 Samuel 17:49) and the defier *fell upon his face to the earth*; the enmity runs the whole canon, and the head of the proud is brought down.'),
    ('canon','1-samuel',17,51,'canon','genesis',3,15,'free',
      E'*it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). David *cut off his head therewith* (1 Samuel 17:51) — the champion who defied the living Elohim is undone head-first, a figure of the serpent''s head bruised by the woman''s seed; the anointed shepherd is the type of the Seed who crushes the enemy.'),
    ('canon','1-samuel',17,51,'canon','romans',16,20,'free',
      E'*And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen* (Romans 16:20). The promise of Genesis 3:15 that David''s victory foreshadows — the defier''s head taken off, *and slew him, and cut off his head therewith* (1 Samuel 17:51) — Romans carries to its end: the serpent crushed under the feet of Yahuah''s people through the anointed Deliverer.'),

    -- THREAD 5: the despised youth; Yahuah looketh on the heart
    ('canon','1-samuel',17,42,'canon','1-samuel',16,7,'free',
      E'*But Yahuah (LORD) said unto Samuel, Look not on his countenance, or on the height of his stature; because I have refused him... for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). The Philistine judges by the eye — *he disdained him: for he was but a youth, and ruddy, and of a fair countenance* (1 Samuel 17:42) — exactly the error Yahuah warned against; the deliverer the world disdains is the one Yahuah chose by the heart.'),

    -- THREAD 6: one champion stands, and the whole people prevail
    ('canon','1-samuel',17,8,'canon','1-samuel',17,51,'free',
      E'*Therefore David ran, and stood upon the Philistine, and took his sword... and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled* (1 Samuel 17:51). Goliath set the terms of single combat — *choose you a man for you, and let him come down to me* (1 Samuel 17:8) — one champion for all; and the terms hold in reverse: when the one champion of Yashar''el (Israel) prevails, the enemy is broken for the whole people.'),
    ('canon','1-samuel',17,9,'canon','1-samuel',17,52,'free',
      E'*And the men of Yashar''el (Israel) and of Yahudah (Judah) arose, and shouted, and pursued the Philistines... And the wounded of the Philistines fell down by the way to Shaaraim, even unto Gath, and unto Ekron* (1 Samuel 17:52). The wager was that one man''s fight would settle a whole nation''s fate — *if he be able to fight with me... then will we be your servants* (1 Samuel 17:9) — and so David''s lone victory becomes the rout of both houses; one champion''s triumph is the people''s deliverance.'),
    ('canon','1-samuel',17,9,'canon','hebrews',11,34,'free',
      E'*out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). The single-combat wager — *if I prevail against him, and kill him, then shall ye be our servants* (1 Samuel 17:9) — turns on the deliverer Hebrews remembers by faith: out of a youth''s weakness Yahuah made strength, and *turned to flight the armies of the aliens*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear', E'The battle is Yahuah''s: he saveth not with sword and spear', E'When Goliath comes with sword and spear and shield, David answers with the Name: *Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of the armies of Yashar''el (Israel), whom thou hast defied* (1 Samuel 17:45). He tells the whole assembly why the giant will fall — *all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). The deliverance is Yahuah''s, and so is the glory.\n\nThis is the canon''s recurring grammar of deliverance, woven through both houses and beyond. Zechariah hears it over the rebuilding of the house: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). Jehoshaphat hears it in Yahudah (Judah) when a great multitude comes up: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15) — *set yourselves, stand ye still, and see the salvation of Yahuah (LORD)* (2 Chronicles 20:17). Jonathan ventured against the garrison on it: *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). And generations later Yahudah Maccabee confesses the same creed against a mighty host: *It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company* (1 Maccabees 3:18) — *for the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:19). The sword and the spear are nothing; the battle is Yahuah''s.',
       sv.verse_id, ev.verse_id, 'extras', 36800
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=45
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim', E'Who is this uncircumcised, that he should defy the armies of the living Elohim', E'While all Yashar''el (Israel) is *dismayed, and greatly afraid* (1 Samuel 17:11), one shepherd is indignant. David hears the giant''s daily taunt and asks the question no one else will: *who is this uncircumcised Philistine, that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26). To Saul he says it again, counting the giant as one more beast: *this uncircumcised Philistine shall be as one of them, seeing he hath defied the armies of the living Elohim (God)* (1 Samuel 17:36). The defier is not merely insulting men — he is defying the LIVING Elohim, and that is a thing already lost.\n\nThis is Torah''s own posture for Yahuah''s battles: *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee* (Deuteronomy 20:1), *for Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4). It is the same fearless reckoning Jonathan made — *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). And it carries forward to the overcomer''s confidence: *Ye are of Elohim (God), little children, and have overcome them: because greater is he that is in you, than he that is in the world* (1 John 4:4). The uncircumcised defier of the living Elohim is the serpent-seed posture, and against the living Elohim it cannot stand.',
       sv.verse_id, ev.verse_id, 'free', 36803
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear', E'The shepherd from the sheep who slew the lion and the bear', E'David is not a man of war but a keeper of sheep: *But David went and returned from Saul to feed his father''s sheep at Beth-lehem* (1 Samuel 17:15). When Saul says he is but a youth, David answers from the pasture: *Thy servant kept his father''s sheep, and there came a lion, and a bear, and took a lamb out of the flock: and I went out after him, and smote him, and delivered it out of his mouth* (1 Samuel 17:34-35). His whole confidence rests on the Yahuah who guarded the flock: *Yahuah (LORD) that delivered me out of the paw of the lion, and out of the paw of the bear, he will deliver me out of the hand of this Philistine* (1 Samuel 17:37).\n\nThis is the anointed shepherd, a type of the Anointed Shepherd-Champion. He is the youngest, fetched from the flock and anointed: *There remaineth yet the youngest, and, behold, he keepeth the sheep* (1 Samuel 16:11); *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The skill of his hand was never his own — as king he sings, *Blessed be Yahuah (LORD) my strength, which teacheth my hands to war, and my fingers to fight* (Psalm 144:1). And the roll of faith remembers him among the deliverers: *of David also, and Samuel, and of the prophets* (Hebrews 11:32), *who through faith subdued kingdoms... stopped the mouths of lions* (Hebrews 11:33). The hand that guarded the lamb is the hand of faith.',
       sv.verse_id, ev.verse_id, 'free', 36806
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-the-stone-that-smote-the-defiers-head-the-seed-bruises-the-serpent', E'The stone that smote the defier''s head: the seed bruises the serpent', E'David refuses Saul''s armour and goes down as a shepherd: *he took his staff in his hand, and chose him five smooth stones out of the brook... and his sling was in his hand* (1 Samuel 17:40). One stone is enough: *And David put his hand in his bag, and took thence a stone, and slang it, and smote the Philistine in his forehead, that the stone sunk into his forehead; and he fell upon his face to the earth* (1 Samuel 17:49). The champion who defied the living Elohim is undone head-first: *David ran, and stood upon the Philistine... and slew him, and cut off his head therewith* (1 Samuel 17:51).\n\nThe head of the proud brought down by the unlikely deliverer is the first promise of the whole canon: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The enmity between the serpent''s seed and the woman''s seed runs from Eden onward, and the anointed shepherd who smites the defier in the forehead is a figure of the Seed who crushes the serpent''s head. Romans carries the promise to its consummation: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). David''s stone foreshadows the Deliverer under whose feet the enemy is finally crushed.',
       sv.verse_id, ev.verse_id, 'free', 36809
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=49
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-the-despised-youth-yahuah-looketh-on-the-heart', E'The despised youth: Yahuah looketh on the heart', E'The giant measures David by the eye and finds him beneath contempt: *And when the Philistine looked about, and saw David, he disdained him: for he was but a youth, and ruddy, and of a fair countenance* (1 Samuel 17:42). The world''s champion judges by stature and appearance — the very error Yahuah had already named when He chose this same youth over his taller brothers.\n\nWhen Samuel looked on Eliab the firstborn and thought him surely the LORD''s anointed, Yahuah corrected him: *Look not on his countenance, or on the height of his stature; because I have refused him... for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). Goliath disdains exactly what Yahuah disregards — the outward — and is blind to exactly what Yahuah chose: the heart. The deliverer the world despises is the one Yahuah anointed; the stone the builders refuse becomes the head of the corner.',
       sv.verse_id, ev.verse_id, 'free', 36812
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=42
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-17-one-champion-stands-and-the-whole-people-prevail', E'One champion stands, and the whole people prevail', E'Goliath sets the terms of single combat: *choose you a man for you, and let him come down to me. If he be able to fight with me, and to kill me, then will we be your servants: but if I prevail against him, and kill him, then shall ye be our servants* (1 Samuel 17:8-9). One man''s fight is to settle the fate of two whole nations — the champion stands for his people, and his victory or defeat is theirs.\n\nThe wager holds, but in Yashar''el''s (Israel''s) favour. When David''s lone victory is won — *and slew him, and cut off his head therewith. And when the Philistines saw their champion was dead, they fled* (1 Samuel 17:51) — the deliverance flows to the whole people: *And the men of Yashar''el (Israel) and of Yahudah (Judah) arose, and shouted, and pursued the Philistines... even unto Gath, and unto Ekron* (1 Samuel 17:52). One champion''s triumph is the rout of the enemy for both houses. This is the David/Messiah pattern — the single representative whose victory is reckoned to all his people; the roll of faith remembers it as the strength Yahuah brought *out of weakness... turned to flight the armies of the aliens* (Hebrews 11:34).',
       sv.verse_id, ev.verse_id, 'free', 36815
  FROM _s340_1sa17_lookup sv, _s340_1sa17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=17 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1: the battle is Yahuah's
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Not by might, nor by power, but by my spirit* (Zechariah 4:6) — the same word over the work as over the war.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15) — Jehoshaphat hears in Yahudah what David proclaims in the valley.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*stand ye still, and see the salvation of Yahuah (LORD)* (2 Chronicles 20:17) — Yahuah speaks back to Yahudah the trust David carries.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) — Jonathan ventured it; David preaches it whole.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*to deliver with a great multitude, or a small company* (1 Maccabees 3:18) — Yahudah Maccabee confesses David''s creed against a mighty host.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:19) — the marrow of David''s word to the assembly.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=47
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-battle-is-yahuahs-he-saveth-not-with-sword-and-spear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: who is this uncircumcised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee* (Deuteronomy 20:1) — Torah''s posture for Yahuah''s battles, the size of the foe nothing.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=26
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you* (Deuteronomy 20:4) — so the defier defies the living Elohim, not merely men.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=26
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6) — the giant counted as one more lion or bear before the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=36
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*greater is he that is in you, than he that is in the world* (1 John 4:4) — the overcomer''s confidence carried forward.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=36
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-who-is-this-uncircumcised-that-defieth-the-armies-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the shepherd from the sheep
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There remaineth yet the youngest, and, behold, he keepeth the sheep* (1 Samuel 16:11) — the keeper of the flock fetched and anointed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=34
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13) — the anointed shepherd''s confidence rests here.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=37
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed be Yahuah (LORD) my strength, which teacheth my hands to war* (Psalm 144:1) — the king sings the source of the shepherd''s skill.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=37
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=144 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*of David also, and Samuel, and of the prophets* (Hebrews 11:32) — the roll of faith names David among the deliverers.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=37
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Who through faith subdued kingdoms... stopped the mouths of lions* (Hebrews 11:33) — faith reads David''s shepherd-testimony of lion and bear.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=34
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-shepherd-from-the-sheep-who-slew-the-lion-and-the-bear'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the stone that smote the head; the seed bruises the serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — the stone sunk into the defier''s forehead, the head of the proud brought down.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=49
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-stone-that-smote-the-defiers-head-the-seed-bruises-the-serpent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*it shall bruise thy head* (Genesis 3:15) — *cut off his head therewith*: the defier undone head-first, a figure of the serpent''s head bruised.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=51
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-stone-that-smote-the-defiers-head-the-seed-bruises-the-serpent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — the promise of Genesis 3:15 carried to its consummation.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=51
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-stone-that-smote-the-defiers-head-the-seed-bruises-the-serpent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the despised youth; Yahuah looketh on the heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7) — Goliath disdains exactly what Yahuah disregards, blind to what Yahuah chose.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=42
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-the-despised-youth-yahuah-looketh-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6: one champion stands, the whole people prevail
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*when the Philistines saw their champion was dead, they fled* (1 Samuel 17:51) — one champion''s defeat is the breaking of the whole host.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-one-champion-stands-and-the-whole-people-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the men of Yashar''el (Israel) and of Yahudah (Judah) arose, and shouted, and pursued* (1 Samuel 17:52) — David''s lone victory becomes the rout of both houses.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=9
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-one-champion-stands-and-the-whole-people-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*out of weakness were made strong... turned to flight the armies of the aliens* (Hebrews 11:34) — the David/Messiah pattern, faith''s strength out of a youth''s weakness.'
  FROM cross_reference_threads t
  JOIN _s340_1sa17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=17 AND sv.verse_number=9
  JOIN _s340_1sa17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-17-one-champion-stands-and-the-whole-people-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_18.sql (1 Samuel 18) -----
--
-- Chapter: 1 Samuel 18 — Jonathan's covenant-love, the women's song, and Yahuah with David
-- Tag: 1sa18   View: _s340_1sa18_lookup
-- Sort band: base 36825, step 3  (36825, 36828, 36831)
--
-- 1 Samuel 18 coverage:
--   v.1-4  (the soul of Jonathan knit to David's soul; covenant; the robe, sword, bow, girdle stripped to David)
--          NT:     John 15:13 (greater love — lay down life for friends); 1 John 3:16 (he laid down his life... we ought to lay down our lives for the brethren)
--          Extras: none warranted (no clean covenant-friendship witness)
--          Tanakh: Proverbs 18:24 (a friend that sticketh closer than a brother)
--   v.5,13-16,30 (David behaved himself wisely; set over the men of war; accepted; all Israel and Judah loved him) -> folded into the "Yahuah with David" thread
--   v.6-9  (the women sing Saul his thousands, David his ten thousands; Saul wroth, envious, eyed David)
--          NT:     1 John 3:12 (Cain... slew his brother... because his own works were evil, and his brother's righteous)
--          Extras: none warranted
--          Tanakh: Genesis 37:11 (his brethren envied him); Psalm 37:12-13 (the wicked plotteth against the just, and gnasheth upon him)
--   v.10-11 (evil spirit; Saul casts the javelin to smite David to the wall) -> framed within the envy thread (envy ripening to murder)
--   v.12,14,28 (★ Yahuah was with David; Saul afraid because Yahuah was with him and departed from Saul)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Samuel 16:13,14,18 (Spirit of Yahuah came upon David / departed from Saul / Yahuah is with him); Psalm 37:1-2,7,32-33 (fret not... the wicked watcheth the righteous... Yahuah will not leave him in his hand)
--   v.17-27 (Merab, Michal, the snare, the hundred/two-hundred foreskins dowry)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (Saul's snare-marriage scheme is folded into the envy/fear-of-the-chosen frame, not separately threaded)
--   v.29 (Saul became David's enemy continually) -> folded into the "Yahuah with David" thread (the rejected raging against the favoured)
--
-- Threads (3):
--   1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love     [Tanakh+NT] free
--   1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder        [Tanakh+NT] free
--   1-samuel-18-yahuah-was-with-david-the-chosen-prospered                 [Tanakh] free
--
-- Contested/load-bearing framing:
--   * Jonathan's covenant-love (18:1-4) is the king's son honouring Yahuah's anointed, laying down his
--     own right of succession — the love that lays down its life (John 15:13; 1 John 3:16), conduct not
--     ethnicity, the friend closer than a brother (Prov 18:24).
--   * Saul's envy (18:7-11) is the seed-war pattern: the elder/rejected raging at the chosen younger,
--     as Joseph's brethren envied him (Gen 37:11), as Cain slew Abel because his brother's works were
--     righteous (1 John 3:12). Envy ripening to attempted murder (the javelin). Conduct-within-covenant,
--     never ethnic hatred — Saul is a victim of his own jealousy, the lost king.
--   * "Yahuah was with David" (18:12,14,28) is the favoured one prospered by the Presence — the Spirit
--     that came upon David and departed from Saul (1 Sam 16:13-14) — while the rejected rages. Psalm 37
--     sings the very pattern: the righteous watched and hunted by the wicked, yet not left in his hand.

CREATE TEMP VIEW _s340_1sa18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the soul of Jonathan knit to David's soul — covenant-love
    ('canon','1-samuel',18,1,'canon','proverbs',18,24,'free',
     E'*A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother* (Proverbs 18:24). When *the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1), the proverb is made flesh: the king''s own son cleaves to the anointed shepherd nearer than blood, a covenant-love that holds against his own father''s house and his own claim to the throne.'),
    ('canon','1-samuel',18,3,'canon','proverbs',18,24,'free',
     E'*A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother* (Proverbs 18:24). *Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3) — the friend closer than a brother is sealed by covenant, not mere affection; Jonathan binds himself to David before Yahuah while David is yet a captain, not a king.'),
    ('canon','1-samuel',18,3,'canon','john',15,13,'free',
     E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan''s covenant *because he loved him as his own soul* (1 Samuel 18:3) is exactly this greater love spoken forward: the king''s heir lays down his own right of succession for the friend Yahuah has chosen, the very love the Formed Son names as the highest a man can give.'),
    ('canon','1-samuel',18,4,'canon','john',15,13,'free',
     E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). *Jonathan stripped himself of the robe that was upon him, and gave it to David, and his garments, even to his sword, and to his bow, and to his girdle* (1 Samuel 18:4) — he hands over the very insignia of the prince, an enacted laying-down of his own life and throne for his friend, the love Yahusha (Jesus) calls greater than any other.'),
    ('canon','1-samuel',18,4,'canon','1-john',3,16,'free',
     E'*Hereby perceive we the love of Elohim (God), because he laid down his life for us: and we ought to lay down our lives for the brethren* (1 John 3:16). Jonathan stripping off *the robe that was upon him... even to his sword, and to his bow, and to his girdle* (1 Samuel 18:4) is the covenant-love that yields its own right for the brother — the same self-giving 1 John makes the measure of love among the brethren.'),

    -- THREAD 2: Saul hath slain his thousands — the envy of the elder/rejected against the chosen
    ('canon','1-samuel',18,8,'canon','genesis',37,11,'free',
     E'*And his brethren envied him; but his father observed the saying* (Genesis 37:11). Saul *was very wroth, and the saying displeased him; and he said... what can he have more but the kingdom?* (1 Samuel 18:8) is the same root that turned Joseph''s brethren against him — the envy of the established against the one Yahuah is lifting up, conduct-within-covenant, the seed-war jealousy that runs from Genesis.'),
    ('canon','1-samuel',18,9,'canon','genesis',37,11,'free',
     E'*And his brethren envied him; but his father observed the saying* (Genesis 37:11). *And Saul eyed David from that day and forward* (1 Samuel 18:9): as Joseph''s brothers came to hate the favoured younger, so Saul''s envy fastens its eye on the chosen one — the elder/rejected watching the younger Yahuah has set above him.'),
    ('canon','1-samuel',18,11,'canon','1-john',3,12,'free',
     E'*Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). When *Saul cast the javelin; for he said, I will smite David even to the wall with it* (1 Samuel 18:11), the envy of verse 8 ripens to the murder of Cain — the wicked rising against the righteous precisely because the righteous prospers, the seed-war pattern named outright.'),
    ('canon','1-samuel',18,9,'canon','psalms',37,12,'free',
     E'*The wicked plotteth against the just, and gnasheth upon him with his teeth* (Psalm 37:12). Saul eyeing David *from that day and forward* (1 Samuel 18:9) is the plotting Psalm 37 sings — the wicked fixed against the just; yet the next line answers it: *Yahuah (Lord) shall laugh at him: for he seeth that his day is coming* (Psalm 37:13).'),

    -- THREAD 3: Yahuah was with David — the chosen prospered, the rejected raging
    ('canon','1-samuel',18,12,'canon','1-samuel',16,13,'free',
     E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). *Saul was afraid of David, because Yahuah (LORD) was with him* (1 Samuel 18:12) traces straight back to the anointing: the Spirit that came upon David at Beth-lehem is the very Presence Saul now dreads.'),
    ('canon','1-samuel',18,12,'canon','1-samuel',16,14,'free',
     E'*But the Spirit of Yahuah (LORD) departed from Saul, and an evil spirit from Yahuah (LORD) troubled him* (1 Samuel 16:14). The double clause *because Yahuah (LORD) was with him, and was departed from Saul* (1 Samuel 18:12) is the two halves of chapter 16 met in one verse — the Presence resting on the chosen and lifted from the rejected, and the rejected raging in his emptiness.'),
    ('canon','1-samuel',18,14,'canon','1-samuel',16,18,'free',
     E'*Behold, I have seen a son of Jesse the Beth-lehemite, that is cunning in playing, and a mighty valiant man, and a man of war, and prudent in matters, and a comely person, and Yahuah (LORD) is with him* (1 Samuel 16:18). The servant''s testimony is now plain history: *David behaved himself wisely in all his ways; and Yahuah (LORD) was with him* (1 Samuel 18:14) — the favour foreseen at his summons proven in every step.'),
    ('canon','1-samuel',18,14,'canon','psalms',37,1,'free',
     E'*Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity* (Psalm 37:1). David, prospered while Saul rages, walks the very counsel of the Psalm: *David behaved himself wisely in all his ways; and Yahuah (LORD) was with him* (1 Samuel 18:14), not avenging himself on the king but trusting the Presence — for *the workers of iniquity... shall soon be cut down like the grass* (Psalm 37:1-2).'),
    ('canon','1-samuel',18,28,'canon','psalms',37,32,'free',
     E'*The wicked watcheth the righteous, and seeketh to slay him. Yahuah (LORD) will not leave him in his hand, nor condemn him when he is judged* (Psalm 37:32-33). *And Saul saw and knew that Yahuah (LORD) was with David... And Saul was yet the more afraid of David; and Saul became David''s enemy continually* (1 Samuel 18:28-29) is that scene exactly — the wicked king watching to slay, the righteous kept because Yahuah will not leave him in his enemy''s hand.'),
    ('canon','1-samuel',18,29,'canon','psalms',37,32,'free',
     E'*The wicked watcheth the righteous, and seeketh to slay him. Yahuah (LORD) will not leave him in his hand* (Psalm 37:32-33). *Saul became David''s enemy continually* (1 Samuel 18:29): the continual enmity is the watching wickedness of the Psalm, and David''s safety is not his own arm but the promise that Yahuah will not abandon the righteous to the hand that hunts him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love',
  E'The soul of Jonathan knit to David''s soul — covenant-love that lays down its right',
  E'No sooner has David answered Saul than the deepest bond in the book is forged: *the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1), *and Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3). This is the friend the proverb names: *there is a friend that sticketh closer than a brother* (Proverbs 18:24). And it is no mere affection — Jonathan enacts it: *Jonathan stripped himself of the robe that was upon him, and gave it to David, and his garments, even to his sword, and to his bow, and to his girdle* (1 Samuel 18:4). The king''s own son and heir hands over the insignia of the prince to the shepherd Yahuah has anointed, laying down his own right of succession. It is the love the Formed Son names as the highest: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). And it is the very measure 1 John sets among the brethren: *he laid down his life for us: and we ought to lay down our lives for the brethren* (1 John 3:16). Jonathan honours the anointed of Yahuah over his own throne — covenant-love that yields its right, conduct and not blood, the brother nearer than a brother.',
  sv.verse_id, ev.verse_id, 'free', 36825
  FROM _s340_1sa18_lookup sv, _s340_1sa18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder',
  E'Saul hath slain his thousands — the envy of the elder against the chosen younger',
  E'The women come out singing, *Saul hath slain his thousands, and David his ten thousands* (1 Samuel 18:7), and the song lights the fuse: *Saul was very wroth, and the saying displeased him; and he said... what can he have more but the kingdom? And Saul eyed David from that day and forward* (1 Samuel 18:8-9). This is an old enmity. It is the same envy that turned a household against the chosen son: *his brethren envied him; but his father observed the saying* (Genesis 37:11) — Joseph hated for the favour upon him, as David is now eyed for the favour upon him. And it is the enmity 1 John traces to its first murder: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Envy does not stay in the eye; it reaches for the spear: *Saul cast the javelin; for he said, I will smite David even to the wall with it* (1 Samuel 18:11). The wicked rises against the righteous precisely because the righteous prospers — the seed-war pattern (Genesis 3:15) run through conduct, never ethnicity. Psalm 37 sees the whole scene and answers it: *The wicked plotteth against the just, and gnasheth upon him with his teeth. Yahuah (Lord) shall laugh at him: for he seeth that his day is coming* (Psalm 37:12-13). Saul is the rejected king consumed by his own jealousy — a victim of the lie he will not let go, not an enemy to be despised but a soul that has lost the Presence.',
  sv.verse_id, ev.verse_id, 'free', 36828
  FROM _s340_1sa18_lookup sv, _s340_1sa18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-18-yahuah-was-with-david-the-chosen-prospered',
  E'Yahuah was with David — the chosen prospered while the rejected rages',
  E'Three times the chapter names the secret of David''s rise: *Saul was afraid of David, because Yahuah (LORD) was with him, and was departed from Saul* (1 Samuel 18:12); *David behaved himself wisely in all his ways; and Yahuah (LORD) was with him* (1 Samuel 18:14); *And Saul saw and knew that Yahuah (LORD) was with David* (1 Samuel 18:28). It is the harvest of the anointing two chapters back: *Samuel took the horn of oil, and anointed him... and the Spirit of Yahuah (LORD) came upon David from that day forward. But the Spirit of Yahuah (LORD) departed from Saul, and an evil spirit from Yahuah (LORD) troubled him* (1 Samuel 16:13-14). What the servant foresaw at David''s summons — *a mighty valiant man, and a man of war... and Yahuah (LORD) is with him* (1 Samuel 16:18) — is now the plain record of his every step. And so the chapter is the living portrait of Psalm 37: *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity... for they shall soon be cut down like the grass* (Psalm 37:1-2). David does not raise his hand against the king; he behaves wisely and trusts the Presence, while *Saul became David''s enemy continually* (1 Samuel 18:29). The Psalm names the very danger and the very safety: *The wicked watcheth the righteous, and seeketh to slay him. Yahuah (LORD) will not leave him in his hand, nor condemn him when he is judged* (Psalm 37:32-33). The chosen one prospers not by his own arm but because Yahuah is with him; the rejected one rages because the Presence has departed.',
  sv.verse_id, ev.verse_id, 'free', 36831
  FROM _s340_1sa18_lookup sv, _s340_1sa18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=18 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- Thread 1 members (verbose per-row form)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 18:24 — *there is a friend that sticketh closer than a brother:* the soul of Jonathan knit to David, nearer than blood.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=1
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Proverbs 18:24 — *a friend that sticketh closer than a brother:* the covenant of verse 3 seals the closer-than-a-brother bond before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 15:13 — *Greater love hath no man than this, that a man lay down his life for his friends:* Jonathan''s covenant lays down his right of succession.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=3
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 15:13 — *lay down his life for his friends:* the stripped robe, sword, bow and girdle (18:4) are the prince''s life enacted toward his friend.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 John 3:16 — *he laid down his life for us: and we ought to lay down our lives for the brethren:* the measure of love Jonathan''s self-giving foreshadows.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-the-soul-of-jonathan-knit-to-davids-soul-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members (verbose per-row form)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 37:11 — *his brethren envied him:* Saul wroth at the song (18:8) is the envy that turned Joseph''s house against the favoured.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=8
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 37:11 — *his brethren envied him:* Saul eyeing David from that day forward (18:9) is the same fixed jealousy upon the chosen younger.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=9
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 37:12 — *The wicked plotteth against the just, and gnasheth upon him with his teeth:* Saul''s eyeing answered by Yahuah laughing at his coming day (37:13).'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=9
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 John 3:12 — *Cain... slew his brother... because his own works were evil, and his brother''s righteous:* the javelin (18:11) is envy ripened to Cain''s murder.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-saul-hath-slain-his-thousands-the-envy-of-the-elder'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members (verbose per-row form)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 16:13 — *the Spirit of Yahuah (LORD) came upon David from that day forward:* the Presence Saul now dreads (18:12) is the anointing-Spirit.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 16:14 — *the Spirit of Yahuah (LORD) departed from Saul:* the other half of 18:12 — the Presence lifted from the rejected king.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 16:18 — *a mighty valiant man, and a man of war... and Yahuah (LORD) is with him:* the servant''s foresight now plain history (18:14).'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 37:1 — *Fret not thyself because of evildoers, neither be thou envious:* David behaving wisely (18:14) walks the Psalm''s counsel, not avenging himself.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 37:32 — *The wicked watcheth the righteous, and seeketh to slay him. Yahuah (LORD) will not leave him in his hand:* Saul knowing Yahuah is with David (18:28).'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=28
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 37:32 — *the wicked watcheth the righteous, and seeketh to slay him:* Saul David''s enemy continually (18:29), yet the righteous not left in his hand.'
  FROM cross_reference_threads t
  JOIN _s340_1sa18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=18 AND sv.verse_number=29
  JOIN _s340_1sa18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-18-yahuah-was-with-david-the-chosen-prospered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_19.sql (1 Samuel 19) -----
-- Chapter: 1 Samuel 19  | Tag: 1sa19 | View: _s340_1sa19_lookup
-- Sort band: base 36850, step 3 -> 36850, 36853, 36856, 36859
--
-- FRAME: the hated-without-a-cause innocent (David, the anointed-but-not-yet-throned)
-- preserved by Yahuah's hand; the innocent advocate (Jonathan) pleading for the persecuted;
-- Yahuah Himself restraining the persecutor by His own Spirit. David is the Davidic-king type
-- of the Formed Son hated without a cause (Ps 69:4 / John 15:25). The Spirit of Elohim coming
-- on Saul's messengers and on Saul is the Father's Ruach restraining the murderer's hand —
-- NOT a co-equal trinitarian person, NOT a created Arian agent: the Spirit of Elohim of the
-- Most High overruling the persecutor's intent.
--
-- 1 Samuel 19 coverage:
--   v.1-7 (Saul commands David's death; Jonathan intercedes, the advocate's plea):
--        NT:     John 15:13 (greater love, lay down life for friends); 1 John 3:11-12 (Cain
--                slew brother whose works were righteous — the innocent-blood war)
--        Extras: none warranted
--        Tanakh: Proverbs 21:1 (king's heart in Yahuah's hand); Proverbs 21:3 (justice more
--                acceptable than sacrifice — Jonathan's plea over Saul's vow)
--   v.8-10 (war again; evil spirit; javelin at the wall; David escapes):
--        NT:     Matthew 5:11 (reviled and persecuted falsely for righteousness)
--        Extras: none warranted
--        Tanakh: woven into the without-a-cause thread (slay David without a cause, v.5)
--   v.11-17 (messengers watch the house; Michal lets David down the window, the image in bed):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 59:2-3 (deliver me from bloody men; they lie in wait for my soul; not
--                for my transgression) — the psalm of this very night
--   v.18-24 (David flees to Samuel at Naioth; the Spirit of Elohim on the messengers and on
--            Saul; Is Saul also among the prophets — the second time):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 10:6,10-11 (the FIRST time the Spirit came on Saul / the proverb);
--                Psalm 59:11 (slay them not, lest my people forget — restraint over the enemy)
--
-- THREADS (slug -> target libraries):
--   1-samuel-19-let-not-the-king-sin-against-innocent-blood   [canon NT + canon Tanakh] — free
--   1-samuel-19-they-hated-david-without-a-cause              [canon NT + canon Tanakh] — free
--   1-samuel-19-they-watched-the-house-to-kill-him            [canon Tanakh] — free
--   1-samuel-19-is-saul-also-among-the-prophets              [canon Tanakh] — free
--
-- CONTESTED/LOAD-BEARING: 19:20,23 "the Spirit of Elohim was upon" Saul's messengers and Saul
-- framed as the FATHER'S Ruach restraining the persecutor (NOT trinity, NOT Arian agent) —
-- Yahuah overruling the murderer's intent. Ps 59 (superscription "when Saul sent, and they
-- watched the house to kill him") has NO superscription verse in this parse (v.1 = "Deliver me");
-- anchored to vv.2-3,11 which carry the same lie-in-wait / not-for-my-transgression weight.

CREATE TEMP VIEW _s340_1sa19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the advocate's plea for innocent blood (19:4-6)
    ('canon','1-samuel',19,4,'canon','john',15,13,'free',
      E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan, the king''s own son and heir, stands beside his father in the field to plead for the hunted David — *Let not the king sin against his servant, against David; because he hath not sinned against thee, and because his works have been to thee-ward very good* (1 Samuel 19:4). The innocent advocate who risks himself for the persecuted is the very love the Formed Son names as greatest, and which he himself fulfilled.'),
    ('canon','1-samuel',19,4,'canon','proverbs',21,3,'free',
      E'*To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). Jonathan''s plea — *because he hath not sinned against thee* (1 Samuel 19:4) — sets the right judgment of innocent blood above the king''s murderous vow; what Yahuah requires is the justice Jonathan speaks, not the sin Saul intends.'),
    ('canon','1-samuel',19,5,'canon','1-john',3,12,'free',
      E'*Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). Jonathan names the same seed-war exactly: *wherefore then wilt thou sin against innocent blood, to slay David without a cause?* (1 Samuel 19:5). The murderer hates the righteous because his own works are evil — Saul seeking innocent blood is Cain''s line; David, whose *works have been to thee-ward very good*, is Abel''s.'),
    ('canon','1-samuel',19,6,'canon','proverbs',21,1,'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). When *Saul hearkened unto the voice of Jonathan: and Saul sware, As Yahuah (LORD) liveth, he shall not be slain* (1 Samuel 19:6), the murderer''s heart is turned aside by the advocate''s word — Yahuah''s hand on the king''s heart, restraining for a season the death he had decreed.'),
    -- THREAD 2: they hated David without a cause (19:5, 9-10)
    ('canon','1-samuel',19,5,'canon','psalms',69,4,'free',
      E'*They that hate me without a cause are more than the hairs of mine head: they that would destroy me, being mine enemies wrongfully, are mighty: then I restored that which I took not away* (Psalm 69:4). Jonathan''s very charge — *to slay David without a cause* (1 Samuel 19:5) — is the cry of the hated-without-a-cause righteous one, the Davidic sufferer whose persecution runs forward to the Formed Son.'),
    ('canon','1-samuel',19,5,'canon','john',15,25,'free',
      E'*But this cometh to pass, that the word might be fulfilled that is written in their law, They hated me without a cause* (John 15:25). The Formed Son names the persecution David first bore: David is hunted *without a cause* (1 Samuel 19:5) though *his works have been to thee-ward very good*, just as the Son is hated though *I had not done among them the works which none other man did* — the innocent-righteous hated for his very righteousness.'),
    ('canon','1-samuel',19,10,'canon','matthew',5,11,'free',
      E'*Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11). When *Saul sought to smite David even to the wall with the javelin... and David fled, and escaped that night* (1 Samuel 19:10), the anointed one is persecuted falsely — the blessing of the persecuted-for-righteousness rests on the man hunted without a cause.'),
    -- THREAD 3: they watched the house to kill him (19:11-12)
    ('canon','1-samuel',19,11,'canon','psalms',59,2,'free',
      E'*Deliver me from the workers of iniquity, and save me from bloody men* (Psalm 59:2). This is the very psalm of this night, *when Saul sent, and they watched the house to kill him*: *Saul also sent messengers unto David''s house, to watch him, and to slay him in the morning* (1 Samuel 19:11). David''s cry against the bloody men set round the house is preserved here as a song.'),
    ('canon','1-samuel',19,11,'canon','psalms',59,3,'free',
      E'*For, lo, they lie in wait for my soul: the mighty are gathered against me; not for my transgression, nor for my sin, O Yahuah (LORD)* (Psalm 59:3). The watchers *to slay him in the morning* (1 Samuel 19:11) lie in wait against a man who has done no wrong — *not for my transgression, nor for my sin* — the same innocent-without-a-cause that Jonathan declared.'),
    ('canon','1-samuel',19,12,'canon','psalms',34,19,'free',
      E'*Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19). *So Michal let David down through a window: and he went, and fled, and escaped* (1 Samuel 19:12) — the righteous one ringed by killers is delivered out of the affliction, Yahuah''s hand bringing him through the window into the night.'),
    -- THREAD 4: is Saul also among the prophets — the Spirit restrains the persecutor (19:20-24)
    ('canon','1-samuel',19,20,'canon','psalms',59,11,'free',
      E'*Slay them not, lest my people forget: scatter them by thy power; and bring them down, O Yahuah (Lord) our shield* (Psalm 59:11). When *the Spirit of Elohim (God) was upon the messengers of Saul, and they also prophesied* (1 Samuel 19:20), Yahuah does not slay the persecutors but disarms them — the very mercy David sings, the enemy''s hand stayed and scattered rather than struck down.'),
    ('canon','1-samuel',19,23,'canon','1-samuel',10,6,'free',
      E'*And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6). The Spirit that once made Saul a prophet at his anointing now comes upon him a second time — *the Spirit of Elohim (God) was upon him also, and he went on, and prophesied* (1 Samuel 19:23) — the Father''s Ruach overruling even the murderer, that he cannot reach David that day.'),
    ('canon','1-samuel',19,24,'canon','1-samuel',10,11,'free',
      E'*And it came to pass, when all that knew him beforetime saw that, behold, he prophesied among the prophets, then the people said one to another, What is this that is come unto the son of Kish? Is Saul also among the prophets?* (1 Samuel 10:11). The proverb first born at the beginning of Saul''s reign returns at its unravelling — *Wherefore they say, Is Saul also among the prophets?* (1 Samuel 19:24) — the same wonder, now the Spirit restraining the persecutor rather than commissioning the king.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-19-let-not-the-king-sin-against-innocent-blood',
  E'Let not the king sin against innocent blood — the advocate''s plea',
  E'Saul *spake to Jonathan his son, and to all his servants, that they should kill David* (1 Samuel 19:1) — the king openly decrees the death of the man who served him. But the king''s own son and heir stands between: *Jonathan spake good of David unto Saul his father, and said unto him, Let not the king sin against his servant, against David; because he hath not sinned against thee, and because his works have been to thee-ward very good* (19:4). This is the innocent advocate pleading for the persecuted — *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3) — and the love the Formed Son named as greatest: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan names the war exactly: *wherefore then wilt thou sin against innocent blood, to slay David without a cause?* (1 Samuel 19:5) — and the apostle traces it back to the first murder: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous* (1 John 3:12). For a season the plea prevails: *Saul hearkened unto the voice of Jonathan: and Saul sware, As Yahuah (LORD) liveth, he shall not be slain* (19:6), for *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1).',
  sv.verse_id, ev.verse_id, 'free', 36850
  FROM _s340_1sa19_lookup sv, _s340_1sa19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=19 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-19-they-hated-david-without-a-cause',
  E'They hated David without a cause',
  E'Jonathan''s charge against his father is the hinge of the whole chapter: *wherefore then wilt thou sin against innocent blood, to slay David without a cause?* (1 Samuel 19:5). David had *put his life in his hand, and slew the Philistine, and Yahuah (LORD) wrought a great salvation for all Yashar''el (Israel)* — yet for that very deliverance Saul hunts him. This is the cry of the hated-without-a-cause righteous one: *They that hate me without a cause are more than the hairs of mine head: they that would destroy me, being mine enemies wrongfully, are mighty: then I restored that which I took not away* (Psalm 69:4). The Formed Son took that same word on his own lips: *this cometh to pass, that the word might be fulfilled that is written in their law, They hated me without a cause* (John 15:25) — hated though *I had not done among them the works which none other man did*, just as David is hunted though *his works have been to thee-ward very good*. So when *Saul sought to smite David even to the wall with the javelin... and David fled, and escaped that night* (19:10), the blessing of the persecuted rests on him: *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11).',
  sv.verse_id, ev.verse_id, 'free', 36853
  FROM _s340_1sa19_lookup sv, _s340_1sa19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=19 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-19-they-watched-the-house-to-kill-him',
  E'They watched the house to kill him',
  E'*Saul also sent messengers unto David''s house, to watch him, and to slay him in the morning: and Michal David''s wife told him, saying, If thou save not thy life to night, to morrow thou shalt be slain* (1 Samuel 19:11). This is the night the fifty-ninth psalm remembers — *when Saul sent, and they watched the house to kill him* — and David''s cry against the killers ringed about him is preserved there: *Deliver me from the workers of iniquity, and save me from bloody men* (Psalm 59:2). They lie in wait against a man who has done no wrong: *For, lo, they lie in wait for my soul: the mighty are gathered against me; not for my transgression, nor for my sin, O Yahuah (LORD)* (Psalm 59:3) — the same innocence Jonathan declared. And Yahuah delivers him: *So Michal let David down through a window: and he went, and fled, and escaped* (19:12), for *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19) — the hand of Yahuah bringing the hunted one through the window into the night, past the watchers at the door.',
  sv.verse_id, ev.verse_id, 'free', 36856
  FROM _s340_1sa19_lookup sv, _s340_1sa19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=19 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-19-is-saul-also-among-the-prophets',
  E'Is Saul also among the prophets — Yahuah restrains the persecutor',
  E'David flees to Samuel at Naioth, and Saul sends killers after him — but the hunters cannot do the deed: *when they saw the company of the prophets prophesying, and Samuel standing as appointed over them, the Spirit of Elohim (God) was upon the messengers of Saul, and they also prophesied* (1 Samuel 19:20). Three waves of messengers, then the king himself, and the same Ruach overrules them all: *the Spirit of Elohim (God) was upon him also, and he went on, and prophesied, until he came to Naioth in Ramah* (19:23). This is the Father''s own Spirit restraining the persecutor''s hand — not slaying the bloody men but disarming them, the very mercy David sang: *Slay them not, lest my people forget: scatter them by thy power; and bring them down, O Yahuah (Lord) our shield* (Psalm 59:11). The Spirit that first made Saul a prophet at his anointing returns to overrule him at his unravelling: *the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6), and the old proverb is born again — *behold, he prophesied among the prophets... Is Saul also among the prophets?* (1 Samuel 10:11) — now spoken in wonder that the murderer himself lies stripped and prophesying before Samuel while David escapes unharmed (19:24).',
  sv.verse_id, ev.verse_id, 'free', 36859
  FROM _s340_1sa19_lookup sv, _s340_1sa19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=19 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13) — Jonathan the advocate risking himself for the hunted David.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-let-not-the-king-sin-against-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3) — the right judgment of innocent blood above the king''s murderous vow.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-let-not-the-king-sin-against-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Not as Cain, who was of that wicked one, and slew his brother... Because his own works were evil, and his brother''s righteous* (1 John 3:12) — Saul seeking innocent blood is Cain''s line.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-let-not-the-king-sin-against-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — Saul''s heart turned by the advocate''s word to swear David shall not be slain.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=6
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-let-not-the-king-sin-against-innocent-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*They that hate me without a cause are more than the hairs of mine head... mine enemies wrongfully* (Psalm 69:4) — the cry of the hated-without-a-cause righteous one.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-hated-david-without-a-cause'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*They hated me without a cause* (John 15:25) — the Formed Son takes David''s persecution on his own lips: hated though his works were only good.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-hated-david-without-a-cause'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed are ye, when men shall revile you, and persecute you... falsely, for my sake* (Matthew 5:11) — the javelin at the wall, the anointed one persecuted falsely.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=10
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-hated-david-without-a-cause'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Deliver me from the workers of iniquity, and save me from bloody men* (Psalm 59:2) — the psalm of this very night, when they watched the house to kill him.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=11
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=59 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-watched-the-house-to-kill-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they lie in wait for my soul... not for my transgression, nor for my sin, O Yahuah (LORD)* (Psalm 59:3) — the watchers set against an innocent man, the same innocence Jonathan declared.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=11
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=59 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-watched-the-house-to-kill-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19) — Michal lets David down the window; the righteous one delivered through the night.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=12
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-they-watched-the-house-to-kill-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Slay them not, lest my people forget: scatter them by thy power* (Psalm 59:11) — Yahuah disarms the killers rather than slaying them; the Spirit upon Saul''s messengers.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=20
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=59 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-is-saul-also-among-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy... and shalt be turned into another man* (1 Samuel 10:6) — the Spirit that first made Saul a prophet now overrules him a second time.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=23
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-is-saul-also-among-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*then the people said one to another... Is Saul also among the prophets?* (1 Samuel 10:11) — the proverb born at the start of Saul''s reign returns at its unravelling.'
  FROM cross_reference_threads t
  JOIN _s340_1sa19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=19 AND sv.verse_number=24
  JOIN _s340_1sa19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-19-is-saul-also-among-the-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_20.sql (1 Samuel 20) -----
--
-- Book/chapter: 1 Samuel 20    Tag: 1sa20    View: _s340_1sa20_lookup
-- Sort band: base 36875, step 3  ->  36875, 36878, 36881
--
-- 1 Samuel 20 coverage:
--   v.5  (To morrow is the new moon; I should not fail to sit with the king at meat) -> THREAD 1 source
--        NT:     none warranted (the appointed-time itself stands; no NT abrogation)
--        Extras: none warranted
--        Tanakh: Numbers 10:10 (in the beginnings of your months ye shall blow with the trumpets... for a memorial);
--                Numbers 28:11 (in the beginnings of your months ye shall offer a burnt offering unto Yahuah) -> THREAD 1
--   v.18 (To morrow is the new moon: thou shalt be missed, thy seat will be empty) -> THREAD 1 source
--   v.24 (when the new moon was come, the king sat him down to eat meat) -> THREAD 1 source
--   v.27 (on the morrow, which was the second day of the month) -> THREAD 1 (the two-day feast kept)
--   v.4  (Whatsoever thy soul desireth, I will even do it for thee) -> THREAD 3 source
--   v.8  (thou hast brought thy servant into a covenant of Yahuah with thee) -> THREAD 2 source
--   v.14-15 (shew me the kindness of Yahuah... thou shalt not cut off thy kindness from my house for ever) -> THREAD 2 source
--   v.16 (So Jonathan made a covenant with the house of David) -> THREAD 2 source
--   v.17 (he loved him as he loved his own soul) -> THREAD 3 source
--   v.23 (Yahuah be between thee and me for ever) -> THREAD 2 source
--   v.30-33 (Saul's anger kindled against Jonathan; cast a javelin at him to smite him) -> THREAD 3 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 18:11 (Saul cast the javelin at David — same murderous rage); narrative, framed in prose
--   v.42 (Yahuah be between me and thee, and between my seed and thy seed for ever) -> THREAD 2 source anchor-end
--        NT:     none warranted (the everlasting covenant-loyalty kept LATERALLY in 2 Samuel)
--        Extras: none warranted
--        Tanakh: 2 Samuel 9:1 (Is there yet any left of the house of Saul, that I may shew him kindness for Jonathan's sake?);
--                2 Samuel 9:7 (I will surely shew thee kindness for Jonathan thy father's sake... eat bread at my table);
--                2 Samuel 21:7 (the king spared Mephibosheth... because of the LORD'S oath between David and Jonathan);
--                1 Samuel 18:3 (Jonathan and David made a covenant); 1 Samuel 23:18 (they two made a covenant before Yahuah) -> THREAD 2
--   THREAD 3 costly love: John 15:13 (greater love hath no man... lay down his life for his friends);
--                Proverbs 18:24 (a friend that sticketh closer than a brother);
--                1 Samuel 23:16-17 (Jonathan strengthened David's hand in Elohim: thou shalt be king, and I shall be next unto thee)
--
-- THREADS:
--   1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept (free) -> Tanakh (Numbers 10, Numbers 28)
--   1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever (free) -> Tanakh (1 Samuel 18, 1 Samuel 23, 2 Samuel 9 x2, 2 Samuel 21)
--   1-samuel-20-jonathan-loved-him-and-laid-down-his-own-crown (free) -> Tanakh (1 Samuel 23 x2) + NT (John, Proverbs)
--
-- Framework-load-bearing framing:
--   * 20:5,18,24,27 — the new moon (Rosh Chodesh) is observed here as a settled feast of Yahuah's calendar, with its
--     appointed meal and even a second day; it is NOT abolished but commanded in Torah (Numbers 10:10 the memorial-blast,
--     Numbers 28:11 the burnt offering at the beginning of every month). The appointed times stand; David and Jonathan
--     simply keep the calendar of Yahuah. Surfaced as a kept appointed-time, never a defunct ceremony.
--   * 20:14-15,23,42 — the covenant of loyal love (chesed) sworn in the Name, reaching FORWARD to *my seed and thy seed
--     for ever*; the everlasting covenant-loyalty is then kept LATERALLY to Jonathan's lame son Mephibosheth (2 Samuel 9,
--     21:7) — bread at the king's table for the sake of the oath. Seed-and-seed faithfulness, the covenant-word honoured
--     to the next generation.
--   * 20:4,17,30-33,42 — Jonathan loves the anointed though it costs him the throne (*thou shalt be king, and I shall be
--     next unto thee*, 1 Samuel 23:17); the friend who lays down his own right for his beloved, the type John 15:13 fills
--     (*a man lay down his life for his friends*) and Proverbs 18:24 names (*a friend that sticketh closer than a brother*).
--     Saul's javelin even at his own son (20:33) frames the cost in prose.

CREATE TEMP VIEW _s340_1sa20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: to morrow is the new moon — the appointed time kept
    ('canon','1-samuel',20,5,'canon','numbers',10,10,'free',
      E'*Also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets over your burnt offerings, and over the sacrifices of your peace offerings; that they may be to you for a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God)* (Numbers 10:10). When David says *to morrow is the new moon, and I should not fail to sit with the king at meat* (1 Samuel 20:5), he is keeping the very appointed-time Torah commands — *the beginnings of your months*, marked with the trumpet-memorial; the new moon is no afterthought but a feast of Yahuah''s own calendar.'),
    ('canon','1-samuel',20,5,'canon','numbers',28,11,'free',
      E'*And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot* (Numbers 28:11). The new moon David must not miss — *to morrow is the new moon* (1 Samuel 20:5) — carries its own commanded offering at *the beginnings of your months*; Rosh Chodesh stands appointed in the Torah, observed and unbroken in David''s day.'),
    ('canon','1-samuel',20,18,'canon','numbers',10,10,'free',
      E'*in the beginnings of your months, ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* (Numbers 10:10). Jonathan repeats the day-marker — *To morrow is the new moon: and thou shalt be missed, because thy seat will be empty* (1 Samuel 20:18) — the new-moon table is a fixed assembly, the empty seat conspicuous because the feast is a kept appointment.'),
    ('canon','1-samuel',20,24,'canon','numbers',28,11,'free',
      E'*And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD)* (Numbers 28:11). The narrative shows the appointed-time arriving and observed — *and when the new moon was come, the king sat him down to eat meat* (1 Samuel 20:24); the feast at *the beginnings of your months* is kept in fact, the king at his table on the day Torah set.'),
    ('canon','1-samuel',20,27,'canon','numbers',28,11,'free',
      E'*And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD)* (Numbers 28:11). The feast runs on into a second day — *it came to pass on the morrow, which was the second day of the month* (1 Samuel 20:27) — the new moon kept with care across its days, the appointed-time of Yahuah honoured, never treated as abolished.'),

    -- THREAD 2: Yahuah between my seed and thy seed for ever — the covenant of loyal love
    ('canon','1-samuel',20,8,'canon','1-samuel',18,3,'free',
      E'*Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3). David appeals to that earlier bond — *thou hast brought thy servant into a covenant of Yahuah (LORD) with thee* (1 Samuel 20:8); the love of one soul for another has already been sealed as a covenant in the Name, and David pleads it as binding.'),
    ('canon','1-samuel',20,14,'canon','2-samuel',9,1,'free',
      E'*And David said, Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1). Jonathan asks the covenant forward — *thou shalt... shew me the kindness of Yahuah (LORD), that I die not* (1 Samuel 20:14) — and years later, with Jonathan dead, David seeks out his house to keep it: *for Jonathan''s sake*, the loyal love (chesed) reaches past the grave to the next generation.'),
    ('canon','1-samuel',20,15,'canon','2-samuel',9,7,'free',
      E'*And David said unto him, Fear not: for I will surely shew thee kindness for Jonathan thy father''s sake, and will restore thee all the land of Saul thy father; and thou shalt eat bread at my table continually* (2 Samuel 9:7). Jonathan''s plea — *thou shalt not cut off thy kindness from my house for ever* (1 Samuel 20:15) — is answered to the letter: lame Mephibosheth eats at the king''s table for ever, the covenant-kindness uncut to the house.'),
    ('canon','1-samuel',20,16,'canon','2-samuel',21,7,'free',
      E'*But the king spared Mephibosheth, the son of Jonathan the son of Saul, because of the LORD''S oath that was between them, between David and Jonathan the son of Saul* (2 Samuel 21:7). When seven of Saul''s house are given to the Gibeonites, the oath *Jonathan made... with the house of David* (1 Samuel 20:16) shields Jonathan''s son alone; the covenant sworn in the Name holds even amid judgment on the rest of the house.'),
    ('canon','1-samuel',20,23,'canon','1-samuel',23,18,'free',
      E'*And they two made a covenant before Yahuah (LORD): and David abode in the wood, and Jonathan went to his house* (1 Samuel 23:18). The matter sealed here — *Yahuah (LORD) be between thee and me for ever* (1 Samuel 20:23) — is renewed once more in the wilderness wood; twice and again the two bind themselves *before Yahuah*, the bond made in His presence, not in private sentiment.'),
    ('canon','1-samuel',20,42,'canon','2-samuel',9,7,'free',
      E'*I will surely shew thee kindness for Jonathan thy father''s sake... and thou shalt eat bread at my table continually* (2 Samuel 9:7). The parting oath — *Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever* (1 Samuel 20:42) — names the seed of both men; David keeps it to Jonathan''s seed, seating the dead friend''s son at his own table, the covenant-word honoured to the generation that follows.'),
    ('canon','1-samuel',20,42,'canon','2-samuel',21,7,'free',
      E'*But the king spared Mephibosheth... because of the LORD''S oath that was between them, between David and Jonathan* (2 Samuel 21:7). *Between my seed and thy seed for ever* (1 Samuel 20:42) is the very oath remembered when judgment falls; David''s loyalty to Jonathan''s seed is the reason one son of the house is spared — the everlasting covenant kept across the years.'),

    -- THREAD 3: Jonathan loved him, and laid down his own crown
    ('canon','1-samuel',20,4,'canon','john',15,13,'free',
      E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan''s open pledge — *Whatsoever thy soul desireth, I will even do it for thee* (1 Samuel 20:4) — is love that withholds nothing for the beloved; he spends himself, and his own crown, for David, the friend-love the Formed Son names as the greatest, the laying-down of one''s own for another.'),
    ('canon','1-samuel',20,17,'canon','proverbs',18,24,'free',
      E'*A man that hath friends must shew himself friendly: and there is a friend that sticketh closer than a brother* (Proverbs 18:24). The text twice says it — *for he loved him as he loved his own soul* (1 Samuel 20:17); Jonathan is the proverb made flesh, a friend who cleaves nearer than blood, loyal to David against his own father and his own throne.'),
    ('canon','1-samuel',20,17,'canon','1-samuel',23,17,'free',
      E'*And he said unto him, Fear not: for the hand of Saul my father shall not find thee; and thou shalt be king over Yashar''el (Israel), and I shall be next unto thee; and that also Saul my father knoweth* (1 Samuel 23:17). The love that loves *as he loved his own soul* (1 Samuel 20:17) costs Jonathan the very kingdom — he gladly takes second place to the anointed: *thou shalt be king... and I shall be next unto thee*; the heir lays down his own right for love of the one Yahuah chose.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept', E'To morrow is the new moon — the appointed time kept', E'The whole stratagem of this chapter turns on a feast of Yahuah''s calendar. *And David said unto Jonathan, Behold, to morrow is the new moon, and I should not fail to sit with the king at meat* (1 Samuel 20:5). The new moon — Rosh Chodesh, the head of the month — is a fixed assembly with an appointed table; David''s absence will be conspicuous precisely because the day is kept. Jonathan says it again: *To morrow is the new moon: and thou shalt be missed, because thy seat will be empty* (1 Samuel 20:18). And it comes: *when the new moon was come, the king sat him down to eat meat* (1 Samuel 20:24), and the feast runs on — *it came to pass on the morrow, which was the second day of the month* (1 Samuel 20:27).\n\nThis is no human custom but a commanded appointed-time. Torah sets the new moon among Yahuah''s solemn days: *in the beginnings of your months, ye shall blow with the trumpets over your burnt offerings... that they may be to you for a memorial before your Elohim (God): I am Yahuah Elohaychem (the LORD your God)* (Numbers 10:10). It carries its own offering: *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot* (Numbers 28:11). The calendar of Yahuah is not a defunct ceremony to be left behind — it is kept here in fact, the king at his table, the feast observed across its days. Where the appointed times appear, they stand.',
       sv.verse_id, ev.verse_id, 'free', 36875
  FROM _s340_1sa20_lookup sv, _s340_1sa20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=20 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever', E'Yahuah between my seed and thy seed for ever', E'In the field Jonathan and David bind themselves in loyal love sworn in the Name. David pleads the bond already made: *thou hast brought thy servant into a covenant of Yahuah (LORD) with thee* (1 Samuel 20:8) — the covenant first cut when *Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3), and renewed again in the wood: *they two made a covenant before Yahuah (LORD)* (1 Samuel 23:18). Jonathan reaches it forward past his own life: *thou shalt not cut off thy kindness from my house for ever* (1 Samuel 20:15), *Yahuah (LORD) be between thee and me for ever* (1 Samuel 20:23). And at the parting the oath names the seed of both men: *Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever* (1 Samuel 20:42).\n\nThe covenant-word is honoured to the next generation. Years later, with Jonathan slain, David seeks out his house: *Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1), and to lame Mephibosheth he says, *I will surely shew thee kindness for Jonathan thy father''s sake... and thou shalt eat bread at my table continually* (2 Samuel 9:7) — the kindness *not cut off from my house for ever* made good to the letter. Even under judgment the oath holds: *the king spared Mephibosheth... because of the LORD''S oath that was between them, between David and Jonathan* (2 Samuel 21:7). This is chesed, loyal covenant-love sworn before Yahuah and kept to the seed — the covenant-word, not sentiment, binding one house to another across the generations.',
       sv.verse_id, ev.verse_id, 'free', 36878
  FROM _s340_1sa20_lookup sv, _s340_1sa20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=20 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-20-jonathan-loved-him-and-laid-down-his-own-crown', E'Jonathan loved him, and laid down his own crown', E'Jonathan''s love for David is the love that withholds nothing, even the throne. He opens himself entirely: *Whatsoever thy soul desireth, I will even do it for thee* (1 Samuel 20:4). The text says twice why — *because he loved him: for he loved him as he loved his own soul* (1 Samuel 20:17). And the cost is plain: Saul, raging that *thou hast chosen the son of Jesse to thine own confusion* (1 Samuel 20:30), *cast a javelin at him to smite him* (1 Samuel 20:33) — the murderous spear thrown even at his own son. Jonathan stands with the anointed against his father and against his own crown.\n\nHe says so without a trace of grasping: *thou shalt be king over Yashar''el (Israel), and I shall be next unto thee* (1 Samuel 23:17) — the heir gladly steps down for the one Yahuah chose. This is the friend Proverbs names: *there is a friend that sticketh closer than a brother* (Proverbs 18:24) — nearer than blood, for Jonathan cleaves to David against his own kin. And it is the very love the Formed Son names as the greatest: *Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13). Jonathan lays down his right, his throne, and at last his safety, for love of David — the friend who spends himself, and his own crown, for his beloved.',
       sv.verse_id, ev.verse_id, 'free', 36881
  FROM _s340_1sa20_lookup sv, _s340_1sa20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=20 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1: the new moon kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*in the beginnings of your months, ye shall blow with the trumpets... for a memorial before your Elohim (God)* (Numbers 10:10) — the new moon a commanded memorial-feast, kept at *to morrow is the new moon*.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD)* (Numbers 28:11) — Rosh Chodesh carries its own commanded offering; the feast David must not miss.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in the beginnings of your months, ye shall blow with the trumpets... for a memorial* (Numbers 10:10) — the new-moon table a fixed assembly; the empty seat conspicuous because the feast is kept.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD)* (Numbers 28:11) — the appointed-time arrives and is observed: *when the new moon was come, the king sat him down to eat meat*.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=24
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD)* (Numbers 28:11) — the feast kept into *the second day of the month*; the appointed-time of Yahuah honoured across its days.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=27
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-to-morrow-is-the-new-moon-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: between my seed and thy seed for ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3) — the bond David now pleads as *a covenant of Yahuah*, first sealed in love.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1) — the kindness Jonathan asked forward, sought out years later for his sake.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=14
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt eat bread at my table continually* (2 Samuel 9:7) — *thou shalt not cut off thy kindness from my house for ever* answered to the letter for lame Mephibosheth.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=15
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the king spared Mephibosheth... because of the LORD''S oath that was between them, between David and Jonathan* (2 Samuel 21:7) — the covenant *with the house of David* shielding Jonathan''s son amid judgment.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=16
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And they two made a covenant before Yahuah (LORD)* (1 Samuel 23:18) — *Yahuah be between thee and me for ever* renewed in the wood; the bond made in His presence.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=23
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=23 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*thou shalt eat bread at my table continually* (2 Samuel 9:7) — *between my seed and thy seed for ever* kept: Jonathan''s son seated at David''s own table.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=42
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the king spared Mephibosheth... because of the LORD''S oath* (2 Samuel 21:7) — *between my seed and thy seed for ever* is the very oath remembered when judgment falls on the house.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=42
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=21 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-yahuah-between-my-seed-and-thy-seed-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Jonathan loved him, and laid down his own crown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Greater love hath no man than this, that a man lay down his life for his friends* (John 15:13) — *Whatsoever thy soul desireth, I will even do it for thee*: love that withholds nothing, the friend-love the Formed Son names greatest.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-jonathan-loved-him-and-laid-down-his-own-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there is a friend that sticketh closer than a brother* (Proverbs 18:24) — *he loved him as he loved his own soul*: Jonathan the proverb made flesh, cleaving nearer than blood.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-jonathan-loved-him-and-laid-down-his-own-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt be king over Yashar''el (Israel), and I shall be next unto thee* (1 Samuel 23:17) — the love that loves as his own soul costs Jonathan the throne; the heir gladly takes second place.'
  FROM cross_reference_threads t
  JOIN _s340_1sa20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s340_1sa20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=23 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-20-jonathan-loved-him-and-laid-down-his-own-crown'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_21.sql (1 Samuel 21) -----
--
-- Book/chapter: 1 Samuel 21    Tag: 1sa21    View: _s340_1sa21_lookup
-- Sort band: base 36900, step 3  ->  36900, 36903, 36906, 36909
--
-- 1 Samuel 21 coverage:
--   v.4  (There is no common bread under mine hand, but there is hallowed bread) -> THREAD 1 source
--        NT:     Matthew 12:3-4; Mark 2:25-26; Luke 6:3-4 (Have ye not read what David did... did eat the shewbread)
--        Extras: none warranted
--        Tanakh: Leviticus 24:9 (it shall be Aaron's and his sons'; they shall eat it in the holy place); Exodus 25:30 -> THREAD 1
--   v.6  (the priest gave him hallowed bread: for there was no bread there but the shewbread) -> THREAD 1 source
--        NT:     Matthew 12:4; Mark 2:26; Luke 6:4 (which was not lawful for him to eat... but only for the priests)
--        Extras: none warranted
--        Tanakh: Leviticus 24:9; Exodus 25:30 (thou shalt set upon the table shewbread before me alway); Matthew 12:7->Hosea 6:6 -> THREAD 1
--   v.7  (a certain man of the servants of Saul was there that day... Doeg, an Edomite) -> THREAD 4 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 22:9 (Then answered Doeg the Edomite... I saw the son of Jesse coming to Nob);
--                1 Samuel 22:18 (Doeg the Edomite turned, and he fell upon the priests... fourscore and five) -> THREAD 4
--   v.9  (The sword of Goliath... there is none like that; give it me) -> THREAD 2 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 17:50 (David prevailed... but there was no sword in the hand of David);
--                1 Samuel 17:51 (David... took his sword... and cut off his head therewith) -> THREAD 2
--   v.10-11 (fled... to Achish the king of Gath; Saul hath slain his thousands, and David his ten thousands) -> narrative, framed in prose under THREAD 3
--   v.12 (David laid up these words in his heart, and was sore afraid of Achish) -> THREAD 3 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 34:4 (I sought Yahuah, and he... delivered me from all my fears) -> THREAD 3
--   v.13 (he changed his behaviour before them, and feigned himself mad in their hands) -> THREAD 3 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 34:6 (This poor man cried, and Yahuah heard him, and saved him);
--                Psalm 34:19 (Many are the afflictions of the righteous: but Yahuah delivereth him out of them all) -> THREAD 3
--                (Psalm 34 superscription is precisely *when he changed his behaviour before Abimelech* — this very escape from Gath)
--   v.1-3,5,8,14-15 -> narrative connective (Ahimelech's fear, the errand, Achish's dismissal); carried in prose, no separate add warranted
--
-- THREADS:
--   1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice (free) -> Tanakh (Leviticus 24 x2, Exodus 25 x2, Hosea 6) + NT (Matthew 12 x3, Mark 2, Luke 6 x2)
--   1-samuel-21-the-sword-of-goliath-there-is-none-like-that (free) -> Tanakh (1 Samuel 17 x2)
--   1-samuel-21-he-feigned-himself-mad-and-yahuah-delivered-him (free) -> Tanakh (Psalm 34 x3)
--   1-samuel-21-doeg-the-edomite-was-there-that-day (free) -> Tanakh (1 Samuel 22 x2)
--
-- Framework-load-bearing framing:
--   * 21:4-6 — THE KEYSTONE. David eats the hallowed shewbread, lawful by Torah only for the priests
--     (*it shall be Aaron's and his sons'; and they shall eat it in the holy place*, Leviticus 24:9;
--     *thou shalt set upon the table shewbread before me alway*, Exodus 25:30). The Formed Son cites this very
--     act THREE times (Matthew 12:3-4; Mark 2:25-26; Luke 6:3-4) to vindicate mercy and necessity as the HEART
--     of the Torah, sealing it *I will have mercy, and not sacrifice* (Matthew 12:7, quoting Hosea 6:6) and
--     *the Son of Adam is Yahuah even of the sabbath* (Matthew 12:8). This is NOT the Torah abolished — the bread,
--     the priesthood, the Sabbath all stand; it is the weightier matter of the Torah (mercy, the preserving of life)
--     honoured ABOVE ritual rigor, the Lawgiver Himself reading His own Law rightly. Framed as Torah upheld at its heart,
--     never as Torah set aside.
--   * 21:9 — David takes the sword of Goliath, the trophy of the day *there was no sword in the hand of David*
--     (1 Samuel 17:50); the giant-slayer's own weapon, *there is none like that*, returns to his hand in his exile.
--   * 21:12-13 — David feigns madness before Achish; Psalm 34's superscription names this very deliverance, and the
--     Psalm sings it: *I sought Yahuah (LORD)... and delivered me from all my fears* (34:4), *Many are the afflictions
--     of the righteous: but Yahuah (LORD) delivereth him out of them all* (34:19) — the fugitive's fear answered by the
--     Deliverer; bound LATERALLY to the Psalm that grew out of this hour.
--   * 21:7 — Doeg the Edomite stands by; the seed of Esau watching, who will become the informer and the slaughterer
--     of the priests of Yahuah at Nob (1 Samuel 22:9,18). The quiet menace set here is bound forward to the bloodshed
--     it births in the next chapter — narrative-lateral, victims (the priests) marked, the system of Saul's murderous
--     rage named, never a people condemned.

CREATE TEMP VIEW _s340_1sa21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: David ate the shewbread — mercy, and not sacrifice
    ('canon','1-samuel',21,4,'canon','leviticus',24,9,'free',
      E'*And it shall be Aaron''s and his sons''; and they shall eat it in the holy place: for it is most holy unto him of the offerings of Yahuah (LORD) made by fire by a perpetual statute* (Leviticus 24:9). The priest''s answer — *there is no common bread under mine hand, but there is hallowed bread* (1 Samuel 21:4) — points straight at this bread, the twelve loaves set in order *by an everlasting covenant* (Leviticus 24:8) and reserved by Torah to Aaron''s sons alone; David, no priest, is about to be given it.'),
    ('canon','1-samuel',21,4,'canon','exodus',25,30,'free',
      E'*And thou shalt set upon the table shewbread before me alway* (Exodus 25:30). The *hallowed bread* (1 Samuel 21:4) is the shewbread of the sanctuary table, the bread of the Presence set before Yahuah continually; the priest weighs whether the fugitive may eat what stands in the holy place before the face of Elohim.'),
    ('canon','1-samuel',21,4,'canon','matthew',12,3,'free',
      E'*But he said unto them, Have ye not read what David did, when he was an hungred, and they that were with him* (Matthew 12:3). The Formed Son Himself recalls this hour — the hungry David at Nob — to teach His accusers the heart of the Torah; *what David did* (1 Samuel 21) becomes His proof that necessity and mercy are no breach of the Law but its very weight.'),
    ('canon','1-samuel',21,6,'canon','leviticus',24,9,'free',
      E'*And it shall be Aaron''s and his sons''; and they shall eat it in the holy place: for it is most holy unto him of the offerings of Yahuah (LORD) made by fire by a perpetual statute* (Leviticus 24:9). *So the priest gave him hallowed bread: for there was no bread there but the shewbread* (1 Samuel 21:6) — the very loaves Torah reserves to the priesthood are handed to David in his need; the statute stands, yet life is preserved, and the priest does not sin in the giving.'),
    ('canon','1-samuel',21,6,'canon','exodus',25,30,'free',
      E'*And thou shalt set upon the table shewbread before me alway* (Exodus 25:30). The bread the priest gives — *the shewbread, that was taken from before Yahuah (LORD), to put hot bread in the day when it was taken away* (1 Samuel 21:6) — is the Presence-bread of Exodus''s table, removed on the Sabbath for fresh loaves; the loaves come down from before Yahuah to feed the hungry anointed.'),
    ('canon','1-samuel',21,6,'canon','matthew',12,4,'free',
      E'*How he entered into the house of Elohim (God), and did eat the shewbread, which was not lawful for him to eat, neither for them which were with him, but only for the priests?* (Matthew 12:4). The Formed Son names this scene exactly — David eating *the shewbread* in *the house of Elohim* — and grants it was *not lawful... but only for the priests*, yet vindicates it; the heart of the Torah, mercy and necessity, is honoured, not the Torah broken.'),
    ('canon','1-samuel',21,6,'canon','matthew',12,7,'free',
      E'*But if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). Sealing His appeal to David''s eating of *the shewbread* (1 Samuel 21:6), the Formed Son quotes Hosea — *I desired mercy, and not sacrifice* (Hosea 6:6) — the very principle by which the hungry are fed from the holy bread: the weightier matter of the Torah is mercy, and *the Son of Adam is Yahuah (Lord) even of the sabbath day* (Matthew 12:8).'),
    ('canon','1-samuel',21,6,'canon','mark',2,25,'free',
      E'*And he said unto them, Have ye never read what David did, when he had need, and was an hungred, he, and they that were with him?* (Mark 2:25). Pressed about His disciples plucking corn on the Sabbath, the Formed Son turns to *what David did* at Nob — *when he had need* — to show that need and mercy are no violation of Yahuah''s day or Yahuah''s Law, but its right reading.'),
    ('canon','1-samuel',21,6,'canon','mark',2,26,'free',
      E'*How he went into the house of Elohim (God) in the days of Abiathar the high priest, and did eat the shewbread, which is not lawful to eat but for the priests, and gave also to them which were with him?* (Mark 2:26). The Son recounts the whole act — David eating *the shewbread* and sharing it — granting it *not lawful... but for the priests*, yet just; *The sabbath was made for man, and not man for the sabbath* (Mark 2:27), and *the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:28).'),
    ('canon','1-samuel',21,6,'canon','luke',6,3,'free',
      E'*And Yahusha (Jesus) answering them said, Have ye not read so much as this, what David did, when himself was an hungred, and they which were with him* (Luke 6:3). A third Gospel preserves the appeal — *what David did, when himself was an hungred* — the hungry king at Nob the standing precedent by which the Lawgiver Himself defends mercy over rigor.'),
    ('canon','1-samuel',21,6,'canon','luke',6,4,'free',
      E'*How he went into the house of Elohim (God), and did take and eat the shewbread, and gave also to them that were with him; which it is not lawful to eat but for the priests alone?* (Luke 6:4). David *did take and eat the shewbread* and *gave also to them that were with him* — the very deed of 1 Samuel 21:6; the Formed Son closes *the Son of Adam is Yahuah (Lord) also of the sabbath* (Luke 6:5), the Lord of the Law reading His own Torah by its heart.'),

    -- THREAD 2: The sword of Goliath — there is none like that
    ('canon','1-samuel',21,9,'canon','1-samuel',17,50,'free',
      E'*So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David* (1 Samuel 17:50). The blade the priest now offers — *The sword of Goliath the Philistine, whom thou slewest in the valley of Elah* (1 Samuel 21:9) — is the giant''s own; on the day of the duel David had no sword, and now in exile that very trophy comes back to his hand.'),
    ('canon','1-samuel',21,9,'canon','1-samuel',17,51,'free',
      E'*Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith* (1 Samuel 17:51). David finished Goliath with Goliath''s own sword; *behold, it is here wrapped in a cloth behind the ephod... There is none like that; give it me* (1 Samuel 21:9) — the same blade, kept in the sanctuary as a memorial of Yahuah''s deliverance, taken up again by the fugitive king.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3: he feigned himself mad, and Yahuah delivered him (Psalm 34)
    ('canon','1-samuel',21,12,'canon','psalms',34,4,'free',
      E'*I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4). This Psalm''s own title names the very scene — David''s changed behaviour before the king of Gath; *David laid up these words in his heart, and was sore afraid of Achish the king of Gath* (1 Samuel 21:12), and out of that fear comes the song: he sought Yahuah, and was *delivered from all my fears*.'),
    ('canon','1-samuel',21,13,'canon','psalms',34,6,'free',
      E'*This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6). When David *changed his behaviour before them, and feigned himself mad in their hands* (1 Samuel 21:13), it was the cry of *this poor man* — the cornered fugitive — that Yahuah heard and answered, bringing him out of Gath alive; the trick of madness was the cover, but the deliverance was Yahuah''s.'),
    ('canon','1-samuel',21,13,'canon','psalms',34,19,'free',
      E'*Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19). David''s flight from Saul into the hand of the Philistine, the feigned madness *in their hands* (1 Samuel 21:13), is one affliction among many; the Psalm born of this hour confesses the rule of his whole life — *out of them all* the righteous one is delivered, and *none of them that trust in him shall be desolate* (Psalm 34:22).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 4: Doeg the Edomite was there that day
    ('canon','1-samuel',21,7,'canon','1-samuel',22,9,'free',
      E'*Then answered Doeg the Edomite, which was set over the servants of Saul, and said, I saw the son of Jesse coming to Nob, to Ahimelech the son of Ahitub* (1 Samuel 22:9). The man marked here — *a certain man of the servants of Saul was there that day... and his name was Doeg, an Edomite* (1 Samuel 21:7) — becomes the informer; what he *saw* standing by at Nob he carries to Saul, and the watching seed of Esau turns witness against the priest who fed David.'),
    ('canon','1-samuel',21,7,'canon','1-samuel',22,18,'free',
      E'*And Doeg the Edomite turned, and he fell upon the priests, and slew on that day fourscore and five persons that did wear a linen ephod* (1 Samuel 22:18). The quiet menace of *Doeg, an Edomite, the chiefest of the herdmen* (1 Samuel 21:7) ripens into slaughter: when Saul''s own footmen *would not put forth their hand to fall upon the priests of Yahuah (LORD)* (1 Samuel 22:17), the Edomite does — eighty-five priests of Yahuah cut down, the victims of Saul''s murderous rage and the informer who served it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice', E'David ate the shewbread — mercy, and not sacrifice', E'Fleeing Saul and hungry, David comes to Ahimelech the priest at Nob, and the priest answers, *There is no common bread under mine hand, but there is hallowed bread* (1 Samuel 21:4). So *the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6). This is the bread of the Presence — twelve loaves set in order on the pure table, *thou shalt set upon the table shewbread before me alway* (Exodus 25:30), reserved by Torah to the priesthood: *it shall be Aaron''s and his sons''; and they shall eat it in the holy place: for it is most holy* (Leviticus 24:9), set *by an everlasting covenant* (Leviticus 24:8). By the letter David, no priest, may not eat it. And yet the priest gives, and David eats, and no sin is charged.\n\nThe Formed Son Himself takes up this very hour to teach the heart of His own Torah. Pressed about His hungry disciples, He says, *Have ye not read what David did, when he was an hungred... How he entered into the house of Elohim (God), and did eat the shewbread, which was not lawful for him to eat, neither for them which were with him, but only for the priests?* (Matthew 12:3-4). Mark and Luke preserve it too — *when he had need, and was an hungred* (Mark 2:25), *did take and eat the shewbread, and gave also to them that were with him* (Luke 6:4). The Son grants it was *not lawful... but only for the priests* — and still vindicates it, because mercy and the preserving of life are the weightier matter of the Law, not its breach: *I will have mercy, and not sacrifice* (Matthew 12:7, after Hosea 6:6, *I desired mercy, and not sacrifice*). This is not the Torah abolished — the bread, the priesthood, the holy place, the Sabbath all stand. It is the Lawgiver reading His own Law by its heart, and sealing it, *the Son of Adam is Yahuah (Lord) even of the sabbath day* (Matthew 12:8; Mark 2:28; Luke 6:5). The hungry are fed from the holy bread, and the Torah is upheld in the deepest place it means to be kept.',
       sv.verse_id, ev.verse_id, 'free', 36900
  FROM _s340_1sa21_lookup sv, _s340_1sa21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-21-the-sword-of-goliath-there-is-none-like-that', E'The sword of Goliath — there is none like that', E'David asks for a weapon, *for I have neither brought my sword nor my weapons with me, because the king''s business required haste* (1 Samuel 21:8). The priest answers with the one blade kept at Nob: *The sword of Goliath the Philistine, whom thou slewest in the valley of Elah, behold, it is here wrapped in a cloth behind the ephod... And David said, There is none like that; give it me* (1 Samuel 21:9). The sword had been laid up in the holy place as a memorial of Yahuah''s deliverance, and now it returns to the hand of the man who first won it.\n\nFor in the valley of Elah David faced the giant with no sword at all: *So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David* (1 Samuel 17:50). It was Goliath''s own blade that finished him: *Therefore David ran, and stood upon the Philistine, and took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith* (1 Samuel 17:51). *There is none like that* — the trophy of the day Yahuah delivered Yashar''el (Israel) by the hand of a shepherd boy now arms the fugitive king; the memorial of an old salvation taken up for the road ahead.',
       sv.verse_id, ev.verse_id, 'free', 36903
  FROM _s340_1sa21_lookup sv, _s340_1sa21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=21 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-21-he-feigned-himself-mad-and-yahuah-delivered-him', E'He feigned himself mad, and Yahuah delivered him', E'Driven from Saul, David flees to the very city of Goliath, and the danger closes in: *the servants of Achish said unto him, Is not this David the king of the land?* (1 Samuel 21:11). *And David laid up these words in his heart, and was sore afraid of Achish the king of Gath. And he changed his behaviour before them, and feigned himself mad in their hands, and scrabbled on the doors of the gate, and let his spittle fall down upon his beard* (1 Samuel 21:12-13). The escape is by a desperate ruse — yet the song that grew out of this hour gives the deliverance to Yahuah, not to David''s wit.\n\nThe thirty-fourth Psalm bears the very title of this scene — *when he changed his behaviour before Abimelech; who drove him away, and he departed* — and it sings: *I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4); *This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6). The cornered fugitive is *this poor man*, and his deliverance from Gath is the proof of the rule he then lays down for all the righteous: *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19), and *none of them that trust in him shall be desolate* (Psalm 34:22). The feigned madness was the cover; the hand that brought him out alive was Yahuah''s.',
       sv.verse_id, ev.verse_id, 'free', 36906
  FROM _s340_1sa21_lookup sv, _s340_1sa21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-21-doeg-the-edomite-was-there-that-day', E'Doeg the Edomite was there that day', E'In the midst of the mercy at Nob, a watching eye is marked: *Now a certain man of the servants of Saul was there that day, detained before Yahuah (LORD); and his name was Doeg, an Edomite, the chiefest of the herdmen that belonged to Saul* (1 Samuel 21:7). The text pauses to name him and his lineage — an Edomite, of the seed of Esau — standing by while Ahimelech feeds and arms David. Nothing is said of him yet; the menace is only that he *was there that day*.\n\nThe next chapter shows why he was named. *Then answered Doeg the Edomite, which was set over the servants of Saul, and said, I saw the son of Jesse coming to Nob, to Ahimelech the son of Ahitub* (1 Samuel 22:9) — what he saw he reports, and his word brings Saul''s wrath down on the priests. And when Saul''s own footmen *would not put forth their hand to fall upon the priests of Yahuah (LORD)* (1 Samuel 22:17), the Edomite does: *And Doeg the Edomite turned, and he fell upon the priests, and slew on that day fourscore and five persons that did wear a linen ephod* (1 Samuel 22:18). The quiet figure of 21:7 becomes the slaughterer of the priests of Yahuah — the bloodshed of Nob born of Saul''s murderous rage and the informer who served it; the priests its victims, the system of that rage the thing condemned.',
       sv.verse_id, ev.verse_id, 'free', 36909
  FROM _s340_1sa21_lookup sv, _s340_1sa21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1: David ate the shewbread — mercy, and not sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*it shall be Aaron''s and his sons''; and they shall eat it in the holy place: for it is most holy* (Leviticus 24:9) — the *hallowed bread* reserved by Torah to the priesthood alone.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=4
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt set upon the table shewbread before me alway* (Exodus 25:30) — the *hallowed bread* is the bread of the Presence, set before Yahuah continually.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=4
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Have ye not read what David did, when he was an hungred, and they that were with him* (Matthew 12:3) — the Formed Son recalls this hungry hour at Nob to teach the heart of the Torah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=4
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*it shall be Aaron''s and his sons''... it is most holy* (Leviticus 24:9) — the priest gives the very loaves Torah reserves; the statute stands, yet life is preserved.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou shalt set upon the table shewbread before me alway* (Exodus 25:30) — the loaves *taken from before Yahuah* come down from the table to feed the hungry anointed.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*did eat the shewbread, which was not lawful for him to eat... but only for the priests* (Matthew 12:4) — the Son names the scene and vindicates it; the heart of the Torah honoured, not broken.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7, after Hosea 6:6) — the principle by which the hungry are fed from the holy bread; *the Son of Adam is Yahuah even of the sabbath day* (12:8).'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Have ye never read what David did, when he had need, and was an hungred* (Mark 2:25) — *when he had need*: necessity no breach of Yahuah''s day or Yahuah''s Law.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*did eat the shewbread, which is not lawful to eat but for the priests, and gave also to them which were with him* (Mark 2:26) — *The sabbath was made for man* (2:27); *the Son of Adam is Yahuah also of the sabbath* (2:28).'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Have ye not read so much as this, what David did, when himself was an hungred* (Luke 6:3) — a third Gospel keeps the hungry king at Nob as the standing precedent for mercy over rigor.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*did take and eat the shewbread, and gave also to them that were with him; which it is not lawful to eat but for the priests alone* (Luke 6:4) — the very deed of 21:6; *the Son of Adam is Yahuah also of the sabbath* (6:5).'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-david-ate-the-shewbread-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: The sword of Goliath — there is none like that
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David prevailed over the Philistine with a sling and with a stone... but there was no sword in the hand of David* (1 Samuel 17:50) — on the day of the duel David had no blade; now the giant''s own returns to his hand.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=9
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-the-sword-of-goliath-there-is-none-like-that'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*took his sword, and drew it out of the sheath thereof, and slew him, and cut off his head therewith* (1 Samuel 17:51) — *there is none like that*: the very blade that finished Goliath, kept in the sanctuary, taken up again.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=9
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-the-sword-of-goliath-there-is-none-like-that'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: he feigned himself mad, and Yahuah delivered him (Psalm 34)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4) — this Psalm''s title names the very scene; out of being *sore afraid of Achish* comes the song of deliverance.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=12
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-he-feigned-himself-mad-and-yahuah-delivered-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6) — the feigned madness was the cover, but the cry of *this poor man* was heard and the deliverance was Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-he-feigned-himself-mad-and-yahuah-delivered-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19) — the rule of David''s whole life, confessed out of this very hour of flight.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-he-feigned-himself-mad-and-yahuah-delivered-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: Doeg the Edomite was there that day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then answered Doeg the Edomite... I saw the son of Jesse coming to Nob, to Ahimelech the son of Ahitub* (1 Samuel 22:9) — the man *there that day* becomes the informer; what he saw he carries to Saul.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=7
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-doeg-the-edomite-was-there-that-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Doeg the Edomite turned, and he fell upon the priests, and slew on that day fourscore and five persons* (1 Samuel 22:18) — the quiet menace ripens into slaughter; eighty-five priests of Yahuah the victims of Saul''s rage.'
  FROM cross_reference_threads t
  JOIN _s340_1sa21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=21 AND sv.verse_number=7
  JOIN _s340_1sa21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-21-doeg-the-edomite-was-there-that-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_22.sql (1 Samuel 22) -----
--
-- 1 Samuel 22 — full-library cross-references.  Tag: 1sa22.  View: _s340_1sa22_lookup.
-- Sort band: base 36925, step 3 (36925, 36928, 36931, 36934).
--
-- FRAME: The rejected anointed gathers the outcasts in the cave of Adullam — the captain of
-- the distressed, the debtor, the discontented — the Son of David who calls Come unto me, all
-- ye that labour.  Doeg the Edomite (the Esau-seed again) informs, and Saul commands the
-- slaughter of the priests of Nob — fourscore and five who wore the linen ephod, and the whole
-- city — fulfilling the judgment spoken on Eli's house (1 Sam 2:31-33).  Victims, not enemies:
-- innocent priests massacred; the boastful informer's tongue judged (Ps 52).  Abiathar alone
-- escapes to David, the one not cut off finding safeguard with the anointed.
--
-- 1 Samuel 22 coverage:
--   v.1-2 (cave of Adullam; captain of the distressed/in-debt/discontented):
--        NT:     Matthew 11:28 (Come unto me, all ye that labour) — WOVEN
--        Extras: none warranted
--        Tanakh: Psalm 142 (the cave-cry, refuge in the land of the living),
--                Psalm 57 (cave psalm, shadow of thy wings), Hebrews 11:38 (dens and caves) — WOVEN
--   v.3-5 (parents to Moab; Gad: get thee into Yahudah):
--        NT/Extras/Tanakh: none warranted (carried in cave-thread prose)
--   v.6-8 (Saul under the tree, spear in hand, conspiracy charge):
--        none warranted (carried in Doeg-thread prose)
--   v.9-10,18,22 (Doeg the Edomite, the informer, his tongue):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 52 (boastest thou thyself in mischief; the deceitful tongue),
--                1 Samuel 21:7 (Doeg detained before Yahuah) — WOVEN
--   v.11-19 (slaughter of the priests of Nob; the linen ephod; the whole city):
--        NT:     Hebrews 11:37 (slain with the sword; the martyred faithful) — WOVEN
--        Extras: none warranted
--        Tanakh: 1 Samuel 2:31-33 (the judgment on Eli's house fulfilled) — WOVEN
--   v.20-23 (Abiathar alone escapes; safeguard with David):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 2:33 (the one not cut off from mine altar) — WOVEN
--
-- THREADS (4):
--   1sa22-the-captain-of-the-distressed-in-the-cave-of-adullam  [free]  tgt: canon NT + canon Tanakh
--   1sa22-doeg-the-edomite-and-the-boastful-tongue-judged        [free]  tgt: canon Tanakh
--   1sa22-the-slaughter-of-the-priests-of-nob-elis-house-cut-off [free]  tgt: canon NT + canon Tanakh
--   1sa22-abiathar-alone-escaped-the-one-not-cut-off             [free]  tgt: canon Tanakh
--
-- All targets canon (NT + Tanakh) => every thread tier_required 'free'.

-- A. Temp view -------------------------------------------------------------------------------
CREATE TEMP VIEW _s340_1sa22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. cross_references ------------------------------------------------------------------------
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the captain of the distressed in the cave of Adullam
    ('canon','1-samuel',22,2,'canon','matthew',11,28,'free',
     E'*Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28). The rejected anointed in the cave becomes the magnet of the broken: *every one that was in distress, and every one that was in debt, and every one that was discontented, gathered themselves unto him; and he became a captain over them* (1 Samuel 22:2). The Son of David, not yet on the throne, gathers the labouring and heavy-laden the same way — the outcasts of Yashar''el (Israel) are exactly the ones the true King calls and forms.'),
    ('canon','1-samuel',22,1,'canon','psalms',142,5,'free',
     E'*I cried unto thee, O Yahuah (LORD): I said, Thou art my refuge and my portion in the land of the living* (Psalm 142:5) — the psalm whose superscription names it David''s prayer *when he was in the cave*. As *David therefore departed thence, and escaped to the cave Adullam* (1 Samuel 22:1), the hunted anointed makes Yahuah his hold; the cave is not a tomb but a refuge in the land of the living.'),
    ('canon','1-samuel',22,1,'canon','psalms',57,1,'free',
     E'*Be merciful unto me, O Elohim (God), be merciful unto me: for my soul trusteth in thee: yea, in the shadow of thy wings will I make my refuge, until these calamities be overpast* (Psalm 57:1) — the psalm headed David''s *when he fled from Saul in the cave*. The same flight that drives him *to the cave Adullam* (1 Samuel 22:1) drives him under the wings of Yahuah; the outer cave and the inner shelter are one.'),
    ('canon','1-samuel',22,2,'canon','hebrews',11,38,'free',
     E'*(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth* (Hebrews 11:38). The roll of the faithful ends among the very dens that shelter David and his four hundred; *there were with him about four hundred men* (1 Samuel 22:2), the distressed and discontented, counted by faith with the company the world was not worthy of.'),
    -- Thread 2: Doeg the Edomite and the boastful tongue judged
    ('canon','1-samuel',22,9,'canon','psalms',52,1,'free',
     E'*Why boastest thou thyself in mischief, O mighty man? the goodness of Elohim (God) endureth continually* (Psalm 52:1) — the psalm''s superscription names it *when Doeg the Edomite came and told Saul*. *Then answered Doeg the Edomite, which was set over the servants of Saul, and said, I saw the son of Jesse coming to Nob* (1 Samuel 22:9): the informer''s report is the boast in mischief the psalm indicts.'),
    ('canon','1-samuel',22,22,'canon','psalms',52,2,'free',
     E'*Thy tongue deviseth mischiefs; like a sharp razor, working deceitfully* (Psalm 52:2). David names the tongue that did the killing: *I knew it that day, when Doeg the Edomite was there, that he would surely tell Saul* (1 Samuel 22:22). The Edomite''s informing tongue is the razor; Esau''s seed once more turns its weapon against the seed of promise, and Yahuah marks it for judgment.'),
    ('canon','1-samuel',22,9,'canon','1-samuel',21,7,'free',
     E'*Now a certain man of the servants of Saul was there that day, detained before Yahuah (LORD); and his name was Doeg, an Edomite, the chiefest of the herdmen that belonged to Saul* (1 Samuel 21:7). The man who merely *was there* when David came to Nob now turns informer: *I saw the son of Jesse coming to Nob, to Ahimelech the son of Ahitub* (1 Samuel 22:9). What he silently witnessed he now wields, and the priests will pay for it.'),
    -- Thread 3: the slaughter of the priests of Nob — Eli's house cut off
    ('canon','1-samuel',22,18,'canon','1-samuel',2,31,'free',
     E'*Behold, the days come, that I will cut off thine arm, and the arm of thy father''s house, that there shall not be an old man in thine house* (1 Samuel 2:31) — the word spoken against Eli''s house. It falls in Nob: *Doeg the Edomite turned, and he fell upon the priests, and slew on that day fourscore and five persons that did wear a linen ephod* (1 Samuel 22:18). The eighty-five in the linen ephod are the arm cut off; the long-spoken judgment lands by a cruel hand, yet stands as Yahuah''s righteous word.'),
    ('canon','1-samuel',22,19,'canon','1-samuel',2,33,'free',
     E'*And the man of thine, whom I shall not cut off from mine altar, shall be to consume thine eyes, and to grieve thine heart: and all the increase of thine house shall die in the flower of their age* (1 Samuel 2:33). *And Nob, the city of the priests, smote he with the edge of the sword, both men and women, children and sucklings* (1 Samuel 22:19): the whole increase of the house dying in the flower of their age, exactly as foretold over Eli''s line.'),
    ('canon','1-samuel',22,18,'canon','hebrews',11,37,'free',
     E'*They were stoned, they were sawn asunder, were tempted, were slain with the sword* (Hebrews 11:37). The priests of Nob are among the innocent slain with the sword — *fourscore and five persons that did wear a linen ephod* (1 Samuel 22:18). Victims, not enemies: the faithful servants of Yahuah cut down by a wicked king and an Edomite''s blade, the world not worthy of them.'),
    -- Thread 4: Abiathar alone escaped — the one not cut off
    ('canon','1-samuel',22,20,'canon','1-samuel',2,33,'free',
     E'*And the man of thine, whom I shall not cut off from mine altar, shall be to consume thine eyes, and to grieve thine heart* (1 Samuel 2:33). One son is spared: *And one of the sons of Ahimelech the son of Ahitub, named Abiathar, escaped, and fled after David* (1 Samuel 22:20). The single survivor of Eli''s line flees to the true anointed; the remnant of the cut-off house finds its place beside the rising king.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. threads ---------------------------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-22-the-captain-of-the-distressed-in-the-cave-of-adullam',
       E'The captain of the distressed in the cave of Adullam',
       E'The rejected anointed goes underground, and the broken of Yashar''el (Israel) come to him: *David therefore departed thence, and escaped to the cave Adullam* (1 Samuel 22:1), and *every one that was in distress, and every one that was in debt, and every one that was discontented, gathered themselves unto him; and he became a captain over them: and there were with him about four hundred men* (1 Samuel 22:2). The throne-anointed of Yahuah is not gathering the strong but the labouring — the same company the Son of David calls: *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28).\n\nThe cave is no defeat. David''s own cave-psalms make it a refuge: *I cried unto thee, O Yahuah (LORD): I said, Thou art my refuge and my portion in the land of the living* (Psalm 142:5), and *in the shadow of thy wings will I make my refuge, until these calamities be overpast* (Psalm 57:1). And the roll of faith counts such hiding-places holy ground: *they wandered in deserts, and in mountains, and in dens and caves of the earth* — *(Of whom the world was not worthy:)* (Hebrews 11:38). The captain of the four hundred outcasts is the figure of the King who forms his people out of the rejected.',
       sv.verse_id, ev.verse_id, 'free', 36925
  FROM _s340_1sa22_lookup sv, _s340_1sa22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-22-doeg-the-edomite-and-the-boastful-tongue-judged',
       E'Doeg the Edomite and the boastful tongue judged',
       E'The Edomite — Esau''s seed again set against the seed of promise — does with his tongue what no Israelite footman would do with his hand. *Then answered Doeg the Edomite, which was set over the servants of Saul, and said, I saw the son of Jesse coming to Nob, to Ahimelech the son of Ahitub* (1 Samuel 22:9). He had only *been there* the day David came (*his name was Doeg, an Edomite, the chiefest of the herdmen that belonged to Saul*, 1 Samuel 21:7); now what he silently witnessed he wields to kill.\n\nDavid names the weapon afterward: *I knew it that day, when Doeg the Edomite was there, that he would surely tell Saul* (1 Samuel 22:22). The psalm headed *when Doeg the Edomite came and told Saul* indicts exactly this informing tongue: *Why boastest thou thyself in mischief, O mighty man? the goodness of Elohim (God) endureth continually* (Psalm 52:1); *Thy tongue deviseth mischiefs; like a sharp razor, working deceitfully* (Psalm 52:2). The boastful informer is not destroyed by David''s hand but left to the judgment of Yahuah, whose goodness *endureth continually* over against the razor-tongue.',
       sv.verse_id, ev.verse_id, 'free', 36928
  FROM _s340_1sa22_lookup sv, _s340_1sa22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=22 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-22-the-slaughter-of-the-priests-of-nob-elis-house-cut-off',
       E'The slaughter of the priests of Nob — Eli''s house cut off',
       E'Saul commands what the word of Yahuah long ago appointed, and an Edomite''s blade carries it out: *Doeg the Edomite turned, and he fell upon the priests, and slew on that day fourscore and five persons that did wear a linen ephod* (1 Samuel 22:18); *And Nob, the city of the priests, smote he with the edge of the sword, both men and women, children and sucklings, and oxen, and asses, and sheep, with the edge of the sword* (1 Samuel 22:19).\n\nThis is the judgment spoken over Eli''s house come to pass: *Behold, the days come, that I will cut off thine arm, and the arm of thy father''s house, that there shall not be an old man in thine house* (1 Samuel 2:31), and *all the increase of thine house shall die in the flower of their age* (1 Samuel 2:33). Yet the verdict on Eli''s line is no warrant for the cruelty; the priests die innocent. They take their place in the roll of the faithful who *were slain with the sword* (Hebrews 11:37) — victims, not enemies, the world not worthy of them, while Yahuah''s long-spoken word still stands true.',
       sv.verse_id, ev.verse_id, 'free', 36931
  FROM _s340_1sa22_lookup sv, _s340_1sa22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=22 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-22-abiathar-alone-escaped-the-one-not-cut-off',
       E'Abiathar alone escaped — the one not cut off',
       E'Out of the massacre one survivor flees to the true anointed: *And one of the sons of Ahimelech the son of Ahitub, named Abiathar, escaped, and fled after David* (1 Samuel 22:20). The word over Eli''s house had reserved exactly such a remnant: *And the man of thine, whom I shall not cut off from mine altar, shall be to consume thine eyes, and to grieve thine heart* (1 Samuel 2:33). Abiathar is that man — not cut off, but bearing the grief of his slaughtered house.\n\nDavid takes the blood-guilt upon his own grief and gives the survivor sanctuary: *Abide thou with me, fear not: for he that seeketh my life seeketh thy life: but with me thou shalt be in safeguard* (1 Samuel 22:23). The remnant of the cut-off priesthood finds its safeguard not with the reigning Saul but with the rejected anointed — the pattern of the whole gathering, where the broken and the bereaved are kept safe beside the rising king.',
       sv.verse_id, ev.verse_id, 'free', 36934
  FROM _s340_1sa22_lookup sv, _s340_1sa22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=22 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- D. thread_members --------------------------------------------------------------------------
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest*: the Son of David gathers the labouring as David gathers the distressed (1 Samuel 22:2).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=2
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-captain-of-the-distressed-in-the-cave-of-adullam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 142:5 — *Thou art my refuge and my portion in the land of the living*: the cave-prayer makes the hiding-place (1 Samuel 22:1) a refuge in Yahuah.'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=1
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=142 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-captain-of-the-distressed-in-the-cave-of-adullam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 57:1 — *in the shadow of thy wings will I make my refuge*: the psalm of David''s flight to the cave (1 Samuel 22:1), the inner shelter beneath the outer.'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=1
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=57 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-captain-of-the-distressed-in-the-cave-of-adullam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 11:38 — *they wandered ... in dens and caves of the earth*: David''s four hundred (1 Samuel 22:2) counted with the faithful the world was not worthy of.'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=2
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-captain-of-the-distressed-in-the-cave-of-adullam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 52:1 — *Why boastest thou thyself in mischief, O mighty man?*: the psalm headed *when Doeg the Edomite came and told Saul*, indicting the informer (1 Samuel 22:9).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=9
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=52 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-doeg-the-edomite-and-the-boastful-tongue-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 52:2 — *Thy tongue deviseth mischiefs; like a sharp razor*: the Edomite''s informing tongue that David names (1 Samuel 22:22) as the killing weapon.'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=22
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=52 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-doeg-the-edomite-and-the-boastful-tongue-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 21:7 — *his name was Doeg, an Edomite ... detained before Yahuah*: the silent witness at Nob who now turns informer (1 Samuel 22:9).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=9
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=21 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-doeg-the-edomite-and-the-boastful-tongue-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 2:31 — *I will cut off thine arm, and the arm of thy father''s house*: the judgment on Eli''s house falling on the priests of Nob (1 Samuel 22:18).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-slaughter-of-the-priests-of-nob-elis-house-cut-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 2:33 — *all the increase of thine house shall die in the flower of their age*: the whole city of Nob smitten, men women and sucklings (1 Samuel 22:19).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=19
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-slaughter-of-the-priests-of-nob-elis-house-cut-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 11:37 — *they were ... slain with the sword*: the fourscore and five priests in the linen ephod (1 Samuel 22:18), innocent martyrs the world was not worthy of.'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=18
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-the-slaughter-of-the-priests-of-nob-elis-house-cut-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 2:33 — *the man of thine, whom I shall not cut off from mine altar*: Abiathar, the spared survivor who flees to David (1 Samuel 22:20).'
  FROM cross_reference_threads t
  JOIN _s340_1sa22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=22 AND sv.verse_number=20
  JOIN _s340_1sa22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-22-abiathar-alone-escaped-the-one-not-cut-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_23.sql (1 Samuel 23) -----
--
-- Chapter: 1 Samuel 23   Tag: 1sa23   View: _s340_1sa23_lookup
-- Sort band: base 36950, step 3 -> 36950, 36953, 36956
-- Session prefix: s340 (Tanakh full-library xref)
--
-- FRAME: the anointed who ENQUIRES of Yahuah by the ephod (the Formed Son answering
--   his servant, NOT co-equal-trinity, NOT Arian) and obeys, saving Keilah while Saul
--   presumes "Elohim hath delivered him into mine hand"; the friend Jonathan who
--   strengthens David's hand IN ELOHIM and confirms the king-promise both-houses; the
--   hunted anointed preserved until the appointed time -- "Elohim delivered him not
--   into his hand" -- the Rock of escape (Sela-hammahlekoth).
--
-- 1 Samuel 23 coverage:
--   v.2-5  enquired of Yahuah / saved Keilah:
--          NT:     none warranted (Tanakh David-enquiring pattern is the weight)
--          Extras: none warranted
--          Tanakh: 2-samuel 5:19 (enquired again, deliver into hand); psalms 27:4 (enquire in his temple) -> THREAD 1
--   v.6,9  the ephod brought (Abiathar): folded into THREAD 1 as the instrument of the asking
--   v.7    Saul: "Elohim hath delivered him into mine hand" (presumption): contrast surfaced in prose THREAD 3
--   v.11-12 Yahuah forewarns: men of Keilah will deliver thee up (ingratitude): folded into THREAD 1 prose
--   v.14   "Elohim delivered him not into his hand":
--          NT: none warranted  Extras: none warranted
--          Tanakh: psalms 37:32-33 (Yahuah will not leave him in his hand); psalms 54 (Ziphites) -> THREAD 3
--   v.16-18 Jonathan strengthened his hand in Elohim / king-promise / covenant before Yahuah:
--          NT:     hebrews 10:24-25 (provoke unto love and good works, exhorting one another); 1-thessalonians 5:11 (comfort/edify one another)
--          Extras: none warranted
--          Tanakh: 1-samuel 18:1,3 (soul knit, covenant); 1-samuel 20:42 (covenant before Yahuah, seed); 2-samuel 5:2-3 (anointed king both houses) -> THREAD 2
--   v.19-24 Ziphites betray: psalms 54 superscription content -> THREAD 3
--   v.26-28 compassed about / Rock of escape / Sela-hammahlekoth:
--          NT: none warranted  Extras: none warranted
--          Tanakh: psalms 18:2 (rock, fortress, deliverer); psalms 31:20 (hide in secret of presence) -> THREAD 3
--   v.29   En-gedi (sets up ch24): no add (narrative bridge)
--
-- THREADS:
--   1-samuel-23-david-enquired-of-yahuah-and-saved-keilah        [Tanakh]  free
--   1-samuel-23-jonathan-strengthened-his-hand-in-elohim         [Tanakh + NT]  free
--   1-samuel-23-but-elohim-delivered-him-not-into-his-hand       [Tanakh]  free
--

CREATE TEMP VIEW _s340_1sa23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: David enquired of Yahuah and saved Keilah (vv.2,4 -> Tanakh)
    ('canon','1-samuel',23,2,'canon','2-samuel',5,19,'free',
     E'*And David enquired of Yahuah (LORD), saying, Shall I go up to the Philistines? wilt thou deliver them into mine hand? And Yahuah (LORD) said unto David, Go up: for I will doubtless deliver the Philistines into thine hand.* (2 Samuel 5:19). The very pattern of the anointed is set here: *Therefore David enquired of Yahuah (LORD), saying, Shall I go and smite these Philistines?* (1 Samuel 23:2) -- David asks and is answered, and the answer is the same Formed Voice that later directs the throned king. He does not move until Yahuah speaks; the One who answers by the ephod is the expressed Word of the Father, not a co-equal second person.'),
    ('canon','1-samuel',23,4,'canon','2-samuel',5,19,'free',
     E'*And David enquired of Yahuah (LORD)... And Yahuah (LORD) said unto David, Go up: for I will doubtless deliver the Philistines into thine hand.* (2 Samuel 5:19). When David *enquired of Yahuah (LORD) yet again* and heard *Arise, go down to Keilah; for I will deliver the Philistines into thine hand* (1 Samuel 23:4), the promise *I will deliver... into thine hand* is the Formed Son binding himself to the obedient asker -- the same word, the same deliverance, twice over.'),
    ('canon','1-samuel',23,2,'canon','psalms',27,4,'free',
     E'*One thing have I desired of Yahuah (LORD), that will I seek after; that I may dwell in the house of Yahuah (LORD) all the days of my life, to behold the beauty of Yahuah (LORD), and to enquire in his temple.* (Psalm 27:4). David sings the very posture he lives in this chapter -- *David enquired of Yahuah (LORD)* (1 Samuel 23:2). To *enquire* of Yahuah is the heartbeat of the anointed; he seeks the Face and waits for the Voice before he draws the sword.'),

    -- THREAD 2: Jonathan strengthened his hand in Elohim (vv.16,17,18)
    ('canon','1-samuel',23,16,'canon','1-samuel',18,1,'free',
     E'*And it came to pass... that the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul.* (1 Samuel 18:1). The love that was knit at the start now bears its fruit in the wilderness: *And Jonathan Saul''s son arose, and went to David into the wood, and strengthened his hand in Elohim (God)* (1 Samuel 23:16). True friendship is covenant-friendship -- it walks into the danger and strengthens the hand in Elohim, not in flattery.'),
    ('canon','1-samuel',23,18,'canon','1-samuel',18,3,'free',
     E'*Then Jonathan and David made a covenant, because he loved him as his own soul.* (1 Samuel 18:3). The covenant first cut between them is here renewed before the Face: *And they two made a covenant before Yahuah (LORD)* (1 Samuel 23:18). The bond is not sentiment but a sworn thing before Yahuah, binding Jonathan to David''s house even against his own father''s throne.'),
    ('canon','1-samuel',23,18,'canon','1-samuel',20,42,'free',
     E'*And Jonathan said to David, Go in peace, forasmuch as we have sworn both of us in the name of Yahuah (LORD), saying, Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever.* (1 Samuel 20:42). The covenant *before Yahuah (LORD)* of 1 Samuel 23:18 carries forward this oath sworn *in the name of Yahuah* -- a seed-bond, *between my seed and thy seed for ever*, that outlives both men and is kept when David spares Mephibosheth.'),
    ('canon','1-samuel',23,17,'canon','2-samuel',5,2,'free',
     E'*and Yahuah (LORD) said to thee, Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el (Israel).* (2 Samuel 5:2). Jonathan''s wilderness word -- *thou shalt be king over Yashar''el (Israel), and I shall be next unto thee* (1 Samuel 23:17) -- is fulfilled when all the tribes come to Hebron and anoint David shepherd-king over the whole house. The friend prophesies the throne he himself will never sit on, and rejoices in it.'),
    ('canon','1-samuel',23,17,'canon','2-samuel',5,3,'free',
     E'*So all the elders of Yashar''el (Israel) came to the king to Hebron; and king David made a league with them in Hebron before Yahuah (LORD): and they anointed David king over Yashar''el (Israel).* (2 Samuel 5:3). What Jonathan spoke in the wood -- *thou shalt be king over Yashar''el (Israel)* (1 Samuel 23:17) -- comes to pass over the gathered tribes, the king who feeds both houses, Yashar''el and Yahudah, made one under one shepherd.'),
    ('canon','1-samuel',23,16,'canon','hebrews',10,24,'free',
     E'*And let us consider one another to provoke unto love and to good works: Not forsaking the assembling of ourselves together... but exhorting one another: and so much the more, as ye see the day approaching.* (Hebrews 10:24-25). This is Jonathan''s ministry given as a command: he *strengthened his hand in Elohim (God)* (1 Samuel 23:16). The body of Messiah is to do for one another exactly what Jonathan did in the wood -- come to the hunted brother and strengthen his hand in Elohim.'),
    ('canon','1-samuel',23,16,'canon','1-thessalonians',5,11,'free',
     E'*Wherefore comfort yourselves together, and edify one another, even as also ye do.* (1 Thessalonians 5:11). To *strengthen his hand in Elohim (God)* (1 Samuel 23:16) is to edify -- to build up the wearied faith of a brother. Jonathan is the living portrait of the comfort the assembly is charged to give: not to fix the circumstance, but to set the hand back into the grip of Elohim.'),

    -- THREAD 3: but Elohim delivered him not into his hand (vv.14,26,28)
    ('canon','1-samuel',23,14,'canon','psalms',54,3,'free',
     E'*For strangers are risen up against me, and oppressors seek after my soul: they have not set Elohim (God) before them. Selah.* (Psalm 54:3). The superscription of Psalm 54 names this very hour -- when the Ziphites came and said to Saul, Doth not David hide himself with us. As *Saul sought him every day, but Elohim (God) delivered him not into his hand* (1 Samuel 23:14), David turns the betrayal into prayer: the hunted anointed answers the snare with the Name.'),
    ('canon','1-samuel',23,14,'canon','psalms',54,4,'free',
     E'*Behold, Elohim (God) is mine helper: Yahuah (Lord) is with them that uphold my soul.* (Psalm 54:4). This is the confession underneath the narrative line *Elohim (God) delivered him not into his hand* (1 Samuel 23:14). Saul sought David every day, yet Elohim was the helper who would not let the soul be taken -- the preservation of the anointed seed until the appointed time.'),
    ('canon','1-samuel',23,14,'canon','psalms',37,33,'free',
     E'*Yahuah (LORD) will not leave him in his hand, nor condemn him when he is judged.* (Psalm 37:33). David''s own psalm states the law of his deliverance: *The wicked watcheth the righteous, and seeketh to slay him* (Psalm 37:32) -- exactly *Saul sought him every day* -- *but Elohim (God) delivered him not into his hand* (1 Samuel 23:14). Yahuah will not leave the righteous in the hand of the wicked.'),
    ('canon','1-samuel',23,26,'canon','psalms',18,2,'free',
     E'*Yahuah (LORD) is my rock, and my fortress, and my deliverer; my Elohim (God), my strength, in whom I will trust; my buckler, and the horn of my salvation, and my high tower.* (Psalm 18:2). When *Saul and his men compassed David and his men round about to take them* (1 Samuel 23:26), and a Philistine raid pulled Saul away, the place was named Sela-hammahlekoth, the rock of escape -- a living parable of David''s confession that Yahuah himself is *my rock... my deliverer*.'),
    ('canon','1-samuel',23,26,'canon','psalms',31,20,'free',
     E'*Thou shalt hide them in the secret of thy presence from the pride of man: thou shalt keep them secretly in a pavilion from the strife of tongues.* (Psalm 31:20). Compassed round about with no way out (1 Samuel 23:26), David is hidden by the One who keeps his own *in the secret of thy presence* -- the messenger that recalled Saul was Yahuah''s hiding, the appointed-time deliverance of the seed of promise.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-23-david-enquired-of-yahuah-and-saved-keilah',
       E'David Enquired of Yahuah and Saved Keilah',
       E'When word comes that the Philistines fight against Keilah, the anointed does not act on instinct -- *Therefore David enquired of Yahuah (LORD), saying, Shall I go and smite these Philistines? And Yahuah (LORD) said unto David, Go, and smite the Philistines, and save Keilah* (1 Samuel 23:2). His men are afraid, so he *enquired of Yahuah (LORD) yet again* and hears *Arise, go down to Keilah; for I will deliver the Philistines into thine hand* (1 Samuel 23:4). This is the heartbeat of the rightful king: he asks, he waits for the Voice, and only then he draws the sword -- and *David saved the inhabitants of Keilah* (1 Samuel 23:5). The One who answers him is the Formed Son, the expressed Word of the Father speaking through Abiathar''s ephod (1 Samuel 23:6,9), not a second co-equal person and not a created angel.\n\nThis is the whole David-pattern. *And David enquired of Yahuah (LORD)... And Yahuah (LORD) said unto David, Go up: for I will doubtless deliver the Philistines into thine hand* (2 Samuel 5:19) -- the throned king still asks, and still hears the same promise, *I will deliver... into thine hand*. It is the posture David sings: *One thing have I desired of Yahuah (LORD), that will I seek after... to enquire in his temple* (Psalm 27:4). The contrast with Saul is total: where David asks Yahuah, Saul presumes upon him -- *Elohim (God) hath delivered him into mine hand* (1 Samuel 23:7) -- and is proven wrong. Even when Yahuah forewarns David that the men he saved would deliver him up (1 Samuel 23:11-12), the lesson holds: the anointed who enquires is led, and the One who leads is faithful.',
       sv.verse_id, ev.verse_id, 'free', 36950
  FROM _s340_1sa23_lookup sv, _s340_1sa23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=23 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-23-jonathan-strengthened-his-hand-in-elohim',
       E'Jonathan Strengthened His Hand in Elohim',
       E'In the wilderness of Ziph, hunted every day, David is met by the one friend who walks toward the danger: *And Jonathan Saul''s son arose, and went to David into the wood, and strengthened his hand in Elohim (God)* (1 Samuel 23:16). He does not bring an army; he brings faith. *And he said unto him, Fear not: for the hand of Saul my father shall not find thee; and thou shalt be king over Yashar''el (Israel), and I shall be next unto thee* (1 Samuel 23:17). The friend prophesies the very throne he himself will never sit on -- and rejoices in it. *And they two made a covenant before Yahuah (LORD)* (1 Samuel 23:18).\n\nThis is the ripening of a bond cut long before: *the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1); *Then Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3); and the oath sworn *in the name of Yahuah (LORD), saying, Yahuah (LORD) be between me and thee, and between my seed and thy seed for ever* (1 Samuel 20:42). It is covenant-friendship -- a sworn, seed-deep thing before the Face, not sentiment. Jonathan''s word came to pass: *Thou shalt feed my people Yashar''el (Israel)... and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:2-3) -- the shepherd-king over both houses, Yashar''el and Yahudah made one.\n\nAnd Jonathan''s ministry is laid on the whole body of Messiah as a charge: *let us consider one another to provoke unto love and to good works... exhorting one another* (Hebrews 10:24-25); *comfort yourselves together, and edify one another* (1 Thessalonians 5:11). To strengthen a brother''s hand in Elohim is not to fix his circumstance but to set his hand back into the grip of the Most High.',
       sv.verse_id, ev.verse_id, 'free', 36953
  FROM _s340_1sa23_lookup sv, _s340_1sa23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=23 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-23-but-elohim-delivered-him-not-into-his-hand',
       E'But Elohim Delivered Him Not Into His Hand',
       E'The narrative speaks the whole doctrine of preservation in one line: *And Saul sought him every day, but Elohim (God) delivered him not into his hand* (1 Samuel 23:14). The seed of promise is hunted, but it cannot be taken before the appointed time. When the Ziphites betray his hiding place to Saul (1 Samuel 23:19), David answers the snare with prayer -- the very hour named in the superscription of his psalm: *For strangers are risen up against me, and oppressors seek after my soul: they have not set Elohim (God) before them* (Psalm 54:3); *Behold, Elohim (God) is mine helper: Yahuah (Lord) is with them that uphold my soul* (Psalm 54:4). The men of Keilah he had saved would have delivered him up (1 Samuel 23:12); these are victims of fear and ingratitude, not enemies to be hated -- and David takes none of it into his own hand.\n\nDavid''s own song states the law of his deliverance: *The wicked watcheth the righteous, and seeketh to slay him* -- exactly *Saul sought him every day* -- *Yahuah (LORD) will not leave him in his hand, nor condemn him when he is judged* (Psalm 37:32-33). And when the trap finally closes -- *Saul and his men compassed David and his men round about to take them* (1 Samuel 23:26) -- a messenger calls Saul away to a Philistine raid, and the place is named Sela-hammahlekoth, the rock of escape (1 Samuel 23:28). It is a living parable of the One David trusts: *Yahuah (LORD) is my rock, and my fortress, and my deliverer... my high tower* (Psalm 18:2); *Thou shalt hide them in the secret of thy presence from the pride of man* (Psalm 31:20). The anointed seed is kept until the throne Yahuah promised.',
       sv.verse_id, ev.verse_id, 'free', 36956
  FROM _s340_1sa23_lookup sv, _s340_1sa23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=23 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1: david-enquired-of-yahuah-and-saved-keilah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And David enquired of Yahuah (LORD)... Go up: for I will doubtless deliver the Philistines into thine hand* (2 Samuel 5:19) -- the throned king still asks before he fights, the same Voice answering the same way.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-david-enquired-of-yahuah-and-saved-keilah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will deliver the Philistines into thine hand* (2 Samuel 5:19) -- the Formed Son binds himself to the asker; the same promise given to David at Keilah, twice over.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-david-enquired-of-yahuah-and-saved-keilah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*One thing have I desired... to enquire in his temple* (Psalm 27:4) -- David sings the posture he lives: the anointed who seeks the Face before the sword.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-david-enquired-of-yahuah-and-saved-keilah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: jonathan-strengthened-his-hand-in-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the soul of Jonathan was knit with the soul of David* (1 Samuel 18:1) -- the love knit at the start now walks into the wood to strengthen the hunted brother.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then Jonathan and David made a covenant* (1 Samuel 18:3) -- the covenant first cut is here renewed *before Yahuah (LORD)*, a sworn thing, not sentiment.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=18
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*we have sworn both of us in the name of Yahuah (LORD)... between my seed and thy seed for ever* (1 Samuel 20:42) -- a seed-bond that outlives both men.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=18
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=20 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt feed my people Yashar''el (Israel)* (2 Samuel 5:2) -- Jonathan''s wilderness prophecy of the throne comes to pass over the gathered tribes.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=17
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3) -- the shepherd-king over both houses, Yashar''el and Yahudah made one, exactly as Jonathan said.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=17
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*consider one another to provoke unto love and to good works... exhorting one another* (Hebrews 10:24-25) -- Jonathan''s ministry laid on the whole body as a charge.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*comfort yourselves together, and edify one another* (1 Thessalonians 5:11) -- to strengthen the hand in Elohim is to build up wearied faith.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-jonathan-strengthened-his-hand-in-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: but-elohim-delivered-him-not-into-his-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*strangers are risen up against me... they have not set Elohim (God) before them* (Psalm 54:3) -- the Ziphite betrayal turned into prayer, the very hour of this psalm''s superscription.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=14
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=54 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-but-elohim-delivered-him-not-into-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Behold, Elohim (God) is mine helper* (Psalm 54:4) -- the confession underneath *Elohim delivered him not into his hand*; the helper who keeps the seed of promise.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=14
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=54 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-but-elohim-delivered-him-not-into-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) will not leave him in his hand, nor condemn him when he is judged* (Psalm 37:33) -- David''s own psalm states the law of his deliverance, the wicked watching but never prevailing.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=14
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-but-elohim-delivered-him-not-into-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) is my rock, and my fortress, and my deliverer* (Psalm 18:2) -- Sela-hammahlekoth, the rock of escape, made flesh of David''s confession.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-but-elohim-delivered-him-not-into-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt hide them in the secret of thy presence from the pride of man* (Psalm 31:20) -- compassed round about, David is hidden by the One who keeps his own until the appointed time.'
  FROM cross_reference_threads t
  JOIN _s340_1sa23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s340_1sa23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-23-but-elohim-delivered-him-not-into-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_24.sql (1 Samuel 24) -----
--
-- 1 Samuel 24 — David spares Saul in the cave at En-gedi.
-- TAG: 1sa24   VIEW: _s340_1sa24_lookup
-- SORT BAND: base 36975, step 3 -> 36975, 36978, 36981, 36984
--
-- FRAMEWORK: David, the anointed-but-not-yet-enthroned king, has Saul (Yahuah's
-- reigning anointed, gone wicked) delivered into his hand in the cave, and will
-- not lift his hand against him. He leaves vengeance to Yahuah, honours the
-- anointed office even under a wicked man, and returns good for evil — the
-- David/Messiah type, the persecuted who does not retaliate but commits himself
-- to him that judgeth righteously.
--
-- COVERAGE CHECKLIST:
--   v.4-6 (cut the skirt; heart smote him; LORD forbid I stretch forth mine hand
--          against the LORD'S anointed):
--        NT:     none warranted (the office-honour weave is best carried laterally)
--        Extras: none warranted
--        Tanakh: 1 Samuel 26:9,11 (same refusal, the second sparing); Psalm 105:15
--                (Touch not mine anointed) -> THREAD 1
--   v.10 (LORD delivered thee into mine hand... I will not put forth mine hand
--         against my lord; for he is the LORD'S anointed):
--        NT:     none warranted   Extras: none warranted
--        Tanakh: 1 Samuel 26:9 -> THREAD 1
--   v.12,15 (Yahuah judge between me and thee, and Yahuah avenge me of thee: but
--            mine hand shall not be upon thee; the LORD be judge, plead my cause):
--        NT:     Romans 12:19 (avenge not yourselves... Vengeance is mine, I will
--                repay, saith Yahuah) -> THREAD 2
--        Extras: none warranted
--        Tanakh: Deuteronomy 32:35 (To me belongeth vengeance and recompence);
--                Psalm 7:8 (the LORD shall judge the people: judge me, O LORD);
--                Proverbs 20:22 (Say not, I will recompense evil; wait on the LORD)
--                -> THREADS 2 (and Prov 20:22 also THREAD 3)
--   v.17-19 (Thou art more righteous than I... thou hast rewarded me good, whereas
--            I have rewarded thee evil; wherefore the LORD reward thee good):
--        NT:     Matthew 5:44 (Love your enemies, bless them that curse you);
--                Romans 12:21 (overcome evil with good); 1 Peter 2:23 (when he was
--                reviled, reviled not again, but committed himself to him that
--                judgeth righteously) -> THREAD 3
--        Extras: none warranted
--        Tanakh: Proverbs 20:22 (wait on the LORD, and he shall save thee) -> THREAD 3
--   v.15 / the cave setting (deliver me out of thine hand — David hunted, hidden):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 57:1 (in the shadow of thy wings will I make my refuge, until
--                these calamities be overpast — superscript "when he fled from Saul
--                in the cave"); Psalm 7:1 (save me from all them that persecute me)
--                -> THREAD 4
--   v.21-22 (swear thou wilt not cut off my seed... David sware): name/seed
--            preservation; covenant oath — recorded, none warranted (narrative close).
--
-- THREADS:
--   1. 1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand
--        targets: canon Tanakh (1 Samuel 26; Psalm 105)        tier free
--   2. 1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his
--        targets: NT (Romans 12) + canon Tanakh (Deut 32; Psalm 7; Proverbs 20)  tier free
--   3. 1-samuel-24-thou-art-more-righteous-than-i-good-for-evil
--        targets: NT (Matthew 5; Romans 12; 1 Peter 2) + canon Tanakh (Proverbs 20)  tier free
--   4. 1-samuel-24-in-the-shadow-of-thy-wings-david-hidden-in-the-cave
--        targets: canon Tanakh (Psalm 57; Psalm 7)              tier free
--

CREATE TEMP VIEW _s340_1sa24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the LORD'S anointed — I will not stretch forth mine hand
    ('canon','1-samuel',24,6,'canon','1-samuel',26,9,'free',
     E'When the same chance comes a second time, in the camp of Ziph, David gives the identical verdict: *And David said to Abishai, Destroy him not: for who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9). Here in the cave David first lays the law down for himself — *Yahuah (LORD) forbid that I should do this thing unto my master, the LORD''S anointed, to stretch forth mine hand against him* (24:6) — honouring the anointed office even over a wicked man who hunts his life.'),
    ('canon','1-samuel',24,6,'canon','1-samuel',26,11,'free',
     E'David repeats the refusal as an oath in the night camp: *Yahuah (LORD) forbid that I should stretch forth mine hand against the LORD''S anointed* (1 Samuel 26:11) — the very words of the cave, *Yahuah (LORD) forbid that I should do this thing unto my master, the LORD''S anointed* (24:6). Twice the kingdom is set in his hand by chance, and twice he will not seize it by his own blood-guilt.'),
    ('canon','1-samuel',24,6,'canon','psalms',105,15,'free',
     E'The song of the fathers names the protection David honours: *Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). David, himself already anointed, will not be the hand that touches Yahuah''s standing anointed — *seeing he is the anointed of Yahuah (LORD)* (24:6) — leaving the office in the hand of the One who set it there.'),
    ('canon','1-samuel',24,10,'canon','1-samuel',26,9,'free',
     E'David tells Saul plainly what restrained him: *I said, I will not put forth mine hand against my lord; for he is the LORD''S anointed* (24:10). It is the same guiltlessness he later presses on Abishai — *who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9). The deliverance into his hand is no warrant; the anointing is Yahuah''s to give and to remove.'),
    -- THREAD 2: Yahuah judge between us — vengeance is his
    ('canon','1-samuel',24,12,'canon','romans',12,19,'free',
     E'David lays the whole quarrel before the Judge and stays his own hand: *Yahuah (LORD) judge between me and thee, and Yahuah (LORD) avenge me of thee: but mine hand shall not be upon thee* (24:12). Sha''ul (Paul) draws the same line from the same Torah: *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The avenging is left to Yahuah, never seized by the wronged.'),
    ('canon','1-samuel',24,12,'canon','deuteronomy',32,35,'free',
     E'The reservation David honours is written in the Song of Moses: *To me belongeth vengeance, and recompence; their foot shall slide in due time* (Deuteronomy 32:35). So David: *Yahuah (LORD) avenge me of thee: but mine hand shall not be upon thee* (24:12) — he will not take into his own hand what belongs to Yahuah''s.'),
    ('canon','1-samuel',24,15,'canon','psalms',7,8,'free',
     E'David asks Yahuah to plead his cause rather than plead it with the sword: *Yahuah (LORD) therefore be judge, and judge between me and thee, and see, and plead my cause, and deliver me out of thine hand* (24:15). The psalm of the hunted man prays the same court: *Yahuah (LORD) shall judge the people: judge me, O Yahuah (LORD), according to my righteousness, and according to mine integrity that is in me* (Psalm 7:8). The clean hand appeals to the Judge, not to revenge.'),
    ('canon','1-samuel',24,12,'canon','proverbs',20,22,'free',
     E'Wisdom states the rule David lives in the cave: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). David''s own word — *Yahuah (LORD) avenge me of thee: but mine hand shall not be upon thee* (24:12) — is exactly this waiting: the recompense refused, the salvation left to Yahuah.'),
    -- THREAD 3: thou art more righteous than I — good for evil
    ('canon','1-samuel',24,17,'canon','matthew',5,44,'free',
     E'Saul confesses the thing David has just done: *Thou art more righteous than I: for thou hast rewarded me good, whereas I have rewarded thee evil* (24:17). The Formed Son names this very righteousness on the mount: *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you* (Matthew 5:44). David, hunted, has rewarded his persecutor good — the kingdom-righteousness made flesh ahead of time.'),
    ('canon','1-samuel',24,19,'canon','romans',12,21,'free',
     E'Saul marvels that an enemy was let go alive: *For if a man find his enemy, will he let him go well away? wherefore Yahuah (LORD) reward thee good for that thou hast done unto me this day* (24:19). This is the very victory Sha''ul (Paul) commands: *Be not overcome of evil, but overcome evil with good* (Romans 12:21). David overcomes Saul not by the spear but by the good he renders.'),
    ('canon','1-samuel',24,17,'canon','1-peter',2,23,'free',
     E'David, reviled and hunted, returns good and commits the cause to Yahuah — the pattern Kepha (Peter) sets in the Messiah: *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). Saul''s confession — *thou hast rewarded me good, whereas I have rewarded thee evil* (24:17) — measures the man who would not strike back; David is the suffering, non-retaliating type the Anointed One fills.'),
    ('canon','1-samuel',24,19,'canon','proverbs',20,22,'free',
     E'Saul foresees the reward of the man who would not avenge himself: *wherefore Yahuah (LORD) reward thee good for that thou hast done unto me this day* (24:19) — the very promise to the one who refuses recompense, *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). The good rendered to the enemy returns as Yahuah''s own saving reward.'),
    -- THREAD 4: in the shadow of thy wings — David hidden in the cave
    ('canon','1-samuel',24,15,'canon','psalms',57,1,'free',
     E'David asks to be delivered out of Saul''s hand: *and see, and plead my cause, and deliver me out of thine hand* (24:15). The psalm sung in this very cave answers where his refuge lies: *Be merciful unto me, O Elohim (God), be merciful unto me: for my soul trusteth in thee: yea, in the shadow of thy wings will I make my refuge, until these calamities be overpast* (Psalm 57:1). The hunted king hides not in his own strength but under Yahuah''s wing.'),
    ('canon','1-samuel',24,15,'canon','psalms',7,1,'free',
     E'David''s plea — *deliver me out of thine hand* (24:15) — is the cry of the persecuted man set to song: *O Yahuah (LORD) my Elohim (God), in thee do I put my trust: save me from all them that persecute me, and deliver me* (Psalm 7:1). The deliverance he will not take by his own hand he asks of Yahuah''s.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand',
       E'The LORD''S Anointed — I Will Not Stretch Forth Mine Hand',
       E'Saul, who hunts David''s life with three thousand men, walks alone into the very cave where David hides. David''s men read it as Yahuah''s gift: *Behold the day of which Yahuah (LORD) said unto thee, Behold, I will deliver thine enemy into thine hand, that thou mayest do to him as it shall seem good unto thee* (24:4). David cuts only the skirt of the robe — and even that pricks him: *And it came to pass afterward, that David''s heart smote him, because he had cut off Saul''s skirt* (24:5). His verdict is fixed: *Yahuah (LORD) forbid that I should do this thing unto my master, the LORD''S anointed, to stretch forth mine hand against him, seeing he is the anointed of Yahuah (LORD)* (24:6); and to Saul, *I will not put forth mine hand against my lord; for he is the LORD''S anointed* (24:10). The anointing is Yahuah''s to give and to take, never David''s to seize by blood. When the same trial comes again in the camp at Ziph he answers identically — *who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9), *Yahuah (LORD) forbid that I should stretch forth mine hand against the LORD''S anointed* (1 Samuel 26:11). The song of the fathers had set the hedge David honours: *Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). The man already anointed king will not be the hand that touches the anointed he is to replace.',
       sv.verse_id, ev.verse_id, 'free', 36975
  FROM _s340_1sa24_lookup sv, _s340_1sa24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=24 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his',
       E'Yahuah Judge Between Me and Thee — Vengeance Is His',
       E'David could have ended his ordeal with one stroke; instead he hands the whole case to the Judge and stays his own hand: *Yahuah (LORD) judge between me and thee, and Yahuah (LORD) avenge me of thee: but mine hand shall not be upon thee* (24:12); *Yahuah (LORD) therefore be judge, and judge between me and thee, and see, and plead my cause, and deliver me out of thine hand* (24:15). This is no weakness — it is obedience to a reservation written into the Song of Moses: *To me belongeth vengeance, and recompence; their foot shall slide in due time* (Deuteronomy 32:35). Wisdom states the same rule for the wronged man: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). The psalm of the hunted appeals to that same court rather than to the sword: *Yahuah (LORD) shall judge the people: judge me, O Yahuah (LORD), according to my righteousness, and according to mine integrity that is in me* (Psalm 7:8). And Sha''ul (Paul) draws the line straight out of the Torah for every wronged believer: *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The avenging belongs to Yahuah; the clean hand waits.',
       sv.verse_id, ev.verse_id, 'free', 36978
  FROM _s340_1sa24_lookup sv, _s340_1sa24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=24 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-24-thou-art-more-righteous-than-i-good-for-evil',
       E'Thou Art More Righteous Than I — Good for Evil',
       E'When David lifts his voice from the cave-mouth and shows the severed skirt, even Saul cannot deny what he has seen: *Thou art more righteous than I: for thou hast rewarded me good, whereas I have rewarded thee evil* (24:17); *For if a man find his enemy, will he let him go well away? wherefore Yahuah (LORD) reward thee good for that thou hast done unto me this day* (24:19). David, hunted and reviled, has answered his persecutor with mercy — the very righteousness the Formed Son names on the mount: *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you* (Matthew 5:44). It is the victory Sha''ul (Paul) commands: *Be not overcome of evil, but overcome evil with good* (Romans 12:21); and the promise of wisdom to the one who will not recompense: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). David is the suffering, non-retaliating type the Anointed One fills: *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). The persecuted who returns good for evil and leaves the verdict to Yahuah — David in the cave, and David''s greater Son.',
       sv.verse_id, ev.verse_id, 'free', 36981
  FROM _s340_1sa24_lookup sv, _s340_1sa24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=24 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-24-in-the-shadow-of-thy-wings-david-hidden-in-the-cave',
       E'In the Shadow of Thy Wings — David Hidden in the Cave',
       E'David, the king already anointed but driven into the rocks of the wild goats, asks Yahuah to be his deliverer rather than taking deliverance by his own spear: *and see, and plead my cause, and deliver me out of thine hand* (24:15). The psalm whose superscription places it in this very cave shows where the hunted man takes shelter: *Be merciful unto me, O Elohim (God), be merciful unto me: for my soul trusteth in thee: yea, in the shadow of thy wings will I make my refuge, until these calamities be overpast* (Psalm 57:1). And the song of the persecuted prays the same trust: *O Yahuah (LORD) my Elohim (God), in thee do I put my trust: save me from all them that persecute me, and deliver me* (Psalm 7:1). The deliverance David will not seize with his hand he asks of Yahuah''s — hidden in the cave, hidden under the wing.',
       sv.verse_id, ev.verse_id, 'free', 36984
  FROM _s340_1sa24_lookup sv, _s340_1sa24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=24 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9) — the same refusal at the second sparing, in the camp of Ziph.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=6
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=26 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) forbid that I should stretch forth mine hand against the LORD''S anointed* (1 Samuel 26:11) — the cave-oath repeated in the night camp.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=6
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=26 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Touch not mine anointed, and do my prophets no harm* (Psalm 105:15) — the hedge of the fathers David honours.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=6
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*who can stretch forth his hand against the LORD''S anointed, and be guiltless?* (1 Samuel 26:9) — David''s plea to Saul (24:10) is the guiltlessness he later presses on Abishai.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=10
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=26 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-the-lords-anointed-i-will-not-stretch-forth-mine-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19) — Sha''ul (Paul) draws the same line from the Torah David lives.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To me belongeth vengeance, and recompence* (Deuteronomy 32:35) — the reservation in the Song of Moses David will not trespass.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) shall judge the people: judge me, O Yahuah (LORD)* (Psalm 7:8) — the hunted man appeals to the court, not to revenge.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22) — the wisdom-rule David enacts in the cave.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-yahuah-judge-between-me-and-thee-vengeance-is-his'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Love your enemies, bless them that curse you, do good to them that hate you* (Matthew 5:44) — the kingdom-righteousness David lives ahead of time.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=17
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-thou-art-more-righteous-than-i-good-for-evil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be not overcome of evil, but overcome evil with good* (Romans 12:21) — David overcomes Saul by the good he renders, not the spear.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=19
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-thou-art-more-righteous-than-i-good-for-evil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when he was reviled, reviled not again... but committed himself to him that judgeth righteously* (1 Peter 2:23) — David the non-retaliating type the Anointed One fills.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=17
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-thou-art-more-righteous-than-i-good-for-evil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22) — Saul foresees the saving reward of the man who would not avenge himself.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=19
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-thou-art-more-righteous-than-i-good-for-evil'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*in the shadow of thy wings will I make my refuge, until these calamities be overpast* (Psalm 57:1) — the psalm sung in this very cave.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=57 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-in-the-shadow-of-thy-wings-david-hidden-in-the-cave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*in thee do I put my trust: save me from all them that persecute me, and deliver me* (Psalm 7:1) — the deliverance David asks of Yahuah''s hand, not his own.'
  FROM cross_reference_threads t
  JOIN _s340_1sa24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s340_1sa24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-24-in-the-shadow-of-thy-wings-david-hidden-in-the-cave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-samuel_25.sql (1 Samuel 25) -----
--
-- Book/chapter: 1 Samuel 25    Tag: 1sa25    View: _s340_1sa25_lookup
-- Sort band: base 37000, step 3  ->  37000, 37003, 37006, 37009, 37012
--
-- 1 Samuel 25 coverage:
--   v.1  (Samuel died; all the Israelites... lamented him, and buried him) -> THREAD 1 source/anchor-start
--        NT:     none warranted (the prophet's death; no NT abrogation)
--        Extras: none warranted
--        Tanakh: 1 Samuel 28:3 (Samuel was dead, and all Yashar'el had lamented him, and buried him in Ramah) -> THREAD 1
--   v.3  (the name of his wife Abigail: a woman of good understanding... but the man was churlish and evil) -> THREAD 5 source
--        NT:     none warranted
--        Extras: Ecclesiasticus 26:1-3,13 (a virtuous wife... her discretion will fatten his bones) -> THREAD 5
--        Tanakh: Proverbs 31:26,30 (she openeth her mouth with wisdom... a woman that feareth Yahuah) -> THREAD 5
--   v.21 (he hath requited me evil for good) -> THREAD 3 source
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Proverbs 17:13 (Whoso rewardeth evil for good, evil shall not depart from his house) -> THREAD 3
--   v.26 (Yahuah hath withholden thee from coming to shed blood, and from avenging thyself with thine own hand) -> THREAD 2 source/anchor
--        NT:     Romans 12:19 (avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah);
--                1 Thessalonians 5:15 (See that none render evil for evil unto any man) -> THREAD 2
--        Extras: Ecclesiasticus 28:1-2 (He that revengeth shall find vengeance from Yahuah... Forgive your neighbour) -> THREAD 2
--        Tanakh: Deuteronomy 32:35 (To me belongeth vengeance, and recompence); Proverbs 20:22 (Say not... I will
--                recompense evil; but wait on Yahuah); 1 Samuel 26:10 (As Yahuah liveth, Yahuah shall smite him) -> THREAD 2
--   v.28 (Yahuah will certainly make my lord a sure house... evil hath not been found in thee) -> THREAD 4 source
--        NT:     none warranted (the sure house kept LATERALLY in 2 Samuel 7)
--        Extras: none warranted
--        Tanakh: 2 Samuel 7:11,13,16 (Yahuah... will make thee an house... thy throne established for ever) -> THREAD 4
--   v.29 (the soul of my lord shall be bound in the bundle of life with Yahuah Elohayka) -> THREAD 4 source/anchor-end
--   v.31 (this shall be no grief... that thou hast shed blood causeless, or that my lord hath avenged himself) -> THREAD 2 source
--   v.32-33 (Blessed be Yahuah... blessed be thy advice, which hast kept me this day from... avenging myself) -> THREAD 2 + THREAD 5 source
--   v.39 (Yahuah hath returned the wickedness of Nabal upon his own head) -> THREAD 3 source/anchor-end
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 37:7-9 (Rest in Yahuah... Cease from anger... evildoers shall be cut off);
--                Proverbs 17:13 (evil shall not depart from his house) -> THREAD 3
--   vv.2,4-20,22-25,27,30,34-38,40-44 -> narrative connective (Nabal's churlishness, David's vow, Abigail's gift,
--        the marriage); framed in the thread prose, no separate add warranted.
--
-- THREADS:
--   1-samuel-25-samuel-died-and-all-yasharel-lamented-the-prophet (free) -> Tanakh (1 Samuel 28)
--   1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand (extras) -> NT (Romans, 1 Thessalonians) + Tanakh (Deuteronomy, Proverbs, 1 Samuel 26) + Extras (Ecclesiasticus)
--   1-samuel-25-yahuah-returned-the-wickedness-of-nabal-upon-his-own-head (free) -> Tanakh (Proverbs 17, Psalm 37)
--   1-samuel-25-yahuah-will-make-my-lord-a-sure-house-bound-in-the-bundle-of-life (free) -> Tanakh (2 Samuel 7 x3)
--   1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife (extras) -> Tanakh (Proverbs 31 x2) + Extras (Ecclesiasticus 26 x2)
--
-- Framework-load-bearing framing:
--   * 25:26,31,32-33 — the keystone of the chapter (and the twin of ch24/26): Abigail intercepts David's vow of slaughter,
--     and David BLESSES the restraint. Vengeance is not his to take; it belongs to Yahuah (Deuteronomy 32:35, *To me belongeth
--     vengeance*), the very text Romans 12:19 quotes (*avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah*).
--     The Torah-lesson and the apostolic word are ONE; 1 Thessalonians 5:15 and Proverbs 20:22 carry the same. The restrained
--     hand here is the same hand that spared Saul (1 Samuel 26:10, *Yahuah shall smite him*).
--   * 25:28-29 — *a sure house* is the Davidic covenant in seed-form, kept LATERALLY in 2 Samuel 7:11-16 (*Yahuah... will make
--     thee an house... thy throne shall be established for ever*); *the bundle of life with Yahuah* — the righteous soul bound up
--     with the living Elohim, the enemies slung out. Seed-of-promise / the sure house of David.
--   * 25:39 — Yahuah Himself, not David's sword, repays Nabal (*Yahuah hath returned the wickedness of Nabal upon his own head*);
--     Proverbs 17:13 (*evil shall not depart from his house*) and Psalm 37:7-9 (*Cease from anger... evildoers shall be cut off*)
--     name the principle. The avenger is Yahuah.
--   * 25:3,33 — Abigail, *a woman of good understanding*, the wise wife whose counsel saves; Proverbs 31 (*she openeth her mouth
--     with wisdom... a woman that feareth Yahuah*) and Sirach 26 (*a virtuous wife... her discretion will fatten his bones*)
--     are the wisdom-portrait she fills.

CREATE TEMP VIEW _s340_1sa25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Samuel died, and all Yashar'el lamented the prophet
    ('canon','1-samuel',25,1,'canon','1-samuel',28,3,'free',
      E'*Now Samuel was dead, and all Yashar''el (Israel) had lamented him, and buried him in Ramah, even in his own city. And Saul had put away those that had familiar spirits, and the wizards, out of the land* (1 Samuel 28:3). The chapter opens with the prophet''s death — *And Samuel died; and all the Israelites were gathered together, and lamented him, and buried him in his house at Ramah* (1 Samuel 25:1) — and the narrator re-marks it when Saul, bereft of the seer, turns to the witch of Endor (1 Samuel 28:3). The man who anointed both kings is gone; the lamp of prophecy laid in the ground at Ramah, and the land left to its own folly.'),

    -- THREAD 2: Yahuah hath withholden thee from avenging thyself with thine own hand
    ('canon','1-samuel',25,26,'canon','deuteronomy',32,35,'free',
      E'*To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste* (Deuteronomy 32:35). Abigail names the very Torah-principle: *seeing Yahuah (LORD) hath withholden thee from coming to shed blood, and from avenging thyself with thine own hand* (1 Samuel 25:26). Recompence is Yahuah''s portion, not David''s sword — the wise woman bends the future king back to the Song of Moses.'),
    ('canon','1-samuel',25,26,'canon','romans',12,19,'free',
      E'*Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The apostle quotes the very word Abigail lives — *Yahuah (LORD) hath withholden thee from... avenging thyself with thine own hand* (1 Samuel 25:26). The restrained hand of David in the wilderness is the same lesson Paul writes to Rome; the Torah and the apostle speak with one mouth: the wronged man gives place to wrath, and lets Yahuah repay.'),
    ('canon','1-samuel',25,26,'canon','proverbs',20,22,'free',
      E'*Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). This is Abigail''s counsel in a proverb: do not seize the recompence — *avenging thyself with thine own hand* (1 Samuel 25:26) — but wait for the One who saves. The man who waits is delivered; the man who repays himself forfeits the deliverance Yahuah would have wrought.'),
    ('canon','1-samuel',25,26,'canon','1-samuel',26,10,'free',
      E'*David said furthermore, As Yahuah (LORD) liveth, Yahuah (LORD) shall smite him; or his day shall come to die; or he shall descend into battle, and perish* (1 Samuel 26:10). The lesson Abigail teaches in chapter 25 David himself speaks over Saul in chapter 26: he will not stretch out his hand against the anointed, for *Yahuah (LORD) shall smite him*. The withheld hand of 25:26 becomes David''s own settled creed — vengeance left wholly with Yahuah.'),
    ('canon','1-samuel',25,26,'apocrypha','ecclesiasticus',28,1,'extras',
      E'*He that revengeth shall find vengeance from Yahuah (God), and he will surely keep his sins in remembrance* (Ecclesiasticus 28:1). The sage of Sirach echoes Abigail''s plea word for word in substance — the one who takes his own vengeance is himself overtaken by it. Abigail spares David from that snare: *Yahuah (LORD) hath withholden thee from coming to shed blood, and from avenging thyself with thine own hand* (1 Samuel 25:26).'),
    ('canon','1-samuel',25,33,'canon','1-thessalonians',5,15,'free',
      E'*See that none render evil for evil unto any man; but ever follow that which is good, both among yourselves, and to all men* (1 Thessalonians 5:15). David blesses Abigail precisely for keeping him from rendering evil for evil — *blessed be thy advice, and blessed be thou, which hast kept me this day from coming to shed blood, and from avenging myself with mine own hand* (1 Samuel 25:33). The counsel the apostle gives Thessalonica is the counsel that stayed David''s sword in the wilderness.'),
    ('canon','1-samuel',25,33,'apocrypha','ecclesiasticus',28,2,'extras',
      E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Ecclesiasticus 28:2). The advice David blesses — *which hast kept me this day from coming to shed blood, and from avenging myself with mine own hand* (1 Samuel 25:33) — is the wisdom of Sirach made flesh: release the wrong, and you are released. Abigail''s counsel is mercy that frees the giver no less than the spared.'),

    -- THREAD 3: Yahuah hath returned the wickedness of Nabal upon his own head
    ('canon','1-samuel',25,39,'canon','proverbs',17,13,'free',
      E'*Whoso rewardeth evil for good, evil shall not depart from his house* (Proverbs 17:13). Nabal rewarded David''s kindness with scorn — *he hath requited me evil for good* (1 Samuel 25:21) — and the proverb''s sentence falls upon him: *Yahuah (LORD) hath returned the wickedness of Nabal upon his own head* (1 Samuel 25:39). The evil he sent out did not depart from his house; it came home and slew him.'),
    ('canon','1-samuel',25,39,'canon','psalms',37,9,'free',
      E'*For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9). David did not cut Nabal off; he waited, and Yahuah did it — *Yahuah (LORD) hath returned the wickedness of Nabal upon his own head* (1 Samuel 25:39). The Psalm''s whole counsel governs the scene: *Rest in Yahuah (LORD)... Cease from anger, and forsake wrath* (Psalm 37:7-8), and watch the evildoer cut off by the hand of Yahuah, not your own.'),
    ('canon','1-samuel',25,21,'canon','proverbs',17,13,'free',
      E'*Whoso rewardeth evil for good, evil shall not depart from his house* (Proverbs 17:13). David''s complaint names exactly what Nabal did — *and he hath requited me evil for good* (1 Samuel 25:21). The proverb foretells the churl''s end before it comes: the evil he returned for good will not leave his house, but lodge there until it strikes him down (1 Samuel 25:38).'),

    -- THREAD 4: Yahuah will make my lord a sure house — bound in the bundle of life
    ('canon','1-samuel',25,28,'canon','2-samuel',7,11,'free',
      E'*And as since the time that I commanded judges to be over my people Yashar''el (Israel), and have caused thee to rest from all thine enemies. Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11). Abigail prophesies in seed-form what Nathan will later declare in full — *for Yahuah (LORD) will certainly make my lord a sure house; because my lord fighteth the battles of Yahuah (LORD)* (1 Samuel 25:28). The sure house the wise woman names is the Davidic covenant itself.'),
    ('canon','1-samuel',25,28,'canon','2-samuel',7,13,'free',
      E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The *sure house* Abigail foresees — *Yahuah (LORD) will certainly make my lord a sure house* (1 Samuel 25:28) — is the house whose throne Yahuah Himself establishes for ever, the everlasting kingdom of the seed of David, carrying the promise forward to the Branch.'),
    ('canon','1-samuel',25,28,'canon','2-samuel',7,16,'free',
      E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). What Abigail calls *a sure house* (1 Samuel 25:28) Yahuah seals as a house *established for ever* — the unbroken Davidic line, the throne that does not fail, the covenant-word standing over David long before he sits a king.'),

    -- THREAD 5: Abigail, a woman of good understanding — the wise wife
    ('canon','1-samuel',25,3,'canon','proverbs',31,26,'free',
      E'*She openeth her mouth with wisdom; and in her tongue is the law of kindness* (Proverbs 31:26). The portrait of *a woman of good understanding* (1 Samuel 25:3) is filled out in the virtuous woman of Proverbs: Abigail opens her mouth with wisdom, and her tongue carries the law of kindness that turns David from blood. The wise wife''s speech is the saving of a house.'),
    ('canon','1-samuel',25,3,'canon','proverbs',31,30,'free',
      E'*Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised* (Proverbs 31:30). Abigail is *of a beautiful countenance* (1 Samuel 25:3), yet it is not her beauty but her fear of Yahuah — her plea *as Yahuah (LORD) liveth* (1 Samuel 25:26) — that makes her praised. The proverb weighs the two and crowns the woman who fears Yahuah, as David crowns Abigail''s counsel.'),
    ('canon','1-samuel',25,3,'apocrypha','ecclesiasticus',26,1,'extras',
      E'*Blessed is the man that has a virtuous wife, for the number of his days shall be double* (Ecclesiasticus 26:1). Nabal had *a woman of good understanding* (1 Samuel 25:3) and squandered her; David received her and was blessed. Sirach names the gift the churl despised: the virtuous wife who lengthens her husband''s days — the very life Nabal forfeited and David gained.'),
    ('canon','1-samuel',25,3,'apocrypha','ecclesiasticus',26,13,'extras',
      E'*The grace of a wife delighteth her husband, and her discretion will fatten his bones* (Ecclesiasticus 26:13). Abigail''s discretion is the whole engine of the chapter — *a woman of good understanding* (1 Samuel 25:3) whose quiet wisdom *kept me this day from coming to shed blood* (1 Samuel 25:33). Sirach names the grace she carried: the discreet wife whose understanding is the strength of the house.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-25-samuel-died-and-all-yasharel-lamented-the-prophet',
       E'Samuel died, and all Yashar''el lamented the prophet',
       E'The chapter opens with a death: *And Samuel died; and all the Israelites were gathered together, and lamented him, and buried him in his house at Ramah* (1 Samuel 25:1). The seer who anointed Saul and then David is gone, mourned by the whole people and laid in the ground at Ramah. The narrator marks it once more when Saul, stripped of the prophet, goes seeking the witch of Endor: *Now Samuel was dead, and all Yashar''el (Israel) had lamented him, and buried him in Ramah, even in his own city* (1 Samuel 28:3). With the prophet gone, the land is left to test whether it will walk in the wisdom he taught — and in this very chapter the test comes through Abigail''s counsel and Nabal''s folly.',
       sv.verse_id, ev.verse_id, 'free', 37000
  FROM _s340_1sa25_lookup sv, _s340_1sa25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=25 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand',
       E'Yahuah hath withholden thee from avenging thyself with thine own hand',
       E'David rides out to slaughter every male of Nabal''s house in his own vengeance — *So and more also do Elohim (God) unto the enemies of David, if I leave... any that pisseth against the wall* (1 Samuel 25:22). Abigail intercepts him with the deepest word of the chapter: *seeing Yahuah (LORD) hath withholden thee from coming to shed blood, and from avenging thyself with thine own hand* (1 Samuel 25:26). This is the Song of Moses lived out — *To me belongeth vengeance, and recompence* (Deuteronomy 32:35) — the very text the apostle quotes: *avenge not yourselves... Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19). The proverb says it plainly: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22), and the apostle to Thessalonica: *See that none render evil for evil unto any man* (1 Thessalonians 5:15). David BLESSES the restraint — *blessed be thy advice... which hast kept me this day from coming to shed blood, and from avenging myself with mine own hand* (1 Samuel 25:32-33) — and carries the lesson into the next chapter, refusing again to lift his hand against Saul: *As Yahuah (LORD) liveth, Yahuah (LORD) shall smite him* (1 Samuel 26:10). The sage of Sirach seals it: *He that revengeth shall find vengeance from Yahuah (God)... Forgive your neighbour the hurt that he has done to you* (Ecclesiasticus 28:1-2). The wronged man gives place to wrath and lets Yahuah be the avenger.',
       sv.verse_id, ev.verse_id, 'extras', 37003
  FROM _s340_1sa25_lookup sv, _s340_1sa25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=25 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-25-yahuah-returned-the-wickedness-of-nabal-upon-his-own-head',
       E'Yahuah returned the wickedness of Nabal upon his own head',
       E'Nabal — whose name means folly — returned scorn for David''s kindness: *Surely in vain have I kept all that this fellow hath in the wilderness... and he hath requited me evil for good* (1 Samuel 25:21). Because David''s hand was withheld, the repaying fell to Yahuah Himself: ten days after, *Yahuah (LORD) smote Nabal, that he died* (1 Samuel 25:38), and David confessed it: *Blessed be Yahuah (LORD)... for Yahuah (LORD) hath returned the wickedness of Nabal upon his own head* (1 Samuel 25:39). The proverb had already sentenced him: *Whoso rewardeth evil for good, evil shall not depart from his house* (Proverbs 17:13) — the evil Nabal sent out did not leave his house but lodged there until it struck him down. And the Psalm sets the whole pattern: *Rest in Yahuah (LORD), and wait patiently for him... Cease from anger, and forsake wrath* (Psalm 37:7-8), *for evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9). David waited; Yahuah cut off the fool.',
       sv.verse_id, ev.verse_id, 'free', 37006
  FROM _s340_1sa25_lookup sv, _s340_1sa25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=25 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-25-yahuah-will-make-my-lord-a-sure-house-bound-in-the-bundle-of-life',
       E'Yahuah will make my lord a sure house — bound in the bundle of life',
       E'Abigail prophesies the Davidic covenant in seed-form, long before Nathan declares it: *for Yahuah (LORD) will certainly make my lord a sure house; because my lord fighteth the battles of Yahuah (LORD), and evil hath not been found in thee all thy days* (1 Samuel 25:28). What she calls *a sure house* Yahuah will seal through Nathan: *Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11); *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13); *And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The wise woman sees it before the throne is ever sat — the unbroken house of David, the seed of promise carried to the Branch. And she names the safety of the soul itself: *the soul of my lord shall be bound in the bundle of life with Yahuah Elohayka (the LORD thy God); and the souls of thine enemies, them shall he sling out, as out of the middle of a sling* (1 Samuel 25:29) — the righteous bound up with the living Elohim, the wicked flung away.',
       sv.verse_id, ev.verse_id, 'free', 37009
  FROM _s340_1sa25_lookup sv, _s340_1sa25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=25 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife',
       E'Abigail, a woman of good understanding — the wise wife',
       E'*And the name of his wife Abigail: and she was a woman of good understanding, and of a beautiful countenance: but the man was churlish and evil in his doings* (1 Samuel 25:3). The whole rescue turns on her wisdom — she *openeth her mouth with wisdom; and in her tongue is the law of kindness* (Proverbs 31:26), and David blesses her for it: *blessed be thy advice, and blessed be thou, which hast kept me this day from coming to shed blood* (1 Samuel 25:33). It is not her beauty that saves but her fear of Yahuah — *as Yahuah (LORD) liveth* (1 Samuel 25:26) — exactly as the proverb weighs it: *Favour is deceitful, and beauty is vain: but a woman that feareth Yahuah (LORD), she shall be praised* (Proverbs 31:30). The wisdom of Sirach names the gift Nabal squandered and David received: *Blessed is the man that has a virtuous wife, for the number of his days shall be double* (Ecclesiasticus 26:1), and *the grace of a wife delighteth her husband, and her discretion will fatten his bones* (Ecclesiasticus 26:13). The churl despised the wise wife and died; the man after Yahuah''s heart took her, and lived.',
       sv.verse_id, ev.verse_id, 'extras', 37012
  FROM _s340_1sa25_lookup sv, _s340_1sa25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-samuel' AND ev.chapter_number=25 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Now Samuel was dead, and all Yashar''el (Israel) had lamented him, and buried him in Ramah, even in his own city* (1 Samuel 28:3) — the prophet''s death re-marked as Saul turns to the witch of Endor, sealing the lament of 1 Samuel 25:1.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=1
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=28 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-samuel-died-and-all-yasharel-lamented-the-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To me belongeth vengeance, and recompence* (Deuteronomy 32:35) — the Song of Moses that grounds Abigail''s plea; recompence is Yahuah''s portion, not David''s hand.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Vengeance is mine; I will repay, saith Yahuah (Lord)* (Romans 12:19) — the apostle quotes the same word Abigail lives; the Torah and the apostle speak with one mouth.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Say not thou, I will recompense evil; but wait on Yahuah (LORD)* (Proverbs 20:22) — Abigail''s counsel in a proverb; wait, and Yahuah saves.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*As Yahuah (LORD) liveth, Yahuah (LORD) shall smite him* (1 Samuel 26:10) — David carries the withheld-hand lesson into the next chapter, sparing Saul on the same ground.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=26 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He that revengeth shall find vengeance from Yahuah (God)* (Ecclesiasticus 28:1) — Sirach''s sage warns the avenger is overtaken by his own vengeance; the snare Abigail spares David.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*See that none render evil for evil unto any man* (1 Thessalonians 5:15) — the apostolic counsel that stayed David''s sword; the very thing David blesses Abigail for in 1 Samuel 25:33.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=33
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Forgive your neighbour the hurt that he has done to you* (Ecclesiasticus 28:2) — Sirach''s mercy that frees the giver; the wisdom David blesses in 1 Samuel 25:33.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=33
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-hath-withholden-thee-from-avenging-thyself-with-thine-own-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Whoso rewardeth evil for good, evil shall not depart from his house* (Proverbs 17:13) — the proverb sentencing Nabal, who requited David evil for good; the evil came home and slew him (1 Samuel 25:39).'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=39
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-returned-the-wickedness-of-nabal-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9) — the pattern David kept: he waited, and Yahuah cut off the fool.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=39
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-returned-the-wickedness-of-nabal-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Whoso rewardeth evil for good, evil shall not depart from his house* (Proverbs 17:13) — foretelling the churl''s end from David''s very complaint, *he hath requited me evil for good* (1 Samuel 25:21).'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=21
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-returned-the-wickedness-of-nabal-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11) — Nathan declares in full what Abigail prophesied in seed-form: the sure house of David.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=28
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-will-make-my-lord-a-sure-house-bound-in-the-bundle-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the sure house whose throne Yahuah establishes for ever, the seed of David carried to the Branch.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=28
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-will-make-my-lord-a-sure-house-bound-in-the-bundle-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And thine house and thy kingdom shall be established for ever* (2 Samuel 7:16) — what Abigail calls a sure house, Yahuah seals as established for ever, the unbroken Davidic line.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=28
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-yahuah-will-make-my-lord-a-sure-house-bound-in-the-bundle-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*She openeth her mouth with wisdom; and in her tongue is the law of kindness* (Proverbs 31:26) — the virtuous woman Abigail fills; her wise speech is the saving of a house.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a woman that feareth Yahuah (LORD), she shall be praised* (Proverbs 31:30) — not her beauty but her fear of Yahuah makes Abigail praised, as David crowns her counsel.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed is the man that has a virtuous wife, for the number of his days shall be double* (Ecclesiasticus 26:1) — the gift Nabal squandered and David received.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=26 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the grace of a wife delighteth her husband, and her discretion will fatten his bones* (Ecclesiasticus 26:13) — the discreet wife whose understanding is the strength of the house; Abigail''s discretion is the whole engine of the rescue.'
  FROM cross_reference_threads t
  JOIN _s340_1sa25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-samuel' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s340_1sa25_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=26 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-samuel-25-abigail-a-woman-of-good-understanding-the-wise-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session340 — 1 Samuel cross-references complete.'
