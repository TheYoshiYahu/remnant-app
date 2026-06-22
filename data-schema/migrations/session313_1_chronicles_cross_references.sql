-- =====================================================================
-- Session 313 — 1 Chronicles FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session313_1_chronicles_cross_references.sql
-- =====================================================================

\echo 'session313 — 1 Chronicles cross-references starting...'
BEGIN;

-- ----- fragment: minion_1-chronicles_1.sql (1 Chronicles 1) -----
-- Chapter: 1 Chronicles 1 — the genealogy from Adam to the patriarchs, the seed-line
-- Tag: chr01   Session prefix: s313   Temp view: _s313_chr01_lookup
-- Sort band: 30000-30002 (+1 per thread)
-- Source book_slug=1-chronicles, chapter 1 (canon)
--
-- This is a genealogy chapter — FEWER, framework-bearing threads (3), surfacing the
-- seed-line, not every name-block. The Chronicler opens the whole work with the
-- paternal bloodline from Adam through Noah to Abraham, then narrows to the covenant seed.
--
-- ===== PER-CHAPTER COVERAGE CHECKLIST =====
-- v.1-4  (Adam, Sheth, Enosh, Kenan, Mahalaleel, Jered, Henoch, Methuselah, Lamech,
--         Noah, Shem, Ham, and Japheth — the unbroken paternal line)
--        NT:     Luke 3:36-38 (Messiah's genealogy traced to Adam / son of Elohim);
--                Jude 1:14 (Enoch the seventh from Adam) — BOTH used (thread 1)
--        Extras: Jubilees 4:32 (Noah begat Shem, Ham, and Japheth — same seed-line) — used (thread 1)
--        Tanakh: Genesis 5:1 (book of the generations of Adam), Genesis 5:32 (Noah begat
--                Shem/Ham/Japheth), Genesis 11:10 (generations of Shem) — used (thread 1)
-- v.5-23 (Japheth/Ham/Shem's nations, table of nations, Nimrod, Peleg/earth divided)
--        NT:     none warranted (national lists)
--        Extras: none warranted here (covered laterally by Gen 10/11 already)
--        Tanakh: Genesis 10 / Genesis 11 are the lateral parent text — folded into the
--                seed-line thread via Gen 11:10 rather than a separate nations thread
-- v.24-27 (Shem...Abram; the same is Abraham — line narrows to the covenant head)
--        NT/Extras/Tanakh: carried by thread 1 (Gen 11:10 line into Abraham) + thread 2
-- v.28   (The sons of Abraham; Isaac, and Ishmael)
--        NT:     Romans 9:7 (In Isaac shall thy seed be called) — used (thread 2)
--        Extras: none warranted
--        Tanakh: Genesis 21:12 (in Isaac shall thy seed be called) — used (thread 2)
-- v.29-33 (Ishmael's sons, Keturah's sons — real bloodline, not the covenant line)
--        NT/Extras/Tanakh: none warranted (lateral to Gen 25); election framed by thread 2
-- v.34   (Abraham begat Isaac. The sons of Isaac; Esau and Yashar'el (Israel))
--        NT:     Romans 9:12-13 (the elder shall serve the younger; Jacob loved, Esau hated) — used (thread 2)
--        Extras: none warranted
--        Tanakh: Genesis 25:23 (two nations; elder shall serve the younger),
--                Malachi 1:2-3 (yet I loved Jacob, and I hated Esau) — used (thread 2)
-- v.35-42 (sons of Esau, sons of Seir — Edom's bloodline)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Genesis 36 (generations of Esau, who is Edom) — used (thread 3)
-- v.43-54 (kings and dukes of Edom before any king of Yashar'el)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Genesis 36:43; Numbers 24:18 (Edom a possession); Obadiah 1:10,18
--                (Edom cut off for violence against brother Jacob) — used (thread 3)
--
-- ===== THREADS =====
-- 1) 1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son  (band 30000)
--    targets: Tanakh (Gen 5:1, Gen 5:32, Gen 11:10) + NT (Luke 3:36, 3:38, Jude 1:14) + Extras (Jubilees 4:32)
--    tier_required=extras (Jubilees member). Anchors 1:1 -> 1:4.
-- 2) 1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau  (band 30001)
--    targets: Tanakh (Gen 21:12, Gen 25:23, Mal 1:2, Mal 1:3) + NT (Rom 9:7, 9:12, 9:13)
--    tier_required=free (all canon). Anchors 1:28 -> 1:34.
-- 3) 1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter  (band 30002)
--    targets: Tanakh (Gen 36:1, Gen 36:43, Num 24:18, Obadiah 1:10, Obadiah 1:18)
--    tier_required=free (all canon). Anchors 1:35 -> 1:54.
--
-- GUARD NOTES: seed-line = paternal bloodline the whole framework rests on (Son-of-Adam
-- lineage; Luke 3:38 traces Messiah to Adam = son of Elohim). Election of Isaac/Jacob =
-- covenant seed carried by bloodline AND covenant-word (Rom 9 election, NOT ethnic spite).
-- Edom = a real people under judgment for CONDUCT (violence against brother Jacob, Obad 1:10),
-- victims-not-enemies, not race-hatred.
-- Parse note: 1:2 reads "Kenan" (not "Cainan") and 1:1 "Sheth" — quoted exactly as parsed.

CREATE TEMP VIEW _s313_chr01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the seed-line from Adam to Noah (source 1:1 / 1:4)
    ('canon','1-chronicles',1,1,'canon','genesis',5,1,'free',
     E'*This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). The Chronicler opens his whole work with one bare line — *Adam, Sheth, Enosh* (1 Chronicles 1:1) — and it is the very book of the generations of Adam he is resuming. The seed-line begins at the first man made in Elohim''s likeness.'),
    ('canon','1-chronicles',1,4,'canon','genesis',5,32,'free',
     E'*And Noah was five hundred years old: and Noah begat Shem, Ham, and Japheth* (Genesis 5:32). The single word *Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4) gathers the whole pre-flood line into the one righteous father through whom the seed passed the flood — the spine bends at Noah but is never broken.'),
    ('canon','1-chronicles',1,4,'canon','genesis',11,10,'free',
     E'*These are the generations of Shem: Shem was an hundred years old, and begat Arphaxad two years after the flood* (Genesis 11:10). After Noah the line narrows to Shem — the very name the Chronicler lifts up at *Noah, Shem* (1 Chronicles 1:4) and then carries down to *Abram; the same is Abraham* (1 Chronicles 1:27). The covenant seed runs through Shem.'),
    ('canon','1-chronicles',1,1,'canon','luke',3,36,'free',
     E'*Which was the son of Cainan, which was the son of Arphaxad, which was the son of Sem, which was the son of Noe, which was the son of Lamech* (Luke 3:36). The Messiah''s own genealogy walks the SAME seed-line backward that *Adam, Sheth, Enosh* (1 Chronicles 1:1) walks forward — Noah, Shem, Arphaxad — the Son of Adam carried in the paternal bloodline the Chronicler is naming.'),
    ('canon','1-chronicles',1,1,'canon','luke',3,38,'free',
     E'*Which was the son of Enos, which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:38). Luke ends the Messiah''s line exactly where the Chronicler begins his — *Adam, Sheth, Enosh* (1 Chronicles 1:1) — and traces it past Adam to *the son of Elohim (God)*. The unbroken line from the first man is the line that bears the Formed Son in flesh.'),
    ('canon','1-chronicles',1,3,'canon','jude',1,14,'free',
     E'*And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). Where the Chronicler writes *Henoch, Methuselah, Lamech* (1 Chronicles 1:3), the New Testament counts him: Enoch is *the seventh from Adam* — the seventh name in this very seed-line — and a prophet of the coming of Yahuah.'),
    ('canon','1-chronicles',1,4,'jubilees','jubilees',4,32,'extras',
     E'*And in the twenty-fifth jubilee Noah took to himself a wife... and in the third year thereof she bare him Shem, in the fifth year thereof she bare him Ham, and in the first year in the sixth week she bare him Japheth* (Jubilees 4:32). Jubilees walks the same Adam-to-Noah seed-line and brings it to the same three sons the Chronicler names — *Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4) — the restored witness agreeing with the canon on the spine of the line.'),

    -- THREAD 2: the election of the seed — Isaac not Ishmael, Jacob not Esau (1:28 / 1:34)
    ('canon','1-chronicles',1,28,'canon','genesis',21,12,'free',
     E'*And Elohim (God) said unto Abraham... in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called* (Genesis 21:12). The Chronicler lists both — *The sons of Abraham; Isaac, and Ishmael* (1 Chronicles 1:28) — but the covenant word had already chosen: the seed is named in Isaac, not in the firstborn of the flesh. Bloodline AND covenant-word together carry the promise.'),
    ('canon','1-chronicles',1,28,'canon','romans',9,7,'free',
     E'*Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* (Romans 9:7). The apostle reads the Chronicler''s short list — *Isaac, and Ishmael* (1 Chronicles 1:28) — exactly: descent from Abraham alone is not the covenant; the seed is the one the covenant word calls. Lineage without the word is not the promised seed.'),
    ('canon','1-chronicles',1,34,'canon','genesis',25,23,'free',
     E'*And Yahuah (LORD) said unto her, Two nations are in thy womb... and the elder shall serve the younger* (Genesis 25:23). Where the Chronicler writes *The sons of Isaac; Esau and Yashar''el (Israel)* (1 Chronicles 1:34), the choice was spoken in the womb — two nations, the elder serving the younger — the covenant carried by the chosen, not by birth-order or mere descent.'),
    ('canon','1-chronicles',1,34,'canon','malachi',1,2,'free',
     E'*I have loved you, saith Yahuah (LORD)... Was not Esau Jacob''s brother? saith Yahuah (LORD): yet I loved Jacob* (Malachi 1:2). The two names the Chronicler sets side by side — *Esau and Yashar''el (Israel)* (1 Chronicles 1:34) — Yahuah Himself sets apart: Esau a true brother by blood, yet Jacob the loved, the covenant heir.'),
    ('canon','1-chronicles',1,34,'canon','malachi',1,3,'free',
     E'*And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness* (Malachi 1:3). The hatred falls on Esau''s heritage as a covenant verdict on conduct and election, not race-spite against a brother-people — the line of *Esau* (1 Chronicles 1:34) is real, but it does not carry the scepter.'),
    ('canon','1-chronicles',1,34,'canon','romans',9,12,'free',
     E'*It was said unto her, The elder shall serve the younger* (Romans 9:12). Paul lifts the womb-oracle straight onto the Chronicler''s pair — *Esau and Yashar''el (Israel)* (1 Chronicles 1:34) — to show the seed stands by election and the calling word, not of works nor of firstborn right.'),
    ('canon','1-chronicles',1,34,'canon','romans',9,13,'free',
     E'*As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). The apostle quotes Malachi over the same two sons of Isaac the Chronicler names (1 Chronicles 1:34): the covenant runs through Jacob/Yashar''el by Yahuah''s choosing — election of the seed-line, never ethnic hatred of a people.'),

    -- THREAD 3: Edom a real bloodline outside the covenant scepter (1:35 / 1:54)
    ('canon','1-chronicles',1,35,'canon','genesis',36,1,'free',
     E'*Now these are the generations of Esau, who is Edom* (Genesis 36:1). The Chronicler''s roll of *The sons of Esau; Eliphaz, Reuel...* (1 Chronicles 1:35) is the same house Genesis names the generations of Esau, who is Edom — a real and numbered bloodline, a brother-nation, set down with full honour of record though outside the covenant line.'),
    ('canon','1-chronicles',1,43,'canon','genesis',36,43,'free',
     E'*Duke Magdiel, duke Iram: these be the dukes of Edom... he is Esau the father of the Edomites* (Genesis 36:43). The Chronicler notes that Edom had *kings... before any king reigned over the children of Yashar''el (Israel)* (1 Chronicles 1:43) — Esau''s house rose to thrones first, yet that early crown is not the promised scepter that comes through Jacob.'),
    ('canon','1-chronicles',1,43,'canon','numbers',24,18,'free',
     E'*And Edom shall be a possession, Seir also shall be a possession for his enemies; and Yashar''el (Israel) shall do valiantly* (Numbers 24:18). Balaam''s oracle reads the end of the very line of Edomite kings the Chronicler records (1 Chronicles 1:43): the brother-nation that reigned first becomes a possession, while Yashar''el — the covenant seed — prevails.'),
    ('canon','1-chronicles',1,43,'canon','obadiah',1,10,'free',
     E'*For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10). The Chronicler keeps Edom''s line and kings on the record (1 Chronicles 1:43-54), and Obadiah names the cause of its fall: not blood, but violence against the brother — a verdict on conduct, the victim-brother avenged, not a people hated for its birth.'),
    ('canon','1-chronicles',1,54,'canon','obadiah',1,18,'free',
     E'*And the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble... for Yahuah (LORD) hath spoken it* (Obadiah 1:18). The dukes of Edom close the chapter — *These are the dukes of Edom* (1 Chronicles 1:54) — and the prophet shows the end of that house set against the TWO houses, Jacob and Joseph, the covenant seed that endures while Esau''s house is stubble.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
-- Thread 1 (band 30000) — seed-line Adam->Noah->Messiah; tier extras (Jubilees member)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son',
       E'The seed-line from Adam to Noah — traced forward to the Formed Son',
       E'The Chronicler opens his whole work not with a war or a throne but with a bare paternal line: *Adam, Sheth, Enosh, Kenan, Mahalaleel, Jered, Henoch, Methuselah, Lamech, Noah, Shem, Ham, and Japheth* (1 Chronicles 1:1-4). This is the spine of the entire canon traced back to the first man. It is the same line Genesis calls *the book of the generations of Adam* (Genesis 5:1), the same line that bends at Noah — *and Noah begat Shem, Ham, and Japheth* (Genesis 5:32) — and narrows to Shem: *These are the generations of Shem* (Genesis 11:10), running down to *Abram; the same is Abraham* (1 Chronicles 1:27).\n\nThe restored witness keeps the same count. Jubilees walks Adam to Noah and ends at the same three sons: *she bare him Shem... she bare him Ham... she bare him Japheth* (Jubilees 4:32). And the New Testament numbers a man in this line by name: *And Enoch also, the seventh from Adam, prophesied* (Jude 1:14) — Enoch is the seventh of these very names.\n\nMost of all, this is the line the Messiah is carried in. Luke walks it backward to the very head: *which was the son of Sem, which was the son of Noe... which was the son of Seth, which was the son of Adam, which was the son of Elohim (God)* (Luke 3:36-38). The Son of Adam is no abstraction — He is the last link of the paternal bloodline the Chronicler is naming, the Formed Son drawn into flesh through the unbroken line from the first man.',
       sv.verse_id, ev.verse_id, 'extras', 30000
  FROM _s313_chr01_lookup sv, _s313_chr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (band 30001) — election of the seed; tier free (all canon)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau',
       E'The election of the seed — Isaac not Ishmael, Jacob not Esau',
       E'The Chronicler lists the sons honestly and fully — *The sons of Abraham; Isaac, and Ishmael* (1 Chronicles 1:28), and *The sons of Isaac; Esau and Yashar''el (Israel)* (1 Chronicles 1:34) — but the covenant did not pass to the firstborn of the flesh. It passed by Yahuah''s choosing word laid over the bloodline.\n\nTo Abraham it was already said, *in Isaac shall thy seed be called* (Genesis 21:12), which the apostle reads exactly: *Neither, because they are the seed of Abraham, are they all children: but, In Isaac shall thy seed be called* (Romans 9:7). Descent alone is not the promise. And of the twins it was spoken in the womb, *the elder shall serve the younger* (Genesis 25:23; Romans 9:12), confirmed by the prophet: *yet I loved Jacob, and I hated Esau* (Malachi 1:2-3), which Paul quotes — *Jacob have I loved, but Esau have I hated* (Romans 9:13).\n\nThis is election of the seed-line, not ethnic spite. Esau is a true brother by blood; the verdict falls on his heritage and conduct, not his birth. The promise is carried by paternal bloodline AND the covenant word together — never lineage alone, never a word that ignores the line. The seed is the chosen seed.',
       sv.verse_id, ev.verse_id, 'free', 30001
  FROM _s313_chr01_lookup sv, _s313_chr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=1 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 (band 30002) — Edom outside the scepter; tier free (all canon)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter',
       E'Edom — a real bloodline outside the covenant scepter',
       E'The Chronicler gives Esau''s house a full and honoured record — *The sons of Esau; Eliphaz, Reuel...* (1 Chronicles 1:35), the sons of Seir, and a whole roll of kings and dukes: *Now these are the kings that reigned in the land of Edom before any king reigned over the children of Yashar''el (Israel)* (1 Chronicles 1:43), down to *These are the dukes of Edom* (1 Chronicles 1:54). This is the same house Genesis names: *Now these are the generations of Esau, who is Edom* (Genesis 36:1; 36:43). A real bloodline, a brother-nation, even crowned with thrones before Yashar''el had a king.\n\nYet the early crown is not the promised scepter. Balaam''s oracle reads the end of that line: *Edom shall be a possession... and Yashar''el (Israel) shall do valiantly* (Numbers 24:18). And Obadiah names the cause of Edom''s fall — not its blood, but its deeds: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10). The end is set against the two houses of the covenant seed: *the house of Jacob shall be a fire, and the house of Joseph a flame, and the house of Esau for stubble* (Obadiah 1:18).\n\nEdom is judged for conduct — the violence against the brother — not hated for its birth. Victim-brother avenged, a system of pride dismantled; the covenant seed endures while the house that reigned first becomes stubble.',
       sv.verse_id, ev.verse_id, 'free', 30002
  FROM _s313_chr01_lookup sv, _s313_chr01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=1 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 5:1 — *the book of the generations of Adam*: the line the Chronicler resumes at *Adam, Sheth, Enosh* (1 Chronicles 1:1).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 5:32 — *Noah begat Shem, Ham, and Japheth*: the spine bends at Noah, matching *Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 11:10 — *the generations of Shem*: after Noah the line narrows to Shem and runs to Abraham (1 Chronicles 1:4,27).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Luke 3:36 — the Messiah''s genealogy walks the SAME line backward (Noe, Sem, Arphaxad), matching 1 Chronicles 1:1ff.'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Luke 3:38 — *the son of Adam, which was the son of Elohim (God)*: the line ends exactly where the Chronicler begins it (1 Chronicles 1:1).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Jude 1:14 — *Enoch... the seventh from Adam*: the New Testament counts him as the seventh name of this seed-line (1 Chronicles 1:3).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Jubilees 4:32 (extras) — the restored witness brings the Adam-to-Noah line to the same three sons (1 Chronicles 1:4).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-seed-line-from-adam-to-noah-traced-to-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 21:12 — *in Isaac shall thy seed be called*: the covenant chooses Isaac over Ishmael (1 Chronicles 1:28).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 9:7 — *In Isaac shall thy seed be called*: descent from Abraham alone is not the covenant (1 Chronicles 1:28).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=28
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 25:23 — *the elder shall serve the younger*: the choice spoken in the womb over Esau and Jacob (1 Chronicles 1:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Malachi 1:2 — *yet I loved Jacob*: Yahuah sets apart the two sons of Isaac (1 Chronicles 1:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Malachi 1:3 — *and I hated Esau*: a covenant verdict on heritage and conduct, not race-spite (1 Chronicles 1:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Romans 9:12 — *The elder shall serve the younger*: the seed stands by election, not works or birth-order (1 Chronicles 1:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Romans 9:13 — *Jacob have I loved, but Esau have I hated*: election of the seed-line, never ethnic hatred (1 Chronicles 1:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-the-election-of-the-seed-isaac-not-ishmael-jacob-not-esau'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 36:1 — *the generations of Esau, who is Edom*: the same house the Chronicler rolls out (1 Chronicles 1:35).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=35
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 36:43 — *the dukes of Edom... he is Esau the father of the Edomites*: Edom''s kings rose before Yashar''el had one (1 Chronicles 1:43).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=43
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 24:18 — *Edom shall be a possession... and Yashar''el (Israel) shall do valiantly*: the brother-nation''s end against the covenant seed (1 Chronicles 1:43).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=43
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Obadiah 1:10 — *thy violence against thy brother Jacob*: Edom judged for conduct, the victim-brother avenged, not hated for blood (1 Chronicles 1:43).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=43
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Obadiah 1:18 — *the house of Jacob... the house of Joseph... the house of Esau for stubble*: the two houses endure, Esau''s does not (1 Chronicles 1:54).'
  FROM cross_reference_threads t
  JOIN _s313_chr01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=1 AND sv.verse_number=54
  JOIN _s313_chr01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-1-edom-a-real-bloodline-outside-the-covenant-scepter'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_2.sql (1 Chronicles 2) -----
-- Book: 1 Chronicles  Chapter: 2 (the sons of Yasharel and the royal line of Yahudah to David)
-- Tag: chr02   Session prefix: s313   Sort band: 30025+ (+1 per thread)
-- Temp view: _s313_chr02_lookup
--
-- 1 Chronicles 2 coverage:
--   v.1-2 (the twelve tribes named):
--        NT:     Revelation 7:4, 7:8 (the sealed twelve tribes) — woven
--        Extras: none warranted (the canon two-house witnesses carry it)
--        Tanakh: Genesis 35:23,24,26 (the twelve sons of Jacob), Exodus 1:1, Ezekiel 48:29 — woven
--   v.3-4 (Er slain, Pharez & Zerah by Tamar):
--        NT:     Matthew 1:3 (Phares of Thamar) — woven
--        Extras: none warranted
--        Tanakh: Genesis 38:29 (the breaking-forth of Pharez) — woven
--   v.7 (Achar the troubler of Israel):
--        NT:     none warranted
--        Extras: none warranted (Joshua carries the account directly)
--        Tanakh: Joshua 7:1, 7:25 (Achan the troubler) — woven
--   v.10-15 (the royal line Ram->Nahshon->Salma->Boaz->Obed->Jesse->David the seventh):
--        NT:     Matthew 1:6 (Jesse begat David the king), Luke 3:32 — woven
--        Extras: none warranted
--        Tanakh: Genesis 49:10 (the sceptre from Yahudah), Ruth 4:22 (Obed begat Jesse, Jesse begat David) — woven
--
-- Threads:
--   1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes        (free) [Tanakh + NT]  band 30025
--   1-chronicles-2-pharez-by-tamar-grace-through-the-seed-line             (free) [Tanakh + NT]  band 30026
--   1-chronicles-2-achar-the-troubler-of-israel-the-line-preserved         (free) [Tanakh]       band 30027
--   1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh    (free) [Tanakh + NT]  band 30028
--
-- Framework notes: 2:1-2 the twelve tribes = the whole covenant people, both houses (Rev 7 sealed,
--   Ezek 48 portions) — the two-house gathering, never replaced. 2:3-15 the Yahudah->David line =
--   the Messianic scepter carried by paternal bloodline AND covenant (Gen 49:10, Ruth 4, Matt 1).
--   Tamar/Pharez (2:4) and Er slain (2:3) and Achar (2:7) show the seed-line preserved THROUGH human
--   failure, not by merit — grace working the promise forward.

CREATE TEMP VIEW _s313_chr02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================= cross_references =============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the twelve tribes (2:1-2)
    ('canon','1-chronicles',2,1,'canon','genesis',35,23,'free',
      E'*The sons of Leah; Reuben, Jacob''s firstborn, and Simeon, and Levi, and Yahudah (Judah), and Issachar, and Zebulun:* (Genesis 35:23). The Chronicler''s opening roll, *These are the sons of Yashar''el (Israel); Reuben, Simeon, Levi, and Yahudah (Judah), Issachar, and Zebulun* (1 Chronicles 2:1), repeats the house of Jacob exactly as Genesis first numbered it — the covenant people named whole at their root.'),
    ('canon','1-chronicles',2,1,'canon','genesis',35,24,'free',
      E'*The sons of Rachel; Joseph, and Benjamin:* (Genesis 35:24). The Chronicler keeps Joseph and Benjamin together in the same breath, *Joseph, and Benjamin* (1 Chronicles 2:2) — the line of Rachel held inside the one body of Yashar''el (Israel).'),
    ('canon','1-chronicles',2,1,'canon','genesis',35,26,'free',
      E'*And the sons of Zilpah, Leah''s handmaid; Gad, and Asher: these are the sons of Jacob, which were born to him in Padan-aram.* (Genesis 35:26). Genesis closes the twelve where the Chronicler closes them, *Gad, and Asher* (1 Chronicles 2:2) — the full count of the sons of Jacob, the seed carried by paternal bloodline and covenant together.'),
    ('canon','1-chronicles',2,1,'canon','exodus',1,1,'free',
      E'*Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* (Exodus 1:1). Exodus opens its bondage-and-deliverance story by re-naming the twelve, exactly as the Chronicler opens his — *These are the sons of Yashar''el (Israel)* (1 Chronicles 2:1) — the same covenant people across every generation.'),
    ('canon','1-chronicles',2,1,'canon','revelation',7,4,'free',
      E'*And I heard the number of them which were sealed: and there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel).* (Revelation 7:4). The roll of *the sons of Yashar''el (Israel)* (1 Chronicles 2:1) is not closed in the past: the same twelve are sealed at the end, the two-house people gathered and never replaced.'),
    ('canon','1-chronicles',2,1,'canon','revelation',7,8,'free',
      E'*Of the tribe of Zabulon were sealed twelve thousand. Of the tribe of Joseph were sealed twelve thousand. Of the tribe of Benjamin were sealed twelve thousand.* (Revelation 7:8). The names the Chronicler lists — *Zebulun... Joseph, and Benjamin* (1 Chronicles 2:1-2) — are sealed tribe by tribe at the consummation, the whole house of Yashar''el (Israel) brought home.'),
    ('canon','1-chronicles',2,1,'canon','ezekiel',48,29,'free',
      E'*This is the land which ye shall divide by lot unto the tribes of Yashar''el (Israel) for inheritance, and these are their portions, saith Adonai Yahuah (the Lord GOD).* (Ezekiel 48:29). The twelve tribes the Chronicler names, *These are the sons of Yashar''el (Israel)* (1 Chronicles 2:1), are the very tribes Ezekiel apportions in the restored land — the covenant people inherit together, both sticks made one.'),

    -- THREAD 2: Pharez by Tamar (2:3-4)
    ('canon','1-chronicles',2,4,'canon','genesis',38,29,'free',
      E'*And it came to pass, as he drew back his hand, that, behold, his brother came out: and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez.* (Genesis 38:29). The Chronicler''s terse *And Tamar his daughter in law bare him Pharez and Zerah* (1 Chronicles 2:4) carries the whole story of the breaking-forth — the seed-line preserved through Tamar''s breach, not by merit but by the promise pressing forward.'),
    ('canon','1-chronicles',2,4,'canon','matthew',1,3,'free',
      E'*And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* (Matthew 1:3). The line the Chronicler traces from *Pharez and Zerah* (1 Chronicles 2:4) is named again in the generations of Messiah — *Phares... of Thamar* — grace working through the seed-line all the way to Yahusha (Jesus).'),

    -- THREAD 3: Achar the troubler of Israel (2:7)
    ('canon','1-chronicles',2,7,'canon','joshua',7,1,'free',
      E'*But the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel).* (Joshua 7:1). The Chronicler names him within Yahudah''s own genealogy — *Achar, the troubler of Yashar''el (Israel), who transgressed in the thing accursed* (1 Chronicles 2:7) — the same son of Carmi, the same accursed thing.'),
    ('canon','1-chronicles',2,7,'canon','joshua',7,25,'free',
      E'*And Joshua said, Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day. And all Yashar''el (Israel) stoned him with stones, and burned them with fire, after they had stoned them with stones.* (Joshua 7:25). The name *Achar, the troubler of Yashar''el (Israel)* (1 Chronicles 2:7) is a sealed verdict on that judgment — yet the line of Yahudah (Judah) is not cut off by the sin within it; the scepter runs on.'),

    -- THREAD 4: the sceptre of Yahudah, the line to David the seventh (2:10-15)
    ('canon','1-chronicles',2,15,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* (Genesis 49:10). Jacob''s dying word over Yahudah is what the Chronicler''s genealogy delivers — *David the seventh* (1 Chronicles 2:15) is the scepter-bearer of the lion-tribe, the throne held until Shiloh, the one to whom the gathering of the people belongs.'),
    ('canon','1-chronicles',2,15,'canon','ruth',4,22,'free',
      E'*And Obed begat Jesse, and Jesse begat David.* (Ruth 4:22). Ruth closes her book on the identical line the Chronicler closes his chapter on — *And Boaz begat Obed, and Obed begat Jesse... David the seventh* (1 Chronicles 2:11-15) — the redeemed Moabitess woven into the royal seed that brings forth David.'),
    ('canon','1-chronicles',2,15,'canon','matthew',1,6,'free',
      E'*And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias;* (Matthew 1:6). The Chronicler''s *Jesse begat his firstborn Eliab... David the seventh* (1 Chronicles 2:13-15) is the same descent the generations of Messiah pick up — *Jesse begat David the king* — the scepter-line running on to Yahusha HaMashiach (Jesus Christ).'),
    ('canon','1-chronicles',2,15,'canon','luke',3,32,'free',
      E'*Which was the son of Jesse, which was the son of Obed, which was the son of Booz, which was the son of Salmon, which was the son of Naasson,* (Luke 3:32). Read backward, Luke walks the very steps the Chronicler walks forward — *Nahshon begat Salma, and Salma begat Boaz, And Boaz begat Obed, and Obed begat Jesse* (1 Chronicles 2:11-12) — the unbroken bloodline of the promised seed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================= threads =============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes',
  E'These Are the Sons of Yashar''el — the Twelve Tribes Named Whole',
  E'The Chronicler opens his royal book not with a king but with the whole house: *These are the sons of Yashar''el (Israel); Reuben, Simeon, Levi, and Yahudah (Judah), Issachar, and Zebulun, Dan, Joseph, and Benjamin, Naphtali, Gad, and Asher* (1 Chronicles 2:1-2). It is the same roll Genesis first numbered — *The sons of Leah; Reuben, Jacob''s firstborn... The sons of Rachel; Joseph, and Benjamin... And the sons of Zilpah, Leah''s handmaid; Gad, and Asher: these are the sons of Jacob* (Genesis 35:23,24,26) — and the same names Exodus carried into bondage: *Now these are the names of the children of Yashar''el (Israel), which came into Egypt* (Exodus 1:1). This is the covenant people, the two-house body carried by paternal bloodline and covenant together. And the list is not a closed past: at the end the same twelve are sealed — *there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4), counted tribe by tribe down to *Zabulon... Joseph, and Benjamin* (Revelation 7:8); and the same twelve inherit the restored land — *This is the land which ye shall divide by lot unto the tribes of Yashar''el (Israel) for inheritance* (Ezekiel 48:29). The house named here is the house gathered home, never replaced.',
  sv.verse_id, ev.verse_id, 'free', 30025
  FROM _s313_chr02_lookup sv, _s313_chr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-2-pharez-by-tamar-grace-through-the-seed-line',
  E'Pharez by Tamar — Grace Working Through the Seed-Line',
  E'The Chronicler does not hide the failure inside the royal line. *And Er, the firstborn of Yahudah (Judah), was evil in the sight of Yahuah (LORD); and he slew him* (1 Chronicles 2:3) — yet the line is not lost, for *Tamar his daughter in law bare him Pharez and Zerah* (1 Chronicles 2:4). Genesis tells how that birth came: *behold, his brother came out: and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez* (Genesis 38:29). The promised seed pressed forward through Tamar''s breach — not by merit, but by Yahuah''s covenant holding the line open. And that same Pharez stands in the generations of Messiah: *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom* (Matthew 1:3). The breaking-forth that looked like scandal is the very channel of the seed to David and to Yahusha (Jesus) — grace carrying the promise through human failure.',
  sv.verse_id, ev.verse_id, 'free', 30026
  FROM _s313_chr02_lookup sv, _s313_chr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-2-achar-the-troubler-of-israel-the-line-preserved',
  E'Achar the Troubler of Yashar''el — the Line Preserved Despite Sin Within It',
  E'Set inside the genealogy of Yahudah (Judah) is a name that carries a whole judgment: *And the sons of Carmi; Achar, the troubler of Yashar''el (Israel), who transgressed in the thing accursed* (1 Chronicles 2:7). This is the man Joshua records: *the children of Yashar''el (Israel) committed a trespass in the accursed thing: for Achan, the son of Carmi, the son of Zabdi, the son of Zerah, of the tribe of Yahudah (Judah), took of the accursed thing: and the anger of Yahuah (LORD) was kindled against the children of Yashar''el (Israel)* (Joshua 7:1) — and whose end was sealed: *Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day. And all Yashar''el (Israel) stoned him with stones* (Joshua 7:25). The Chronicler will not pretend the covenant people were sinless; the troubler stands named in the very tribe of the king. Yet the line of Yahudah (Judah) is not cut off by the sin within it — the scepter runs on past the trespass to David, the promise stronger than the failure.',
  sv.verse_id, ev.verse_id, 'free', 30027
  FROM _s313_chr02_lookup sv, _s313_chr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh',
  E'The Sceptre of Yahudah — the Royal Line to David the Seventh',
  E'Here the Chronicler lays the spine of the kingdom: *And Ram begat Amminadab; and Amminadab begat Nahshon, prince of the children of Yahudah (Judah); And Nahshon begat Salma, and Salma begat Boaz, And Boaz begat Obed, and Obed begat Jesse, And Jesse begat his firstborn Eliab... David the seventh* (1 Chronicles 2:10-15). This is the scepter-line Jacob foretold over Yahudah: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). It is the very descent Ruth''s book closes on — *And Obed begat Jesse, and Jesse begat David* (Ruth 4:22) — the redeemed Moabitess woven into the royal seed. And it runs straight on to Messiah: forward in Matthew, *Jesse begat David the king; and David the king begat Solomon* (Matthew 1:6), and backward in Luke, *the son of Jesse, which was the son of Obed, which was the son of Booz, which was the son of Salmon, which was the son of Naasson* (Luke 3:32). The seventh son of Jesse is the throne-bearer of the lion-tribe, the seed carried by bloodline and covenant together until Shiloh comes.',
  sv.verse_id, ev.verse_id, 'free', 30028
  FROM _s313_chr02_lookup sv, _s313_chr02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ============================= thread_members =============================
-- THREAD 1: twelve tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The sons of Leah; Reuben, Jacob''s firstborn... and Yahudah (Judah), and Issachar, and Zebulun:* (Genesis 35:23) — Genesis first numbers the twelve the Chronicler now re-names.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The sons of Rachel; Joseph, and Benjamin:* (Genesis 35:24) — the line of Rachel held inside the one body of Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And the sons of Zilpah... Gad, and Asher: these are the sons of Jacob* (Genesis 35:26) — Genesis closes the twelve where the Chronicler closes them.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Now these are the names of the children of Yashar''el (Israel), which came into Egypt* (Exodus 1:1) — Exodus re-names the twelve as the Chronicler does.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*there were sealed an hundred and forty and four thousand of all the tribes of the children of Yashar''el (Israel)* (Revelation 7:4) — the same twelve sealed at the end, never replaced.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Of the tribe of Zabulon... Of the tribe of Joseph... Of the tribe of Benjamin were sealed twelve thousand* (Revelation 7:8) — the Chronicler''s names sealed tribe by tribe.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*This is the land which ye shall divide by lot unto the tribes of Yashar''el (Israel) for inheritance* (Ezekiel 48:29) — the same twelve inherit the restored land, both sticks one.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-these-are-the-sons-of-yasharel-the-twelve-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: Pharez by Tamar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*his brother came out... therefore his name was called Pharez* (Genesis 38:29) — the breaking-forth that preserved the seed-line through Tamar''s breach.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-pharez-by-tamar-grace-through-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Judas begat Phares and Zara of Thamar* (Matthew 1:3) — the same Pharez stands in the generations of Messiah, grace through the seed.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-pharez-by-tamar-grace-through-the-seed-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Achar the troubler
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Achan, the son of Carmi... of the tribe of Yahudah (Judah), took of the accursed thing* (Joshua 7:1) — the same son of Carmi the Chronicler names within Yahudah''s line.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-achar-the-troubler-of-israel-the-line-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Why hast thou troubled us? Yahuah (LORD) shall trouble thee this day... all Yashar''el (Israel) stoned him* (Joshua 7:25) — the sealed verdict; yet the line of Yahudah runs on.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-achar-the-troubler-of-israel-the-line-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the sceptre to David the seventh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10) — Jacob''s word over Yahudah is what this genealogy delivers in David.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Obed begat Jesse, and Jesse begat David* (Ruth 4:22) — Ruth closes on the identical line, the redeemed Moabitess woven into the royal seed.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Jesse begat David the king; and David the king begat Solomon* (Matthew 1:6) — the same descent picked up in the generations of Messiah.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the son of Jesse, which was the son of Obed, which was the son of Booz, which was the son of Salmon, which was the son of Naasson* (Luke 3:32) — Luke walks the same line backward, unbroken.'
  FROM cross_reference_threads t
  JOIN _s313_chr02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s313_chr02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-2-the-sceptre-of-yahudah-the-line-to-david-the-seventh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_3.sql (1 Chronicles 3) -----
-- Book: 1 Chronicles, chapter 3 — the royal house of David (Hebron→Jerusalem→the kings of
--   Judah→the captivity→the post-exile heir Zerubbabel). Session prefix s313; tag chr03.
--   sort_order band 30050+ (one per thread).
--
-- 1 Chronicles 3 coverage:
--   v.1-9  the sons of David born in Hebron and Jerusalem (incl. Solomon by Bath-shua):
--          NT:     Matthew 1:6 (David the king begat Solomon) — bound
--          Extras: none warranted (genealogical roster; no clean apocalyptic witness adds weight)
--          Tanakh: 2 Samuel 7:12-13 (I will set up thy seed... he shall build an house) — bound
--   v.10-16 the royal succession through Solomon, the kings of Judah down to Josiah, Jeconiah, Zedekiah:
--          NT:     Matthew 1:6-7,10-11 (Solomon... unto carrying away to Babylon); Luke 1:32-33 (throne of David) — bound
--          Extras: none warranted (the king-list is canon-grounded; framework weight is the throne-promise)
--          Tanakh: 2 Samuel 7:16 (thine house and thy kingdom established for ever) — bound
--   v.17-24 the line AFTER the captivity — Jeconiah→Salathiel→Zerubbabel and his seed:
--          NT:     Matthew 1:12 (Jechonias begat Salathiel; Salathiel begat Zorobabel) — bound
--          Extras: none warranted (no clean extra-canon Zerubbabel-signet witness in the library)
--          Tanakh: Haggai 2:23 (make thee as a signet); Jeremiah 22:30 (Coniah curse reversed in the line); Ezra 3:2 — bound
--
-- Threads (slug — target libraries):
--   1-chronicles-3-the-sons-of-david-and-the-seed-after-thee         (Tanakh + NT)            band 30050
--   1-chronicles-3-the-throne-of-david-established-for-ever          (Tanakh + NT)            band 30051
--   1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity (Tanakh + NT)         band 30052
--
-- GUARD framing: 3:10-16 = the throne-line of the house of David, the everlasting-throne promise
--   (2 Sam 7:16) carried through the kings of Judah unto Messiah on David's throne (Luke 1:32-33);
--   3:17-24 = the seed-line PRESERVED through Babylon, the Davidic-Messianic hope not extinguished
--   — Zerubbabel the restored signet (Hag 2:23) reversing the Coniah/Jeconiah curse (Jer 22:30),
--   the line to Messiah (Matt 1:12). The scepter-line is bloodline AND covenant together.
--   No single-apostrophe Yashar'el inside literals (all apostrophes doubled).

CREATE TEMP VIEW _s313_chr03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the sons of David and the seed after thee (3:1-9)
    ('canon','1-chronicles',3,9,'canon','2-samuel',7,12,
     E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The roster *These were all the sons of David, beside the sons of the concubines, and Tamar their sister* (1 Chronicles 3:9) names the bowels out of which the promised seed proceeds — the chronicler counts the very loins through which Yahuah (the LORD) swore to raise up the everlasting kingdom. The bloodline IS the carrier of the covenant-word.',
     'free'),
    ('canon','1-chronicles',3,5,'canon','2-samuel',7,13,
     E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). Of all David''s sons listed, the chronicler singles out the throne-heir: *and Solomon, four, of Bath-shua the daughter of Ammiel* (1 Chronicles 3:5) — Solomon, the son who would build the house for the Name, the first link of the stablished throne.',
     'free'),
    ('canon','1-chronicles',3,5,'canon','matthew',1,6,
     E'*And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6). The chronicler''s *Shimea, and Shobab, and Nathan, and Solomon, four, of Bath-shua the daughter of Ammiel* (1 Chronicles 3:5) is the same Bath-shua / Bathsheba; Matthew picks up the very link and runs the scepter-line forward to *the son of David* (Matthew 1:1), Yahusha HaMashiach (Jesus Christ).',
     'free'),
    -- Thread 2: the throne of David established for ever (3:10-16)
    ('canon','1-chronicles',3,10,'canon','matthew',1,7,
     E'*And Solomon begat Roboam; and Roboam begat Abia; and Abia begat Asa* (Matthew 1:7). The chronicler''s *And Solomon''s son was Rehoboam, Abia his son, Asa his son, Jehoshaphat his son* (1 Chronicles 3:10) is the identical throne-list; Matthew copies the kings of Yahudah (Judah) name-for-name, threading the unbroken line of David through the southern kingdom toward Messiah (Christ).',
     'free'),
    ('canon','1-chronicles',3,14,'canon','matthew',1,10,
     E'*And Ezekias begat Manasses; and Manasses begat Amon; and Amon begat Josias* (Matthew 1:10). The chronicler closes the same span: *Ahaz his son, Hezekiah his son, Manasseh his son, Amon his son, Josiah his son* (1 Chronicles 3:13-14). Josiah the reformer is the last righteous link before the captivity; Matthew tracks the very same kings, the throne-line intact down to the brink of Babylon.',
     'free'),
    ('canon','1-chronicles',3,16,'canon','matthew',1,11,
     E'*And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon* (Matthew 1:11). The chronicler''s *And the sons of Jehoiakim: Jeconiah his son, Zedekiah his son* (1 Chronicles 3:16) names that Jechonias / Jeconiah — the king of Yahudah (Judah) on the throne when the kingdom went down to Babylon; Matthew marks the exile at this exact link, yet the line does not die here.',
     'free'),
    ('canon','1-chronicles',3,10,'canon','2-samuel',7,16,
     E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). This is the covenant behind the whole king-list *And Solomon''s son was Rehoboam, Abia his son, Asa his son, Jehoshaphat his son* (1 Chronicles 3:10) — every name is one beat of the *for ever* throne Yahuah (the LORD) swore to David; the chronicler is reciting the promise being kept generation by generation.',
     'free'),
    ('canon','1-chronicles',3,10,'canon','luke',1,32,
     E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The throne the chronicler traces through *Rehoboam... Asa his son, Jehoshaphat his son* (1 Chronicles 3:10) reaches its true Heir here — the everlasting throne of David given to Yahusha (Jesus), the kings of Yahudah (Judah) being the staircase that leads to the final King.',
     'free'),
    ('canon','1-chronicles',3,16,'canon','luke',1,33,
     E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The chronicler ends the kingly line at the captivity — *Jeconiah his son, Zedekiah his son* (1 Chronicles 3:16) — where an earthly throne falls; Luke answers that the kingdom whose end the king-list seems to reach has *no end*: the house of Jacob, both houses gathered, reigned over for ever.',
     'free'),
    -- Thread 3: Zerubbabel the signet — the line through the captivity (3:17-24)
    ('canon','1-chronicles',3,17,'canon','matthew',1,12,
     E'*And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12). The chronicler picks the line up on the FAR side of the captivity: *And the sons of Jeconiah; Assir, Salathiel his son* (1 Chronicles 3:17). Babylon did not extinguish the seed of David — Matthew follows the identical Jeconiah→Salathiel→Zerubbabel thread the chronicler preserved.',
     'free'),
    ('canon','1-chronicles',3,19,'canon','haggai',2,23,
     E'*In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee* (Haggai 2:23). The chronicler''s *and the sons of Pedaiah were, Zerubbabel* (1 Chronicles 3:19) is the post-exile heir whom Yahuah (the LORD) names the restored signet — the Davidic ring pulled back onto the right hand, the chosen seed-line vindicated past Babylon.',
     'free'),
    ('canon','1-chronicles',3,16,'canon','jeremiah',22,30,
     E'*Thus saith Yahuah (LORD), Write ye this man childless, a man that shall not prosper in his days: for no man of his seed shall prosper, sitting upon the throne of David, and ruling any more in Yahudah (Judah)* (Jeremiah 22:30). The curse fell on *Jeconiah his son* (1 Chronicles 3:16) — Coniah, plucked off as the signet (Jeremiah 22:24); yet the chronicler keeps writing his sons (3:17-19), and Haggai re-crowns Zerubbabel the signet — the curse on the man does not annul the covenant on the line; the seed runs on to Messiah.',
     'free'),
    ('canon','1-chronicles',3,19,'canon','ezra',3,2,
     E'*Then stood up Jeshua the son of Jozadak, and his brethren the priests, and Zerubbabel the son of Shealtiel, and his brethren, and builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses the man of Elohim (God)* (Ezra 3:2). The chronicler''s *the sons of Zerubbabel; Meshullam, and Hananiah* (1 Chronicles 3:19) is the same heir who, returned from Babylon, rebuilds the altar according to the Torah — the Davidic line restored AND the covenant-instruction kept together.',
     'free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s313_chr03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-3-the-sons-of-david-and-the-seed-after-thee',
       E'The sons of David — the seed after thee',
       E'The chapter opens with David''s sons born first in Hebron and then in Jerusalem, closing the roster: *These were all the sons of David, beside the sons of the concubines, and Tamar their sister* (1 Chronicles 3:9). Among them the chronicler singles out the throne-heir — *Shimea, and Shobab, and Nathan, and Solomon, four, of Bath-shua the daughter of Ammiel* (1 Chronicles 3:5). These loins are not an idle list: they are the very bowels through which Yahuah (the LORD) swore the kingdom. *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12), and of that seed it is said *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the word that names Solomon the temple-builder. Matthew picks up the identical link by name: *And Jesse begat David the king; and David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6), running this same Bath-shua / Bathsheba forward to *the son of David* (Matthew 1:1), Yahusha HaMashiach (Jesus Christ). The bloodline is the carrier of the covenant-word — paternal seed and sworn promise together.',
       sv.verse_id, ev.verse_id, 'free', 30050
  FROM _s313_chr03_lookup sv, _s313_chr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-3-the-throne-of-david-established-for-ever',
       E'The throne of David established for ever',
       E'From Solomon the chronicler runs the unbroken royal succession of the house of David through the kings of Yahudah (Judah): *And Solomon''s son was Rehoboam, Abia his son, Asa his son, Jehoshaphat his son* (1 Chronicles 3:10) down through *Ahaz his son, Hezekiah his son, Manasseh his son, Amon his son, Josiah his son* (1 Chronicles 3:13-14), to *the sons of Josiah* and at last *the sons of Jehoiakim: Jeconiah his son, Zedekiah his son* (1 Chronicles 3:16). Every name is one beat of a single oath: *And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). Matthew copies this very king-list name-for-name — *And Solomon begat Roboam; and Roboam begat Abia; and Abia begat Asa* (Matthew 1:7), *And Ezekias begat Manasses; and Manasses begat Amon; and Amon begat Josias* (Matthew 1:10), down to *And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon* (Matthew 1:11). The throne seems to fall at the captivity; but the promise was *for ever*, and Gabriel announces its true Heir: *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32); *And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The kings of Yahudah (Judah) are the staircase that leads to the final King over both houses of Jacob.',
       sv.verse_id, ev.verse_id, 'free', 30051
  FROM _s313_chr03_lookup sv, _s313_chr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity',
       E'Zerubbabel the signet — the line through the captivity',
       E'Most genealogies would end at Babylon; the chronicler keeps writing. He picks the house of David up on the FAR side of the exile: *And the sons of Jeconiah; Assir, Salathiel his son* (1 Chronicles 3:17), then *the sons of Pedaiah were, Zerubbabel, and Shimei: and the sons of Zerubbabel; Meshullam, and Hananiah, and Shelomith their sister* (1 Chronicles 3:19), and on through Zerubbabel''s descendants to Anani (3:20-24). Matthew follows the identical thread: *And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12). This matters because of a curse. On Jeconiah / Coniah Yahuah (the LORD) had decreed *Write ye this man childless, a man that shall not prosper in his days: for no man of his seed shall prosper, sitting upon the throne of David, and ruling any more in Yahudah (Judah)* (Jeremiah 22:30) — the signet plucked off the right hand (Jeremiah 22:24). Yet the curse on the man does not annul the covenant on the line: Haggai re-crowns the heir — *In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee* (Haggai 2:23). The ring is pulled back on; the chosen seed-line is vindicated past Babylon. And the same Zerubbabel rebuilds the altar by the Torah on return: *Then stood up Jeshua the son of Jozadak... and Zerubbabel the son of Shealtiel... and builded the altar of the Elohim (God) of Yashar''el (Israel)... as it is written in the law of Moses the man of Elohim (God)* (Ezra 3:2). The Davidic-Messianic hope is not extinguished by the captivity — the bloodline AND the covenant run on together to Messiah.',
       sv.verse_id, ev.verse_id, 'free', 30052
  FROM _s313_chr03_lookup sv, _s313_chr03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will set up thy seed after thee, which shall proceed out of thy bowels* (2 Samuel 7:12) — the loins the chronicler counts (1 Chronicles 3:9) are the carrier of the sworn kingdom.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-sons-of-david-and-the-seed-after-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — names Solomon (1 Chronicles 3:5) the temple-builder, first link of the throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-sons-of-david-and-the-seed-after-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*David the king begat Solomon of her that had been the wife of Urias* (Matthew 1:6) — Matthew runs the same Bath-shua link forward to the son of David, Yahusha HaMashiach (Jesus Christ).'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-sons-of-david-and-the-seed-after-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Solomon begat Roboam; and Roboam begat Abia; and Abia begat Asa* (Matthew 1:7) — Matthew copies the chronicler''s king-list (1 Chronicles 3:10) name-for-name.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Ezekias begat Manasses; and Manasses begat Amon; and Amon begat Josias* (Matthew 1:10) — the same kings the chronicler lists to Josiah (1 Chronicles 3:13-14), the throne intact to the brink of Babylon.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon* (Matthew 1:11) — the chronicler''s Jeconiah (1 Chronicles 3:16), the king on the throne when Yahudah (Judah) went down.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16) — the oath behind every name in the king-list (1 Chronicles 3:10).'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the throne the king-list traces (1 Chronicles 3:10) reaches its true Heir, Yahusha (Jesus).'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — where the king-list ends at the captivity (1 Chronicles 3:16), the kingdom has no end.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-the-throne-of-david-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12) — Matthew follows the identical line the chronicler keeps past Babylon (1 Chronicles 3:17).'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*will I take thee, O Zerubbabel... and will make thee as a signet: for I have chosen thee* (Haggai 2:23) — the chronicler''s Zerubbabel (1 Chronicles 3:19) is the restored Davidic signet.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Write ye this man childless... no man of his seed shall prosper, sitting upon the throne of David* (Jeremiah 22:30) — the curse on Jeconiah (1 Chronicles 3:16), reversed in the line by Haggai''s signet word.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Zerubbabel the son of Shealtiel... builded the altar of the Elohim (God) of Yashar''el (Israel)... as it is written in the law of Moses* (Ezra 3:2) — the chronicler''s heir (1 Chronicles 3:19) restores both the line and the Torah-altar.'
  FROM cross_reference_threads t
  JOIN _s313_chr03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s313_chr03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-3-zerubbabel-the-signet-the-line-through-the-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_4.sql (1 Chronicles 4) -----
-- 1 Chronicles 4 — full-library cross-references. Tag chr04. Session prefix s313.
-- Sort band 30075, step 1: 30075, 30076.
-- View: _s313_chr04_lookup
--
-- FRAME: the families of Yahudah (Judah) and Simeon. Mostly clan-genealogy; FEW
-- framework-bearing threads. The standout is 4:9-10 the PRAYER OF JABEZ — the man
-- named "sorrow" who called on the Elohim of Yashar'el and was answered: genuine
-- dependent prayer of faith heard (Ps 34:4-6, Jer 33:3, Matt 7:7-8, 1 John 5:14-15,
-- James 4:2), the cry for blessing AND for keeping from evil (Matt 6:13). NOT a
-- prosperity-gospel name-it-claim-it formula — grace answering faith, overturning
-- the name of grief. Lightly, the Simeonites finding land "wide, and quiet, and
-- peaceable" (4:40) weaves to the covenant promise of dwelling safely (Lev 26:5)
-- and the every-man-under-his-vine peace (Micah 4:4).
--
-- 1 Chronicles 4 coverage:
--   v.1-8 (Judah's clans: Pharez, Hezron, the Zorathites, the families of the craftsmen)
--        NT:     none warranted (bare genealogy)
--        Extras: none warranted
--        Tanakh: none warranted (Judah-seed line already carried by the ch2/ch4:1 spine)
--   v.9-10 (Jabez more honourable; named for sorrow; called on the Elohim of Yashar'el;
--           bless me / enlarge my coast / thine hand with me / keep me from evil; granted)
--        NT:     Matt 7:7-8 (Ask, and it shall be given), 1 John 5:14-15 (confidence, he
--                heareth us), James 4:2 (ye have not because ye ask not), Matt 6:13
--                (deliver us from evil) — THREAD 1
--        Extras: none warranted
--        Tanakh: Ps 34:4 / 34:6 (I sought Yahuah and he heard me; this poor man cried),
--                Jer 33:3 (Call unto me and I will answer thee) — THREAD 1
--   v.11-23 (Chelub, Kenaz, Othniel, Caleb's sons, craftsmen, potters, fine linen)
--        NT:     none warranted (bare genealogy)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.24-43 (Simeon's clans, their cities, the seeking of pasture, the land wide quiet
--            and peaceable, smiting the rest of the Amalekites, dwelling in peace)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Lev 26:5 (dwell in your land safely), Micah 4:4 (every man under his vine,
--                none shall make them afraid) — THREAD 2; the inheritance/rest in the land
--
-- THREADS:
--   chr04: 1-chronicles-4-jabez-called-on-the-elohim-of-israel-and-was-answered (canon Tanakh + NT) [free]
--   chr04: 1-chronicles-4-the-land-wide-quiet-and-peaceable-dwelling-safely-in-the-inheritance (canon Tanakh) [free]
--
-- Contested/load-bearing framing: 4:9-10 Jabez is framed as the prayer of faith
-- heard by the Elohim of Yashar'el — dependent crying for blessing and protection,
-- granted by grace (Ps 34:6 this POOR man cried; Jer 33:3 the Elohim who answers).
-- The "enlarge my coast / keep me from evil" is the cry of faith, NOT a transactional
-- prosperity technique; the man named "sorrow" blessed = grace overturning grief.
-- Matt 6:13 (deliver us from evil) woven as the same petition the Master taught.

CREATE TEMP VIEW _s313_chr04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the prayer of Jabez — the prayer of faith heard
    ('canon','1-chronicles',4,10,'canon','psalms',34,4,'free',E'*I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4). Jabez, the man whose mother *called his name Jabez, saying, Because I bare him with sorrow* (1 Chronicles 4:9), *called on the Elohim (God) of Yashar''el (Israel)* and *Elohim (God) granted him that which he requested* (4:10): the seeking soul heard and delivered — the same answered cry the psalm sings.'),
    ('canon','1-chronicles',4,10,'canon','psalms',34,6,'free',E'*This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6). Jabez prayed *that thou wouldest keep me from evil, that it may not grieve me!* and *Elohim (God) granted him that which he requested* (1 Chronicles 4:10) — not a transaction but the poor man''s dependent cry, heard and saved.'),
    ('canon','1-chronicles',4,10,'canon','jeremiah',33,3,'free',E'*Call unto me, and I will answer thee, and shew thee great and mighty things, which thou knowest not* (Jeremiah 33:3). This is the very pattern Jabez walked: he *called on the Elohim (God) of Yashar''el (Israel)* (1 Chronicles 4:10) and was answered — the Elohim who invites the call and answers it.'),
    ('canon','1-chronicles',4,10,'canon','matthew',7,7,'free',E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7). Jabez asked — *Oh that thou wouldest bless me indeed, and enlarge my coast, and that thine hand might be with me* (1 Chronicles 4:10) — and it was given him: the asking-receiving promise lived out long before it was spoken from the mount.'),
    ('canon','1-chronicles',4,10,'canon','matthew',7,8,'free',E'*For every one that asketh receiveth; and he that seeketh findeth; and to him that knocketh it shall be opened* (Matthew 7:8). *And Elohim (God) granted him that which he requested* (1 Chronicles 4:10) — Jabez is the standing proof of the principle: the one who asketh receiveth.'),
    ('canon','1-chronicles',4,10,'canon','matthew',6,13,'free',E'*And lead us not into temptation, but deliver us from evil* (Matthew 6:13). Jabez prayed *that thou wouldest keep me from evil, that it may not grieve me!* (1 Chronicles 4:10) — the same petition the Master would teach His own to pray: not riches grasped, but to be kept from evil.'),
    ('canon','1-chronicles',4,10,'canon','1-john',5,14,'free',E'*And this is the confidence that we have in him, that, if we ask any thing according to his will, he heareth us* (1 John 5:14). Jabez *called on the Elohim (God) of Yashar''el (Israel)* and *Elohim (God) granted him that which he requested* (1 Chronicles 4:10) — the confidence that the Elohim of Yashar''el hears, fulfilled in a single answered prayer.'),
    ('canon','1-chronicles',4,10,'canon','1-john',5,15,'free',E'*And if we know that he hear us, whatsoever we ask, we know that we have the petitions that we desired of him* (1 John 5:15). *Elohim (God) granted him that which he requested* (1 Chronicles 4:10): the petition desired, the petition had — the answered prayer of faith.'),
    ('canon','1-chronicles',4,10,'canon','james',4,2,'free',E'*ye fight and war, yet ye have not, because ye ask not* (James 4:2). Jabez is the contrast: he did ask — *Oh that thou wouldest bless me indeed... and that thou wouldest keep me from evil* (1 Chronicles 4:10) — and so he had, where the lustful who do not ask have not.'),
    -- THREAD 2: the land wide, quiet, peaceable — dwelling safely in the inheritance
    ('canon','1-chronicles',4,40,'canon','leviticus',26,5,'free',E'*and ye shall eat your bread to the full, and dwell in your land safely* (Leviticus 26:5). When the sons of Simeon *found fat pasture and good, and the land was wide, and quiet, and peaceable* (1 Chronicles 4:40), it was the covenant promise of dwelling safely in the land coming to pass for them.'),
    ('canon','1-chronicles',4,40,'canon','micah',4,4,'free',E'*But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). The Simeonites'' land *wide, and quiet, and peaceable* (1 Chronicles 4:40) is a foretaste of that promised undisturbed dwelling — the rest in the inheritance Yahuah gives His people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-4-jabez-called-on-the-elohim-of-israel-and-was-answered',
       E'Jabez called on the Elohim of Yashar''el and was answered — the prayer of faith heard',
       E'In the middle of a long roll of Yahudah''s (Judah''s) clans, one man stops the genealogy: *And Jabez was more honourable than his brethren: and his mother called his name Jabez, saying, Because I bare him with sorrow* (1 Chronicles 4:9). The man is named for grief — yet he does not stay under his name. *And Jabez called on the Elohim (God) of Yashar''el (Israel), saying, Oh that thou wouldest bless me indeed, and enlarge my coast, and that thine hand might be with me, and that thou wouldest keep me from evil, that it may not grieve me! And Elohim (God) granted him that which he requested* (4:10). This is no name-it-claim-it technique; it is the dependent cry of faith — for blessing, for the hand of Yahuah, and above all *that thou wouldest keep me from evil* — and it is answered by grace. It is the very thing the psalmist sings: *I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4); *This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6). It is the open door of Jeremiah: *Call unto me, and I will answer thee, and shew thee great and mighty things, which thou knowest not* (Jeremiah 33:3). Long before it was spoken from the mount, Jabez lived out the promise: *Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7); *For every one that asketh receiveth* (Matthew 7:8). His petition to be *kept from evil* is the very one the Master taught: *And lead us not into temptation, but deliver us from evil* (Matthew 6:13). And the apostle names the confidence behind it: *if we ask any thing according to his will, he heareth us... we know that we have the petitions that we desired of him* (1 John 5:14-15). The rebuke runs the other way for those who never ask: *ye have not, because ye ask not* (James 4:2). The man named sorrow asked — and grace overturned his name.',
       sv.verse_id, ev.verse_id, 'free', 30075
  FROM _s313_chr04_lookup sv, _s313_chr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-4-the-land-wide-quiet-and-peaceable-dwelling-safely-in-the-inheritance',
       E'The land wide, quiet, and peaceable — dwelling safely in the inheritance',
       E'When the princes of Simeon went seeking pasture for their flocks, *they found fat pasture and good, and the land was wide, and quiet, and peaceable* (1 Chronicles 4:40). The chronicler''s words are the covenant promise made visible. Yahuah had pledged to His people: *and ye shall eat your bread to the full, and dwell in your land safely* (Leviticus 26:5) — the safe, full dwelling that obedient possession of the inheritance brings. And the prophet sets the same picture as the consummation: *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). The wide, quiet, peaceable land the sons of Simeon found is a foretaste of the rest Yahuah gives His people in the inheritance — the dwelling-safely that the covenant promises and the prophets sing toward the end.',
       sv.verse_id, ev.verse_id, 'free', 30076
  FROM _s313_chr04_lookup sv, _s313_chr04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=4 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=4 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (4,10,'canon','psalms',34,4,1,E'*I sought Yahuah (LORD), and he heard me, and delivered me from all my fears* (Psalm 34:4) — the seeking soul heard, as Jabez was heard.'),
    (4,10,'canon','psalms',34,6,2,E'*This poor man cried, and Yahuah (LORD) heard him, and saved him out of all his troubles* (Psalm 34:6) — the dependent cry, not a technique, heard and saved.'),
    (4,10,'canon','jeremiah',33,3,3,E'*Call unto me, and I will answer thee, and shew thee great and mighty things* (Jeremiah 33:3) — the open invitation Jabez took up when he called on the Elohim of Yashar''el.'),
    (4,10,'canon','matthew',7,7,4,E'*Ask, and it shall be given you; seek, and ye shall find* (Matthew 7:7) — the asking-receiving promise Jabez lived before it was spoken.'),
    (4,10,'canon','matthew',7,8,5,E'*For every one that asketh receiveth* (Matthew 7:8) — Jabez the standing proof: he asked and it was granted.'),
    (4,10,'canon','matthew',6,13,6,E'*deliver us from evil* (Matthew 6:13) — the very petition Jabez prayed, that He would keep him from evil.'),
    (4,10,'canon','1-john',5,14,7,E'*if we ask any thing according to his will, he heareth us* (1 John 5:14) — the confidence that the Elohim of Yashar''el hears, fulfilled in Jabez.'),
    (4,10,'canon','1-john',5,15,8,E'*we know that we have the petitions that we desired of him* (1 John 5:15) — the petition desired, the petition had.'),
    (4,10,'canon','james',4,2,9,E'*ye have not, because ye ask not* (James 4:2) — the contrast: Jabez asked, and so he had.')
  ) AS m(dummy,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s313_chr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=4 AND sv.verse_number=m.src_v
  JOIN _s313_chr04_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='1-chronicles-4-jabez-called-on-the-elohim-of-israel-and-was-answered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (4,40,'canon','leviticus',26,5,1,E'*and ye shall eat your bread to the full, and dwell in your land safely* (Leviticus 26:5) — the covenant promise of safe dwelling, found by Simeon.'),
    (4,40,'canon','micah',4,4,2,E'*they shall sit every man under his vine and under his fig tree; and none shall make them afraid* (Micah 4:4) — the promised undisturbed dwelling the peaceable land foretastes.')
  ) AS m(dummy,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN _s313_chr04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=4 AND sv.verse_number=m.src_v
  JOIN _s313_chr04_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
  JOIN cross_reference_threads t ON t.slug='1-chronicles-4-the-land-wide-quiet-and-peaceable-dwelling-safely-in-the-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_5.sql (1 Chronicles 5) -----
-- 1 Chronicles 5 — Reuben, Gad, half-Manasseh: the birthright and the scattering
-- tag: chr05 ; session prefix: s313 ; temp view: _s313_chr05_lookup
-- slug prefix: 1-chronicles-5-... ; sort_order band start: 30100 (+1 per thread)
-- source book_slug: 1-chronicles, chapter 5
--
-- THREADS (4):
--   30100  1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah   [Tanakh + NT]  free
--          (5:1-2 the foundational two-house structure: birthright forfeited by Reuben →
--           given to JOSEPH/Ephraim, the northern firstborn double portion; the chief
--           ruler/scepter from YAHUDAH, the Davidic Messianic king. Gen49:3-4, Gen49:8-10,
--           Gen48:5, Gen48:22, Deut21:17, Jer31:9, Ezek37:19, Heb7:14, Rev5:5)
--   30101  1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him  [Tanakh]  free
--          (5:18,20,22 the trans-Jordan tribes win not by sword but by trusting Elohim.
--           Ps20:7, 2Chr20:15, Ps44:3, Ps44:6)
--   30102  1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor   [Tanakh]  free
--          (5:25-26 the northern/trans-Jordan house transgressed, went a whoring after
--           other gods, and was carried into the Assyrian exile — the Lo-Ammi scattering.
--           2Kings17:6, 2Kings17:23, Hosea1:6, Hosea1:9, Deut28:64, Amos5:27)
--   30103  1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one   [Tanakh]  free
--          (5:26 the scattering reversed: Lo-Ammi → sons of the living Elohim, the two
--           houses gathered and made one. Hosea1:10, Hosea1:11, Jer31:10, Ezek37:21, Ezek37:22)
--
-- TWO-HOUSE FRAMING NOTE (5:1-2): This is THE verse that grounds the two-house reading.
--   The birthright (the firstborn double portion, Deut21:17) was forfeited by Reuben and
--   given to JOSEPH = Ephraim/the northern house (Gen48:5,22; Jer31:9 "Ephraim is my
--   firstborn"); the scepter/chief ruler came from YAHUDAH = the southern Davidic king
--   (Gen49:8-10; Heb7:14; Rev5:5). Two distinct portions, ONE people Yashar'el — birthright
--   to Joseph, scepter to Yahudah, the two sticks made one (Ezek37:19). 5:25-26 is the
--   Assyrian scattering of the northern house (the Lo-Ammi dispersion of Hosea1), the
--   scattered seed to be gathered NOT lost/replaced (Hosea1:10-11; Rom11 guard — both
--   houses are Yashar'el). NO replacement; the regathering reverses the scattering.
--
-- COVERAGE CHECKLIST:
--   v.1-2  NT:     Heb7:14 (Messiah sprang of Yahudah), Rev5:5 (Lion of Yahudah, Root of David)
--          Extras: none warranted (Gen48/49 canon witnesses carry the birthright/scepter fully)
--          Tanakh: Gen49:3-4 (Reuben forfeits), Gen49:8-10 (Yahudah the scepter), Gen48:5
--                  (Ephraim & Manasseh as tribes), Gen48:22 (Joseph's double portion),
--                  Deut21:17 (firstborn double portion), Jer31:9 (Ephraim firstborn),
--                  Ezek37:19 (stick of Joseph + stick of Yahudah made one)
--   v.3-17 NT:     none warranted (genealogical roster of Reuben/Gad)
--          Extras: none warranted
--          Tanakh: none warranted (names list; v.6 captivity folded into the scattering thread)
--   v.18   NT:     none warranted
--          Extras: none warranted
--          Tanakh: Ps20:7, 2Chr20:15, Ps44:3, Ps44:6 (with v.20,22 — battle won by trust)
--   v.19   NT/Extras/Tanakh: none warranted (the Hagarite war named; folded into v.18 thread)
--   v.20   NT:     none warranted
--          Extras: none warranted
--          Tanakh: Ps20:7 (trust not in chariots), 2Chr20:15 (battle is Elohim's), Ps44:6 (trust not bow)
--   v.21-22 NT:    none warranted
--          Extras: none warranted
--          Tanakh: Ps44:3 (not by own sword) — "the war was of Elohim"; folded into v.18 thread
--   v.23-24 NT/Extras/Tanakh: none warranted (half-Manasseh settlement / heads of houses)
--   v.25   NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2Kings17:23, Hosea1:6, Hosea1:9, Deut28:64, Amos5:27 (transgressed / went a whoring)
--   v.26   NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2Kings17:6 (Halah/Habor/Gozan exact parallel), 2Kings17:23 (carried to
--                  Assyria), Hosea1:10/1:11, Jer31:10, Ezek37:21/37:22 (gathering reverses scattering)

CREATE TEMP VIEW _s313_chr05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the birthright to Joseph, the scepter to Yahudah (5:1-2)
    ('canon','1-chronicles',5,1,'canon','genesis',49,3,'free',
      E'*Reuben, thou art my firstborn, my might, and the beginning of my strength, the excellency of dignity, and the excellency of power* (Genesis 49:3). Yaaqov names Reuben the firstborn at the threshold of forfeit; the Chronicler picks up the same word — *Now the sons of Reuben the firstborn of Yashar''el (Israel)* (1 Chronicles 5:1) — to explain why the firstborn''s portion did not stay with him.'),
    ('canon','1-chronicles',5,1,'canon','genesis',49,4,'free',
      E'*Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch* (Genesis 49:4). This is the very defilement the Chronicler cites — *forasmuch as he defiled his father''s bed, his birthright was given unto the sons of Joseph* (1 Chronicles 5:1): the firstborn forfeits his place by sin against his father''s bed.'),
    ('canon','1-chronicles',5,1,'canon','genesis',48,5,'free',
      E'*And now thy two sons, Ephraim and Manasseh, which were born unto thee in the land of Egypt before I came unto thee into Egypt, are mine; as Reuben and Simeon, they shall be mine* (Genesis 48:5). The birthright that left Reuben goes to Yoseph (Joseph) as a DOUBLE portion — his two sons reckoned as full tribes; this is why *his birthright was given unto the sons of Joseph* (1 Chronicles 5:1).'),
    ('canon','1-chronicles',5,1,'canon','genesis',48,22,'free',
      E'*Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22). The *one portion above thy brethren* is the firstborn''s extra share laid on Yoseph (Joseph) — the double portion the Chronicler records as *his birthright was given unto the sons of Joseph* (1 Chronicles 5:1).'),
    ('canon','1-chronicles',5,1,'canon','deuteronomy',21,17,'free',
      E'*But he shall acknowledge the son of the hated for the firstborn, by giving him a double portion of all that he hath: for he is the beginning of his strength; the right of the firstborn is his* (Deuteronomy 21:17). The Torah defines the birthright as the *double portion* — exactly what passed from Reuben to Yoseph (Joseph), whose two sons Ephraim and Manasseh each became a tribe (1 Chronicles 5:1).'),
    ('canon','1-chronicles',5,1,'canon','jeremiah',31,9,'free',
      E'*for I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). The birthright given to the sons of Yoseph (Joseph) makes Ephraim the firstborn of the northern house; Yahuah (LORD) Himself names Ephraim *my firstborn* — the very inheritance 1 Chronicles 5:1 records being *given unto the sons of Joseph*.'),
    ('canon','1-chronicles',5,2,'canon','genesis',49,8,'free',
      E'*Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father''s children shall bow down before thee* (Genesis 49:8). The Chronicler''s *Yahudah (Judah) prevailed above his brethren, and of him came the chief ruler* (1 Chronicles 5:2) is this blessing fulfilled — Yahudah the ruler before whom his brethren bow.'),
    ('canon','1-chronicles',5,2,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The scepter sits with Yahudah, not with the firstborn-birthright of Yoseph (Joseph): *the chief ruler; but the birthright was Joseph''s* (1 Chronicles 5:2) — two distinct portions, ruler from Yahudah, birthright to Yoseph.'),
    ('canon','1-chronicles',5,1,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The two portions of 1 Chronicles 5:1-2 — birthright to Yoseph (Joseph)/Ephraim, ruler to Yahudah — are the two sticks, the two houses to be made ONE.'),
    ('canon','1-chronicles',5,2,'canon','hebrews',7,14,'free',
      E'*For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood* (Hebrews 7:14). The *chief ruler* of Yahudah (1 Chronicles 5:2) culminates in the Messiah sprung out of Yahudah — the scepter-line of Genesis 49:10 come to its King.'),
    ('canon','1-chronicles',5,2,'canon','revelation',5,5,'free',
      E'*behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof* (Revelation 5:5). The Chronicler''s *Yahudah (Judah) prevailed above his brethren* (1 Chronicles 5:2) opens onto the Lion of Yahudah who *hath prevailed* — the chief ruler''s line consummated in the Root of David.'),

    -- THREAD 2: they cried to Elohim in the battle and put their trust in Him (5:18,20,22)
    ('canon','1-chronicles',5,20,'canon','psalms',20,7,'free',
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). The trans-Jordan tribes win the same way — not by buckler and sword but *because they put their trust in him* (1 Chronicles 5:20).'),
    ('canon','1-chronicles',5,20,'canon','2-chronicles',20,15,'free',
      E'*Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). When Yahudah cried to Yahuah (LORD) the battle was His; so for these tribes *they cried to Elohim (God) in the battle, and he was intreated of them* (1 Chronicles 5:20) — *the war was of Elohim (God)* (1 Chronicles 5:22).'),
    ('canon','1-chronicles',5,18,'canon','psalms',44,3,'free',
      E'*For they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm, and the light of thy countenance, because thou hadst a favour unto them* (Psalm 44:3). The forty-four thousand *able to bear buckler and sword* (1 Chronicles 5:18) do not win by their own arm — *they were helped against them... because they put their trust in him* (1 Chronicles 5:20).'),
    ('canon','1-chronicles',5,20,'canon','psalms',44,6,'free',
      E'*For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6). The skilful archers of 1 Chronicles 5:18 lay down the boast of the bow; victory comes *because they put their trust in him* (1 Chronicles 5:20).'),

    -- THREAD 3: carried away by Assyria unto Halah and Habor (5:25-26)
    ('canon','1-chronicles',5,26,'canon','2-kings',17,6,'free',
      E'*In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). The Chronicler names the very same exile-places — *brought them unto Halah, and Habor, and Hara, and to the river Gozan, unto this day* (1 Chronicles 5:26): the Assyrian carrying-away of the northern house.'),
    ('canon','1-chronicles',5,26,'canon','2-kings',17,23,'free',
      E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). The same scattering, the same *unto this day*: 1 Chronicles 5:26 records the trans-Jordan tribes swept up in it — *he carried them away, even the Reubenites, and the Gadites, and the half tribe of Manasseh*.'),
    ('canon','1-chronicles',5,25,'canon','hosea',1,6,'free',
      E'*Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6). The whoring after other gods of 1 Chronicles 5:25 — *they transgressed against the Elohim (God) of their fathers, and went a whoring after the gods of the people* — is the harlotry that brings the Lo-Ruhamah judgment on the northern house.'),
    ('canon','1-chronicles',5,25,'canon','hosea',1,9,'free',
      E'*Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). The going *a whoring after the gods of the people* (1 Chronicles 5:25) is what makes the scattered northern house Lo-Ammi — *not my people* — until the gathering reverses it.'),
    ('canon','1-chronicles',5,26,'canon','deuteronomy',28,64,'free',
      E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The Torah''s covenant-curse for forsaking Yahuah (LORD) is enacted in 1 Chronicles 5:26 — the tribes carried away to Halah and Habor; the curse is the exile-judgment, never the Torah itself.'),
    ('canon','1-chronicles',5,26,'canon','amos',5,27,'free',
      E'*Therefore will I cause you to go into captivity beyond Damascus, saith Yahuah (LORD), whose name is The Elohim (God) of hosts* (Amos 5:27). Amos foretells the very deportation the Chronicler records — the northern house carried *beyond Damascus* into Assyria (1 Chronicles 5:26).'),

    -- THREAD 4: the scattered house to be gathered and made one (5:26 reversed)
    ('canon','1-chronicles',5,26,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The very tribes scattered to Halah and Habor (1 Chronicles 5:26) are the Lo-Ammi whose *not my people* is turned to *sons of the living Elohim* — scattered to be gathered, never lost.'),
    ('canon','1-chronicles',5,26,'canon','hosea',1,11,'free',
      E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The two houses split in 1 Chronicles 5:1-2 — birthright to Yoseph (Joseph), ruler to Yahudah — and scattered in 5:26 are *gathered together* under *one head*: the reunion of the two houses.'),
    ('canon','1-chronicles',5,26,'canon','jeremiah',31,10,'free',
      E'*He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The same Yahuah (LORD) who *carried them away... unto Halah, and Habor* (1 Chronicles 5:26) is the One who gathers the scattered seed — the scattering is His, and so is the regathering.'),
    ('canon','1-chronicles',5,26,'canon','ezekiel',37,21,'free',
      E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The tribes carried *among the heathen* in 1 Chronicles 5:26 are precisely those Yahuah (LORD) promises to gather *from among the heathen, whither they be gone*.'),
    ('canon','1-chronicles',5,26,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two-house division of 1 Chronicles 5:1-2 and the scattering of 5:26 end here — the houses *no more two nations*, made one under one king.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',
  E'The birthright to Yoseph, the scepter to Yahudah — the two-house structure',
  E'The Chronicler pauses his genealogy to explain the whole shape of Yahuah''s (LORD) people. *Now the sons of Reuben the firstborn of Yashar''el (Israel), (for he was the firstborn; but, forasmuch as he defiled his father''s bed, his birthright was given unto the sons of Joseph the son of Yashar''el (Israel)... For Yahudah (Judah) prevailed above his brethren, and of him came the chief ruler; but the birthright was Joseph''s:)* (1 Chronicles 5:1-2). Two portions are split here, not one. Reuben forfeits the firstborn''s place exactly as Yaaqov foretold — *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it* (Genesis 49:4). The firstborn''s portion is by Torah a DOUBLE portion: *he shall acknowledge the son of the hated for the firstborn, by giving him a double portion of all that he hath: for he is the beginning of his strength; the right of the firstborn is his* (Deuteronomy 21:17). That double portion lands on Yoseph (Joseph), whose two sons are reckoned as two full tribes: *And now thy two sons, Ephraim and Manasseh... are mine; as Reuben and Simeon, they shall be mine* (Genesis 48:5), *I have given to thee one portion above thy brethren* (Genesis 48:22). So Yahuah (LORD) names Ephraim the firstborn of the northern house: *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). But the SCEPTER — the ruler — went elsewhere: *Yahudah (Judah), thou art he whom thy brethren shall praise* (Genesis 49:8); *The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10). The chief ruler is of Yahudah (the southern, Davidic house), the birthright is Yoseph''s (the northern, Ephraimite house). This is the two-house people: *the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The scepter-line runs to its King — *our Lord sprang out of Juda* (Hebrews 7:14), *the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5). Birthright to Yoseph, scepter to Yahudah: two portions, one people Yashar''el, gathered not replaced.',
  sv.verse_id, ev.verse_id, 'free', 30100
  FROM _s313_chr05_lookup sv, _s313_chr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him',
  E'They cried to Elohim in the battle and put their trust in Him',
  E'The trans-Jordan tribes are mighty — *valiant men, men able to bear buckler and sword, and to shoot with bow, and skilful in war, were four and forty thousand seven hundred and threescore, that went out to the war* (1 Chronicles 5:18) — yet the Chronicler is careful to say the victory was not in their arms: *And they were helped against them... for they cried to Elohim (God) in the battle, and he was intreated of them; because they put their trust in him* (1 Chronicles 5:20), *for the war was of Elohim (God)* (1 Chronicles 5:22). This is the constant Tanakh confession. *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). *For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6); *they got not the land in possession by their own sword, neither did their own arm save them: but thy right hand, and thine arm* (Psalm 44:3). When Yahudah faced a great multitude the word was the same: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). The skilful archers of Gilead win the only way Yashar''el (Israel) ever wins — by crying to Elohim and trusting Him.',
  sv.verse_id, ev.verse_id, 'free', 30101
  FROM _s313_chr05_lookup sv, _s313_chr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=5 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',
  E'Carried away by Assyria unto Halah and Habor — the scattering of the northern house',
  E'The chapter that opened with the birthright closes with the loss of the land. *And they transgressed against the Elohim (God) of their fathers, and went a whoring after the gods of the people of the land, whom Elohim (God) destroyed before them. And the Elohim (God) of Yashar''el (Israel) stirred up the spirit of Pul king of Assyria, and the spirit of Tilgath-pilneser king of Assyria, and he carried them away, even the Reubenites, and the Gadites, and the half tribe of Manasseh, and brought them unto Halah, and Habor, and Hara, and to the river Gozan, unto this day* (1 Chronicles 5:25-26). These are the exact place-names of the Assyrian exile of the whole northern house: *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan* (2 Kings 17:6); *So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). The whoring after other gods is the harlotry Hosea was given to name: *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6), *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9). It is the covenant-curse of the Torah enacted — *Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — and the captivity Amos foretold — *Therefore will I cause you to go into captivity beyond Damascus* (Amos 5:27). The curse is the exile-judgment for covenant-breaking, never the Torah itself; and the scattering of the firstborn-birthright house is the very dispersion the regathering will reverse.',
  sv.verse_id, ev.verse_id, 'free', 30102
  FROM _s313_chr05_lookup sv, _s313_chr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',
  E'The scattered house to be gathered and made one',
  E'The carrying-away is not the last word over the firstborn house. The tribes brought *unto Halah, and Habor, and Hara, and to the river Gozan* (1 Chronicles 5:26) are the Lo-Ammi whom Yahuah (LORD) sware to turn again: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The two houses split back in 5:1-2 — birthright to Yoseph (Joseph)/Ephraim, ruler to Yahudah — and scattered here are gathered as one: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11). The One who scattered is the One who gathers: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21); *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22). The scattered seed of Reuben, Gad, and half-Manasseh is not lost and not replaced — it is sown to be gathered, the two sticks made one in the hand of Yahuah (LORD).',
  sv.verse_id, ev.verse_id, 'free', 30103
  FROM _s313_chr05_lookup sv, _s313_chr05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=5 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    -- Thread 1: the birthright to Yoseph, the scepter to Yahudah
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','genesis',49,3,1,
      E'*Reuben, thou art my firstborn, my might, and the beginning of my strength* (Genesis 49:3) — the firstborn named at the edge of forfeit.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','genesis',49,4,2,
      E'*because thou wentest up to thy father''s bed; then defiledst thou it* (Genesis 49:4) — the defilement that cost Reuben the birthright (1 Chronicles 5:1).'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','genesis',48,5,3,
      E'*thy two sons, Ephraim and Manasseh... are mine; as Reuben and Simeon, they shall be mine* (Genesis 48:5) — the double portion to Yoseph (Joseph), two tribes.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','genesis',48,22,4,
      E'*I have given to thee one portion above thy brethren* (Genesis 48:22) — the firstborn''s extra share laid on Yoseph (Joseph).'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','deuteronomy',21,17,5,
      E'*giving him a double portion of all that he hath... the right of the firstborn is his* (Deuteronomy 21:17) — the Torah''s definition of the birthright.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','jeremiah',31,9,6,
      E'*Ephraim is my firstborn* (Jeremiah 31:9) — Yahuah (LORD) names the northern house firstborn.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',2,'canon','genesis',49,8,7,
      E'*Yahudah (Judah), thou art he whom thy brethren shall praise* (Genesis 49:8) — the ruler before whom his brethren bow (1 Chronicles 5:2).'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',2,'canon','genesis',49,10,8,
      E'*The sceptre shall not depart from Yahudah (Judah)* (Genesis 49:10) — the scepter with Yahudah, not the birthright-house.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',1,'canon','ezekiel',37,19,9,
      E'*the stick of Joseph... even with the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the two portions are the two sticks, two houses made one.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',2,'canon','hebrews',7,14,10,
      E'*our Lord sprang out of Juda* (Hebrews 7:14) — the chief ruler''s line come to its King.'),
    ('1-chronicles-5-the-birthright-to-joseph-the-scepter-to-judah',2,'canon','revelation',5,5,11,
      E'*the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5) — Yahudah who *prevailed* consummated.'),

    -- Thread 2: they cried to Elohim in the battle and put their trust in Him
    ('1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him',20,'canon','psalms',20,7,1,
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7) — not buckler and sword but trust.'),
    ('1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him',20,'canon','2-chronicles',20,15,2,
      E'*the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15) — *the war was of Elohim (God)* (1 Chronicles 5:22).'),
    ('1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him',18,'canon','psalms',44,3,3,
      E'*they got not the land... by their own sword, neither did their own arm save them: but thy right hand* (Psalm 44:3) — the skilful host wins by Yahuah''s arm.'),
    ('1-chronicles-5-they-cried-to-elohim-in-the-battle-and-put-their-trust-in-him',20,'canon','psalms',44,6,4,
      E'*For I will not trust in my bow, neither shall my sword save me* (Psalm 44:6) — the archers of Gilead lay down the boast of the bow.'),

    -- Thread 3: carried away by Assyria unto Halah and Habor
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',26,'canon','2-kings',17,6,1,
      E'*carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan* (2 Kings 17:6) — the exact same exile-places.'),
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',26,'canon','2-kings',17,23,2,
      E'*So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23) — the same *unto this day* scattering.'),
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',25,'canon','hosea',1,6,3,
      E'*Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6) — the harlotry that brings the judgment (1 Chronicles 5:25).'),
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',25,'canon','hosea',1,9,4,
      E'*Lo-ammi: for ye are not my people* (Hosea 1:9) — the whoring after other gods makes the northern house Lo-Ammi.'),
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',26,'canon','deuteronomy',28,64,5,
      E'*Yahuah (LORD) shall scatter thee among all people* (Deuteronomy 28:64) — the covenant-curse for forsaking Yahuah, the exile-judgment not the Torah.'),
    ('1-chronicles-5-carried-away-by-assyria-unto-halah-and-habor',26,'canon','amos',5,27,6,
      E'*I cause you to go into captivity beyond Damascus* (Amos 5:27) — the deportation foretold.'),

    -- Thread 4: the scattered house to be gathered and made one
    ('1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',26,'canon','hosea',1,10,1,
      E'*where it was said... Ye are not my people, there it shall be said... Ye are the sons of the living Elohim (God)* (Hosea 1:10) — Lo-Ammi turned.'),
    ('1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',26,'canon','hosea',1,11,2,
      E'*the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11) — the two houses reunited.'),
    ('1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',26,'canon','jeremiah',31,10,3,
      E'*He that scattered Yashar''el (Israel) will gather him* (Jeremiah 31:10) — the One who scattered gathers.'),
    ('1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',26,'canon','ezekiel',37,21,4,
      E'*I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them* (Ezekiel 37:21) — gathered from where they were carried.'),
    ('1-chronicles-5-the-scattered-house-to-be-gathered-and-made-one',26,'canon','ezekiel',37,22,5,
      E'*one nation in the land... they shall be no more two nations* (Ezekiel 37:22) — the division and the scattering both ended.')
  ) AS m(slug, src_v, tgt_ed, tgt_slug, tgt_ch, tgt_v, sort_order, member_note)
  JOIN cross_reference_threads t ON t.slug=m.slug
  JOIN _s313_chr05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=5 AND sv.verse_number=m.src_v
  JOIN _s313_chr05_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_6.sql (1 Chronicles 6) -----
-- 1 Chronicles 6 — the tribe of Levi: the priestly line, the singers, the Levitical cities
-- tag: chr06 ; session prefix: s313 ; temp view: _s313_chr06_lookup
-- slug prefix: 1-chronicles-6-... ; sort_order band start: 30125 (+1 per thread)
-- source book_slug: 1-chronicles, chapter 6
--
-- THREADS (3):
--   30125  1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood   [Tanakh + NT + Extras]  extras
--          (6:3-15,6:49-53 the high-priestly succession Aaron→Eleazar→Phinehas→Zadok→Jehozadak
--           into captivity; 6:49 atonement for Yashar'el. Exod29:9, Exod29:18, Num25:13, Mal2:4,
--           Mal2:7, Jubilees31:15, Heb7:11, Heb7:12, Heb7:17 — the real Yahuah-ordained Aaronic
--           priesthood, incl. the atonement-work of 6:49, anticipating the Melek Tsadiq
--           priesthood of the Formed Son)
--   30126  1-chronicles-6-the-singers-david-set-over-the-service-of-song   [Tanakh + NT]  free
--          (6:31-32 Heman, Asaph, Ethan set over the song-service in the house of Yahuah.
--           1Chr16:4, 1Chr16:5, 2Chr5:13, Eph5:19, Col3:16, Rev5:9 — the appointed worship)
--   30127  1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance   [Tanakh]  free
--          (6:54-67 the Levitical cities + cities of refuge; the Levites scattered yet given
--           Yahuah as their portion. Num35:2, Num35:6, Josh21:41, Num18:20)
-- NOTE: the atonement-work of 6:49 (originally weighed as its own thread) is FOLDED into
--   thread 1 — the atonement is the office's purpose, not a distinct theme.
--
-- FRAMING NOTE: The Aaronic/Levitical priesthood is REAL and Yahuah-ordained — the everlasting
--   priesthood-covenant given to Phinehas (Num25:13) and the covenant of Levi (Mal2:4-7) — yet
--   the very fact that the line runs to *Jehozadak went into captivity* (6:15) and must keep
--   *to make an atonement for Yashar'el (Israel)* year by year shows it ANTICIPATES the greater,
--   unending priesthood of the Formed Son after the order of Melek Tsadiq (Heb7): not abolished
--   in contempt, but fulfilled and surpassed by *a priest for ever* (Heb7:17). The singers are
--   the appointed worship of Yahuah, the song-service David ordained, carried forward into the
--   assembly (Eph5:19/Col3:16) and consummated in the new song (Rev5:9). The Levites' inheritance
--   is Yahuah Himself (Num18:20) — they hold no land-portion but the portion of Yahuah.
--
-- 1 Chronicles 6 coverage:
--   v.1-2   NT/Extras/Tanakh: none warranted (sons of Levi / Kohath roster)
--   v.3     NT:     none warranted   Extras: none warranted
--           Tanakh: Exod29 (Aaron's sons consecrated) — folded into the priesthood thread via v.3 anchor
--   v.3-15  NT:     Heb7:11-17 (the priesthood changed / after Melek Tsadiq)
--           Extras: Jubilees31:15 (the covenant of Levi — declare His ways/judgments)
--           Tanakh: Exod29:9 (priest's office a perpetual statute), Num25:13 (everlasting
--                   priesthood to Phinehas), Mal2:4/2:7 (the covenant of Levi)
--   v.16-30 NT/Extras/Tanakh: none warranted (Gershom/Kohath/Merari families roster)
--   v.31-32 NT:     Eph5:19, Col3:16 (psalms and hymns and spiritual songs), Rev5:9 (the new song)
--           Extras: none warranted (the worship-song witnesses are canon)
--           Tanakh: 1Chr16:4, 1Chr16:5 (David appoints the Levites to praise/Asaph), 2Chr5:13
--                   (the singers as one when the house was filled with the cloud)
--   v.33-48 NT/Extras/Tanakh: none warranted (the singers' genealogies Heman/Asaph/Ethan rosters)
--   v.49    NT:     Hebrews 7 (atonement-work, folded into priesthood thread)
--           Extras: none warranted
--           Tanakh: Exod29:18 (burnt offering a sweet savour), Num25:13 (made atonement) — folded
--                   into the line-of-Aaron thread (the atonement-work is the office's purpose)
--   v.50-53 NT/Extras/Tanakh: none warranted (the sons of Aaron restated — folded into thread 1)
--   v.54-67 NT:     none warranted
--           Extras: none warranted
--           Tanakh: Num35:2 (give the Levites cities), Num35:6 (cities of refuge), Josh21:41
--                   (forty and eight cities of the Levites), Num18:20 (Yahuah their inheritance)
--   v.68-81 NT/Extras/Tanakh: none warranted (continued city-roster; covered by the cities thread)

CREATE TEMP VIEW _s313_chr06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the line of Aaron, the everlasting priesthood (6:3-15, 6:49-53)
    ('canon','1-chronicles',6,3,'canon','exodus',29,9,'free',
      E'*And thou shalt gird them with girdles, Aaron and his sons, and put the bonnets on them: and the priest''s office shall be theirs for a perpetual statute: and thou shalt consecrate Aaron and his sons* (Exodus 29:9). The Chronicler''s roster begins where the office began — *The sons also of Aaron; Nadab, and Abihu, Eleazar, and Ithamar* (1 Chronicles 6:3) — the priesthood Yahuah (LORD) made *theirs for a perpetual statute*.'),
    ('canon','1-chronicles',6,4,'canon','numbers',25,13,'free',
      E'*And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). The Chronicler''s line runs *Eleazar begat Phinehas* (1 Chronicles 6:4) — the very Phinehas to whom Yahuah (LORD) gave *the covenant of an everlasting priesthood*; the succession that follows is that covenant unfolding.'),
    ('canon','1-chronicles',6,15,'canon','malachi',2,4,'free',
      E'*And ye shall know that I have sent this commandment unto you, that my covenant might be with Levi, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:4). The whole high-priestly line — down to *Jehozadak went into captivity, when Yahuah (LORD) carried away Yahudah (Judah) and Jerusalem* (1 Chronicles 6:15) — stands on *my covenant... with Levi*, the priesthood Yahuah established and would purify, not discard.'),
    ('canon','1-chronicles',6,15,'canon','malachi',2,7,'free',
      E'*For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7). The office the Chronicler traces from Aaron to Jehozadak (1 Chronicles 6:3-15) is this — the priest who keeps knowledge and at whose mouth the people *seek the law*; the Torah was never severed from the priesthood.'),
    ('canon','1-chronicles',6,4,'jubilees','jubilees',31,15,'extras',
      E'*They will speak the word of Yahuah (God) in righteousness, And they will judge all His judgments in righteousness. And they will declare My ways to Jacob And My paths to Yashar’el (Israel)* (Jubilees 31:15). Yaaqov''s blessing on Levi names the priestly calling the Chronicler''s roster embodies (1 Chronicles 6:4-15) — the line set apart to declare Yahuah''s (LORD) ways and judgments, the covenant of Levi spoken before Malachi named it.'),
    ('canon','1-chronicles',6,49,'canon','exodus',29,18,'free',
      E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). This is the very work the Chronicler assigns to Aaron''s line — *But Aaron and his sons offered upon the altar of the burnt offering, and on the altar of incense* (1 Chronicles 6:49) — the consecrated office offering the sweet savour before Yahuah.'),
    ('canon','1-chronicles',6,49,'canon','numbers',25,13,'free',
      E'*even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). The Chronicler states the office''s purpose in the same words — Aaron and his sons *to make an atonement for Yashar''el (Israel), according to all that Moses the servant of Elohim (God) had commanded* (1 Chronicles 6:49) — the atonement-work of the everlasting priesthood.'),
    ('canon','1-chronicles',6,49,'canon','hebrews',7,11,'free',
      E'*If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11). The Aaronic atonement of 1 Chronicles 6:49 was real and Yahuah-ordained, yet it pointed beyond itself: the repeated *atonement for Yashar''el (Israel)* shows perfection was not reached *by the Levitical priesthood*, so *another priest* must rise after Melek Tsadiq.'),
    ('canon','1-chronicles',6,15,'canon','hebrews',7,12,'free',
      E'*For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12). The Chronicler''s line ends in exile — *Jehozadak went into captivity* (1 Chronicles 6:15); the Aaronic succession is interrupted, and Hebrews unfolds why a priesthood *changed* to *another priest* of another tribe was always in view, the Aaronic order fulfilled and surpassed, not abolished in contempt.'),
    ('canon','1-chronicles',6,53,'canon','hebrews',7,17,'free',
      E'*For he testifieth, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The Chronicler ends the succession with *Zadok his son, Ahimaaz his son* (1 Chronicles 6:53) — a line of mortal priests, each succeeded by another; the Formed Son is *a priest for ever*, the unending priesthood the dying Aaronic line foreshadowed and anticipated.'),

    -- THREAD 2: the singers David set over the service of song (6:31-32)
    ('canon','1-chronicles',6,31,'canon','1-chronicles',16,4,'free',
      E'*And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4). This is the same act the Chronicler names here — *these are they whom David set over the service of song in the house of Yahuah (LORD), after that the ark had rest* (1 Chronicles 6:31) — David appointing the Levites to the ministry of praise.'),
    ('canon','1-chronicles',6,31,'canon','1-chronicles',16,5,'free',
      E'*Asaph the chief, and next to him Zechariah, Jeiel, and Shemiramoth... with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5). Asaph, named here as the head of the singers, is the same Asaph the Chronicler places in this song-service (1 Chronicles 6:31, 6:39) — the appointed worship of Yahuah with psaltery, harp, and cymbal.'),
    ('canon','1-chronicles',6,32,'canon','2-chronicles',5,13,'free',
      E'*the trumpeters and singers were as one, to make one sound to be heard in praising and thanking Yahuah (LORD)... that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13). The song-service that *ministered before the dwelling place of the tabernacle of the congregation with singing, until Solomon had built the house of Yahuah (LORD)* (1 Chronicles 6:32) comes to its glory when, the house built, the singers as one fill it with praise and the cloud descends.'),
    ('canon','1-chronicles',6,31,'canon','ephesians',5,19,'free',
      E'*Speaking to yourselves in psalms and hymns and spiritual songs, singing and making melody in your heart to Yahuah (Lord)* (Ephesians 5:19). The song-service David *set over the service of song in the house of Yahuah (LORD)* (1 Chronicles 6:31) is not left behind but carried into the assembly — the same appointed worship in psalm, hymn, and spiritual song.'),
    ('canon','1-chronicles',6,31,'canon','colossians',3,16,'free',
      E'*teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). The worship David appointed for the house of Yahuah (1 Chronicles 6:31) continues as the people sing *in psalms and hymns and spiritual songs* — the ministry of song handed forward.'),
    ('canon','1-chronicles',6,32,'canon','revelation',5,9,'free',
      E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The Levites who *ministered before the dwelling place of the tabernacle... with singing* (1 Chronicles 6:32) sing toward this consummation — the new song before the Lamb, the song-service of Yahuah brought to its end before the throne.'),

    -- THREAD 3: the Levites given cities, Yahuah their inheritance (6:54-67)
    ('canon','1-chronicles',6,54,'canon','numbers',35,2,'free',
      E'*Command the children of Yashar''el (Israel), that they give unto the Levites of the inheritance of their possession cities to dwell in; and ye shall give also unto the Levites suburbs for the cities round about them* (Numbers 35:2). The Chronicler records the carrying-out of this very command — *Now these are their dwelling places throughout their castles in their coasts, of the sons of Aaron* (1 Chronicles 6:54) — the cities Yahuah (LORD) ordered given to the Levites.'),
    ('canon','1-chronicles',6,57,'canon','numbers',35,6,'free',
      E'*And among the cities which ye shall give unto the Levites there shall be six cities for refuge, which ye shall appoint for the manslayer, that he may flee thither* (Numbers 35:6). The Chronicler names them — *to the sons of Aaron they gave the cities of Yahudah (Judah), namely, Hebron, the city of refuge* (1 Chronicles 6:57) — the cities of refuge given among the Levites'' cities exactly as Yahuah commanded.'),
    ('canon','1-chronicles',6,60,'canon','joshua',21,41,'free',
      E'*All the cities of the Levites within the possession of the children of Yashar''el (Israel) were forty and eight cities with their suburbs* (Joshua 21:41). The Chronicler tallies the same allotment city by city and tribe by tribe (1 Chronicles 6:54-81) — *thirteen cities* to Aaron''s sons (1 Chronicles 6:60), the rest among Kohath, Gershom, and Merari — the forty-eight Levitical cities of the Torah''s command.'),
    ('canon','1-chronicles',6,54,'canon','numbers',18,20,'free',
      E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). The Levites receive scattered cities, not a tribal land-portion, *for theirs was the lot* (1 Chronicles 6:54) — because their inheritance is not land but Yahuah Himself, *I am thy part and thine inheritance*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood',
  E'The line of Aaron — the everlasting priesthood that points to the better priest',
  E'The Chronicler traces the high-priestly succession from Aaron in an unbroken line: *The sons also of Aaron; Nadab, and Abihu, Eleazar, and Ithamar. Eleazar begat Phinehas, Phinehas begat Abishua* (1 Chronicles 6:3-4)... down through Zadok and on to *Jehozadak went into captivity, when Yahuah (LORD) carried away Yahudah (Judah) and Jerusalem by the hand of Nebuchadnezzar* (1 Chronicles 6:15). This is a real, Yahuah-ordained office. Yahuah made *the priest''s office... theirs for a perpetual statute* (Exodus 29:9); to Phinehas — named here at the head of the line — He gave *the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13). It is *my covenant... with Levi* (Malachi 2:4), the office of the one whose *lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7) — Torah and priesthood never severed. Yaaqov''s blessing already marked Levi for it: *they will declare My ways to Jacob And My paths to Yashar’el (Israel)* (Jubilees 31:15). The Chronicler also states the office''s purpose: *But Aaron and his sons offered upon the altar of the burnt offering, and on the altar of incense, and were appointed for all the work of the place most holy, and to make an atonement for Yashar''el (Israel)* (1 Chronicles 6:49) — the burnt offering of *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18). Yet this very line testifies of its own limit. It runs to *Jehozadak went into captivity* (1 Chronicles 6:15) — the succession interrupted, the priests mortal, *Zadok his son, Ahimaaz his son* (1 Chronicles 6:53), each succeeded by another. So Hebrews reads it: *If therefore perfection were by the Levitical priesthood... what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek)?* (Hebrews 7:11); *For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12); *Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17). The Aaronic priesthood is not abolished in contempt — it is fulfilled and surpassed. The real, ordained, atoning line of Aaron was always anticipating the unending priesthood of the Formed Son, *a priest for ever*.',
  sv.verse_id, ev.verse_id, 'extras', 30125
  FROM _s313_chr06_lookup sv, _s313_chr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=6 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-6-the-singers-david-set-over-the-service-of-song',
  E'The singers David set over the service of song in the house of Yahuah',
  E'In the midst of the Levitical genealogy the Chronicler pauses to name a ministry: *And these are they whom David set over the service of song in the house of Yahuah (LORD), after that the ark had rest. And they ministered before the dwelling place of the tabernacle of the congregation with singing, until Solomon had built the house of Yahuah (LORD) in Jerusalem: and then they waited on their office according to their order* (1 Chronicles 6:31-32) — Heman, Asaph, and Ethan and their houses. This is the same appointment told elsewhere: *he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4), with *Asaph the chief... with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5). The song-service reaches its glory when the house is finished: *the trumpeters and singers were as one, to make one sound to be heard in praising and thanking Yahuah (LORD)... that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13). This appointed worship is not left behind. It is carried forward into the assembly — *Speaking to yourselves in psalms and hymns and spiritual songs, singing and making melody in your heart to Yahuah (Lord)* (Ephesians 5:19); *teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16) — and consummated before the throne: *And they sung a new song, saying, Thou art worthy to take the book... for thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9). The singers David set in order minister the worship of Yahuah from the tabernacle to the temple to the new song.',
  sv.verse_id, ev.verse_id, 'free', 30126
  FROM _s313_chr06_lookup sv, _s313_chr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=6 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance',
  E'The Levites given cities — Yahuah Himself their inheritance',
  E'The chapter closes with the Levites'' dwelling places: *Now these are their dwelling places throughout their castles in their coasts, of the sons of Aaron, of the families of the Kohathites: for theirs was the lot* (1 Chronicles 6:54), and then city by city, tribe by tribe — Hebron, Libnah, Anathoth, Shechem, Golan, and the rest. This carries out the Torah''s command: *Command the children of Yashar''el (Israel), that they give unto the Levites of the inheritance of their possession cities to dwell in; and ye shall give also unto the Levites suburbs for the cities round about them* (Numbers 35:2). Among them are the cities of refuge: *to the sons of Aaron they gave the cities of Yahudah (Judah), namely, Hebron, the city of refuge* (1 Chronicles 6:57) — *there shall be six cities for refuge, which ye shall appoint for the manslayer, that he may flee thither* (Numbers 35:6). The full count matches Joshua''s record: *All the cities of the Levites within the possession of the children of Yashar''el (Israel) were forty and eight cities with their suburbs* (Joshua 21:41). The Levites alone receive no tribal land-portion but scattered cities — *for theirs was the lot* — because their inheritance is of another kind: *And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). Scattered through every tribe, holding no land, the Levites hold the portion no other tribe is given — Yahuah Himself.',
  sv.verse_id, ev.verse_id, 'free', 30127
  FROM _s313_chr06_lookup sv, _s313_chr06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=54
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=6 AND ev.verse_number=67
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the line of Aaron, the everlasting priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the priest''s office shall be theirs for a perpetual statute* (Exodus 29:9) — the office Yahuah made the sons of Aaron''s (1 Chronicles 6:3).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the covenant of an everlasting priesthood* (Numbers 25:13) — given to Phinehas, named in the line (1 Chronicles 6:4).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*my covenant might be with Levi* (Malachi 2:4) — the priesthood the whole line stands on (1 Chronicles 6:15).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7) — Torah and priesthood never severed.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they will declare My ways to Jacob And My paths to Yashar’el (Israel)* (Jubilees 31:15) — Yaaqov''s blessing marks Levi for the priestly calling.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=31 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*it is a burnt offering unto Yahuah (LORD): it is a sweet savour* (Exodus 29:18) — the altar-work Aaron''s sons offered (1 Chronicles 6:49).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=49
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*made an atonement for the children of Yashar''el (Israel)* (Numbers 25:13) — the same atonement-work named in 1 Chronicles 6:49.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=49
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*If therefore perfection were by the Levitical priesthood... what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek)?* (Hebrews 7:11) — the Aaronic atonement pointed beyond itself.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=49
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*For the priesthood being changed, there is made of necessity a change also of the law* (Hebrews 7:12) — the line interrupted at the captivity (1 Chronicles 6:15).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 7:17) — the unending priesthood the dying Aaronic line (1 Chronicles 6:53) foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=53
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-line-of-aaron-the-everlasting-priesthood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the singers David set over the service of song
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he appointed certain of the Levites to minister before the ark of Yahuah (LORD)... to thank and praise* (1 Chronicles 16:4) — the same appointing of the song-ministry.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=31
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Asaph the chief... with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5) — Asaph the head of the singers named here too (1 Chronicles 6:39).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=31
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the singers were as one... the house was filled with a cloud* (2 Chronicles 5:13) — the song-service glorified when Solomon''s house was built (1 Chronicles 6:32).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=32
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Speaking to yourselves in psalms and hymns and spiritual songs* (Ephesians 5:19) — the appointed worship carried into the assembly.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=31
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*teaching and admonishing one another in psalms and hymns and spiritual songs* (Colossians 3:16) — the ministry of song handed forward.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=31
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they sung a new song... for thou wast slain, and hast redeemed us to Elohim (God) by thy blood* (Revelation 5:9) — the song-service consummated before the throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=32
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-singers-david-set-over-the-service-of-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the Levites given cities, Yahuah their inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*give unto the Levites... cities to dwell in... suburbs for the cities* (Numbers 35:2) — the command the Chronicler carries out (1 Chronicles 6:54).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=54
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*six cities for refuge... for the manslayer, that he may flee thither* (Numbers 35:6) — the cities of refuge among the Levites'' cities (1 Chronicles 6:57).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=57
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=35 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*All the cities of the Levites... were forty and eight cities with their suburbs* (Joshua 21:41) — the same allotment tallied (1 Chronicles 6:54-81).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=60
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20) — the Levites hold no land but Yahuah Himself (1 Chronicles 6:54).'
  FROM cross_reference_threads t
  JOIN _s313_chr06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=6 AND sv.verse_number=54
  JOIN _s313_chr06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-6-the-levites-given-cities-yahuah-their-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_7.sql (1 Chronicles 7) -----
-- Book: 1 Chronicles, chapter 7 (the genealogies of the northern tribes:
--   Issachar, Benjamin, Naphtali, Manasseh, Ephraim, Asher)
-- Tag: chr07   Session prefix: s313   Temp view: _s313_chr07_lookup
-- Sort band start: 30150 (+1 per thread)
-- Source book_slug=1-chronicles, chapter 7. Genealogy chapter — 2 framework-bearing threads.
--
-- 1 Chronicles 7 coverage:
--   v.1   (sons of Issachar)
--         NT:     Revelation 7:7 (tribe of Issachar sealed) — woven in northern-tribes thread
--         Extras: none warranted (bare name-list)
--         Tanakh: Genesis 49:28 (twelve tribes) — woven in northern-tribes thread
--   v.2-5 (Issachar valiant men of might, numbered) — strength of the tribes; folded into thread anchor span
--         NT/Extras/Tanakh: none warranted singly (numbering detail)
--   v.6-12 (sons of Benjamin, mighty men of valour) — Benjamin a SOUTHERN tribe but catalogued among the whole
--         NT:     Revelation 7:8 (tribe of Benjamin sealed) — woven in northern-tribes thread
--         Extras: none warranted
--         Tanakh: Genesis 49:27 (Benjamin shall ravin as a wolf) — covered via Gen 49:28 the-twelve summary
--   v.13  (sons of Naphtali)
--         NT:     Revelation 7:6 (tribe of Nepthalim sealed) — woven in northern-tribes thread
--         Tanakh: Ezekiel 48 (Naphtali's portion) — covered via Ezek 48:5 in northern-tribes thread
--   v.14-19 (sons of Manasseh — Machir, Gilead, Zelophehad's daughters)
--         NT:     Revelation 7:6 (tribe of Manasses sealed) — woven in northern-tribes thread
--         Tanakh: Ezekiel 48:4-5 (Manasseh/Ephraim portions) — woven in northern-tribes thread
--   v.20-21 (sons of Ephraim; some slain by the men of Gath)
--         NT:     none warranted directly (grief narrative)
--         Extras: none warranted (Jasher has an Ephraim-Gath raid tradition but parse not pulled clean here)
--         Tanakh: Jeremiah 31:9,18,20 (Ephraim my firstborn / bemoaning / mercy) — woven in Ephraim thread
--   v.22-24 (Ephraim mourned many days, begat Beriah "because it went evil with his house," Sherah built towns)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: Jeremiah 31:9 (Ephraim is my firstborn), 31:18 (Ephraim bemoaning himself),
--                 31:20 (I will surely have mercy upon him) — KEYSTONE Ephraim grief/restoration thread
--   v.25-29 (Ephraim's line to Jehoshua/Joshua; possessions Beth-el, Shechem, Megiddo;
--           "the children of Joseph the son of Yashar'el (Israel)")
--         NT:     Revelation 7:8 (tribe of Joseph sealed) — woven in northern-tribes thread
--         Tanakh: Ezekiel 37:19,22 (stick of Joseph / no more two nations) — woven in northern-tribes thread
--   v.30-40 (sons of Asher; choice and mighty men of valour, chief of the princes)
--         NT:     Revelation 7:6 (tribe of Aser sealed) — woven in northern-tribes thread
--         Extras: none warranted
--         Tanakh: Genesis 49:20 (out of Asher his bread shall be fat) — covered via Gen 49:28 the-twelve
--
-- THREADS (2):
--   s313 chr07 #1  1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record
--                  (anchor 7:1–7:40)  tier=free  targets: Tanakh (Genesis, Ezekiel) + NT (Revelation)
--   s313 chr07 #2  1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored
--                  (anchor 7:22–7:24) tier=free  targets: Tanakh (Jeremiah)
-- Guard: the northern tribes catalogued = the house of Joseph/Ephraim and the other northern
--   tribes remembered as part of the WHOLE twelve-tribe Yashar'el (the two-house people; though
--   scattered by Assyria, the Chronicler keeps the record — they are to be REGATHERED, never
--   erased/replaced; Ezek 37, Rev 7). Ephraim = the firstborn of the north (Jer 31:9), whose
--   mourning and Yahuah's mercy (Jer 31:20) frame the northern house's grief and restoration.

CREATE TEMP VIEW _s313_chr07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- Thread 1: the northern tribes remembered in the whole twelve-tribe record
  ('canon','1-chronicles',7,1,'canon','genesis',49,28,'free',
    E'*All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them; every one according to his blessing he blessed them.* (Genesis 49:28). The Chronicler opens *Now the sons of Issachar were, Tola, and Puah...* (1 Chronicles 7:1) and walks tribe by tribe through Issachar, Benjamin, Naphtali, Manasseh, Ephraim, and Asher — the very houses Jacob blessed by name. The roll is not a remnant of Judah only; it is the WHOLE twelve, the one covenant people kept on record even after the northern tribes were scattered.'),
  ('canon','1-chronicles',7,29,'canon','ezekiel',37,19,'free',
    E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand.* (Ezekiel 37:19). When the Chronicler ends the Ephraim register *In these dwelt the children of Joseph the son of Yashar''el (Israel)* (1 Chronicles 7:29), he names the very stick of Joseph the prophet says Yahuah will rejoin to Judah — the northern house not erased but written down, awaiting the one-stick regathering.'),
  ('canon','1-chronicles',7,29,'canon','ezekiel',37,22,'free',
    E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all.* (Ezekiel 37:22). The Chronicler records *the children of Joseph the son of Yashar''el (Israel)* (1 Chronicles 7:29) — Joseph the head of the northern kingdom — inside one continuous twelve-tribe genealogy, the paper witness that the two kingdoms are one people, to be made *no more two nations* in the gathering.'),
  ('canon','1-chronicles',7,20,'canon','ezekiel',48,5,'free',
    E'*And by the border of Manasseh, from the east side unto the west side, a portion for Ephraim.* (Ezekiel 48:5). The chapter lists *the sons of Ephraim* (1 Chronicles 7:20) alongside Manasseh his brother (7:14-19) — and Ezekiel''s restored-land vision assigns each of these northern houses its own inheritance-portion among the tribes. The genealogy keeps the names the prophet keeps the land for.'),
  ('canon','1-chronicles',7,40,'canon','revelation',7,6,'free',
    E'*Of the tribe of Aser were sealed twelve thousand. Of the tribe of Nepthalim were sealed twelve thousand. Of the tribe of Manasses were sealed twelve thousand.* (Revelation 7:6). The Chronicler closes Asher *choice and mighty men of valour, chief of the princes* (1 Chronicles 7:40) — and Asher (Aser), with Naphtali and Manasseh, the same northern tribes catalogued here, stands sealed among the hundred forty and four thousand. The scattered tribes are not lost; they are numbered and sealed at the end.'),
  ('canon','1-chronicles',7,29,'canon','revelation',7,8,'free',
    E'*Of the tribe of Zabulon were sealed twelve thousand. Of the tribe of Joseph were sealed twelve thousand. Of the tribe of Benjamin were sealed twelve thousand.* (Revelation 7:8). *The children of Joseph the son of Yashar''el (Israel)* (1 Chronicles 7:29) — the house of Joseph (Ephraim/Manasseh), the northern firstborn — is sealed by name in the consummation, with Benjamin who is likewise enrolled in this chapter (7:6-12). The two-house people, kept on record by the Chronicler, is sealed whole.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- Thread 2: Ephraim mourned — the firstborn of the north grieved and restored
  ('canon','1-chronicles',7,22,'canon','jeremiah',31,9,'free',
    E'*They shall come with weeping, and with supplications will I lead them: I will cause them to walk by the rivers of waters in a straight way, wherein they shall not stumble: for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). When *Ephraim their father mourned many days, and his brethren came to comfort him* (1 Chronicles 7:22) over the sons slain by the men of Gath, it is the firstborn of the north who grieves — and the same Ephraim Yahuah names *my firstborn*, the son he leads home weeping but kept.'),
  ('canon','1-chronicles',7,22,'canon','jeremiah',31,18,'free',
    E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God).* (Jeremiah 31:18). Ephraim''s mourning in the record — *Ephraim their father mourned many days* (1 Chronicles 7:22) — opens into the prophet''s vision of the whole northern house bemoaning itself in exile and crying to be turned back. The grief of the man foreshadows the grief and repentance of the tribe.'),
  ('canon','1-chronicles',7,23,'canon','jeremiah',31,20,'free',
    E'*Is Ephraim my dear son? is he a pleasant child? for since I spake against him, I do earnestly remember him still: therefore my bowels are troubled for him; I will surely have mercy upon him, saith Yahuah (LORD).* (Jeremiah 31:20). Ephraim names the new son Beriah *because it went evil with his house* (1 Chronicles 7:23) — the evil that befell the northern firstborn. Yet over that very house Yahuah declares mercy: he earnestly remembers Ephraim still and will surely restore him.'),
  ('canon','1-chronicles',7,24,'canon','jeremiah',31,4,'free',
    E'*Again I will build thee, and thou shalt be built, O virgin of Yashar''el (Israel): thou shalt again be adorned with thy tabrets, and shalt go forth in the dances of them that make merry.* (Jeremiah 31:4). After the grief, the chapter turns to rebuilding: *And his daughter was Sherah, who built Beth-horon the nether, and the upper, and Uzzen-sherah.* (1 Chronicles 7:24). A daughter of Ephraim raising cities out of the house''s loss is a small token of the great promise — Yahuah himself rebuilding the northern house he chastised.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record',
       E'1 Chronicles 7 — The Northern Tribes Remembered in the Whole Twelve-Tribe Record',
       E'The Chronicler is writing for a returned remnant of Yahudah (Judah), generations after Assyria scattered the northern kingdom — and yet he refuses to write the lost tribes out of the book. Chapter 7 walks deliberately through Issachar, Benjamin, Naphtali, Manasseh, Ephraim, and Asher: *Now the sons of Issachar were, Tola, and Puah, Jashub, and Shimron, four* (1 Chronicles 7:1), on to *the children of Joseph the son of Yashar''el (Israel)* (1 Chronicles 7:29), and closing with Asher''s *choice and mighty men of valour, chief of the princes* (1 Chronicles 7:40). These are the houses Jacob blessed at the last: *All these are the twelve tribes of Yashar''el (Israel): and this is it that their father spake unto them, and blessed them* (Genesis 49:28). The whole twelve, not Judah alone.\n\nThis is the two-house people kept on the page. Joseph here is the very stick the prophet says Yahuah will take up again: *Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19) — until *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The restored-land vision assigns each northern house its inheritance — *a portion for Ephraim* (Ezekiel 48:5) — keeping the land for the names the genealogy keeps.\n\nAnd these same scattered tribes are sealed at the end: *Of the tribe of Aser were sealed twelve thousand. Of the tribe of Nepthalim were sealed twelve thousand. Of the tribe of Manasses were sealed twelve thousand* (Revelation 7:6); *Of the tribe of Joseph were sealed twelve thousand. Of the tribe of Benjamin were sealed twelve thousand* (Revelation 7:8). Asher, Naphtali, Manasseh, Joseph, Benjamin — the very houses catalogued in this chapter — stand numbered and sealed among the hundred forty and four thousand. The northern tribes were scattered by Assyria, but they were never erased and never replaced. The Chronicler keeps the record because Yahuah keeps the people, to be regathered into one.',
       sv.verse_id, ev.verse_id, 'free', 30150
  FROM _s313_chr07_lookup sv, _s313_chr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=7 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored',
       E'1 Chronicles 7 — Ephraim Mourned: The Firstborn of the North Grieved and Restored',
       E'Tucked into the dry roll of names is a moment of raw grief. The sons of Ephraim go down to Gath and are slain: *whom the men of Gath that were born in that land slew, because they came down to take away their cattle* (1 Chronicles 7:21). And the father weeps: *And Ephraim their father mourned many days, and his brethren came to comfort him* (1 Chronicles 7:22). The next son is named for the wound — Beriah, *because it went evil with his house* (1 Chronicles 7:23).\n\nThis is no ordinary mourner. Ephraim is the head of the northern kingdom, and Yahuah claims him with a father''s love: *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). The prophet hears the whole northern house grieve as this one man grieved: *I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned* (Jeremiah 31:18). And over the house where it went evil, the Father answers with mercy, not erasure: *Is Ephraim my dear son? is he a pleasant child?... I will surely have mercy upon him, saith Yahuah (LORD)* (Jeremiah 31:20).\n\nThe chapter even shows the grief turning to building. After the mourning, *his daughter was Sherah, who built Beth-horon the nether, and the upper, and Uzzen-sherah* (1 Chronicles 7:24) — a daughter raising cities out of the family''s loss. It is a small token of the great word over the northern house: *Again I will build thee, and thou shalt be built, O virgin of Yashar''el (Israel)* (Jeremiah 31:4). The firstborn of the north weeps in the record, and Yahuah promises to remember him still and build him again.',
       sv.verse_id, ev.verse_id, 'free', 30151
  FROM _s313_chr07_lookup sv, _s313_chr07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=7 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. thread_members
-- ============================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*All these are the twelve tribes of Yashar''el (Israel)... every one according to his blessing he blessed them* (Genesis 49:28) — the chapter''s roll IS the twelve Jacob blessed, the whole covenant people, not Judah alone.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and make them one stick* (Ezekiel 37:19) — *the children of Joseph* (7:29) named here are the very stick to be rejoined to Judah.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the one continuous twelve-tribe record IS the witness that the two kingdoms are one people.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a portion for Ephraim* (Ezekiel 48:5) — the restored-land vision keeps an inheritance for each northern house the genealogy keeps by name (Ephraim, Manasseh, 7:14-20).'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=48 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Of the tribe of Aser... Nepthalim... Manasses were sealed twelve thousand* (Revelation 7:6) — Asher (7:30-40), Naphtali (7:13), Manasseh (7:14-19) stand sealed at the end; the scattered are numbered, not lost.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=40
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Of the tribe of Joseph... Benjamin were sealed twelve thousand* (Revelation 7:8) — the house of Joseph (*children of Joseph*, 7:29) and Benjamin (7:6-12) sealed whole in the consummation.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=29
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-the-northern-tribes-remembered-in-the-whole-twelve-tribe-record'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9) — the mourner of 7:22 is the firstborn of the north, the son Yahuah leads home weeping but kept.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have surely heard Ephraim bemoaning himself... turn thou me, and I shall be turned* (Jeremiah 31:18) — the grief of the man (7:22) foreshadows the whole northern house bemoaning itself in exile and crying to be turned back.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will surely have mercy upon him, saith Yahuah (LORD)* (Jeremiah 31:20) — over the house where *it went evil* (7:23) the Father declares mercy, remembering Ephraim still.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Again I will build thee, and thou shalt be built, O virgin of Yashar''el (Israel)* (Jeremiah 31:4) — Sherah building cities out of the loss (7:24) is a token of Yahuah rebuilding the northern house he chastised.'
  FROM cross_reference_threads t
  JOIN _s313_chr07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=7 AND sv.verse_number=24
  JOIN _s313_chr07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-7-ephraim-mourned-the-firstborn-of-the-north-grieved-and-restored'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_8.sql (1 Chronicles 8) -----
-- Chapter: 1 Chronicles 8 — the genealogy of Benjamin and the house of Saul
-- Tag: chr08 ; session prefix s313 ; temp view _s313_chr08_lookup
-- Slug prefix: 1-chronicles-8- ; sort_order band start 30175 (+1 per thread)
-- Source book_slug=1-chronicles, chapter 8
--
-- 1 Chronicles 8 coverage:
--   v.1 (Benjamin begat Bela his firstborn) + v.40 (All these are of the sons of Benjamin):
--        NT:     Romans 11:1 (Paul a Benjamite — Yahuah hath not cast away his people);
--                Philippians 3:5 (Paul of the tribe of Benjamin) — THREADED
--        Extras: none warranted
--        Tanakh: Genesis 49:27 (Benjamin a ravening wolf); 1 Samuel 9:1,2,21 (Saul of the
--                smallest tribe) — THREADED
--   v.33-34 (Ner begat Kish...Saul begat Jonathan...Merib-baal begat Micah):
--        NT:     none warranted (covenant-faithfulness type carried in Tanakh)
--        Extras: none warranted
--        Tanakh: 1 Samuel 18:1,3 (Jonathan's soul knit to David, the covenant);
--                2 Samuel 9:1,7 (David's kindness to Mephibosheth for Jonathan's sake) — THREADED
--   v.2-32, 35-39 (the families of Benjamin, the line of Saul carried down): genealogical roll;
--        no library warranted per-verse (the framework weight is carried in the two threads above)
--
-- Threads:
--   1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle (FREE+NT+Tanakh)
--      Gen 49:27, 1Sam 9:1, 1Sam 9:2, 1Sam 9:21, Phil 3:5, Rom 11:1
--   1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love (FREE, Tanakh)
--      1Sam 18:1, 1Sam 18:3, 2Sam 9:1, 2Sam 9:7
--
-- GUARD: Benjamin = the small tribe preserved, giving the first king (Saul) and the apostle Paul;
-- Romans 11:1 — Paul's Benjamite identity is his own living proof "Yahuah hath not cast away his
-- people" (the anti-replacement guard). The house of Saul / Jonathan's line = the line carried,
-- Jonathan's covenant-love with David showing faithfulness binding the tribes.

CREATE TEMP VIEW _s313_chr08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- Thread 1: the tribe of Benjamin
    ('canon','1-chronicles',8,1,'canon','genesis',49,27,'free',
     E'*Benjamin shall ravin as a wolf: in the morning he shall devour the prey, and at night he shall divide the spoil.* (Genesis 49:27). The chronicler opens *Now Benjamin begat Bela his firstborn* — the roll of the wolf-tribe Yaaqob (Jacob) prophesied. The smallest of Yashar''el''s (Israel''s) twelve sons, yet the one whose seed would seize both the kingdom and the apostle.'),
    ('canon','1-chronicles',8,1,'canon','1-samuel',9,1,'free',
     E'*Now there was a man of Benjamin, whose name was Kish, the son of Abiel...a mighty man of power.* (1 Samuel 9:1). The same Kish reappears here in the Benjamite line — *And Ner begat Kish, and Kish begat Saul* (1 Chronicles 8:33) — binding this genealogy to the rise of Yashar''el''s (Israel''s) first king out of the tribe Benjamin begat.'),
    ('canon','1-chronicles',8,1,'canon','1-samuel',9,2,'free',
     E'*And he had a son, whose name was Saul, a choice young man, and a goodly: and there was not among the children of Yashar''el (Israel) a goodlier person than he.* (1 Samuel 9:2). The chronicler''s bare *Now Benjamin begat* unfolds, generations later, into this — the goodliest man in Yashar''el (Israel) raised from the least tribe to be its first crowned head.'),
    ('canon','1-chronicles',8,1,'canon','1-samuel',9,21,'free',
     E'*And Saul answered and said, Am not I a Benjamite, of the smallest of the tribes of Yashar''el (Israel)? and my family the least of all the families of the tribe of Benjamin?* (1 Samuel 9:21). Saul names the wonder of his own genealogy: the *sons of Benjamin* (1 Chronicles 8:40), least of the tribes, is where Yahuah set the kingdom — the small made first, the chronicler''s point that no branch of Yashar''el (Israel) is too slight to carry the promise.'),
    ('canon','1-chronicles',8,40,'canon','philippians',3,5,'free',
     E'*Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Benjamin, an Hebrew of the Hebrews; as touching the law, a Pharisee.* (Philippians 3:5). The chronicler''s closing line — *All these are of the sons of Benjamin* (1 Chronicles 8:40) — runs forward across the centuries to Sha''ul (Paul), who names the very same tribe as his pedigree. The wolf-tribe that gave the first king also gave the apostle.'),
    ('canon','1-chronicles',8,40,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). Sha''ul (Paul) makes his own Benjamite blood — the line this chapter rolls out to *All these are of the sons of Benjamin* (1 Chronicles 8:40) — the living proof Yahuah hath NOT cast away his people. The tribe preserved in the chronicler''s register stands centuries later in the flesh of the apostle: replacement is impossible while a Benjamite breathes.'),
  -- Thread 2: the house of Saul and Jonathan's covenant love
    ('canon','1-chronicles',8,33,'canon','1-samuel',18,1,'free',
     E'*...the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul.* (1 Samuel 18:1). The chronicler''s *Saul begat Jonathan* (1 Chronicles 8:33) names the prince whose love bound the house of Benjamin to the house of Yahudah (Judah)''s coming king — the heir of Saul''s throne loving the man who would receive it.'),
    ('canon','1-chronicles',8,33,'canon','1-samuel',18,3,'free',
     E'*Then Jonathan and David made a covenant, because he loved him as his own soul.* (1 Samuel 18:3). The bare name *Jonathan* in this Benjamite roll (1 Chronicles 8:33) carries the weight of that covenant — faithfulness sworn across the tribes, the son of the first king binding himself to the second by love, not rivalry.'),
    ('canon','1-chronicles',8,34,'canon','2-samuel',9,1,'free',
     E'*And David said, Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1). The chronicler writes *And the son of Jonathan was Merib-baal* (1 Chronicles 8:34) — Mephibosheth, the very one David sought out. The covenant of 1 Samuel 18 reaches down a generation: the line of Saul is honoured, not erased, for Jonathan''s sake.'),
    ('canon','1-chronicles',8,34,'canon','2-samuel',9,7,'free',
     E'*And David said unto him, Fear not: for I will surely shew thee kindness for Jonathan thy father''s sake...and thou shalt eat bread at my table continually.* (2 Samuel 9:7). *Merib-baal begat Micah* (1 Chronicles 8:34) — the line continued because David kept covenant with Jonathan''s house. Faithfulness binding the tribes carried Saul''s seed forward into this very register.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle',
       E'Benjamin — the least tribe, yet the first king and the apostle',
       E'The chronicler opens *Now Benjamin begat Bela his firstborn* (1 Chronicles 8:1) and closes *All these are of the sons of Benjamin* (1 Chronicles 8:40) — a whole chapter for the smallest tribe of Yashar''el (Israel). Yaaqob (Jacob) had prophesied its nature: *Benjamin shall ravin as a wolf: in the morning he shall devour the prey, and at night he shall divide the spoil* (Genesis 49:27). From this least branch Yahuah raised Yashar''el''s (Israel''s) first king: *Now there was a man of Benjamin, whose name was Kish* (1 Samuel 9:1), whose son was *Saul, a choice young man, and a goodly: and there was not among the children of Yashar''el (Israel) a goodlier person than he* (1 Samuel 9:2). Saul himself marvelled at it — *Am not I a Benjamite, of the smallest of the tribes of Yashar''el (Israel)? and my family the least of all the families of the tribe of Benjamin?* (1 Samuel 9:21). And the same wolf-tribe gave the apostle: *of the tribe of Benjamin, an Hebrew of the Hebrews* (Philippians 3:5). When the question came whether Yahuah had finished with his people, Sha''ul (Paul) answered with his own blood — *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The tribe preserved in this dry register is itself the proof: while a Benjamite breathes, replacement is impossible. The least is never discarded; the promise runs through the small.',
       sv.verse_id, ev.verse_id, 'free', 30175
  FROM _s313_chr08_lookup sv, _s313_chr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=8 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love',
       E'The house of Saul — and Jonathan''s covenant-love',
       E'The Benjamite roll narrows to the royal line: *And Ner begat Kish, and Kish begat Saul, and Saul begat Jonathan, and Malchi-shua, and Abinadab, and Esh-baal. And the son of Jonathan was Merib-baal; and Merib-baal begat Micah* (1 Chronicles 8:33-34). Behind these bare names stands one of the deepest covenants in Scripture. When David came from killing Goliath, *the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul* (1 Samuel 18:1), and *Jonathan and David made a covenant, because he loved him as his own soul* (1 Samuel 18:3) — the heir of Saul''s throne binding himself in love to the man who would receive it, no rivalry, only faithfulness. That covenant outlived Jonathan. *And David said, Is there yet any that is left of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1), and to Merib-baal (Mephibosheth) himself: *Fear not: for I will surely shew thee kindness for Jonathan thy father''s sake...and thou shalt eat bread at my table continually* (2 Samuel 9:7). So *Merib-baal begat Micah* — the line of Saul continued, not erased, because David kept covenant. Faithfulness binding the tribes carried the first king''s seed forward into this very register.',
       sv.verse_id, ev.verse_id, 'free', 30176
  FROM _s313_chr08_lookup sv, _s313_chr08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Benjamin shall ravin as a wolf* (Genesis 49:27) — Yaaqob (Jacob)''s prophecy over the wolf-tribe the chronicler now rolls out.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Now there was a man of Benjamin, whose name was Kish* (1 Samuel 9:1) — the same Kish of 1 Chronicles 8:33, father of Saul.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Saul, a choice young man, and a goodly* (1 Samuel 9:2) — the goodliest in Yashar''el (Israel), raised from the least tribe.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Am not I a Benjamite, of the smallest of the tribes of Yashar''el (Israel)?* (1 Samuel 9:21) — Saul names the wonder: the least made first.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=9 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*of the tribe of Benjamin, an Hebrew of the Hebrews* (Philippians 3:5) — the wolf-tribe gave the apostle as well as the king.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=40
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*For I also am an Israelite...of the tribe of Benjamin* (Romans 11:1) — Sha''ul (Paul)''s own blood proves Yahuah hath not cast away his people.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=40
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-tribe-of-benjamin-the-least-yet-the-first-king-and-the-apostle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the soul of Jonathan was knit with the soul of David* (1 Samuel 18:1) — the prince of Saul''s house loving the coming king.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then Jonathan and David made a covenant* (1 Samuel 18:3) — faithfulness sworn across the two houses.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=33
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Is there yet any...of the house of Saul, that I may shew him kindness for Jonathan''s sake?* (2 Samuel 9:1) — David seeks out Merib-baal (Mephibosheth).'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=34
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will surely shew thee kindness for Jonathan thy father''s sake* (2 Samuel 9:7) — the covenant kept; Saul''s line carried forward to Micah.'
  FROM cross_reference_threads t
  JOIN _s313_chr08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=8 AND sv.verse_number=34
  JOIN _s313_chr08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-8-the-house-of-saul-and-jonathans-covenant-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_9.sql (1 Chronicles 9) -----
-- Book: 1 Chronicles  Chapter: 9   Tag: chr09   Session: s313
-- Source edition: canon   Source book_slug: 1-chronicles   Chapter: 9
-- sort_order band: 30200 + 1 per thread (30200, 30201, 30202)
--
-- THEME: the returned remnant who dwelt in Jerusalem, and the restored temple-servants.
--   The seed-line preserved through exile and brought back to the land; BOTH houses
--   (Yahudah/Benjamin AND Ephraim/Manasseh) present in the restored city; the priests,
--   Levites, porters, and singers restored to the appointed service Yahuah upholds.
--
-- 1 Chronicles 9 coverage:
--   v.1-3  (the returned remnant; two houses in Jerusalem)
--          NT:     Romans 11:1 (Elohim hath not cast away his people)
--          Extras: none warranted (Ezra/Nehemiah/Jeremiah/Ezekiel carry the return)
--          Tanakh: Ezra 1:5; Ezra 2:1; Nehemiah 11:1; Jeremiah 29:10; Ezekiel 37:21
--   v.4-16 (genealogies of the dwellers; Judah, Benjamin, priests, Levites — names)
--          NT:     none warranted (roll-call detail; the theme carried at v.1-3)
--          Extras: none warranted
--          Tanakh: none warranted (folded into the v.1-3 remnant thread)
--   v.17-23 (the porters/gatekeepers keeping the gates of the house of Yahuah)
--          NT:     none warranted (Levitical-charge type; carried by Tanakh witnesses)
--          Extras: none warranted
--          Tanakh: Numbers 18:3; Psalm 84:10; Psalm 134:1; Nehemiah 12:45
--   v.24-25 (porters in four quarters; courses by seven days)
--          NT/Extras/Tanakh: none warranted (folded into the porters thread)
--   v.26-34 (Levites over chambers/vessels/shewbread; the singers day and night)
--          NT:     none warranted (appointed-service type; carried by Tanakh witnesses)
--          Extras: none warranted
--          Tanakh: Numbers 3:32; Nehemiah 12:44; Psalm 134:1
--   v.35-44 (genealogy of Saul / Gibeon — house-of-Saul line)
--          NT/Extras/Tanakh: none warranted (lineage roll; no framework weave)
--
-- THREADS:
--   1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem  [free]
--        (Ezra 1:5, Ezra 2:1, Nehemiah 11:1, Jeremiah 29:10, Ezekiel 37:21, Romans 11:1)
--   1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah    [free]
--        (Numbers 18:3, Psalm 84:10, Psalm 134:1, Nehemiah 12:45)
--   1-chronicles-9-the-levites-over-the-holy-things-the-singers-day-and-night  [free]
--        (Numbers 3:32, Nehemiah 12:44, Psalm 134:1)
--
-- All targets canon (Tanakh + NT) → every thread tier_required 'free'.

CREATE TEMP VIEW _s313_chr09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== CROSS_REFERENCES =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the returned remnant / both houses in Jerusalem (9:1-3)
    ('canon','1-chronicles',9,1,'canon','jeremiah',29,10,'free',
     E'*For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* (Jeremiah 29:10) The Chronicler''s roll opens with the judgment — *Yahudah (Judah) was carried away to Babylon for their transgression* (1 Chronicles 9:1) — yet the verse stands as the hinge of a return already promised. The captivity is not the end of the seed-line; the seventy years are the appointed measure, and Yahuah''s *good word* is to bring the people back to the land.'),
    ('canon','1-chronicles',9,1,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) That *Yashar''el (Israel) were reckoned by genealogies* even after the carrying-away to Babylon (1 Chronicles 9:1) is the standing proof Paul reaches for: the bloodline is kept, the books are written, the people are not cast away. Exile is chastening within the covenant, never the cutting-off of the seed.'),
    ('canon','1-chronicles',9,2,'canon','ezra',2,1,'free',
     E'*Now these are the children of the province that went up out of the captivity, of those which had been carried away, whom Nebuchadnezzar the king of Babylon had carried away unto Babylon, and came again unto Jerusalem and Yahudah (Judah), every one unto his city.* (Ezra 2:1) The Chronicler''s *first inhabitants that dwelt in their possessions in their cities* (1 Chronicles 9:2) are the very returned remnant Ezra numbers — each man restored to his own city, the dispersion reversed by name.'),
    ('canon','1-chronicles',9,2,'canon','ezra',1,5,'free',
     E'*Then rose up the chief of the fathers of Yahudah (Judah) and Benjamin, and the priests, and the Levites, with all them whose spirit Elohim (God) had raised, to go up to build the house of Yahuah (LORD) which is in Jerusalem.* (Ezra 1:5) The four ranks the Chronicler lists as the first to dwell again — *the Israelites, the priests, Levites, and the Nethinims* (1 Chronicles 9:2) — are the same companies whose spirit Elohim raised to go up and rebuild the house. The return is ordered around the restored worship.'),
    ('canon','1-chronicles',9,3,'canon','nehemiah',11,1,'free',
     E'*And the rulers of the people dwelt at Jerusalem: the rest of the people also cast lots, to bring one of ten to dwell in Jerusalem the holy city, and nine parts to dwell in other cities.* (Nehemiah 11:1) *In Jerusalem dwelt of the children of Yahudah (Judah), and of the children of Benjamin, and of the children of Ephraim, and Manasseh* (1 Chronicles 9:3) — the holy city repopulated, the same resettling Nehemiah orders by lot. The Chronicler''s roll and Nehemiah''s lot describe one restoration.'),
    ('canon','1-chronicles',9,3,'canon','ezekiel',37,21,'free',
     E'*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* (Ezekiel 37:21) Note who dwells in restored Jerusalem: not Yahudah and Benjamin only, but *Ephraim, and Manasseh* (1 Chronicles 9:3) — the northern house, the scattered stick of Yosef, present in the city. This is the two-house gathering Ezekiel foretold: the stick of Yosef and the stick of Yahudah made one, brought back into their own land. Both houses, never replaced, gathered.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 2: the porters kept the gates of the house of Yahuah (9:17-23)
    ('canon','1-chronicles',9,19,'canon','numbers',18,3,'free',
     E'*And they shall keep thy charge, and the charge of all the tabernacle: only they shall not come nigh the vessels of the sanctuary and the altar, that neither they, nor ye also, die.* (Numbers 18:3) The Korahite porters who were *keepers of the gates of the tabernacle... keepers of the entry* (1 Chronicles 9:19) stand in the very charge Yahuah gave the Levites at Sinai — to keep the wards of the house. The restored gatekeeping is the old Torah commission resumed, not a new invention.'),
    ('canon','1-chronicles',9,23,'canon','psalms',84,10,'free',
     E'*For a day in thy courts is better than a thousand. I had rather be a doorkeeper in the house of my Elohim (God), than to dwell in the tents of wickedness.* (Psalm 84:10) They *had the oversight of the gates of the house of Yahuah (LORD)* (1 Chronicles 9:23); the psalmist counts that very office — the doorkeeper at the threshold of Yahuah''s house — as the choicest place on earth. The porters'' charge is not menial but coveted nearness to the Presence.'),
    ('canon','1-chronicles',9,23,'canon','psalms',134,1,'free',
     E'*Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD).* (Psalm 134:1) The porters with *the oversight of the gates of the house of Yahuah (LORD)* (1 Chronicles 9:23) are the servants who stand by night in that house — the watch the psalm of ascents blesses. Their keeping of the gates is itself a ministry of praise.'),
    ('canon','1-chronicles',9,23,'canon','nehemiah',12,45,'free',
     E'*And both the singers and the porters kept the ward of their Elohim (God), and the ward of the purification, according to the commandment of David, and of Solomon his son.* (Nehemiah 12:45) The Chronicler''s porters who *had the oversight of the gates of the house of Yahuah (LORD)* (1 Chronicles 9:23) are the same ward Nehemiah records kept after the return — *according to the commandment of David* — the appointed service unbroken from David through the captivity and out the other side.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 3: Levites over the holy things; the singers day and night (9:26-34)
    ('canon','1-chronicles',9,28,'canon','numbers',3,32,'free',
     E'*And Eleazar the son of Aaron the priest shall be chief over the chief of the Levites, and have the oversight of them that keep the charge of the sanctuary.* (Numbers 3:32) Those who *had the charge of the ministering vessels, that they should bring them in and out by tale* (1 Chronicles 9:28) are doing the very work Numbers set under the chief of the Levites — the oversight of the charge of the sanctuary. The restored service keeps the Torah''s pattern down to the counting of the vessels.'),
    ('canon','1-chronicles',9,32,'canon','nehemiah',12,44,'free',
     E'*And at that time were some appointed over the chambers for the treasures, for the offerings, for the firstfruits, and for the tithes, to gather into them out of the fields of the cities the portions of the law for the priests and Levites: for Yahudah (Judah) rejoiced for the priests and for the Levites that waited.* (Nehemiah 12:44) The Kohathites *over the shewbread, to prepare it every sabbath* (1 Chronicles 9:32) belong to the same restored order Nehemiah records — appointed over the chambers, gathering *the portions of the law*, the appointed worship resumed and rejoiced over, never set aside.'),
    ('canon','1-chronicles',9,33,'canon','psalms',134,1,'free',
     E'*Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD).* (Psalm 134:1) The singers *employed in that work day and night* (1 Chronicles 9:33) are the servants the psalm calls to bless Yahuah by night in His house — the unceasing praise of the restored sanctuary, the worship the whole framework upholds.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== THREADS =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem',
       E'The Returned Remnant — Both Houses Dwelt in Jerusalem',
       E'The Chronicler opens his roll of the dwellers in Jerusalem at the lowest point and the turn: *So all Yashar''el (Israel) were reckoned by genealogies... and Yahudah (Judah) was carried away to Babylon for their transgression* (1 Chronicles 9:1). The captivity is named — yet the very next breath is restoration: *Now the first inhabitants that dwelt in their possessions in their cities were, the Israelites, the priests, Levites, and the Nethinims* (1 Chronicles 9:2). The seed-line was kept through the fire; the books were written; the people came home.\n\nThis is the return Jeremiah measured out: *That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10). It is the going-up Ezra numbers — *the children of the province that went up out of the captivity... came again unto Jerusalem and Yahudah (Judah), every one unto his city* (Ezra 2:1) — led by *the chief of the fathers of Yahudah (Judah) and Benjamin, and the priests, and the Levites, with all them whose spirit Elohim (God) had raised, to go up to build the house of Yahuah (LORD) which is in Jerusalem* (Ezra 1:5). It is the holy city repopulated by lot in Nehemiah''s day (Nehemiah 11:1).\n\nNow mark who dwelt there: *And in Jerusalem dwelt of the children of Yahudah (Judah), and of the children of Benjamin, and of the children of Ephraim, and Manasseh* (1 Chronicles 9:3). Not the southern house only — Ephraim and Manasseh, sons of Yosef, the scattered northern stick, are in the restored city. This is the two-house gathering Ezekiel saw: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21) — the stick of Yosef and the stick of Yahudah made one. And it is the standing answer to the lie that the people were ever cast off: *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Exile chastens; it never cancels the seed.',
       sv.verse_id, ev.verse_id, 'free', 30200
  FROM _s313_chr09_lookup sv, _s313_chr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah',
       E'The Porters Kept the Gates of the House of Yahuah',
       E'The restored worship begins at the threshold. The porters *waited in the king''s gate eastward... porters in the companies of the children of Levi* (1 Chronicles 9:18), the Korahites *over the work of the service, keepers of the gates of the tabernacle... keepers of the entry* (1 Chronicles 9:19), ordained in their office by *David and Samuel the seer* (1 Chronicles 9:22), so that *they and their children had the oversight of the gates of the house of Yahuah (LORD)* (1 Chronicles 9:23).\n\nThis gatekeeping is no new arrangement; it is the Levitical charge of the Torah resumed. Yahuah gave it at Sinai: *And they shall keep thy charge, and the charge of all the tabernacle: only they shall not come nigh the vessels of the sanctuary and the altar, that neither they, nor ye also, die* (Numbers 18:3). The same wards endure through the captivity and out again, *according to the commandment of David, and of Solomon his son* — for after the return *both the singers and the porters kept the ward of their Elohim (God), and the ward of the purification* (Nehemiah 12:45).\n\nAnd this office, far from menial, is the coveted place. *For a day in thy courts is better than a thousand. I had rather be a doorkeeper in the house of my Elohim (God), than to dwell in the tents of wickedness* (Psalm 84:10). To stand at the gate is to stand near the Presence — to be among the *servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). The keeping of the gates is itself a ministry of praise, the faithful guarding of the worship Yahuah ordained.',
       sv.verse_id, ev.verse_id, 'free', 30201
  FROM _s313_chr09_lookup sv, _s313_chr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=9 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-9-the-levites-over-the-holy-things-the-singers-day-and-night',
       E'The Levites Over the Holy Things — the Singers Day and Night',
       E'Beyond the gates, the restored Levites carry the whole inward service of the house. *Certain of them had the charge of the ministering vessels, that they should bring them in and out by tale* (1 Chronicles 9:28); others were *appointed to oversee the vessels, and all the instruments of the sanctuary, and the fine flour, and the wine, and the oil, and the frankincense, and the spices* (1 Chronicles 9:29); the Kohathites were *over the shewbread, to prepare it every sabbath* (1 Chronicles 9:32). Every appointment keeps the Torah''s own pattern, set under the chief of the Levites who *have the oversight of them that keep the charge of the sanctuary* (Numbers 3:32) — even to the counting of the vessels in and out.\n\nThis is the same order Nehemiah records resumed after the return, when *some appointed over the chambers for the treasures, for the offerings, for the firstfruits, and for the tithes, to gather into them... the portions of the law for the priests and Levites: for Yahudah (Judah) rejoiced for the priests and for the Levites that waited* (Nehemiah 12:44). The appointed worship is taken up again with joy — never set aside, never abolished.\n\nAnd over it all rises the unceasing song: *these are the singers, chief of the fathers of the Levites, who remaining in the chambers were free: for they were employed in that work day and night* (1 Chronicles 9:33). These are the watch the psalm of ascents calls: *Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). The restored remnant''s deepest mark is praise that never ceases — the worship the whole framework exists to uphold.',
       sv.verse_id, ev.verse_id, 'free', 30202
  FROM _s313_chr09_lookup sv, _s313_chr09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=9 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ===================== THREAD MEMBERS =====================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*That after seventy years be accomplished at Babylon I will visit you... in causing you to return to this place* (Jeremiah 29:10) — the appointed measure of the captivity and the promised return behind the Chronicler''s roll.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the kept genealogies after Babylon are the proof the seed was never cut off.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=1
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Now these are the children of the province that went up out of the captivity... came again unto Jerusalem* (Ezra 2:1) — the returned remnant who are the Chronicler''s *first inhabitants*, each restored to his own city.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then rose up the chief of the fathers of Yahudah (Judah) and Benjamin, and the priests, and the Levites... to go up to build the house of Yahuah (LORD)* (Ezra 1:5) — the same four ranks the Chronicler names as first to dwell again, the return ordered around the house.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=2
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And the rulers of the people dwelt at Jerusalem... to bring one of ten to dwell in Jerusalem the holy city* (Nehemiah 11:1) — the repopulating of the holy city, the same restoration the Chronicler''s dwellers describe.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21) — Ephraim and Manasseh in restored Jerusalem are the two-house gathering, the stick of Yosef and the stick of Yahudah made one.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-returned-remnant-both-houses-dwelt-in-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And they shall keep thy charge, and the charge of all the tabernacle* (Numbers 18:3) — the Torah''s own Levitical commission, resumed by the restored gatekeepers.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=19
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I had rather be a doorkeeper in the house of my Elohim (God)* (Psalm 84:10) — the porters'' oversight of the gates is the coveted nearness to the Presence the psalmist longs for.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1) — the gate-keeping watch is itself a ministry of blessing in His house.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=134 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*both the singers and the porters kept the ward of their Elohim (God)... according to the commandment of David* (Nehemiah 12:45) — the same ward unbroken from David through the captivity and out again.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=23
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=12 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-porters-kept-the-gates-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the oversight of them that keep the charge of the sanctuary* (Numbers 3:32) — the Torah''s pattern for the Levites over the sanctuary, kept down to the counting of the vessels.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=28
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-levites-over-the-holy-things-the-singers-day-and-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*some appointed over the chambers... for the firstfruits, and for the tithes... the portions of the law* (Nehemiah 12:44) — the restored, rejoiced-over service the shewbread-keepers belong to, never set aside.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=32
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=12 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-levites-over-the-holy-things-the-singers-day-and-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1) — the singers employed day and night are this unceasing watch of praise.'
  FROM cross_reference_threads t
  JOIN _s313_chr09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s313_chr09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=134 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-9-the-levites-over-the-holy-things-the-singers-day-and-night'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_10.sql (1 Chronicles 10) -----
-- Book: 1 Chronicles, chapter 10 — the death of Saul and the turning of the kingdom to David
-- Tag: chr10 | session prefix: s313 | temp view: _s313_chr10_lookup
-- Slug prefix: 1-chronicles-10- | sort_order band start: 30225 (+1 per thread)
-- Source: canon '1-chronicles' chapter 10. All quotes verbatim from dump_canon.py.
--
-- 1 Chronicles 10 coverage:
--   v.1-6 (Gilboa, the fall of the house of Saul):
--        NT:     none warranted (the verdict, not the battle, carries the type)
--        Extras: none warranted
--        Tanakh: 1 Samuel 31:4,6 (parallel death account); 1 Samuel 28:19 (foretold) -> THREAD 1
--   v.7-12 (Israel flees, Philistines fasten head in Dagon's temple, Jabesh buries):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (narrative bridge; carried into the verdict threads)
--   v.13a (died for transgression / kept NOT the word of Yahuah):
--        NT:     none warranted (Tanakh covenant-lawsuit carries it)
--        Extras: none warranted
--        Tanakh: 1 Samuel 13:13-14; 1 Samuel 15:22-23,26 ("to obey is better than sacrifice") -> THREAD 2
--   v.13b (asking counsel of a familiar spirit, enquired NOT of Yahuah):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Samuel 28:7; Leviticus 19:31; Leviticus 20:6; Deuteronomy 18:10-12 -> THREAD 3
--   v.14 (turned the kingdom unto David the son of Jesse):
--        NT:     Acts 13:22 (David son of Jesse, a man after mine own heart) -> THREAD 4
--        Extras: none warranted
--        Tanakh: 1 Samuel 15:28; 1 Samuel 16:1,13; 2 Samuel 5:3 -> THREAD 4
--
-- THREADS:
--   1 1-chronicles-10-the-fall-of-the-house-of-saul-on-gilboa  [Tanakh] free
--   2 1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah  [Tanakh] free
--   3 1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah  [Tanakh] free
--   4 1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse  [Tanakh + NT] free
--
-- Framework framing: 10:13-14 is the Chronicler's verdict. Saul fell for keeping NOT the
-- word of Yahuah (Torah affirmed as the standard he broke, NOT a defunct law) and for seeking
-- a forbidden familiar spirit (necromancy outlawed Lev 19:31 / Deut 18:10-12) instead of
-- enquiring of Yahuah. The kingdom turned to David, the man after Yahuah's own heart -- a
-- sovereign turning, not chance. "To obey is better than sacrifice" (1 Sam 15:22).

CREATE TEMP VIEW _s313_chr10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the fall of the house of Saul on Gilboa
    ('canon','1-chronicles',10,4,'canon','1-samuel',31,4,'free',
     E'The same hand stayed the chronicler''s pen: *Then said Saul unto his armourbearer, Draw thy sword, and thrust me through therewith; lest these uncircumcised come and thrust me through, and abuse me. But his armourbearer would not; for he was sore afraid. Therefore Saul took a sword, and fell upon it* (1 Samuel 31:4). The Chronicler retells it word for word here -- *Then said Saul to his armourbearer, Draw thy sword... So Saul took a sword, and fell upon it* (1 Chronicles 10:4) -- to set the stage for his verdict: this is how the first house ended.'),
    ('canon','1-chronicles',10,6,'canon','1-samuel',31,6,'free',
     E'*So Saul died, and his three sons, and his armourbearer, and all his men, that same day together* (1 Samuel 31:6). The Chronicler echoes the totality -- *So Saul died, and his three sons, and all his house died together* (1 Chronicles 10:6). One day closes the whole house of Saul; the next line will open the house of David.'),
    ('canon','1-chronicles',10,6,'canon','1-samuel',28,19,'free',
     E'The night before, Samuel had spoken the word from beyond: *and to morrow shalt thou and thy sons be with me: Yahuah (LORD) also shall deliver the host of Yashar''el (Israel) into the hand of the Philistines* (1 Samuel 28:19). What fell on Gilboa -- *So Saul died, and his three sons, and all his house died together* (1 Chronicles 10:6) -- was the word of Yahuah running to its appointed end, not the fortune of war.'),

    -- THREAD 2: Saul died for he kept NOT the word of Yahuah
    ('canon','1-chronicles',10,13,'canon','1-samuel',13,13,'free',
     E'Samuel had named the breach at Gilgal: *Thou hast done foolishly: thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God), which he commanded thee: for now would Yahuah (LORD) have established thy kingdom upon Yashar''el (Israel) for ever* (1 Samuel 13:13). The Chronicler''s verdict is the same charge sealed -- *So Saul died for his transgression which he committed against Yahuah (LORD), even against the word of Yahuah (LORD), which he kept not* (1 Chronicles 10:13). The commandment was the standard; keeping it NOT was the death.'),
    ('canon','1-chronicles',10,13,'canon','1-samuel',13,14,'free',
     E'In the same breath the kingdom was already being handed on: *thy kingdom shall not continue: Yahuah (LORD) hath sought him a man after his own heart, and Yahuah (LORD) hath commanded him to be captain over his people, because thou hast not kept that which Yahuah (LORD) commanded thee* (1 Samuel 13:14). The Chronicler''s *which he kept not* (1 Chronicles 10:13) is the hinge: covenant-keeping, not lineage, holds a throne.'),
    ('canon','1-chronicles',10,13,'canon','1-samuel',15,22,'free',
     E'This is the whole weight of the verdict: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Saul *kept not* the word (1 Chronicles 10:13) -- and no offering could stand in for obedience. The Torah is not the curse here; disobedience to it is.'),
    ('canon','1-chronicles',10,13,'canon','1-samuel',15,23,'free',
     E'The next verse joins his two sins into one root: *For rebellion is as the sin of witchcraft, and stubbornness is as iniquity and idolatry. Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). The Chronicler lists both -- *the word of Yahuah (LORD), which he kept not, and also for asking counsel of one that had a familiar spirit* (1 Chronicles 10:13) -- but Samuel had already shown rebellion and witchcraft are the same defiance of the word.'),

    -- THREAD 3: he sought a familiar spirit, enquired NOT of Yahuah
    ('canon','1-chronicles',10,13,'canon','1-samuel',28,7,'free',
     E'The deed itself stands in the older book: *Then said Saul unto his servants, Seek me a woman that hath a familiar spirit, that I may go to her, and enquire of her. And his servants said to him, Behold, there is a woman that hath a familiar spirit at Endor* (1 Samuel 28:7). The Chronicler names it as the second cause of death -- *also for asking counsel of one that had a familiar spirit, to enquire of it* (1 Chronicles 10:13).'),
    ('canon','1-chronicles',10,13,'canon','leviticus',19,31,'free',
     E'The Torah had already forbidden the thing he sought: *Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:31). Saul *asking counsel of one that had a familiar spirit* (1 Chronicles 10:13) was not merely fear -- it was defilement against a plain command, the very *word of Yahuah, which he kept not.*'),
    ('canon','1-chronicles',10,13,'canon','leviticus',20,6,'free',
     E'The sentence was written into the statute: *And the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul, and will cut him off from among his people* (Leviticus 20:6). Saul did exactly this -- *asking counsel of one that had a familiar spirit, to enquire of it* (1 Chronicles 10:13) -- and was cut off, the verdict matching the Torah word for word.'),
    ('canon','1-chronicles',10,14,'canon','deuteronomy',18,11,'free',
     E'Moses had named the consulter of the dead among the abominations of the nations: *Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11) -- *For all that do these things are an abomination unto Yahuah (LORD)* (Deuteronomy 18:12). The Chronicler''s indictment is its mirror: Saul *enquired not of Yahuah (LORD)* (1 Chronicles 10:14) but sought the dead through a medium, doing the very abomination the Torah drove the nations out for.'),

    -- THREAD 4: and turned the kingdom unto David the son of Jesse
    ('canon','1-chronicles',10,14,'canon','1-samuel',15,28,'free',
     E'Samuel had spoken the transfer the day Saul rejected the word: *Yahuah (LORD) hath rent the kingdom of Yashar''el (Israel) from thee this day, and hath given it to a neighbour of thine, that is better than thou* (1 Samuel 15:28). The Chronicler closes the account with the completed deed -- *therefore he slew him, and turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14). Yahuah Himself turned it.'),
    ('canon','1-chronicles',10,14,'canon','1-samuel',16,1,'free',
     E'The neighbour was already chosen and named: *Yahuah (LORD) said unto Samuel, How long wilt thou mourn for Saul, seeing I have rejected him from reigning over Yashar''el (Israel)? fill thine horn with oil, and go, I will send thee to Jesse the Beth-lehemite: for I have provided me a king among his sons* (1 Samuel 16:1). What was *provided* there is *turned* here -- *turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14).'),
    ('canon','1-chronicles',10,14,'canon','1-samuel',16,13,'free',
     E'The anointing stood long before Gilboa: *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The Spirit had already marked David; the Chronicler simply records the throne catching up to the oil -- *and turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14).'),
    ('canon','1-chronicles',10,14,'canon','2-samuel',5,3,'free',
     E'The turning was made public when all the tribes came to Hebron: *So all the elders of Yashar''el (Israel) came to the king to Hebron; and king David made a league with them in Hebron before Yahuah (LORD): and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). The kingdom *turned unto David the son of Jesse* (1 Chronicles 10:14) is gathered Yashar''el bowing to the man Yahuah had already chosen.'),
    ('canon','1-chronicles',10,14,'canon','acts',13,22,'free',
     E'The apostles read this turning as Yahuah''s own testimony to David: *And when he had removed him, he raised up unto them David to be their king; to whom also he gave testimony, and said, I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). The Chronicler''s *turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14) is exactly this -- the rejected disobedient king removed, the man after Yahuah''s heart raised up, the Davidic line from which the Formed Son would come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-10-the-fall-of-the-house-of-saul-on-gilboa',
       E'The fall of the house of Saul on Gilboa',
       E'The Chronicler opens with the end of the first house. *And the battle went sore against Saul, and the archers hit him, and he was wounded of the archers. Then said Saul to his armourbearer, Draw thy sword... So Saul took a sword, and fell upon it* (1 Chronicles 10:3-4); *So Saul died, and his three sons, and all his house died together* (1 Chronicles 10:6). He retells it almost verbatim from the older account -- *Therefore Saul took a sword, and fell upon it* (1 Samuel 31:4); *So Saul died, and his three sons, and his armourbearer, and all his men, that same day together* (1 Samuel 31:6). And it is no accident of war: the night before, Samuel had spoken the sentence from beyond -- *to morrow shalt thou and thy sons be with me: Yahuah (LORD) also shall deliver the host of Yashar''el (Israel) into the hand of the Philistines* (1 Samuel 28:19). One day closes the whole house of Saul. The verdict that follows will tell us why -- and the next line will open the house of David.',
       sv.verse_id, ev.verse_id, 'free', 30225
  FROM _s313_chr10_lookup sv, _s313_chr10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah',
       E'Saul died — for he kept not the word of Yahuah',
       E'Here is the Chronicler''s theological summary, the reason the house fell: *So Saul died for his transgression which he committed against Yahuah (LORD), even against the word of Yahuah (LORD), which he kept not* (1 Chronicles 10:13). Samuel had named the breach long before, at Gilgal -- *thou hast not kept the commandment of Yahuah Elohayka (the LORD thy God), which he commanded thee* (1 Samuel 13:13) -- and joined it to the loss of the throne -- *thy kingdom shall not continue... because thou hast not kept that which Yahuah (LORD) commanded thee* (1 Samuel 13:14). The whole weight rests on one word from the Amalek failure: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); *For rebellion is as the sin of witchcraft... Because thou hast rejected the word of Yahuah (LORD), he hath also rejected thee from being king* (1 Samuel 15:23). The standard Saul broke is the Torah, the living covenant word -- not a defunct law, but the very command by which a throne stands or falls. The curse is covenant-breaking; the word itself is the inheritance. *To obey is better than sacrifice.*',
       sv.verse_id, ev.verse_id, 'free', 30226
  FROM _s313_chr10_lookup sv, _s313_chr10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah',
       E'He sought a familiar spirit, and enquired not of Yahuah',
       E'The second cause of death is named plainly: Saul died *also for asking counsel of one that had a familiar spirit, to enquire of it; And enquired not of Yahuah (LORD)* (1 Chronicles 10:13-14). The deed stands in the older book -- *Seek me a woman that hath a familiar spirit, that I may go to her, and enquire of her... there is a woman that hath a familiar spirit at Endor* (1 Samuel 28:7). But the Torah had already outlawed the thing, and the Chronicler measures Saul against it. *Regard not them that have familiar spirits, neither seek after wizards, to be defiled by them: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:31). The sentence was written into the statute itself: *the soul that turneth after such as have familiar spirits... I will even set my face against that soul, and will cut him off from among his people* (Leviticus 20:6). And Moses had set the necromancer among the abominations of the nations -- *a consulter with familiar spirits, or a wizard, or a necromancer... all that do these things are an abomination unto Yahuah (LORD)* (Deuteronomy 18:11-12). The contrast is total: Saul *enquired not of Yahuah* but sought the dead through a medium, doing the very abomination the Torah drove the nations out for. Disobedience and forbidden divination on one hand; the obedient seeking of Yahuah on the other.',
       sv.verse_id, ev.verse_id, 'free', 30227
  FROM _s313_chr10_lookup sv, _s313_chr10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse',
       E'And turned the kingdom unto David the son of Jesse',
       E'The chapter ends not in death but in transfer: *therefore he slew him, and turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14). This is Yahuah''s own sovereign turning, long foretold. On the day Saul rejected the word, Samuel had said: *Yahuah (LORD) hath rent the kingdom of Yashar''el (Israel) from thee this day, and hath given it to a neighbour of thine, that is better than thou* (1 Samuel 15:28). The neighbour was already chosen and named -- *go, I will send thee to Jesse the Beth-lehemite: for I have provided me a king among his sons* (1 Samuel 16:1) -- and already anointed: *Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The throne only caught up to the oil when all the tribes came to Hebron: *they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). The apostles read this same turning as Yahuah''s testimony to David: *I have found David the son of Jesse, a man after mine own heart, which shall fulfil all my will* (Acts 13:22). The disobedient king who sought the dead is removed; the man after Yahuah''s own heart is raised up -- the Davidic line out of which the Formed Son, the Messiah, would come.',
       sv.verse_id, ev.verse_id, 'free', 30228
  FROM _s313_chr10_lookup sv, _s313_chr10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 31:4 — *Therefore Saul took a sword, and fell upon it*: the older account the Chronicler retells verbatim.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=4
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-the-fall-of-the-house-of-saul-on-gilboa'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 31:6 — *So Saul died, and his three sons... that same day together*: the totality of the fall.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-the-fall-of-the-house-of-saul-on-gilboa'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 28:19 — *to morrow shalt thou and thy sons be with me*: Gilboa was the foretold word running to its end.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=6
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=28 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-the-fall-of-the-house-of-saul-on-gilboa'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 13:13 — *thou hast not kept the commandment of Yahuah Elohayka*: the breach Samuel first named at Gilgal.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=13 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 13:14 — *because thou hast not kept that which Yahuah commanded thee*: covenant-keeping, not lineage, holds the throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 15:22 — *to obey is better than sacrifice*: no offering stands in for keeping the word.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 15:23 — *rebellion is as the sin of witchcraft... thou hast rejected the word of Yahuah*: his two sins share one root.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-saul-died-for-he-kept-not-the-word-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 28:7 — *Seek me a woman that hath a familiar spirit*: the deed itself, at Endor.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=28 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 19:31 — *Regard not them that have familiar spirits... to be defiled by them*: the Torah outlawed exactly what he sought.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 20:6 — *I will even set my face against that soul, and will cut him off*: the statute''s own sentence, matching the verdict.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 18:11 — *a consulter with familiar spirits... or a necromancer*: the abomination of the nations Saul enquired not of Yahuah to do.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-he-sought-a-familiar-spirit-and-enquired-not-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 15:28 — *Yahuah hath rent the kingdom... and hath given it to a neighbour of thine*: the transfer first spoken.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 16:1 — *I have provided me a king among his sons*: the neighbour chosen and named.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 16:13 — *the Spirit of Yahuah came upon David from that day forward*: the throne only caught up to the oil.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Samuel 5:3 — *they anointed David king over Yashar''el*: the turning made public at Hebron.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Acts 13:22 — *David the son of Jesse, a man after mine own heart*: the apostolic testimony to this very turning, the Davidic line of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s313_chr10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=10 AND sv.verse_number=14
  JOIN _s313_chr10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-10-and-turned-the-kingdom-unto-david-the-son-of-jesse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_11.sql (1 Chronicles 11) -----
-- Book: 1 Chronicles, chapter 11 (slug 1-chronicles). Tag chr11. Session s313.
-- Sort band: 30250+ (one per thread).
-- Temp view: _s313_chr11_lookup
--
-- 1 Chronicles 11 coverage:
--   v.1-3 (all Israel makes David shepherd-king, anointed by word of Yahuah by Samuel):
--        NT:     Matthew 2:6 (a Governor that shall rule my people Yashar'el), John 10:11 (the good shepherd) -- WARRANTED
--        Extras: none warranted
--        Tanakh: 2 Samuel 5:1-3 (parallel anointing at Hebron), 1 Samuel 16:1/16:13 (anointed by Samuel),
--                Psalm 78:70-72 (chose David to feed Jacob his people), Micah 5:2/5:4 (the ruler who shall feed) -- WARRANTED
--   v.4-9 (David takes the castle/stronghold of Zion, the city of David; Yahuah Tseva''ot with him):
--        NT:     Hebrews 12:22 (ye are come unto mount Sion), Revelation 14:1 (a Lamb stood on mount Sion) -- WARRANTED
--        Extras: none warranted
--        Tanakh: 2 Samuel 5:6-7/5:10 (parallel taking of Zion), Psalm 2:6 (my king upon my holy hill of Zion),
--                Psalm 132:13 (Yahuah hath chosen Zion), Isaiah 28:16 (a corner stone in Zion) -- WARRANTED
--   v.10 (the chief of the mighty men strengthened themselves to make him king per word of Yahuah):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Samuel 23:8 (parallel roll of the mighty men) -- WARRANTED (folded with v.11)
--   v.11-19 (the three mighties; water from Beth-lehem''s well poured out to Yahuah):
--        NT:     none warranted (lateral/historical)
--        Extras: none warranted
--        Tanakh: 2 Samuel 23:9 (Eleazar), 2 Samuel 23:13-16 (the three / well of Beth-lehem) -- WARRANTED
--   v.20-47 (Abishai, Benaiah, and the roll of the valiant men): lateral to 2 Samuel 23:18-39; roll covered by the v.10/v.13-16 threads, no separate add warranted.
--
-- THREADS (4):
--   1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people    [free]  -> Tanakh + NT
--   1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david           [free]  -> Tanakh + NT
--   1-chronicles-11-the-mighty-men-gathered-to-make-him-king                  [free]  -> Tanakh
--   1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah [free] -> Tanakh
-- GUARDS applied: David anointed shepherd-king over all Yashar''el (11:2-3) = a type of the Messiah the
--   Shepherd-King over the gathered people (Micah 5:2-4, John 10:11 -- the Formed Son who has a Father,
--   the Davidic king). Zion the city of David (11:5) = seat of the kingdom pointing to the Messianic reign
--   on Zion (Ps 2:6, Heb 12:22, Rev 14:1). The mighty men''s devotion = loyalty to the anointed king.

CREATE TEMP VIEW _s313_chr11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: all Israel anoints David the shepherd-king
    ('canon','1-chronicles',11,1,'canon','2-samuel',5,1,'free',
     E'*Then came all the tribes of Yashar''el (Israel) to David unto Hebron, and spake, saying, Behold, we are thy bone and thy flesh* (2 Samuel 5:1). The Chronicler''s *all Yashar''el (Israel) gathered themselves to David unto Hebron... Behold, we are thy bone and thy flesh* (1 Chronicles 11:1) is the same gathering of the whole people to the one king -- the two-house body owning the anointed as their own flesh.'),
    ('canon','1-chronicles',11,2,'canon','2-samuel',5,2,'free',
     E'*Thou wast he that leddest out and broughtest in Yashar''el (Israel): and Yahuah (LORD) said to thee, Thou shalt feed my people Yashar''el (Israel), and thou shalt be a captain over Yashar''el (Israel)* (2 Samuel 5:2). The Chronicler''s *Thou shalt feed my people Yashar''el (Israel), and thou shalt be ruler over my people Yashar''el (Israel)* (1 Chronicles 11:2) makes the king a SHEPHERD -- to *feed* the flock that is Yahuah''s own people.'),
    ('canon','1-chronicles',11,3,'canon','2-samuel',5,3,'free',
     E'*So all the elders of Yashar''el (Israel) came to the king to Hebron; and king David made a league with them in Hebron before Yahuah (LORD): and they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3). The parallel of *they anointed David king over Yashar''el (Israel), according to the word of Yahuah (LORD) by Samuel* (1 Chronicles 11:3) -- the kingship rests not on the elders'' choice but on Yahuah''s prior word.'),
    ('canon','1-chronicles',11,3,'canon','1-samuel',16,1,'free',
     E'*I will send thee to Jesse the Beth-lehemite: for I have provided me a king among his sons* (1 Samuel 16:1). The *word of Yahuah (LORD) by Samuel* that 1 Chronicles 11:3 names is this prior choosing -- the king was provided by Yahuah at Beth-lehem long before all Yashar''el gathered to crown him.'),
    ('canon','1-chronicles',11,3,'canon','1-samuel',16,13,'free',
     E'*Then Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). This is *the word of Yahuah (LORD) by Samuel* fulfilled -- the anointing that 1 Chronicles 11:3 says all Yashar''el now ratifies came first by the Spirit through the prophet.'),
    ('canon','1-chronicles',11,2,'canon','psalms',78,70,'free',
     E'*He chose David also his servant, and took him from the sheepfolds* (Psalm 78:70). The Psalm sings the very choosing 1 Chronicles 11:2 records -- Yahuah took a literal shepherd from the *sheepfolds* to be the shepherd of the people.'),
    ('canon','1-chronicles',11,2,'canon','psalms',78,71,'free',
     E'*From following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71). *To feed Jacob his people* is the same charge as *Thou shalt feed my people Yashar''el (Israel)* (1 Chronicles 11:2) -- the shepherd-king set over Yahuah''s inheritance.'),
    ('canon','1-chronicles',11,2,'canon','psalms',78,72,'free',
     E'*So he fed them according to the integrity of his heart; and guided them by the skilfulness of his hands* (Psalm 78:72). David made good the charge to *feed my people* (1 Chronicles 11:2) -- the type of the true Shepherd who feeds the flock with integrity of heart.'),
    ('canon','1-chronicles',11,2,'canon','micah',5,2,'free',
     E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). The shepherd-king who is *ruler over my people Yashar''el (Israel)* (1 Chronicles 11:2) is a type of the everlasting Ruler from David''s own Beth-lehem -- the Formed Son who has a Father.'),
    ('canon','1-chronicles',11,2,'canon','micah',5,4,'free',
     E'*And he shall stand and feed in the strength of Yahuah (LORD), in the majesty of the name of Yahuah Elohav (the LORD his God); and they shall abide: for now shall he be great unto the ends of the earth* (Micah 5:4). The charge to David to *feed my people Yashar''el (Israel)* (1 Chronicles 11:2) reaches its consummation in the Ruler who *shall stand and feed* the flock to the ends of the earth.'),
    ('canon','1-chronicles',11,2,'canon','matthew',2,6,'free',
     E'*And thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6). The scribes read Micah of the Messiah; the charge over David to *be ruler over my people Yashar''el (Israel)* (1 Chronicles 11:2) is fulfilled in the Governor who shall *rule my people*.'),
    ('canon','1-chronicles',11,2,'canon','john',10,11,'free',
     E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). David was charged to *feed my people Yashar''el (Israel)* (1 Chronicles 11:2); the shepherd-king is the type, and the good shepherd who lays down his life is the antitype -- the Davidic King who feeds and dies for the flock.'),

    -- Thread 2: David takes the castle of Zion, the city of David
    ('canon','1-chronicles',11,5,'canon','2-samuel',5,7,'free',
     E'*Nevertheless David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7). The Chronicler''s *David took the castle of Zion, which is the city of David* (1 Chronicles 11:5) is the same conquest -- Zion seized as the seat of the kingdom.'),
    ('canon','1-chronicles',11,4,'canon','2-samuel',5,6,'free',
     E'*And the king and his men went to Jerusalem unto the Jebusites, the inhabitants of the land: which spake unto David, saying, Except thou take away the blind and the lame, thou shalt not come in hither* (2 Samuel 5:6). The parallel of *David and all Yashar''el (Israel) went to Jerusalem, which is Jebus; where the Jebusites were, the inhabitants of the land* (1 Chronicles 11:4) -- the stronghold of the nations given over to the anointed king.'),
    ('canon','1-chronicles',11,9,'canon','2-samuel',5,10,'free',
     E'*And David went on, and grew great, and Yahuah Elohim (the LORD God) of hosts was with him* (2 Samuel 5:10). The Chronicler''s *David waxed greater and greater: for Yahuah Tseva''ot (LORD of hosts) was with him* (1 Chronicles 11:9) names the same secret of his rise -- the LORD of hosts with him.'),
    ('canon','1-chronicles',11,5,'canon','psalms',2,6,'free',
     E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). David took *the castle of Zion, which is the city of David* (1 Chronicles 11:5), but the deeper claim is Yahuah''s: it is HE who sets his king upon the holy hill -- Zion the seat of the Messianic reign.'),
    ('canon','1-chronicles',11,5,'canon','psalms',132,13,'free',
     E'*For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13). David''s taking of *the castle of Zion* (1 Chronicles 11:5) was Yahuah making good his own choosing -- Zion not merely a fortress but the chosen habitation of the King.'),
    ('canon','1-chronicles',11,5,'canon','isaiah',28,16,'free',
     E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The stronghold David won in *the castle of Zion* (1 Chronicles 11:5) is where Yahuah lays the corner stone -- Zion the foundation of the Messiah''s kingdom.'),
    ('canon','1-chronicles',11,5,'canon','hebrews',12,22,'free',
     E'*But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels* (Hebrews 12:22). David''s *city of David* on Zion (1 Chronicles 11:5) is the earthly figure of the heavenly Sion, the city of the living Elohim toward which the gathered people come.'),
    ('canon','1-chronicles',11,5,'canon','revelation',14,1,'free',
     E'*And I looked, and, lo, a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads* (Revelation 14:1). The Zion David seized as *the city of David* (1 Chronicles 11:5) is where the Lamb at last stands with the gathered tribes -- the Davidic reign consummated on the holy hill.'),

    -- Thread 3: the mighty men gathered to make him king
    ('canon','1-chronicles',11,10,'canon','2-samuel',23,8,'free',
     E'*These be the names of the mighty men whom David had: The Tachmonite that sat in the seat, chief among the captains; the same was Adino the Eznite: he lift up his spear against eight hundred, whom he slew at one time* (2 Samuel 23:8). The Chronicler opens his roll the same way -- *the chief of the mighty men whom David had, who strengthened themselves with him in his kingdom... to make him king, according to the word of Yahuah (LORD)* (1 Chronicles 11:10): valour gathered around the anointed king.'),

    -- Thread 4: the three and the water of Beth-lehem''s well poured to Yahuah
    ('canon','1-chronicles',11,12,'canon','2-samuel',23,9,'free',
     E'*And after him was Eleazar the son of Dodo the Ahohite, one of the three mighty men with David, when they defied the Philistines that were there gathered together to battle* (2 Samuel 23:9). The same Eleazar stands among the chief in *Eleazar the son of Dodo, the Ahohite, who was one of the three mighties* (1 Chronicles 11:12) -- the inner circle of the king''s mighty men.'),
    ('canon','1-chronicles',11,16,'canon','2-samuel',23,14,'free',
     E'*And David was then in an hold, and the garrison of the Philistines was then in Beth-lehem* (2 Samuel 23:14). The Chronicler tells it the same: *David was then in the hold, and the Philistines'' garrison was then at Beth-lehem* (1 Chronicles 11:16) -- the king cut off from his own city of David.'),
    ('canon','1-chronicles',11,17,'canon','2-samuel',23,15,'free',
     E'*And David longed, and said, Oh that one would give me drink of the water of the well of Beth-lehem, which is by the gate!* (2 Samuel 23:15). The same longing: *Oh that one would give me drink of the water of the well of Beth-lehem, that is at the gate!* (1 Chronicles 11:17) -- the king''s thirst for the water of the city that bore him.'),
    ('canon','1-chronicles',11,18,'canon','2-samuel',23,16,'free',
     E'*And the three mighty men brake through the host of the Philistines, and drew water out of the well of Beth-lehem, that was by the gate, and took it, and brought it to David: nevertheless he would not drink thereof, but poured it out unto Yahuah (LORD)* (2 Samuel 23:16). The Chronicler''s *the three brake through the host of the Philistines, and drew water out of the well of Beth-lehem... but David would not drink of it, but poured it out to Yahuah (LORD)* (1 Chronicles 11:18) -- the water won at the risk of blood is too holy for the king; he pours it out as a drink offering unto Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people',
       E'All Yashar''el Anoint David the Shepherd-King over My People',
       E'*Then all Yashar''el (Israel) gathered themselves to David unto Hebron, saying, Behold, we are thy bone and thy flesh... and they anointed David king over Yashar''el (Israel), according to the word of Yahuah (LORD) by Samuel* (1 Chronicles 11:1, 3). The whole people -- the two-house body -- owns the anointed as their own flesh, and the elders only ratify what Yahuah had already spoken: *I will send thee to Jesse the Beth-lehemite: for I have provided me a king among his sons* (1 Samuel 16:1), and *Samuel took the horn of oil, and anointed him in the midst of his brethren: and the Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13). The parallel reads the same: *they anointed David king over Yashar''el (Israel)* (2 Samuel 5:3).\n\nThe charge laid on the king is a SHEPHERD''S charge: *Thou shalt feed my people Yashar''el (Israel), and thou shalt be ruler over my people Yashar''el (Israel)* (1 Chronicles 11:2). The Psalm sings the choosing -- *He chose David also his servant, and took him from the sheepfolds: from following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:70-71), and David *fed them according to the integrity of his heart* (Psalm 78:72). David, the literal shepherd taken from the fold to feed the flock that is Yahuah''s own people, is a type. Micah lifts the type to its everlasting fulfilment: *out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting... and he shall stand and feed in the strength of Yahuah (LORD)* (Micah 5:2, 4). The scribes read it of the Messiah -- *out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6) -- and the Davidic King himself declares it: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The shepherd-king over the gathered people is the Formed Son who has a Father, anointed to feed and to die for the flock.',
       sv.verse_id, ev.verse_id, 'free', 30250
  FROM _s313_chr11_lookup sv, _s313_chr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david',
       E'David Took the Castle of Zion, the City of David',
       E'*And David and all Yashar''el (Israel) went to Jerusalem, which is Jebus... Nevertheless David took the castle of Zion, which is the city of David* (1 Chronicles 11:4-5). The stronghold of the nations is given over to the anointed king -- the parallel tells it the same: *Nevertheless David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7). And the secret of his rise is named: *So David waxed greater and greater: for Yahuah Tseva''ot (LORD of hosts) was with him* (1 Chronicles 11:9; cf. 2 Samuel 5:10).\n\nBut the deeper claim over Zion is Yahuah''s own. *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) -- David took the castle, yet it is the LORD who sets his king there. *For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13): the fortress is the chosen dwelling of the King. There Yahuah lays his foundation: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation* (Isaiah 28:16). The city of David on Zion is the seat of the kingdom that points beyond David to the Messianic reign: *ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem* (Hebrews 12:22), where at the last *a Lamb stood on the mount Sion, and with him an hundred forty and four thousand, having his Father''s name written in their foreheads* (Revelation 14:1). The Zion David seized is the earthly figure of the throne where the Lamb stands with the gathered tribes -- the Davidic reign consummated on the holy hill.',
       sv.verse_id, ev.verse_id, 'free', 30251
  FROM _s313_chr11_lookup sv, _s313_chr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-11-the-mighty-men-gathered-to-make-him-king',
       E'The Mighty Men Gathered to Make Him King',
       E'*These also are the chief of the mighty men whom David had, who strengthened themselves with him in his kingdom, and with all Yashar''el (Israel), to make him king, according to the word of Yahuah (LORD) concerning Yashar''el (Israel)* (1 Chronicles 11:10). The roll of the valiant is not a mere catalogue of soldiers -- it is the gathered devotion of the people around the anointed king, and once more the Chronicler grounds it in *the word of Yahuah (LORD) concerning Yashar''el (Israel)*. The parallel roll opens the same way: *These be the names of the mighty men whom David had: The Tachmonite that sat in the seat, chief among the captains... he lift up his spear against eight hundred, whom he slew at one time* (2 Samuel 23:8). The strength of Yashar''el rallies to the king Yahuah chose -- loyalty to the anointed is loyalty to the LORD''s own word.',
       sv.verse_id, ev.verse_id, 'free', 30252
  FROM _s313_chr11_lookup sv, _s313_chr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah',
       E'The Three and the Water of Beth-lehem''s Well Poured Out to Yahuah',
       E'David, cut off from his own city, longs for home: *David was then in the hold, and the Philistines'' garrison was then at Beth-lehem. And David longed, and said, Oh that one would give me drink of the water of the well of Beth-lehem, that is at the gate!* (1 Chronicles 11:16-17). The same scene stands in the parallel: *David was then in an hold, and the garrison of the Philistines was then in Beth-lehem... Oh that one would give me drink of the water of the well of Beth-lehem, which is by the gate!* (2 Samuel 23:14-15). Among the three was *Eleazar the son of Dodo, the Ahohite, who was one of the three mighties* (1 Chronicles 11:12; cf. 2 Samuel 23:9).\n\nThe three count the king''s longing as a command worth their blood: *the three brake through the host of the Philistines, and drew water out of the well of Beth-lehem, that was by the gate, and took it, and brought it to David: but David would not drink of it, but poured it out to Yahuah (LORD)* (1 Chronicles 11:18; cf. 2 Samuel 23:16). The water won *with the jeopardy of their lives* is too holy for the king to drink -- *shall I drink the blood of these men that have put their lives in jeopardy?* (1 Chronicles 11:19) -- so he lifts it up as a drink offering unto Yahuah. The devotion of the mighty men to the anointed king is matched by the king''s own refusal to spend their lives'' blood on himself: it belongs to the LORD.',
       sv.verse_id, ev.verse_id, 'free', 30253
  FROM _s313_chr11_lookup sv, _s313_chr11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=11 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Behold, we are thy bone and thy flesh* (2 Samuel 5:1) -- all Yashar''el owns the anointed as their own flesh.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt feed my people Yashar''el (Israel)* (2 Samuel 5:2) -- the king''s charge is a shepherd''s charge.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They anointed David king over Yashar''el (Israel)* (2 Samuel 5:3) -- the elders ratify Yahuah''s prior word.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I have provided me a king among his sons* (1 Samuel 16:1) -- the king chosen by Yahuah at Beth-lehem.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The Spirit of Yahuah (LORD) came upon David from that day forward* (1 Samuel 16:13) -- the word of Yahuah by Samuel.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He chose David also his servant, and took him from the sheepfolds* (Psalm 78:70) -- the shepherd taken to be shepherd-king.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=70
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*He brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71) -- the same charge to feed Yahuah''s people.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=71
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*So he fed them according to the integrity of his heart* (Psalm 78:72) -- David made good the shepherd charge.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=72
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Out of thee shall he come forth... that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2) -- the everlasting Ruler from David''s Beth-lehem.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*And he shall stand and feed in the strength of Yahuah (LORD)* (Micah 5:4) -- the shepherd-charge consummated to the ends of the earth.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*Out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6) -- the charge over David fulfilled in the Messiah.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) -- the Davidic King who feeds and dies for the flock.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-all-israel-anointed-david-shepherd-king-over-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David took the strong hold of Zion: the same is the city of David* (2 Samuel 5:7) -- Zion seized as the seat of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The king and his men went to Jerusalem unto the Jebusites* (2 Samuel 5:6) -- the stronghold of the nations given to the anointed king.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*David went on, and grew great, and Yahuah Elohim (the LORD God) of hosts was with him* (2 Samuel 5:10) -- the secret of his rise.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) -- it is Yahuah who sets his king on Zion.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13) -- the fortress is the chosen habitation of the King.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone* (Isaiah 28:16) -- Zion the foundation of the Messiah''s kingdom.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Ye are come unto mount Sion... the heavenly Jerusalem* (Hebrews 12:22) -- the city of David the earthly figure of the heavenly Sion.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*A Lamb stood on the mount Sion, and with him an hundred forty and four thousand* (Revelation 14:1) -- the Davidic reign consummated on the holy hill.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-david-took-the-castle-of-zion-the-city-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*These be the names of the mighty men whom David had* (2 Samuel 23:8) -- the parallel roll of the king''s valiant men.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-the-mighty-men-gathered-to-make-him-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Eleazar the son of Dodo the Ahohite, one of the three mighty men with David* (2 Samuel 23:9) -- the inner circle of the three.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*David was then in an hold, and the garrison of the Philistines was then in Beth-lehem* (2 Samuel 23:14) -- the king cut off from his own city.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=16
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Oh that one would give me drink of the water of the well of Beth-lehem, which is by the gate!* (2 Samuel 23:15) -- the king''s thirst for his home city.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He would not drink thereof, but poured it out unto Yahuah (LORD)* (2 Samuel 23:16) -- the water won at risk of blood lifted as a drink offering.'
  FROM cross_reference_threads t
  JOIN _s313_chr11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=11 AND sv.verse_number=18
  JOIN _s313_chr11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-11-the-three-and-the-water-of-bethlehems-well-poured-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_12.sql (1 Chronicles 12) -----
-- Book: 1 Chronicles, chapter 12  |  tag: chr12  |  session prefix: s313
-- temp view: _s313_chr12_lookup  |  slug prefix: 1-chronicles-12-...
-- sort_order band start: 30275 (+1 per thread)
-- Source book_slug=1-chronicles, chapter 12.  All targets weighed across the three libraries.
--
-- CHAPTER: the warriors from every tribe who came to David at Ziklag and at Hebron to turn the
-- kingdom to him (12:1-37); the Spirit-prompted pledge of Amasai (12:18); the men of Issachar
-- who understood the times (12:32); the whole people of ONE HEART, with joy, to crown the
-- anointed (12:38-40).
--
-- 1 Chronicles 12 coverage:
--   v.1-17  (the mighty men separating themselves to David in the hold / Jordan crossing)
--           NT:     none warranted (narrative roster; theme carried at 12:38 thread)
--           Extras: none warranted
--           Tanakh: none warranted (folded into the gathering theme at 12:38)
--   v.18    (Spirit came upon Amasai: Thine are we, David... peace... for thy Elohim helpeth thee)
--           NT:     none warranted (allegiance-to-the-anointed type carried laterally in Tanakh)
--           Extras: none warranted
--           Tanakh: 2 Chronicles 15:1-2 (Spirit came upon Azariah / Yahuah is with you while ye
--                   be with him); 2 Samuel 17:25 (Amasa, the captain — the man behind the name) -> THREAD 1
--   v.19-31 (rosters tribe by tribe; Manasseh, the numbers to Hebron to make David king)
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: none warranted (gathering theme at 12:38)
--   v.32    (children of Issachar, understanding of the times, to know what Yashar'el ought to do)
--           NT:     Luke 12:56 (discern the face of the sky... how is it ye do not discern this
--                   time); Matthew 16:3 (can ye not discern the signs of the times) -> THREAD 2
--           Extras: none warranted
--           Tanakh: Esther 4:14 (who knoweth whether thou art come... for such a time as this);
--                   1 Chronicles 12:38 (of one heart to make David king — discernment unto action) -> THREAD 2
--   v.33-37 (Zebulun not of double heart; the trans-Jordan host)
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: none warranted (single-heart note absorbed into 12:38 thread)
--   v.38-40 (all of one/perfect heart to make David king over all Yashar'el; joy in Yashar'el)
--           NT:     Acts 4:32 (the multitude... of one heart and of one soul); John 17:21 (that
--                   they all may be one) -> THREAD 3
--           Extras: none warranted
--           Tanakh: Psalm 133:1 (how good... for brethren to dwell together in unity); Ezekiel
--                   37:22 (one nation... one king... no more two nations) -> THREAD 3
--
-- THREADS:
--   1-chronicles-12-the-spirit-came-upon-amasai-thine-are-we-david    [free]  Tanakh
--   1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do  [free]  Tanakh + NT
--   1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel     [free]  Tanakh + NT
--
-- Note on 12:18 Amasai vs 2 Sam 17:25 Amasa: woven lightly — the Chronicler's Spirit-filled
-- "chief of the captains" who pledges to David stands behind the later named captain Amasa; the
-- load-bearing Tanakh witness is the SAME-Spirit oracle at 2 Chronicles 15:1-2.

CREATE TEMP VIEW _s313_chr12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Spirit came upon Amasai — allegiance to the anointed
    ('canon','1-chronicles',12,18,'canon','2-chronicles',15,1,'free',
     E'*And the Spirit of Elohim (God) came upon Azariah the son of Oded* (2 Chronicles 15:1). The same Chronicler tells of the same Spirit that fell on Amasai: *Then the spirit came upon Amasai, who was chief of the captains, and he said, Thine are we, David, and on thy side, thou son of Jesse* (1 Chronicles 12:18). The pledge of allegiance to the anointed is not mere politics but Spirit-prompted — the Ruach that moves a man to speak for Yahuah''s chosen.'),
    ('canon','1-chronicles',12,18,'canon','2-chronicles',15,2,'free',
     E'*Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you* (2 Chronicles 15:2). Amasai''s Spirit-given word is the same covenant logic: *peace, peace be unto thee, and peace be to thine helpers; for thy Elohim (God) helpeth thee* (1 Chronicles 12:18). To be with David, the anointed, is to be with Yahuah who helps him — the helper''s peace flows from the Helper of the king.'),
    ('canon','1-chronicles',12,18,'canon','2-samuel',17,25,'free',
     E'*And Absalom made Amasa captain of the host instead of Joab* (2 Samuel 17:25). Behind the Chronicler''s Spirit-filled *chief of the captains* who cries *Thine are we, David* (1 Chronicles 12:18) stands the figure of Amasa, the captain woven into the house of David''s wars; the man who lends his sword to the throne, for good or ill, is measured by whether he is *on thy side* of the anointed.'),

    -- THREAD 2: Issachar understood the times — discernment of the season unto right action
    ('canon','1-chronicles',12,32,'canon','esther',4,14,'free',
     E'*And who knoweth whether thou art come to the kingdom for such a time as this?* (Esther 4:14). The men of Issachar had this very gift: *which were men that had understanding of the times, to know what Yashar''el (Israel) ought to do* (1 Chronicles 12:32). To read the hour rightly and act for the deliverance of the people — Mordecai''s charge to Esther is the same discernment that crowned the king.'),
    ('canon','1-chronicles',12,32,'canon','luke',12,56,'free',
     E'*Ye hypocrites, ye can discern the face of the sky and of the earth; but how is it that ye do not discern this time?* (Luke 12:56). Yahusha (Jesus) indicts the blindness that is the opposite of Issachar''s wisdom — *men that had understanding of the times, to know what Yashar''el (Israel) ought to do* (1 Chronicles 12:32). The Messianic moment demands the very discernment the sons of Issachar carried: to know the season of the anointed and to move with it.'),
    ('canon','1-chronicles',12,32,'canon','matthew',16,3,'free',
     E'*O ye hypocrites, ye can discern the face of the sky; but can ye not discern the signs of the times?* (Matthew 16:3). The same rebuke names the same lack: the men of Issachar *had understanding of the times, to know what Yashar''el (Israel) ought to do* (1 Chronicles 12:32). True discernment is not reading the weather but reading the appointed hour of Yahuah''s king and acting upon it.'),
    ('canon','1-chronicles',12,32,'canon','1-chronicles',12,38,'free',
     E'*All these men of war, that could keep rank, came with a perfect heart to Hebron, to make David king over all Yashar''el (Israel)* (1 Chronicles 12:38). The understanding of Issachar — *to know what Yashar''el (Israel) ought to do* (1 Chronicles 12:32) — flowers here in action: discernment of the season is fulfilled when the whole house moves, of one heart, to crown the anointed.'),

    -- THREAD 3: of one heart to make David king — the gathered tribes, the joy of unity
    ('canon','1-chronicles',12,38,'canon','psalms',133,1,'free',
     E'*Behold, how good and how pleasant it is for brethren to dwell together in unity!* (Psalm 133:1). At Hebron that good and pleasant thing was seen: *all the rest also of Yashar''el (Israel) were of one heart to make David king* (1 Chronicles 12:38), *and there was joy in Yashar''el (Israel)* (1 Chronicles 12:40). The unity the Psalm sings is the tribes gathered as one under the anointed, where Yahuah commands the blessing.'),
    ('canon','1-chronicles',12,38,'canon','ezekiel',37,22,'free',
     E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The gathering at Hebron — *of one heart to make David king over all Yashar''el (Israel)* (1 Chronicles 12:38) — is the standing type of the two-house regathering: the divided houses made one people under one Davidic king.'),
    ('canon','1-chronicles',12,38,'canon','acts',4,32,'free',
     E'*And the multitude of them that believed were of one heart and of one soul* (Acts 4:32). The phrase reaches back to Hebron, where *all the rest also of Yashar''el (Israel) were of one heart to make David king* (1 Chronicles 12:38). The Spirit-poured assembly is the same one-heart people, gathered now under the greater Son of David.'),
    ('canon','1-chronicles',12,38,'canon','john',17,21,'free',
     E'*That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me* (John 17:21). The prayer of Yahusha (Jesus) is for the very oneness Hebron foreshadowed — *of one heart to make David king over all Yashar''el (Israel)* (1 Chronicles 12:38). The gathered, undivided people under the anointed is the Father''s purpose from the crowning of David to the restoration of all the houses.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-12-the-spirit-came-upon-amasai-thine-are-we-david',
       E'The Spirit Came Upon Amasai: Thine Are We, David',
       E'When the men of Benjamin and Yahudah (Judah) came down to the hold, David tested them: *If ye be come peaceably unto me to help me, mine heart shall be knit unto you* (1 Chronicles 12:17). The answer was not a man''s but the Ruach''s: *Then the spirit came upon Amasai, who was chief of the captains, and he said, Thine are we, David, and on thy side, thou son of Jesse: peace, peace be unto thee, and peace be to thine helpers; for thy Elohim (God) helpeth thee* (1 Chronicles 12:18). The pledge of allegiance to the anointed is Spirit-prompted.\n\nThe Chronicler shows the same Spirit at work elsewhere: *And the Spirit of Elohim (God) came upon Azariah the son of Oded* (2 Chronicles 15:1), who declared the covenant terms that undergird Amasai''s cry — *Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you* (2 Chronicles 15:2). To stand *on thy side* of David is to stand with Yahuah who *helpeth* him; the helper''s peace flows from the Helper of the king.\n\nAnd the named captaincy stands behind the moment: *And Absalom made Amasa captain of the host instead of Joab* (2 Samuel 17:25) — the man who lends his sword to the throne is weighed by whether his heart is for or against the anointed. The whole canon runs to the One the Spirit still bids us pledge: *Thine are we.*',
       sv.verse_id, ev.verse_id, 'free', 30275
  FROM _s313_chr12_lookup sv, _s313_chr12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do',
       E'The Men of Issachar: Understanding of the Times',
       E'Among the tribes that came to Hebron, one carried a gift named with quiet weight: *And of the children of Issachar, which were men that had understanding of the times, to know what Yashar''el (Israel) ought to do; the heads of them were two hundred; and all their brethren were at their commandment* (1 Chronicles 12:32). This is not military strength but discernment — to read the season and to know the right action for the people of Yahuah.\n\nMordecai charged Esther with the same wisdom: *who knoweth whether thou art come to the kingdom for such a time as this?* (Esther 4:14) — the hour discerned, the deliverance seized. And Yahusha (Jesus) indicted those who lacked it: *Ye hypocrites, ye can discern the face of the sky and of the earth; but how is it that ye do not discern this time?* (Luke 12:56); *can ye not discern the signs of the times?* (Matthew 16:3). The Messianic moment demands the very wisdom of Issachar.\n\nAnd that wisdom flowers in action: *All these men of war, that could keep rank, came with a perfect heart to Hebron, to make David king over all Yashar''el (Israel)* (1 Chronicles 12:38). To understand the times is to know it is the hour of the anointed — and to move.',
       sv.verse_id, ev.verse_id, 'free', 30276
  FROM _s313_chr12_lookup sv, _s313_chr12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=12 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel',
       E'Of One Heart to Make David King: Joy in Yashar''el',
       E'The chapter crowns its rosters with the people made one: *All these men of war, that could keep rank, came with a perfect heart to Hebron, to make David king over all Yashar''el (Israel): and all the rest also of Yashar''el (Israel) were of one heart to make David king* (1 Chronicles 12:38) — *and there was joy in Yashar''el (Israel)* (1 Chronicles 12:40). The gathered tribes, united under the anointed, with gladness.\n\nThe Psalm sings exactly this: *Behold, how good and how pleasant it is for brethren to dwell together in unity!* (Psalm 133:1) — there *Yahuah (LORD) commanded the blessing, even life for evermore* (Psalm 133:3). And the prophet names it as the standing pattern of the two-house restoration: *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The divided houses made one people under one Davidic king.\n\nThe Spirit-poured assembly is the same one-heart people: *And the multitude of them that believed were of one heart and of one soul* (Acts 4:32). And the prayer of Yahusha (Jesus) reaches for its consummation: *That they all may be one; as thou, Father, art in me, and I in thee, that they also may be one in us: that the world may believe that thou hast sent me* (John 17:21). From Hebron to the regathering, the gathered, undivided people under the anointed is the Father''s purpose.',
       sv.verse_id, ev.verse_id, 'free', 30277
  FROM _s313_chr12_lookup sv, _s313_chr12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=12 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the Spirit of Elohim (God) came upon Azariah the son of Oded* (2 Chronicles 15:1) — the same Chronicler''s Spirit that fell on Amasai to pledge David.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-the-spirit-came-upon-amasai-thine-are-we-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) is with you, while ye be with him* (2 Chronicles 15:2) — the covenant logic of Amasai''s *peace... for thy Elohim helpeth thee*.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-the-spirit-came-upon-amasai-thine-are-we-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Absalom made Amasa captain of the host* (2 Samuel 17:25) — the captain behind Amasai''s name, weighed by whose side he is on.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=17 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-the-spirit-came-upon-amasai-thine-are-we-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*who knoweth whether thou art come to the kingdom for such a time as this?* (Esther 4:14) — the hour discerned and seized, Issachar''s very gift.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*how is it that ye do not discern this time?* (Luke 12:56) — the Messianic moment demands the wisdom of Issachar.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*can ye not discern the signs of the times?* (Matthew 16:3) — the same rebuke for the same lack of discernment.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*came with a perfect heart to Hebron, to make David king* (1 Chronicles 12:38) — discernment of the season flowering in action.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=12 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-issachar-understood-the-times-to-know-what-israel-ought-to-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*how good and how pleasant it is for brethren to dwell together in unity!* (Psalm 133:1) — the unity Hebron made visible, where Yahuah commands the blessing.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=38
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=133 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*one nation... one king shall be king to them all... no more two nations* (Ezekiel 37:22) — the two-house regathering for which Hebron is the type.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=38
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the multitude of them that believed were of one heart and of one soul* (Acts 4:32) — the Spirit-poured assembly, the same one-heart people.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=38
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That they all may be one; as thou, Father, art in me, and I in thee* (John 17:21) — the consummation of the one-heart people under the greater Son of David.'
  FROM cross_reference_threads t
  JOIN _s313_chr12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=12 AND sv.verse_number=38
  JOIN _s313_chr12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-12-of-one-heart-to-make-david-king-joy-in-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_13.sql (1 Chronicles 13) -----
-- Book: 1 Chronicles, chapter 13 — the first attempt to bring up the Ark; the breach of Uzza.
-- Tag: chr13 | session prefix: s313 | sort_order band: 30300+
-- Source edition: canon | book_slug: 1-chronicles | chapter: 13
--
-- 1 Chronicles 13 coverage:
--   v.1-2  (David consults the whole assembly to gather Israel and bring back the Ark)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: folded into the larger themes; the gathering of "all Yashar'el" frames ch
--   v.3-6  (the Ark that dwelleth between the cherubims, whose name is called on it)
--          NT:     none warranted (the throne-presence carried in thread chr13-the-name-is-called-on-it)
--          Extras: none warranted
--          Tanakh: Exodus 25:22 (commune from above the mercy seat), Numbers 7:89 (the voice
--                  from between the two cherubims), Psalm 132:8 (the ark of thy strength)
--   v.7-8  (carried on a NEW CART, not borne by the Levites on the staves)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 25:14 (borne with the staves), Numbers 7:9 (bear upon their shoulders),
--                  Numbers 4:15 (shall not touch any holy thing, lest they die)
--   v.9-11 (Uzza puts his hand to the ark; Yahuah smites him; Perez-uzza)
--          NT:     Hebrews 12:28-29 (serve with reverence and godly fear; consuming fire)
--          Extras: none warranted
--          Tanakh: 2 Samuel 6:6-7 (the parallel breach), Leviticus 10:1-3 (Nadab and Abihu /
--                  I will be sanctified in them that come nigh me), Numbers 1:51 (the stranger
--                  that cometh nigh shall be put to death), 1 Chronicles 15:13 (the due order)
--   v.12   (David afraid: how shall I bring the ark home to me?)
--          NT:     none warranted | Extras: none warranted | Tanakh: folded into the breach thread
--   v.13-14 (the Ark with Obed-edom; Yahuah blessed his house and all that he had)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 6:11 (the parallel blessing of Obed-edom)
--
-- THREADS (4):
--   1. 1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza   [free]  v.7-11
--        members: Exod 25:14, Num 7:9, Num 4:15, 2 Sam 6:6-7, 1 Chr 15:13 — the Torah's pattern
--        for bearing the Ark (Levites, on the shoulders, by the staves) vs. the new cart.
--   2. 1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me     [free]  v.9-11
--        members: Lev 10:1-3, Num 1:51, Heb 12:28-29 — the holiness of the Presence and the
--        cost of approaching it the wrong way; reverence/godly fear, our Elohim a consuming fire.
--   3. 1-chronicles-13-the-ark-whose-name-is-called-on-it-between-the-cherubims  [free]  v.3-6
--        members: Exod 25:22, Num 7:89, Ps 132:8 — the throne of the Presence; the Formed Son
--        who communes and speaks from between the two cherubims, the Ark of Yahuah's strength.
--   4. 1-chronicles-13-the-same-presence-blesses-the-house-of-obed-edom  [free]  v.13-14
--        members: 2 Sam 6:11 — the two edges of holiness: the Presence that slew the irreverent
--        blesses the house that honors it.
--
-- Framing note: the breach of Uzza is NOT Yahuah being arbitrary. The Torah commanded the Ark
-- be BORNE BY THE LEVITES on the staves (Exod 25:14; Num 4:15; 7:9). David learns this and
-- corrects it in ch15:13 — "we sought him not after the due order." The due order matters;
-- reverence in approaching the holy Elohim is the lesson (Lev 10:3; Heb 12:28-29).
--
-- No extra-canonical members warranted for this chapter (no clean parallel witness adds weight
-- beyond the canon Torah/Samuel/Hebrews weave).

CREATE TEMP VIEW _s313_chr13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: a new cart, not the due order
    ('canon','1-chronicles',13,7,'canon','exodus',25,14,'free',
     E'*And thou shalt put the staves into the rings by the sides of the ark, that the ark may be borne with them* (Exodus 25:14). The Torah''s own design for moving the Ark was the staves through the rings, the holy thing never touched by a bare hand. When David''s men *carried the ark of Elohim (God) in a new cart* (1 Chronicles 13:7), they set aside the appointed way for a Philistine''s expedient — and the breach followed.'),
    ('canon','1-chronicles',13,7,'canon','numbers',7,9,'free',
     E'*But unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). The Kohathites were given no wagons precisely because the Ark was to be carried *upon their shoulders* — not drawn by oxen on *a new cart* (1 Chronicles 13:7). The cart was never an option in the Torah.'),
    ('canon','1-chronicles',13,9,'canon','numbers',4,15,'free',
     E'*...but they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath* (Numbers 4:15). The Torah had spoken the exact danger: the holy thing must not be touched with the bare hand. When *Uzza put forth his hand to hold the ark; for the oxen stumbled* (1 Chronicles 13:9), the unguarded touch met the very judgment the Torah foretold.'),
    ('canon','1-chronicles',13,9,'canon','2-samuel',6,6,'free',
     E'*And when they came to Nachon''s threshingfloor, Uzzah put forth his hand to the ark of Elohim (God), and took hold of it; for the oxen shook it* (2 Samuel 6:6). The parallel account names the same threshingfloor moment behind *Uzza put forth his hand to hold the ark; for the oxen stumbled* (1 Chronicles 13:9) — one event, two witnesses, the same wrong way of carrying the Presence.'),
    ('canon','1-chronicles',13,10,'canon','2-samuel',6,7,'free',
     E'*And the anger of Yahuah (LORD) was kindled against Uzzah; and Elohim (God) smote him there for his error; and there he died by the ark of Elohim (God)* (2 Samuel 6:7). Samuel names it *for his error* — the same stroke as *the anger of Yahuah (LORD) was kindled against Uzza... and there he died before Elohim (God)* (1 Chronicles 13:10). The cost of approaching the holy the wrong way.'),
    ('canon','1-chronicles',13,11,'canon','1-chronicles',15,13,'free',
     E'*For because ye did it not at the first, Yahuah Eloheinu (the LORD our God) made a breach upon us, for that we sought him not after the due order* (1 Chronicles 15:13). David himself later names the lesson of the breach: *Yahuah (LORD) had made a breach upon Uzza* (1 Chronicles 13:11) because *we sought him not after the due order*. The Torah''s pattern was the due order all along; the second attempt the Levites bear it on their shoulders with the staves.'),

    -- Thread 2: I will be sanctified in them that come nigh me
    ('canon','1-chronicles',13,10,'canon','leviticus',10,1,'free',
     E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer... and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1). The pattern of the priests who served *which he commanded them not* stands behind Uzza''s touch *which he commanded not*: nearness to the Presence on man''s own terms is deadly.'),
    ('canon','1-chronicles',13,10,'canon','leviticus',10,3,'free',
     E'*This is it that Yahuah (LORD) spake, saying, I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3). This is the law of the holy Presence that explains the stroke against Uzza in *there he died before Elohim (God)* (1 Chronicles 13:10): those who come nigh must hallow Yahuah, or His holiness vindicates itself.'),
    ('canon','1-chronicles',13,10,'canon','numbers',1,51,'free',
     E'*...and when the tabernacle is to be pitched, the Levites shall set it up: and the stranger that cometh nigh shall be put to death* (Numbers 1:51). The Torah had drawn the line: the holy things were the Levites'' charge, and *the stranger that cometh nigh shall be put to death*. Uzza, not a Levite bearing it the appointed way, *put forth his hand* (1 Chronicles 13:9-10), and the line held.'),
    ('canon','1-chronicles',13,10,'canon','hebrews',12,28,'free',
     E'*Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28). The same holiness that smote Uzza *before Elohim (God)* (1 Chronicles 13:10) is the reason we *serve Elohim (God) acceptably with reverence and godly fear* — the Presence has not changed, nor has the due order of approaching it.'),
    ('canon','1-chronicles',13,10,'canon','hebrews',12,29,'free',
     E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29). The breach upon Uzza is the lived proof of the word the Renewed Covenant still confesses: *our Elohim (God) is a consuming fire* — He who *smote him, because he put his hand to the ark* (1 Chronicles 13:10) is the same yesterday and forever.'),

    -- Thread 3: the ark whose name is called on it, between the cherubims
    ('canon','1-chronicles',13,6,'canon','exodus',25,22,'free',
     E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). The Ark is *that dwelleth between the cherubims, whose name is called on it* (1 Chronicles 13:6) because Yahuah Himself appointed it the throne of meeting — *from between the two cherubims* — the place of the Presence among His people.'),
    ('canon','1-chronicles',13,6,'canon','numbers',7,89,'free',
     E'*...then he heard the voice of one speaking unto him from off the mercy seat that was upon the ark of testimony, from between the two cherubims: and he spake unto him* (Numbers 7:89). The One whose *name is called on it* (1 Chronicles 13:6) is the Formed Son who *spake unto him from between the two cherubims* — the visible, speaking Presence drawn from the Formless Father, enthroned above the Ark Yashar''el (Israel) now seeks to bring home.'),
    ('canon','1-chronicles',13,6,'canon','psalms',132,8,'free',
     E'*Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8). David''s own psalm names the Ark *the ark of thy strength* and longs for it to enter Yahuah''s rest — the very desire of *to bring up the ark of Elohim (God) Yahuah (LORD), that dwelleth between the cherubims* (1 Chronicles 13:6).'),

    -- Thread 4: the same Presence blesses the house of Obed-edom
    ('canon','1-chronicles',13,14,'canon','2-samuel',6,11,'free',
     E'*And the ark of Yahuah (LORD) continued in the house of Obed-edom the Gittite three months: and Yahuah (LORD) blessed Obed-edom, and all his household* (2 Samuel 6:11). The parallel witness confirms the two edges of one holiness: the Presence that slew Uzza *blessed the house of Obed-edom, and all that he had* (1 Chronicles 13:14). The same nearness that judges the irreverent blesses the house that honors it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza',
 E'A new cart, not the due order: the breach of Uzza',
 E'David sets out to bring home the Ark, but *they carried the ark of Elohim (God) in a new cart out of the house of Abinadab: and Uzza and Ahio drave the cart* (1 Chronicles 13:7) — the Philistines'' device (1 Samuel 6), not the way the Torah commanded. For Yahuah had given His people one pattern: *thou shalt put the staves into the rings by the sides of the ark, that the ark may be borne with them* (Exodus 25:14), and the Kohathites were given no wagons *because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9), and above all *they shall not touch any holy thing, lest they die* (Numbers 4:15). So when *Uzza put forth his hand to hold the ark; for the oxen stumbled* (1 Chronicles 13:9), the parallel witness records the same hour — *Uzzah put forth his hand to the ark of Elohim (God), and took hold of it; for the oxen shook it... and Elohim (God) smote him there for his error* (2 Samuel 6:6-7). The oxen would never have stumbled had the Ark rested on Levite shoulders rather than a cart. This is not Yahuah being arbitrary; it is the Torah''s pattern vindicated. David himself names the lesson when he tries again the right way: *Yahuah Eloheinu (the LORD our God) made a breach upon us, for that we sought him not after the due order* (1 Chronicles 15:13). The due order was there in the instruction all along.',
 sv.verse_id, ev.verse_id, 'free', 30300
  FROM _s313_chr13_lookup sv, _s313_chr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me',
 E'I will be sanctified in them that come nigh me',
 E'*The anger of Yahuah (LORD) was kindled against Uzza, and he smote him, because he put his hand to the ark: and there he died before Elohim (God)* (1 Chronicles 13:10). To the modern eye this looks severe; the Torah explains it. From the day the priesthood began, Yahuah declared the law of His own holiness over Aaron''s slain sons: *I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3) — for *Nadab and Abihu... offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1), just as Uzza touched what he was commanded not. The boundary was no secret: *the stranger that cometh nigh shall be put to death* (Numbers 1:51). The holiness of the Presence is the deadly cost of approaching Yahuah the wrong way — and that holiness has not been softened. The Renewed Covenant carries the same fear forward: *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28), *for our Elohim (God) is a consuming fire* (Hebrews 12:29). The breach upon Uzza is mercy teaching reverence: come nigh, but come the appointed way.',
 sv.verse_id, ev.verse_id, 'free', 30301
  FROM _s313_chr13_lookup sv, _s313_chr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=13 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-13-the-ark-whose-name-is-called-on-it-between-the-cherubims',
 E'The Ark whose name is called on it, that dwelleth between the cherubims',
 E'David goes to bring up *the ark of Elohim (God) Yahuah (LORD), that dwelleth between the cherubims, whose name is called on it* (1 Chronicles 13:6). The Ark is no relic; it is the throne of the Presence, the place Yahuah Himself appointed: *there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). And the One who met and spoke there is the Formed — the expressed Word drawn from the Formless Father: *then he heard the voice of one speaking unto him from off the mercy seat that was upon the ark of testimony, from between the two cherubims: and he spake unto him* (Numbers 7:89). It is the Son who speaks from between the cherubims, the visible Glory whose Name is called on the Ark. Small wonder David''s own psalm pleads, *Arise, O Yahuah (LORD), into thy rest; thou, and the ark of thy strength* (Psalm 132:8) — the longing of all Yashar''el (Israel) to bring the throne of the Presence home.',
 sv.verse_id, ev.verse_id, 'free', 30302
  FROM _s313_chr13_lookup sv, _s313_chr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-13-the-same-presence-blesses-the-house-of-obed-edom',
 E'The same Presence blesses the house of Obed-edom',
 E'David, afraid, leaves the Ark short of the city: *the ark of Elohim (God) remained with the family of Obed-edom in his house three months. And Yahuah (LORD) blessed the house of Obed-edom, and all that he had* (1 Chronicles 13:14). Here are the two edges of one holiness. The Presence that smote Uzza for the unguarded touch now pours blessing on the house that receives it in honor — *Yahuah (LORD) blessed Obed-edom, and all his household* (2 Samuel 6:11). The same fire that consumes the irreverent warms and enriches those who keep the due order. Yahuah is not capricious; His holiness has one consistent face — death to presumption, life and blessing to reverence.',
 sv.verse_id, ev.verse_id, 'free', 30303
  FROM _s313_chr13_lookup sv, _s313_chr13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the ark may be borne with them* (Exodus 25:14) — the Torah''s design: the staves through the rings, never the bare hand.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they should bear upon their shoulders* (Numbers 7:9) — the Kohathites given no wagons; the Ark a shoulder-burden, not a cart-load.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they shall not touch any holy thing, lest they die* (Numbers 4:15) — the exact danger the Torah named, met at the threshingfloor.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Uzzah put forth his hand to the ark... for the oxen shook it* (2 Samuel 6:6) — the parallel witness to the same wrong way of carrying the Presence.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Elohim (God) smote him there for his error* (2 Samuel 6:7) — Samuel names it error; the same stroke as Chronicles records.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*we sought him not after the due order* (1 Chronicles 15:13) — David names the lesson; the second time the Levites bear it on their shoulders.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=11
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=15 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-a-new-cart-not-the-due-order-the-breach-of-uzza'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*offered strange fire... which he commanded them not* (Leviticus 10:1) — nearness to the Presence on man''s own terms is deadly.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will be sanctified in them that come nigh me* (Leviticus 10:3) — the law of the holy Presence that explains the stroke against Uzza.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the stranger that cometh nigh shall be put to death* (Numbers 1:51) — the Torah''s line; Uzza, not a Levite bearing it the appointed way, crossed it.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28) — the same holiness carried forward; the Presence has not changed.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*our Elohim (God) is a consuming fire* (Hebrews 12:29) — the lived proof in Uzza; He is the same yesterday and forever.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-i-will-be-sanctified-in-them-that-come-nigh-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will commune with thee... from between the two cherubims* (Exodus 25:22) — Yahuah appointed the Ark the throne of meeting.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-the-ark-whose-name-is-called-on-it-between-the-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the voice of one speaking... from between the two cherubims* (Numbers 7:89) — the Formed Son who speaks from above the mercy seat.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=89
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-the-ark-whose-name-is-called-on-it-between-the-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou, and the ark of thy strength* (Psalm 132:8) — David''s own longing for the throne of the Presence to enter Yahuah''s rest.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-the-ark-whose-name-is-called-on-it-between-the-cherubims'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) blessed Obed-edom, and all his household* (2 Samuel 6:11) — the parallel witness; the same holiness that judged Uzza blesses the house that honors it.'
  FROM cross_reference_threads t
  JOIN _s313_chr13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s313_chr13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-13-the-same-presence-blesses-the-house-of-obed-edom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_14.sql (1 Chronicles 14) -----
-- Book: 1 Chronicles  Chapter: 14  (David established; victory by enquiring of Yahuah)
-- Tag: chr14   Session prefix: s313   Temp view: _s313_chr14_lookup
-- Sort band: 30325..30327 (+1 per thread)
-- Source edition: canon  book_slug: 1-chronicles  chapter: 14
--
-- 1 Chronicles 14 coverage:
--   v.1-2   NT:     none warranted (lateral Davidic-throne weave carries it)
--           Extras: none warranted
--           Tanakh: 2 Samuel 5:11-12 (parallel), 1 Chronicles 17:14 (throne for ever),
--                   Psalm 89:20-27 (David anointed/exalted firstborn) -> THREAD 1
--   v.3-7   NT:     none warranted (genealogy of Jerusalem sons)
--           Extras: none warranted
--           Tanakh: 2 Samuel 5:13-16 (parallel list) -> noted, not threaded (bare name-list,
--                   no framework weight; the parallel is captured under THREAD 1's anchor span
--                   implicitly; chose not to thread a name-roster)
--   v.8-12  NT:     none warranted
--           Extras: none warranted
--           Tanakh: 1 Chronicles 10:13-14 (Saul enquired NOT — the contrast), 1 Samuel 23:2,
--                   1 Samuel 30:8 (David enquired and was answered), 2 Samuel 5:19 (parallel),
--                   Psalm 20:7-8 (trust not in chariots), Proverbs 3:5-6 (acknowledge him) -> THREAD 2
--   v.13-16 NT:     none warranted
--           Extras: none warranted
--           Tanakh: 2 Samuel 5:22-25 (parallel — different strategy), Exodus 14:14 (Yahuah fights),
--                   Judges 4:14 (is not Yahuah gone out before thee?) -> THREAD 3
--   v.17    NT:     none warranted
--           Extras: none warranted
--           Tanakh: none warranted (fame/fear of David; folded into THREAD 1's establishment frame)
--
-- THREADS:
--   1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel   [free]  -> 2 Samuel, 1 Chronicles, Psalm (canon Tanakh)
--   1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle  [free]  -> 1 Chronicles, 1 Samuel, 2 Samuel, Psalm, Proverbs (canon Tanakh)
--   1-chronicles-14-enquired-again-elohim-gone-forth-before-thee   [free]  -> 2 Samuel, Exodus, Judges (canon Tanakh)
--
-- GUARDS APPLIED: the king who ENQUIRES of Yahuah before each battle (14:10,14:14) = obedient
--   dependence contrasting Saul's self-will and necromancy (10:13-14, "enquired not"); David asks
--   AFRESH the second time, not presuming on the prior method — exact obedience to fresh guidance,
--   Yahuah/Elohim going before (Exod 14:14); the kingdom established for the PEOPLE's sake (14:2,
--   Davidic throne, Ps 89). No co-equal-persons grammar. All members canon/free.

CREATE TEMP VIEW _s313_chr14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: kingdom established for his people's sake
    ('canon','1-chronicles',14,2,'canon','2-samuel',5,11,'free',
     E'The parallel record: *And Hiram king of Tyre sent messengers to David, and cedar trees, and carpenters, and masons: and they built David an house* (2 Samuel 5:11). The same Hiram, the same cedar house — the two witnesses agree that the surrounding nations themselves serve to establish the throne Yahuah (LORD) has chosen, as *Hiram king of Tyre sent messengers to David... to build him an house* (1 Chronicles 14:1).'),
    ('canon','1-chronicles',14,2,'canon','2-samuel',5,12,'free',
     E'The parallel verse names the purpose outright: *And David perceived that Yahuah (LORD) had established him king over Yashar''el (Israel), and that he had exalted his kingdom for his people Yashar''el''s (Israel''s) sake* (2 Samuel 5:12). David''s exaltation is never for David — it is *because of his people Yashar''el (Israel)* (1 Chronicles 14:2). The throne is given for the sake of the covenant people.'),
    ('canon','1-chronicles',14,2,'canon','1-chronicles',17,14,'free',
     E'The promise that this established throne is everlasting: *But I will settle him in mine house and in my kingdom for ever: and his throne shall be established for evermore* (1 Chronicles 17:14). David''s kingdom *lifted up on high... because of his people Yashar''el (Israel)* (1 Chronicles 14:2) is the seed of the throne Yahuah (LORD) pledges to stablish for ever — the Davidic king who is the Formed Son''s own line.'),
    ('canon','1-chronicles',14,2,'canon','psalms',89,20,'free',
     E'The Psalm sings the same election: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20). That David *perceived that Yahuah (LORD) had confirmed him king over Yashar''el (Israel)* (1 Chronicles 14:2) because Yahuah had first chosen and anointed him — the kingdom is Yahuah''s gift, not David''s seizing.'),
    ('canon','1-chronicles',14,2,'canon','psalms',89,27,'free',
     E'The anointed one exalted above all: *Also I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27). David''s *kingdom was lifted up on high* (1 Chronicles 14:2) is the first measure of the firstborn-king promise that runs to the everlasting throne of the Formed Davidic Son.'),

    -- THREAD 2: David enquired before battle (vs Saul who enquired not)
    ('canon','1-chronicles',14,10,'canon','1-chronicles',10,13,'free',
     E'The dark contrast set just four chapters back: *So Saul died for his transgression which he committed against Yahuah (LORD), even against the word of Yahuah (LORD), which he kept not, and also for asking counsel of one that had a familiar spirit, to enquire of it* (1 Chronicles 10:13). Saul sought the dead; David *enquired of Elohim (God), saying, Shall I go up against the Philistines?* (1 Chronicles 14:10). The two kings are weighed by where they turn for counsel.'),
    ('canon','1-chronicles',14,10,'canon','1-chronicles',10,14,'free',
     E'The chronicler''s verdict names the very sin David avoids: *And enquired not of Yahuah (LORD): therefore he slew him, and turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14). Saul *enquired not*; David''s reign opens with *David enquired of Elohim (God)* (1 Chronicles 14:10). The kingdom passes to the king who asks.'),
    ('canon','1-chronicles',14,10,'canon','1-samuel',23,2,'free',
     E'David''s lifelong pattern of asking first: *Therefore David enquired of Yahuah (LORD), saying, Shall I go and smite these Philistines? And Yahuah (LORD) said unto David, Go, and smite the Philistines, and save Keilah* (1 Samuel 23:2). The same question, the same Philistine foe, the same dependence — *Shall I go up against the Philistines? and wilt thou deliver them into mine hand?* (1 Chronicles 14:10).'),
    ('canon','1-chronicles',14,10,'canon','1-samuel',30,8,'free',
     E'Even in distress David enquires before he moves: *And David enquired at Yahuah (LORD), saying, Shall I pursue after this troop? shall I overtake them? And he answered him, Pursue: for thou shalt surely overtake them, and without fail recover all* (1 Samuel 30:8). The obedient dependence that marks *David enquired of Elohim (God)* (1 Chronicles 14:10) is no isolated act but the settled habit of the man after Yahuah''s own heart.'),
    ('canon','1-chronicles',14,10,'canon','2-samuel',5,19,'free',
     E'The parallel account of this very battle: *And David enquired of Yahuah (LORD), saying, Shall I go up to the Philistines? wilt thou deliver them into mine hand? And Yahuah (LORD) said unto David, Go up: for I will doubtless deliver the Philistines into thine hand* (2 Samuel 5:19). Two witnesses to one obedience — the king asks, and *Yahuah (LORD) said unto him, Go up; for I will deliver them into thine hand* (1 Chronicles 14:10).'),
    ('canon','1-chronicles',14,11,'canon','psalms',20,7,'free',
     E'The Psalm names where the victory truly lies: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). David smote them because *Elohim (God) hath broken in upon mine enemies by mine hand like the breaking forth of waters* (1 Chronicles 14:11) — the breach was Elohim''s, not the arm of flesh.'),
    ('canon','1-chronicles',14,12,'canon','proverbs',3,5,'free',
     E'The wisdom that David lives out: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5). David does not lean on his own strategy but enquires and obeys, then burns the abandoned idols of the enemy — *And when they had left their gods there, David gave a commandment, and they were burned with fire* (1 Chronicles 14:12), refusing the spoil that Saul would have spared.'),
    ('canon','1-chronicles',14,10,'canon','proverbs',3,6,'free',
     E'The promise to the one who asks first: *In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:6). David acknowledges Yahuah in the way of battle — *David enquired of Elohim (God)* (1 Chronicles 14:10) — and his path is directed straight to the victory at Baal-perazim.'),

    -- THREAD 3: enquired AGAIN, fresh guidance, Elohim gone before
    ('canon','1-chronicles',14,14,'canon','2-samuel',5,23,'free',
     E'The parallel of the second enquiry and its different word: *And when David enquired of Yahuah (LORD), he said, Thou shalt not go up; but fetch a compass behind them, and come upon them over against the mulberry trees* (2 Samuel 5:23). David does not presume on the prior victory''s method; *David enquired again of Elohim (God)* (1 Chronicles 14:14) and is given a wholly new strategy — not to go up after them but to circle to the mulberry trees.'),
    ('canon','1-chronicles',14,16,'canon','2-samuel',5,25,'free',
     E'The parallel records the exact obedience: *And David did so, as Yahuah (LORD) had commanded him; and smote the Philistines from Geba until thou come to Gazer* (2 Samuel 5:25). So too here: *David therefore did as Elohim (God) commanded him: and they smote the host of the Philistines from Gibeon even to Gazer* (1 Chronicles 14:16). Fresh guidance, exact obedience, complete victory.'),
    ('canon','1-chronicles',14,15,'canon','exodus',14,14,'free',
     E'The ground of every Yashar''el (Israel) victory, spoken at the sea: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The sound in the mulberry trees is Yahuah''s own going: *for Elohim (God) is gone forth before thee to smite the host of the Philistines* (1 Chronicles 14:15). David''s part is to move when Elohim moves, for the battle is Elohim''s.'),
    ('canon','1-chronicles',14,15,'canon','judges',4,14,'free',
     E'Deborah''s war-cry carries the same assurance: *And Deborah said unto Barak, Up; for this is the day in which Yahuah (LORD) hath delivered Sisera into thine hand: is not Yahuah (LORD) gone out before thee?* (Judges 4:14). The deliverer goes out ahead of the host — *Elohim (God) is gone forth before thee to smite the host of the Philistines* (1 Chronicles 14:15) — and victory follows the One who has already advanced.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel',
       E'The Kingdom Lifted Up on High — for His People Yashar''el',
       E'Hiram of Tyre builds David a house of cedar, and the heathen nations themselves serve the throne Yahuah (LORD) has chosen: *Now Hiram king of Tyre sent messengers to David, and timber of cedars, with masons and carpenters, to build him an house* (1 Chronicles 14:1). The second witness agrees: *And Hiram king of Tyre sent messengers to David, and cedar trees, and carpenters, and masons: and they built David an house* (2 Samuel 5:11). But David reads the gift rightly — not as his own greatness, but as Yahuah''s purpose for the covenant people: *And David perceived that Yahuah (LORD) had confirmed him king over Yashar''el (Israel), for his kingdom was lifted up on high, because of his people Yashar''el (Israel)* (1 Chronicles 14:2). The parallel says it plainly: *and that he had exalted his kingdom for his people Yashar''el''s (Israel''s) sake* (2 Samuel 5:12). The throne is never for the king''s sake. It is the seed of an everlasting kingdom: *But I will settle him in mine house and in my kingdom for ever: and his throne shall be established for evermore* (1 Chronicles 17:14). And the Psalm sings the election that began it all — *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20) — exalting him as *my firstborn, higher than the kings of the earth* (Psalm 89:27). The Davidic throne, lifted up for the people, runs forward to the Formed Davidic Son who reigns for ever.',
       sv.verse_id, ev.verse_id, 'free', 30325
  FROM _s313_chr14_lookup sv, _s313_chr14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle',
       E'David Enquired of Elohim — the King Who Asks Before the Battle',
       E'When the Philistines come up to seek the newly anointed king, David does not march on his own counsel — he asks: *And David enquired of Elohim (God), saying, Shall I go up against the Philistines? and wilt thou deliver them into mine hand? And Yahuah (LORD) said unto him, Go up; for I will deliver them into thine hand* (1 Chronicles 14:10). This is the very thing his predecessor failed to do. The chronicler had just pronounced Saul''s doom: *So Saul died for his transgression... and also for asking counsel of one that had a familiar spirit, to enquire of it* (1 Chronicles 10:13), *And enquired not of Yahuah (LORD): therefore he slew him, and turned the kingdom unto David the son of Jesse* (1 Chronicles 10:14). Saul enquired of the dead; David enquires of the Living One — and the kingdom passes to the one who asks. This is David''s settled habit: *Therefore David enquired of Yahuah (LORD)... And Yahuah (LORD) said unto David, Go, and smite the Philistines, and save Keilah* (1 Samuel 23:2); even in distress, *And David enquired at Yahuah (LORD), saying, Shall I pursue after this troop?* (1 Samuel 30:8). The parallel record confirms this battle''s asking: *And David enquired of Yahuah (LORD)... Go up: for I will doubtless deliver the Philistines into thine hand* (2 Samuel 5:19). And when victory comes, David gives the glory away: *Elohim (God) hath broken in upon mine enemies by mine hand like the breaking forth of waters* (1 Chronicles 14:11) — for *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). He even burns the enemy''s abandoned idols rather than sparing the spoil: *And when they had left their gods there, David gave a commandment, and they were burned with fire* (1 Chronicles 14:12). This is the wisdom of the Torah-walk lived out: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5), *In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:6).',
       sv.verse_id, ev.verse_id, 'free', 30326
  FROM _s313_chr14_lookup sv, _s313_chr14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=14 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-14-enquired-again-elohim-gone-forth-before-thee',
       E'Enquired Again — for Elohim Is Gone Forth Before Thee',
       E'The Philistines regroup and spread themselves abroad a second time. David has just won at Baal-perazim — yet he does not presume on the last victory''s method. He asks afresh: *Therefore David enquired again of Elohim (God); and Elohim (God) said unto him, Go not up after them; turn away from them, and come upon them over against the mulberry trees* (1 Chronicles 14:14). The strategy is wholly different from the first; the parallel agrees: *Thou shalt not go up; but fetch a compass behind them, and come upon them over against the mulberry trees* (2 Samuel 5:23). The sign of the moment is Yahuah''s own advance: *And it shall be, when thou shalt hear a sound of going in the tops of the mulberry trees, that then thou shalt go out to battle: for Elohim (God) is gone forth before thee to smite the host of the Philistines* (1 Chronicles 14:15). This is the bedrock of every deliverance of the covenant people, first spoken at the sea: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14), and sung again in Deborah''s war-cry: *is not Yahuah (LORD) gone out before thee?* (Judges 4:14). David''s whole part is exact obedience to the fresh word: *David therefore did as Elohim (God) commanded him: and they smote the host of the Philistines from Gibeon even to Gazer* (1 Chronicles 14:16), as the parallel records, *And David did so, as Yahuah (LORD) had commanded him* (2 Samuel 5:25). The king does not improvise; he waits for the sound, moves when Elohim moves, and the victory is Elohim''s.',
       sv.verse_id, ev.verse_id, 'free', 30327
  FROM _s313_chr14_lookup sv, _s313_chr14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The parallel: *they built David an house* (2 Samuel 5:11) — Hiram of Tyre serves the chosen throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The parallel names the purpose: *he had exalted his kingdom for his people Yashar''el''s (Israel''s) sake* (2 Samuel 5:12).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The throne for ever: *his throne shall be established for evermore* (1 Chronicles 17:14).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'The election: *I have found David my servant; with my holy oil have I anointed him* (Psalm 89:20).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The firstborn king: *I will make him my firstborn, higher than the kings of the earth* (Psalm 89:27).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-the-kingdom-lifted-up-on-high-for-his-people-israel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The contrast: Saul *committed against Yahuah (LORD)... asking counsel of one that had a familiar spirit* (1 Chronicles 10:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The verdict: Saul *enquired not of Yahuah (LORD)... and turned the kingdom unto David* (1 Chronicles 10:14).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The same habit at Keilah: *David enquired of Yahuah (LORD)... Go, and smite the Philistines* (1 Samuel 23:2).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Even in distress: *David enquired at Yahuah (LORD)... Pursue: for thou shalt surely overtake them* (1 Samuel 30:8).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=30 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The parallel of this battle: *David enquired of Yahuah (LORD)... Go up: for I will doubtless deliver the Philistines* (2 Samuel 5:19).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Not chariots but the Name: *we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=11
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Lean not on self: *Trust in Yahuah (LORD) with all thine heart; and lean not unto thine own understanding* (Proverbs 3:5).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=12
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Acknowledge him and be directed: *In all thy ways acknowledge him, and he shall direct thy paths* (Proverbs 3:6).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-david-enquired-of-elohim-the-king-who-asks-before-battle'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The parallel second enquiry, a new word: *fetch a compass behind them, and come upon them over against the mulberry trees* (2 Samuel 5:23).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-enquired-again-elohim-gone-forth-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The parallel exact obedience: *David did so, as Yahuah (LORD) had commanded him* (2 Samuel 5:25).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-enquired-again-elohim-gone-forth-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The battle is Yahuah''s: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=15
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-enquired-again-elohim-gone-forth-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'He goes out ahead of the host: *is not Yahuah (LORD) gone out before thee?* (Judges 4:14).'
  FROM cross_reference_threads t
  JOIN _s313_chr14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=14 AND sv.verse_number=15
  JOIN _s313_chr14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-14-enquired-again-elohim-gone-forth-before-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_15.sql (1 Chronicles 15) -----
-- 1 Chronicles 15 — the Ark brought up RIGHTLY, by the due order (the Uzza lesson learned).
-- session prefix: s313 | tag: chr15 | slug prefix: 1-chronicles-15- | sort band start: 30350
-- source: canon 1-chronicles ch15
--
-- 1 Chronicles 15 coverage:
--   v.2  (the Ark borne by the Levites, for Yahuah hath chosen them to carry it for ever)
--        NT:     none warranted (the priesthood/bearing fulfilled is woven at the due-order thread Heb 12)
--        Extras: none warranted
--        Tanakh: Numbers 4:15, Numbers 7:9, Deuteronomy 10:8, Numbers 18:6-7 (Levi separated to bear and minister)
--   v.11-13 (sanctify yourselves; the breach of Uzza; we sought him not after the due order)
--        NT:     John 4:23-24 (worship in spirit and in truth), Hebrews 12:28-29 (serve acceptably / consuming fire)
--        Extras: none warranted
--        Tanakh: Leviticus 10:1-3 (strange fire / I will be sanctified in them that come nigh), Exodus 19:22 (priests sanctify themselves lest Yahuah break forth)
--   v.15 (the Levites bare the ark upon their shoulders as Moses commanded according to the word of Yahuah)
--        NT/Extras: none warranted ; Tanakh: folded into the due-order thread + the borne-on-shoulders thread (Torah affirmed)
--   v.16-28 (the singers and musicians appointed; the ark brought up with shouting, cornet, trumpets, cymbals, psalteries, harps)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 150:3-6 (praise with trumpet, harp, dance, cymbals), 2 Chronicles 5:12-13 (the singers as one, the house filled), Psalm 47:5 (Elohim gone up with a shout)
--   v.29 (Michal the daughter of Saul saw David dancing and despised him in her heart)
--        NT/Extras: none warranted
--        Tanakh: 2 Samuel 6:14,16,20-23 (David danced before Yahuah; Michal's scorn and barrenness)
--
-- THREADS (4):
--   1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders  [free; Tanakh] anchors 15:2-15
--        — Num 4:15, Num 7:9, Deut 10:8, Num 18:6, Num 18:7 (Torah pattern: Levi separated to bear the ark on the shoulder)
--   1-chronicles-15-we-sought-him-not-after-the-due-order  [free; Tanakh+NT] anchors 15:11-13
--        — Lev 10:1, Lev 10:2, Lev 10:3, Exod 19:22, John 4:23, John 4:24, Heb 12:28, Heb 12:29
--   1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise  [free; Tanakh] anchors 15:16-28
--        — Ps 150:3, Ps 150:4, Ps 150:5, Ps 150:6, 2 Chron 5:12, 2 Chron 5:13, Ps 47:5
--   1-chronicles-15-michal-despised-david-dancing-before-yahuah  [free; Tanakh] anchors 15:29-29
--        — 2 Sam 6:14, 2 Sam 6:16, 2 Sam 6:20, 2 Sam 6:21, 2 Sam 6:22, 2 Sam 6:23
--
-- GUARD: 15:13 "we sought him not after the due order" = the central lesson — Yahuah is approached HIS
-- appointed way (the Ark borne by the Levites on the shoulders, Num 4:15/7:9), not human innovation;
-- 15:15 "as Moses commanded according to the word of Yahuah" = Torah AFFIRMED as the due order, NOT abolished.
-- The ordered joyful singing = the appointed praise; Michal's scorn = the onlooker who despises wholehearted worship.

CREATE TEMP VIEW _s313_chr15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the ark borne by the Levites upon their shoulders (15:2, 15:15)
    ('canon','1-chronicles',15,2,'canon','numbers',4,15,'free',
     E'*And when Aaron and his sons have made an end of covering the sanctuary... after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die. These things are the burden of the sons of Kohath in the tabernacle of the congregation* (Numbers 4:15). David''s ruling that *None ought to carry the ark of Elohim (God) but the Levites* (1 Chronicles 15:2) is no innovation but the Torah pattern reclaimed — the holy ark is the appointed burden of the Levites alone.'),
    ('canon','1-chronicles',15,2,'canon','numbers',7,9,'free',
     E'*But unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). This is the exact form David restores — the ark carried on the shoulder, not on a cart; *for them hath Yahuah (LORD) chosen to carry the ark of Elohim (God), and to minister unto him for ever* (1 Chronicles 15:2).'),
    ('canon','1-chronicles',15,2,'canon','deuteronomy',10,8,'free',
     E'*At that time Yahuah (LORD) separated the tribe of Levi, to bear the ark of the covenant of Yahuah (LORD), to stand before Yahuah (LORD) to minister unto him, and to bless in his name, unto this day* (Deuteronomy 10:8). Bearing the ark AND ministering are the very twin charges David names — *to carry the ark of Elohim (God), and to minister unto him for ever* (1 Chronicles 15:2) — Levi''s standing covenant office.'),
    ('canon','1-chronicles',15,2,'canon','numbers',18,6,'free',
     E'*And I, behold, I have taken your brethren the Levites from among the children of Yashar''el (Israel): to you they are given as a gift for Yahuah (LORD), to do the service of the tabernacle of the congregation* (Numbers 18:6). The Levites are Yahuah''s chosen gift for the sanctuary service — which is why David says *for them hath Yahuah (LORD) chosen to carry the ark* (1 Chronicles 15:2).'),
    ('canon','1-chronicles',15,2,'canon','numbers',18,7,'free',
     E'*Therefore thou and thy sons with thee shall keep your priest''s office for every thing of the altar, and within the vail; and ye shall serve... and the stranger that cometh nigh shall be put to death* (Numbers 18:7). The office is guarded: only the appointed bear and minister; the ark on Uzza''s cart (1 Chronicles 13) had violated this, and David now restores the bearing to the Levites (15:2).'),

    -- Thread 2: we sought him not after the due order (15:13; sanctify 15:11-12)
    ('canon','1-chronicles',15,13,'canon','leviticus',10,1,'free',
     E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1). Strange fire is worship Yahuah *commanded... not* — the same failure as the cart of Uzza; David confesses *we sought him not after the due order* (1 Chronicles 15:13).'),
    ('canon','1-chronicles',15,13,'canon','leviticus',10,2,'free',
     E'*And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:2). As the breach broke out on Uzza, so fire broke out on Nadab and Abihu — Yahuah will not be approached in an unappointed way; hence David''s correction, *for that we sought him not after the due order* (1 Chronicles 15:13).'),
    ('canon','1-chronicles',15,13,'canon','leviticus',10,3,'free',
     E'*Then Moses said unto Aaron, This is it that Yahuah (LORD) spake, saying, I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3). This is the principle behind the due order: those who come nigh must sanctify Yahuah''s way — which is why David charges *sanctify yourselves... that ye may bring up the ark* (1 Chronicles 15:12-13).'),
    ('canon','1-chronicles',15,13,'canon','exodus',19,22,'free',
     E'*And let the priests also, which come near to Yahuah (LORD), sanctify themselves, lest Yahuah (LORD) break forth upon them* (Exodus 19:22). The very verb and warning David echoes — sanctification before drawing near, *lest Yahuah... break forth*; for at the first *Yahuah Eloheinu (the LORD our God) made a breach upon us* (1 Chronicles 15:13).'),
    ('canon','1-chronicles',15,13,'canon','john',4,23,'free',
     E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). The due order is not abolished but deepened — the Father seeks worshippers who approach in His truth, the same heart as David''s *we sought him not after the due order* (1 Chronicles 15:13).'),
    ('canon','1-chronicles',15,13,'canon','john',4,24,'free',
     E'*Elohim (God) is a Spirit: and they that worship him must worship him in spirit and in truth* (John 4:24). Worship is on Yahuah''s terms — *must* — never our own invention; the Chronicler''s lesson that He must be sought *after the due order* (1 Chronicles 15:13) stands fulfilled.'),
    ('canon','1-chronicles',15,13,'canon','hebrews',12,28,'free',
     E'*Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28). Acceptable service with reverence is the New-Covenant name for the due order — approach Yahuah His appointed way, as David learned (1 Chronicles 15:13).'),
    ('canon','1-chronicles',15,13,'canon','hebrews',12,29,'free',
     E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29). The same fire that broke out on Uzza and on Nadab and Abihu still burns — which is why He is sought *after the due order* and not after our own way (1 Chronicles 15:13).'),

    -- Thread 3: the appointed singers and the ordered joyful praise (15:16, 15:28)
    ('canon','1-chronicles',15,16,'canon','psalms',150,3,'free',
     E'*Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3). The instruments David appoints — *psalteries and harps and cymbals* (1 Chronicles 15:16) — are the very furniture of the appointed praise the Psalter crowns its book with.'),
    ('canon','1-chronicles',15,16,'canon','psalms',150,4,'free',
     E'*Praise him with the timbrel and dance: praise him with stringed instruments and organs* (Psalm 150:4). The dance and stringed praise of the closing psalm answers David''s ordered worship — *by lifting up the voice with joy* (1 Chronicles 15:16).'),
    ('canon','1-chronicles',15,16,'canon','psalms',150,5,'free',
     E'*Praise him upon the loud cymbals: praise him upon the high sounding cymbals* (Psalm 150:5). The sounding cymbals David appoints (1 Chronicles 15:16,19) are the same loud cymbals the Psalter summons all breath to take up.'),
    ('canon','1-chronicles',15,28,'canon','psalms',150,6,'free',
     E'*Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD)* (Psalm 150:6). The Psalter''s last word is exactly the scene of the ark brought up — *all Yashar''el (Israel)... with shouting, and with sound of the cornet, and with trumpets, and with cymbals* (1 Chronicles 15:28) — every breath in joined praise.'),
    ('canon','1-chronicles',15,16,'canon','2-chronicles',5,12,'free',
     E'*Also the Levites which were the singers, all of them of Asaph, of Heman, of Jeduthun... having cymbals and psalteries and harps, stood at the east end of the altar, and with them an hundred and twenty priests sounding with trumpets* (2 Chronicles 5:12). The very singers David here appoints — *Heman... Asaph... Ethan* (1 Chronicles 15:17,19) — stand again at Solomon''s temple; the order David set endures.'),
    ('canon','1-chronicles',15,28,'canon','2-chronicles',5,13,'free',
     E'*It came even to pass, as the trumpeters and singers were as one, to make one sound to be heard in praising and thanking Yahuah (LORD)... that then the house was filled with a cloud* (2 Chronicles 5:13). When the appointed praise is one, the Glory descends — the fruit of the order David established when he brought up the ark *with shouting* (1 Chronicles 15:28).'),
    ('canon','1-chronicles',15,28,'canon','psalms',47,5,'free',
     E'*Elohim (God) is gone up with a shout, Yahuah (LORD) with the sound of a trumpet* (Psalm 47:5). The psalm sings the very ascent of the ark — Yahuah enthroned going up *with a shout... with the sound of a trumpet*, exactly as *all Yashar''el (Israel) brought up the ark... with shouting... and with trumpets* (1 Chronicles 15:28).'),

    -- Thread 4: Michal despised David dancing before Yahuah (15:29)
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,14,'free',
     E'*And David danced before Yahuah (LORD) with all his might; and David was girded with a linen ephod* (2 Samuel 6:14). The parallel account names what Michal scorned — the king''s wholehearted, undignified dance; here *king David dancing and playing* (1 Chronicles 15:29).'),
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,16,'free',
     E'*And as the ark of Yahuah (LORD) came into the city of David, Michal Saul''s daughter looked through a window, and saw king David leaping and dancing before Yahuah (LORD); and she despised him in her heart* (2 Samuel 6:16). The same window, the same scorn — the Chronicler echoes it word for word: *Michal the daughter of Saul looking out at a window... she despised him in her heart* (1 Chronicles 15:29).'),
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,20,'free',
     E'*Then David returned to bless his household. And Michal the daughter of Saul came out to meet David, and said, How glorious was the king of Yashar''el (Israel) to day, who uncovered himself to day in the eyes of the handmaids... as one of the vain fellows shamelessly uncovereth himself!* (2 Samuel 6:20). Michal''s scorn turns to open mockery — the onlooker who measures worship by dignity, not by the heart that *despised him* (1 Chronicles 15:29).'),
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,21,'free',
     E'*And David said unto Michal, It was before Yahuah (LORD), which chose me before thy father, and before all his house, to appoint me ruler over the people of Yahuah (LORD), over Yashar''el (Israel): therefore will I play before Yahuah (LORD)* (2 Samuel 6:21). David''s answer vindicates the wholehearted worship the scornful Michal *despised* (1 Chronicles 15:29) — it was *before Yahuah*, unto the One who chose him.'),
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,22,'free',
     E'*And I will yet be more vile than thus, and will be base in mine own sight: and of the maidservants which thou hast spoken of, of them shall I be had in honour* (2 Samuel 6:22). The king will humble himself further still before Yahuah — the opposite spirit of Michal who *despised him in her heart* (1 Chronicles 15:29).'),
    ('canon','1-chronicles',15,29,'canon','2-samuel',6,23,'free',
     E'*Therefore Michal the daughter of Saul had no child unto the day of her death* (2 Samuel 6:23). The barrenness that closes the account is the fruit of the scorn — the despiser of wholehearted worship cut off from the seed; the Chronicler leaves her despising (1 Chronicles 15:29) and Samuel records its end.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders',
       E'The ark borne by the Levites upon their shoulders — the Torah pattern restored',
       E'After the breach upon Uzza (1 Chronicles 13), David returns to the written way: *Then David said, None ought to carry the ark of Elohim (God) but the Levites: for them hath Yahuah (LORD) chosen to carry the ark of Elohim (God), and to minister unto him for ever* (1 Chronicles 15:2). This is no royal innovation but the Torah pattern reclaimed. From the first the ark was Levi''s appointed burden — *after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die* (Numbers 4:15) — and the manner was fixed: *But unto the sons of Kohath he gave none: because the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9). On the shoulder, never on a cart. Levi was set apart for this twin charge of bearing AND ministering: *At that time Yahuah (LORD) separated the tribe of Levi, to bear the ark of the covenant of Yahuah (LORD), to stand before Yahuah (LORD) to minister unto him, and to bless in his name* (Deuteronomy 10:8) — the very words David echoes, *to carry the ark... and to minister unto him for ever*. The Levites are Yahuah''s own gift for the sanctuary, *given as a gift for Yahuah (LORD), to do the service of the tabernacle of the congregation* (Numbers 18:6), and the office is guarded so *the stranger that cometh nigh shall be put to death* (Numbers 18:7). So when *the children of the Levites bare the ark of Elohim (God) upon their shoulders with the staves thereon, as Moses commanded according to the word of Yahuah (LORD)* (1 Chronicles 15:15), the Torah is not abolished but obeyed — it IS the due order.',
       sv.verse_id, ev.verse_id, 'free', 30350
  FROM _s313_chr15_lookup sv, _s313_chr15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=15 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-15-we-sought-him-not-after-the-due-order',
       E'We sought him not after the due order — Yahuah approached His appointed way',
       E'The heart of the chapter is a confession: *For because ye did it not at the first, Yahuah Eloheinu (the LORD our God) made a breach upon us, for that we sought him not after the due order* (1 Chronicles 15:13). The lesson of Uzza is learned — Yahuah must be sought the way HE appointed, not the way that seems good to us. So David first commands sanctification: *sanctify yourselves, both ye and your brethren, that ye may bring up the ark of Yahuah Elohim (the LORD God) of Yashar''el (Israel) unto the place that I have prepared for it* (1 Chronicles 15:12). The Torah had already burned this principle into Yashar''el: *Nadab and Abihu... offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1), and *there went out fire from Yahuah (LORD), and devoured them* (Leviticus 10:2) — for *I will be sanctified in them that come nigh me, and before all the people I will be glorified* (Leviticus 10:3). The warning at Sinai was the same: *let the priests also, which come near to Yahuah (LORD), sanctify themselves, lest Yahuah (LORD) break forth upon them* (Exodus 19:22) — the very *breach* David names. This due order is not cancelled in the New Covenant but deepened: *the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23); *they that worship him must worship him in spirit and in truth* (John 4:24) — worship on Yahuah''s terms, never our invention. So *let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28), *for our Elohim (God) is a consuming fire* (Hebrews 12:29) — the same fire that broke out on Uzza and on Nadab and Abihu still burns. Approach Yahuah His way.',
       sv.verse_id, ev.verse_id, 'free', 30351
  FROM _s313_chr15_lookup sv, _s313_chr15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=15 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise',
       E'The appointed singers and the ordered, joyful praise',
       E'The due order is not cold ceremony but commanded joy. *And David spake to the chief of the Levites to appoint their brethren to be the singers with instruments of musick, psalteries and harps and cymbals, sounding, by lifting up the voice with joy* (1 Chronicles 15:16), and the ark came up *with shouting, and with sound of the cornet, and with trumpets, and with cymbals, making a noise with psalteries and harps* (1 Chronicles 15:28). This appointed praise is exactly what the Psalter crowns its whole book with: *Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3), *Praise him with the timbrel and dance* (Psalm 150:4), *Praise him upon the loud cymbals: praise him upon the high sounding cymbals* (Psalm 150:5), and the final word — *Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD)* (Psalm 150:6). The singers David here names — *Heman... Asaph... Ethan* (1 Chronicles 15:17,19) — stand again in the temple Solomon built: *the Levites which were the singers, all of them of Asaph, of Heman, of Jeduthun... having cymbals and psalteries and harps, stood at the east end of the altar* (2 Chronicles 5:12); and when *the trumpeters and singers were as one, to make one sound... that then the house was filled with a cloud* (2 Chronicles 5:13). When the appointed praise is one, the Glory descends. The psalmist sings the very ascent: *Elohim (God) is gone up with a shout, Yahuah (LORD) with the sound of a trumpet* (Psalm 47:5).',
       sv.verse_id, ev.verse_id, 'free', 30352
  FROM _s313_chr15_lookup sv, _s313_chr15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=15 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-15-michal-despised-david-dancing-before-yahuah',
       E'Michal despised David dancing before Yahuah — the scornful onlooker',
       E'The chapter closes on a contrast: *as the ark of the covenant of Yahuah (LORD) came to the city of David... Michal the daughter of Saul looking out at a window saw king David dancing and playing: and she despised him in her heart* (1 Chronicles 15:29). The fuller account in Samuel names what she scorned: *David danced before Yahuah (LORD) with all his might; and David was girded with a linen ephod* (2 Samuel 6:14) — and *Michal Saul''s daughter looked through a window, and saw king David leaping and dancing before Yahuah (LORD); and she despised him in her heart* (2 Samuel 6:16). Her contempt turned to open mockery: *How glorious was the king of Yashar''el (Israel) to day, who uncovered himself... as one of the vain fellows shamelessly uncovereth himself!* (2 Samuel 6:20). David''s answer vindicates the wholehearted worship she measured by dignity: *It was before Yahuah (LORD), which chose me before thy father... therefore will I play before Yahuah (LORD)* (2 Samuel 6:21), and *I will yet be more vile than thus, and will be base in mine own sight* (2 Samuel 6:22). The account ends in barrenness — *Therefore Michal the daughter of Saul had no child unto the day of her death* (2 Samuel 6:23): the despiser of unashamed worship cut off from the seed. The king who humbles himself before Yahuah is the pattern; the scornful onlooker is the warning.',
       sv.verse_id, ev.verse_id, 'free', 30353
  FROM _s313_chr15_lookup sv, _s313_chr15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=15 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*after that, the sons of Kohath shall come to bear it: but they shall not touch any holy thing, lest they die* (Numbers 4:15) — the ark is Levi''s appointed burden, as David rules in 15:2.'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the service of the sanctuary belonging unto them was that they should bear upon their shoulders* (Numbers 7:9) — on the shoulder, not on a cart, the form David restores (15:2).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) separated the tribe of Levi, to bear the ark... to minister unto him, and to bless in his name* (Deuteronomy 10:8) — bearing AND ministering, the twin charge David names (15:2).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the Levites... given as a gift for Yahuah (LORD), to do the service of the tabernacle* (Numbers 18:6) — Yahuah''s chosen, *for them hath Yahuah... chosen to carry the ark* (15:2).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the stranger that cometh nigh shall be put to death* (Numbers 18:7) — the office is guarded; the cart of Uzza had violated it, and David restores the bearing (15:2).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=2
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-ark-borne-by-the-levites-upon-their-shoulders'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Nadab and Abihu... offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1) — worship Yahuah commanded not, the same failure as the cart (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there went out fire from Yahuah (LORD), and devoured them* (Leviticus 10:2) — as the breach broke out on Uzza, so fire on Nadab and Abihu (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will be sanctified in them that come nigh me* (Leviticus 10:3) — the principle behind the due order, why David charges *sanctify yourselves* (15:12-13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*let the priests... sanctify themselves, lest Yahuah (LORD) break forth upon them* (Exodus 19:22) — the very verb and warning; for *Yahuah... made a breach upon us* (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — the due order deepened, not abolished; the Father seeks such (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they that worship him must worship him in spirit and in truth* (John 4:24) — worship on Yahuah''s terms, *must*, never our invention (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*let us... serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28) — acceptable service, the New-Covenant name for the due order (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29) — the same fire that broke out on Uzza and on Nadab and Abihu still burns (15:13).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-we-sought-him-not-after-the-due-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3) — the very instruments David appoints (15:16).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Praise him with the timbrel and dance* (Psalm 150:4) — the dance and stringed praise answering David''s *voice with joy* (15:16).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Praise him upon the loud cymbals* (Psalm 150:5) — the sounding cymbals David appoints (15:16,19).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Let every thing that hath breath praise Yahuah (LORD)* (Psalm 150:6) — the Psalter''s last word over the ark brought up *with shouting* (15:28).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the Levites which were the singers... of Asaph, of Heman... stood at the east end of the altar* (2 Chronicles 5:12) — the singers David appoints stand again in the temple (15:16-17).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=16
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*as the trumpeters and singers were as one... the house was filled with a cloud* (2 Chronicles 5:13) — when the appointed praise is one, the Glory descends (15:28).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Elohim (God) is gone up with a shout, Yahuah (LORD) with the sound of a trumpet* (Psalm 47:5) — the psalm sings the very ascent of the ark *with shouting... and with trumpets* (15:28).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=47 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-the-appointed-singers-and-the-ordered-joyful-praise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David danced before Yahuah (LORD) with all his might; and David was girded with a linen ephod* (2 Samuel 6:14) — the wholehearted dance Michal scorned (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Michal Saul''s daughter... saw king David leaping and dancing before Yahuah (LORD); and she despised him in her heart* (2 Samuel 6:16) — the parallel echoed word for word (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*How glorious was the king of Yashar''el (Israel) to day, who uncovered himself...* (2 Samuel 6:20) — Michal''s scorn turned to open mockery of the worship (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*It was before Yahuah (LORD), which chose me... therefore will I play before Yahuah (LORD)* (2 Samuel 6:21) — David vindicates the worship Michal despised (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will yet be more vile than thus, and will be base in mine own sight* (2 Samuel 6:22) — the king humbles himself further, the opposite of Michal''s scorn (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Therefore Michal the daughter of Saul had no child unto the day of her death* (2 Samuel 6:23) — the despiser of worship cut off from the seed (15:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s313_chr15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=6 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-15-michal-despised-david-dancing-before-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_16.sql (1 Chronicles 16) -----
-- 1 Chronicles 16 — the Ark set in the tent, and David's psalm of thanksgiving (Ps 105/96/106 woven).
-- session prefix: s313 | tag: chr16 | slug prefix: 1-chronicles-16- | sort band start: 30375
-- source: canon 1-chronicles ch16
--
-- 1 Chronicles 16 coverage:
--   v.1-3  (the ark set in the tent; burnt and peace offerings; David blesses the people, deals bread/flesh/wine)
--        NT/Extras: none warranted
--        Tanakh: folded — the ark-in-the-tent + offerings are the setting; the praise-ministry thread (v.4-7) carries it
--   v.4-7  (David appoints Levites/Asaph to minister, record, thank and praise before the ark)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Chronicles 23:5,30, Psalm 100:4, Psalm 150:3-6 (the ordained ministry of praise) — built
--   v.8-14 (Give thanks, call upon his name, make known his deeds; seek his face; O ye seed of Yashar'el)
--        NT:     none warranted (the covenant-remembered fulfilment is carried at the v.15-22 thread, Luke 1:72-73)
--        Extras: none warranted
--        Tanakh: Psalm 105:1-7 (the source psalm verbatim) — built
--   v.15-22 (Remember his covenant for ever... with Abraham... an everlasting covenant... Touch not mine anointed)
--        NT:     Luke 1:72-73 (to remember his holy covenant; the oath sworn to Abraham) — built
--        Extras: none warranted (Jubilees covenant material weighed; the canon Genesis + Luke witnesses are tighter)
--        Tanakh: Psalm 105:8-15, Genesis 17:7-8, Genesis 26:3 (the everlasting covenant / oath to the fathers) — built
--   v.23-33 (Sing all the earth; declare his glory among the heathen; the gods are idols; Yahuah made the heavens; he cometh to judge)
--        NT:     Revelation 14:7 (worship him that made heaven and earth; the hour of judgment) — built
--        Extras: none warranted
--        Tanakh: Psalm 96:1-13, Isaiah 42:10-12, Psalm 98:9 (the nations called to glorify the Creator and coming Judge) — built
--   v.34-36 (O give thanks... his mercy endureth for ever; Save us, gather us from the heathen; Blessed be Yahuah Elohim of Yashar'el)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Psalm 106:1, Psalm 106:47, Psalm 106:48, Psalm 107:1-3, Deuteronomy 30:3, Ezekiel 36:24 (the ingathering prayer) — built
--   v.37-43 (Asaph left before the ark; Zadok at Gibeon; offerings as written in the law; thanks for his mercy endureth for ever)
--        NT/Extras: none warranted ; Tanakh: 16:40 "as written in the law of Yahuah" = Torah affirmed — woven into the praise-ministry thread
--
-- THREADS (5):
--   1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark  [free; Tanakh] anchors 16:4-7
--        — 1 Chron 23:5, 1 Chron 23:30, Psalm 100:4, Psalm 150:3, Psalm 150:6
--   1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face  [free; Tanakh] anchors 16:8-14
--        — Psalm 105:1, 105:2, 105:3, 105:4, 105:5, 105:7
--   1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers  [free; Tanakh+NT] anchors 16:15-22
--        — Psalm 105:8, 105:10, 105:15, Genesis 17:7, Genesis 26:3, Luke 1:72, Luke 1:73
--   1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge  [free; Tanakh+NT] anchors 16:23-33
--        — Psalm 96:1, 96:5, 96:8, 96:9, 96:13, Isaiah 42:10, Psalm 98:9, Revelation 14:7
--   1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen  [free; Tanakh] anchors 16:34-36
--        — Psalm 106:1, 106:47, 106:48, Psalm 107:1, 107:3, Deuteronomy 30:3, Ezekiel 36:24
--
-- GUARD: David's psalm = the ORDAINED PRAISE of Yahuah, remembering the EVERLASTING COVENANT with Abraham
-- (16:15-18; Luke 1:72-73 — the covenant kept, never abolished; 16:40 "as written in the law of Yahuah" = Torah
-- affirmed). The call to the nations (16:24-33, Rev 14:7) = the Creator and coming Judge glorified, the idols
-- nothing. 16:35 "gather us together, and deliver us from the heathen" = the TWO-HOUSE INGATHERING prayer —
-- gather the scattered people (Ps 106:47, Deut 30:3, Ezek 36:24), the regathering of Yashar'el, NEVER replacement.
-- "His mercy endureth for ever" = the great refrain (16:34,41).

CREATE TEMP VIEW _s313_chr16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the ordained ministry of praise before the ark (16:4, 16:7)
    ('canon','1-chronicles',16,4,'canon','1-chronicles',23,5,'free',
     E'*Moreover four thousand were porters; and four thousand praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith* (1 Chronicles 23:5). David''s appointment here — *he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4) — is the seed of the whole ordained order of Levitical praise he later fixes for the temple.'),
    ('canon','1-chronicles',16,4,'canon','1-chronicles',23,30,'free',
     E'*And to stand every morning to thank and praise Yahuah (LORD), and likewise at even* (1 Chronicles 23:30). The standing charge — *to thank and praise* — morning and evening, is exactly the ministry David first sets before the ark in 16:4; the praise of Yahuah is an appointed, continual office, not a mood.'),
    ('canon','1-chronicles',16,4,'canon','psalms',100,4,'free',
     E'*Enter into his gates with thanksgiving, and into his courts with praise: be thankful unto him, and bless his name* (Psalm 100:4). Thanksgiving and praise are the appointed way into Yahuah''s presence — the very charge David lays on the Levites *to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4).'),
    ('canon','1-chronicles',16,7,'canon','psalms',150,3,'free',
     E'*Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3). The instruments named at the ark — *Asaph... with psalteries and with harps... Asaph made a sound with cymbals... the priests with trumpets continually before the ark* (1 Chronicles 16:5-6) — are the very furniture of the praise the Psalter crowns its whole book with, the day David *delivered first this psalm to thank Yahuah (LORD)* (1 Chronicles 16:7).'),
    ('canon','1-chronicles',16,7,'canon','psalms',150,6,'free',
     E'*Let every thing that hath breath praise Yahuah (LORD). Praise ye Yahuah (LORD)* (Psalm 150:6). The Psalter''s last word is the consummation of the ministry David inaugurates the day he *delivered first this psalm to thank Yahuah (LORD) into the hand of Asaph and his brethren* (1 Chronicles 16:7) — all breath joined in appointed praise.'),

    -- Thread 2: give thanks and make known his deeds; seek his face (16:8, 16:14) = Ps 105:1-7
    ('canon','1-chronicles',16,8,'canon','psalms',105,1,'free',
     E'*O give thanks unto Yahuah (LORD); call upon his name: make known his deeds among the people* (Psalm 105:1). The Chronicler opens David''s psalm with this very line — *Give thanks unto Yahuah (LORD), call upon his name, make known his deeds among the people* (1 Chronicles 16:8) — drawing the song of thanksgiving straight from the Psalter.'),
    ('canon','1-chronicles',16,9,'canon','psalms',105,2,'free',
     E'*Sing unto him, sing psalms unto him: talk ye of all his wondrous works* (Psalm 105:2). Word for word David''s call — *Sing unto him, sing psalms unto him, talk ye of all his wondrous works* (1 Chronicles 16:9) — the appointed praise rehearses Yahuah''s mighty acts aloud.'),
    ('canon','1-chronicles',16,10,'canon','psalms',105,3,'free',
     E'*Glory ye in his holy name: let the heart of them rejoice that seek Yahuah (LORD)* (Psalm 105:3). The joy of those who seek Yahuah is the same in both — *Glory ye in his holy name: let the heart of them rejoice that seek Yahuah (LORD)* (1 Chronicles 16:10).'),
    ('canon','1-chronicles',16,11,'canon','psalms',105,4,'free',
     E'*Seek Yahuah (LORD), and his strength: seek his face evermore* (Psalm 105:4). David''s charge to seek Yahuah continually — *Seek Yahuah (LORD) and his strength, seek his face continually* (1 Chronicles 16:11) — is the Psalter''s own summons to unbroken pursuit of His presence.'),
    ('canon','1-chronicles',16,12,'canon','psalms',105,5,'free',
     E'*Remember his marvellous works that he hath done; his wonders, and the judgments of his mouth* (Psalm 105:5). Identical to David''s line — *Remember his marvellous works that he hath done, his wonders, and the judgments of his mouth* (1 Chronicles 16:12) — praise is rooted in remembrance of what Yahuah has done.'),
    ('canon','1-chronicles',16,14,'canon','psalms',105,7,'free',
     E'*He is Yahuah Eloheinu (the LORD our God): his judgments are in all the earth* (Psalm 105:7). The same confession closes the opening movement — *He is Yahuah Eloheinu (the LORD our God); his judgments are in all the earth* (1 Chronicles 16:14) — Yahuah of the covenant people is Judge over all the earth.'),

    -- Thread 3: remember his covenant for ever; the oath unto the fathers (16:15, 16:22) = Ps 105:8-15 + Gen + Luke
    ('canon','1-chronicles',16,15,'canon','psalms',105,8,'free',
     E'*He hath remembered his covenant for ever, the word which he commanded to a thousand generations* (Psalm 105:8). David''s call — *Be ye mindful always of his covenant; the word which he commanded to a thousand generations* (1 Chronicles 16:15) — turns the Psalm''s testimony that Yahuah remembers His covenant into a charge that His people remember it too; the covenant stands to a thousand generations, never abolished.'),
    ('canon','1-chronicles',16,17,'canon','psalms',105,10,'free',
     E'*And confirmed the same unto Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (Psalm 105:10). Word for word with David — *And hath confirmed the same to Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (1 Chronicles 16:17) — the covenant with the fathers is a LAW and EVERLASTING, the standing inheritance of the seed.'),
    ('canon','1-chronicles',16,22,'canon','psalms',105,15,'free',
     E'*Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15). Identical to David''s line — *Touch not mine anointed, and do my prophets no harm* (1 Chronicles 16:22) — Yahuah Himself guards the covenant patriarchs as they sojourn among the nations, reproving kings for their sakes.'),
    ('canon','1-chronicles',16,16,'canon','genesis',17,7,'free',
     E'*And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* (Genesis 17:7). This is the covenant David bids Yashar''el remember — *Even of the covenant which he made with Abraham, and of his oath unto Isaac* (1 Chronicles 16:16) — an EVERLASTING covenant to Abraham and his seed, the very word the psalm calls a thousand-generation promise.'),
    ('canon','1-chronicles',16,16,'canon','genesis',26,3,'free',
     E'*Sojourn in this land, and I will be with thee, and will bless thee; for unto thee, and unto thy seed, I will give all these countries, and I will perform the oath which I sware unto Abraham thy father* (Genesis 26:3). The oath to Isaac that David names — *and of his oath unto Isaac* (1 Chronicles 16:16) — is Yahuah confirming to the son the sworn promise made to the father, the covenant carried by the paternal seed.'),
    ('canon','1-chronicles',16,15,'canon','luke',1,72,'free',
     E'*To perform the mercy promised to our fathers, and to remember his holy covenant* (Luke 1:72). What David charges his people to remember, Yahuah Himself performs in the day of Messiah — He REMEMBERS *his holy covenant*; the everlasting covenant of 1 Chronicles 16:15-17 is not cancelled but kept and fulfilled.'),
    ('canon','1-chronicles',16,16,'canon','luke',1,73,'free',
     E'*The oath which he sware to our father Abraham* (Luke 1:73). Zacharias names the very oath David''s psalm names — *the covenant which he made with Abraham, and... his oath unto Isaac* (1 Chronicles 16:16) — the sworn promise to the fathers stands, fulfilled in the coming of the Formed Son to the seed of Abraham.'),

    -- Thread 4: sing all the earth; the Creator and coming Judge (16:23, 16:33) = Ps 96 + Isa 42 + Ps 98 + Rev 14
    ('canon','1-chronicles',16,23,'canon','psalms',96,1,'free',
     E'*O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth* (Psalm 96:1). David''s call to universal praise — *Sing unto Yahuah (LORD), all the earth; shew forth from day to day his salvation* (1 Chronicles 16:23) — is drawn straight from this psalm: the whole earth summoned to sing to Yahuah.'),
    ('canon','1-chronicles',16,26,'canon','psalms',96,5,'free',
     E'*For all the gods of the nations are idols: but Yahuah (LORD) made the heavens* (Psalm 96:5). Word for word with David — *For all the gods of the people are idols: but Yahuah (LORD) made the heavens* (1 Chronicles 16:26) — the nations'' gods are nothing; only Yahuah is the Creator, and to Him alone is glory due.'),
    ('canon','1-chronicles',16,29,'canon','psalms',96,8,'free',
     E'*Give unto Yahuah (LORD) the glory due unto his name: bring an offering, and come into his courts* (Psalm 96:8). David''s summons — *Give unto Yahuah (LORD) the glory due unto his name: bring an offering, and come before him* (1 Chronicles 16:29) — calls the kindreds of the people to render Yahuah the glory and worship that belong to Him alone.'),
    ('canon','1-chronicles',16,29,'canon','psalms',96,9,'free',
     E'*O worship Yahuah (LORD) in the beauty of holiness: fear before him, all the earth* (Psalm 96:9). The same call to holy worship closes David''s line — *worship Yahuah (LORD) in the beauty of holiness* (1 Chronicles 16:29) — the nations bidden to fear and worship the true Elohim.'),
    ('canon','1-chronicles',16,33,'canon','psalms',96,13,'free',
     E'*Before Yahuah (LORD): for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness, and the people with his truth* (Psalm 96:13). David''s closing note — *because he cometh to judge the earth* (1 Chronicles 16:33) — sounds the psalm''s great theme: Yahuah comes as righteous Judge, and even the trees of the wood sing at His presence.'),
    ('canon','1-chronicles',16,23,'canon','isaiah',42,10,'free',
     E'*Sing unto Yahuah (LORD) a new song, and his praise from the end of the earth, ye that go down to the sea, and all that is therein; the isles, and the inhabitants thereof* (Isaiah 42:10). The prophet takes up the same summons David sings — *Sing unto Yahuah (LORD), all the earth* (1 Chronicles 16:23) — the ends of the earth and the isles called to a new song of Yahuah''s praise.'),
    ('canon','1-chronicles',16,33,'canon','psalms',98,9,'free',
     E'*Before Yahuah (LORD); for he cometh to judge the earth: with righteousness shall he judge the world, and the people with equity* (Psalm 98:9). The same coming Judge David names — *he cometh to judge the earth* (1 Chronicles 16:33) — before whom the floods clap their hands and the hills are joyful; all creation answers His righteous advent.'),
    ('canon','1-chronicles',16,30,'canon','revelation',14,7,'free',
     E'*Saying with a loud voice, Fear Elohim (God), and give glory to him; for the hour of his judgment is come: and worship him that made heaven, and earth, and the sea, and the fountains of waters* (Revelation 14:7). The everlasting gospel preaches David''s very call — fear Yahuah, give Him glory, and *worship him that made* the heavens (1 Chronicles 16:30, *Fear before him, all the earth*; 16:26, *Yahuah (LORD) made the heavens*) — for the Creator is the coming Judge.'),

    -- Thread 5: his mercy endureth for ever; gather us from the heathen (16:34, 16:36) = Ps 106 + Ps 107 + Deut + Ezek
    ('canon','1-chronicles',16,34,'canon','psalms',106,1,'free',
     E'*Praise ye Yahuah (LORD). O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever* (Psalm 106:1). David''s great refrain — *O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34) — is the opening of Psalm 106, the everlasting-mercy chorus the Chronicler weaves into the song of the ark.'),
    ('canon','1-chronicles',16,35,'canon','psalms',106,47,'free',
     E'*Save us, O Yahuah (LORD) our Elohim (God), and gather us from among the heathen, to give thanks unto thy holy name, and to triumph in thy praise* (Psalm 106:47). This is David''s cry verbatim — *Save us, O Elohim (God) of our salvation, and gather us together, and deliver us from the heathen, that we may give thanks to thy holy name* (1 Chronicles 16:35) — the prayer to GATHER the scattered people from among the nations: the two-house ingathering longing sung at the very height of joy.'),
    ('canon','1-chronicles',16,36,'canon','psalms',106,48,'free',
     E'*Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting to everlasting: and let all the people say, Amen. Praise ye Yahuah (LORD)* (Psalm 106:48). The doxology that closes Psalm 106 closes David''s psalm too — *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) for ever and ever. And all the people said, Amen, and praised Yahuah (LORD)* (1 Chronicles 16:36).'),
    ('canon','1-chronicles',16,34,'canon','psalms',107,1,'free',
     E'*O give thanks unto Yahuah (LORD), for he is good: for his mercy endureth for ever* (Psalm 107:1). The same refrain opens Psalm 107 — the song of the redeemed gathered out of the lands — echoing David''s *for he is good; for his mercy endureth for ever* (1 Chronicles 16:34); the everlasting mercy is the ground of the ingathering.'),
    ('canon','1-chronicles',16,35,'canon','psalms',107,3,'free',
     E'*And gathered them out of the lands, from the east, and from the west, from the north, and from the south* (Psalm 107:3). The very gathering David prays for — *gather us together, and deliver us from the heathen* (1 Chronicles 16:35) — is the redeemed brought home from every quarter, the scattered people of Yahuah regathered.'),
    ('canon','1-chronicles',16,35,'canon','deuteronomy',30,3,'free',
     E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). The Torah promise behind David''s prayer — *gather us together, and deliver us from the heathen* (1 Chronicles 16:35) — Yahuah will gather His scattered people from all the nations; the ingathering is covenant promise, not replacement.'),
    ('canon','1-chronicles',16,35,'canon','ezekiel',36,24,'free',
     E'*For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24). The prophet answers David''s cry — *gather us together, and deliver us from the heathen* (1 Chronicles 16:35) — Yahuah Himself will take His people from among the heathen and bring them home; the two-house regathering of Yashar''el.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark',
       E'The ordained ministry of praise before the ark',
       E'With the ark set in its tent and the offerings made, David does not leave the worship of Yahuah to spontaneity but ORDAINS it: *And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4) — *Asaph the chief... with psalteries and with harps... Asaph made a sound with cymbals... the priests with trumpets continually before the ark of the covenant of Elohim (God)* (1 Chronicles 16:5-6) — and *on that day David delivered first this psalm to thank Yahuah (LORD) into the hand of Asaph and his brethren* (1 Chronicles 16:7). This is the seed of the whole order he later fixes for the temple: *four thousand praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith* (1 Chronicles 23:5), a standing charge *to stand every morning to thank and praise Yahuah (LORD), and likewise at even* (1 Chronicles 23:30). Praise is an appointed, continual office. It is the very way the Psalter says Yahuah is approached: *Enter into his gates with thanksgiving, and into his courts with praise* (Psalm 100:4), *Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3) — until the consummation, *Let every thing that hath breath praise Yahuah (LORD)* (Psalm 150:6). And this ministry stands under the written word, *to do according to all that is written in the law of Yahuah (LORD), which he commanded Yashar''el (Israel)* (1 Chronicles 16:40) — appointed worship, Torah-ordered.',
       sv.verse_id, ev.verse_id, 'free', 30375
  FROM _s313_chr16_lookup sv, _s313_chr16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=16 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face',
       E'Give thanks and make known his deeds — seek his face continually',
       E'The first movement of David''s psalm is the Psalter''s own opening of Psalm 105, drawn in line for line. *Give thanks unto Yahuah (LORD), call upon his name, make known his deeds among the people* (1 Chronicles 16:8) — *O give thanks unto Yahuah (LORD); call upon his name: make known his deeds among the people* (Psalm 105:1). *Sing unto him, sing psalms unto him, talk ye of all his wondrous works* (1 Chronicles 16:9; Psalm 105:2). *Glory ye in his holy name: let the heart of them rejoice that seek Yahuah (LORD)* (1 Chronicles 16:10; Psalm 105:3). The call is to unceasing pursuit of His presence: *Seek Yahuah (LORD) and his strength, seek his face continually* (1 Chronicles 16:11) — *seek his face evermore* (Psalm 105:4). And praise is grounded in remembrance: *Remember his marvellous works that he hath done, his wonders, and the judgments of his mouth* (1 Chronicles 16:12; Psalm 105:5) — addressed to *O ye seed of Yashar''el (Israel) his servant, ye children of Jacob, his chosen ones* (1 Chronicles 16:13), the covenant people. The movement closes in confession: *He is Yahuah Eloheinu (the LORD our God); his judgments are in all the earth* (1 Chronicles 16:14; Psalm 105:7) — the Elohim of the fathers is Judge over all the earth.',
       sv.verse_id, ev.verse_id, 'free', 30376
  FROM _s313_chr16_lookup sv, _s313_chr16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers',
       E'Remember his covenant for ever — the everlasting oath unto the fathers',
       E'At the heart of David''s psalm stands the EVERLASTING COVENANT, and the charge to remember it: *Be ye mindful always of his covenant; the word which he commanded to a thousand generations* (1 Chronicles 16:15) — *He hath remembered his covenant for ever, the word which he commanded to a thousand generations* (Psalm 105:8). It is the covenant with the fathers: *Even of the covenant which he made with Abraham, and of his oath unto Isaac; And hath confirmed the same to Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (1 Chronicles 16:16-17; Psalm 105:9-10). This is the promise of Genesis itself — *I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant* (Genesis 17:7), and the oath confirmed to the son: *I will perform the oath which I sware unto Abraham thy father* (Genesis 26:3) — the covenant carried by the paternal seed AND the sworn word together. Yahuah Himself guarded the patriarchs as they sojourned among the nations: *He suffered no man to do them wrong: yea, he reproved kings for their sakes, Saying, Touch not mine anointed, and do my prophets no harm* (1 Chronicles 16:21-22; Psalm 105:14-15). And this covenant is never abolished but KEPT and fulfilled in the day of Messiah: Yahuah comes *To perform the mercy promised to our fathers, and to remember his holy covenant* (Luke 1:72), *The oath which he sware to our father Abraham* (Luke 1:73). The everlasting covenant stands — to a thousand generations.',
       sv.verse_id, ev.verse_id, 'free', 30377
  FROM _s313_chr16_lookup sv, _s313_chr16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=16 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge',
       E'Sing, all the earth — the Creator and the coming Judge',
       E'The second great movement turns from the covenant people to the nations, drawing in Psalm 96: the whole earth summoned to glorify the true Elohim. *Sing unto Yahuah (LORD), all the earth; shew forth from day to day his salvation. Declare his glory among the heathen* (1 Chronicles 16:23-24) — *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth* (Psalm 96:1). The reason is that the nations'' gods are nothing and Yahuah alone is Maker: *For all the gods of the people are idols: but Yahuah (LORD) made the heavens* (1 Chronicles 16:26; Psalm 96:5). So the kindreds of the people are called to render Him what is His: *Give unto Yahuah (LORD) the glory due unto his name: bring an offering, and come before him: worship Yahuah (LORD) in the beauty of holiness* (1 Chronicles 16:29; Psalm 96:8-9). The prophet takes up the same new song from the ends of the earth — *Sing unto Yahuah (LORD) a new song... the isles, and the inhabitants thereof* (Isaiah 42:10). And the song ends on His advent as Judge: *Then shall the trees of the wood sing out at the presence of Yahuah (LORD), because he cometh to judge the earth* (1 Chronicles 16:33) — *for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness* (Psalm 96:13); *with righteousness shall he judge the world, and the people with equity* (Psalm 98:9). The everlasting gospel preaches this very call to the last generation: *Fear Elohim (God), and give glory to him; for the hour of his judgment is come: and worship him that made heaven, and earth* (Revelation 14:7) — the Creator IS the coming Judge.',
       sv.verse_id, ev.verse_id, 'free', 30378
  FROM _s313_chr16_lookup sv, _s313_chr16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=16 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen',
       E'His mercy endureth for ever — gather us from the heathen',
       E'David''s psalm climbs to its close on the great refrain and the deepest cry. The refrain: *O give thanks unto Yahuah (LORD); for he is good; for his mercy endureth for ever* (1 Chronicles 16:34) — the opening of Psalm 106, *for he is good: for his mercy endureth for ever* (Psalm 106:1), the chorus Yahuah''s mercy never fails. Then, at the very height of joy with the ark, the cry of the scattered people breaks out: *And say ye, Save us, O Elohim (God) of our salvation, and gather us together, and deliver us from the heathen, that we may give thanks to thy holy name, and glory in thy praise* (1 Chronicles 16:35) — verbatim from *Save us, O Yahuah (LORD) our Elohim (God), and gather us from among the heathen* (Psalm 106:47). This is the two-house ingathering prayer: gather the scattered, bring home the dispersed. The Psalter answers it in the song of the redeemed — *And gathered them out of the lands, from the east, and from the west, from the north, and from the south* (Psalm 107:3) — and the Torah and the prophets ground it in covenant promise: *Yahuah Elohayka (the LORD thy God)... will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3); *I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24). The regathering of Yashar''el, never replacement. The psalm closes as Psalm 106 closes — *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) for ever and ever. And all the people said, Amen, and praised Yahuah (LORD)* (1 Chronicles 16:36; Psalm 106:48).',
       sv.verse_id, ev.verse_id, 'free', 30379
  FROM _s313_chr16_lookup sv, _s313_chr16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=16 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1: the ordained ministry of praise before the ark
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*four thousand praised Yahuah (LORD) with the instruments which I made, said David, to praise therewith* (1 Chronicles 23:5) — David''s ordained order of Levitical praise, seeded at the ark (16:4).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*to stand every morning to thank and praise Yahuah (LORD), and likewise at even* (1 Chronicles 23:30) — praise a continual, appointed office, the charge David first lays in 16:4.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=23 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Enter into his gates with thanksgiving, and into his courts with praise* (Psalm 100:4) — thanksgiving the appointed way into His presence, the charge to *thank and praise* (16:4).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=100 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Praise him with the sound of the trumpet: praise him with the psaltery and harp* (Psalm 150:3) — the very instruments at the ark (16:5-6), the day David delivered the psalm (16:7).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Let every thing that hath breath praise Yahuah (LORD)* (Psalm 150:6) — the consummation of the ministry David inaugurates at the ark (16:7).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=150 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-the-ordained-ministry-of-praise-before-the-ark'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: give thanks and make known his deeds; seek his face
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*O give thanks unto Yahuah (LORD); call upon his name: make known his deeds among the people* (Psalm 105:1) — the source line David opens with (16:8).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Sing unto him, sing psalms unto him: talk ye of all his wondrous works* (Psalm 105:2) — word for word with 16:9; praise rehearses His mighty acts.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=9
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Glory ye in his holy name: let the heart of them rejoice that seek Yahuah (LORD)* (Psalm 105:3) — the joy of the seekers, identical to 16:10.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Seek Yahuah (LORD), and his strength: seek his face evermore* (Psalm 105:4) — the call to unbroken pursuit of His presence (16:11).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=11
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Remember his marvellous works that he hath done; his wonders, and the judgments of his mouth* (Psalm 105:5) — praise rooted in remembrance, identical to 16:12.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=12
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*He is Yahuah Eloheinu (the LORD our God): his judgments are in all the earth* (Psalm 105:7) — the Elohim of the covenant people is Judge of all the earth, identical to 16:14.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-give-thanks-and-make-known-his-deeds-seek-his-face'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: remember his covenant for ever; the oath unto the fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He hath remembered his covenant for ever, the word which he commanded to a thousand generations* (Psalm 105:8) — the covenant to a thousand generations David bids them remember (16:15).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And confirmed the same unto Jacob for a law, and to Yashar''el (Israel) for an everlasting covenant* (Psalm 105:10) — the covenant a LAW and EVERLASTING, identical to 16:17.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=17
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Saying, Touch not mine anointed, and do my prophets no harm* (Psalm 105:15) — Yahuah guards the patriarchs among the nations, identical to 16:22.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=22
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will establish my covenant... for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* (Genesis 17:7) — the everlasting covenant to Abraham David names (16:16).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=16
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will perform the oath which I sware unto Abraham thy father* (Genesis 26:3) — the oath unto Isaac David names, the promise carried by the paternal seed (16:16).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=16
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*To perform the mercy promised to our fathers, and to remember his holy covenant* (Luke 1:72) — the covenant David bids remembered, Yahuah Himself keeps in Messiah (16:15).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=72
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*The oath which he sware to our father Abraham* (Luke 1:73) — the very oath David''s psalm names, fulfilled in the coming of the Formed Son (16:16).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=16
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=73
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-remember-his-covenant-for-ever-the-oath-unto-the-fathers'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: sing all the earth; the Creator and coming Judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth* (Psalm 96:1) — the source of David''s call to universal praise (16:23).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For all the gods of the nations are idols: but Yahuah (LORD) made the heavens* (Psalm 96:5) — the idols nothing, Yahuah the Creator, identical to 16:26.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=26
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Give unto Yahuah (LORD) the glory due unto his name: bring an offering, and come into his courts* (Psalm 96:8) — render Him the glory due, identical to 16:29.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*O worship Yahuah (LORD) in the beauty of holiness: fear before him, all the earth* (Psalm 96:9) — holy worship, the same call David sounds in 16:29.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*for he cometh, for he cometh to judge the earth: he shall judge the world with righteousness* (Psalm 96:13) — the coming righteous Judge, David''s closing note (16:33).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=33
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Sing unto Yahuah (LORD) a new song... the isles, and the inhabitants thereof* (Isaiah 42:10) — the prophet takes up the same summons from the ends of the earth (16:23).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*for he cometh to judge the earth: with righteousness shall he judge the world, and the people with equity* (Psalm 98:9) — the same coming Judge before whom all creation answers (16:33).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=33
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Fear Elohim (God), and give glory to him... and worship him that made heaven, and earth* (Revelation 14:7) — the everlasting gospel preaches David''s very call to the Creator-Judge (16:30,26).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=30
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-sing-all-the-earth-the-creator-and-coming-judge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: his mercy endureth for ever; gather us from the heathen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*O give thanks unto Yahuah (LORD); for he is good: for his mercy endureth for ever* (Psalm 106:1) — the great refrain David opens his close with (16:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Save us, O Yahuah (LORD) our Elohim (God), and gather us from among the heathen* (Psalm 106:47) — the two-house ingathering cry, verbatim with 16:35.'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=35
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting to everlasting: and let all the people say, Amen* (Psalm 106:48) — the doxology that closes both psalms (16:36).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=36
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*O give thanks unto Yahuah (LORD), for he is good: for his mercy endureth for ever* (Psalm 107:1) — the same refrain opening the song of the gathered redeemed (16:34).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=34
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And gathered them out of the lands, from the east, and from the west, from the north, and from the south* (Psalm 107:3) — the scattered brought home from every quarter, the gathering David prays (16:35).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=35
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3) — the Torah promise of regathering behind David''s prayer (16:35).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=35
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24) — the prophet answers David''s cry; the two-house regathering of Yashar''el (16:35).'
  FROM cross_reference_threads t
  JOIN _s313_chr16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=16 AND sv.verse_number=35
  JOIN _s313_chr16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-16-his-mercy-endureth-for-ever-gather-us-from-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_17.sql (1 Chronicles 17) -----
-- Book: 1 Chronicles  Chapter: 17  Tag: chr17  Session prefix: s313
-- Temp view: _s313_chr17_lookup   Slug prefix: 1-chronicles-17-...
-- Sort band: 30400-30405 (6 threads)
-- ★★★ KEYSTONE CHAPTER — THE DAVIDIC COVENANT (parallel 2 Samuel 7).
--
-- FRAMING NOTE (Davidic covenant / Father-Son Christology):
--   The everlasting throne and the SEED whose kingdom is established for ever (17:11-14) is
--   fulfilled in the Messiah, the Son of David — the seed whose kingdom has NO END (Luke 1:32-33,
--   Acts 2:30, Isa 9:7, Jer 23:5). "I will be his father, and he shall be my son" (17:13) is framed
--   per the Formed/Formless Christology: the Davidic Son IS the Formed Son who HAS a Father (Heb 1:5,
--   Ps 2:7) — NOT co-equal-trinitarian persons, NOT Arian-created. The redeemed people Yahuah made
--   his own for ever (17:21-22) = the covenant people, never replaced (Exod 19:5-6, Deut 7:6-8,
--   Titus 2:14). The Chronicler OMITS the 2 Sam 7:14b "if he commit iniquity, I will chasten him" —
--   foregrounding the Messianic permanence of the established-for-ever throne (parallel 2 Sam 7:12-16).
--
-- 1 Chronicles 17 coverage:
--   v.1-6  (cedar house / Yahuah dwelt in a tent)
--          NT:     Acts 7:48-49 (El Elyon dwelleth not in temples made with hands)
--          Extras: none warranted
--          Tanakh: 2 Sam 7:5-7 (parallel), Isa 66:1 (heaven my throne)
--   v.7-10 (took thee from the sheepcote to be ruler over my people)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Ps 78:70-71 (took David from the sheepfolds), 2 Sam 7:8 (parallel)
--   v.11-12,14 ★★★ (raise up thy seed / establish his kingdom / his throne for ever)
--          NT:     Luke 1:32-33 (throne of his father David, no end), Acts 2:30 (raise up Messiah on his throne), John 7:42 (Messiah of the seed of David)
--          Extras: Sirach 47:11 (covenant of kings, throne of glory for ever), Sirach 47:22 (mercy never abolished, a root to David), 1 Macc 2:57 (throne of an everlasting kingdom)
--          Tanakh: 2 Sam 7:12-13,16 (parallel), Ps 89:3-4,34-37 (covenant with David), Ps 132:11 (fruit of thy body on thy throne), Isa 9:6-7 (throne of David established for ever), Jer 23:5 (righteous Branch)
--   v.13   ★ (I will be his father, and he shall be my son)
--          NT:     Heb 1:5 (I will be to him a Father, he shall be to me a Son)
--          Extras: none warranted
--          Tanakh: 2 Sam 7:14 (parallel), Ps 2:7 (Thou art my Son; this day have I begotten thee)
--   v.20-22 (the people Yahuah went to redeem to be his own for ever)
--          NT:     Titus 2:14 (redeem us... a peculiar people)
--          Extras: none warranted
--          Tanakh: 2 Sam 7:22-24 (parallel), Deut 7:6-8 (a special people, redeemed), Exod 19:5-6 (peculiar treasure, kingdom of priests)
--   v.16-19,23-27 ★ (David's prayer: Who am I... let it be established for ever)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Sam 7:18 (parallel: Who am I), 2 Sam 7:29 (bless the house of thy servant for ever), Ps 8:4 (what is man that thou art mindful of him)
--
-- Threads (slug -> target libraries):
--   1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent        [Tanakh + NT]            free
--   1-chronicles-17-i-took-thee-from-the-sheepcote-to-rule-my-people          [Tanakh]                 free
--   1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david     [Tanakh + NT + Extras]   extras  ★★★
--   1-chronicles-17-i-will-be-his-father-and-he-shall-be-my-son               [Tanakh + NT]            free    ★
--   1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever         [Tanakh + NT]            free
--   1-chronicles-17-who-am-i-davids-prayer-let-it-be-established-for-ever      [Tanakh]                 free

-- ============================================================================
-- A. TEMP VIEW
-- ============================================================================
CREATE TEMP VIEW _s313_chr17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- B. cross_references
-- ============================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- ---- Thread 1: house of cedar / Yahuah dwelt in a tent (17:1-6) ----
  ('canon','1-chronicles',17,1,'canon','2-samuel',7,5,'free',
   E'*Go and tell my servant David, Thus saith Yahuah (LORD), Shalt thou build me an house for me to dwell in?* (2 Samuel 7:5). The Chronicler''s *Lo, I dwell in an house of cedars, but the ark of the covenant of Yahuah (LORD) remaineth under curtains* (1 Chronicles 17:1) is the same scene retold — David''s desire to house the ark, met by Yahuah''s answering question through Nathan.'),
  ('canon','1-chronicles',17,5,'canon','2-samuel',7,6,'free',
   E'*Whereas I have not dwelt in any house since the time that I brought up the children of Yashar''el (Israel) out of Egypt, even to this day, but have walked in a tent and in a tabernacle* (2 Samuel 7:6). The parallel of *I have not dwelt in an house since the day that I brought up Yashar''el (Israel) unto this day; but have gone from tent to tent* (1 Chronicles 17:5) — Yahuah was never confined to a cedar house; He walked with His people in the tent.'),
  ('canon','1-chronicles',17,6,'canon','2-samuel',7,7,'free',
   E'*In all the places wherein I have walked with all the children of Yashar''el (Israel) spake I a word with any of the tribes of Yashar''el (Israel), whom I commanded to feed my people Yashar''el (Israel), saying, Why build ye not me an house of cedar?* (2 Samuel 7:7). The Chronicler''s *spake I a word to any of the judges of Yashar''el (Israel)... Why have ye not built me an house of cedars?* (1 Chronicles 17:6) — Yahuah never demanded a house; the initiative is His grace, not man''s offering.'),
  ('canon','1-chronicles',17,4,'canon','isaiah',66,1,'free',
   E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). When Yahuah says *Thou shalt not build me an house to dwell in* (1 Chronicles 17:4), the prophet unfolds why — the Most High is not contained by cedar walls; the heavens cannot hold Him.'),
  ('canon','1-chronicles',17,4,'canon','acts',7,48,'free',
   E'*Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet* (Acts 7:48). Stephen quotes this very refusal forward — *Thou shalt not build me an house to dwell in* (1 Chronicles 17:4) — to rebuke a generation that had made the temple an idol; Yahuah was never housed by hands.'),
  ('canon','1-chronicles',17,4,'canon','acts',7,49,'free',
   E'*Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49). Stephen cites Isaiah''s answer to David''s desire — the Formless One *Thou shalt not build me an house to dwell in* (1 Chronicles 17:4) fills heaven and earth; no cedar can be His rest.'),

  -- ---- Thread 2: took thee from the sheepcote (17:7-10) ----
  ('canon','1-chronicles',17,7,'canon','psalms',78,70,'free',
   E'*He chose David also his servant, and took him from the sheepfolds* (Psalm 78:70). The psalm sings the same election: *I took thee from the sheepcote, even from following the sheep, that thou shouldest be ruler over my people Yashar''el (Israel)* (1 Chronicles 17:7) — Yahuah raises the shepherd-boy to shepherd the nation.'),
  ('canon','1-chronicles',17,7,'canon','psalms',78,71,'free',
   E'*From following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71). The Chronicler''s *from following the sheep, that thou shouldest be ruler over my people Yashar''el (Israel)* (1 Chronicles 17:7) is the shepherd-king pattern that prefigures the Good Shepherd of the seed of David.'),
  ('canon','1-chronicles',17,7,'canon','2-samuel',7,8,'free',
   E'*Thus saith Yahuah Tseva''ot (LORD of hosts), I took thee from the sheepcote, from following the sheep, to be ruler over my people, over Yashar''el (Israel)* (2 Samuel 7:8, as the parallel records). The same word of grace — *I took thee from the sheepcote* (1 Chronicles 17:7) — frames the whole covenant as Yahuah''s sovereign choosing, not David''s climbing.'),

  -- ---- Thread 3 ★★★: I will establish his throne for ever — the seed, the Son of David (17:11-12,14) ----
  ('canon','1-chronicles',17,11,'canon','2-samuel',7,12,'free',
   E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The parallel of *I will raise up thy seed after thee, which shall be of thy sons; and I will establish his kingdom* (1 Chronicles 17:11) — the SEED of David through whom the everlasting throne comes.'),
  ('canon','1-chronicles',17,12,'canon','2-samuel',7,13,'free',
   E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The Chronicler''s *He shall build me an house, and I will stablish his throne for ever* (1 Chronicles 17:12) — the son builds the house, but Yahuah builds the throne, and that throne stands for ever.'),
  ('canon','1-chronicles',17,14,'canon','2-samuel',7,16,'free',
   E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The Chronicler intensifies it — *I will settle him in mine house and in my kingdom for ever: and his throne shall be established for evermore* (1 Chronicles 17:14): it is YAHUAH''S house and YAHUAH''S kingdom that the Son is settled in for ever.'),
  ('canon','1-chronicles',17,11,'canon','psalms',89,3,'free',
   E'*I have made a covenant with my chosen, I have sworn unto David my servant* (Psalm 89:3). The promise *I will raise up thy seed after thee... and I will establish his kingdom* (1 Chronicles 17:11) is the very covenant the psalmist sings — an oath sworn, not a treaty negotiated.'),
  ('canon','1-chronicles',17,11,'canon','psalms',89,4,'free',
   E'*Thy seed will I establish for ever, and build up thy throne to all generations. Selah* (Psalm 89:4). The covenant word *I will raise up thy seed after thee* (1 Chronicles 17:11) is sworn perpetual — the throne built up to all generations, fulfilled in the seed whose kingdom has no end.'),
  ('canon','1-chronicles',17,14,'canon','psalms',89,34,'free',
   E'*My covenant will I not break, nor alter the thing that is gone out of my lips* (Psalm 89:34). When Yahuah says *his throne shall be established for evermore* (1 Chronicles 17:14), the psalmist seals it — the word once gone out of His lips cannot be altered.'),
  ('canon','1-chronicles',17,14,'canon','psalms',89,36,'free',
   E'*His seed shall endure for ever, and his throne as the sun before me* (Psalm 89:36). The *throne... established for evermore* (1 Chronicles 17:14) endures as the sun — the unbreakable permanence of the Davidic seed-throne.'),
  ('canon','1-chronicles',17,14,'canon','psalms',89,37,'free',
   E'*It shall be established for ever as the moon, and as a faithful witness in heaven. Selah* (Psalm 89:37). The throne *established for evermore* (1 Chronicles 17:14) is fixed in heaven itself, a faithful witness — Yahuah''s own faithfulness underwriting the everlasting kingdom.'),
  ('canon','1-chronicles',17,11,'canon','psalms',132,11,'free',
   E'*Yahuah (LORD) hath sworn in truth unto David; he will not turn from it; Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). The oath *I will raise up thy seed after thee, which shall be of thy sons* (1 Chronicles 17:11) — the fruit of David''s own body set upon the throne, the lineage carrying the promise.'),
  ('canon','1-chronicles',17,14,'canon','isaiah',9,7,'free',
   E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever. The zeal of Yahuah Tseva''ot (LORD of hosts) will perform this* (Isaiah 9:7). The *throne... established for evermore* (1 Chronicles 17:14) is the throne of David Isaiah sees filled by the Child born, the Son given — a kingdom with no end.'),
  ('canon','1-chronicles',17,14,'canon','isaiah',9,6,'free',
   E'*For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). The everlasting throne of *my kingdom for ever* (1 Chronicles 17:14) belongs to this promised Son — the Formed One who bears the Name and carries the government.'),
  ('canon','1-chronicles',17,11,'canon','jeremiah',23,5,'free',
   E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The *seed after thee, which shall be of thy sons* (1 Chronicles 17:11) is the righteous Branch — the Davidic King raised up to reign in righteousness.'),
  ('canon','1-chronicles',17,12,'canon','luke',1,32,'free',
   E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The promise *I will stablish his throne for ever* (1 Chronicles 17:12) is fulfilled when Gabriel announces the throne of David given to the Son — the covenant kept across the centuries.'),
  ('canon','1-chronicles',17,14,'canon','luke',1,33,'free',
   E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The Chronicler''s *his throne shall be established for evermore* (1 Chronicles 17:14) lands here: the Son of David reigns over the house of Jacob for ever, a kingdom with no end — both houses gathered under the one everlasting throne.'),
  ('canon','1-chronicles',17,11,'canon','acts',2,30,'free',
   E'*Therefore being a prophet, and knowing that Elohim (God) had sworn with an oath to him, that of the fruit of his loins, according to the flesh, he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30). Peter names this covenant by name — *I will raise up thy seed after thee, which shall be of thy sons* (1 Chronicles 17:11) — the sworn oath fulfilled in the Messiah raised to David''s throne.'),
  ('canon','1-chronicles',17,11,'canon','john',7,42,'free',
   E'*Hath not the scripture said, That Messiah (Christ) cometh of the seed of David, and out of the town of Bethlehem, where David was?* (John 7:42). The crowd knew the covenant — *thy seed after thee, which shall be of thy sons* (1 Chronicles 17:11) — the Messiah must come of the seed of David, the lineage the promise rides.'),
  ('canon','1-chronicles',17,12,'apocrypha','ecclesiasticus',47,11,'extras',
   E'*Yahuah (God) took away his sins, and exalted his horn for ever: he gave him a covenant of kings, and a throne of glory in Yashar''el (Israel)* (Sirach 47:11). Ben Sira remembers the covenant exactly — *I will stablish his throne for ever* (1 Chronicles 17:12) — a covenant of kings and a throne of glory given to David in Israel.'),
  ('canon','1-chronicles',17,14,'apocrypha','ecclesiasticus',47,22,'extras',
   E'*But Yahuah (God) will never leave off his mercy, neither shall any of his works perish... wherefore he gave a remnant to Jacob, and out of him a root to David* (Sirach 47:22). The covenant''s mercy *his throne shall be established for evermore* (1 Chronicles 17:14) endures because Yahuah never leaves off His mercy — the root to David preserved, a remnant kept to Jacob.'),
  ('canon','1-chronicles',17,14,'apocrypha','1-maccabees',2,57,'extras',
   E'*David for being merciful possessed the throne of an everlasting kingdom* (1 Maccabees 2:57). Mattathias rehearses the fathers to his sons, and David''s portion is named for what it is — *his throne shall be established for evermore* (1 Chronicles 17:14): the throne of an everlasting kingdom.'),

  -- ---- Thread 4 ★: I will be his father, and he shall be my son (17:13) ----
  ('canon','1-chronicles',17,13,'canon','2-samuel',7,14,'free',
   E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14). The Chronicler quotes the same Father-Son word — *I will be his father, and he shall be my son* (1 Chronicles 17:13) — but OMITS the chastening clause, foregrounding the Messianic Son in whom no iniquity is found and whose throne is permanent.'),
  ('canon','1-chronicles',17,13,'canon','psalms',2,7,'free',
   E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The covenant word *I will be his father, and he shall be my son* (1 Chronicles 17:13) is sung as the royal decree — the begotten Son set upon Zion, the Formed Son who has a Father.'),
  ('canon','1-chronicles',17,13,'canon','hebrews',1,5,'free',
   E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The apostle quotes 1 Chronicles 17:13 (with 2 Samuel 7:14) by name — *I will be his father, and he shall be my son* — to set the Davidic Son above all angels: the Formed Son who HAS a Father, not a co-equal person and not a created one, but the begotten Heir of the everlasting throne.'),

  -- ---- Thread 5: the people Yahuah redeemed to be his own for ever (17:20-22) ----
  ('canon','1-chronicles',17,20,'canon','2-samuel',7,22,'free',
   E'*Wherefore thou art great, O Yahuah Elohim (LORD God): for there is none like thee, neither is there any Elohim (God) beside thee, according to all that we have heard with our ears* (2 Samuel 7:22). David''s confession *there is none like thee, neither is there any Elohim (God) beside thee* (1 Chronicles 17:20) is the same — the incomparable One who made Israel His own.'),
  ('canon','1-chronicles',17,21,'canon','2-samuel',7,23,'free',
   E'*And what one nation in the earth is like thy people, even like Yashar''el (Israel), whom Elohim (God) went to redeem for a people to himself... which thou redeemedst to thee from Egypt* (2 Samuel 7:23). The parallel of *what one nation in the earth is like thy people Yashar''el (Israel), whom Elohim (God) went to redeem to be his own people... whom thou hast redeemed out of Egypt* (1 Chronicles 17:21) — Israel set apart by redemption, not by merit.'),
  ('canon','1-chronicles',17,22,'canon','2-samuel',7,24,'free',
   E'*For thou hast confirmed to thyself thy people Yashar''el (Israel) to be a people unto thee for ever: and thou, Yahuah (LORD), art become their Elohim (God)* (2 Samuel 7:24). The Chronicler''s *thy people Yashar''el (Israel) didst thou make thine own people for ever; and thou, Yahuah (LORD), becamest their Elohim (God)* (1 Chronicles 17:22) — the people made His OWN for ever, the covenant bond that is never dissolved.'),
  ('canon','1-chronicles',17,21,'canon','deuteronomy',7,6,'free',
   E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The nation *whom Elohim (God) went to redeem to be his own people* (1 Chronicles 17:21) is the special people chosen above all — election rooted in love, not numbers.'),
  ('canon','1-chronicles',17,21,'canon','deuteronomy',7,8,'free',
   E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen* (Deuteronomy 7:8). The redemption *whom thou hast redeemed out of Egypt* (1 Chronicles 17:21) flows from Yahuah''s love and His oath to the fathers — the same seed-promise carrying the people out of bondage.'),
  ('canon','1-chronicles',17,21,'canon','exodus',19,5,'free',
   E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). The people Yahuah *went to redeem to be his own people* (1 Chronicles 17:21) are His peculiar treasure — the redeemed nation bound to obey His voice and keep His covenant.'),
  ('canon','1-chronicles',17,21,'canon','titus',2,14,'free',
   E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The redemption that made Israel *his own people* (1 Chronicles 17:21) is the same redeeming purpose carried forward — a peculiar people purified and made zealous for the works of the covenant, never a people replaced.'),

  -- ---- Thread 6 ★: David's prayer — Who am I... let it be established for ever (17:16-27) ----
  ('canon','1-chronicles',17,16,'canon','2-samuel',7,18,'free',
   E'*Then went king David in, and sat before Yahuah (LORD), and he said, Who am I, O Yahuah (Lord) GOD? and what is my house, that thou hast brought me hitherto?* (2 Samuel 7:18). The parallel of *David the king came and sat before Yahuah (LORD), and said, Who am I, O Yahuah Elohim (LORD God), and what is mine house, that thou hast brought me hitherto?* (1 Chronicles 17:16) — the king lays down his crown in wonder before the covenant.'),
  ('canon','1-chronicles',17,16,'canon','psalms',8,4,'free',
   E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). David''s prayer *Who am I, O Yahuah Elohim (LORD God)... that thou hast brought me hitherto?* (1 Chronicles 17:16) is the same humbled wonder — that the Most High should be mindful of the son of Adam at all.'),
  ('canon','1-chronicles',17,27,'canon','2-samuel',7,29,'free',
   E'*Therefore now let it please thee to bless the house of thy servant, that it may continue for ever before thee... and with thy blessing let the house of thy servant be blessed for ever* (2 Samuel 7:29). David''s closing prayer *let it please thee to bless the house of thy servant, that it may be before thee for ever... and it shall be blessed for ever* (1 Chronicles 17:27) — faith taking hold of the promise, asking Yahuah to do as He has said.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- C. cross_reference_threads
-- ============================================================================
-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent',
  E'Yahuah dwelt not in a house of cedar, but in a tent',
  E'David''s heart is right but his plan is not Yahuah''s: *Lo, I dwell in an house of cedars, but the ark of the covenant of Yahuah (LORD) remaineth under curtains* (1 Chronicles 17:1). Through Nathan the answer comes — *Thou shalt not build me an house to dwell in: For I have not dwelt in an house since the day that I brought up Yashar''el (Israel) unto this day; but have gone from tent to tent* (1 Chronicles 17:4-5). The parallel records it the same: *I have not dwelt in any house since the time that I brought up the children of Yashar''el (Israel) out of Egypt... but have walked in a tent and in a tabernacle* (2 Samuel 7:6), and *Why build ye not me an house of cedar?* — a word Yahuah never spoke (2 Samuel 7:7; 1 Chronicles 17:6). The prophet unfolds the reason: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1). Stephen carries it forward against a generation that idolized the temple — *the El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48), *Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49). Yahuah is not housed by hands; the initiative of grace is His, and He will build David a house, not the reverse.',
  sv.verse_id, ev.verse_id, 'free', 30400
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-i-took-thee-from-the-sheepcote-to-rule-my-people',
  E'I took thee from the sheepcote to rule my people',
  E'Before the covenant comes the reminder of grace already given: *Thus saith Yahuah Tseva''ot (LORD of hosts), I took thee from the sheepcote, even from following the sheep, that thou shouldest be ruler over my people Yashar''el (Israel)* (1 Chronicles 17:7). The psalm sings the same election — *He chose David also his servant, and took him from the sheepfolds: From following the ewes great with young he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:70-71). The parallel word stands too: *I took thee from the sheepcote, from following the sheep, to be ruler over my people* (2 Samuel 7:8). David did not seize the throne; Yahuah lifted the shepherd-boy to shepherd the nation — and the shepherd-king is the pattern fulfilled in the Good Shepherd of the seed of David, who feeds the flock and gathers the scattered of both houses.',
  sv.verse_id, ev.verse_id, 'free', 30401
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 ★★★
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david',
  E'I will establish his throne for ever — the seed, the Son of David',
  E'This is the covenant the whole canon rides upon: *I will raise up thy seed after thee, which shall be of thy sons; and I will establish his kingdom. He shall build me an house, and I will stablish his throne for ever... I will settle him in mine house and in my kingdom for ever: and his throne shall be established for evermore* (1 Chronicles 17:11-12,14). The parallel sets it down the same — *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12), *I will stablish the throne of his kingdom for ever* (2 Samuel 7:13), *thy throne shall be established for ever* (2 Samuel 7:16). The psalms guard it as a sworn oath: *I have made a covenant with my chosen, I have sworn unto David my servant... Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:3-4); *My covenant will I not break, nor alter the thing that is gone out of my lips... His seed shall endure for ever, and his throne as the sun before me... and as a faithful witness in heaven* (Psalm 89:34,36-37); *Yahuah (LORD) hath sworn in truth unto David; he will not turn from it; Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). The prophets name the heir — *I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5), and Isaiah sees the throne filled forever: *For unto us a child is born, unto us a son is given... Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom... even for ever* (Isaiah 9:6-7). And the seed comes: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33); Peter declares the oath kept — *Elohim (God) had sworn with an oath to him, that of the fruit of his loins... he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30); even the crowd knew it — *Messiah (Christ) cometh of the seed of David* (John 7:42). The restored witnesses remembered it too: *he gave him a covenant of kings, and a throne of glory in Yashar''el (Israel)* (Sirach 47:11); *Yahuah (God) will never leave off his mercy... wherefore he gave a remnant to Jacob, and out of him a root to David* (Sirach 47:22); *David for being merciful possessed the throne of an everlasting kingdom* (1 Maccabees 2:57). The Chronicler foregrounds the Messianic permanence — the seed whose kingdom has NO END, the everlasting throne fulfilled in the Messiah, the Son of David who gathers both houses under one throne.',
  sv.verse_id, ev.verse_id, 'extras', 30402
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 4 ★
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-i-will-be-his-father-and-he-shall-be-my-son',
  E'I will be his father, and he shall be my son',
  E'At the heart of the covenant stands the Father-Son word: *I will be his father, and he shall be my son: and I will not take my mercy away from him* (1 Chronicles 17:13). The parallel carries the chastening clause the Chronicler omits — *I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men* (2 Samuel 7:14) — and the omission is purposeful: the Chronicler foregrounds the Messianic Son in whom no iniquity is found and whose throne is permanent. The royal psalm sings the decree — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — and Hebrews gathers both texts to set the Davidic Son above every angel: *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). This is the Formed Son who HAS a Father — the One drawn from the Formless, begotten and exalted by the Most High, settled upon the everlasting throne. He is not a co-equal trinitarian person, nor an Arian creature made out of nothing, but the begotten Heir of David and the expressed Son of Yahuah, who has a Father and does His will.',
  sv.verse_id, ev.verse_id, 'free', 30403
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever',
  E'The people Yahuah redeemed to be his own for ever',
  E'David''s prayer turns from his own house to Yahuah''s people: *there is none like thee, neither is there any Elohim (God) beside thee* (1 Chronicles 17:20), *and what one nation in the earth is like thy people Yashar''el (Israel), whom Elohim (God) went to redeem to be his own people... whom thou hast redeemed out of Egypt? For thy people Yashar''el (Israel) didst thou make thine own people for ever; and thou, Yahuah (LORD), becamest their Elohim (God)* (1 Chronicles 17:21-22). The parallel confesses it the same — *whom Elohim (God) went to redeem for a people to himself... which thou redeemedst to thee from Egypt* (2 Samuel 7:23), *thy people Yashar''el (Israel) to be a people unto thee for ever* (2 Samuel 7:24). This is the election Moses already declared: *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people* (Deuteronomy 7:6), *because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD)... redeemed you out of the house of bondmen* (Deuteronomy 7:8); *ye shall be a peculiar treasure unto me above all people* (Exodus 19:5). The redeeming purpose runs forward unbroken — *that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The people Yahuah made His OWN for ever are never replaced; the covenant bond holds — a peculiar people, redeemed, made zealous for the works of the covenant.',
  sv.verse_id, ev.verse_id, 'free', 30404
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- Thread 6 ★
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-17-who-am-i-davids-prayer-let-it-be-established-for-ever',
  E'Who am I — David''s prayer, let it be established for ever',
  E'The covenant is answered not with celebration but with worship: *David the king came and sat before Yahuah (LORD), and said, Who am I, O Yahuah Elohim (LORD God), and what is mine house, that thou hast brought me hitherto?* (1 Chronicles 17:16). The parallel records the same humbling — *Then went king David in, and sat before Yahuah (LORD), and he said, Who am I, O Yahuah (Lord) GOD? and what is my house, that thou hast brought me hitherto?* (2 Samuel 7:18) — the king laying down his crown in wonder. It is the same astonishment the psalmist sings: *What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4). Then humility turns to faith taking hold of the promise — *let it even be established, that thy name may be magnified for ever* (1 Chronicles 17:23-24), *therefore thy servant hath found in his heart to pray before thee* (1 Chronicles 17:25) — and David closes asking Yahuah to do as He has said: *let it please thee to bless the house of thy servant, that it may be before thee for ever: for thou blessest, O Yahuah (LORD), and it shall be blessed for ever* (1 Chronicles 17:27), echoing *with thy blessing let the house of thy servant be blessed for ever* (2 Samuel 7:29). This is covenant faith — not earning the promise, but receiving it and praying it back to the One who swore it.',
  sv.verse_id, ev.verse_id, 'free', 30405
  FROM _s313_chr17_lookup sv, _s313_chr17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=17 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- D. cross_reference_thread_members
-- ============================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Shalt thou build me an house for me to dwell in?* (2 Samuel 7:5) — the parallel scene: David''s desire met by Yahuah''s answering question through Nathan.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=1
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have not dwelt in any house... but have walked in a tent and in a tabernacle* (2 Samuel 7:6) — Yahuah never confined to a cedar house.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=5
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Why build ye not me an house of cedar?* (2 Samuel 7:7) — a word Yahuah never spoke; the initiative is His grace.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1) — the Most High is not contained by cedar walls.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48) — Stephen quotes the refusal forward against temple-idolatry.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49) — Isaiah''s answer to David''s desire, cited by Stephen.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=4
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-yahuah-dwelt-not-in-a-house-of-cedar-but-in-a-tent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He chose David also his servant, and took him from the sheepfolds* (Psalm 78:70) — the psalm sings the same election of the shepherd-boy.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=70
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-took-thee-from-the-sheepcote-to-rule-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he brought him to feed Jacob his people, and Yashar''el (Israel) his inheritance* (Psalm 78:71) — the shepherd-king who feeds the nation.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=71
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-took-thee-from-the-sheepcote-to-rule-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I took thee from the sheepcote, from following the sheep, to be ruler over my people* (2 Samuel 7:8) — the parallel word of sovereign choosing.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-took-thee-from-the-sheepcote-to-rule-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 ★★★ members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the parallel: the seed of David through whom the throne comes.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the son builds the house, Yahuah builds the throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thy throne shall be established for ever* (2 Samuel 7:16) — the parallel seal of the everlasting throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I have made a covenant with my chosen, I have sworn unto David my servant* (Psalm 89:3) — an oath sworn, not a treaty negotiated.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:4) — the throne built up to all generations.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*My covenant will I not break, nor alter the thing that is gone out of my lips* (Psalm 89:34) — the word once spoken cannot be altered.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*His seed shall endure for ever, and his throne as the sun before me* (Psalm 89:36) — the throne endures as the sun.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*It shall be established for ever as the moon, and as a faithful witness in heaven* (Psalm 89:37) — fixed in heaven, a faithful witness.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Of the fruit of thy body will I set upon thy throne* (Psalm 132:11) — the lineage carrying the promise, sworn in truth.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*upon the throne of David... to establish it... even for ever* (Isaiah 9:7) — the kingdom with no end on David''s throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*unto us a child is born, unto us a son is given... El Gibbor (The mighty God)* (Isaiah 9:6) — the promised Son who carries the government.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*I will raise unto David a righteous Branch, and a King shall reign and prosper* (Jeremiah 23:5) — the seed named as the righteous Branch.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'*Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the covenant kept: David''s throne given to the Son.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 14, E'*he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — both houses under one everlasting throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 15, E'*Elohim (God) had sworn with an oath to him... he would raise up Messiah (Christ) to sit on his throne* (Acts 2:30) — Peter names the covenant fulfilled.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 16, E'*Messiah (Christ) cometh of the seed of David* (John 7:42) — even the crowd knew the Messiah rides the Davidic lineage.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 17, E'*he gave him a covenant of kings, and a throne of glory in Yashar''el (Israel)* (Sirach 47:11) — Ben Sira remembers the everlasting throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 18, E'*neither will he abolish the posterity of his elect... a root to David* (Sirach 47:22) — mirrors *I will not take my mercy away from him* (17:13): the mercy never abolished.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 19, E'*David for being merciful possessed the throne of an everlasting kingdom* (1 Maccabees 2:57) — the fathers remembered David''s portion as the everlasting throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=57
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-establish-his-throne-for-ever-the-son-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 ★ members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him* (2 Samuel 7:14) — the parallel; the Chronicler OMITS the chastening clause to foreground the sinless Messianic Son.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou art my Son; this day have I begotten thee* (Psalm 2:7) — the royal decree of the begotten Son set on Zion, the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5) — the apostle quotes 17:13 to set the Davidic Son above all angels: the Formed Son who HAS a Father, not co-equal-trinity and not Arian-created.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-i-will-be-his-father-and-he-shall-be-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there is none like thee, neither is there any Elohim (God) beside thee* (2 Samuel 7:22) — David''s parallel confession of the incomparable One.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=20
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whom Elohim (God) went to redeem for a people to himself... which thou redeemedst to thee from Egypt* (2 Samuel 7:23) — Israel set apart by redemption, not merit.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thy people Yashar''el (Israel) to be a people unto thee for ever... thou, Yahuah (LORD), art become their Elohim (God)* (2 Samuel 7:24) — the people made His own for ever.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=22
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*chosen thee to be a special people unto himself, above all people* (Deuteronomy 7:6) — election rooted in love, not numbers.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*because Yahuah (LORD) loved you... redeemed you out of the house of bondmen* (Deuteronomy 7:8) — redemption flows from love and the oath to the fathers.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*ye shall be a peculiar treasure unto me above all people* (Exodus 19:5) — the redeemed nation as Yahuah''s peculiar treasure.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*purify unto himself a peculiar people, zealous of good works* (Titus 2:14) — the redeeming purpose carried forward, the covenant people never replaced.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-the-people-yahuah-redeemed-to-be-his-own-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6 ★ members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Who am I, O Yahuah (Lord) GOD? and what is my house, that thou hast brought me hitherto?* (2 Samuel 7:18) — the king laying down his crown in wonder.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-who-am-i-davids-prayer-let-it-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*What is man, that thou art mindful of him? and the son of Adam, that thou visitest him?* (Psalm 8:4) — the same humbled wonder that the Most High visits the son of Adam.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-who-am-i-davids-prayer-let-it-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*with thy blessing let the house of thy servant be blessed for ever* (2 Samuel 7:29) — faith taking hold, praying the promise back to the One who swore it.'
  FROM cross_reference_threads t
  JOIN _s313_chr17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=17 AND sv.verse_number=27
  JOIN _s313_chr17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-17-who-am-i-davids-prayer-let-it-be-established-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_18.sql (1 Chronicles 18) -----
-- Book: 1 Chronicles ch.18 (David's victories and just reign) | slug prefix 1-chronicles-18-
-- Session prefix: s313 | tag: chr18 | temp view: _s313_chr18_lookup
-- sort_order band start: 30425 (+1 per thread) -> 30425, 30426, 30427
--
-- 1 Chronicles 18 coverage:
--   v.1-5  (David smites Philistines/Moab/Zobah/Syria) -- the war narrative; framed under v.6/v.13 refrain
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 8:1-5 (the parallel account) -- carried by the preservation thread
--   v.6,13 "Yahuah preserved David whithersoever he went" -- THE KING KEPT BY YAHUAH
--          NT:     none warranted (preservation type fulfilled in the kept Son, but no clean single-verse member here)
--          Extras: none warranted
--          Tanakh: Psalm 121:7-8 (preserve thee... thy going out and thy coming in); 2 Samuel 8:6 (parallel refrain);
--                  Psalm 18:34-37 (he teacheth my hands to war / enlarged my steps); Proverbs 21:31 (safety is of Yahuah)
--   v.11   "did king David dedicate unto Yahuah" -- the devoted spoil
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 8:11 (the parallel dedication of the spoil)
--   v.14   "executed judgment and justice" -- THE RIGHTEOUS REIGN THAT TYPES THE MESSIAH'S KINGDOM
--          NT:     none warranted (the Branch's reign sung by the prophets carries it; NT throne-of-David texts are downstream)
--          Extras: none warranted
--          Tanakh: 2 Samuel 8:15 (parallel); Psalm 72:1-4 (judge thy people with righteousness);
--                  Isaiah 9:7 (establish it with judgment and justice); Jeremiah 23:5 (the Branch executes judgment and justice);
--                  Psalm 89:14 (justice and judgment the habitation of thy throne)
--   v.7-10,12,15-17 (spoil details, Tou's embassy, Edom, officers) -- narrative scaffolding; none warranted
--
-- Threads (3):
--   1-chronicles-18-yahuah-preserved-david-whithersoever-he-went  [free] -- Tanakh (Ps121, 2Sam8, Ps18, Prov21)
--   1-chronicles-18-the-spoil-dedicated-unto-yahuah               [free] -- Tanakh (2Sam8)
--   1-chronicles-18-executed-judgment-and-justice-the-branchs-reign [free] -- Tanakh (2Sam8, Ps72, Isa9, Jer23, Ps89)
--
-- FRAMING NOTES:
--   * "Yahuah preserved David whithersoever he went" (18:6,13) = the king KEPT by Yahuah in all his ways, the
--     going-out and coming-in of Psalm 121:7-8 -- not David's own arm but Yahuah's keeping; safety is of Yahuah (Prov 21:31).
--   * "executed judgment and justice" (18:14) = the righteous Davidic reign that TYPES the Messiah's kingdom of justice;
--     the Branch raised unto David executes judgment and justice in the earth (Jer 23:5), establishing the throne with
--     judgment and justice for ever (Isa 9:7) -- the Davidic king's justice anticipating the Formed Son's reign.
--   * dedicated spoil (18:11) = the devoted things set apart unto Yahuah; the king's plunder belongs to Yahuah, not to himself.

CREATE TEMP VIEW _s313_chr18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Yahuah preserved David whithersoever he went (18:6, 18:13)
    ('canon','1-chronicles',18,6,'canon','psalms',121,7,'free',
      E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7). The chronicler''s twice-sounded refrain, *Thus Yahuah (LORD) preserved David whithersoever he went* (1 Chronicles 18:6), is the warrior''s confession of the keeper-Psalm: the victories were not David''s arm but Yahuah''s keeping.'),
    ('canon','1-chronicles',18,6,'canon','psalms',121,8,'free',
      E'*Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore* (Psalm 121:8). *Whithersoever he went* (1 Chronicles 18:6) is exactly the going-out and coming-in that Yahuah keeps -- every campaign, every return, kept by the One who neither slumbers nor sleeps.'),
    ('canon','1-chronicles',18,6,'canon','2-samuel',8,6,'free',
      E'*Then David put garrisons in Syria of Damascus: and the Syrians became servants to David, and brought gifts. And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:6). The parallel account sounds the same refrain word for word; the two witnesses agree -- the kept king is preserved, not self-made.'),
    ('canon','1-chronicles',18,6,'canon','psalms',18,34,'free',
      E'*He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34). David''s own victory-song confesses what the chronicler records as preservation: the skill and strength for battle were given, *whithersoever he went* (1 Chronicles 18:6), by the Yahuah who girded him.'),
    ('canon','1-chronicles',18,13,'canon','proverbs',21,31,'free',
      E'*The horse is prepared against the day of battle: but safety is of Yahuah (LORD)* (Proverbs 21:31). The repeated *Yahuah (LORD) preserved David whithersoever he went* (1 Chronicles 18:13) is the narrative of that proverb -- garrisons set and armies subdued, yet the safety belongs wholly to Yahuah.'),
    ('canon','1-chronicles',18,13,'canon','2-samuel',8,14,'free',
      E'*And he put garrisons in Edom; throughout all Edom put he garrisons, and all they of Edom became David''s servants. And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:14). The Samuel record closes the Edom campaign with the identical refrain that 1 Chronicles 18:13 sounds -- the kept king, twice attested.'),

    -- THREAD 2: the spoil dedicated unto Yahuah (18:11)
    ('canon','1-chronicles',18,11,'canon','2-samuel',8,11,'free',
      E'*Which also king David did dedicate unto Yahuah (LORD), with the silver and gold that he had dedicated of all nations which he subdued* (2 Samuel 8:11). The parallel witness names the same act: David does not keep the plunder of the nations but sets it apart, *did king David dedicate unto Yahuah (LORD)* (1 Chronicles 18:11) -- the spoil devoted to the One who gave the victory.'),

    -- THREAD 3: executed judgment and justice -- the Branch's reign (18:14)
    ('canon','1-chronicles',18,14,'canon','2-samuel',8,15,'free',
      E'*And David reigned over all Yashar''el (Israel); and David executed judgment and justice unto all his people* (2 Samuel 8:15). The parallel account gives the same summary of the kingdom: the king who subdued the nations governs his own people with judgment and justice -- the two witnesses agree on the measure of the throne.'),
    ('canon','1-chronicles',18,14,'canon','psalms',72,2,'free',
      E'*He shall judge thy people with righteousness, and thy poor with judgment* (Psalm 72:2). David''s reign that *executed judgment and justice among all his people* (1 Chronicles 18:14) is the seed of the king-Psalm''s prayer; the just throne of David is the pattern the Psalm carries forward to the king''s son.'),
    ('canon','1-chronicles',18,14,'canon','psalms',72,4,'free',
      E'*He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:4). The judgment and justice David executes (1 Chronicles 18:14) flowers in the coming king who defends the needy and breaks the oppressor -- the Davidic justice anticipating the Messiah''s reign.'),
    ('canon','1-chronicles',18,14,'canon','isaiah',9,7,'free',
      E'*Of the increase of his government and peace there shall be no end, upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever* (Isaiah 9:7). David''s throne *executed judgment and justice* (1 Chronicles 18:14) for a season; the child born of his line establishes that same judgment and justice for ever -- the type made everlasting in the Formed Son.'),
    ('canon','1-chronicles',18,14,'canon','jeremiah',23,5,'free',
      E'*Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). The very phrase of David''s reign -- *executed judgment and justice* (1 Chronicles 18:14) -- becomes the prophets'' name for the coming Branch raised unto David; the king''s justice is the foreshadow of the Messiah''s righteous reign.'),
    ('canon','1-chronicles',18,14,'canon','psalms',89,14,'free',
      E'*Justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face* (Psalm 89:14). David executed judgment and justice (1 Chronicles 18:14) because justice and judgment are the foundation of Yahuah''s own throne; the Davidic king reigns rightly only as he mirrors the throne he serves under.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-18-yahuah-preserved-david-whithersoever-he-went',
       E'Yahuah Preserved David Whithersoever He Went',
       E'Twice the chronicler stops the war-narrative to sound one refrain: *Thus Yahuah (LORD) preserved David whithersoever he went* (1 Chronicles 18:6), and again *Thus Yahuah (LORD) preserved David whithersoever he went* (1 Chronicles 18:13). David subdues the Philistines, Moab, Zobah, Syria, and Edom -- but the victories are credited not to his arm but to Yahuah''s keeping. This is the very confession of the keeper-Psalm: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7), *Yahuah (LORD) shall preserve thy going out and thy coming in from this time forth, and even for evermore* (Psalm 121:8). *Whithersoever he went* is exactly that going-out and coming-in that Yahuah keeps. David''s own victory-song confesses the same -- *He teacheth my hands to war, so that a bow of steel is broken by mine arms* (Psalm 18:34) -- and the proverb names the principle outright: *The horse is prepared against the day of battle: but safety is of Yahuah (LORD)* (Proverbs 21:31). The parallel account in Samuel sounds the refrain word for word: *the Syrians became servants to David, and brought gifts. And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:6); *all they of Edom became David''s servants. And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:14). The kept king, twice attested, is preserved -- never self-made.',
       sv.verse_id, ev.verse_id, 'free', 30425
  FROM _s313_chr18_lookup sv, _s313_chr18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=18 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-18-the-spoil-dedicated-unto-yahuah',
       E'The Spoil Dedicated Unto Yahuah',
       E'The gold, silver, and brass taken from the nations are not kept as the king''s treasure: *Them also king David dedicated unto Yahuah (LORD), with the silver and the gold that he brought from all these nations; from Edom, and from Moab, and from the children of Ammon, and from the Philistines, and from Amalek* (1 Chronicles 18:11). The plunder of the conquered is set apart, devoted to the One who gave the victory. The parallel witness records the same act: *Which also king David did dedicate unto Yahuah (LORD), with the silver and gold that he had dedicated of all nations which he subdued* (2 Samuel 8:11). The king who is preserved whithersoever he goes returns the spoil to Yahuah -- the brass of these very nations is what Solomon would later cast into the brasen sea and the pillars of the house (1 Chronicles 18:8). The victory is Yahuah''s, and so is its reward.',
       sv.verse_id, ev.verse_id, 'free', 30426
  FROM _s313_chr18_lookup sv, _s313_chr18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=18 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-18-executed-judgment-and-justice-the-branchs-reign',
       E'Executed Judgment and Justice — The Branch''s Reign',
       E'The war-summary closes with the measure of the kingdom: *So David reigned over all Yashar''el (Israel), and executed judgment and justice among all his people* (1 Chronicles 18:14). The parallel gives the same word: *David executed judgment and justice unto all his people* (2 Samuel 8:15). This is no mere historical note -- it is the seed of the whole Davidic hope. The king-Psalm prays it forward: *He shall judge thy people with righteousness, and thy poor with judgment* (Psalm 72:2); *He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:4). The prophet establishes it for ever in the child of David''s line: *upon the throne of David, and upon his kingdom, to order it, and to establish it with judgment and with justice from henceforth even for ever* (Isaiah 9:7). And the very phrase of David''s reign becomes the name of the coming Branch: *I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5). David reigns rightly only as he mirrors the throne he serves under -- *Justice and judgment are the habitation of thy throne* (Psalm 89:14). The Davidic king''s justice is the foreshadow of the Formed Son''s righteous reign, the kingdom of judgment and justice without end.',
       sv.verse_id, ev.verse_id, 'free', 30427
  FROM _s313_chr18_lookup sv, _s313_chr18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=18 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7) — the keeper-Psalm''s preservation is the refrain of David''s victories.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) shall preserve thy going out and thy coming in* (Psalm 121:8) — *whithersoever he went* is the going-out and coming-in Yahuah keeps.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:6) — the parallel account sounds the identical refrain.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He teacheth my hands to war* (Psalm 18:34) — David''s victory-song confesses the strength was given, not seized.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*safety is of Yahuah (LORD)* (Proverbs 21:31) — the principle named outright: the horse is prepared, but the safety is Yahuah''s.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=13
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*all they of Edom became David''s servants. And Yahuah (LORD) preserved David whithersoever he went* (2 Samuel 8:14) — the Edom campaign closes with the same refrain 1 Chronicles 18:13 sounds.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=13
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-yahuah-preserved-david-whithersoever-he-went'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Which also king David did dedicate unto Yahuah (LORD), with the silver and gold... of all nations which he subdued* (2 Samuel 8:11) — the parallel witness to the devoted spoil.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-the-spoil-dedicated-unto-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David executed judgment and justice unto all his people* (2 Samuel 8:15) — the parallel summary of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=8 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He shall judge thy people with righteousness, and thy poor with judgment* (Psalm 72:2) — David''s just reign is the seed of the king-Psalm''s prayer.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:4) — the king who defends the needy, the Messiah''s reign foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*to establish it with judgment and with justice from henceforth even for ever* (Isaiah 9:7) — David''s judgment and justice made everlasting on the throne of David.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a righteous Branch... shall execute judgment and justice in the earth* (Jeremiah 23:5) — the very phrase of David''s reign becomes the name of the coming Branch.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Justice and judgment are the habitation of thy throne* (Psalm 89:14) — David reigns rightly only as he mirrors Yahuah''s own throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=18 AND sv.verse_number=14
  JOIN _s313_chr18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-18-executed-judgment-and-justice-the-branchs-reign'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_19.sql (1 Chronicles 19) -----
-- Book: 1-chronicles  Chapter: 19  Tag: chr19  Session: s313
-- Temp view: _s313_chr19_lookup
-- sort_order band: 30450 (+1 per thread)
-- Chapter: the Ammonite war — David's kindness to Hanun rebuffed, the envoys shamed,
--   the Syrians hired, Joab's resolve, the victory and the Syrians' submission.
--
-- 1 Chronicles 19 coverage:
--   v.1-5  (kindness rebuffed / envoys shamed)
--          NT:     none warranted (no NT verse weaves this specific diplomatic insult)
--          Extras: none warranted (no clean extra-canonical witness adds to this scene)
--          Tanakh: 2 Samuel 10:1-5 (the verbatim parallel narrative) — THREAD 2
--   v.6-11 (Ammon hires Syria; Joab divides the host)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 10:6-10 (parallel) — folded into thread 1 context, no standalone add
--   v.12-13 (Joab's resolve — courage, mutual aid, outcome surrendered to Yahuah) ★
--          NT:     1 Corinthians 16:13 ("quit you like men, be strong")
--          Extras: none warranted
--          Tanakh: 2 Samuel 10:11-12 (parallel), Joshua 1:9 (be strong and of a good courage),
--                  1 Samuel 3:18 (let him do what seemeth him good), 2 Samuel 15:26 (here am I,
--                  let him do as seemeth good) — THREAD 1
--   v.14-19 (victory over Syria and Ammon; Syrians make peace, serve David)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 10:13-19 (parallel) — folded as the answered-prayer close of thread 1
--
-- THREADS:
--   1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good   [free]
--      targets: Tanakh (2 Sam 10:11,10:12,15:26; 1 Sam 3:18; Josh 1:9) + NT (1 Cor 16:13)
--   1-chronicles-19-the-kindness-rebuffed-davids-envoys-shamed                [free]
--      targets: Tanakh (2 Sam 10:2,10:3,10:4)
--
-- FRAMING GUARD: 19:13 = valor JOINED to submission — "be of good courage" is not self-reliance
--   but resolve under Yahuah's sovereign will ("let Yahuah do that which is good in his sight").
--   The nations (Ammon, Syria) are opponents in that war-history triggered by a real diplomatic
--   insult — framed as conflict-within-history, never ethnic hatred.

CREATE TEMP VIEW _s313_chr19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Joab's resolve (19:12-13) — courage + mutual aid + outcome to Yahuah
    ('canon','1-chronicles',19,12,'canon','2-samuel',10,11,'free',
     E'The mirror narrative speaks Joab''s pact word for word: *And he said, If the Syrians be too strong for me, then thou shalt help me: but if the children of Ammon be too strong for thee, then I will come and help thee* (2 Samuel 10:11). The Chronicler''s *If the Syrians be too strong for me, then thou shalt help me* is the same vow of mutual aid between the brothers Joab and Abishai — two divisions of one host of Yashar''el (Israel) covering one another''s back.'),
    ('canon','1-chronicles',19,13,'canon','2-samuel',10,12,'free',
     E'The parallel surrenders the battle to Yahuah in the same breath of courage: *Be of good courage, and let us play the men for our people, and for the cities of our Elohim (God): and Yahuah (LORD) do that which seemeth him good* (2 Samuel 10:12). Joab''s *let us behave ourselves valiantly for our people, and for the cities of our Elohim (God): and let Yahuah (LORD) do that which is good in his sight* is valor joined to submission — men fight, but Yahuah decides the outcome.'),
    ('canon','1-chronicles',19,13,'canon','joshua',1,9,'free',
     E'The charge Yahuah laid on Joshua is the courage Joab now takes up: *Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). Joab''s *Be of good courage, and let us behave ourselves valiantly* is the same battlefield resolve — courage that rests not on numbers but on Yahuah''s presence with His people.'),
    ('canon','1-chronicles',19,13,'canon','1-samuel',3,18,'free',
     E'The boy Samuel hands his hard word over to Yahuah''s will with the same release: *And Samuel told him every whit, and hid nothing from him. And he said, It is Yahuah (LORD): let him do what seemeth him good* (1 Samuel 3:18). Joab''s *let Yahuah (LORD) do that which is good in his sight* is that same submission carried to the battle line — the outcome surrendered to Yahuah, whatever it be.'),
    ('canon','1-chronicles',19,13,'canon','2-samuel',15,26,'free',
     E'David himself, fleeing Absalom, bows to Yahuah''s sovereign choice in the same words: *But if he thus say, I have no delight in thee; behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). The king who sent Joab to battle and the captain on the field share one posture — *let Yahuah (LORD) do that which is good in his sight* — valor and obedience leaving the verdict to Yahuah.'),
    ('canon','1-chronicles',19,13,'canon','1-corinthians',16,13,'free',
     E'Sha''ul (Paul) gathers Joab''s charge into one apostolic line: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13). The *behave ourselves valiantly... and let Yahuah (LORD) do that which is good in his sight* of the Ammonite war becomes the standing posture of the assembly — manly courage in the field of faith, the outcome still left in Yahuah''s hand.'),
    -- THREAD 2: kindness rebuffed (19:1-5)
    ('canon','1-chronicles',19,2,'canon','2-samuel',10,2,'free',
     E'The parallel records the same intent of covenant kindness: *Then said David, I will shew kindness unto Hanun the son of Nahash, as his father shewed kindness unto me. And David sent to comfort him by the hand of his servants for his father* (2 Samuel 10:2). David''s *I will shew kindness unto Hanun the son of Nahash, because his father shewed kindness to me* is unforced goodwill returned for goodwill — kindness offered in good faith before it is despised.'),
    ('canon','1-chronicles',19,3,'canon','2-samuel',10,3,'free',
     E'The mirror text names the suspicion that poisons the kindness: *And the princes of the children of Ammon said unto Hanun their lord, Thinkest thou that David doth honour thy father, that he hath sent comforters unto thee? hath not David rather sent his servants unto thee, to search the city, and to spy it out, and to overthrow it?* (2 Samuel 10:3). The Chronicler''s *are not his servants come unto thee... to spy out the land?* shows the comfort read as conspiracy — goodwill twisted into a pretext for war.'),
    ('canon','1-chronicles',19,4,'canon','2-samuel',10,4,'free',
     E'The parallel records the same shaming of the envoys: *Wherefore Hanun took David''s servants, and shaved off the one half of their beards, and cut off their garments in the middle, even to their buttocks, and sent them away* (2 Samuel 10:4). Hanun''s *shaved them, and cut off their garments in the midst hard by their buttocks* is a calculated humiliation of men sent in peace — the diplomatic insult that turns comfort into the cause of battle.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good',
       E'Be of Good Courage, and Let Yahuah Do That Which Is Good',
       E'Caught between the Ammonites before him and the hired Syrians behind, Joab splits the host of Yashar''el (Israel) and binds himself to his brother in a vow of mutual aid: *If the Syrians be too strong for me, then thou shalt help me: but if the children of Ammon be too strong for thee, then I will help thee* (1 Chronicles 19:12). Then comes the heart of the chapter — *Be of good courage, and let us behave ourselves valiantly for our people, and for the cities of our Elohim (God): and let Yahuah (LORD) do that which is good in his sight* (1 Chronicles 19:13). This is valor JOINED to submission: men must fight bravely, yet the verdict belongs wholly to Yahuah.\n\nThe twin account in Samuel preserves both halves — the pact, *If the Syrians be too strong for me, then thou shalt help me* (2 Samuel 10:11), and the surrender, *Be of good courage, and let us play the men for our people, and for the cities of our Elohim (God): and Yahuah (LORD) do that which seemeth him good* (2 Samuel 10:12). The courage itself is the very charge Yahuah laid on Joshua at the threshold of the land: *Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9) — strength resting not on chariots but on Yahuah''s presence.\n\nThe other half — leaving the outcome to Yahuah — runs through the whole canon. Samuel, bearing a hard word, releases it: *It is Yahuah (LORD): let him do what seemeth him good* (1 Samuel 3:18). David, fleeing Absalom and refusing to grasp the throne by force, bows the same way: *behold, here am I, let him do to me as seemeth good unto him* (2 Samuel 15:26). Captain on the field and king in flight share one posture. And Sha''ul (Paul) gathers it forward into the standing charge of the assembly: *Watch ye, stand fast in the faith, quit you like men, be strong* (1 Corinthians 16:13) — manly courage in the field of faith, the outcome still left in Yahuah''s hand.',
       sv.verse_id, ev.verse_id, 'free', 30450
  FROM _s313_chr19_lookup sv, _s313_chr19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=19 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-19-the-kindness-rebuffed-davids-envoys-shamed',
       E'The Kindness Rebuffed: David''s Envoys Shamed',
       E'The war begins not with a grievance but with an act of goodwill thrown back in the face. When Nahash king of Ammon dies, David resolves to honour an old kindness: *I will shew kindness unto Hanun the son of Nahash, because his father shewed kindness to me* (1 Chronicles 19:2), and sends messengers to comfort the bereaved son. The Samuel parallel records the same unforced intent — *I will shew kindness unto Hanun the son of Nahash, as his father shewed kindness unto me* (2 Samuel 10:2).\n\nBut Hanun''s princes read the comfort as conspiracy: *Thinkest thou that David doth honour thy father, that he hath sent comforters unto thee? are not his servants come unto thee for to search, and to overthrow, and to spy out the land?* (1 Chronicles 19:3); the mirror text agrees, *hath not David rather sent his servants unto thee, to search the city, and to spy it out, and to overthrow it?* (2 Samuel 10:3). Goodwill is twisted into a pretext.\n\nSo Hanun *took David''s servants, and shaved them, and cut off their garments in the midst hard by their buttocks, and sent them away* (1 Chronicles 19:4) — a calculated humiliation of men sent in peace, confirmed in *he... shaved off the one half of their beards, and cut off their garments in the middle, even to their buttocks* (2 Samuel 10:4). David covers their shame with mercy, bidding them *Tarry at Jericho until your beards be grown, and then return* (1 Chronicles 19:5). The conflict that follows is real war-history, triggered by a real diplomatic insult — kindness offered, kindness despised — not the fruit of any hatred on David''s part.',
       sv.verse_id, ev.verse_id, 'free', 30451
  FROM _s313_chr19_lookup sv, _s313_chr19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=19 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 10:11 — the verbatim parallel of Joab''s pact of mutual aid: *If the Syrians be too strong for me, then thou shalt help me*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=12
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 10:12 — the parallel surrender: *let us play the men... and Yahuah (LORD) do that which seemeth him good* — valor joined to submission.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 1:9 — the courage''s root: *Be strong and of a good courage... for Yahuah Elohayka (the LORD thy God) is with thee*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Samuel 3:18 — the outcome surrendered: *It is Yahuah (LORD): let him do what seemeth him good*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Samuel 15:26 — David bows the same way fleeing Absalom: *let him do to me as seemeth good unto him*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=15 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Corinthians 16:13 — Sha''ul (Paul) carries the charge forward: *quit you like men, be strong* — courage in the field of faith.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=16 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-be-of-good-courage-and-let-yahuah-do-that-which-is-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 10:2 — the parallel intent of kindness: *I will shew kindness unto Hanun the son of Nahash, as his father shewed kindness unto me*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=2
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-the-kindness-rebuffed-davids-envoys-shamed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 10:3 — the parallel suspicion that poisons the kindness: *hath not David rather sent his servants... to spy it out, and to overthrow it?*'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=3
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-the-kindness-rebuffed-davids-envoys-shamed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 10:4 — the parallel shaming of the envoys: *shaved off the one half of their beards, and cut off their garments in the middle*.'
  FROM cross_reference_threads t
  JOIN _s313_chr19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s313_chr19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-19-the-kindness-rebuffed-davids-envoys-shamed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_20.sql (1 Chronicles 20) -----
-- Book: 1 Chronicles  Chapter: 20  (the capture of Rabbah; the slaying of the giants)
-- Session prefix: s313   Tag: chr20   Temp view: _s313_chr20_lookup
-- Slug prefix: 1-chronicles-20-...   Sort band start: 30475 (+1 per thread)
-- Source book_slug=1-chronicles, chapter 20 (8 verses; short war-summary).
--
-- 1 Chronicles 20 coverage:
--   v.1-3  (Rabbah of Ammon taken, crown set on David's head, spoil; Chronicler OMITS the
--          Bathsheba episode 2 Sam 11 places here, holding the kingdom's victories in view)
--          NT:     none warranted (war-summary; no clean forward type)
--          Extras: none warranted (Jasher parallels noisy here; left out deliberately)
--          Tanakh: Deuteronomy 2:21 (Ammon's land a land of giants/Rephaim destroyed before),
--                  Deuteronomy 3:11 (Og's iron bedstead in Rabbath of the children of Ammon)
--                  -> THREAD 1 (the Ammonite capital is the old giant-country; David takes it)
--   v.4-8  (★ the slaying of the giants: Sibbechai slays Sippai, Elhanan slays Lahmi brother
--          of Goliath, Jonathan slays the six-fingered man of Gath; "when he defied Yashar'el")
--          NT:     none warranted (the forward weight is carried by Gen 3:15 seed-war already)
--          Extras: 1 Enoch 7:2 (the giants born of the Watchers) -- CLEAN witness
--          Tanakh: Genesis 6:4 (the Nephilim), Numbers 13:33 (the giants/sons of Anak),
--                  Joshua 11:22 (the Anakim remained only in Gaza, Gath, Ashdod -> GATH!),
--                  Genesis 3:15 (the enmity/seed-war), 1 Samuel 17:4 (Goliath of Gath),
--                  1 Samuel 17:26 (defy the armies of the living Elohim), 1 Samuel 17:50 (slain)
--                  -> THREAD 2 (the residue of the Nephilim/Rephaim line warred down by the
--                     seed of the woman: David and his servants)
--
-- THREADS:
--   1. 1-chronicles-20-the-crown-of-ammon-taken-the-giant-country-subdued  [free]
--        targets: canon Tanakh (Deut 2:21, Deut 3:11)
--   2. 1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david        [extras]
--        targets: canon Tanakh (Gen 6:4, Num 13:33, Josh 11:22, Gen 3:15,
--                 1 Sam 17:4, 1 Sam 17:26, 1 Sam 17:50) + extras (1 Enoch 7:2)
--
-- Contested/load-bearing framing: the giants (20:4-8) are NOT mere tall men but the residue of
-- the Nephilim/Rephaim line (Gen 6:4; Num 13:33; Deut 2-3) -- the serpent's-seed enmity of
-- Gen 3:15 fought down by the seed of the woman (David and his servants). "When he defied
-- Yashar'el" (20:7) echoes Goliath defying the armies of the living Elohim (1 Sam 17:26).

CREATE TEMP VIEW _s313_chr20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Rabbah of Ammon = the old giant-country; David takes the crown
    ('canon','1-chronicles',20,1,'canon','deuteronomy',2,21,'free',
     E'*A people great, and many, and tall, as the Anakims; but Yahuah (LORD) destroyed them before them; and they succeeded them, and dwelt in their stead* (Deuteronomy 2:21). The very land of Ammon that Joab *besieged Rabbah* and *smote Rabbah, and destroyed it* (1 Chronicles 20:1) was reckoned a land of giants whom Yahuah had already cast out; David''s siege completes that ancient clearing of the Rephaim country.'),
    ('canon','1-chronicles',20,2,'canon','deuteronomy',3,11,'free',
     E'*For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon?* (Deuteronomy 3:11). The iron bed of the last great Rephaim king was kept on display in Rabbath of Ammon -- the same Rabbah from which David *took the crown of their king from off his head* (1 Chronicles 20:2); the giant-king''s relic gives way to the crown of David, the seed-line king.'),
    -- THREAD 2: the giants of Gath -- the residue of the Nephilim/Rephaim, the seed-war
    ('canon','1-chronicles',20,4,'canon','genesis',6,4,'free',
     E'*There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4). *Sippai, that was of the children of the giant* (1 Chronicles 20:4) is no mere tall man but the residue of that Nephilim line; the war at Gezer is the seed-war reaching its end-game.'),
    ('canon','1-chronicles',20,4,'enoch','1-enoch',7,2,'extras',
     E'*And they became pregnant, and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2). The restored witness names the origin of the giant-seed: the Watchers'' offspring, the same line whose remnant -- *of the children of the giant* (1 Chronicles 20:4) -- David''s men were still cutting off in the land generations later.'),
    ('canon','1-chronicles',20,5,'canon','numbers',13,33,'free',
     E'*And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers, and so we were in their sight* (Numbers 13:33). The spies trembled at the giant-seed in the land; here *Elhanan the son of Jair slew Lahmi the brother of Goliath the Gittite, whose spear staff was like a weaver''s beam* (1 Chronicles 20:5) -- the same colossal stature now falls before the men of David.'),
    ('canon','1-chronicles',20,6,'canon','genesis',3,15,'free',
     E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). *A man of great stature, whose fingers and toes were four and twenty... and he also was the son of the giant* (1 Chronicles 20:6) is the serpent''s seed in the flesh; David''s house warring him down is the Genesis enmity worked out in history.'),
    ('canon','1-chronicles',20,7,'canon','1-samuel',17,26,'free',
     E'*for who is this uncircumcised Philistine, that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26). *But when he defied Yashar''el (Israel), Jonathan the son of Shimea David''s brother slew him* (1 Chronicles 20:7) echoes the giant of Gath''s great-grandfather: to defy Yashar''el is to defy the living Elohim, and the defiance is judged.'),
    ('canon','1-chronicles',20,7,'canon','joshua',11,22,'free',
     E'*There was none of the Anakims left in the land of the children of Yashar''el (Israel): only in Gaza, in Gath, and in Ashdod, there remained* (Joshua 11:22). Joshua had cut off the Anakim except a remnant left *in Gath*; these giants slain by David''s men -- born *in Gath* (1 Chronicles 20:8), *when he defied Yashar''el* (20:7) -- are exactly that surviving remnant finally brought down.'),
    ('canon','1-chronicles',20,8,'canon','1-samuel',17,4,'free',
     E'*And there went out a champion out of the camp of the Philistines, named Goliath, of Gath, whose height was six cubits and a span* (1 Samuel 17:4). Goliath himself was *of Gath*; *these were born unto the giant in Gath; and they fell by the hand of David, and by the hand of his servants* (1 Chronicles 20:8) -- the whole Gath-giant brood, Goliath''s own kin, brought down by David''s line.'),
    ('canon','1-chronicles',20,8,'canon','1-samuel',17,50,'free',
     E'*So David prevailed over the Philistine with a sling and with a stone, and smote the Philistine, and slew him; but there was no sword in the hand of David* (1 Samuel 17:50). The young David''s stone began it; *they fell by the hand of David, and by the hand of his servants* (1 Chronicles 20:8) finishes it -- the king and the men he raised up complete the war against the giant-seed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-20-the-crown-of-ammon-taken-the-giant-country-subdued',
       E'The Crown of Ammon Taken: the Giant-Country Subdued',
       E'The Chronicler passes over the Bathsheba episode that 2 Samuel 11 sets here and holds the kingdom''s victories in view: *Joab led forth the power of the army, and wasted the country of the children of Ammon, and came and besieged Rabbah... And Joab smote Rabbah, and destroyed it* (1 Chronicles 20:1), and *David took the crown of their king from off his head, and found it to weigh a talent of gold... and it was set upon David''s head* (1 Chronicles 20:2). Rabbah is no ordinary capital. The Torah remembers the country of Ammon as old giant-land: *A people great, and many, and tall, as the Anakims; but Yahuah (LORD) destroyed them before them; and they succeeded them, and dwelt in their stead* (Deuteronomy 2:21). And the relic of the last great Rephaim king was kept there: *For only Og king of Bashan remained of the remnant of giants; behold, his bedstead was a bedstead of iron; is it not in Rabbath of the children of Ammon?* (Deuteronomy 3:11). So David''s siege completes an ancient clearing of the giant-country, and the crown of the giant-king''s city is lifted onto the head of the seed-line king.',
       sv.verse_id, ev.verse_id, 'free', 30475
  FROM _s313_chr20_lookup sv, _s313_chr20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david',
       E'The Giants of Gath Fell by the Hand of David',
       E'*There arose war at Gezer with the Philistines; at which time Sibbechai the Hushathite slew Sippai, that was of the children of the giant... And Elhanan the son of Jair slew Lahmi the brother of Goliath the Gittite, whose spear staff was like a weaver''s beam... a man of great stature, whose fingers and toes were four and twenty, six on each hand, and six on each foot: and he also was the son of the giant. But when he defied Yashar''el (Israel), Jonathan the son of Shimea David''s brother slew him. These were born unto the giant in Gath; and they fell by the hand of David, and by the hand of his servants* (1 Chronicles 20:4-8). These are not merely large men. They are the residue of the Nephilim line: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4) -- a line the restored witness traces to the Watchers, *and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2). It is the seed the spies feared: *And there we saw the giants, the sons of Anak, which come of the giants: and we were in our own sight as grasshoppers* (Numbers 13:33). Joshua had cut them off save a remnant left in one place -- *There was none of the Anakims left in the land of the children of Yashar''el (Israel): only in Gaza, in Gath, and in Ashdod, there remained* (Joshua 11:22) -- and it is precisely those Gath-giants whom David''s men now finish. The whole war is the Genesis enmity worked out in history: *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The serpent''s seed in the flesh falls before the seed of the woman. And the defiance is the same defiance David answered as a boy: *for who is this uncircumcised Philistine, that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26) -- Goliath *of Gath, whose height was six cubits and a span* (1 Samuel 17:4), whom *David prevailed over... with a sling and with a stone... but there was no sword in the hand of David* (1 Samuel 17:50). What the stone began, the king and his servants complete: the Gath-giant brood, Goliath''s own kin, brought down by the house of David.',
       sv.verse_id, ev.verse_id, 'extras', 30476
  FROM _s313_chr20_lookup sv, _s313_chr20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=20 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A people great, and many, and tall, as the Anakims; but Yahuah (LORD) destroyed them before them* (Deuteronomy 2:21) -- the land of Ammon David besieged was reckoned old giant-country already cleared by Yahuah.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=1
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-crown-of-ammon-taken-the-giant-country-subdued'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*is it not in Rabbath of the children of Ammon?* (Deuteronomy 3:11) -- Og''s iron bedstead, the last Rephaim king''s relic, was kept in the very Rabbah whose crown David took.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-crown-of-ammon-taken-the-giant-country-subdued'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*There were giants in the earth in those days... the same became mighty men which were of old, men of renown* (Genesis 6:4) -- Sippai *of the children of the giant* is the residue of that Nephilim line.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*and they bare great giants, whose height was three thousand ells* (1 Enoch 7:2) -- the restored witness names the giant-seed''s origin in the Watchers'' offspring.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And there we saw the giants, the sons of Anak, which come of the giants* (Numbers 13:33) -- the stature the spies feared now falls: Elhanan slays Lahmi, brother of Goliath.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=13 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) -- the six-fingered son of the giant is the serpent''s seed; David''s house wars it down.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=6
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*that he should defy the armies of the living Elohim (God)?* (1 Samuel 17:26) -- *when he defied Yashar''el* (20:7) is the same offense; to defy Yashar''el is to defy the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*only in Gaza, in Gath, and in Ashdod, there remained* (Joshua 11:22) -- Joshua left an Anakim remnant in Gath; these are exactly the Gath-giants David''s men now finish.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*a champion out of the camp of the Philistines, named Goliath, of Gath* (1 Samuel 17:4) -- the giants *born unto the giant in Gath* are Goliath''s own kin.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*So David prevailed over the Philistine with a sling and with a stone... but there was no sword in the hand of David* (1 Samuel 17:50) -- what the boy''s stone began, *the hand of David, and... his servants* (20:8) complete.'
  FROM cross_reference_threads t
  JOIN _s313_chr20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s313_chr20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-20-the-giants-of-gath-fell-by-the-hand-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_21.sql (1 Chronicles 21) -----
-- Book: 1 Chronicles ch.21 | source book_slug=1-chronicles | tag=chr21 | session prefix=s313
-- sort_order band: 30500 + 1 per thread (30500-30504)
-- temp view: _s313_chr21_lookup
-- THEME: David's census, the plague, and the threshingfloor of Ornan that becomes the temple site (Mount Moriah).
--
-- 1 Chronicles 21 coverage:
--   v.1   NT:     Luke 22:31 (Satan desired to sift you as wheat) — used
--         Extras: none warranted (Job/Zech carry the adversary scene canonically)
--         Tanakh: Job 1:6,1:12; Job 2:1; Zechariah 3:1; 2 Samuel 24:1 — used (the accuser incites, David accountable)
--   v.2-6 NT:     none warranted     Extras: none warranted     Tanakh: covered by v.1/v.8 threads
--   v.7   NT:     none warranted     Extras: none warranted     Tanakh: covered by v.8 confession thread
--   v.8   NT:     James 1:13-14 (drawn away of his own lust — accountability) — used in v.1 thread
--         Extras: none warranted
--         Tanakh: Psalm 51:1,2,3 (David's confession psalm); 2 Samuel 24:10 (parallel) — used
--   v.9-12 NT:    none warranted     Extras: none warranted     Tanakh: covered by surrounding threads
--   v.13  NT:     Hebrews 10:31 (fearful to fall into hands of living Elohim) — used
--         Extras: none warranted
--         Tanakh: Lamentations 3:22,23; Psalm 130:3,4; 2 Samuel 24:14 — used (the mercy of Yahuah preferred)
--   v.14-16 NT:   none warranted     Extras: none warranted     Tanakh: the plague/destroying angel — narrative, covered by v.17/v.18 threads
--   v.17  NT:     John 10:11; John 10:15 (good shepherd lays down his life for the sheep) — used
--         Extras: none warranted
--         Tanakh: 2 Samuel 24:17 (parallel); Exodus 32:32 (Moses' intercession); Isaiah 53:6 (all we like sheep) — used
--   v.18-30 NT:   none warranted (the altar/fire weaves OUT and BACK in Tanakh; Akedah convergence is Tanakh+temple)
--         Extras: none warranted
--         Tanakh: 2 Chronicles 3:1 (mount Moriah, threshingfloor of Ornan); Genesis 22:2; Genesis 22:14; Leviticus 9:24 (fire from heaven); 1 Kings 18:38; 2 Samuel 24:24 (bought, not without cost) — used
--
-- THREADS (slug — target libraries):
--   s313 chr21 t1  1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable      — Tanakh + NT (free)
--   s313 chr21 t2  1-chronicles-21-i-have-sinned-greatly-i-have-done-very-foolishly         — Tanakh (free)
--   s313 chr21 t3  1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies — Tanakh + NT (free)
--   s313 chr21 t4  1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding — Tanakh + NT (free)
--   s313 chr21 t5  1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar — Tanakh (free)
--
-- All targets are canon (Tanakh + NT) → every thread tier_required='free'.

CREATE TEMP VIEW _s313_chr21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the adversary provokes, yet David is accountable (21:1)
    ('canon','1-chronicles',21,1,'canon','job',1,6,'free',
      E'*Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6). The same accuser who walks into the heavenly court in Job is the one who *stood up against Yashar''el (Israel), and provoked David to number Yashar''el (Israel)* (1 Chronicles 21:1) — the adversary incites, but as in Job he acts only within the bounds Yahuah (LORD) permits.'),
    ('canon','1-chronicles',21,1,'canon','job',1,12,'free',
      E'*And Yahuah (LORD) said unto Satan, Behold, all that he hath is in thy power; only upon himself put not forth thine hand. So Satan went forth from the presence of Yahuah (LORD)* (Job 1:12). The provocation that *stood up against Yashar''el (Israel)* (1 Chronicles 21:1) is the same bounded enmity — the adversary may incite and afflict, never beyond what the Most High allows.'),
    ('canon','1-chronicles',21,1,'canon','job',2,1,'free',
      E'*Again there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them to present himself before Yahuah (LORD)* (Job 2:1). The accuser who returns to provoke afresh against Job is the one who *provoked David to number Yashar''el (Israel)* (1 Chronicles 21:1) — a persistent inciter, never an independent power.'),
    ('canon','1-chronicles',21,1,'canon','zechariah',3,1,'free',
      E'*And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him* (Zechariah 3:1). The adversary who stands to accuse the high priest is the one who *stood up against Yashar''el (Israel)* (1 Chronicles 21:1) — and Yahuah (LORD) rebukes him, the accusation answered by mercy, not by the accuser''s power prevailing.'),
    ('canon','1-chronicles',21,1,'canon','luke',22,31,'free',
      E'*And Yahuah (Lord) said, Simon, Simon, behold, Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31). The same desire to *stand up against Yashar''el (Israel), and provoke* (1 Chronicles 21:1) reaches forward to the sifting of the apostles — yet the Formed Son says *I have prayed for thee, that thy faith fail not* (Luke 22:32), the intercession that answers the accuser.'),
    ('canon','1-chronicles',21,1,'canon','2-samuel',24,1,'free',
      E'*And again the anger of Yahuah (LORD) was kindled against Yashar''el (Israel), and he moved David against them to say, Go, number Yashar''el (Israel) and Yahudah (Judah)* (2 Samuel 24:1). The parallel account names the provocation differently; together with *Satan stood up against Yashar''el (Israel), and provoked David* (1 Chronicles 21:1) the two witnesses hold both truths — the adversary incites, yet it falls within Yahuah''s (LORD''s) sovereign anger over the sin, and David remains accountable.'),
    ('canon','1-chronicles',21,1,'canon','james',1,13,'free',
      E'*Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man: But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:13-14). Though *Satan... provoked David* (1 Chronicles 21:1), the provocation is no excuse — the temptation works through David''s own desire, and *I have sinned greatly* (1 Chronicles 21:8) is the only honest verdict.'),

    -- THREAD 2: the confession (21:8)
    ('canon','1-chronicles',21,8,'canon','psalms',51,1,'free',
      E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions* (Psalm 51:1). David''s plea *do away the iniquity of thy servant; for I have done very foolishly* (1 Chronicles 21:8) is the same broken man who sang Psalm 51 — confession that throws itself wholly on Yahuah''s (LORD''s) mercy, never on his own merit.'),
    ('canon','1-chronicles',21,8,'canon','psalms',51,3,'free',
      E'*For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3). When David says *I have sinned greatly, because I have done this thing* (1 Chronicles 21:8), it is the same owning of guilt without deflection — the adversary may have provoked, but David acknowledges *I have done very foolishly* and lays it bare before Yahuah (LORD).'),
    ('canon','1-chronicles',21,8,'canon','2-samuel',24,10,'free',
      E'*And David''s heart smote him after that he had numbered the people. And David said unto Yahuah (LORD), I have sinned greatly in that I have done: and now, I beseech thee, O Yahuah (LORD), take away the iniquity of thy servant; for I have done very foolishly* (2 Samuel 24:10). The two accounts give the same confession nearly word for word — *I have sinned greatly... do away the iniquity of thy servant; for I have done very foolishly* (1 Chronicles 21:8) — the king who falls also rises in repentance.'),

    -- THREAD 3: let me fall into the hand of Yahuah, for very great are his mercies (21:13)
    ('canon','1-chronicles',21,13,'canon','lamentations',3,22,'free',
      E'*It is of the LORD''S mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness* (Lamentations 3:22-23). David chose to *fall now into the hand of Yahuah (LORD); for very great are his mercies* (1 Chronicles 21:13) on exactly this ground — the mercy that does not consume is the safest place for a sinner to fall.'),
    ('canon','1-chronicles',21,13,'canon','psalms',130,3,'free',
      E'*If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand? But there is forgiveness with thee, that thou mayest be feared* (Psalm 130:3-4). David''s choice to *fall now into the hand of Yahuah (LORD); for very great are his mercies* (1 Chronicles 21:13) rests here — there is forgiveness with Yahuah (LORD), so the trembling sinner runs toward him, not from him.'),
    ('canon','1-chronicles',21,13,'canon','hebrews',10,31,'free',
      E'*It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31). David knew both edges of the truth: to fall into Yahuah''s (LORD''s) hand is fearful, yet he chose it over the hand of man because *very great are his mercies* (1 Chronicles 21:13) — the same hand that judges is the hand whose compassions fail not.'),
    ('canon','1-chronicles',21,13,'canon','2-samuel',24,14,'free',
      E'*And David said unto Gad, I am in a great strait: let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man* (2 Samuel 24:14). The twin witness gives the same choice — *let me fall now into the hand of Yahuah (LORD); for very great are his mercies: but let me not fall into the hand of man* (1 Chronicles 21:13) — the mercy of Yahuah (LORD) preferred above all the kindness of men.'),

    -- THREAD 4: these sheep, what have they done — the shepherd-king interceding (21:17)
    ('canon','1-chronicles',21,17,'canon','2-samuel',24,17,'free',
      E'*And David spake unto Yahuah (LORD) when he saw the angel that smote the people, and said, Lo, I have sinned, and I have done wickedly: but these sheep, what have they done? let thine hand, I pray thee, be against me, and against my father''s house* (2 Samuel 24:17). The parallel records the same self-offering — *be on me, and on my father''s house; but not on thy people* (1 Chronicles 21:17) — the king pleads to bear the stroke meant for the flock.'),
    ('canon','1-chronicles',21,17,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). David''s cry *as for these sheep, what have they done? let thine hand... be on me* (1 Chronicles 21:17) is the shepherd-king foreshadowing the Good Shepherd — the type that points forward to the One who lays down his life for the flock he loves.'),
    ('canon','1-chronicles',21,17,'canon','john',10,15,'free',
      E'*As the Father knoweth me, even so know I the Father: and I lay down my life for the sheep* (John 10:15). When David offers *let thine hand... be on me, and on my father''s house; but not on thy people, that they should be plagued* (1 Chronicles 21:17), he prefigures the Formed Son laying down his own life so the sheep go free.'),
    ('canon','1-chronicles',21,17,'canon','exodus',32,32,'free',
      E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32). Moses'' intercession for Yashar''el (Israel) is the same shape as David''s — *let thine hand... be on me... but not on thy people* (1 Chronicles 21:17) — the mediator stepping between the wrath and the people, offering himself in their place.'),
    ('canon','1-chronicles',21,17,'canon','isaiah',53,6,'free',
      E'*All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6). David asks *as for these sheep, what have they done?* (1 Chronicles 21:17) and offers to bear the stroke — but the answer fulfilled is the Servant on whom Yahuah (LORD) lays the iniquity of all the straying sheep.'),

    -- THREAD 5: the threshingfloor of Ornan = Mount Moriah, the costly altar, fire from heaven (21:18-26)
    ('canon','1-chronicles',21,26,'canon','2-chronicles',3,1,'free',
      E'*Then Solomon began to build the house of Yahuah (LORD) at Jerusalem in mount Moriah, where Yahuah (LORD) appeared unto David his father, in the place that David had prepared in the threshingfloor of Ornan the Jebusite* (2 Chronicles 3:1). The altar David built where *he answered him from heaven by fire upon the altar of burnt offering* (1 Chronicles 21:26) is the very site of the temple — the threshingfloor of Ornan IS mount Moriah.'),
    ('canon','1-chronicles',21,26,'canon','genesis',22,2,'free',
      E'*And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering upon one of the mountains which I will tell thee of* (Genesis 22:2). The mountain where David''s altar received fire from heaven (1 Chronicles 21:26) is Moriah — the same mount where Abraham bound Isaac; the place of the binding becomes the place of the temple.'),
    ('canon','1-chronicles',21,26,'canon','genesis',22,14,'free',
      E'*And Abraham called the name of that place Yahuah Yireh (Jehovah-jireh): as it is said to this day, In the mount of Yahuah (LORD) it shall be seen* (Genesis 22:14). Abraham named Moriah *In the mount of Yahuah (LORD) it shall be seen* — and there, generations later, *he answered him from heaven by fire upon the altar of burnt offering* (1 Chronicles 21:26); the mount of provision becomes the mount of the altar and the temple.'),
    ('canon','1-chronicles',21,26,'canon','leviticus',9,24,'free',
      E'*And there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering and the fat: which when all the people saw, they shouted, and fell on their faces* (Leviticus 9:24). The fire that fell at the tabernacle''s dedication is the same divine seal that fell on David''s altar — *he answered him from heaven by fire upon the altar of burnt offering* (1 Chronicles 21:26) — Yahuah (LORD) accepting the offering by fire.'),
    ('canon','1-chronicles',21,26,'canon','1-kings',18,38,'free',
      E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench* (1 Kings 18:38). On Carmel as on the threshingfloor of Ornan, Yahuah (LORD) answers by fire from heaven — *he answered him from heaven by fire upon the altar of burnt offering* (1 Chronicles 21:26) — the sign that the sacrifice is received and the true Elohim (God) is known.'),
    ('canon','1-chronicles',21,24,'canon','2-samuel',24,24,'free',
      E'*And the king said unto Araunah, Nay; but I will surely buy it of thee at a price: neither will I offer burnt offerings unto Yahuah Elohai (the LORD my God) of that which doth cost me nothing* (2 Samuel 24:24). David''s refusal to offer cheap is the same in both accounts — *I will not take that which is thine for Yahuah (LORD), nor offer burnt offerings without cost* (1 Chronicles 21:24) — the sacrifice that truly costs, on the very mount where the temple and the Messiah''s offering converge.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable',
       E'Satan Stood Up Against Yashar''el (Israel) — Yet David Accountable',
       E'*And Satan stood up against Yashar''el (Israel), and provoked David to number Yashar''el (Israel)* (1 Chronicles 21:1). The adversary who opens this chapter is the same accuser who walks into the heavenly court in Job — *Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6) — and who is told *Behold, all that he hath is in thy power; only upon himself put not forth thine hand* (Job 1:12); the inciter returns again, *Again there was a day... and Satan came also among them to present himself before Yahuah (LORD)* (Job 2:1). He is the one *standing at his right hand to resist* the high priest in Zechariah 3:1, and the one whom the Formed Son names — *Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31) — yet answered by intercession, *I have prayed for thee, that thy faith fail not* (Luke 22:32). The parallel account in *2 Samuel 24:1* records the same provocation as Yahuah''s (LORD''s) kindled anger over the sin, so the two witnesses hold both truths: the adversary incites, but only within the bounds the Most High allows, and never as an excuse. James seals it — *every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:13-14). The provocation was real; the sin was David''s own, and he owns it: *I have sinned greatly... I have done very foolishly* (1 Chronicles 21:8).',
       sv.verse_id, ev.verse_id, 'free', 30500
  FROM _s313_chr21_lookup sv, _s313_chr21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=21 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-21-i-have-sinned-greatly-i-have-done-very-foolishly',
       E'I Have Sinned Greatly — David''s Confession',
       E'*And David said unto Elohim (God), I have sinned greatly, because I have done this thing: but now, I beseech thee, do away the iniquity of thy servant; for I have done very foolishly* (1 Chronicles 21:8). When the stroke fell, David did not deflect onto the adversary who provoked him; he threw himself on mercy. This is the same broken man who sang *Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions* (Psalm 51:1) and *For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3) — confession that owns the guilt without excuse and pleads only Yahuah''s (LORD''s) tender mercies. The parallel in 2 Samuel gives the same words almost exactly — *I have sinned greatly in that I have done: and now, I beseech thee, O Yahuah (LORD), take away the iniquity of thy servant; for I have done very foolishly* (2 Samuel 24:10). The king who falls is the king who rises in repentance.',
       sv.verse_id, ev.verse_id, 'free', 30501
  FROM _s313_chr21_lookup sv, _s313_chr21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=21 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies',
       E'Let Me Fall Into the Hand of Yahuah (LORD) — For Very Great Are His Mercies',
       E'*And David said unto Gad, I am in a great strait: let me fall now into the hand of Yahuah (LORD); for very great are his mercies: but let me not fall into the hand of man* (1 Chronicles 21:13). Given the choice of three judgments, David ran toward Yahuah (LORD) and away from men, and he names his reason — the greatness of the mercy. The prophets and psalms confirm the ground he stood on: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness* (Lamentations 3:22-23); *If thou, Yahuah (LORD), shouldest mark iniquities, O Yahuah (Lord), who shall stand? But there is forgiveness with thee, that thou mayest be feared* (Psalm 130:3-4). The New Testament holds the other edge — *It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31) — yet that same fearful hand is the merciful one, so the sinner falls toward it, not from it. The twin account agrees: *let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man* (2 Samuel 24:14).',
       sv.verse_id, ev.verse_id, 'free', 30502
  FROM _s313_chr21_lookup sv, _s313_chr21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding',
       E'These Sheep, What Have They Done? — The Shepherd-King Interceding',
       E'*And David said unto Elohim (God), Is it not I that commanded the people to be numbered? even I it is that have sinned and done evil indeed; but as for these sheep, what have they done? let thine hand, I pray thee, O Yahuah (LORD) my Elohim (God), be on me, and on my father''s house; but not on thy people, that they should be plagued* (1 Chronicles 21:17). The shepherd-king pleads to bear the stroke meant for the flock — the parallel records it the same: *but these sheep, what have they done? let thine hand, I pray thee, be against me, and against my father''s house* (2 Samuel 24:17). This is the mediator''s shape, already worn by Moses — *if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — one man stepping between the wrath and the people. And it reaches forward to the Good Shepherd: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11); *I lay down my life for the sheep* (John 10:15). David asks what the sheep have done; the answer fulfilled is the Servant — *All we like sheep have gone astray; we have turned every one to his own way; and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6).',
       sv.verse_id, ev.verse_id, 'free', 30503
  FROM _s313_chr21_lookup sv, _s313_chr21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=21 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar',
       E'The Threshingfloor of Ornan — Mount Moriah, the Costly Altar',
       E'*And king David said to Ornan, Nay; but I will verily buy it for the full price: for I will not take that which is thine for Yahuah (LORD), nor offer burnt offerings without cost* (1 Chronicles 21:24). David refused a cheap altar — the same refusal both accounts record: *neither will I offer burnt offerings unto Yahuah Elohai (the LORD my God) of that which doth cost me nothing* (2 Samuel 24:24). He built the altar, *and he answered him from heaven by fire upon the altar of burnt offering* (1 Chronicles 21:26) — the same divine seal that fell at the tabernacle, *there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering* (Leviticus 9:24), and on Carmel, *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice* (1 Kings 18:38). And the place is no accident: *Then Solomon began to build the house of Yahuah (LORD) at Jerusalem in mount Moriah... in the threshingfloor of Ornan the Jebusite* (2 Chronicles 3:1) — the threshingfloor IS the temple mount, and the temple mount is Moriah, where *get thee into the land of Moriah; and offer him there for a burnt offering* (Genesis 22:2) Abraham bound Isaac and named the place *In the mount of Yahuah (LORD) it shall be seen* (Genesis 22:14). The Akedah, the temple, and the costly sacrifice converge on one mountain — the offering that truly costs.',
       sv.verse_id, ev.verse_id, 'free', 30504
  FROM _s313_chr21_lookup sv, _s313_chr21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=21 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Now there was a day when the sons of Elohim (God) came to present themselves before Yahuah (LORD), and Satan came also among them* (Job 1:6) — the same accuser who stood up against Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Behold, all that he hath is in thy power; only upon himself put not forth thine hand* (Job 1:12) — the adversary acts only within the bounds Yahuah (LORD) permits.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Again there was a day... and Satan came also among them to present himself before Yahuah (LORD)* (Job 2:1) — the persistent inciter returns.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Satan standing at his right hand to resist him* (Zechariah 3:1) — the accuser rebuked, mercy prevailing over the accusation.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Satan hath desired to have you, that he may sift you as wheat* (Luke 22:31) — the same adversary, answered by the Formed Son''s intercession.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And again the anger of Yahuah (LORD) was kindled against Yashar''el (Israel), and he moved David against them* (2 Samuel 24:1) — the twin witness; provocation within Yahuah''s sovereign anger over the sin.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:13-14) — the provocation no excuse; the sin is David''s own.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=1
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-satan-stood-up-against-israel-yet-david-accountable'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness... blot out my transgressions* (Psalm 51:1) — the same broken man pleading mercy, not merit.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=8
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-i-have-sinned-greatly-i-have-done-very-foolishly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For I acknowledge my transgressions: and my sin is ever before me* (Psalm 51:3) — owning guilt without deflection.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=8
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-i-have-sinned-greatly-i-have-done-very-foolishly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I have sinned greatly... take away the iniquity of thy servant; for I have done very foolishly* (2 Samuel 24:10) — the twin witness, near word-for-word.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=8
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-i-have-sinned-greatly-i-have-done-very-foolishly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*It is of the LORD''S mercies that we are not consumed, because his compassions fail not... new every morning* (Lamentations 3:22-23) — the mercy that does not consume.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*who shall stand? But there is forgiveness with thee* (Psalm 130:3-4) — forgiveness with Yahuah (LORD), so the sinner runs toward him.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It is a fearful thing to fall into the hands of the living Elohim (God)* (Hebrews 10:31) — fearful, yet the merciful hand David chose over the hand of man.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*let us fall now into the hand of Yahuah (LORD); for his mercies are great: and let me not fall into the hand of man* (2 Samuel 24:14) — the twin witness to the same choice.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-let-me-fall-into-the-hand-of-yahuah-for-great-his-mercies'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*but these sheep, what have they done? let thine hand... be against me, and against my father''s house* (2 Samuel 24:17) — the parallel self-offering.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the shepherd-king foreshadowing the Good Shepherd.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I lay down my life for the sheep* (John 10:15) — the Formed Son laying down his life so the flock goes free.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — Moses'' intercession, the same mediator''s shape.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*All we like sheep have gone astray... and Yahuah (LORD) hath laid on him the iniquity of us all* (Isaiah 53:6) — the answer fulfilled: the Servant bears the stroke for the straying sheep.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=17
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-these-sheep-what-have-they-done-the-shepherd-king-interceding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then Solomon began to build the house of Yahuah (LORD)... in mount Moriah... in the threshingfloor of Ornan the Jebusite* (2 Chronicles 3:1) — the threshingfloor IS the temple mount.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=26
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*get thee into the land of Moriah; and offer him there for a burnt offering* (Genesis 22:2) — the mount of the Akedah is the mount of the altar.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=26
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*In the mount of Yahuah (LORD) it shall be seen* (Genesis 22:14) — Abraham''s naming of Moriah, where Yahuah (LORD) later answered by fire.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=26
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*there came a fire out from before Yahuah (LORD), and consumed upon the altar the burnt offering* (Leviticus 9:24) — fire from heaven, the seal of acceptance.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=26
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice* (1 Kings 18:38) — on Carmel as on Ornan''s floor, Yahuah (LORD) answers by fire.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=26
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*neither will I offer burnt offerings unto Yahuah Elohai (the LORD my God) of that which doth cost me nothing* (2 Samuel 24:24) — the twin witness; the sacrifice that truly costs.'
  FROM cross_reference_threads t
  JOIN _s313_chr21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=21 AND sv.verse_number=24
  JOIN _s313_chr21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-21-the-threshingfloor-of-ornan-mount-moriah-the-costly-altar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_22.sql (1 Chronicles 22) -----
-- Book: 1 Chronicles, chapter 22 — David prepares for the temple and charges Solomon
-- Tag: chr22   Session prefix: s313   Temp view: _s313_chr22_lookup
-- Sort band: 30525 (+1 per thread) → 30525..30528 (4 threads)
-- Source edition: canon, book_slug 1-chronicles, chapter 22
--
-- 1 Chronicles 22 coverage:
--   v.1   (house of Yahuah / altar named) NT: none warranted  Extras: none warranted  Tanakh: folded into temple-builder weave (no separate thread)
--   v.2-5 (David prepares abundant materials, house exceeding magnifical) NT: none warranted  Extras: none warranted  Tanakh: none warranted (preparatory)
--   v.8   (thou hast shed blood, thou shalt not build) NT: none warranted  Extras: none warranted  Tanakh: 1Kings 5:3-5 (David could not build for the wars; Solomon given rest builds) → THREAD 4
--   v.9-10 (a man of rest, Solomon=peace; he shall be my son and I will be his father; throne for ever)
--         NT: Heb 1:5 (I will be to him a Father), Isa 9:6 (Prince of Peace), John 2:19,21 (temple of his body)
--         Extras: Sirach 47:13 (Solomon reigned in a peaceable time, built the house)
--         Tanakh: 1Chr 17:11-14, 2Sam 7:13-14 (Davidic covenant), Zech 6:12-13 (the Branch builds the temple) → THREADS 1 & 2
--   v.11-13 (charge: wisdom unto keeping the Torah; statutes Yahuah charged Moses; then shalt thou prosper)
--         NT: none warranted (Torah-king theme is Tanakh-internal)  Extras: none warranted
--         Tanakh: Deut 17:18-20 (king writes/keeps this law), Josh 1:7-8 (observe to do all the law, that thou mayest prosper), Ps 1:2-3 (delight in the law, whatsoever he doeth shall prosper), 1Kings 2:3 (keep the charge, as written in the law of Moses, that thou mayest prosper) → THREAD 3
--   v.14-16 (gold/silver/brass prepared; arise and be doing) NT: none  Extras: none  Tanakh: none warranted (preparatory)
--   v.17-19 (charge to the princes; set heart and soul to seek Yahuah; build the sanctuary) NT: none  Extras: none  Tanakh: folded into Torah-charge (no separate thread)
--
-- THREADS:
--   30525 1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son   [free+extras] tgt: Tanakh(1Chr17, 2Sam7) + NT(Heb1) + Extras(Sirach47)
--   30526 1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple [free] tgt: Tanakh(Isa9, Zech6) + NT(John2)
--   30527 1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering [free] tgt: Tanakh(Deut17, Josh1, Ps1, 1Kings2)
--   30528 1-chronicles-22-david-could-not-build-because-of-blood-solomon-the-man-of-rest-shall [free] tgt: Tanakh(1Kings5)
--
-- Framework guards applied:
--   22:9-10 Solomon the man of rest/peace who builds the house and is called "my son" = a TYPE of the
--     greater Son of David, the Prince of Peace (Isa 9:6) and the BRANCH who builds the true temple
--     (Zech 6:12-13), the temple of his body (John 2:19,21) — the Formed Son who HAS a Father
--     (Heb 1:5 "I will be to him a Father"), NOT co-equal-trinity grammar.
--   22:12-13 the charge to KEEP THE TORAH (the law of Yahuah, the statutes Yahuah charged Moses) as the
--     CONDITION of prospering = Torah affirmed as the king's rule (Deut 17:18-20, Josh 1:7-8) — Torah-
--     obedience never abolished, the very path of prospering; set the heart and soul to seek Yahuah.

CREATE TEMP VIEW _s313_chr22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the man of rest, the son whom Yahuah calls his son
    ('canon','1-chronicles',22,9,'canon','1-chronicles',17,11,'free',
     E'*And it shall come to pass, when thy days be expired that thou must go to be with thy fathers, that I will raise up thy seed after thee, which shall be of thy sons; and I will establish his kingdom* (1 Chronicles 17:11). The same word David now hands to Solomon: *a son shall be born to thee, who shall be a man of rest* (1 Chronicles 22:9). The seed promised in chapter 17 is the man of rest of chapter 22 — the throne established by Yahuah, not by David''s wars.'),
    ('canon','1-chronicles',22,10,'canon','1-chronicles',17,12,'free',
     E'*He shall build me an house, and I will stablish his throne for ever* (1 Chronicles 17:12). David repeats it to his son: *He shall build an house for my name... and I will establish the throne of his kingdom over Yashar''el (Israel) for ever* (1 Chronicles 22:10). The house-builder and the everlasting throne are one promise carried from the covenant-word to the charge.'),
    ('canon','1-chronicles',22,10,'canon','1-chronicles',17,13,'free',
     E'*I will be his father, and he shall be my son: and I will not take my mercy away from him* (1 Chronicles 17:13). It lands word-for-word in the charge: *he shall be my son, and I will be his father* (1 Chronicles 22:10). Solomon is the immediate son; the formula opens forward to the Formed Son who has a Father — never two co-equal persons, a Son begotten of the Most High.'),
    ('canon','1-chronicles',22,10,'canon','2-samuel',7,13,'free',
     E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The promise first given to David through Nathan is the very word David now charges to Solomon: *He shall build an house for my name... for ever* (1 Chronicles 22:10). The temple-builder and the eternal throne are bound from Samuel to Chronicles.'),
    ('canon','1-chronicles',22,10,'canon','2-samuel',7,14,'free',
     E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men* (2 Samuel 7:14). David echoes the covenant directly: *he shall be my son, and I will be his father* (1 Chronicles 22:10). The Father-and-Son formula is the throne''s charter — Solomon the type, the everlasting Son the fulfilment.'),
    ('canon','1-chronicles',22,10,'canon','hebrews',1,5,'free',
     E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The writer quotes this very charge — *he shall be my son, and I will be his father* (1 Chronicles 22:10) — and reads it past Solomon to the begotten Son. The Formed Son who has a Father, exalted above the angels, never a co-equal of the Most High.'),
    ('canon','1-chronicles',22,9,'apocrypha','ecclesiasticus',47,13,'extras',
     E'*Solomon reigned in a peaceable time, and was honoured; for Yahuah (God) made all quiet round about him, that he might build an house in his name, and prepare his sanctuary for ever* (Sirach / Ecclesiasticus 47:13). Ben Sira reads the chronicler exactly: *a man of rest... I will give peace and quietness unto Yashar''el (Israel) in his days. He shall build an house for my name* (1 Chronicles 22:9-10). The rest given is the condition of the house being built — the man of peace builds the house of peace.'),
    -- THREAD 2: the Prince of Peace and the Branch who builds the true temple
    ('canon','1-chronicles',22,9,'canon','isaiah',9,6,'free',
     E'*For unto us a child is born, unto us a son is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). Solomon (Shelomoh, peace) is the man of rest *and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9). The shadow names the substance: the Prince of Peace whose government has no end.'),
    ('canon','1-chronicles',22,10,'canon','zechariah',6,12,'free',
     E'*Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). David said of his son, *He shall build an house for my name* (1 Chronicles 22:10); the prophet lifts the office to the BRANCH who builds the true temple of Yahuah. Solomon the type, the Branch the antitype.'),
    ('canon','1-chronicles',22,10,'canon','zechariah',6,13,'free',
     E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:13). The temple-builder who sits and rules on the throne — *I will establish the throne of his kingdom over Yashar''el (Israel) for ever* (1 Chronicles 22:10) — is also the priest, the office Solomon could only foreshadow.'),
    ('canon','1-chronicles',22,10,'canon','john',2,19,'free',
     E'*Yahusha (Jesus) answered and said unto them, Destroy this temple, and in three days I will raise it up* (John 2:19). David''s son builds *an house for my name* (1 Chronicles 22:10); the greater Son builds a temple no hands cut — the true house Solomon''s stone house only pictured.'),
    ('canon','1-chronicles',22,10,'canon','john',2,21,'free',
     E'*But he spake of the temple of his body* (John 2:21). The house Solomon builds for the Name (1 Chronicles 22:10) finds its end in the temple of the Formed Son''s own body — the dwelling of the Name in flesh, raised in three days.'),
    -- THREAD 3: the charge to keep the Torah, the king's rule, the path of prospering
    ('canon','1-chronicles',22,12,'canon','deuteronomy',17,18,'free',
     E'*And it shall be, when he sitteth upon the throne of his kingdom, that he shall write him a copy of this law in a book out of that which is before the priests the Levites* (Deuteronomy 17:18). David charges Solomon to *keep the law of Yahuah Elohayka (the LORD thy God)* (1 Chronicles 22:12) — the Torah is the king''s appointed rule from Moses, the throne bound to the law it sits over.'),
    ('canon','1-chronicles',22,12,'canon','deuteronomy',17,19,'free',
     E'*And it shall be with him, and he shall read therein all the days of his life: that he may learn to fear Yahuah Elohav (the LORD his God), to keep all the words of this law and these statutes, to do them* (Deuteronomy 17:19). This is exactly the wisdom David prays over his son — *that thou mayest keep the law of Yahuah Elohayka* (1 Chronicles 22:12). The king''s wisdom is Torah-obedience, never wisdom apart from it.'),
    ('canon','1-chronicles',22,13,'canon','deuteronomy',17,20,'free',
     E'*That his heart be not lifted up above his brethren, and that he turn not aside from the commandment, to the right hand, or to the left: to the end that he may prolong his days in his kingdom* (Deuteronomy 17:20). David ties prospering to the same obedience: *Then shalt thou prosper, if thou takest heed to fulfil the statutes and judgments which Yahuah (LORD) charged Moses with concerning Yashar''el (Israel)* (1 Chronicles 22:13). Keeping the Torah is the condition of the throne''s endurance.'),
    ('canon','1-chronicles',22,13,'canon','joshua',1,7,'free',
     E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). David''s charge is Joshua''s charge word for word — *be strong, and of good courage... Then shalt thou prosper, if thou takest heed to fulfil the statutes and judgments which Yahuah (LORD) charged Moses* (1 Chronicles 22:13). Courage and prospering both hang on doing the law.'),
    ('canon','1-chronicles',22,13,'canon','joshua',1,8,'free',
     E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night... for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). The chronicler''s formula is the same Torah-prospering bond — *Then shalt thou prosper, if thou takest heed to fulfil the statutes and judgments* (1 Chronicles 22:13). The Torah meditated and done is the way made prosperous.'),
    ('canon','1-chronicles',22,13,'canon','psalms',1,2,'free',
     E'*But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). The blessed man and the charged king share one rule: the law of Yahuah kept and loved, the very heed David urges — *if thou takest heed to fulfil the statutes and judgments which Yahuah (LORD) charged Moses* (1 Chronicles 22:13).'),
    ('canon','1-chronicles',22,13,'canon','psalms',1,3,'free',
     E'*And he shall be like a tree planted by the rivers of water, that bringeth forth his fruit in his season... and whatsoever he doeth shall prosper* (Psalm 1:3). The Psalm''s promise is David''s promise to Solomon — *Then shalt thou prosper* (1 Chronicles 22:13) — and both root the prospering in the law delighted in and done, never apart from it.'),
    ('canon','1-chronicles',22,13,'canon','1-kings',2,3,'free',
     E'*And keep the charge of Yahuah Elohayka (the LORD thy God), to walk in his ways, to keep his statutes, and his commandments, and his judgments, and his testimonies, as it is written in the law of Moses, that thou mayest prosper in all that thou doest* (1 Kings 2:3). David''s dying words to Solomon repeat this very charge — *that thou mayest keep the law... Then shalt thou prosper* (1 Chronicles 22:12-13). The law of Moses kept is, twice over, the king''s path of prospering.'),
    -- THREAD 4: David could not build because of blood; the man of rest shall
    ('canon','1-chronicles',22,8,'canon','1-kings',5,3,'free',
     E'*Thou knowest how that David my father could not build an house unto the name of Yahuah Elohav (the LORD his God) for the wars which were about him on every side, until Yahuah (LORD) put them under the soles of his feet* (1 Kings 5:3). Solomon names the same word David received — *Thou hast shed blood abundantly, and hast made great wars: thou shalt not build an house unto my name* (1 Chronicles 22:8). The man of war prepares; the man of rest builds.'),
    ('canon','1-chronicles',22,8,'canon','1-kings',5,4,'free',
     E'*But now Yahuah Elohai (the LORD my God) hath given me rest on every side, so that there is neither adversary nor evil occurrent* (1 Kings 5:4). The rest promised to Solomon — *a man of rest; and I will give him rest from all his enemies round about* (1 Chronicles 22:9) — is the rest he now enjoys, the very ground on which the house is at last built.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son',
       E'Solomon the man of rest, the son whom Yahuah calls his son',
       E'David hands his son the very covenant-word he himself received: *Behold, a son shall be born to thee, who shall be a man of rest... for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days. He shall build an house for my name; and he shall be my son, and I will be his father; and I will establish the throne of his kingdom over Yashar''el (Israel) for ever* (1 Chronicles 22:9-10). This is the Davidic covenant of chapter 17 carried into the charge — *I will raise up thy seed after thee... He shall build me an house, and I will stablish his throne for ever... I will be his father, and he shall be my son* (1 Chronicles 17:11-13) — and the same word first spoken through Nathan: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever. I will be his father, and he shall be my son* (2 Samuel 7:13-14). Ben Sira reads it plainly: *Solomon reigned in a peaceable time... for Yahuah (God) made all quiet round about him, that he might build an house in his name* (Sirach / Ecclesiasticus 47:13) — the rest given is the ground the house is built upon. Solomon is the man of rest, but the formula reaches past him: *Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The Father-and-Son charter of the throne opens forward to the Formed Son who has a Father — begotten of the Most High, exalted above the angels, never a co-equal person.',
       sv.verse_id, ev.verse_id, 'extras', 30525
  FROM _s313_chr22_lookup sv, _s313_chr22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple',
       E'The Prince of Peace and the Branch who builds the true temple',
       E'Solomon (Shelomoh, peace) is *a man of rest... and I will give peace and quietness unto Yashar''el (Israel) in his days. He shall build an house for my name* (1 Chronicles 22:9-10). The shadow names the substance the prophets see: *unto us a son is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). The temple-building office is lifted from Solomon to the BRANCH: *Behold the man whose name is The BRANCH... and he shall build the temple of Yahuah (LORD)... and he shall be a priest upon his throne* (Zechariah 6:12-13). And the true house is no quarried stone but the Formed Son''s own body: *Destroy this temple, and in three days I will raise it up... But he spake of the temple of his body* (John 2:19,21). Solomon the type — the man of peace who builds the house; the greater Son of David the antitype — the Prince of Peace, the Branch and the Priest, who builds and IS the true temple.',
       sv.verse_id, ev.verse_id, 'free', 30526
  FROM _s313_chr22_lookup sv, _s313_chr22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering',
       E'The charge to keep the Torah: the king''s rule and the path of prospering',
       E'David''s prayer over his son is not for wealth or conquest but for wisdom unto obedience: *Only Yahuah (LORD) give thee wisdom and understanding, and give thee charge concerning Yashar''el (Israel), that thou mayest keep the law of Yahuah Elohayka (the LORD thy God). Then shalt thou prosper, if thou takest heed to fulfil the statutes and judgments which Yahuah (LORD) charged Moses with concerning Yashar''el (Israel): be strong, and of good courage* (1 Chronicles 22:12-13). This is the king''s appointed rule from Moses: *when he sitteth upon the throne... he shall write him a copy of this law... and he shall read therein all the days of his life... to keep all the words of this law and these statutes, to do them... to the end that he may prolong his days in his kingdom* (Deuteronomy 17:18-20). It is Joshua''s charge word for word — *be thou strong and very courageous, that thou mayest observe to do according to all the law... that thou mayest prosper whithersoever thou goest... then thou shalt make thy way prosperous* (Joshua 1:7-8) — and the Psalm''s blessing: *his delight is in the law of Yahuah (LORD)... and whatsoever he doeth shall prosper* (Psalm 1:2-3). David repeats it on his deathbed: *keep his statutes, and his commandments, and his judgments, and his testimonies, as it is written in the law of Moses, that thou mayest prosper* (1 Kings 2:3). The Torah is the throne''s rule and the very condition of prospering — kept, done, never abolished; set the heart and soul to seek Yahuah and build the sanctuary.',
       sv.verse_id, ev.verse_id, 'free', 30527
  FROM _s313_chr22_lookup sv, _s313_chr22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=22 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-22-david-could-not-build-because-of-blood-solomon-the-man-of-rest-shall',
       E'David could not build because of blood; the man of rest shall',
       E'The word that barred David from the work is plain: *Thou hast shed blood abundantly, and hast made great wars: thou shalt not build an house unto my name, because thou hast shed much blood upon the earth in my sight* (1 Chronicles 22:8). Solomon himself recalls it: *Thou knowest how that David my father could not build an house unto the name of Yahuah Elohav (the LORD his God) for the wars which were about him on every side, until Yahuah (LORD) put them under the soles of his feet* (1 Kings 5:3). The house of the Name is not built by the man of war but by the man of rest: *But now Yahuah Elohai (the LORD my God) hath given me rest on every side, so that there is neither adversary nor evil occurrent* (1 Kings 5:4) — the very rest promised to Solomon, *a man of rest; and I will give him rest from all his enemies round about* (1 Chronicles 22:9). The man of war prepares the materials; the man of rest builds the house.',
       sv.verse_id, ev.verse_id, 'free', 30528
  FROM _s313_chr22_lookup sv, _s313_chr22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=22 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 17:11 — *I will raise up thy seed after thee... and I will establish his kingdom*: the seed of chapter 17 is the man of rest of chapter 22.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=9
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Chronicles 17:12 — *He shall build me an house, and I will stablish his throne for ever*: the house-builder and the everlasting throne, one promise.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Chronicles 17:13 — *I will be his father, and he shall be my son*: the formula opens forward to the Formed Son who has a Father.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Samuel 7:13 — *He shall build an house for my name... for ever*: the covenant first given through Nathan, repeated to Solomon.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Samuel 7:14 — *I will be his father, and he shall be my son*: the Father-and-Son charter of the throne, Solomon the type.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Hebrews 1:5 — *I will be to him a Father, and he shall be to me a Son*: read past Solomon to the begotten Son, exalted above the angels.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Sirach / Ecclesiasticus 47:13 — *Solomon reigned in a peaceable time... that he might build an house in his name*: the rest given is the ground the house is built upon.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=9
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-solomon-the-man-of-rest-the-son-whom-yahuah-calls-his-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 9:6 — *unto us a son is given... Sar Shalom (The Prince of Peace)*: the shadow (Shelomoh, peace) names the substance.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=9
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Zechariah 6:12 — *Behold the man whose name is The BRANCH... and he shall build the temple of Yahuah*: the temple-building office lifted from Solomon to the Branch.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Zechariah 6:13 — *he shall build the temple of Yahuah... and he shall be a priest upon his throne*: the temple-builder who is also the priest, the office Solomon only foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 2:19 — *Destroy this temple, and in three days I will raise it up*: the greater Son builds a temple no hands cut.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'John 2:21 — *But he spake of the temple of his body*: the house for the Name finds its end in the temple of the Formed Son''s body.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-prince-of-peace-and-the-branch-who-builds-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 17:18 — *he shall write him a copy of this law in a book*: the Torah is the king''s appointed rule from Moses.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=12
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 17:19 — *he shall read therein all the days of his life... to keep all the words of this law*: the king''s wisdom is Torah-obedience.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=12
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 17:20 — *that he turn not aside from the commandment... that he may prolong his days*: keeping the Torah is the condition of the throne''s endurance.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Joshua 1:7 — *observe to do according to all the law... that thou mayest prosper*: David''s charge is Joshua''s charge word for word.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Joshua 1:8 — *thou shalt meditate therein day and night... then thou shalt make thy way prosperous*: the Torah meditated and done is the way made prosperous.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 1:2 — *his delight is in the law of Yahuah... and in his law doth he meditate day and night*: the blessed man and the charged king share one rule.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Psalm 1:3 — *whatsoever he doeth shall prosper*: the prospering is rooted in the law delighted in and done, never apart from it.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'1 Kings 2:3 — *keep his statutes... as it is written in the law of Moses, that thou mayest prosper*: David''s dying words repeat the charge — the law of Moses kept is the king''s path of prospering.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-the-charge-to-keep-the-torah-the-kings-rule-and-the-path-of-prospering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 5:3 — *David my father could not build an house... for the wars which were about him*: Solomon recalls the same word that barred David.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-david-could-not-build-because-of-blood-solomon-the-man-of-rest-shall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 5:4 — *Yahuah Elohai (the LORD my God) hath given me rest on every side*: the rest promised to Solomon is the ground on which the house is at last built.'
  FROM cross_reference_threads t
  JOIN _s313_chr22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s313_chr22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-22-david-could-not-build-because-of-blood-solomon-the-man-of-rest-shall'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_23.sql (1 Chronicles 23) -----
-- 1 Chronicles 23 — David numbers and orders the Levites for the house of Yahuah
-- tag: chr23   session prefix: s313   temp view: _s313_chr23_lookup
-- sort_order band: 30550, 30551, 30552 (+1 per thread)
-- book_slug: 1-chronicles   chapter: 23
--
-- 1 Chronicles 23 coverage:
--   v.1-2  (David old, full of days, makes Solomon king, gathers Israel/priests/Levites)
--          NT:     none warranted (folded into the rest-given thread as setting)
--          Extras: none warranted
--          Tanakh: none warranted (succession framing; carried inside thread A)
--   v.13   (Aaron separated, to sanctify the most holy things, to bless in his name for ever)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 6:23-24 (the Aaronic blessing in the Name) -> thread C
--   v.25-26 (Yahuah hath given rest; the Levites shall no more carry the tabernacle)
--          NT:     Hebrews 4:8-10 (if Jeshua had given them rest... there remaineth a rest) -> thread A
--          Extras: none warranted
--          Tanakh: Deuteronomy 12:10-11 (rest, then the place he chooses); Joshua 21:44; 1 Kings 8:56 -> thread A
--   v.28-29 (the Levites' office: courts, chambers, purifying, shewbread)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (the ordered charge; carried into threads B/C)
--   v.30   (to stand every morning and evening to thank and praise Yahuah)
--          NT:     Hebrews 13:15 (the sacrifice of praise continually) -> thread B
--          Extras: none warranted
--          Tanakh: Psalm 92:1-2 (lovingkindness in the morning, faithfulness every night);
--                  Psalm 134:1 (servants by night in the house); Numbers 28:3-4 (morning and evening lamb) -> thread B
--   v.31   (burnt offerings in the sabbaths, new moons, set feasts, continually)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Leviticus 23:2-3 (the feasts of Yahuah, the sabbath); Isaiah 66:23 (new moon to new moon, sabbath to sabbath) -> thread C
--   v.32   (keep the charge of the tabernacle / holy place) -> carried in threads B/C, no standalone add
--
-- THREADS:
--   A 1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more  (free) -> Tanakh + NT (Deut 12, Josh 21, 1 Kings 8, Heb 4)
--   B 1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah  (free) -> Tanakh + NT (Ps 92, Ps 134, Num 28, Heb 13)
--   C 1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name  (free) -> Tanakh (Lev 23, Isa 66, Num 6)
--
-- GUARD: the rest given (23:25) that ends the carrying = the settled house, a foretaste of the
-- greater rest that remains (Heb 4:9) -- never the rest that abolishes the Sabbath but the rest
-- the Sabbath itself signs. The continual morning/evening praise (23:30) and the sabbaths, new
-- moons, set feasts kept continually (23:31) = the appointed worship the framework upholds (Lev
-- 23 stands; Isa 66:23 keeps new moon and sabbath into the new heavens), NOT a shadow discarded.

CREATE TEMP VIEW _s313_chr23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD A: the rest given, the Levites carry no more
  ('canon','1-chronicles',23,25,'canon','deuteronomy',12,10,'free',
   E'*But when ye go over Jordan, and dwell in the land which Yahuah Elohaychem (the LORD your God) giveth you to inherit, and when he giveth you rest from all your enemies round about, so that ye dwell in safety* (Deuteronomy 12:10). David''s reason, *Yahuah Elohim (The LORD God) of Yashar''el (Israel) hath given rest unto his people* (1 Chronicles 23:25), is the Torah-promise come true: the rest from enemies that makes a settled dwelling possible.'),
  ('canon','1-chronicles',23,25,'canon','deuteronomy',12,11,'free',
   E'*Then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there; thither shall ye bring all that I command you* (Deuteronomy 12:11). The rest given (23:25) is exactly the hinge Moses named: when the rest comes, the wandering ends and the chosen place receives the worship -- which is why the Levites *shall no more carry the tabernacle* (23:26).'),
  ('canon','1-chronicles',23,25,'canon','joshua',21,44,'free',
   E'*And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers; and there stood not a man of all their enemies before them* (Joshua 21:44). The same word, *hath given rest unto his people* (1 Chronicles 23:25): the oath-sworn rest fulfilled in Joshua now grounds David''s release of the Levites from their carrying-service.'),
  ('canon','1-chronicles',23,25,'canon','1-kings',8,56,'free',
   E'*Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised: there hath not failed one word of all his good promise* (1 Kings 8:56). Solomon at the dedication of the very house David prepared echoes David''s word *hath given rest unto his people* (1 Chronicles 23:25) -- the rest given is the standing temple, the wandering tabernacle laid down.'),
  ('canon','1-chronicles',23,26,'canon','1-kings',8,56,'free',
   E'*Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised* (1 Kings 8:56). *They shall no more carry the tabernacle, nor any vessels of it* (1 Chronicles 23:26): because the rest was given, the staves were drawn out and the carrying ended -- the very thing Solomon blesses Yahuah for at the dedication.'),
  ('canon','1-chronicles',23,25,'canon','hebrews',4,8,'free',
   E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). The rest given through Joshua and sealed by David''s settled house (23:25) was real yet not the end -- the Spirit afterward still speaks of *To day*, pointing past the land-rest to the rest that remains.'),
  ('canon','1-chronicles',23,25,'canon','hebrews',4,9,'free',
   E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). David''s *hath given rest unto his people* (1 Chronicles 23:25) is the foretaste; the settled house and the laid-down tabernacle are a figure of the greater rest still kept for Yahuah''s people -- the rest the Sabbath itself signs, never the rest that cancels it.'),
  ('canon','1-chronicles',23,26,'canon','hebrews',4,10,'free',
   E'*For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The Levites *shall no more carry the tabernacle* (1 Chronicles 23:26): the ceasing from the burden of the wandering shadows the deeper ceasing -- entering the rest that mirrors the seventh-day rest of creation.'),

  -- THREAD B: stand every morning and evening to praise Yahuah continually
  ('canon','1-chronicles',23,30,'canon','psalms',92,1,'free',
   E'*It is a good thing to give thanks unto Yahuah (LORD), and to sing praises unto thy name, O El Elyon (most High)* (Psalm 92:1). The Levites'' charge *to stand every morning to thank and praise Yahuah (LORD), and likewise at even* (1 Chronicles 23:30) is the practice this Sabbath psalm commands -- thanksgiving and praise as the appointed good thing.'),
  ('canon','1-chronicles',23,30,'canon','psalms',92,2,'free',
   E'*To shew forth thy lovingkindness in the morning, and thy faithfulness every night* (Psalm 92:2). This is the morning-and-evening rhythm exactly: the Levites stand *every morning... and likewise at even* (1 Chronicles 23:30) to lift the lovingkindness at dawn and the faithfulness at dusk.'),
  ('canon','1-chronicles',23,30,'canon','psalms',134,1,'free',
   E'*Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1). The very picture of 23:30 -- the servants who *stand* in the house to bless Yahuah, the night-watch of praise that answers the morning thanks the Levites were charged to keep.'),
  ('canon','1-chronicles',23,30,'canon','numbers',28,3,'free',
   E'*This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3). The praise *every morning... and likewise at even* (1 Chronicles 23:30) rises beside the continual offering Torah set -- the daily lamb is the altar to which the daily praise is joined.'),
  ('canon','1-chronicles',23,30,'canon','numbers',28,4,'free',
   E'*The one lamb shalt thou offer in the morning, and the other lamb shalt thou offer at even* (Numbers 28:4). The morning-and-evening lamb gives the praise of 23:30 its very hours: *every morning... and likewise at even* -- the song timed to the continual offering Yahuah commanded at Sinai.'),
  ('canon','1-chronicles',23,30,'canon','hebrews',13,15,'free',
   E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The Levites'' continual standing *to thank and praise Yahuah* (1 Chronicles 23:30) is the same sacrifice of praise, now offered continually through the Formed Son -- the ordered worship carried forward, not abolished.'),

  -- THREAD C: the appointed times kept continually, and blessed in his name
  ('canon','1-chronicles',23,31,'canon','leviticus',23,2,'free',
   E'*Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). The Levites offer *in the sabbaths, in the new moons, and on the set feasts... according to the order commanded* (1 Chronicles 23:31): the calendar they keep is Yahuah''s own appointed times, His feasts, not a human schedule.'),
  ('canon','1-chronicles',23,31,'canon','leviticus',23,3,'free',
   E'*Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation... it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3). The sabbaths kept *continually before Yahuah* (1 Chronicles 23:31) are this very Sabbath -- the first of the appointed times, the framework the Levitical service upholds.'),
  ('canon','1-chronicles',23,31,'canon','isaiah',66,23,'free',
   E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The new moons and sabbaths of 23:31 are not a passing shadow: Isaiah carries them forward into the new heavens, all flesh worshipping by the same appointed times the Levites kept continually.'),
  ('canon','1-chronicles',23,13,'canon','numbers',6,23,'free',
   E'*Speak unto Aaron and unto his sons, saying, On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23). Aaron was *separated, that he should sanctify the most holy things... and to bless in his name for ever* (1 Chronicles 23:13): the blessing in the Name that the courses serve is the Aaronic blessing Yahuah gave at Sinai.'),
  ('canon','1-chronicles',23,13,'canon','numbers',6,24,'free',
   E'*Yahuah (LORD) bless thee, and keep thee* (Numbers 6:24). This is the blessing *in his name for ever* (1 Chronicles 23:13) -- the Name set upon the people through Aaron and his sons, the priestly charge the whole ordered Levitical service exists to carry.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more',
       E'Yahuah Hath Given Rest — the Levites Carry the Tabernacle No More',
       E'David, *old and full of days* (1 Chronicles 23:1), numbers the Levites and gives the reason the wandering is over: *For David said, Yahuah Elohim (The LORD God) of Yashar''el (Israel) hath given rest unto his people, that they may dwell in Jerusalem for ever: And also unto the Levites; they shall no more carry the tabernacle, nor any vessels of it for the service thereof* (1 Chronicles 23:25-26). The carrying-service ends because the rest is given.\n\nThis rest is the Torah-promise kept. Moses had named the hinge: *when he giveth you rest from all your enemies round about, so that ye dwell in safety* (Deuteronomy 12:10), *then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there* (Deuteronomy 12:11). The rest comes first, then the settled place. Joshua records it fulfilled — *And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers* (Joshua 21:44) — and Solomon, dedicating the house David prepared, blesses Yahuah *that hath given rest unto his people Yashar''el (Israel), according to all that he promised* (1 Kings 8:56). The laid-down tabernacle is the standing temple; the rest given is the wandering ended.\n\nYet the land-rest is a foretaste, not the end. *For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8); *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9); *For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10). The Levites ceasing from the burden of the carrying shadows the deeper ceasing — the rest the Sabbath itself signs, the seventh-day rest of creation kept open for Yahuah''s people. The settled house is a figure of the greater rest still to come.',
       sv.verse_id, ev.verse_id, 'free', 30550
  FROM _s313_chr23_lookup sv, _s313_chr23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=23 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah',
       E'To Stand Every Morning and Evening — the Continual Sacrifice of Praise',
       E'The Levites'' charge is the unbroken worship of the house: *And to stand every morning to thank and praise Yahuah (LORD), and likewise at even* (1 Chronicles 23:30). The morning-and-evening rhythm is the very shape of the Sabbath psalm — *It is a good thing to give thanks unto Yahuah (LORD), and to sing praises unto thy name, O El Elyon (most High)* (Psalm 92:1), *To shew forth thy lovingkindness in the morning, and thy faithfulness every night* (Psalm 92:2). The night-watch of praise answers the morning thanks: *Behold, bless ye Yahuah (LORD), all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1).\n\nThe song is timed to the altar. Torah set a *continual burnt offering* — *two lambs of the first year without spot day by day* (Numbers 28:3), *The one lamb shalt thou offer in the morning, and the other lamb shalt thou offer at even* (Numbers 28:4). The praise rises beside the daily lamb; the hours of the song are the hours of the offering.\n\nAnd the continual praise is carried forward, not abolished: *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The Levites'' standing *to thank and praise Yahuah* becomes the sacrifice of praise offered continually through the Formed Son — the same ordered worship, now fruit of the lips, the framework upheld.',
       sv.verse_id, ev.verse_id, 'free', 30551
  FROM _s313_chr23_lookup sv, _s313_chr23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=23 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name',
       E'The Sabbaths, New Moons, and Set Feasts Kept Continually — Blessed in His Name',
       E'The Levitical service is ordered around Yahuah''s calendar and Yahuah''s Name. The offerings rise *in the sabbaths, in the new moons, and on the set feasts, by number, according to the order commanded unto them, continually before Yahuah (LORD)* (1 Chronicles 23:31). These are not a human schedule but His own appointed times: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2), and first among them, *the seventh day is the sabbath of rest, an holy convocation... it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3).\n\nThese appointed times are no passing shadow. Isaiah carries them clear into the new heavens: *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The new moons and sabbaths the Levites kept continually are the new moons and sabbaths all flesh will keep before Him.\n\nAt the head of the service stands the priestly blessing in the Name. Aaron was *separated, that he should sanctify the most holy things... to minister unto him, and to bless in his name for ever* (1 Chronicles 23:13). That blessing in the Name is the Aaronic blessing Yahuah gave at Sinai: *On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23) — *Yahuah (LORD) bless thee, and keep thee* (Numbers 6:24). The Name set upon the people, the feasts kept continually, the courses serving the charge: the whole ordered framework the chapter builds.',
       sv.verse_id, ev.verse_id, 'free', 30552
  FROM _s313_chr23_lookup sv, _s313_chr23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=23 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD A
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*when he giveth you rest from all your enemies round about, so that ye dwell in safety* (Deuteronomy 12:10) — the Torah-hinge: rest first, then the settled dwelling David names in 23:25.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*then there shall be a place which Yahuah Elohaychem (the LORD your God) shall choose to cause his name to dwell there* (Deuteronomy 12:11) — when the rest comes the wandering ends, so the Levites carry no more (23:26).'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And Yahuah (LORD) gave them rest round about, according to all that he sware unto their fathers* (Joshua 21:44) — the oath-sworn rest fulfilled, grounding *hath given rest unto his people* (23:25).'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel)* (1 Kings 8:56) — Solomon at the dedication echoes David''s very word from 23:25.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*that hath given rest unto his people Yashar''el (Israel), according to all that he promised* (1 Kings 8:56) — because the rest was given, *they shall no more carry the tabernacle* (23:26).'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*For if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8) — the land-rest of 23:25 was real yet not the end.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — David''s rest given (23:25) is the foretaste of the greater rest still kept, the rest the Sabbath signs.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*For he that is entered into his rest, he also hath ceased from his own works, as Elohim (God) did from his* (Hebrews 4:10) — the Levites ceasing from the carrying (23:26) shadows the deeper ceasing of the creation-rest.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-yahuah-hath-given-rest-the-levites-carry-no-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD B
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*It is a good thing to give thanks unto Yahuah (LORD), and to sing praises unto thy name, O El Elyon (most High)* (Psalm 92:1) — the appointed good thing the Levites stand to do (23:30).'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To shew forth thy lovingkindness in the morning, and thy faithfulness every night* (Psalm 92:2) — the exact morning-and-evening rhythm of 23:30.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all ye servants of Yahuah (LORD), which by night stand in the house of Yahuah (LORD)* (Psalm 134:1) — the servants who stand in the house to bless, the night-watch answering 23:30.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=134 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3) — the praise of 23:30 rises beside the continual offering Torah set.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The one lamb shalt thou offer in the morning, and the other lamb shalt thou offer at even* (Numbers 28:4) — the morning-and-evening lamb gives 23:30 its very hours.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15) — the continual praise of 23:30 carried forward through the Formed Son, not abolished.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=30
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-to-stand-every-morning-and-evening-to-praise-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD C
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) — the set feasts of 23:31 are Yahuah''s own appointed times.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=31
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the seventh day is the sabbath of rest, an holy convocation... it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3) — the sabbaths kept continually in 23:31 are this very Sabbath, the first appointed time.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=31
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the new moons and sabbaths of 23:31 carried into the new heavens, no passing shadow.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=31
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*On this wise ye shall bless the children of Yashar''el (Israel)* (Numbers 6:23) — the blessing in the Name for ever (23:13) is the Aaronic blessing Yahuah gave at Sinai.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=13
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) bless thee, and keep thee* (Numbers 6:24) — the Name set upon the people through Aaron, the priestly charge the whole ordered service of 23:13 carries.'
  FROM cross_reference_threads t
  JOIN _s313_chr23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=23 AND sv.verse_number=13
  JOIN _s313_chr23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-23-the-appointed-times-kept-continually-and-blessed-in-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_24.sql (1 Chronicles 24) -----
-- 1 Chronicles 24 — the twenty-four courses of the priests
-- tag: chr24 ; session prefix: s313 ; temp view: _s313_chr24_lookup
-- slug prefix: 1-chronicles-24- ; sort_order band start: 30575 (+1 per thread)
-- source: canon 1-chronicles ch24
--
-- 1 Chronicles 24 coverage:
--   v.1-2  (Nadab & Abihu died, no children; Eleazar & Ithamar executed the priest's office)
--          NT:     none warranted (the strange-fire judgment is woven via the Torah witnesses)
--          Extras: none warranted
--          Tanakh: Leviticus 10:1-2 (strange fire devoured), Numbers 3:4 (died before Yahuah, no children) — THREAD 1
--   v.3-19 (David divides the priests by lot into 24 courses; v.10 the eighth to Abijah;
--           v.19 the orderings as Yahuah Elohim had commanded)
--          NT:     Luke 1:5 (Zacharias of the course of Abia), Luke 1:8 (executed priest's office in
--                  the order of his course), Luke 1:9 (his lot to burn incense in the temple) — THREAD 2
--          Extras: none warranted (the ordered priesthood is carried by the canon witnesses)
--          Tanakh: (the source bounds the thread)
--   v.5,31 (divided by lot; the Levites cast lots over against their brethren)
--          NT:     Acts 1:26 (the lot fell upon Matthias) — THREAD 3
--          Extras: none warranted
--          Tanakh: Proverbs 16:33 (the lot is cast, the disposing is of Yahuah) — THREAD 3
--
-- THREADS:
--   1. 1-chronicles-24-nadab-and-abihu-died-before-their-father (free) — Tanakh: Lev 10:1-2, Num 3:4
--   2. 1-chronicles-24-the-twenty-four-courses-the-order-of-abijah-to-zacharias (free) — NT: Luke 1:5,8,9
--   3. 1-chronicles-24-the-lot-cast-the-disposing-of-yahuah (free) — Tanakh: Prov 16:33 ; NT: Acts 1:26

CREATE TEMP VIEW _s313_chr24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Nadab and Abihu died before their father, had no children
    ('canon','1-chronicles',24,2,'canon','leviticus',10,1,'free',
      E'*And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1). The roll of the courses opens by remembering why only two of Aaron''s four sons carry the priesthood forward — *But Nadab and Abihu died before their father, and had no children: therefore Eleazar and Ithamar executed the priest''s office* (1 Chronicles 24:2). The strange fire that *he commanded them not* is the wound the genealogy still bears.'),
    ('canon','1-chronicles',24,2,'canon','leviticus',10,2,'free',
      E'*And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:2). This is the death the Chronicler points back to in *But Nadab and Abihu died before their father, and had no children* (1 Chronicles 24:2) — the worship of Yahuah is ordered worship, and the elder two sons fell because they would not keep it so. The twenty-four courses that follow are the answer: an appointed service that comes near *which he commanded.*'),
    ('canon','1-chronicles',24,2,'canon','numbers',3,4,'free',
      E'*And Nadab and Abihu died before Yahuah (LORD), when they offered strange fire before Yahuah (LORD), in the wilderness of Sinai, and they had no children: and Eleazar and Ithamar ministered in the priest''s office in the sight of Aaron their father* (Numbers 3:4). Numbers records the very fact David''s register repeats — *Eleazar and Ithamar executed the priest''s office* (1 Chronicles 24:2) — because *they had no children*; the two surviving lines are the channel through which the whole priesthood is now divided.'),

    -- THREAD 2: the 24 courses ordered as Yahuah commanded; the course of Abijah to Zacharias
    ('canon','1-chronicles',24,10,'canon','luke',1,5,'free',
      E'*There was in the days of Herod, the king of Judæa, a certain priest named Zacharias, of the course of Abia: and his wife was of the daughters of Aaron, and her name was Elisabeth* (Luke 1:5). The eighth lot David drew — *the eighth to Abijah* (1 Chronicles 24:10) — is the course of Abia still serving at the dawn of the gospel. The order David set down is unbroken: the father of John the Baptist stands in the very rotation cast by lot in this chapter.'),
    ('canon','1-chronicles',24,19,'canon','luke',1,8,'free',
      E'*And it came to pass, that while he executed the priest''s office before Elohim (God) in the order of his course* (Luke 1:8). This is the living continuance of *These were the orderings of them in their service to come into the house of Yahuah (LORD), according to their manner, under Aaron their father, as Yahuah Elohim (the LORD God) of Yashar''el (Israel) had commanded him* (1 Chronicles 24:19). The appointed service, ordered as Yahuah commanded, was still functioning *in the order of his course* when the Messiah''s forerunner was announced.'),
    ('canon','1-chronicles',24,19,'canon','luke',1,9,'free',
      E'*According to the custom of the priest''s office, his lot was to burn incense when he went into the temple of Yahuah (Lord)* (Luke 1:9). The courses *to come into the house of Yahuah (LORD)... as Yahuah Elohim (the LORD God) of Yashar''el (Israel) had commanded him* (1 Chronicles 24:19) are still drawing lots for their turn at the altar centuries later — the Torah-ordained priestly worship David ordered is unbroken into the gospel era, the angel meeting Zacharias at the incense his course had drawn.'),

    -- THREAD 3: divided by lot, the disposing of Yahuah
    ('canon','1-chronicles',24,5,'canon','proverbs',16,33,'free',
      E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). The priests are set in their courses not by rank or favor but *by lot, one sort with another* (1 Chronicles 24:5) — and the lot is no chance. The hand that falls on Eleazar or Ithamar is Yahuah''s own ordering; the casting in the lap is the disposing of Yahuah.'),
    ('canon','1-chronicles',24,31,'canon','acts',1,26,'free',
      E'*And they gave forth their lots; and the lot fell upon Matthias; and he was numbered with the eleven apostles* (Acts 1:26). The Levites *likewise cast lots over against their brethren the sons of Aaron* (1 Chronicles 24:31), small and great alike, that Yahuah might assign each his place; so the eleven cast lots to fill the twelfth seat, trusting the same hand to dispose the appointment.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-24-nadab-and-abihu-died-before-their-father',
  E'Nadab and Abihu died before their father — the strange fire remembered',
  E'The register of the priestly courses opens with a scar: *Now these are the divisions of the sons of Aaron. The sons of Aaron; Nadab, and Abihu, Eleazar, and Ithamar. But Nadab and Abihu died before their father, and had no children: therefore Eleazar and Ithamar executed the priest''s office* (1 Chronicles 24:1-2). The Chronicler does not explain — he expects the reader to know. Leviticus told it: *And Nadab and Abihu, the sons of Aaron, took either of them his censer, and put fire therein, and put incense thereon, and offered strange fire before Yahuah (LORD), which he commanded them not. And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:1-2). Numbers seals the same fact into the genealogy: *And Nadab and Abihu died before Yahuah (LORD), when they offered strange fire before Yahuah (LORD), in the wilderness of Sinai, and they had no children: and Eleazar and Ithamar ministered in the priest''s office in the sight of Aaron their father* (Numbers 3:4). The whole twenty-four-course order that follows grows from this: the worship of Yahuah is worship *which he commanded*, not fire offered as men please. The two surviving lines, Eleazar and Ithamar, are the channel through which the appointed service is now divided and set in order.',
  sv.verse_id, ev.verse_id, 'free', 30575
  FROM _s313_chr24_lookup sv, _s313_chr24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=24 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-24-the-twenty-four-courses-the-order-of-abijah-to-zacharias',
  E'The twenty-four courses — the order of Abijah unbroken to Zacharias',
  E'David, with Zadok of the sons of Eleazar and Ahimelech of the sons of Ithamar, *divided them by lot, one sort with another* into twenty-four courses for orderly service in the sanctuary (1 Chronicles 24:3-5). The lots are named one by one — *Now the first lot came forth to Jehoiarib, the second to Jedaiah... The seventh to Hakkoz, the eighth to Abijah* (1 Chronicles 24:7,10) — and the whole list is sealed: *These were the orderings of them in their service to come into the house of Yahuah (LORD), according to their manner, under Aaron their father, as Yahuah Elohim (the LORD God) of Yashar''el (Israel) had commanded him* (1 Chronicles 24:19). This is the appointed, divinely-ordered priestly service — *as Yahuah Elohim... had commanded* — not a human convenience. And it does not die with David. Centuries later the gospel opens on the very same rotation: *There was in the days of Herod, the king of Judæa, a certain priest named Zacharias, of the course of Abia: and his wife was of the daughters of Aaron, and her name was Elisabeth* (Luke 1:5) — the course of Abia is the eighth lot drawn in this chapter. *And it came to pass, that while he executed the priest''s office before Elohim (God) in the order of his course* (Luke 1:8), *according to the custom of the priest''s office, his lot was to burn incense when he went into the temple of Yahuah (Lord)* (Luke 1:9). The Torah-ordained worship David set in order was still functioning, course by course, lot by lot, when the angel announced the Messiah''s forerunner. The appointed service is unbroken to the dawn of the gospel — the commandment kept, not abolished.',
  sv.verse_id, ev.verse_id, 'free', 30576
  FROM _s313_chr24_lookup sv, _s313_chr24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=24 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-24-the-lot-cast-the-disposing-of-yahuah',
  E'The lot cast into the lap — the disposing is of Yahuah',
  E'Every course in this chapter is set *by lot, one sort with another; for the governors of the sanctuary, and governors of the house of Elohim (God)* (1 Chronicles 24:5), and the Levites too *likewise cast lots over against their brethren the sons of Aaron in the presence of David the king* (1 Chronicles 24:31), the small as well as the great. The lot is the great leveler — no rank, no favoritism, the appointment falling impartially. Yet it is no chance: *The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33). The hand that drops the stone in the lap is Yahuah''s own hand assigning each his place at the altar. So when the eleven needed to fill the twelfth seat, they trusted the same ordering: *And they gave forth their lots; and the lot fell upon Matthias; and he was numbered with the eleven apostles* (Acts 1:26). From the courses of Aaron to the apostolic twelve, the casting in the lap is the disposing of Yahuah.',
  sv.verse_id, ev.verse_id, 'free', 30577
  FROM _s313_chr24_lookup sv, _s313_chr24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=24 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Nadab and Abihu... offered strange fire before Yahuah (LORD), which he commanded them not* (Leviticus 10:1) — the fire the Chronicler''s *had no children* points back to.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-nadab-and-abihu-died-before-their-father'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And there went out fire from Yahuah (LORD), and devoured them, and they died before Yahuah (LORD)* (Leviticus 10:2) — the death that emptied the elder priestly lines.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-nadab-and-abihu-died-before-their-father'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Nadab and Abihu died before Yahuah (LORD)... and they had no children: and Eleazar and Ithamar ministered in the priest''s office* (Numbers 3:4) — the same fact sealed into the genealogy.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-nadab-and-abihu-died-before-their-father'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a certain priest named Zacharias, of the course of Abia* (Luke 1:5) — the eighth lot of 1 Chronicles 24:10 still serving at the gospel''s dawn.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=10
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-the-twenty-four-courses-the-order-of-abijah-to-zacharias'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*while he executed the priest''s office before Elohim (God) in the order of his course* (Luke 1:8) — the orderings of 1 Chronicles 24:19 still functioning.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=19
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-the-twenty-four-courses-the-order-of-abijah-to-zacharias'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*his lot was to burn incense when he went into the temple of Yahuah (Lord)* (Luke 1:9) — the appointed service, ordered as Yahuah commanded, unbroken to the Messiah''s day.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=19
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-the-twenty-four-courses-the-order-of-abijah-to-zacharias'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The lot is cast into the lap; but the whole disposing thereof is of Yahuah (LORD)* (Proverbs 16:33) — the divided-by-lot courses are Yahuah''s own ordering.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=5
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-the-lot-cast-the-disposing-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And they gave forth their lots; and the lot fell upon Matthias* (Acts 1:26) — the apostolic twelve filled by the same trusted ordering as the courses of Aaron.'
  FROM cross_reference_threads t
  JOIN _s313_chr24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=24 AND sv.verse_number=31
  JOIN _s313_chr24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-24-the-lot-cast-the-disposing-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_25.sql (1 Chronicles 25) -----
-- 1 Chronicles 25 — the courses of the singers, the prophetic music
-- tag: chr25 ; session prefix: s313 ; temp view: _s313_chr25_lookup
-- sort_order band start: 30600 (+1 per thread)
-- source: canon / 1-chronicles / chapter 25
--
-- 1 Chronicles 25 coverage:
--   v.1-3 (singers who PROPHESY with harps/psalteries/cymbals; minstrel + hand of Yahuah; praise-enthronement):
--        NT:     Ephesians 5:18-19 (be filled with the Spirit; psalms and hymns and spiritual songs);
--                Colossians 3:16 (the word of Messiah dwell richly; psalms and hymns and spiritual songs) — WOVEN
--        Extras: Sirach (Ecclesiasticus) 47:8-10 (David set singers before the altar to make sweet melody, daily sing praises) — WOVEN
--        Tanakh: 1 Samuel 10:5 (the company of prophets with psaltery/tabret/pipe/harp, and they shall prophesy);
--                2 Kings 3:15 (when the minstrel played, the hand of Yahuah came upon him);
--                1 Chronicles 16:4 (David appointed Levites to record, thank, and praise);
--                Psalm 22:3 (thou that inhabitest the praises of Yashar'el) — WOVEN
--   v.4-5 (Heman the king's seer in the words of Elohim; Elohim gave him fourteen sons and three daughters):
--        NT:     none warranted (the blessing of fruitful seed is a Tanakh frame here)
--        Extras: none warranted (Sirach 47 used in thread 1 for the singers, not the seed-blessing)
--        Tanakh: Psalm 127:3 (children are an heritage of Yahuah; the fruit of the womb is his reward);
--                Psalm 128:3 (thy children like olive plants round about thy table) — WOVEN (thread 2)
--   v.6 (under their father, song in the house of Yahuah): covered within thread 1 frame (no separate thread)
--   v.7-8 (cunning/skilful in the songs of Yahuah, 288; cast lots, as well the small as the great, the teacher as the scholar):
--        NT:     none warranted (the impartial, skilful, ordered service is best held in the Tanakh frame)
--        Extras: none warranted
--        Tanakh: Psalm 33:3 (sing unto him a new song; play SKILFULLY with a loud noise);
--                Psalm 137:5-6 (the skill of the right hand / song bound to the holy city) — weighed, declined;
--                Deuteronomy 1:17 (ye shall not respect persons in judgment; small and great alike) — WOVEN (thread 3)
--   v.9-31 (the 24 lots, twelve each): the courses enumerated; carried under thread 3's ordering frame (no per-lot threads)
--
-- THREADS (3):
--   s313: 1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals
--         (Tanakh + NT + Extras) — sacred song as prophetic Spirit-ministry
--   s313: 1-chronicles-25-heman-the-kings-seer-fourteen-sons-the-blessing-of-fruitful-seed
--         (Tanakh) — the seer's many children as the heritage-reward of Yahuah
--   s313: 1-chronicles-25-cunning-in-song-the-teacher-as-the-scholar-the-impartial-order
--         (Tanakh) — skilful, ordered, person-blind service of the house
--
-- GUARD NOTES: the singers PROPHESY with instruments (25:1-3) = appointed, Spirit-borne worship,
--   the same prophetic music that came on the company of prophets (1 Sam 10) and on Elisha at the
--   minstrel's playing (2 Kgs 3:15), and that the NT calls Spirit-filled psalms/hymns/spiritual songs
--   (Eph 5 / Col 3) — Yahuah enthroned on the praises (Ps 22:3). NOT a defunct ritual; the living
--   worship the NT continues. Torah/order affirmed (Deut 1:17 impartial service).

CREATE TEMP VIEW _s313_chr25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the singers who prophesy with harps, psalteries, and cymbals (25:1-3)
    ('canon','1-chronicles',25,1,'canon','1-samuel',10,5,'free',
      E'*After that thou shalt come to the hill of Elohim (God)... that thou shalt meet a company of prophets coming down from the high place with a psaltery, and a tabret, and a pipe, and a harp, before them; and they shall prophesy* (1 Samuel 10:5). David and the captains *separated to the service... who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1) — the same instrument-borne prophecy Samuel named long before, music as the carrier of the prophetic Spirit, not mere accompaniment.'),
    ('canon','1-chronicles',25,1,'canon','2-kings',3,15,'free',
      E'*But now bring me a minstrel. And it came to pass, when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15). When the singers *prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1), the playing is the very means by which the hand of Yahuah comes — Elisha proves the pattern David ordered into the house: the song opens the channel of the Spirit.'),
    ('canon','1-chronicles',25,1,'canon','1-chronicles',16,4,'free',
      E'*And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4). The courses David now numbers — *who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1) — are the maturing of that first appointment: the ministry of praise becomes an ordered, prophetic office in the house.'),
    ('canon','1-chronicles',25,3,'canon','psalms',22,3,'free',
      E'*But thou art holy, O thou that inhabitest the praises of Yashar''el (Israel)* (Psalm 22:3). The sons of Jeduthun *prophesied with a harp, to give thanks and to praise Yahuah (LORD)* (1 Chronicles 25:3) — and this is why the office is prophetic: Yahuah is enthroned upon the praises of his people, so the song that praises him becomes the seat from which his word goes forth.'),
    ('canon','1-chronicles',25,3,'canon','ephesians',5,18,'free',
      E'*And be not drunk with wine, wherein is excess; but be filled with the Spirit; Speaking to yourselves in psalms and hymns and spiritual songs, singing and making melody in your heart to Yahuah (Lord)* (Ephesians 5:18-19). The singers *prophesy with a harp, to give thanks and to praise Yahuah* (1 Chronicles 25:3); Paul carries the same ordinance forward — Spirit-filling and the psalms/hymns/spiritual songs are one act, the living worship the house was built to render, never abolished.'),
    ('canon','1-chronicles',25,3,'canon','colossians',3,16,'free',
      E'*Let the word of Messiah (Christ) dwell in you richly in all wisdom; teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). To *give thanks and to praise Yahuah* with the harp (1 Chronicles 25:3) is the very thing Paul commands the assembly — the word indwelling overflows as sung praise, the temple-singers'' ministry continued in the gathered body.'),
    ('canon','1-chronicles',25,1,'apocrypha','ecclesiasticus',47,9,'extras',
      E'*He set singers also before the altar, that by their voices they might make sweet melody, and daily sing praises in their songs* (Sirach 47:9). The restored witness remembers exactly what this chapter records — David''s establishing of the singers *who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1): the appointed, daily, prophetic worship set in order at the altar.'),

    -- THREAD 2: Heman the king's seer; fourteen sons and three daughters (25:5)
    ('canon','1-chronicles',25,5,'canon','psalms',127,3,'free',
      E'*Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3). Of Heman, *the king''s seer in the words of Elohim (God)*, the chronicler says, *And Elohim (God) gave to Heman fourteen sons and three daughters* (1 Chronicles 25:5) — the seer''s seventeen children are not a footnote but the visible reward of Yahuah upon a man set to lift up the horn.'),
    ('canon','1-chronicles',25,5,'canon','psalms',128,3,'free',
      E'*Thy wife shall be as a fruitful vine by the sides of thine house: thy children like olive plants round about thy table* (Psalm 128:3). That Elohim *gave to Heman fourteen sons and three daughters* (1 Chronicles 25:5) is the blessing of the man who fears Yahuah made flesh — the fruitful house promised in the psalm granted to the king''s seer.'),

    -- THREAD 3: cunning in song; the teacher as the scholar; the impartial order (25:7-8)
    ('canon','1-chronicles',25,7,'canon','psalms',33,3,'free',
      E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3). The singers were *instructed in the songs of Yahuah (LORD), even all that were cunning* (1 Chronicles 25:7) — the skill the psalm commands is the skill the house required, praise offered with trained and excellent craft, not careless noise.'),
    ('canon','1-chronicles',25,8,'canon','deuteronomy',1,17,'free',
      E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great* (Deuteronomy 1:17). When they *cast lots, ward against ward, as well the small as the great, the teacher as the scholar* (1 Chronicles 25:8), the same Torah principle orders the service of the house — no rank of person preferred, master and learner alike submitted to the impartial lot.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- THREAD 1 (free->extras: has Sirach member => 'extras')
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals',
       E'The Singers Who Prophesy With Harps, Psalteries, and Cymbals',
       E'David and the captains *separated to the service of the sons of Asaph, and of Heman, and of Jeduthun, who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1), and Jeduthun''s sons *prophesied with a harp, to give thanks and to praise Yahuah (LORD)* (1 Chronicles 25:3). This is not entertainment appended to worship — it is a prophetic office. Long before, Samuel had told Saul he would *meet a company of prophets coming down from the high place with a psaltery, and a tabret, and a pipe, and a harp, before them; and they shall prophesy* (1 Samuel 10:5); and when Elisha was sought for the word of Yahuah he said, *But now bring me a minstrel. And it came to pass, when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15). The song is the channel; the playing opens the way for the Spirit. David had set this in motion when *he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4), and the reason the praise-ministry can be prophetic is given in the psalm: *But thou art holy, O thou that inhabitest the praises of Yashar''el (Israel)* (Psalm 22:3) — Yahuah is enthroned upon the praises, so the praise becomes the seat from which his word proceeds. The restored witness recalls the same founding: *He set singers also before the altar, that by their voices they might make sweet melody, and daily sing praises in their songs* (Sirach 47:9). And this living worship is never abolished but carried forward: *be filled with the Spirit; Speaking to yourselves in psalms and hymns and spiritual songs, singing and making melody in your heart to Yahuah (Lord)* (Ephesians 5:18-19), and *Let the word of Messiah (Christ) dwell in you richly in all wisdom; teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). The temple-singers'' prophetic ministry is the assembly''s ministry still.',
       sv.verse_id, ev.verse_id, 'extras', 30600
  FROM _s313_chr25_lookup sv, _s313_chr25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=25 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (all canon => 'free')
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-25-heman-the-kings-seer-fourteen-sons-the-blessing-of-fruitful-seed',
       E'Heman the King''s Seer — Fourteen Sons, the Blessing of Fruitful Seed',
       E'*All these were the sons of Heman the king''s seer in the words of Elohim (God), to lift up the horn. And Elohim (God) gave to Heman fourteen sons and three daughters* (1 Chronicles 25:5). The chronicler counts the seer''s seventeen children deliberately — Heman is set *to lift up the horn*, to magnify Yahuah in song, and the visible answer of Yahuah upon such a man is a full house. The psalms name this exactly: *Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3), and *Thy wife shall be as a fruitful vine by the sides of thine house: thy children like olive plants round about thy table* (Psalm 128:3). The fourteen sons and three daughters are not biographical filler but the heritage-reward and the olive-plant blessing of Yahuah poured upon the one who lifts the horn in praise.',
       sv.verse_id, ev.verse_id, 'free', 30601
  FROM _s313_chr25_lookup sv, _s313_chr25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (all canon => 'free')
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-25-cunning-in-song-the-teacher-as-the-scholar-the-impartial-order',
       E'Cunning in Song — the Teacher as the Scholar, the Impartial Order',
       E'The service of praise was both skilful and just. The singers were *instructed in the songs of Yahuah (LORD), even all that were cunning* — *two hundred fourscore and eight* (1 Chronicles 25:7); the worship of the house demanded trained excellence, the very thing the psalm commands: *Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3). And the ordering of the courses was deliberately person-blind: *And they cast lots, ward against ward, as well the small as the great, the teacher as the scholar* (1 Chronicles 25:8). This is Torah carried into the temple service — *Ye shall not respect persons in judgment; but ye shall hear the small as well as the great* (Deuteronomy 1:17). Master and learner alike submitted to the same lot; no rank purchased preference. Skill before Yahuah, and justice without partiality, govern the house of song together.',
       sv.verse_id, ev.verse_id, 'free', 30602
  FROM _s313_chr25_lookup sv, _s313_chr25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=25 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...that thou shalt meet a company of prophets... with a psaltery, and a tabret, and a pipe, and a harp, before them; and they shall prophesy* (1 Samuel 10:5) — instrument-borne prophecy named long before David''s courses.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=1
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15) — the playing is the means by which the Spirit comes.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=1
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...to minister before the ark... and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4) — David''s first appointment of the praise-ministry, now matured into courses.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=1
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*But thou art holy, O thou that inhabitest the praises of Yashar''el (Israel)* (Psalm 22:3) — why the praise is prophetic: Yahuah is enthroned upon it.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...be filled with the Spirit; Speaking to yourselves in psalms and hymns and spiritual songs* (Ephesians 5:18-19) — the same Spirit-borne worship carried forward, never abolished.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*...teaching and admonishing one another in psalms and hymns and spiritual songs, singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16) — the temple-singers'' ministry continued in the gathered body.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=3
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*He set singers also before the altar, that by their voices they might make sweet melody, and daily sing praises in their songs* (Sirach 47:9) — the restored witness remembers David''s founding of the singers.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=1
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=47 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-the-singers-who-prophesy-with-harps-psalteries-and-cymbals'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Lo, children are an heritage of Yahuah (LORD): and the fruit of the womb is his reward* (Psalm 127:3) — Heman''s seventeen children as the visible reward upon the king''s seer.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=5
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-heman-the-kings-seer-fourteen-sons-the-blessing-of-fruitful-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thy wife shall be as a fruitful vine... thy children like olive plants round about thy table* (Psalm 128:3) — the fruitful house of the man who fears Yahuah, granted to Heman.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=5
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-heman-the-kings-seer-fourteen-sons-the-blessing-of-fruitful-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — the trained excellence the cunning singers rendered.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=7
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-cunning-in-song-the-teacher-as-the-scholar-the-impartial-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great* (Deuteronomy 1:17) — the Torah of impartiality ordering the lot, teacher and scholar alike.'
  FROM cross_reference_threads t
  JOIN _s313_chr25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=25 AND sv.verse_number=8
  JOIN _s313_chr25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-25-cunning-in-song-the-teacher-as-the-scholar-the-impartial-order'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_26.sql (1 Chronicles 26) -----
-- Book: 1 Chronicles  Chapter: 26  Tag: chr26  Session: s313
-- Sort band: 30625 + (one per thread)
-- Source edition: canon  book_slug: 1-chronicles  chapter: 26
--
-- 1 Chronicles 26 coverage:
--   v.1-13 (the courses of the porters/gatekeepers, the lot for every gate):
--        NT:     none warranted (the doorkeeper figure is sung in Ps 84, no NT add stronger)
--        Extras: none warranted
--        Tanakh: Psalm 84:4 / 84:10 / 84:11-12 (the doorkeeper in Yahuah's house), 1 Chr 13:14
--                (Obed-edom blessed while the Ark abode with him) -> THREAD 1
--   v.5 (Obed-edom: "for Elohim blessed him"):
--        Tanakh: 1 Chr 13:14 (Yahuah blessed the house of Obed-edom) -> THREAD 1 keystone
--   v.13 (cast lots, the small as well as the great, for every gate):
--        Tanakh: Ps 84:10 (doorkeeper in the house) -> THREAD 1
--   v.20, v.26-28 (Levites over the treasures of the house + the dedicated things, the spoils
--                  of war dedicated to maintain the house of Yahuah):
--        NT:     none warranted
--        Extras: none warranted (Num 31:54 memorial + Josh 6:19 treasury are the cleanest)
--        Tanakh: 1 Chr 18:11 (David dedicated the spoil unto Yahuah), Joshua 6:19 (silver/gold
--                consecrated, into the treasury of Yahuah), Numbers 31:54 (the gold brought into
--                the tabernacle for a memorial) -> THREAD 2
--   v.29-32 (the officers and judges for the outward business over Yashar'el, the business of
--            Yahuah and the service of the king):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deut 16:18-20 (judges and officers in all thy gates, just judgment),
--                Exodus 18:21-22 (Jethro's counsel: able men, rulers over thousands/hundreds),
--                2 Chr 19:5-7 (Jehoshaphat sets judges: ye judge not for man but for Yahuah)
--                -> THREAD 3
--
-- THREADS (all members canon -> tier 'free'):
--   1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim (Tanakh)              sort 30625
--   1-chronicles-26-the-dedicated-treasures-to-maintain-the-house (Tanakh)       sort 30626
--   1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah (Tanakh)   sort 30627

CREATE TEMP VIEW _s313_chr26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- B. cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the doorkeeper / the gatekeepers blessed in honored service
    ('canon','1-chronicles',26,5,'canon','1-chronicles',13,14,'free',
      E'*And the ark of Elohim (God) remained with the family of Obed-edom in his house three months. And Yahuah (LORD) blessed the house of Obed-edom, and all that he had.* (1 Chronicles 13:14). The same Obed-edom who sheltered the Ark and was blessed for it now stands among the porters; *for Elohim (God) blessed him* (1 Chronicles 26:5) reaches straight back to the house that honoured the presence of Yahuah (LORD) — the blessing follows the faithful into the gate-keeping service.'),
    ('canon','1-chronicles',26,5,'canon','psalms',84,10,'free',
      E'*For a day in thy courts is better than a thousand. I had rather be a doorkeeper in the house of my Elohim (God), than to dwell in the tents of wickedness.* (Psalm 84:10). The honour of the porter is no menial post; Obed-edom''s sons, *for Elohim (God) blessed him* (1 Chronicles 26:5), embody the psalmist''s choice — the lowliest threshold of Yahuah''s house above the proudest tent of the wicked.'),
    ('canon','1-chronicles',26,5,'canon','psalms',84,11,'free',
      E'*For Yahuah Elohim (the LORD God) is a sun and shield: Yahuah (LORD) will give grace and glory: no good thing will he withhold from them that walk uprightly.* (Psalm 84:11). The promise that *no good thing* is withheld from the upright is the very pattern of Obed-edom, *for Elohim (God) blessed him* (1 Chronicles 26:5) — the blessing rests on the house that walks faithfully before the presence.'),
    ('canon','1-chronicles',26,13,'canon','psalms',84,4,'free',
      E'*Blessed are they that dwell in thy house: they will be still praising thee. Selah.* (Psalm 84:4). The lot fell *as well the small as the great* (1 Chronicles 26:13) for every gate — none too lowly to be set at the door of Yahuah''s house, for the blessing is on all who dwell there in praising service.'),
    -- THREAD 2: the dedicated treasures / spoils of war to maintain the house of Yahuah
    ('canon','1-chronicles',26,27,'canon','1-chronicles',18,11,'free',
      E'*Them also king David dedicated unto Yahuah (LORD), with the silver and the gold that he brought from all these nations; from Edom, and from Moab, and from the children of Ammon, and from the Philistines, and from Amalek.* (1 Chronicles 18:11). The treasuries Shelomith keeps were filled *out of the spoils won in battles did they dedicate to maintain the house of Yahuah (LORD)* (1 Chronicles 26:27) — the very spoils David set apart in the campaigns are the dedicated store for the sanctuary''s upkeep.'),
    ('canon','1-chronicles',26,27,'canon','joshua',6,19,'free',
      E'*But all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD).* (Joshua 6:19). From the first conquest the spoil of war was set apart to the sanctuary; David''s dedication *to maintain the house of Yahuah (LORD)* (1 Chronicles 26:27) walks in the same Torah-pattern — the devoted things consecrated, brought into the treasury of Yahuah (LORD).'),
    ('canon','1-chronicles',26,26,'canon','numbers',31,54,'free',
      E'*And Moses and Eleazar the priest took the gold of the captains of thousands and of hundreds, and brought it into the tabernacle of the congregation, for a memorial for the children of Yashar''el (Israel) before Yahuah (LORD).* (Numbers 31:54). The war-gold of Midian was brought into the tabernacle as a memorial; so *the treasures of the dedicated things, which David the king, and the chief fathers, the captains over thousands and hundreds, and the captains of the host, had dedicated* (1 Chronicles 26:26) continue that same offering of the spoil before Yahuah (LORD).'),
    -- THREAD 3: the officers and judges — the ordered administration of justice
    ('canon','1-chronicles',26,29,'canon','deuteronomy',16,18,'free',
      E'*Judges and officers shalt thou make thee in all thy gates, which Yahuah Elohayka (the LORD thy God) giveth thee, throughout thy tribes: and they shall judge the people with just judgment.* (Deuteronomy 16:18). The Torah commands judges and officers in every gate; Chenaniah and his sons set *for the outward business over Yashar''el (Israel), for officers and judges* (1 Chronicles 26:29) are the appointing of that very office in the land.'),
    ('canon','1-chronicles',26,30,'canon','2-chronicles',19,6,'free',
      E'*And said to the judges, Take heed what ye do: for ye judge not for man, but for Yahuah (LORD), who is with you in the judgment.* (2 Chronicles 19:6). The Hebronites served *in all the business of Yahuah (LORD), and in the service of the king* (1 Chronicles 26:30) — the same fusion Jehoshaphat names, for the judges of Yashar''el do not judge for man but for Yahuah (LORD).'),
    ('canon','1-chronicles',26,32,'canon','exodus',18,21,'free',
      E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens.* (Exodus 18:21). Jethro''s counsel — able, Elohim-fearing men set as rulers — is fulfilled in David''s *men of valour... chief fathers, whom king David made rulers... for every matter pertaining to Elohim (God), and affairs of the king* (1 Chronicles 26:32).'),
    ('canon','1-chronicles',26,32,'canon','deuteronomy',16,20,'free',
      E'*That which is altogether just shalt thou follow, that thou mayest live, and inherit the land which Yahuah Elohayka (the LORD thy God) giveth thee.* (Deuteronomy 16:20). The end of all these officers and judges set *for every matter pertaining to Elohim (God), and affairs of the king* (1 Chronicles 26:32) is the Torah''s charge to follow that which is altogether just — the ordered governance crowned by justice that the land may live.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- C. threads
-- =====================================================================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim',
       E'A Doorkeeper in the House of My Elohim: Obed-edom Blessed in the Gate',
       E'The courses of the porters open the chapter, and at their heart stands Obed-edom: *Moreover the sons of Obed-edom were... for Elohim (God) blessed him* (1 Chronicles 26:5). This is the same Obed-edom whose house once sheltered the Ark — *And the ark of Elohim (God) remained with the family of Obed-edom in his house three months. And Yahuah (LORD) blessed the house of Obed-edom, and all that he had* (1 Chronicles 13:14). The house that honoured the presence of Yahuah (LORD) is now blessed in the gatekeeping service, his many sons *able men for strength for the service* (1 Chronicles 26:8). The Psalms sing the same honour: *I had rather be a doorkeeper in the house of my Elohim (God), than to dwell in the tents of wickedness* (Psalm 84:10) — the lowliest threshold of Yahuah''s house above the proudest tent of the wicked; *For Yahuah Elohim (the LORD God) is a sun and shield... no good thing will he withhold from them that walk uprightly* (Psalm 84:11), the very pattern of the blessing on Obed-edom. And when the lot is cast *as well the small as the great... for every gate* (1 Chronicles 26:13), none is too lowly for the door, for *Blessed are they that dwell in thy house: they will be still praising thee* (Psalm 84:4). The gate is not a menial post but a place of honoured, trusted, blessed service.',
       sv.verse_id, ev.verse_id, 'free', 30625
  FROM _s313_chr26_lookup sv, _s313_chr26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=26 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-26-the-dedicated-treasures-to-maintain-the-house',
       E'The Dedicated Treasures: The Spoils of War to Maintain the House of Yahuah',
       E'The Levites are set *over the treasures of the house of Elohim (God), and over the treasures of the dedicated things* (1 Chronicles 26:20), and Shelomith and his brethren *were over all the treasures of the dedicated things, which David the king, and the chief fathers, the captains over thousands and hundreds, and the captains of the host, had dedicated* (1 Chronicles 26:26). The source of this treasure is the spoil of battle set apart: *Out of the spoils won in battles did they dedicate to maintain the house of Yahuah (LORD)* (1 Chronicles 26:27). This is the very dedication recorded earlier — *Them also king David dedicated unto Yahuah (LORD), with the silver and the gold that he brought from all these nations; from Edom, and from Moab, and from the children of Ammon, and from the Philistines, and from Amalek* (1 Chronicles 18:11). And it walks in the oldest Torah-pattern of the devoted things: at Jericho, *all the silver, and gold, and vessels of brass and iron, are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD)* (Joshua 6:19); and after Midian, *Moses and Eleazar the priest took the gold of the captains of thousands and of hundreds, and brought it into the tabernacle of the congregation, for a memorial for the children of Yashar''el (Israel) before Yahuah (LORD)* (Numbers 31:54). The spoil is not seized for the self but consecrated — the devoted things stored to uphold the sanctuary of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 30626
  FROM _s313_chr26_lookup sv, _s313_chr26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=26 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah',
       E'Officers and Judges: The Ordered Administration of Justice',
       E'Beyond the gate and the treasury, the Levites are set *for the outward business over Yashar''el (Israel), for officers and judges* (1 Chronicles 26:29), serving *in all the business of Yahuah (LORD), and in the service of the king* (1 Chronicles 26:30), made rulers *for every matter pertaining to Elohim (God), and affairs of the king* (1 Chronicles 26:32). This is the Torah''s own ordinance enacted: *Judges and officers shalt thou make thee in all thy gates, which Yahuah Elohayka (the LORD thy God) giveth thee, throughout thy tribes: and they shall judge the people with just judgment* (Deuteronomy 16:18), unto the end that *that which is altogether just shalt thou follow, that thou mayest live* (Deuteronomy 16:20). It reaches back to Jethro''s counsel in the wilderness — *thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds* (Exodus 18:21) — the same able, Elohim-fearing men David appoints. And it sets the pattern Jehoshaphat would charge to the judges he later raised: *Take heed what ye do: for ye judge not for man, but for Yahuah (LORD), who is with you in the judgment* (2 Chronicles 19:6). The kingdom is ordered under justice, the business of Yahuah (LORD) and the service of the king bound as one.',
       sv.verse_id, ev.verse_id, 'free', 30627
  FROM _s313_chr26_lookup sv, _s313_chr26_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=26 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- D. thread_members
-- =====================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 13:14 — *Yahuah (LORD) blessed the house of Obed-edom*: the house that sheltered the Ark, now blessed in the gate (1 Chronicles 26:5, *for Elohim (God) blessed him*).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=5
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 84:10 — *I had rather be a doorkeeper in the house of my Elohim (God), than to dwell in the tents of wickedness*: the honour of the gate, the porter''s blessed post.'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=5
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 84:11 — *no good thing will he withhold from them that walk uprightly*: the very pattern of the blessing on Obed-edom''s house (1 Chronicles 26:5).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=5
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 84:4 — *Blessed are they that dwell in thy house: they will be still praising thee*: the lot for every gate fell *as well the small as the great* (1 Chronicles 26:13) — none too lowly to dwell at the door.'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=13
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=84 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-a-doorkeeper-in-the-house-of-my-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Chronicles 18:11 — *Them also king David dedicated unto Yahuah (LORD)... from all these nations*: the spoils of David''s campaigns are the dedicated store kept to maintain the house (1 Chronicles 26:27).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=27
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-the-dedicated-treasures-to-maintain-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 6:19 — *all the silver, and gold... are consecrated unto Yahuah (LORD): they shall come into the treasury of Yahuah (LORD)*: the oldest Torah-pattern of the devoted things, the same as 1 Chronicles 26:27.'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=27
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-the-dedicated-treasures-to-maintain-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 31:54 — *brought it into the tabernacle of the congregation, for a memorial... before Yahuah (LORD)*: the war-gold of Midian set apart, the same offering of the spoil the dedicated treasures continue (1 Chronicles 26:26).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=26
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=31 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-the-dedicated-treasures-to-maintain-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 16:18 — *Judges and officers shalt thou make thee in all thy gates... and they shall judge the people with just judgment*: the Torah ordinance enacted in Chenaniah''s appointment (1 Chronicles 26:29).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=29
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 19:6 — *ye judge not for man, but for Yahuah (LORD)*: the same fusion of Yahuah''s business and the king''s service the Hebronites carried (1 Chronicles 26:30).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=30
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 18:21 — *able men, such as fear Elohim (God), men of truth, hating covetousness... rulers of thousands, and rulers of hundreds*: Jethro''s counsel fulfilled in David''s rulers (1 Chronicles 26:32).'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=32
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 16:20 — *That which is altogether just shalt thou follow, that thou mayest live*: the end of all the officers set for every matter (1 Chronicles 26:32) is justice, that the land may live.'
  FROM cross_reference_threads t
  JOIN _s313_chr26_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=26 AND sv.verse_number=32
  JOIN _s313_chr26_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-26-officers-and-judges-in-all-the-business-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_27.sql (1 Chronicles 27) -----
-- 1 Chronicles 27 — military divisions, tribal rulers, royal stewards, counsellors
-- tag: chr27   session: s313   slug prefix: 1-chronicles-27-   sort band: 30650+
-- source book_slug=1-chronicles, chapter 27 (canon)
--
-- 1 Chronicles 27 coverage:
--   v.1-22 (the twelve monthly courses of 24,000 + the rulers over the tribes of Yashar'el):
--        NT:     none warranted (administrative roster)
--        Extras: none warranted
--        Tanakh: none warranted (folded into the governance framing of the counsellor/promise threads)
--   v.23  Yahuah said he would increase Yashar'el like to the stars of the heavens — THE covenant-
--        multiplication promise to Abraham presumed upon by the counting:
--        NT:     Hebrews 11:12 (so many as the stars of the sky in multitude)
--        Extras: none warranted (the seed-as-stars witness is fully carried in canon)
--        Tanakh: Genesis 15:5; Genesis 22:17; Genesis 26:4; Deuteronomy 1:10
--   v.23-24  the census-sin echo of ch21 — Joab began to number, finished not, wrath fell:
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Chronicles 21:1; 1 Chronicles 21:7; 2 Samuel 24:1
--   v.25-31  the king's stewards over treasures, fields, vineyards, herds (the royal estate):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (folded into the kingdom-governance framing)
--   v.32-34  David's counsellors — Jonathan, Ahithophel, Hushai the king's companion:
--        NT:     none warranted (Ahithophel's betrayal is sung/typed in the Tanakh itself)
--        Extras: none warranted
--        Tanakh: 2 Samuel 16:23; Psalm 55:12-14; 2 Samuel 17:23
--
-- THREADS (all members canon => tier 'free'):
--   30650 1-chronicles-27-increase-israel-like-the-stars-of-the-heavens  [Tanakh+NT]
--         27:23-24 -> Gen 15:5, Gen 22:17, Gen 26:4, Deut 1:10, Heb 11:12
--   30651 1-chronicles-27-the-census-that-presumed-and-the-wrath-that-fell  [Tanakh]
--         27:23-24 -> 1 Chr 21:1, 1 Chr 21:7, 2 Sam 24:1
--   30652 1-chronicles-27-the-counsel-around-the-king-and-the-companion  [Tanakh]
--         27:33-34 -> 2 Sam 16:23, Ps 55:12, Ps 55:13, Ps 55:14, 2 Sam 17:23
--
-- contested/load-bearing framing: 27:23 the multiplication "like to the stars of the heavens" is
-- read NOT as a generic blessing but as the Abrahamic seed-promise (Gen 15:5/22:17/26:4) carried
-- by paternal bloodline + covenant-word; the counting of v.24 presumed upon what only Yahuah
-- numbers, the same census-sin Satan provoked in ch21 (1 Chr 21:1) — David refuses it here. The
-- counsel thread reads Ahithophel as the trusted companion turned betrayer, the very figure
-- Psalm 55 sings (a man mine equal... we took sweet counsel together), foreshadowing the betrayal
-- of the greater Son of David — held in the Tanakh's own voice, no NT member needed here.

CREATE TEMP VIEW _s313_chr27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: increase Israel like the stars of the heavens (the Abrahamic seed-promise)
    ('canon','1-chronicles',27,23,'canon','genesis',15,5,'free',
      E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* (Genesis 15:5). This is the promise the Chronicler reaches back to: *because Yahuah (LORD) had said he would increase Yashar''el (Israel) like to the stars of the heavens* (1 Chronicles 27:23). The stars are Yahuah''s to number, not David''s — the seed of promise multiplies by His word, so David takes not the number of the young.'),
    ('canon','1-chronicles',27,23,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). The oath sworn at the binding of Yitzhaq is the same word echoed in *he would increase Yashar''el (Israel) like to the stars of the heavens* (1 Chronicles 27:23) — the covenant-multiplication carried by the paternal seed-line, kept by Yahuah and not by a census.'),
    ('canon','1-chronicles',27,23,'canon','genesis',26,4,'free',
      E'*And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed* (Genesis 26:4). The promise renewed to Yitzhaq stands behind *he would increase Yashar''el (Israel) like to the stars of the heavens* (1 Chronicles 27:23): one promise, one seed, carried down the bloodline to David''s Yashar''el.'),
    ('canon','1-chronicles',27,23,'canon','deuteronomy',1,10,'free',
      E'*Yahuah Elohaychem (The LORD your God) hath multiplied you, and, behold, ye are this day as the stars of heaven for multitude* (Deuteronomy 1:10). Moses declares the promise already fulfilled in his day — the very increase the Chronicler will not count: *he would increase Yashar''el (Israel) like to the stars of the heavens* (1 Chronicles 27:23). The numbering belongs to Yahuah who multiplies.'),
    ('canon','1-chronicles',27,23,'canon','hebrews',11,12,'free',
      E'*Therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The witness forward names the same star-and-sand promise — that from one paternal line Yahuah brought forth the innumerable seed, the increase David honoured by refusing to number it (1 Chronicles 27:23).'),
    -- Thread 2: the census that presumed, and the wrath that fell (echo of ch21)
    ('canon','1-chronicles',27,24,'canon','1-chronicles',21,1,'free',
      E'*And Satan stood up against Yashar''el (Israel), and provoked David to number Yashar''el (Israel)* (1 Chronicles 21:1). The Chronicler tells us why Joab *began to number, but he finished not, because there fell wrath for it against Yashar''el (Israel)* (1 Chronicles 27:24) — it is the very census of chapter 21, the counting Satan provoked, presuming upon the seed Yahuah alone numbers.'),
    ('canon','1-chronicles',27,24,'canon','1-chronicles',21,7,'free',
      E'*And Elohim (God) was displeased with this thing; therefore he smote Yashar''el (Israel)* (1 Chronicles 21:7). This is the *wrath... against Yashar''el (Israel)* (1 Chronicles 27:24) the Chronicler names — the smiting that followed the census, the reason the number was *not put in the account of the chronicles of king David*.'),
    ('canon','1-chronicles',27,24,'canon','2-samuel',24,1,'free',
      E'*And again the anger of Yahuah (LORD) was kindled against Yashar''el (Israel), and he moved David against them to say, Go, number Yashar''el (Israel) and Yahudah (Judah)* (2 Samuel 24:1). The parallel record of the same census stands behind *Joab the son of Zeruiah began to number, but he finished not* (1 Chronicles 27:24) — the counting that drew wrath upon both houses.'),
    -- Thread 3: the counsel around the king, and the companion who betrayed
    ('canon','1-chronicles',27,33,'canon','2-samuel',16,23,'free',
      E'*And the counsel of Ahithophel, which he counselled in those days, was as if a man had enquired at the oracle of Elohim (God): so was all the counsel of Ahithophel both with David and with Absalom* (2 Samuel 16:23). The Chronicler lists him plainly — *Ahithophel was the king''s counsellor* (1 Chronicles 27:33) — but the fuller record reveals the trusted oracle-like counsel that later turned against David in Absalom''s revolt.'),
    ('canon','1-chronicles',27,33,'canon','psalms',55,12,'free',
      E'*For it was not an enemy that reproached me; then I could have borne it: neither was it he that hated me that did magnify himself against me; then I would have hid myself from him* (Psalm 55:12). The psalm sings the wound of the *king''s counsellor* (1 Chronicles 27:33) turned traitor — not a foe but an intimate, the grief of betrayal from within the king''s own circle.'),
    ('canon','1-chronicles',27,33,'canon','psalms',55,13,'free',
      E'*But it was thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:13). The betrayer was the counsellor — *Ahithophel was the king''s counsellor: and Hushai the Archite was the king''s companion* (1 Chronicles 27:33). The closest companion becomes the deepest wound, a foreshadow of the betrayal of the greater Son of David.'),
    ('canon','1-chronicles',27,33,'canon','psalms',55,14,'free',
      E'*We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:14). The sweet counsel taken together is the very counsel the Chronicler names — *Ahithophel was the king''s counsellor* (1 Chronicles 27:33) — the fellowship that the betrayal would sever.'),
    ('canon','1-chronicles',27,34,'canon','2-samuel',17,23,'free',
      E'*And when Ahithophel saw that his counsel was not followed, he saddled his ass, and arose, and gat him home to his house, to his city, and put his household in order, and hanged himself, and died, and was buried in the sepulchre of his father* (2 Samuel 17:23). The Chronicler''s note that *after Ahithophel was Jehoiada* (1 Chronicles 27:34) — that another took his place — points to this end: the counsellor who betrayed the king came to ruin by his own hand.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-27-increase-israel-like-the-stars-of-the-heavens',
       E'Increase Yashar''el (Israel) Like the Stars of the Heavens',
       E'The Chronicler pauses the roster of armies and rulers to tell us why David held back: *But David took not the number of them from twenty years old and under: because Yahuah (LORD) had said he would increase Yashar''el (Israel) like to the stars of the heavens* (1 Chronicles 27:23). The phrase is no figure of speech — it is the Abrahamic seed-promise word for word. *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). Sworn again at the binding of Yitzhaq: *in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17), and renewed to Yitzhaq: *I will make thy seed to multiply as the stars of heaven* (Genesis 26:4). By Moses'' day it was already coming to pass — *ye are this day as the stars of heaven for multitude* (Deuteronomy 1:10) — and the witness forward names it kept: *therefore sprang there even of one, and him as good as dead, so many as the stars of the sky in multitude, and as the sand which is by the sea shore innumerable* (Hebrews 11:12). The seed of promise multiplies by Yahuah''s word along the paternal bloodline; the stars are His to number, not David''s. So the king refuses the count — a refusal of reverence, not omission.',
       sv.verse_id, ev.verse_id, 'free', 30650
  FROM _s313_chr27_lookup sv, _s313_chr27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=27 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-27-the-census-that-presumed-and-the-wrath-that-fell',
       E'The Census That Presumed, and the Wrath That Fell',
       E'The same verses that honour the star-promise carry its shadow: *Joab the son of Zeruiah began to number, but he finished not, because there fell wrath for it against Yashar''el (Israel); neither was the number put in the account of the chronicles of king David* (1 Chronicles 27:24). The Chronicler is pointing back to the dark episode he has already told: *And Satan stood up against Yashar''el (Israel), and provoked David to number Yashar''el (Israel)* (1 Chronicles 21:1). The counting presumed upon the very seed Yahuah alone numbers — and *Elohim (God) was displeased with this thing; therefore he smote Yashar''el (Israel)* (1 Chronicles 21:7). The parallel record names the kindled anger over both houses: *and again the anger of Yahuah (LORD) was kindled against Yashar''el (Israel), and he moved David against them to say, Go, number Yashar''el (Israel) and Yahudah (Judah)* (2 Samuel 24:1). To number the multiplied seed as one''s own strength is to grasp at what belongs to the covenant-keeper. That is why the unfinished number was left out of the account: a memorial that the increase is Yahuah''s, not the king''s.',
       sv.verse_id, ev.verse_id, 'free', 30651
  FROM _s313_chr27_lookup sv, _s313_chr27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=27 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-27-the-counsel-around-the-king-and-the-companion',
       E'The Counsel Around the King, and the Companion',
       E'The chapter closes with the inner circle of the throne: *And Ahithophel was the king''s counsellor: and Hushai the Archite was the king''s companion: And after Ahithophel was Jehoiada the son of Benaiah, and Abiathar* (1 Chronicles 27:33-34). The Chronicler lists Ahithophel plainly, but the fuller record reveals the weight of him — *the counsel of Ahithophel, which he counselled in those days, was as if a man had enquired at the oracle of Elohim (God)* (2 Samuel 16:23) — and the wound when that counsel turned against David in Absalom''s revolt. The Psalmist sings that wound from the inside: *For it was not an enemy that reproached me; then I could have borne it... But it was thou, a man mine equal, my guide, and mine acquaintance. We took sweet counsel together, and walked unto the house of Elohim (God) in company* (Psalm 55:12-14). The betrayer was no stranger but the trusted companion at the king''s side — a foreshadow of the betrayal of the greater Son of David. And the counsellor''s end is written: *when Ahithophel saw that his counsel was not followed... he put his household in order, and hanged himself, and died* (2 Samuel 17:23). The note that *after Ahithophel was Jehoiada* points to that very vacancy.',
       sv.verse_id, ev.verse_id, 'free', 30652
  FROM _s313_chr27_lookup sv, _s313_chr27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=27 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*So shall thy seed be* (Genesis 15:5) — the star-promise to Abraham, the count Yahuah keeps.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-increase-israel-like-the-stars-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will multiply thy seed as the stars of the heaven* (Genesis 22:17) — the oath at the binding of Yitzhaq.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-increase-israel-like-the-stars-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will make thy seed to multiply as the stars of heaven* (Genesis 26:4) — the promise renewed to Yitzhaq.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-increase-israel-like-the-stars-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye are this day as the stars of heaven for multitude* (Deuteronomy 1:10) — the promise already coming to pass.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-increase-israel-like-the-stars-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*so many as the stars of the sky in multitude* (Hebrews 11:12) — the witness forward that the promise was kept.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=23
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-increase-israel-like-the-stars-of-the-heavens'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Satan stood up against Yashar''el (Israel), and provoked David to number* (1 Chronicles 21:1) — the census the Chronicler points back to.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=24
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-census-that-presumed-and-the-wrath-that-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) was displeased... therefore he smote Yashar''el (Israel)* (1 Chronicles 21:7) — the wrath that fell.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=24
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=21 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-census-that-presumed-and-the-wrath-that-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Go, number Yashar''el (Israel) and Yahudah (Judah)* (2 Samuel 24:1) — the parallel record of the same census over both houses.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=24
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-census-that-presumed-and-the-wrath-that-fell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the counsel of Ahithophel... was as if a man had enquired at the oracle of Elohim (God)* (2 Samuel 16:23) — the weight of the king''s counsellor.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=33
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=16 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-counsel-around-the-king-and-the-companion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*it was not an enemy that reproached me* (Psalm 55:12) — the wound came from within the inner circle.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=33
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-counsel-around-the-king-and-the-companion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou, a man mine equal, my guide, and mine acquaintance* (Psalm 55:13) — the betrayer was the trusted companion.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=33
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-counsel-around-the-king-and-the-companion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*We took sweet counsel together* (Psalm 55:14) — the fellowship the betrayal would sever.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=33
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-counsel-around-the-king-and-the-companion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he... hanged himself, and died* (2 Samuel 17:23) — the counsellor''s ruin, behind the note *after Ahithophel was Jehoiada*.'
  FROM cross_reference_threads t
  JOIN _s313_chr27_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=27 AND sv.verse_number=34
  JOIN _s313_chr27_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-27-the-counsel-around-the-king-and-the-companion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_28.sql (1 Chronicles 28) -----
-- 1 Chronicles 28 — David's public charge to Solomon and the assembly; the temple pattern.
-- tag: chr28   session prefix: s313   temp view: _s313_chr28_lookup
-- sort_order band: 30675..30678 (+1 per thread)
-- source book_slug: 1-chronicles, chapter 28 (edition canon)
--
-- THREADS (4):
--   1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah  (free; Tanakh+NT)
--        28:4-7 -> 2 Samuel 7:12,13,14; Psalm 132:11; Hebrews 1:5
--   1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts          (extras; Tanakh+NT+Wisdom)
--        28:9 -> Deuteronomy 4:29; Jeremiah 29:13; 1 Samuel 16:7; Jeremiah 17:10; Psalm 139:1,2; John 4:23; Hebrews 4:12,13; Wisdom of Solomon 1:6 [extras]
--   1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee    (free; Tanakh+NT)
--        28:10,20 -> Deuteronomy 31:6; Joshua 1:5; Hebrews 13:5; Philippians 1:6
--   1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand            (extras; Tanakh+NT+Wisdom)
--        28:11,19 -> Exodus 25:9; Exodus 25:40; Hebrews 8:5; Acts 7:44; Wisdom of Solomon 9:8 [extras]
--
-- PER-CHAPTER COVERAGE CHECKLIST:
--   v.1-3  (David assembles; not he but Solomon to build)
--          NT:     none warranted   Extras: none warranted   Tanakh: folded into 28:4-7 election thread (man-of-war reason in prose)
--   v.4-7  (Yahuah chose Yahudah, then David, then Solomon; throne of the kingdom of Yahuah; I will be his father; establish for ever if constant)
--          NT:     Hebrews 1:5 (Thou art my Son / I will be to him a Father)   Extras: none warranted (2 Sam 7 echoes are canon)
--          Tanakh: 2 Samuel 7:12,13,14 (the Davidic covenant proper); Psalm 132:11 (sworn to David, fruit of thy body)  -> THREAD 1
--   v.8    (keep and seek for all the commandments... that ye may possess this good land)
--          NT/Extras/Tanakh: covenant condition folded into THREAD 2 (seek/keep paired with seek/forsake of v.9; same heart-religion)
--   v.9    (know the Elohim of thy father; serve with a perfect heart and willing mind; Yahuah searcheth all hearts; if seek->found, if forsake->cast off)
--          NT:     John 4:23 (worship in spirit and truth); Hebrews 4:12,13 (word a discerner of thoughts; all naked unto his eyes)
--          Extras: Wisdom of Solomon 1:6 (a beholder of his heart) [clean]
--          Tanakh: Deut 4:29; Jer 29:13 (seek with all the heart); 1 Sam 16:7 (Yahuah looketh on the heart); Jer 17:10 (I search the heart); Ps 139:1,2  -> THREAD 2
--   v.10,20 (Be strong and do it; be strong and of good courage, fear not; he will not fail nor forsake thee till the work is finished)
--          NT:     Hebrews 13:5 (I will never leave thee nor forsake thee); Philippians 1:6 (he which began a good work will perform it)
--          Extras: none warranted (Sir 2 is general endurance, weaker than canon witnesses)
--          Tanakh: Deut 31:6; Joshua 1:5 (the same charge to Joshua at the inheritance)  -> THREAD 3
--   v.11-18 (the pattern of the porch, houses, treasuries, courses, vessels, the chariot of the cherubims)
--          folded into THREAD 4 via v.11 anchor + v.19 ("all the works of this pattern")
--   v.19   (all this Yahuah made me understand in writing by his hand upon me, all the works of this pattern)
--          NT:     Hebrews 8:5 (make all things according to the pattern shewed in the mount); Acts 7:44 (according to the fashion he had seen)
--          Extras: Wisdom of Solomon 9:8 (a resemblance of the holy tabernacle prepared from the beginning) [clean]
--          Tanakh: Exodus 25:9; Exodus 25:40 (after the pattern shewed thee in the mount)  -> THREAD 4
--   v.21   (the courses with thee; willing skilful men)
--          NT/Extras/Tanakh: none warranted (assembly logistics; willingness carried in 28:9 prose)
--
-- CONTESTED / FRAMEWORK-LOAD-BEARING:
--   * 28:4 Yahuah chose Yahudah to be the ruler, the house of my father, Solomon: the seed-of-promise + the
--     Davidic throne, framed FORWARD to the Son who builds the true house (Heb 1:5), NOT a defunct kingship.
--   * 28:7 "if he be constant to do my commandments": the covenant is conditioned on Torah-obedience, the
--     framework's anti-antinomian backbone — quoted as standing condition, not curse.
--   * 28:9 the heart-religion: Yahuah who searches all hearts wants a perfect heart, not mere ritual — the
--     covenant condition (seek->found / forsake->cast off). The Torah framework upholds heart and obedience together.
--   * 28:19 the pattern by Yahuah's hand = the earthly sanctuary built to the HEAVENLY pattern (Exod 25:40 / Heb 8:5),
--     the shadow of heavenly things; weighed Wisdom 9:8 as the extras witness ("prepared from the beginning").

CREATE TEMP VIEW _s313_chr28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: he hath chosen Solomon to sit upon the throne of the kingdom of Yahuah (28:4-7)
  ('canon','1-chronicles',28,5,'canon','2-samuel',7,12,'free',
   E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). David''s word *he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5) is the public discharge of the very oath Yahuah swore him: the chosen seed, set up to reign.'),
  ('canon','1-chronicles',28,6,'canon','2-samuel',7,13,'free',
   E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). David repeats the oath verbatim — *Solomon thy son, he shall build my house and my courts: for I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6) — the house-builder and the father-son bond are the same covenant promise.'),
  ('canon','1-chronicles',28,6,'canon','2-samuel',7,14,'free',
   E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14). The adoption David recites — *I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6) — is the chastening, covenant-conditioned sonship of the Davidic line, the throne that reaches forward to the true Son.'),
  ('canon','1-chronicles',28,5,'canon','psalms',132,11,'free',
   E'*Yahuah (LORD) hath sworn in truth unto David; he will not turn from it; Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). The psalm sings the oath that David here performs before all Yashar''el — *he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah* (1 Chronicles 28:5); the fruit of David''s body set upon the throne.'),
  ('canon','1-chronicles',28,6,'canon','hebrews',1,5,'free',
   E'*For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). The father-son word over Solomon — *I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6) — is taken up of the greater Son, the Formed heir of the throne the type only shadowed; the house-builder become the eternal King.'),

  -- THREAD 2: serve him with a perfect heart, for Yahuah searcheth all hearts (28:9; covenant condition 28:8)
  ('canon','1-chronicles',28,9,'canon','deuteronomy',4,29,'free',
   E'*But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). David presses the same Torah condition on his son — *if thou seek him, he will be found of thee; but if thou forsake him, he will cast thee off for ever* (1 Chronicles 28:9). The covenant turns on the seeking heart, not the bare rite.'),
  ('canon','1-chronicles',28,9,'canon','jeremiah',29,13,'free',
   E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The promise Jeremiah holds out to the scattered is the promise David lays on Solomon — *if thou seek him, he will be found of thee* (1 Chronicles 28:9); the same whole-hearted seeking that finds the heart-searching Elohim.'),
  ('canon','1-chronicles',28,9,'canon','1-samuel',16,7,'free',
   E'*for Yahuah (LORD) seeth not as man seeth; for man looketh on the outward appearance, but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7). The Elohim who chose David by the heart is the Elohim David names to Solomon — *Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts* (1 Chronicles 28:9); thus the call for a *perfect heart*, not a fair appearance.'),
  ('canon','1-chronicles',28,9,'canon','jeremiah',17,10,'free',
   E'*I Yahuah (LORD) search the heart, I try the reins, even to give every man according to his ways, and according to the fruit of his doings* (Jeremiah 17:10). Jeremiah names the same heart-searcher David sets before his son — *Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts* (1 Chronicles 28:9); the One who tries the reins requires a perfect heart and a willing mind.'),
  ('canon','1-chronicles',28,9,'canon','psalms',139,1,'free',
   E'*O Yahuah (LORD), thou hast searched me, and known me* (Psalm 139:1). David himself sings what he charges on Solomon — that *Yahuah (LORD) searcheth all hearts* (1 Chronicles 28:9); the searching that David has known, his son must reckon with too.'),
  ('canon','1-chronicles',28,9,'canon','psalms',139,2,'free',
   E'*Thou knowest my downsitting and mine uprising, thou understandest my thought afar off* (Psalm 139:2). The Elohim who *understandeth all the imaginations of the thoughts* (1 Chronicles 28:9) is the One who understands David''s thought afar off; no perfect heart is hidden, no false one either.'),
  ('canon','1-chronicles',28,9,'canon','john',4,23,'free',
   E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). The *perfect heart* and *willing mind* David requires (1 Chronicles 28:9) is the worship in spirit and truth the Father still seeks — service of the heart, not mere place or rite.'),
  ('canon','1-chronicles',28,9,'canon','hebrews',4,12,'free',
   E'*For the word of Elohim (God) is quick, and powerful... piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). The heart-searcher David names — who *understandeth all the imaginations of the thoughts* (1 Chronicles 28:9) — works by the living word that discerns the very thoughts and intents.'),
  ('canon','1-chronicles',28,9,'canon','hebrews',4,13,'free',
   E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). David''s warning stands unchanged in the apostle — because *Yahuah (LORD) searcheth all hearts* (1 Chronicles 28:9), all things lie naked and opened; the perfect heart cannot be feigned before him.'),
  ('canon','1-chronicles',28,9,'apocrypha','the-wisdom-of-solomon',1,6,'extras',
   E'*for Yahuah (God) is witness of his reins, and a true beholder of his heart, and a hearer of his tongue* (Wisdom of Solomon 1:6). The second-temple witness names the same heart-searching Elohim David sets before Solomon — *Yahuah (LORD) searcheth all hearts* (1 Chronicles 28:9); a beholder of the heart whom no doubled mind escapes.'),

  -- THREAD 3: be strong and of good courage, he will not fail thee nor forsake thee (28:10,20)
  ('canon','1-chronicles',28,20,'canon','deuteronomy',31,6,'free',
   E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). David''s charge to Solomon is Moses'' charge to Yashar''el almost word for word — *Be strong and of good courage... fear not, nor be dismayed... he will not fail thee, nor forsake thee* (1 Chronicles 28:20); the same faithful presence carries the next builder.'),
  ('canon','1-chronicles',28,20,'canon','joshua',1,5,'free',
   E'*as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The promise that strengthened Joshua at the inheritance is the promise David lays on Solomon at the house — *for Yahuah Elohim (the LORD God), even my Elohim (God), will be with thee; he will not fail thee, nor forsake thee* (1 Chronicles 28:20); the work is finished because the Faithful One does not leave it.'),
  ('canon','1-chronicles',28,20,'canon','hebrews',13,5,'free',
   E'*for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). The apostle quotes the very pledge David trusted — *he will not fail thee, nor forsake thee, until thou hast finished all the work* (1 Chronicles 28:20); the unbroken faithfulness from the wilderness, to the temple, to the assembly that keeps the covenant still.'),
  ('canon','1-chronicles',28,20,'canon','philippians',1,6,'free',
   E'*Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). David''s confidence that Yahuah *will not fail thee, nor forsake thee, until thou hast finished all the work* (1 Chronicles 28:20) is the apostle''s confidence in the faithful Finisher who completes what he begins.'),

  -- THREAD 4: the pattern Yahuah made me understand in writing by his hand (28:11,19)
  ('canon','1-chronicles',28,19,'canon','exodus',25,9,'free',
   E'*According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it* (Exodus 25:9). David gives Solomon what Moses received at Sinai — *All this, said David, Yahuah (LORD) made me understand in writing by his hand upon me, even all the works of this pattern* (1 Chronicles 28:19); the house, like the tabernacle, is built to a pattern given from above.'),
  ('canon','1-chronicles',28,19,'canon','exodus',25,40,'free',
   E'*And look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The earthly sanctuary is patterned on the heavenly; David hands Solomon that same heavenly blueprint — *Yahuah (LORD) made me understand in writing by his hand upon me, even all the works of this pattern* (1 Chronicles 28:19).'),
  ('canon','1-chronicles',28,19,'canon','hebrews',8,5,'free',
   E'*Who serve unto the example and shadow of heavenly things... See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5). The apostle names exactly what David gave Solomon — a pattern of heavenly things — for *Yahuah (LORD) made me understand in writing by his hand... even all the works of this pattern* (1 Chronicles 28:19); the shadow drawn after the true.'),
  ('canon','1-chronicles',28,19,'canon','acts',7,44,'free',
   E'*Our fathers had the tabernacle of witness in the wilderness, as he had appointed, speaking unto Moses, that he should make it according to the fashion that he had seen* (Acts 7:44). The same principle that built the tabernacle builds the temple — David''s pattern *made me understand in writing by his hand upon me* (1 Chronicles 28:19) is the fashion seen, not a thing of men''s devising.'),
  ('canon','1-chronicles',28,11,'apocrypha','the-wisdom-of-solomon',9,8,'extras',
   E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). The second-temple voice of Solomon names the house as a copy of the heavenly — fitting the pattern David handed him, *the pattern of the porch, and of the houses thereof... and of the place of the mercy seat* (1 Chronicles 28:11), the resemblance of what was prepared from the beginning.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah',
       E'He hath chosen Solomon to sit upon the throne of the kingdom of Yahuah',
       E'Before all the princes of Yashar''el (Israel) David discharges the oath he had been given: *Howbeit Yahuah Elohim (the LORD God) of Yashar''el (Israel) chose me before all the house of my father to be king... for he hath chosen Yahudah (Judah) to be the ruler; and of the house of Yahudah (Judah), the house of my father... And of all my sons... he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:4-5). The election narrows seed by seed — the tribe of Yahudah, the house of David, the chosen son — the same paternal-bloodline-and-covenant-word election that runs the whole canon. David quotes the very oath of 2 Samuel back: *He shall build my house and my courts: for I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6), which is *He shall build an house for my name, and I will stablish the throne of his kingdom for ever. I will be his father, and he shall be my son* (2 Samuel 7:13-14). The psalm sings it: *Yahuah (LORD) hath sworn in truth unto David... Of the fruit of thy body will I set upon thy throne* (Psalm 132:11). And the throne is conditioned, not abolished: *I will establish his kingdom for ever, if he be constant to do my commandments and my judgments* (1 Chronicles 28:7). The father-son word over Solomon reaches past the type to the greater Heir: *Thou art my Son... I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5) — the chosen house-builder become the everlasting King.',
       sv.verse_id, ev.verse_id, 'free', 30675
  FROM _s313_chr28_lookup sv, _s313_chr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=28 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts',
       E'Serve him with a perfect heart, for Yahuah searcheth all hearts',
       E'The crown of David''s charge is not a building instruction but a heart instruction: *And thou, Solomon my son, know thou the Elohim (God) of thy father, and serve him with a perfect heart and with a willing mind: for Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts: if thou seek him, he will be found of thee; but if thou forsake him, he will cast thee off for ever* (1 Chronicles 28:9). This is the covenant condition the whole framework upholds — heart and obedience together, the seek-and-be-found pledge of the Torah: *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29); *ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). It is the same Elohim who chose David by the heart: *Yahuah (LORD) seeth not as man seeth... but Yahuah (LORD) looketh on the heart* (1 Samuel 16:7); who tries the reins: *I Yahuah (LORD) search the heart... even to give every man according to his ways* (Jeremiah 17:10); whom David has known: *O Yahuah (LORD), thou hast searched me, and known me... thou understandest my thought afar off* (Psalm 139:1-2). This is the worship still sought — *the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — for the living word *is a discerner of the thoughts and intents of the heart* (Hebrews 4:12), and *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The second-temple voice agrees: Yahuah is *a true beholder of his heart* (Wisdom of Solomon 1:6). A perfect heart cannot be feigned, and a forsaking heart will not stand — the condition that David set over the throne (1 Chronicles 28:7-8) is set over the soul.',
       sv.verse_id, ev.verse_id, 'extras', 30676
  FROM _s313_chr28_lookup sv, _s313_chr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=28 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee',
       E'Be strong and of good courage; he will not fail thee, nor forsake thee',
       E'David closes the charge with the great commission-word of the Tanakh: *Take heed now; for Yahuah (LORD) hath chosen thee to build an house for the sanctuary: be strong, and do it* (1 Chronicles 28:10), and again, *Be strong and of good courage, and do it: fear not, nor be dismayed: for Yahuah Elohim (the LORD God), even my Elohim (God), will be with thee; he will not fail thee, nor forsake thee, until thou hast finished all the work for the service of the house of Yahuah (LORD)* (1 Chronicles 28:20). It is Moses'' charge handed down: *Be strong and of a good courage, fear not, nor be afraid... for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6); and the same word to Joshua at the inheritance: *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The apostle quotes the very pledge: *I will never leave thee, nor forsake thee* (Hebrews 13:5), and rests the believer''s confidence on the faithful Finisher: *he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The courage is never self-supplied; it is the certainty that the Faithful One who commands the work also finishes it.',
       sv.verse_id, ev.verse_id, 'free', 30677
  FROM _s313_chr28_lookup sv, _s313_chr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=28 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand',
       E'The pattern Yahuah made me understand in writing by his hand',
       E'David does not hand Solomon a builder''s sketch of his own design. He hands him a revealed blueprint: *Then David gave to Solomon his son the pattern of the porch, and of the houses thereof, and of the treasuries thereof... and of the place of the mercy seat* (1 Chronicles 28:11), down to *the pattern of the chariot of the cherubims, that spread out their wings, and covered the ark of the covenant of Yahuah (LORD)* (1 Chronicles 28:18), and seals it: *All this, said David, Yahuah (LORD) made me understand in writing by his hand upon me, even all the works of this pattern* (1 Chronicles 28:19). This is the same principle that built the tabernacle at Sinai: *According to all that I shew thee, after the pattern of the tabernacle... even so shall ye make it* (Exodus 25:9); *look that thou make them after their pattern, which was shewed thee in the mount* (Exodus 25:40). The apostle names the meaning — the earthly sanctuary is a copy of the heavenly: *Who serve unto the example and shadow of heavenly things... See, saith he, that thou make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5); *as he had appointed... that he should make it according to the fashion that he had seen* (Acts 7:44). The second-temple voice of Solomon confesses it plainly: the temple is *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). The house of Yahuah is built after the heavenly original, never invented from below.',
       sv.verse_id, ev.verse_id, 'extras', 30678
  FROM _s313_chr28_lookup sv, _s313_chr28_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=28 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the oath David here discharges before the assembly.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=5
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — Solomon the house-builder, the throne established for ever.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=6
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will be his father, and he shall be my son* (2 Samuel 7:14) — the covenant-conditioned adoption David recites over Solomon.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=6
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Of the fruit of thy body will I set upon thy throne* (Psalm 132:11) — the psalm sings the sworn oath behind David''s choosing of Solomon.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=5
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou art my Son... I will be to him a Father* (Hebrews 1:5) — the father-son word reaches forward to the greater Heir of David''s throne.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=6
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-he-hath-chosen-solomon-to-sit-upon-the-throne-of-the-kingdom-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29) — the Torah''s seek-and-be-found, the condition David lays on Solomon.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13) — the same whole-hearted seeking held out to the scattered.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) looketh on the heart* (1 Samuel 16:7) — the Elohim who chose David by the heart now requires a perfect heart of his son.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I Yahuah (LORD) search the heart, I try the reins* (Jeremiah 17:10) — the heart-searcher who renders to each according to his ways.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou hast searched me, and known me* (Psalm 139:1) — David sings what he charges: Yahuah searches all hearts.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*thou understandest my thought afar off* (Psalm 139:2) — he understands all the imaginations of the thoughts.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — the perfect heart and willing mind the Father still seeks.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*a discerner of the thoughts and intents of the heart* (Hebrews 4:12) — the living word that lays the heart bare.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*all things are naked and opened unto the eyes of him* (Hebrews 4:13) — no perfect heart hidden, no false one either.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*a true beholder of his heart* (Wisdom of Solomon 1:6) — the second-temple witness to the same heart-searching Elohim. [extras]'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=9
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-serve-him-with-a-perfect-heart-for-yahuah-searcheth-all-hearts'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Be strong and of a good courage, fear not... he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — Moses'' charge to Yashar''el, handed down to Solomon.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=20
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5) — the same word that strengthened Joshua at the inheritance.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=20
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will never leave thee, nor forsake thee* (Hebrews 13:5) — the apostle quotes the very pledge David trusted.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=20
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he which hath begun a good work in you will perform it* (Philippians 1:6) — the faithful Finisher who completes the work he commands.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=20
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-be-strong-and-of-good-courage-he-will-not-fail-thee-nor-forsake-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*after the pattern of the tabernacle, and the pattern of all the instruments thereof... even so shall ye make it* (Exodus 25:9) — the same revealed blueprint that built the tabernacle.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=19
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*make them after their pattern, which was shewed thee in the mount* (Exodus 25:40) — the earthly sanctuary patterned on the heavenly.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=19
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*make all things according to the pattern shewed to thee in the mount* (Hebrews 8:5) — the shadow of heavenly things, named by the apostle.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=19
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*according to the fashion that he had seen* (Acts 7:44) — the tabernacle of witness, made to the fashion shewn, not man''s devising.'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=19
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8) — Solomon''s own confession of the heavenly original. [extras]'
  FROM cross_reference_threads t
  JOIN _s313_chr28_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=28 AND sv.verse_number=11
  JOIN _s313_chr28_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-chronicles-28-the-pattern-yahuah-made-me-understand-in-writing-by-his-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-chronicles_29.sql (1 Chronicles 29) -----
-- Chapter: 1 Chronicles 29 — David's willing offering, the great doxology, and the close of the reign
-- Tag: chr29   Session: s313   Temp view: _s313_chr29_lookup
-- Sort band: 30700-30705 (+1 per thread, 6 threads)
-- Source book_slug: 1-chronicles, chapter 29 (edition canon)
--
-- DOXOLOGY FRAMING: 29:11-13 "Thine, O Yahuah, is the greatness, and the power, and the glory...
-- thine is the kingdom" is THE great ascription — all glory returned to Yahuah. It is the close
-- the Lord's prayer echoes (Matt 6:13 "thine is the kingdom, and the power, and the glory") and
-- the song heaven sings (Rev 4:11/5:13). 29:14 "all things come of thee, and of thine own have
-- we given thee" is the anti-merit hinge: the willing offering only returns Yahuah's own gift
-- (Rom 11:36, Jas 1:17, 2 Cor 9:7). 29:23 the throne is called the THRONE OF YAHUAH — the Davidic
-- king is Yahuah's vicegerent, the seat the Formed Son inherits (Luke 1:32-33). 29:17-19 Yahuah
-- TRIES THE HEART and David prays for a perfect heart to KEEP THY COMMANDMENTS — the heart-religion
-- of Torah, not Torah replaced.
--
-- 1 Chronicles 29 coverage:
--   v.1-9 (willing offering):
--        NT:     2 Corinthians 9:7 (cheerful giver), 2 Corinthians 8:12 (willing mind accepted)
--        Extras: Ecclesiasticus 35:9-10 (cheerful countenance / cheerful eye)
--        Tanakh: Exodus 25:2, Exodus 35:5, Exodus 35:21, Exodus 35:29 (tabernacle willing offering)
--   v.10-13 (the doxology):
--        NT:     Matthew 6:13, Revelation 4:11, Revelation 5:13, Romans 11:36, 1 Timothy 1:17
--        Extras: Tobit 13:1 (Blessed be Yahuah... and blessed be his kingdom)
--        Tanakh: Psalm 145:13 (thy kingdom is an everlasting kingdom)
--   v.14-16 (all things come of thee / strangers & sojourners):
--        NT:     Hebrews 11:13 (strangers and pilgrims), 1 Peter 2:11, James 1:17 (every good gift from above)
--        Extras: none warranted (Sirach giving material placed on the offering thread)
--        Tanakh: Psalm 39:12 (a stranger... a sojourner, as all my fathers were), Job 14:2 (as a shadow)
--   v.17-19 (tries the heart / perfect heart to keep commandments):
--        NT:     none warranted (heart-trying woven within the Tanakh heart-covenant)
--        Extras: none warranted
--        Tanakh: 1 Chronicles 28:9 (Yahuah searcheth all hearts), Proverbs 16:2 (Yahuah weigheth the spirits),
--                Psalm 51:10 (create in me a clean heart), Jeremiah 32:39 (one heart, one way)
--   v.20-25 (worship, Solomon king, the throne of Yahuah):
--        NT:     Luke 1:32, Luke 1:33 (the throne of his father David... his kingdom no end)
--        Extras: none warranted
--        Tanakh: 1 Chronicles 28:5 (throne of the kingdom of Yahuah), Psalm 2:6 (my king upon my holy hill)
--   v.26-28 (David's death, good old age):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Genesis 25:8 (Abraham died in a good old age), Job 42:17 (died, old and full of days)
--   v.29-30 (the chronicle sources): none warranted (annalistic note)
--
-- Threads (slug -> target libraries):
--   1-chronicles-29-the-willing-offering-with-a-perfect-heart           [Tanakh + NT + Extras]  free->extras
--   1-chronicles-29-thine-is-the-kingdom-the-power-and-the-glory        [NT + Tanakh + Extras]  free->extras
--   1-chronicles-29-all-things-come-of-thee-strangers-and-sojourners    [Tanakh + NT]           free
--   1-chronicles-29-thou-triest-the-heart-a-perfect-heart-to-keep       [Tanakh]                free
--   1-chronicles-29-the-throne-of-yahuah-solomon-set-as-king            [Tanakh + NT]           free
--   1-chronicles-29-david-died-in-a-good-old-age-full-of-days           [Tanakh]                free

CREATE TEMP VIEW _s313_chr29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the willing offering with a perfect heart (29:5,9) ---------------------------------
    ('canon','1-chronicles',29,5,'canon','exodus',25,2,'free',
     E'When David asks, *And who then is willing to consecrate his service this day unto Yahuah (LORD)?* (1 Chronicles 29:5), he reopens the very door of the tabernacle. *Speak unto the children of Yashar''el (Israel), that they bring me an offering: of every man that giveth it willingly with his heart ye shall take my offering* (Exodus 25:2). The house of Yahuah is built only from gifts the heart freely gives.'),
    ('canon','1-chronicles',29,5,'canon','exodus',35,5,'free',
     E'David''s call to *consecrate his service this day unto Yahuah (LORD)* (1 Chronicles 29:5) repeats Moses'' call for the sanctuary: *Take ye from among you an offering unto Yahuah (LORD): whosoever is of a willing heart, let him bring it* (Exodus 35:5). The willing heart, not the amount, is what Yahuah requires of his house.'),
    ('canon','1-chronicles',29,9,'canon','exodus',35,21,'free',
     E'*Then the people rejoiced, for that they offered willingly* (1 Chronicles 29:9) is the temple-age echo of the tabernacle: *And they came, every one whose heart stirred him up, and every one whom his spirit made willing, and they brought the LORD''S offering to the work of the tabernacle* (Exodus 35:21). The stirred-up heart is the same Spirit in both houses of worship.'),
    ('canon','1-chronicles',29,9,'canon','exodus',35,29,'free',
     E'*With perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) is the very pattern of the wilderness gift: *The children of Yashar''el (Israel) brought a willing offering unto Yahuah (LORD), every man and woman, whose heart made them willing to bring* (Exodus 35:29). Israel''s open heart builds both the tent and the temple.'),
    ('canon','1-chronicles',29,9,'canon','2-corinthians',9,7,'free',
     E'*With perfect heart they offered willingly to Yahuah (LORD): and David the king also rejoiced with great joy* (1 Chronicles 29:9) is what Paul names the heart Yahuah loves: *Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The cheerful, freewill gift is unchanged from David''s congregation to the assembly of the Messiah.'),
    ('canon','1-chronicles',29,9,'canon','2-corinthians',8,12,'free',
     E'Israel''s gift *with perfect heart* (1 Chronicles 29:9) is measured the way Paul measures it: *For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). Yahuah weighs the willingness of the heart, not the size of the talent.'),
    ('canon','1-chronicles',29,9,'apocrypha','ecclesiasticus',35,9,'extras',
     E'The congregation that *offered willingly* with great joy (1 Chronicles 29:9) keeps the counsel Ben Sira preserves: *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness* (Ecclesiasticus 35:9). The cheerful giver of 2 Corinthians 9:7 stands already in second-Temple Israel''s wisdom.'),
    ('canon','1-chronicles',29,9,'apocrypha','ecclesiasticus',35,10,'extras',
     E'David''s rejoicing gift (1 Chronicles 29:9) answers Ben Sira''s charge: *Give to the Most High according as he has enriched you; and as you have gotten, give with a cheerful eye* (Ecclesiasticus 35:10). We give back only out of what Yahuah first enriched us with — the same logic David confesses in 29:14.'),

    -- Thread 2: thine is the kingdom, the power, and the glory (29:11-13) ---------------------------
    ('canon','1-chronicles',29,11,'canon','matthew',6,13,'free',
     E'David''s ascription — *Thine, O Yahuah (LORD), is the greatness, and the power, and the glory, and the victory, and the majesty... thine is the kingdom* (1 Chronicles 29:11) — is the very close the Messiah set on the disciples'' prayer: *For thine is the kingdom, and the power, and the glory, for ever. Amen* (Matthew 6:13). The Lord''s prayer ends in David''s doxology.'),
    ('canon','1-chronicles',29,11,'canon','revelation',4,11,'free',
     E'*Thine, O Yahuah (LORD), is the greatness, and the power, and the glory... for all that is in the heaven and in the earth is thine* (1 Chronicles 29:11) is sung again before the throne: *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). All in heaven and earth is his because he made it all.'),
    ('canon','1-chronicles',29,12,'canon','revelation',5,13,'free',
     E'*Both riches and honour come of thee, and thou reignest over all; and in thine hand is power and might* (1 Chronicles 29:12) is the whole creation''s anthem at the end: *Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). David''s ascription of riches, honour, and power is the song every creature joins.'),
    ('canon','1-chronicles',29,11,'canon','romans',11,36,'free',
     E'David confesses Yahuah as the source and sovereign of all — *thine is the kingdom, O Yahuah (LORD), and thou art exalted as head above all* (1 Chronicles 29:11). Paul ends his great doxology the same way: *For of him, and through him, and to him, are all things: to whom be glory for ever. Amen* (Romans 11:36). From him and to him are all things, so to him is all the glory.'),
    ('canon','1-chronicles',29,13,'canon','1-timothy',1,17,'free',
     E'*Now therefore, our Elohim (God), we thank thee, and praise thy glorious name* (1 Chronicles 29:13) is gathered into the apostolic blessing: *Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever. Amen* (1 Timothy 1:17). The glorious Name David praises is the eternal King honoured for ever and ever.'),
    ('canon','1-chronicles',29,11,'canon','psalms',145,13,'free',
     E'David''s *thine is the kingdom, O Yahuah (LORD)* (1 Chronicles 29:11) is the truth his own house sings in the Psalms: *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13). The kingdom David ascribes to Yahuah is the everlasting kingdom, never passing to another.'),
    ('canon','1-chronicles',29,10,'apocrypha','tobit',13,1,'extras',
     E'*David said, Blessed be thou, Yahuah Elohim (LORD God) of Yashar''el (Israel) our father, for ever and ever* (1 Chronicles 29:10). Tobit''s prayer of rejoicing carries the same blessing into exile: *Blessed be Yahuah (God) that lives for ever, and blessed be his kingdom* (Tobit 13:1). The doxology that opens David''s reign''s close is the captive''s confession too — Yahuah and his kingdom blessed for ever.'),

    -- Thread 3: all things come of thee, strangers and sojourners (29:14-15) -----------------------
    ('canon','1-chronicles',29,15,'canon','psalms',39,12,'free',
     E'*For we are strangers before thee, and sojourners, as were all our fathers: our days on the earth are as a shadow* (1 Chronicles 29:15) is the very confession the Psalter prays: *I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12). The wealthiest king of Israel owns himself a pilgrim, as all the fathers were.'),
    ('canon','1-chronicles',29,15,'canon','job',14,2,'free',
     E'*Our days on the earth are as a shadow, and there is none abiding* (1 Chronicles 29:15) speaks Job''s plain truth of man: *He cometh forth like a flower, and is cut down: he fleeth also as a shadow, and continueth not* (Job 14:2). Man is a passing shadow — which is why all that he gives was first Yahuah''s gift.'),
    ('canon','1-chronicles',29,15,'canon','hebrews',11,13,'free',
     E'David''s confession *we are strangers before thee, and sojourners, as were all our fathers* (1 Chronicles 29:15) is the faith of all the patriarchs: *These all died in faith... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13). The pilgrim confession runs from Abraham through David to the cloud of witnesses.'),
    ('canon','1-chronicles',29,15,'canon','1-peter',2,11,'free',
     E'Israel''s confession as *strangers before thee, and sojourners* (1 Chronicles 29:15) is the standing of Yahuah''s people still: *Dearly beloved, I beseech you as strangers and pilgrims, abstain from fleshly lusts, which war against the soul* (1 Peter 2:11). Knowing we are sojourners is the ground of holy living.'),
    ('canon','1-chronicles',29,14,'canon','james',1,17,'free',
     E'*For all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14) is the anti-merit hinge the apostle James restates: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights* (James 1:17). We can give nothing that was not first his — so the offering is never a wage earned but a gift returned.'),

    -- Thread 4: thou triest the heart, a perfect heart to keep thy commandments (29:17-19) --------
    ('canon','1-chronicles',29,17,'canon','1-chronicles',28,9,'free',
     E'*I know also, my Elohim (God), that thou triest the heart, and hast pleasure in uprightness* (1 Chronicles 29:17) is the truth David had just charged on Solomon: *serve him with a perfect heart and with a willing mind: for Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts* (1 Chronicles 28:9). Yahuah is the searcher of hearts, so the heart is what must be brought to him.'),
    ('canon','1-chronicles',29,17,'canon','proverbs',16,2,'free',
     E'*Thou triest the heart, and hast pleasure in uprightness* (1 Chronicles 29:17) is the wisdom of Proverbs: *All the ways of a man are clean in his own eyes; but Yahuah (LORD) weigheth the spirits* (Proverbs 16:2). Man weighs his outward gift; Yahuah weighs the spirit that gave it.'),
    ('canon','1-chronicles',29,18,'canon','psalms',51,10,'free',
     E'David''s prayer — *keep this for ever in the imagination of the thoughts of the heart of thy people, and prepare their heart unto thee* (1 Chronicles 29:18) — is the cry of his own penitence: *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10). Only Yahuah can prepare and keep the heart he tries.'),
    ('canon','1-chronicles',29,19,'canon','jeremiah',32,39,'free',
     E'David asks Yahuah to *give unto Solomon my son a perfect heart, to keep thy commandments, thy testimonies, and thy statutes* (1 Chronicles 29:19) — the very gift the new covenant promises: *And I will give them one heart, and one way, that they may fear me for ever, for the good of them, and of their children after them* (Jeremiah 32:39). The heart prepared to keep Torah is Yahuah''s own work, written within.'),

    -- Thread 5: the throne of Yahuah, Solomon set as king (29:20-23) ------------------------------
    ('canon','1-chronicles',29,23,'canon','1-chronicles',28,5,'free',
     E'*Then Solomon sat on the throne of Yahuah (LORD) as king instead of David his father* (1 Chronicles 29:23). David had named it so already: Yahuah *hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). The Davidic throne is Yahuah''s own throne; the king reigns as his vicegerent, not his rival.'),
    ('canon','1-chronicles',29,23,'canon','psalms',2,6,'free',
     E'The throne Solomon takes is *the throne of Yahuah (LORD)* (1 Chronicles 29:23), the seat Yahuah himself sets the king upon: *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). The king of Israel sits only because Yahuah enthroned him.'),
    ('canon','1-chronicles',29,23,'canon','luke',1,32,'free',
     E'*Then Solomon sat on the throne of Yahuah (LORD) as king instead of David his father, and prospered* (1 Chronicles 29:23). That same throne is promised to the greater Son: *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The throne of Yahuah that Solomon held is the Messiah''s inheritance.'),
    ('canon','1-chronicles',29,23,'canon','luke',1,33,'free',
     E'Solomon sat on *the throne of Yahuah (LORD)* and prospered (1 Chronicles 29:23), but his reign passed; the throne''s true Heir does not: *And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The Formed Son holds David''s throne — the throne of Yahuah — without end.'),

    -- Thread 6: David died in a good old age, full of days (29:28) --------------------------------
    ('canon','1-chronicles',29,28,'canon','genesis',25,8,'free',
     E'*And he died in a good old age, full of days, riches, and honour* (1 Chronicles 29:28). David is gathered as the father of the faithful was: *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people* (Genesis 25:8). The covenant man dies satisfied, full of days, his work in Yahuah''s hand.'),
    ('canon','1-chronicles',29,28,'canon','job',42,17,'free',
     E'*He died in a good old age, full of days* (1 Chronicles 29:28) is the close granted to the upright: *So Job died, being old and full of days* (Job 42:17). The fullness of days crowns the life that walked uprightly before Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s313_chr29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. cross_reference_threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-the-willing-offering-with-a-perfect-heart',
       E'The Willing Offering: With Perfect Heart They Offered Willingly',
       E'David opens the door of the temple the same way Moses opened the door of the tabernacle — by asking for the heart, not the hand. *And who then is willing to consecrate his service this day unto Yahuah (LORD)?* (1 Chronicles 29:5) is the echo of *every man that giveth it willingly with his heart* (Exodus 25:2) and *whosoever is of a willing heart, let him bring it* (Exodus 35:5). The response is joy: *Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) — the very gladness of *every one whose heart stirred him up* who *brought the LORD''S offering to the work of the tabernacle* (Exodus 35:21), the willing offering Israel *brought... unto Yahuah (LORD), every man and woman, whose heart made them willing* (Exodus 35:29). This freewill, joyful giving is unchanged in the assembly of the Messiah: *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7), and the gift *is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12) — willingness, not amount. Second-Temple Israel kept the same counsel: *In all your gifts shew a cheerful countenance, and dedicate your tithes with gladness* (Ecclesiasticus 35:9), *give with a cheerful eye* (Ecclesiasticus 35:10). From tent to temple to the gathered remnant, Yahuah''s house is built only from hearts that give with joy.',
       sv.verse_id, ev.verse_id, 'extras', 30700
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-thine-is-the-kingdom-the-power-and-the-glory',
       E'Thine Is the Kingdom, the Power, and the Glory — David''s Great Doxology',
       E'This is the great ascription of the whole canon. *Blessed be thou, Yahuah Elohim (LORD God) of Yashar''el (Israel) our father, for ever and ever* (1 Chronicles 29:10), and then: *Thine, O Yahuah (LORD), is the greatness, and the power, and the glory, and the victory, and the majesty: for all that is in the heaven and in the earth is thine; thine is the kingdom, O Yahuah (LORD), and thou art exalted as head above all* (1 Chronicles 29:11); *Both riches and honour come of thee... and in thine hand is power and might* (1 Chronicles 29:12); *Now therefore, our Elohim (God), we thank thee, and praise thy glorious name* (1 Chronicles 29:13). The Messiah sealed the disciples'' prayer with these very words: *For thine is the kingdom, and the power, and the glory, for ever. Amen* (Matthew 6:13). Heaven sings it back: *Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things* (Revelation 4:11), and every creature cries *Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever* (Revelation 5:13). Paul ends his doxology the same way: *For of him, and through him, and to him, are all things: to whom be glory for ever* (Romans 11:36); and the apostolic blessing crowns *the King eternal, immortal, invisible, the only wise Elohim (God)* with *honour and glory for ever and ever* (1 Timothy 1:17). David''s own house already sang it: *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13). Even in exile the captive prays it: *Blessed be Yahuah (God) that lives for ever, and blessed be his kingdom* (Tobit 13:1). All the greatness, the power, and the glory are Yahuah''s — for ever and ever.',
       sv.verse_id, ev.verse_id, 'extras', 30701
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-all-things-come-of-thee-strangers-and-sojourners',
       E'All Things Come of Thee: Strangers and Sojourners on the Earth',
       E'At the height of the offering David empties himself of all merit: *But who am I, and what is my people, that we should be able to offer so willingly after this sort? for all things come of thee, and of thine own have we given thee* (1 Chronicles 29:14). The richest king Israel had ever known confesses he can give nothing that was not first Yahuah''s gift — the apostle says the same: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights* (James 1:17). And he confesses what man is: *For we are strangers before thee, and sojourners, as were all our fathers: our days on the earth are as a shadow, and there is none abiding* (1 Chronicles 29:15). This is the Psalter''s prayer — *I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12) — and Job''s plain truth — *He cometh forth like a flower, and is cut down: he fleeth also as a shadow, and continueth not* (Job 14:2). It is the faith of every patriarch: *These all died in faith... and confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13); and the standing of Yahuah''s people still: *I beseech you as strangers and pilgrims, abstain from fleshly lusts* (1 Peter 2:11). Because all is his gift and we are but passing pilgrims, the offering can never be a wage earned — only a gift returned.',
       sv.verse_id, ev.verse_id, 'free', 30702
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-thou-triest-the-heart-a-perfect-heart-to-keep',
       E'Thou Triest the Heart: A Perfect Heart to Keep Thy Commandments',
       E'David''s prayer turns on a single truth: Yahuah reads the heart. *I know also, my Elohim (God), that thou triest the heart, and hast pleasure in uprightness* (1 Chronicles 29:17) — exactly the charge he had just laid on Solomon: *serve him with a perfect heart and with a willing mind: for Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts* (1 Chronicles 28:9). Proverbs says it plainly: *All the ways of a man are clean in his own eyes; but Yahuah (LORD) weigheth the spirits* (Proverbs 16:2). So David prays for what only Yahuah can give: *keep this for ever in the imagination of the thoughts of the heart of thy people, and prepare their heart unto thee* (1 Chronicles 29:18) — his own penitential cry, *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10). And the heart he asks for Solomon is named: *give unto Solomon my son a perfect heart, to keep thy commandments, thy testimonies, and thy statutes* (1 Chronicles 29:19). This is the heart-religion of Torah, not Torah set aside — the very gift the new covenant pledges: *And I will give them one heart, and one way, that they may fear me for ever* (Jeremiah 32:39). The heart prepared to keep his commandments is Yahuah''s own work, written within.',
       sv.verse_id, ev.verse_id, 'free', 30703
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-the-throne-of-yahuah-solomon-set-as-king',
       E'The Throne of Yahuah: Solomon Sat as King Instead of David',
       E'The chronicler does not call it the throne of David or the throne of Israel — he calls it Yahuah''s own: *Then Solomon sat on the throne of Yahuah (LORD) as king instead of David his father, and prospered; and all Yashar''el (Israel) obeyed him* (1 Chronicles 29:23). David had named it so already: Yahuah *hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). The king sits only because Yahuah enthroned him: *Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). The Davidic king is Yahuah''s vicegerent, never his rival — and the throne is finally the inheritance of the greater Son: *He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). Solomon prospered and passed; the true Heir does not: *And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The throne of Yahuah that Solomon held is the seat the Formed Son holds without end.',
       sv.verse_id, ev.verse_id, 'free', 30704
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-chronicles-29-david-died-in-a-good-old-age-full-of-days',
       E'David Died in a Good Old Age, Full of Days, Riches, and Honour',
       E'The reign closes as the lives of the faithful close: *And he died in a good old age, full of days, riches, and honour: and Solomon his son reigned in his stead* (1 Chronicles 29:28). This is the very crown given to the father of the faithful — *Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people* (Genesis 25:8) — and to the upright man tried and restored — *So Job died, being old and full of days* (Job 42:17). The covenant man dies satisfied, his days full, his work and his throne committed into Yahuah''s hand. The willing offering, the doxology, the prepared heart, and the throne of Yahuah all close here, in a death full of days.',
       sv.verse_id, ev.verse_id, 'free', 30705
  FROM _s313_chr29_lookup sv, _s313_chr29_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-chronicles' AND ev.chapter_number=29 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ===== D. cross_reference_thread_members =====
-- Thread 1: the willing offering with a perfect heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,5,'canon','exodus',25,2,1,E'*Of every man that giveth it willingly with his heart ye shall take my offering* (Exodus 25:2) — the tabernacle opens, as the temple does, by asking for the willing heart.'),
    (29,5,'canon','exodus',35,5,2,E'*Whosoever is of a willing heart, let him bring it, an offering of Yahuah (LORD)* (Exodus 35:5) — Moses'' call repeated in David''s.'),
    (29,9,'canon','exodus',35,21,3,E'*Every one whose heart stirred him up... brought the LORD''S offering to the work of the tabernacle* (Exodus 35:21) — the stirred-up heart of both houses of worship.'),
    (29,9,'canon','exodus',35,29,4,E'*The children of Yashar''el (Israel) brought a willing offering... whose heart made them willing* (Exodus 35:29) — the same willing-hearted giving.'),
    (29,9,'canon','2-corinthians',9,7,5,E'*Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7) — the freewill, joyful gift unchanged in the Messiah''s assembly.'),
    (29,9,'canon','2-corinthians',8,12,6,E'*If there be first a willing mind, it is accepted according to that a man hath* (2 Corinthians 8:12) — willingness, not amount, is what is accepted.'),
    (29,9,'apocrypha','ecclesiasticus',35,9,7,E'*Shew a cheerful countenance, and dedicate your tithes with gladness* (Ecclesiasticus 35:9) — second-Temple Israel''s cheerful giver.'),
    (29,9,'apocrypha','ecclesiasticus',35,10,8,E'*Give with a cheerful eye* (Ecclesiasticus 35:10) — give back from what Yahuah first enriched you with.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-the-willing-offering-with-a-perfect-heart'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: thine is the kingdom, the power, and the glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,11,'canon','matthew',6,13,1,E'*For thine is the kingdom, and the power, and the glory, for ever. Amen* (Matthew 6:13) — the Lord''s prayer ends in David''s doxology.'),
    (29,11,'canon','revelation',4,11,2,E'*Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things* (Revelation 4:11) — all heaven and earth is his because he made it.'),
    (29,12,'canon','revelation',5,13,3,E'*Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne* (Revelation 5:13) — every creature joins David''s ascription.'),
    (29,11,'canon','romans',11,36,4,E'*Of him, and through him, and to him, are all things: to whom be glory for ever* (Romans 11:36) — from him and to him, so to him all glory.'),
    (29,13,'canon','1-timothy',1,17,5,E'*Now unto the King eternal, immortal, invisible, the only wise Elohim (God), be honour and glory for ever and ever* (1 Timothy 1:17) — the glorious Name praised for ever.'),
    (29,11,'canon','psalms',145,13,6,E'*Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13) — the kingdom David ascribes never passes to another.'),
    (29,10,'apocrypha','tobit',13,1,7,E'*Blessed be Yahuah (God) that lives for ever, and blessed be his kingdom* (Tobit 13:1) — the captive prays David''s blessing too.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-thine-is-the-kingdom-the-power-and-the-glory'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: all things come of thee, strangers and sojourners
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,15,'canon','psalms',39,12,1,E'*I am a stranger with thee, and a sojourner, as all my fathers were* (Psalm 39:12) — the king owns himself a pilgrim, as all the fathers were.'),
    (29,15,'canon','job',14,2,2,E'*He fleeth also as a shadow, and continueth not* (Job 14:2) — man is a passing shadow, so all he gives was first Yahuah''s.'),
    (29,15,'canon','hebrews',11,13,3,E'*Confessed that they were strangers and pilgrims on the earth* (Hebrews 11:13) — the pilgrim faith of every patriarch.'),
    (29,15,'canon','1-peter',2,11,4,E'*I beseech you as strangers and pilgrims, abstain from fleshly lusts* (1 Peter 2:11) — the sojourner standing is the ground of holy living.'),
    (29,14,'canon','james',1,17,5,E'*Every good gift and every perfect gift is from above* (James 1:17) — we give nothing not first his, so the offering is a gift returned, not a wage earned.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-all-things-come-of-thee-strangers-and-sojourners'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: thou triest the heart, a perfect heart to keep thy commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,17,'canon','1-chronicles',28,9,1,E'*Yahuah (LORD) searcheth all hearts, and understandeth all the imaginations of the thoughts* (1 Chronicles 28:9) — David''s charge to Solomon, now his own confession.'),
    (29,17,'canon','proverbs',16,2,2,E'*Yahuah (LORD) weigheth the spirits* (Proverbs 16:2) — man weighs the gift; Yahuah weighs the spirit that gave it.'),
    (29,18,'canon','psalms',51,10,3,E'*Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10) — only Yahuah can prepare and keep the heart he tries.'),
    (29,19,'canon','jeremiah',32,39,4,E'*I will give them one heart, and one way, that they may fear me for ever* (Jeremiah 32:39) — the heart to keep his commandments is the new covenant''s own gift.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-thou-triest-the-heart-a-perfect-heart-to-keep'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: the throne of Yahuah, Solomon set as king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,23,'canon','1-chronicles',28,5,1,E'*To sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5) — the throne is Yahuah''s own, named so already.'),
    (29,23,'canon','psalms',2,6,2,E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) — the king sits only because Yahuah enthroned him.'),
    (29,23,'canon','luke',1,32,3,E'*Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the throne of Yahuah is the greater Son''s inheritance.'),
    (29,23,'canon','luke',1,33,4,E'*He shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — Solomon passed; the true Heir reigns without end.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-the-throne-of-yahuah-solomon-set-as-king'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: David died in a good old age, full of days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.so, m.mnote
  FROM (VALUES
    (29,28,'canon','genesis',25,8,1,E'*Then Abraham gave up the ghost, and died in a good old age, an old man, and full of years* (Genesis 25:8) — David gathered as the father of the faithful was.'),
    (29,28,'canon','job',42,17,2,E'*So Job died, being old and full of days* (Job 42:17) — the fullness of days crowns the upright life.')
  ) AS m(chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,so,mnote)
  JOIN cross_reference_threads t ON t.slug='1-chronicles-29-david-died-in-a-good-old-age-full-of-days'
  JOIN _s313_chr29_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-chronicles' AND sv.chapter_number=29 AND sv.verse_number=m.src_v
  JOIN _s313_chr29_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session313 — 1 Chronicles cross-references complete.'
