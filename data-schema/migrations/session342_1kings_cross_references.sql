-- =====================================================================
-- Session 342 — 1 Kings FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session342_1kings_cross_references.sql
-- =====================================================================

\echo 'session342 — 1 Kings cross-references starting...'
BEGIN;

-- ----- fragment: minion_1-kings_1.sql (1 Kings 1) -----
-- 1 Kings 1 — full-library cross-references. Tag 1ki01. Session prefix s342.
-- Sort band 37900, step 3: 37900, 37903, 37906, 37909.
-- View: _s342_1ki01_lookup
--
-- FRAME: the self-exalting usurper (Adonijah, "I will be king") vs the chosen
-- seed enthroned (Solomon, whom Yahuah chose, 1 Chr 28:5); the anointing of the
-- promised son at Gihon (Davidic line continuing — the seed of 2 Sam 7, the
-- anointed King of Ps 2, foreshadowing the lowly King of Zech 9:9 / the entry of
-- Matt 21 / John 12); mercy to the submissive at the horns of the altar.
--
-- 1 Kings 1 coverage:
--   v.5-7 (Adonijah exalts himself, I will be king)
--        NT:     none warranted (type carried by the Ps 2 thread forward)
--        Extras: none warranted
--        Tanakh: Psalm 2:1-3 (kings set themselves), 1 Chr 28:5 (the chosen vs the self-chosen) — THREAD 1
--   v.13,17,30 (the oath: Solomon thy son shall reign / sit upon my throne)
--        NT:     none warranted (the seed-promise is the Tanakh spine here)
--        Extras: none warranted
--        Tanakh: 2 Sam 7:12-13 (I will set up thy seed... stablish the throne), 1 Chr 28:5-6 (chosen Solomon) — THREAD 2
--   v.34,38-40 (ride the mule to Gihon; Zadok anoints with horn of oil; trumpet; Elohim save king Solomon)
--        NT:     Matt 21:5 / John 12:15 (the lowly King cometh, riding) — fulfillment weave
--        Extras: none warranted
--        Tanakh: Ps 2:6-7 (set my king on Zion / this day begotten), Zech 9:9 (thy King cometh lowly riding) — THREAD 3
--   v.50-53 (Adonijah feared, caught hold on the horns of the altar; mercy if worthy)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exod 21:14 (the presumptuous slayer taken FROM the altar — the altar shelters the submissive, not the guilty) — THREAD 4
--
-- THREADS:
--   1ki01: 1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon (canon Tanakh) [free]
--   1ki01: 1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed (canon Tanakh) [free]
--   1ki01: 1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding (canon Tanakh + NT) [free]
--   1ki01: 1-kings-1-he-caught-hold-on-the-horns-of-the-altar-mercy-to-the-submissive (canon Tanakh) [free]
--
-- Contested/load-bearing framing: Ps 2:7 (this day have I begotten thee) read as
-- the Davidic king's enthronement-decree fulfilled forward in the Formed Son — the
-- begotten King, NOT a co-equal eternal-generation gloss; the begetting is the
-- royal sonship of 2 Sam 7:14 (I will be his father, he shall be my son) set upon
-- the throne. Zech 9:9 / Matt 21:5 woven as the same enthroned-King pattern: the
-- chosen son brought lowly (on a mule, on an ass) to be acclaimed, never the
-- self-exalting usurper.

CREATE TEMP VIEW _s342_1ki01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the self-exalting usurper vs the chosen
    ('canon','1-kings',1,5,'canon','psalms',2,1,'free',E'*Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). Adonijah''s *I will be king* (1 Kings 1:5) is the same self-setting of a man who *prepared him chariots and horsemen* — the rebel who exalts himself against Yahuah''s appointed instead of waiting to be set.'),
    ('canon','1-kings',1,5,'canon','psalms',2,2,'free',E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). The usurper *exalted himself, saying, I will be king* (1 Kings 1:5) and conferred with Joab and Abiathar — counsel taken against the one Yahuah would anoint.'),
    ('canon','1-kings',1,5,'canon','1-chronicles',28,5,'free',E'*And of all my sons... he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). Against this Adonijah *exalted himself, saying, I will be king* (1 Kings 1:5): the self-chosen man set against the son Yahuah Himself had chosen — the whole contrast of the chapter.'),
    ('canon','1-kings',1,7,'canon','1-chronicles',28,5,'free',E'*And of all my sons... he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). Adonijah *conferred with Joab the son of Zeruiah, and with Abiathar the priest* (1 Kings 1:7) — gathering men to seize a throne already given by Yahuah to another.'),
    -- THREAD 2: the oath / the promised seed shall reign
    ('canon','1-kings',1,13,'canon','2-samuel',7,12,'free',E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). David''s oath, *Assuredly Solomon thy son shall reign after me, and he shall sit upon my throne* (1 Kings 1:13), confirms the seed-promise: the son after him is the seed Yahuah swore to set up.'),
    ('canon','1-kings',1,13,'canon','2-samuel',7,13,'free',E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The throne David swears to Solomon — *he shall sit upon my throne* (1 Kings 1:13) — is the very throne Yahuah promised to stablish for ever through the seed.'),
    ('canon','1-kings',1,17,'canon','1-chronicles',28,5,'free',E'*And of all my sons... he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). Bath-sheba pleads the oath, *Assuredly Solomon thy son shall reign after me, and he shall sit upon my throne* (1 Kings 1:17): the king''s sworn word matches Yahuah''s own choosing of Solomon.'),
    ('canon','1-kings',1,30,'canon','2-samuel',7,12,'free',E'*I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). David swears it again: *Assuredly Solomon thy son shall reign after me, and he shall sit upon my throne in my stead; even so will I certainly do this day* (1 Kings 1:30) — the seed-promise made certain, this day, in the line of David.'),
    ('canon','1-kings',1,30,'canon','1-chronicles',28,6,'free',E'*And he said unto me, Solomon thy son, he shall build my house and my courts: for I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6). David''s sworn *Assuredly Solomon thy son shall reign... and he shall sit upon my throne in my stead* (1 Kings 1:30) executes Yahuah''s declared adoption of the chosen son.'),
    -- THREAD 3: anointed at Gihon, the King cometh riding
    ('canon','1-kings',1,34,'canon','psalms',2,6,'free',E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). David''s command, *let Zadok the priest and Nathan the prophet anoint him there king over Yashar''el (Israel)... and say, Elohim (God) save king Solomon* (1 Kings 1:34), is the earthly enacting of Yahuah setting His king — the anointed son installed by Yahuah''s own hand.'),
    ('canon','1-kings',1,34,'canon','psalms',2,7,'free',E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The anointing-day at Gihon — *anoint him there king... say, Elohim (God) save king Solomon* (1 Kings 1:34) — is the enthronement begetting of the royal son (2 Sam 7:14), fulfilled forward in the Formed Son set upon the throne.'),
    ('canon','1-kings',1,38,'canon','zechariah',9,9,'free',E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). The chosen king does not seize the throne but is set upon David''s mule and brought down — *caused Solomon to ride upon king David''s mule, and brought him to Gihon* (1 Kings 1:38) — the same pattern of the lowly, given King.'),
    ('canon','1-kings',1,39,'canon','psalms',2,6,'free',E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6). *And Zadok the priest took an horn of oil out of the tabernacle, and anointed Solomon. And they blew the trumpet; and all the people said, Elohim (God) save king Solomon* (1 Kings 1:39): the horn of oil and the trumpet enact Yahuah''s setting of His anointed king.'),
    ('canon','1-kings',1,40,'canon','zechariah',9,9,'free',E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee* (Zechariah 9:9). The earth rent with rejoicing — *the people piped with pipes, and rejoiced with great joy, so that the earth rent with the sound of them* (1 Kings 1:40) — the daughter of Zion shouting at the coming of the given king.'),
    ('canon','1-kings',1,38,'canon','matthew',21,5,'free',E'*Tell ye the daughter of Sion, Behold, thy King cometh unto thee, meek, and sitting upon an ass, and a colt the foal of an ass* (Matthew 21:5). Solomon set *to ride upon king David''s mule* and brought to Gihon (1 Kings 1:38) prefigures the greater Son of David who likewise comes not in self-exalting chariots but lowly, the chosen King brought to His city.'),
    ('canon','1-kings',1,40,'canon','john',12,15,'free',E'*Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15). The joy that *the earth rent with the sound* at Solomon''s coming (1 Kings 1:40) is answered when the daughter of Zion meets the King riding lowly — the rightful, given King acclaimed, not the usurper feasting at En-rogel.'),
    -- THREAD 4: mercy to the submissive at the horns of the altar
    ('canon','1-kings',1,50,'canon','exodus',21,14,'free',E'*But if a man come presumptuously upon his neighbour, to slay him with guile; thou shalt take him from mine altar, that he may die* (Exodus 21:14). The altar shelters the one who flees in fear, not the presumptuous: Adonijah *feared because of Solomon, and arose, and went, and caught hold on the horns of the altar* (1 Kings 1:50) — and because he submits rather than slays with guile, mercy is shown.'),
    ('canon','1-kings',1,52,'canon','exodus',21,14,'free',E'*Thou shalt take him from mine altar, that he may die* (Exodus 21:14). The Torah marks the altar as no refuge for guile; Solomon answers the submissive with the same justice inverted toward mercy — *If he will shew himself a worthy man, there shall not an hair of him fall to the earth: but if wickedness shall be found in him, he shall die* (1 Kings 1:52).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon',
       E'Adonijah exalted himself, "I will be king" — but Yahuah chose Solomon',
       E'David is old, and into the vacuum steps a man who appoints himself: *Then Adonijah the son of Haggith exalted himself, saying, I will be king: and he prepared him chariots and horsemen, and fifty men to run before him* (1 Kings 1:5). He *conferred with Joab the son of Zeruiah, and with Abiathar the priest* (1 Kings 1:7), and feasted his faction — but *Solomon his brother, he called not* (1 Kings 1:10). This is the posture the second Psalm names: *Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). The self-set man against the Yahuah-set king. And the throne was never his to take, for David had already declared Yahuah''s own choosing: *And of all my sons, (for Yahuah (LORD) hath given me many sons,) he hath chosen Solomon my son to sit upon the throne of the kingdom of Yahuah (LORD) over Yashar''el (Israel)* (1 Chronicles 28:5). The whole chapter turns on this contrast — the usurper who exalts himself, and the seed Yahuah chose and would set in his own time.',
       sv.verse_id, ev.verse_id, 'free', 37900
  FROM _s342_1ki01_lookup sv, _s342_1ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed',
       E'"Assuredly Solomon thy son shall reign" — the promised seed confirmed',
       E'Nathan and Bath-sheba move David to confirm the oath, and three times the sworn word rings out: *Assuredly Solomon thy son shall reign after me, and he shall sit upon my throne* (1 Kings 1:13), again from Bath-sheba''s mouth (1 Kings 1:17), and at last from David himself: *Even as I sware unto thee by Yahuah Elohim (the LORD God) of Yashar''el (Israel), saying, Assuredly Solomon thy son shall reign after me, and he shall sit upon my throne in my stead; even so will I certainly do this day* (1 Kings 1:30). This is not court intrigue alone; it is the seed-promise of 2 Samuel reaching its first heir: *And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom. He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:12-13). And it answers exactly Yahuah''s own declared adoption of the chosen son: *Solomon thy son, he shall build my house and my courts: for I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6). The throne is kept in the line of David — the paternal bloodline carrying the covenant-word — toward the Son in whom the throne is stablished for ever.',
       sv.verse_id, ev.verse_id, 'free', 37903
  FROM _s342_1ki01_lookup sv, _s342_1ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=1 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding',
       E'Anointed at Gihon with the horn of oil — the King cometh riding',
       E'The rightful king is not self-exalted but set upon another''s mule and led down to be anointed: *cause Solomon my son to ride upon mine own mule, and bring him down to Gihon: And let Zadok the priest and Nathan the prophet anoint him there king over Yashar''el (Israel): and blow ye with the trumpet, and say, Elohim (God) save king Solomon* (1 Kings 1:33-34). So it is done — *Zadok the priest took an horn of oil out of the tabernacle, and anointed Solomon. And they blew the trumpet; and all the people said, Elohim (God) save king Solomon* (1 Kings 1:39) — and *the people piped with pipes, and rejoiced with great joy, so that the earth rent with the sound of them* (1 Kings 1:40). This is the enthronement the second Psalm sings: *Yet have I set my king upon my holy hill of Zion. I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:6-7) — the royal son begotten to the throne. And the pattern reaches forward to the greater Son of David, who likewise comes not in seized chariots but lowly and given: *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9) — fulfilled when *thy King cometh unto thee, meek, and sitting upon an ass* (Matthew 21:5), and the daughter of Sion is told, *Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15). The chosen king, brought lowly, acclaimed with rejoicing — never the usurper feasting at En-rogel.',
       sv.verse_id, ev.verse_id, 'free', 37906
  FROM _s342_1ki01_lookup sv, _s342_1ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=1 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-1-he-caught-hold-on-the-horns-of-the-altar-mercy-to-the-submissive',
       E'He caught hold on the horns of the altar — mercy to the submissive',
       E'With Solomon enthroned, the usurper''s faction scatters, and Adonijah himself flees to the one place that might shelter him: *And Adonijah feared because of Solomon, and arose, and went, and caught hold on the horns of the altar* (1 Kings 1:50). The Torah had already fixed the meaning of that altar: it is no refuge for guile — *But if a man come presumptuously upon his neighbour, to slay him with guile; thou shalt take him from mine altar, that he may die* (Exodus 21:14). The altar shelters the one who fears and submits, not the one who comes presumptuously. So Solomon answers the submissive man with mercy held out on condition of his walk: *If he will shew himself a worthy man, there shall not an hair of him fall to the earth: but if wickedness shall be found in him, he shall die* (1 Kings 1:52). He is brought down from the altar, bows to the king, and is sent home in peace (1 Kings 1:53) — mercy to the one who bends the knee, the throne secure without needless blood.',
       sv.verse_id, ev.verse_id, 'free', 37909
  FROM _s342_1ki01_lookup sv, _s342_1ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=50
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=1 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The kings of the earth set themselves... against Yahuah (LORD), and against his anointed* (Psalm 2:1) — the self-setting rebel against Yahuah''s appointed.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The kings of the earth set themselves... against his anointed* (Psalm 2:2) — counsel taken against the king Yahuah would anoint.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He hath chosen Solomon my son to sit upon the throne* (1 Chronicles 28:5) — the self-chosen man set against the son Yahuah chose.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=28 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He hath chosen Solomon my son to sit upon the throne* (1 Chronicles 28:5) — Adonijah gathered men (1 Kings 1:7) to seize a throne already given.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=28 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-adonijah-exalted-himself-i-will-be-king-but-yahuah-chose-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the oath confirms the seed-promise.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the throne sworn to Solomon is the throne Yahuah promised to stablish.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He hath chosen Solomon my son to sit upon the throne* (1 Chronicles 28:5) — the king''s sworn word matches Yahuah''s choosing.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=28 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will set up thy seed after thee* (2 Samuel 7:12) — David swears it *this day* (1 Kings 1:30), the seed-promise made certain.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=30
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I have chosen him to be my son, and I will be his father* (1 Chronicles 28:6) — the oath executes Yahuah''s declared adoption of the chosen son.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=30
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=28 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-assuredly-solomon-thy-son-shall-reign-the-promised-seed-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) — the anointing at Gihon enacts Yahuah setting His king.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou art my Son; this day have I begotten thee* (Psalm 2:7) — the enthronement begetting of the royal son, fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=34
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, thy King cometh unto thee... lowly, and riding upon an ass* (Zechariah 9:9) — Solomon set on David''s mule, the lowly given king.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=38
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Behold, thy King cometh unto thee, meek, and sitting upon an ass* (Matthew 21:5) — the greater Son of David comes lowly, not in seized chariots.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=38
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yet have I set my king upon my holy hill of Zion* (Psalm 2:6) — the horn of oil and trumpet enact Yahuah''s anointing.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=39
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem* (Zechariah 9:9) — the earth rent with joy at the coming of the given king.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=40
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Fear not, daughter of Sion: behold, thy King cometh, sitting on an ass''s colt* (John 12:15) — the daughter of Zion meets the rightful King riding lowly.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=40
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=12 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-anointed-at-gihon-with-the-horn-of-oil-the-king-cometh-riding'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt take him from mine altar, that he may die* (Exodus 21:14) — the altar shelters the one who fears and submits, not the presumptuous.'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=50
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-he-caught-hold-on-the-horns-of-the-altar-mercy-to-the-submissive'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt take him from mine altar, that he may die* (Exodus 21:14) — Solomon turns the Torah''s justice toward mercy for the worthy man (1 Kings 1:52).'
  FROM cross_reference_threads t
  JOIN _s342_1ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=1 AND sv.verse_number=52
  JOIN _s342_1ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-1-he-caught-hold-on-the-horns-of-the-altar-mercy-to-the-submissive'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_2.sql (1 Kings 2) -----
-- Chapter: 1 Kings 2 — David's dying charge to Solomon (Torah the charter of the throne) +
--   the kingdom established (Adonijah, Abiathar, Joab, Shimei) — unavenged blood requited,
--   the Eli-house word fulfilled, the throne of David established for ever.
-- Tag: 1ki02   Session: s342   Temp view: _s342_1ki02_lookup
-- Sort band: base 37925, step 3 -> 37925, 37928, 37931, 37934, 37937
--
-- 1 Kings 2 coverage:
--   v.2-4 (be strong, shew thyself a man; keep the charge of Yahuah, walk in his ways, keep his
--          statutes and commandments and judgments and testimonies, as it is written in the law
--          of Moses, that thou mayest prosper) — the Torah-keeping king
--         NT:     none warranted (Torah-king motif carried laterally; NT royal-Torah threads built elsewhere)
--         Extras: none warranted
--         Tanakh: Deuteronomy 17:18-20 (the king writes him a copy of this law, reads it all his
--                 days, keeps the words of this law, that he prolong his days); Joshua 1:7-8
--                 (be strong, observe to do all the law, meditate therein day and night, that thou
--                 mayest prosper); Psalm 89:30-32 (if his children forsake my law... I will visit
--                 their transgression with the rod) — Torah-king / charter-of-the-throne thread
--   v.4   (That Yahuah may continue his word... if thy children take heed... there shall not fail
--          thee a man on the throne of Yashar'el) — the conditional outworking of the Davidic word
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2 Samuel 7:12-14 (I will set up thy seed... establish his kingdom... I will be
--                 his father, and he shall be my son); Psalm 89:3-4 (I have sworn unto David... thy
--                 throne to all generations) — the continued-word thread
--   v.5-6, 31-33 (Joab shed the blood of war in peace, Abner and Amasa; his blood upon his own
--          head; their blood shall return upon the head of Joab; upon David's throne peace for ever)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2 Samuel 3:27-29 (Joab smote Abner under the fifth rib; let it rest on the head
--                 of Joab); 2 Samuel 20:9-10 (Joab smote Amasa in the fifth rib) — requited-blood thread
--   v.7   (shew kindness unto the sons of Barzillai) — folded into narrative, none warranted
--   v.8-9, 36-46 (Shimei's grievous curse; the oath of Yahuah; he kept not the oath; his
--          wickedness upon his own head; the throne of David established for ever) — folded under
--          the requited-blood / established-throne frame; oath-breaking judgment, none threaded alone
--   v.26-27 (unto Abiathar the priest... Get thee to Anathoth... that he might fulfil the word of
--          Yahuah which he spake concerning the house of Eli in Shiloh) — the Eli-house word fulfilled
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: 1 Samuel 2:31-35 (I will cut off thine arm... I will raise me up a faithful
--                 priest... build him a sure house) — Eli-house-word-fulfilled thread
--   v.12, 45-46 (Solomon upon the throne of David, his kingdom established greatly... and the
--          kingdom was established in the hand of Solomon; the throne of David established for ever)
--         NT:     none warranted
--         Extras: none warranted
--         Tanakh: 2 Samuel 7:13,16 (I will stablish the throne of his kingdom for ever; thy throne
--                 shall be established for ever); Psalm 89:36-37 (his seed shall endure for ever,
--                 and his throne as the sun) — established-throne thread
--
-- THREADS (5):
--   1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses   [canon: Deuteronomy, Joshua, Psalms]
--   1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne    [canon: 2 Samuel, Psalms]
--   1-kings-2-his-blood-shall-return-upon-his-own-head                   [canon: 2 Samuel]
--   1-kings-2-that-he-might-fulfil-the-word-concerning-the-house-of-eli  [canon: 1 Samuel]
--   1-kings-2-the-kingdom-established-in-the-hand-of-solomon             [canon: 2 Samuel, Psalms]
--
-- FRAMING NOTES:
--   * 2:2-4 is the keystone: David charges Solomon to KEEP the Torah — *keep the charge of Yahuah
--     Elohayka... to keep his statutes, and his commandments, and his judgments, and his
--     testimonies, as it is written in the law of Moses, that thou mayest prosper* (2:3). The
--     Torah is the CHARTER of the throne and the WAY TO PROSPER, never the curse. This is the
--     king-law of Deuteronomy 17:18-20 (the king writes a copy of the Torah and reads it all his
--     days) applied to the son, and Joshua 1:7-8 (meditate in it day and night, that thou mayest
--     prosper) — the throne's continuance is conditioned on Torah-keeping, never on lineage alone.
--   * 2:4 *That Yahuah may continue his word... there shall not fail thee a man on the throne*:
--     the conditional outworking of the Davidic covenant (2 Samuel 7; Psalm 89:30-37). The
--     covenant is sworn and sure, yet the line's walking in it is conditioned — *If his children
--     forsake my law... then will I visit their transgression with the rod* (Psalm 89:30-32),
--     *Nevertheless my lovingkindness will I not utterly take from him* (89:33). Both held together.
--   * 2:32-33 *Yahuah shall return his blood upon his own head*: justice requiting blood Joab shed
--     in peace (Abner, 2 Samuel 3; Amasa, 2 Samuel 20) — taking innocent blood off David's house
--     so the throne may have *peace for ever from Yahuah* (2:33). Victims, not enemies: the two
--     captains were *more righteous and better than he* (2:32); this is covenant-justice, not vendetta.
--   * 2:26-27 Abiathar thrust out *that he might fulfil the word of Yahuah... concerning the house
--     of Eli in Shiloh*: the 1 Samuel 2:31-35 oracle (cut off the arm; raise up a faithful priest;
--     build a sure house) reaches its end — Zadok stands, Eli's line falls. Judgment on
--     covenant-breaking priests, never the Torah's priesthood-pattern undone.

CREATE TEMP VIEW _s342_1ki02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: keep the charge of Yahuah, as written in the law of Moses — the Torah-keeping king
    ('canon','1-kings',2,3,'canon','deuteronomy',17,18,
     E'*And it shall be, when he sitteth upon the throne of his kingdom, that he shall write him a copy of this law in a book out of that which is before the priests the Levites* (Deuteronomy 17:18). David''s charge — *keep the charge of Yahuah Elohayka (the LORD thy God)... to keep his statutes, and his commandments, and his judgments, and his testimonies, as it is written in the law of Moses* (1 Kings 2:3) — is the king-law of Torah applied to Solomon: the throne sits over a copied, kept Torah, never above it.','free'),
    ('canon','1-kings',2,3,'canon','deuteronomy',17,19,
     E'*And it shall be with him, and he shall read therein all the days of his life: that he may learn to fear Yahuah Elohav (the LORD his God), to keep all the words of this law and these statutes, to do them* (Deuteronomy 17:19). The king reads and keeps the Torah all his days — exactly the charge David lays on Solomon, *to walk in his ways, to keep his statutes... as it is written in the law of Moses* (1 Kings 2:3).','free'),
    ('canon','1-kings',2,4,'canon','deuteronomy',17,20,
     E'*That his heart be not lifted up above his brethren, and that he turn not aside from the commandment, to the right hand, or to the left: to the end that he may prolong his days in his kingdom, he, and his children, in the midst of Yashar''el (Israel)* (Deuteronomy 17:20). The Torah-keeping king prolongs his days AND his children''s — the very promise David carries to Solomon: *there shall not fail thee... a man on the throne of Yashar''el (Israel)* (1 Kings 2:4).','free'),
    ('canon','1-kings',2,2,'canon','joshua',1,7,
     E'*Only be thou strong and very courageous, that thou mayest observe to do according to all the law, which Moses my servant commanded thee: turn not from it to the right hand or to the left, that thou mayest prosper whithersoever thou goest* (Joshua 1:7). David''s *be thou strong therefore, and shew thyself a man* (1 Kings 2:2) is Yahuah''s word to Joshua at the entrance to the land — strength is for Torah-obedience, and Torah-obedience is the way to prosper.','free'),
    ('canon','1-kings',2,3,'canon','joshua',1,8,
     E'*This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein: for then thou shalt make thy way prosperous, and then thou shalt have good success* (Joshua 1:8). David''s *that thou mayest prosper in all that thou doest* (1 Kings 2:3) names the same condition Joshua heard — prosperity flows from keeping the Torah, never from setting it aside.','free'),
    ('canon','1-kings',2,4,'canon','psalms',89,30,
     E'*If his children forsake my law, and walk not in my judgments; If they break my statutes, and keep not my commandments; Then will I visit their transgression with the rod* (Psalm 89:30-32). The throne''s continuance hangs on the children''s walking — David''s *If thy children take heed to their way, to walk before me in truth... there shall not fail thee... a man on the throne* (1 Kings 2:4) is the same conditional the psalm sets out, the Torah the standard, never the curse.','free'),
    -- THREAD 2: that Yahuah may continue his word concerning the throne — the Davidic covenant
    ('canon','1-kings',2,4,'canon','2-samuel',7,12,
     E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). David''s *That Yahuah (LORD) may continue his word which he spake concerning me* (1 Kings 2:4) looks straight back to this — the seed set up, the kingdom established; Solomon is the nearer fulfilment of the promised seed.','free'),
    ('canon','1-kings',2,4,'canon','2-samuel',7,13,
     E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The word David charges Solomon to see continued (1 Kings 2:4) is this oath — the son builds the house and the throne is stablished for ever, the everlasting Davidic covenant that opens toward the Formed Son who has a Father.','free'),
    ('canon','1-kings',2,4,'canon','2-samuel',7,14,
     E'*I will be his father, and he shall be my son. If he commit iniquity, I will chasten him with the rod of men, and with the stripes of the children of men* (2 Samuel 7:14). The covenant David relies on (1 Kings 2:4) holds both grace and discipline together — *I will be his father, and he shall be my son* — the Father and the Formed Son pattern, sure yet chastening sin, never co-equal-persons.','free'),
    ('canon','1-kings',2,4,'canon','psalms',89,3,
     E'*I have made a covenant with my chosen, I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:3-4). David''s confidence that Yahuah will *continue his word* (1 Kings 2:4) rests on this sworn covenant — the seed and the throne established to all generations, the oath that cannot be broken.','free'),
    -- THREAD 3: his blood shall return upon his own head — requiting unavenged blood
    ('canon','1-kings',2,5,'canon','2-samuel',3,27,
     E'*And when Abner was returned to Hebron, Joab took him aside in the gate to speak with him quietly, and smote him there under the fifth rib, that he died, for the blood of Asahel his brother* (2 Samuel 3:27). David''s charge names this very deed — *what he did to the two captains of the hosts of Yashar''el (Israel), unto Abner the son of Ner... and shed the blood of war in peace* (1 Kings 2:5) — Joab''s peace-time murder, now to be requited.','free'),
    ('canon','1-kings',2,5,'canon','2-samuel',3,29,
     E'*Let it rest on the head of Joab, and on all his father''s house; and let there not fail from the house of Joab one that hath an issue, or that is a leper* (2 Samuel 3:29). David swore the blood upon Joab''s head the day Abner fell; now at his death he hands the unfinished justice to Solomon — *Do therefore according to thy wisdom, and let not his hoar head go down to the grave in peace* (1 Kings 2:5-6).','free'),
    ('canon','1-kings',2,32,'canon','2-samuel',20,10,
     E'*But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground... and he died* (2 Samuel 20:10). Solomon names this second peace-time murder — *Amasa the son of Jether, captain of the host of Yahudah (Judah)* (1 Kings 2:32) — as Yahuah returns Joab''s blood *upon his own head, who fell upon two men more righteous and better than he* (1 Kings 2:32); the victims were the righteous, the requiting is covenant-justice.','free'),
    -- THREAD 4: that he might fulfil the word concerning the house of Eli — Abiathar thrust out
    ('canon','1-kings',2,27,'canon','1-samuel',2,31,
     E'*Behold, the days come, that I will cut off thine arm, and the arm of thy father''s house, that there shall not be an old man in thine house* (1 Samuel 2:31). Solomon thrusting out Abiathar from the priesthood (1 Kings 2:27) is the day this word lands — *that he might fulfil the word of Yahuah (LORD), which he spake concerning the house of Eli in Shiloh*; the priestly line of Eli is cut off as the man of Elohim foretold.','free'),
    ('canon','1-kings',2,27,'canon','1-samuel',2,32,
     E'*And thou shalt see an enemy in my habitation, in all the wealth which Elohim (God) shall give Yashar''el (Israel): and there shall not be an old man in thine house for ever* (1 Samuel 2:32). The judgment on Eli''s house, long spoken, reaches Abiathar — *Get thee to Anathoth, unto thine own fields; for thou art worthy of death* (1 Kings 2:26); the word concerning the house of Eli is fulfilled in his banishment.','free'),
    ('canon','1-kings',2,27,'canon','1-samuel',2,35,
     E'*And I will raise me up a faithful priest, that shall do according to that which is in mine heart and in my mind: and I will build him a sure house; and he shall walk before mine anointed for ever* (1 Samuel 2:35). As Abiathar falls, Zadok stands — *Zadok the priest did the king put in the room of Abiathar* (1 Kings 2:35) — the faithful priest of the sure house, fulfilling the oracle against Eli. Judgment on covenant-breaking, never the Torah''s priesthood undone.','free'),
    -- THREAD 5: the kingdom established in the hand of Solomon — the throne of David for ever
    ('canon','1-kings',2,12,'canon','2-samuel',7,13,
     E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). *Then sat Solomon upon the throne of David his father; and his kingdom was established greatly* (1 Kings 2:12) — the promised son sits, and the throne Yahuah swore to stablish for ever begins to stand in him.','free'),
    ('canon','1-kings',2,45,'canon','2-samuel',7,16,
     E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). Solomon''s word — *king Solomon shall be blessed, and the throne of David shall be established before Yahuah (LORD) for ever* (1 Kings 2:45) — is the Davidic oath confessed back; the throne established before Yahuah is the everlasting kingdom of the promised seed.','free'),
    ('canon','1-kings',2,46,'canon','psalms',89,36,
     E'*His seed shall endure for ever, and his throne as the sun before me. It shall be established for ever as the moon, and as a faithful witness in heaven* (Psalm 89:36-37). *And the kingdom was established in the hand of Solomon* (1 Kings 2:46) is the first standing of the throne the psalm sings sure as sun and moon — the Davidic seed and throne enduring for ever toward the everlasting King.','free')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,note,tier)
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses',
       E'Keep the charge of Yahuah — as it is written in the law of Moses',
       E'David''s dying charge makes the Torah the charter of the throne: *be thou strong therefore, and shew thyself a man; And keep the charge of Yahuah Elohayka (the LORD thy God), to walk in his ways, to keep his statutes, and his commandments, and his judgments, and his testimonies, as it is written in the law of Moses, that thou mayest prosper in all that thou doest* (1 Kings 2:2-3). This is the king-law of Torah laid on the son: *when he sitteth upon the throne of his kingdom... he shall write him a copy of this law in a book... and he shall read therein all the days of his life... to keep all the words of this law* (Deuteronomy 17:18-19), *that he may prolong his days in his kingdom, he, and his children* (Deuteronomy 17:20). It is the same word Yahuah gave Joshua at the river: *be thou strong and very courageous, that thou mayest observe to do according to all the law... that thou mayest prosper whithersoever thou goest* (Joshua 1:7), *thou shalt meditate therein day and night... for then thou shalt make thy way prosperous* (Joshua 1:8). And the throne''s continuance hangs on that walking: *If his children forsake my law, and walk not in my judgments... then will I visit their transgression with the rod* (Psalm 89:30-32). The Torah is the way to prosper and the standard of the throne — never the curse.',
       sv.verse_id, ev.verse_id, 'free', 37925
  FROM _s342_1ki02_lookup sv, _s342_1ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne',
       E'That Yahuah may continue his word concerning the throne',
       E'David rests the whole charge on the Davidic covenant: *That Yahuah (LORD) may continue his word which he spake concerning me, saying, If thy children take heed to their way, to walk before me in truth with all their heart and with all their soul, there shall not fail thee (said he) a man on the throne of Yashar''el (Israel)* (1 Kings 2:4). The word he leans on is the oath of 2 Samuel 7: *I will set up thy seed after thee... and I will establish his kingdom. He shall build an house for my name, and I will stablish the throne of his kingdom for ever. I will be his father, and he shall be my son* (2 Samuel 7:12-14) — sure, yet holding discipline for sin within it. And it is the sworn covenant the psalmist sings: *I have sworn unto David my servant, Thy seed will I establish for ever, and build up thy throne to all generations* (Psalm 89:3-4). The covenant is unbreakable; the line''s walking in truth is the condition through which the word is continued — both held together, the Torah the way, the oath the ground.',
       sv.verse_id, ev.verse_id, 'free', 37928
  FROM _s342_1ki02_lookup sv, _s342_1ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-2-his-blood-shall-return-upon-his-own-head',
       E'His blood shall return upon his own head — the innocent blood requited',
       E'David charges Solomon with the unfinished justice for blood Joab shed in peace: *thou knowest also what Joab the son of Zeruiah did... unto Abner the son of Ner, and unto Amasa the son of Jether, whom he slew, and shed the blood of war in peace* (1 Kings 2:5). The first murder was Abner: *Joab took him aside in the gate to speak with him quietly, and smote him there under the fifth rib, that he died* (2 Samuel 3:27), and David had already laid the blood — *Let it rest on the head of Joab, and on all his father''s house* (2 Samuel 3:29). The second was Amasa: *he smote him therewith in the fifth rib, and shed out his bowels to the ground... and he died* (2 Samuel 20:10). So Solomon executes the long-deferred sentence: *Yahuah (LORD) shall return his blood upon his own head, who fell upon two men more righteous and better than he* (1 Kings 2:32), *that thou mayest take away the innocent blood, which Joab shed, from me, and from the house of my father* (1 Kings 2:31). The captains were the righteous; the requiting clears David''s house so the throne may have *peace for ever from Yahuah (LORD)* (1 Kings 2:33) — covenant-justice, not vendetta.',
       sv.verse_id, ev.verse_id, 'free', 37931
  FROM _s342_1ki02_lookup sv, _s342_1ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=2 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-2-that-he-might-fulfil-the-word-concerning-the-house-of-eli',
       E'That he might fulfil the word concerning the house of Eli',
       E'When Solomon thrusts Abiathar out of the priesthood, the narrator names what is happening: *So Solomon thrust out Abiathar from being priest unto Yahuah (LORD); that he might fulfil the word of Yahuah (LORD), which he spake concerning the house of Eli in Shiloh* (1 Kings 2:27). That word was spoken generations before by the man of Elohim: *Behold, the days come, that I will cut off thine arm, and the arm of thy father''s house, that there shall not be an old man in thine house* (1 Samuel 2:31), *And thou shalt see an enemy in my habitation... and there shall not be an old man in thine house for ever* (1 Samuel 2:32). And in its place the faithful priest is set: *I will raise me up a faithful priest, that shall do according to that which is in mine heart and in my mind: and I will build him a sure house; and he shall walk before mine anointed for ever* (1 Samuel 2:35) — fulfilled as *Zadok the priest did the king put in the room of Abiathar* (1 Kings 2:35). The fall of Eli''s line is judgment on covenant-breaking priests, never the Torah''s priesthood-pattern undone.',
       sv.verse_id, ev.verse_id, 'free', 37934
  FROM _s342_1ki02_lookup sv, _s342_1ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=2 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-2-the-kingdom-established-in-the-hand-of-solomon',
       E'The kingdom established in the hand of Solomon — the throne of David for ever',
       E'The chapter opens and closes on the throne''s establishing: *Then sat Solomon upon the throne of David his father; and his kingdom was established greatly* (1 Kings 2:12), and after the justice is done, *the throne of David shall be established before Yahuah (LORD) for ever* (1 Kings 2:45), *And the kingdom was established in the hand of Solomon* (1 Kings 2:46). This is the Davidic oath beginning to stand: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13), *thy throne shall be established for ever* (2 Samuel 7:16). And it is the throne the psalmist sees enduring past the son to the everlasting King: *His seed shall endure for ever, and his throne as the sun before me. It shall be established for ever as the moon, and as a faithful witness in heaven* (Psalm 89:36-37). Solomon''s established kingdom is the first standing of the throne sworn to David — the seed and the throne enduring toward the One who reigns for ever.',
       sv.verse_id, ev.verse_id, 'free', 37937
  FROM _s342_1ki02_lookup sv, _s342_1ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=2 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====
-- THREAD 1: keep the charge of Yahuah as written in the law of Moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 17:18 — *he shall write him a copy of this law in a book*: the king-law of Torah laid on the throne, the charge David gives Solomon (2:3).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 17:19 — *he shall read therein all the days of his life... to keep all the words of this law*: the king reads and keeps the Torah, exactly David''s charge (2:3).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 17:20 — *that he may prolong his days in his kingdom, he, and his children*: the Torah-king''s line endures, the promise behind 2:4.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Joshua 1:7 — *be thou strong and very courageous, that thou mayest observe to do according to all the law*: David''s *shew thyself a man* (2:2) is the word to Joshua, strength for Torah-obedience.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Joshua 1:8 — *meditate therein day and night... for then thou shalt make thy way prosperous*: David''s *that thou mayest prosper* (2:3) names the same Torah-condition.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 89:30 — *If his children forsake my law... then will I visit their transgression with the rod*: the throne''s continuance conditioned on Torah-walking, as in 2:4.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-keep-the-charge-of-yahuah-as-written-in-the-law-of-moses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: that Yahuah may continue his word concerning the throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 7:12 — *I will set up thy seed after thee... and I will establish his kingdom*: the word David charges Solomon to see continued (2:4).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 7:13 — *I will stablish the throne of his kingdom for ever*: the everlasting Davidic oath behind 2:4.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 7:14 — *I will be his father, and he shall be my son*: the covenant holds grace and discipline; the Father and Formed Son pattern.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 89:3 — *I have sworn unto David my servant, Thy seed will I establish for ever*: the sworn covenant David''s confidence rests on (2:4).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-yahuah-may-continue-his-word-concerning-the-throne'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: his blood shall return upon his own head
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 3:27 — *Joab... smote him there under the fifth rib, that he died*: Abner''s peace-time murder, named in David''s charge (2:5).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=3 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-his-blood-shall-return-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 3:29 — *Let it rest on the head of Joab, and on all his father''s house*: David laid the blood the day Abner fell; now handed to Solomon (2:5-6).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=3 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-his-blood-shall-return-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Samuel 20:10 — *he smote him therewith in the fifth rib... and he died*: Amasa''s murder; Solomon returns Joab''s blood on his own head, the victims more righteous (2:32).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=32
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-his-blood-shall-return-upon-his-own-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: that he might fulfil the word concerning the house of Eli
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Samuel 2:31 — *I will cut off thine arm, and the arm of thy father''s house*: the oracle against Eli, landing as Abiathar is thrust out (2:27).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=27
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-he-might-fulfil-the-word-concerning-the-house-of-eli'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Samuel 2:32 — *there shall not be an old man in thine house for ever*: the long judgment on Eli''s line reaching Abiathar (2:26-27).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=27
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-he-might-fulfil-the-word-concerning-the-house-of-eli'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Samuel 2:35 — *I will raise me up a faithful priest... build him a sure house*: Zadok set in Abiathar''s room (2:35), the faithful priest fulfilling the oracle.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=27
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-that-he-might-fulfil-the-word-concerning-the-house-of-eli'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the kingdom established in the hand of Solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 7:13 — *I will stablish the throne of his kingdom for ever*: Solomon sits and his kingdom is established greatly (2:12).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-the-kingdom-established-in-the-hand-of-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 7:16 — *thy throne shall be established for ever*: Solomon confesses the oath back — the throne established before Yahuah for ever (2:45).'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=45
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-the-kingdom-established-in-the-hand-of-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 89:36 — *His seed shall endure for ever, and his throne as the sun before me*: the throne established in Solomon''s hand (2:46) endures toward the everlasting King.'
  FROM cross_reference_threads t
  JOIN _s342_1ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=2 AND sv.verse_number=46
  JOIN _s342_1ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-2-the-kingdom-established-in-the-hand-of-solomon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_3.sql (1 Kings 3) -----
-- 1 Kings 3 — Solomon at Gibeon: Ask what I shall give thee; the prayer for an
--   understanding heart; wisdom the gift of Yahuah to those who ask; discerning judgment
--   the mark of Elohim's wisdom in the king (the righteous-judge Messianic-king foreshadow).
-- TAG: 1ki03   VIEW: _s342_1ki03_lookup   SORT BAND: 37950 step 3 (37950..37962)
--
-- 1 Kings 3 coverage:
--   v.5-9  (Ask what I shall give thee / an understanding heart over self-interest)
--          NT:     Matthew 6:33 (seek first the kingdom), James 1:5 (ask of Elohim for wisdom)
--          Extras: none warranted here (carried at v.11-13 by Wisdom of Solomon)
--          Tanakh: 2 Chronicles 1:7-10 (the parallel Gibeon account)
--   v.11-13 (pleased; given what he asked AND riches/honour he did not ask — added)
--          NT:     Matthew 6:33 (all these things shall be added)
--          Extras: Wisdom of Solomon 7:7-11 (I prayed and wisdom came; preferred her before riches; all good things came with her)
--          Tanakh: Proverbs 3:13-16 (length of days, riches and honour in wisdom's hands)
--   v.6,3:9 (wisdom the gift of Yahuah to him that asks / cries after it)
--          NT:     James 1:5 (ask of Elohim that giveth liberally), Colossians 2:3 (all treasures of wisdom hid in Messiah)
--          Extras: none warranted (Wisdom carried above)
--          Tanakh: Proverbs 2:3-6 (cry after knowledge... Yahuah giveth wisdom)
--   v.16-28 (the two harlots; discerning judgment; the wisdom of Elohim in him to do judgment)
--          NT:     none warranted (the Messianic judge is carried by the Tanakh witnesses)
--          Extras: none warranted
--          Tanakh: Psalm 72:1-2,4 (give the king thy judgments), Isaiah 11:2-4 (the Branch, righteous judge)
--   v.1-4,10,14,15  framing/narrative — none warranted (v.14 conditional walk woven into prose)
--
-- THREADS:
--   1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart   [free]
--        tgt libs: canon (2-chronicles, matthew, james)
--   1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked   [extras]
--        tgt libs: canon (matthew, proverbs) + apocrypha (the-wisdom-of-solomon)
--   1-kings-3-for-yahuah-giveth-wisdom-to-him-that-asketh   [free]
--        tgt libs: canon (proverbs, james, colossians)
--   1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment   [free]
--        tgt libs: canon (psalms, isaiah)

CREATE TEMP VIEW _s342_1ki03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: Ask what I shall give thee — an understanding heart over self-interest
    ('canon','1-kings',3,5,'canon','2-chronicles',1,7,'free',E'*In that night did Elohim (God) appear unto Solomon, and said unto him, Ask what I shall give thee* (2 Chronicles 1:7). The Chronicler records the same Gibeon night the Kings account opens — *In Gibeon Yahuah (LORD) appeared to Solomon in a dream by night... Ask what I shall give thee* (1 Kings 3:5). The Formed Son, the One who appeared and spoke, lays the open door before the new king.'),
    ('canon','1-kings',3,9,'canon','2-chronicles',1,10,'free',E'*Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* (2 Chronicles 1:10). Both witnesses set Solomon''s single petition side by side with his confessed insufficiency — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* (1 Kings 3:9). He asks not for himself but for the people Yahuah has chosen.'),
    ('canon','1-kings',3,9,'canon','matthew',6,33,'free',E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). Solomon enacts the kingdom-pattern before it is spoken: offered anything, he seeks first the wisdom to judge Yahuah''s people — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad* (1 Kings 3:9) — not long life, not riches, not the life of his enemies.'),
    ('canon','1-kings',3,9,'canon','james',1,5,'free',E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). Solomon is the man who lacked wisdom and asked — *Give therefore thy servant an understanding heart to judge thy people* (1 Kings 3:9) — and the giving Elohim answered, the standing promise James hands every reader.'),
    -- Thread 2: I have also given thee that which thou hast not asked — riches and honour added
    ('canon','1-kings',3,13,'canon','matthew',6,33,'free',E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). Because Solomon sought first the understanding heart, Yahuah adds the rest unbidden — *And I have also given thee that which thou hast not asked, both riches, and honour* (1 Kings 3:13). The kingdom sought; *all these things* added.'),
    ('canon','1-kings',3,13,'canon','proverbs',3,16,'free',E'*Length of days is in her right hand; and in her left hand riches and honour* (Proverbs 3:16). Wisdom''s own hands carry the very gifts Solomon did not ask for — *And I have also given thee that which thou hast not asked, both riches, and honour* (1 Kings 3:13) — and *Happy is the man that findeth wisdom* (Proverbs 3:13). The man who took her right hand received her left as well.'),
    ('canon','1-kings',3,11,'apocrypha','the-wisdom-of-solomon',7,8,'extras',E'*I preferred her before sceptres and thrones, and esteemed riches nothing in comparison of her* (Wisdom of Solomon 7:8). Solomon''s own first-person account confesses the choice Yahuah commends — *thou hast not asked for thyself long life; neither hast asked riches for thyself, nor hast asked the life of thine enemies; but hast asked for thyself understanding to discern judgment* (1 Kings 3:11).'),
    ('canon','1-kings',3,13,'apocrypha','the-wisdom-of-solomon',7,11,'extras',E'*All good things together came to me with her, and innumerable riches in her hands* (Wisdom of Solomon 7:11). The added riches follow the wisdom, never the other way — *And I have also given thee that which thou hast not asked, both riches, and honour* (1 Kings 3:13). Seek her first, and all good things come trailing after.'),
    -- Thread 3: For Yahuah giveth wisdom to him that asketh
    ('canon','1-kings',3,9,'canon','proverbs',2,6,'free',E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — to *if thou criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3). Solomon cried after it and the giving Yahuah answered — *Give therefore thy servant an understanding heart... that I may discern between good and bad* (1 Kings 3:9).'),
    ('canon','1-kings',3,12,'canon','james',1,5,'free',E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The wisdom Solomon received was no native genius but a gift granted to the asking — *lo, I have given thee a wise and an understanding heart* (1 Kings 3:12). What was given liberally to him is promised to every one that asks.'),
    ('canon','1-kings',3,12,'canon','colossians',2,3,'free',E'*In whom are hid all the treasures of wisdom and knowledge* (Colossians 2:3). The wise and understanding heart given to Solomon — *lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee* (1 Kings 3:12) — points past the type to the One in whom all the treasures of wisdom are hid, a greater than Solomon.'),
    -- Thread 4: The wisdom of Elohim in him to do judgment — the righteous-judge king
    ('canon','1-kings',3,28,'canon','psalms',72,1,'free',E'*Give the king thy judgments, O Elohim (God), and thy righteousness unto the king''s son. He shall judge thy people with righteousness, and thy poor with judgment* (Psalm 72:1-2). The prayer of Solomon for the king sings the same gift Yashar''el now witnesses in him — *they saw that the wisdom of Elohim (God) was in him, to do judgment* (1 Kings 3:28).'),
    ('canon','1-kings',3,28,'canon','psalms',72,4,'free',E'*He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:4). The king''s wisdom is proven by saving the living child for its true mother — *they saw that the wisdom of Elohim (God) was in him, to do judgment* (1 Kings 3:28) — the very righteous judgment of the needy the Psalm of Solomon foretells.'),
    ('canon','1-kings',3,28,'canon','isaiah',11,3,'free',E'*And shall make him of quick understanding in the fear of Yahuah (LORD): and he shall not judge after the sight of his eyes, neither reprove after the hearing of his ears* (Isaiah 11:3). Solomon judges past the eye and ear, past the two women''s contradicting words, to the mother''s yearning heart — *they saw that the wisdom of Elohim (God) was in him, to do judgment* (1 Kings 3:28) — a shadow of the Branch on whom *the spirit of wisdom and understanding* rests (Isaiah 11:2).'),
    ('canon','1-kings',3,28,'canon','isaiah',11,4,'free',E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* (Isaiah 11:4). The discerning judgment that spared the living child and exposed the false claim — *they saw that the wisdom of Elohim (God) was in him, to do judgment* (1 Kings 3:28) — foreshadows the righteous-judge King, the Formed Son of David greater than Solomon, who judges the poor in righteousness.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart',
       E'Ask what I shall give thee — an understanding heart over self-interest',
       E'At Gibeon the Formed Son, the One who appeared and spoke through the whole Tanakh, lays an open door before the new king: *In Gibeon Yahuah (LORD) appeared to Solomon in a dream by night: and Elohim (God) said, Ask what I shall give thee* (1 Kings 3:5) — the Chronicler recording the same night, *In that night did Elohim (God) appear unto Solomon, and said unto him, Ask what I shall give thee* (2 Chronicles 1:7). This is a divine appearing, the Formed Son with the Father who sends him — not a co-equal trinity, not a created angel, but Yahuah made manifest to a man.\n\nOffered anything, Solomon asks one thing, and not for himself: *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* (1 Kings 3:9), matched word for word in *Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* (2 Chronicles 1:10). Not long life, not riches, not the life of his enemies — the wisdom to judge Yahuah''s chosen people rightly.\n\nLong before the Sermon on the Mount frames it, Solomon enacts the kingdom-pattern: *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). And he is the very man James points to — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). He lacked, he asked, and the giving Elohim answered.',
       sv.verse_id, ev.verse_id, 'free', 37950
  FROM _s342_1ki03_lookup sv, _s342_1ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked',
       E'I have also given thee that which thou hast not asked — riches and honour added',
       E'Yahuah is pleased with the petition precisely because of what it left out: *Because thou hast asked this thing, and hast not asked for thyself long life; neither hast asked riches for thyself, nor hast asked the life of thine enemies; but hast asked for thyself understanding to discern judgment* (1 Kings 3:11). Then comes the kingdom-pattern''s second half — having sought first the wisdom, Solomon receives the rest unbidden: *And I have also given thee that which thou hast not asked, both riches, and honour: so that there shall not be any among the kings like unto thee all thy days* (1 Kings 3:13). This is *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33) acted out in a single night.\n\nSolomon''s own confession in the restored library tells the same order from the inside: *I preferred her before sceptres and thrones, and esteemed riches nothing in comparison of her* (Wisdom of Solomon 7:8), and then *All good things together came to me with her, and innumerable riches in her hands* (Wisdom of Solomon 7:11). The riches follow the wisdom; they are her left hand, never the thing sought.\n\nProverbs names it outright: *Happy is the man that findeth wisdom* (Proverbs 3:13), for *Length of days is in her right hand; and in her left hand riches and honour* (Proverbs 3:16). The man who reached for wisdom''s right hand found her left hand full of exactly what he had refused to ask for.',
       sv.verse_id, ev.verse_id, 'extras', 37953
  FROM _s342_1ki03_lookup sv, _s342_1ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-3-for-yahuah-giveth-wisdom-to-him-that-asketh',
       E'For Yahuah giveth wisdom — the gift to him that asketh',
       E'The wise and understanding heart Solomon carried was no native genius but a gift granted to the asking: *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee* (1 Kings 3:12). Wisdom is given, not earned — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6), the promised answer to the one who *criest after knowledge, and liftest up thy voice for understanding* (Proverbs 2:3). Solomon cried after it, and Yahuah gave it from his own mouth.\n\nThe standing apostolic promise repeats the rule for every reader: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). What Yahuah did for Solomon he holds open to all who ask in faith.\n\nAnd the type strains toward the One it foreshadows. There was *none like* Solomon in his wisdom (1 Kings 3:12), yet a greater than Solomon stands in whom *are hid all the treasures of wisdom and knowledge* (Colossians 2:3) — the Formed Son, the very Wisdom of Yahuah, of whom Solomon''s gift was only a shadow.',
       sv.verse_id, ev.verse_id, 'free', 37956
  FROM _s342_1ki03_lookup sv, _s342_1ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment',
       E'The wisdom of Elohim in him to do judgment — the righteous-judge king',
       E'The granted wisdom is put to the test in the two harlots and the living child. Past the two women''s flatly contradicting words, past the sight of the eye and the hearing of the ear, Solomon discerns the true mother by her compassion — *Then the king answered and said, Give her the living child, and in no wise slay it: she is the mother thereof* (1 Kings 3:27) — and *all Yashar''el (Israel) heard of the judgment which the king had judged; and they feared the king: for they saw that the wisdom of Elohim (God) was in him, to do judgment* (1 Kings 3:28).\n\nThe prayer of Solomon for the king sings the very gift Yashar''el now beholds: *Give the king thy judgments, O Elohim (God), and thy righteousness unto the king''s son. He shall judge thy people with righteousness, and thy poor with judgment* (Psalm 72:1-2), and *He shall judge the poor of the people, he shall save the children of the needy, and shall break in pieces the oppressor* (Psalm 72:4) — the saving of the helpless child written into the royal psalm.\n\nAnd the discerning judge is a shadow of the Branch to come, on whom the same Spirit rests: *And shall make him of quick understanding in the fear of Yahuah (LORD): and he shall not judge after the sight of his eyes, neither reprove after the hearing of his ears* (Isaiah 11:3); *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* (Isaiah 11:4). Solomon judging past eye and ear foreshadows the Formed Son of David, the righteous Judge greater than Solomon.',
       sv.verse_id, ev.verse_id, 'free', 37959
  FROM _s342_1ki03_lookup sv, _s342_1ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 1:7 — the parallel Gibeon night: *Ask what I shall give thee.*'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 1:10 — the same single petition: *Give me now wisdom and knowledge... who can judge this thy people?*'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 6:33 — *seek ye first the kingdom of Elohim... and all these things shall be added*: the pattern Solomon enacts.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'James 1:5 — *if any of you lack wisdom, let him ask of Elohim*: Solomon is the man who asked and received.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-ask-what-i-shall-give-thee-an-understanding-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 6:33 — *all these things shall be added*: riches and honour added because the kingdom was sought first.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Wisdom of Solomon 7:8 — *I preferred her before sceptres and thrones, and esteemed riches nothing*: Solomon''s own confession of the choice.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Wisdom of Solomon 7:11 — *All good things together came to me with her*: the riches follow the wisdom.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Proverbs 3:16 — *in her left hand riches and honour*: wisdom''s left hand holds what Solomon refused to ask for.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-i-have-also-given-thee-that-which-thou-hast-not-asked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Proverbs 2:6 — *For Yahuah giveth wisdom: out of his mouth cometh knowledge*: the gift to the one who cries after it.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-for-yahuah-giveth-wisdom-to-him-that-asketh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'James 1:5 — *let him ask of Elohim, that giveth to all men liberally*: the wisdom was given, not earned.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-for-yahuah-giveth-wisdom-to-him-that-asketh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Colossians 2:3 — *in whom are hid all the treasures of wisdom*: the greater than Solomon the type strains toward.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-for-yahuah-giveth-wisdom-to-him-that-asketh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 72:1 — *Give the king thy judgments, O Elohim... He shall judge thy people with righteousness*: the royal prayer sings the gift Yashar''el beholds.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 72:4 — *he shall save the children of the needy*: the saving of the helpless child written into the psalm.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 11:3 — *he shall not judge after the sight of his eyes*: Solomon judges past the contradicting words, a shadow of the Branch.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 11:4 — *with righteousness shall he judge the poor*: the righteous-judge King, the Formed Son of David greater than Solomon.'
  FROM cross_reference_threads t
  JOIN _s342_1ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s342_1ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-3-the-wisdom-of-elohim-in-him-to-do-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_4.sql (1 Kings 4) -----
-- 1 Kings 4 — Solomon's officers and the prosperity of his reign; the golden age of the
--   undivided kingdom: the two houses TOGETHER, the Abrahamic seed-as-sand fulfilled, the
--   vine-and-fig-tree rest, the dominion that draws presents and kings, the wisdom that draws
--   the nations to a foreshadow of the greater Son of David.
-- TAG: 1ki04   VIEW: _s342_1ki04_lookup   SORT BAND: base 37975 step 3 (37975, 37978, 37981, 37984)
--
-- 1 Kings 4 coverage:
--   v.1-19 Solomon's princes/twelve officers/provision-by-month over all Yashar'el:
--        NT: none warranted   Extras: none warranted   Tanakh: none warranted (administrative roster)
--   v.20  Yahudah and Yashar'el many as the sand of the sea, eating, drinking, making merry — both houses TOGETHER:
--        NT: none warranted (kept the Abrahamic-seed weave in the Tanakh layer)
--        Extras: none warranted   Tanakh: Gen 22:17 (seed as sand of the sea shore), Gen 15:5 (seed as the stars), Gen 13:16 (seed as the dust of the earth)  -> THREAD 1
--   v.21  Solomon reigned over all kingdoms from the river... they brought presents:
--        NT: none warranted   Extras: none warranted   Tanakh: Ps 72:8 (dominion from the river), Ps 72:10 (kings bring presents)  -> THREAD 3
--   v.22-23 Solomon's daily provision: none warranted (detail of v.20-21 abundance)
--   v.24  dominion over all kings on this side the river; peace on all sides:
--        NT: none warranted   Extras: none warranted   Tanakh: Ps 72:8 (dominion from sea to sea), Ps 72:11 (all kings serve him)  -> THREAD 3
--   v.25  Yahudah and Yashar'el dwelt safely, every man under his vine and under his fig tree, all the days of Solomon:
--        NT: none warranted (the messianic-rest weave kept in the Tanakh prophets)
--        Extras: none warranted   Tanakh: Micah 4:4 (sit every man under his vine and fig tree, none afraid), Zech 3:10 (call every man his neighbour under the vine and fig tree)  -> THREAD 2
--   v.26-28 horses, chariots, victual, they lacked nothing: none warranted (abundance detail)
--   v.29  Elohim gave Solomon wisdom and largeness of heart, even as the sand on the sea shore:
--        NT: Matt 12:42 (a greater than Solomon is here)  -> THREAD 4
--        Extras: none warranted   Tanakh: (granted in 1Ki 3 — not re-threaded here; the sand-as-heart echo of v.20 kept lateral)
--   v.30-31 wisdom excelled all the east and Egypt, wiser than all men, fame in all nations: -> THREAD 4 (Matt 12:42)
--   v.32-33 three thousand proverbs, a thousand and five songs, spake of trees/beasts/fowl/fishes:
--        NT: none warranted   Extras: none warranted   Tanakh: none warranted (the corpus itself; Proverbs/Song already its own books)
--   v.34  there came of all people to hear the wisdom of Solomon, from all kings of the earth:
--        NT: Matt 12:42 (queen of the south came to hear the wisdom of Solomon; a greater than Solomon is here)  -> THREAD 4
--        Extras: none warranted   Tanakh: Ps 72:11 (all nations shall serve him)  -> THREAD 3
--
-- THREADS (slug -> target libraries):
--   1-kings-4-the-seed-of-promise-as-the-sand-of-the-sea-both-houses-many   (Tanakh: Gen 22, Gen 15, Gen 13)
--   1-kings-4-every-man-under-his-vine-and-under-his-fig-tree-the-rest      (Tanakh: Micah 4, Zech 3)
--   1-kings-4-dominion-from-the-river-the-kings-bring-presents              (Tanakh: Psalms 72)
--   1-kings-4-a-greater-than-solomon-the-wisdom-that-draws-the-nations      (NT: Matthew 12)
-- Framework-load-bearing: v.20+v.25 name BOTH houses (Yahudah AND Yashar'el) TOGETHER in the
--   undivided golden age — the Abrahamic seed-promise (sand/stars/dust) realized and the
--   vine-and-fig-tree rest enjoyed, a foretaste of the two houses made one again under the true
--   Son of David. v.29-34 wisdom drawing kings/nations is read as foreshadow of the greater-than-
--   Solomon (Matt 12:42), never replacement.

CREATE TEMP VIEW _s342_1ki04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: seed of promise as the sand of the sea (both houses many)
    ('canon','1-kings',4,20,'canon','genesis',22,17,'free',E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). The oath sworn on Moriah after the binding of Yitzhaq (Isaac) is the very measure 1 Kings names in the golden age: *Yahudah (Judah) and Yashar''el (Israel) were many, as the sand which is by the sea in multitude* (1 Kings 4:20). The seed of promise, carried by the paternal bloodline AND the covenant-word, has come to its appointed multitude.'),
    ('canon','1-kings',4,20,'canon','genesis',15,5,'free',E'*And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). What Abram believed in the dark — innumerable seed — 1 Kings now reports as realized: the two houses are *many, as the sand which is by the sea in multitude* (1 Kings 4:20). *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — the promise stands by faith AND lineage together.'),
    ('canon','1-kings',4,20,'canon','genesis',13,16,'free',E'*And I will make thy seed as the dust of the earth: so that if a man can number the dust of the earth, then shall thy seed also be numbered* (Genesis 13:16). The third measure of the same promise — dust, stars, sand — all unfold into the single multitude of *Yahudah (Judah) and Yashar''el (Israel)* who *were many, as the sand which is by the sea in multitude* (1 Kings 4:20). One seed, two houses, named together in the day of rest.'),
    -- THREAD 2: every man under his vine and under his fig tree (the rest)
    ('canon','1-kings',4,25,'canon','micah',4,4,'free',E'*But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). The picture 1 Kings draws of Solomon''s peace — *Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree* (1 Kings 4:25) — is the very image Micah lifts into the last days as the kingdom-rest under Yahuah''s reign. Solomon''s golden age is the foretaste; the prophet names the consummation.'),
    ('canon','1-kings',4,25,'canon','zechariah',3,10,'free',E'*In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). Zechariah sets this rest in the day he brings forth *my servant the BRANCH* (Zechariah 3:8) — the Formed Son, the true Branch of David. The safe dwelling of 1 Kings 4:25, *every man under his vine and under his fig tree*, is thus a sign pointing past Solomon to the kingdom of the greater Son.'),
    -- THREAD 3: dominion from the river, the kings bring presents (Solomon-psalm)
    ('canon','1-kings',4,21,'canon','psalms',72,10,'free',E'*The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalms 72:10). The Solomon-psalm sings what 1 Kings reports: *they brought presents, and served Solomon all the days of his life* (1 Kings 4:21). The tribute laid before Solomon is the historical body of the psalm''s prophecy of the king''s son to whom the nations bring their gifts.'),
    ('canon','1-kings',4,24,'canon','psalms',72,8,'free',E'*He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalms 72:8). Solomon''s reach — *he had dominion over all the region on this side the river... and he had peace on all sides round about him* (1 Kings 4:24) — is the first measure of the dominion the psalm enlarges to the ends of the earth in the King''s son. The historical kingdom foreshadows the everlasting one.'),
    ('canon','1-kings',4,34,'canon','psalms',72,11,'free',E'*Yea, all kings shall fall down before him: all nations shall serve him* (Psalms 72:11). 1 Kings shows the firstfruits: *there came of all people to hear the wisdom of Solomon, from all kings of the earth* (1 Kings 4:34). The kings of the earth drawn to Solomon are a token of the psalm''s word that *all nations shall serve him* — the nations gathered to the Son of David.'),
    -- THREAD 4: a greater than Solomon — the wisdom that draws the nations
    ('canon','1-kings',4,34,'canon','matthew',12,42,'free',E'*The queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Matthew 12:42). The very scene of 1 Kings — *there came of all people to hear the wisdom of Solomon, from all kings of the earth* (1 Kings 4:34) — Yahusha (Jesus) names as a witness against his generation: the nations came for Solomon''s wisdom; here stands the greater Son in whom that wisdom dwells.'),
    ('canon','1-kings',4,29,'canon','matthew',12,42,'free',E'*and, behold, a greater than Solomon is here* (Matthew 12:42). *And Elohim (God) gave Solomon wisdom and understanding exceeding much, and largeness of heart, even as the sand that is on the sea shore* (1 Kings 4:29) — the wisdom was a gift granted from above, and it drew the earth. Yahusha (Jesus) points past the gift to the Giver made flesh: the One greater than the wisest king, the Formed Son who is himself the wisdom from above.'),
    ('canon','1-kings',4,30,'canon','matthew',12,42,'free',E'*for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Matthew 12:42). *And Solomon''s wisdom excelled the wisdom of all the children of the east country, and all the wisdom of Egypt* (1 Kings 4:30) — his fame *was in all nations round about* (1 Kings 4:31). That wisdom which surpassed every nation is the foreshadow; the greater than Solomon is the substance.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-4-the-seed-of-promise-as-the-sand-of-the-sea-both-houses-many',
       E'The seed of promise as the sand of the sea — both houses made many',
       E'In Solomon''s golden age the Abrahamic oath comes to its appointed measure: *Yahudah (Judah) and Yashar''el (Israel) were many, as the sand which is by the sea in multitude, eating and drinking, and making merry* (1 Kings 4:20). The two houses are named TOGETHER, still one people, in the day before the kingdom was torn — and the very simile of the sand is the language of the promise. Yahuah swore it to Abraham on Moriah: *in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17). He had shown it to him in the night: *tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). He had set it before him in the land: *I will make thy seed as the dust of the earth* (Genesis 13:16). Dust, stars, sand — the seed carried by paternal bloodline and covenant-word together — has become the multitude eating and merry under Solomon. This is the foretaste of the two sticks made one again (Ezekiel 37:19).',
       sv.verse_id, ev.verse_id, 'free', 37975
  FROM _s342_1ki04_lookup sv, _s342_1ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=4 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-4-every-man-under-his-vine-and-under-his-fig-tree-the-rest',
       E'Every man under his vine and under his fig tree — the kingdom-rest foreshadowed',
       E'*And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon* (1 Kings 4:25). It is the image of perfect rest — the whole land at peace, both houses safe, each under his own vine and tree. The prophets seize this very picture and carry it forward to the last days. Micah lifts it into the mountain of Yahuah''s house: *but they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). Zechariah sets it in the day of the Branch: *in that day... shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10) — the day he brings forth *my servant the BRANCH* (Zechariah 3:8), the Formed Son and true Branch of David. Solomon''s reign is the foretaste; the kingdom of the greater Son is the fullness of that rest.',
       sv.verse_id, ev.verse_id, 'free', 37978
  FROM _s342_1ki04_lookup sv, _s342_1ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-4-dominion-from-the-river-the-kings-bring-presents',
       E'Dominion from the river — the kings of the earth bring their presents',
       E'Solomon''s reign reaches to the bounds the Solomon-psalm sings. *And Solomon reigned over all kingdoms from the river unto the land of the Philistines, and unto the border of Egypt: they brought presents, and served Solomon all the days of his life* (1 Kings 4:21); *he had dominion over all the region on this side the river... and he had peace on all sides round about him* (1 Kings 4:24); and *there came of all people to hear the wisdom of Solomon, from all kings of the earth* (1 Kings 4:34). Psalm 72, the prayer for the king''s son, names the same dominion enlarged: *he shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalms 72:8); *the kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalms 72:10); *yea, all kings shall fall down before him: all nations shall serve him* (Psalms 72:11). The historical kingdom of Solomon is the firstfruits; the everlasting kingdom of the Son of David is the body of the prophecy.',
       sv.verse_id, ev.verse_id, 'free', 37981
  FROM _s342_1ki04_lookup sv, _s342_1ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=4 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-4-a-greater-than-solomon-the-wisdom-that-draws-the-nations',
       E'A greater than Solomon — the wisdom from above that draws the nations',
       E'*And Elohim (God) gave Solomon wisdom and understanding exceeding much, and largeness of heart, even as the sand that is on the sea shore* (1 Kings 4:29). The wisdom was a gift from above, granted (1 Kings 3) and now overflowing: *Solomon''s wisdom excelled the wisdom of all the children of the east country, and all the wisdom of Egypt* (1 Kings 4:30), *his fame was in all nations round about* (1 Kings 4:31), and *there came of all people to hear the wisdom of Solomon, from all kings of the earth* (1 Kings 4:34). It is wisdom that draws the nations to it. Yahusha (Jesus) names this very scene as a witness in the judgment: *the queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Matthew 12:42). The wisest king is the foreshadow; the Formed Son, the wisdom from above made flesh, is the greater than Solomon now standing before them.',
       sv.verse_id, ev.verse_id, 'free', 37984
  FROM _s342_1ki04_lookup sv, _s342_1ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=4 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 22:17 — the oath on Moriah: *I will multiply thy seed... as the sand which is upon the sea shore*; 1 Kings 4:20''s multitude *as the sand which is by the sea* is the promise come to pass.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-the-seed-of-promise-as-the-sand-of-the-sea-both-houses-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 15:5 — *tell the stars... So shall thy seed be*; what Abram believed by faith (v.6, counted for righteousness) is realized in the *many* of 1 Kings 4:20.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-the-seed-of-promise-as-the-sand-of-the-sea-both-houses-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 13:16 — *I will make thy seed as the dust of the earth*; the third measure of the one promise (dust/stars/sand) gathered into the multitude of both houses in 1 Kings 4:20.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-the-seed-of-promise-as-the-sand-of-the-sea-both-houses-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Micah 4:4 — *they shall sit every man under his vine and under his fig tree; and none shall make them afraid*; the last-days rest whose foretaste is Solomon''s safe-dwelling land in 1 Kings 4:25.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-every-man-under-his-vine-and-under-his-fig-tree-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Zechariah 3:10 — *shall ye call every man his neighbour under the vine and under the fig tree*, set in the day of *my servant the BRANCH* (3:8); the rest of 1 Kings 4:25 pointed to the kingdom of the true Branch of David.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-every-man-under-his-vine-and-under-his-fig-tree-the-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalms 72:10 — *the kings of Tarshish and of the isles shall bring presents*; the historical body in 1 Kings 4:21, *they brought presents, and served Solomon*.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-dominion-from-the-river-the-kings-bring-presents'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalms 72:8 — *he shall have dominion also from sea to sea, and from the river unto the ends of the earth*; 1 Kings 4:24''s dominion *on this side the river* with peace round about is its firstfruits.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-dominion-from-the-river-the-kings-bring-presents'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalms 72:11 — *all kings shall fall down before him: all nations shall serve him*; 1 Kings 4:34''s *all kings of the earth* coming to Solomon is the token of the nations gathered to the Son of David.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=34
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-dominion-from-the-river-the-kings-bring-presents'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Matthew 12:42 (on 1 Kings 4:29) — *a greater than Solomon is here*; the wisdom *given* Solomon *even as the sand that is on the sea shore* points past the gift to the Giver, the wisdom from above made flesh.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=29
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-a-greater-than-solomon-the-wisdom-that-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 12:42 (on 1 Kings 4:30) — Solomon''s wisdom *excelled the wisdom of all the children of the east country, and all the wisdom of Egypt*; the king who surpassed every nation is the foreshadow of the greater than Solomon.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=30
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-a-greater-than-solomon-the-wisdom-that-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 12:42 (on 1 Kings 4:34) — *she came from the uttermost parts of the earth to hear the wisdom of Solomon*; the scene of *all kings of the earth* coming to hear is named by Yahusha (Jesus) as witness that a greater than Solomon now stands present.'
  FROM cross_reference_threads t
  JOIN _s342_1ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=4 AND sv.verse_number=34
  JOIN _s342_1ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-4-a-greater-than-solomon-the-wisdom-that-draws-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_5.sql (1 Kings 5) -----
-- 1 Kings 5 — Hiram and Solomon; the son who builds the house for the Name.
-- TAG: 1ki05   VIEW: _s342_1ki05_lookup   SORT BAND: 38000, step 3 (38000,38003,38006,...)
-- SOURCE rows all 'canon','1-kings',5,v.
--
-- 1 Kings 5 coverage:
--   v.3-4  (David could not build for the wars; rest now given)
--          NT:     Hebrews 3:6 (whose house are we, holding fast) [thread 2]
--          Extras: none warranted
--          Tanakh: 2 Sam 7:1,11 (rest from enemies); 1 Chron 22:8-9,18 (man of rest) [thread 2]
--   v.5    (I purpose to build an house unto the name... thy son shall build an house unto my name)
--          NT:     John 2:19,21 (temple of his body); Hebrews 3:3 (builder more honour) [thread 1/3]
--          Extras: none warranted
--          Tanakh: 2 Sam 7:13 (he shall build an house for my name); 1 Chron 22:9-10; Zech 6:12-13 (BRANCH builds the temple) [thread 1]
--   v.7    (Blessed be Yahuah, a wise son over this great people)
--          NT:     none warranted (covered laterally)
--          Extras: none warranted
--          Tanakh: 1 Chron 22:12 (wisdom to keep the law) [folded into thread 1 prose]
--   v.12   (Yahuah gave Solomon wisdom; peace between Hiram and Solomon; a league)
--          NT:     Ephesians 2:14 (he is our peace) [thread 4]
--          Extras: none warranted
--          Tanakh: 1 Chron 22:9 (peace and quietness); Zech 6:13 (counsel of peace between them both) [thread 4]
--   v.13-16 (the levy, the burden-bearers, the hewers) — none warranted (administrative)
--   v.17-18 (great costly hewed stones, foundation; builders prepared timber and stones)
--          NT:     Eph 2:20-22 (built upon the foundation... holy temple); 1 Pet 2:4-5 (living/lively stones); Heb 3:3-4 (he that built all things) [thread 3]
--          Extras: none warranted
--          Tanakh: Zech 6:13 (he shall build the temple and bear the glory); 1 Kings 6:7 quoted in prose (stone made ready before brought) [thread 3]
--
-- THREADS:
--   1-kings-5-the-son-who-builds-the-house-unto-my-name (free) — Tanakh+NT: 2Sam7, 1Chr22, Zech6, John2
--   1-kings-5-the-rest-then-the-temple-david-could-not-build (free) — Tanakh+NT: 2Sam7, 1Chr22, Heb3
--   1-kings-5-the-prepared-stones-and-the-true-temple (free) — Tanakh+NT: Zech6, Eph2, 1Pet2, Heb3
--   1-kings-5-the-counsel-of-peace-between-them-both (free) — Tanakh+NT: 1Chr22, Zech6, Eph2
-- Framework-load-bearing framing: 5:5 reads 2 Sam 7:13 forward through the Formed Son who builds
-- the true temple (his body, John 2:21; the people as living stones, 1 Pet 2:5 / Eph 2:21-22),
-- NOT a co-equal-person; he is the builder-Son who bears the glory and has a Father (Zech 6:13).
-- Torah affirmed: the wise son is to keep the law (1 Chr 22:12) — wisdom is covenant obedience.

CREATE TEMP VIEW _s342_1ki05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the son who builds the house unto my Name (5:5)
    ('canon','1-kings',5,5,'canon','2-samuel',7,13,'free',E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). Solomon repeats the very promise as his warrant: *as Yahuah (LORD) spake unto David my father, saying, Thy son, whom I will set upon thy throne in thy room, he shall build an house unto my name* (1 Kings 5:5). The temple-building son fulfils the word given to David — and the everlasting throne reaches past Solomon to the greater Son.'),
    ('canon','1-kings',5,5,'canon','1-chronicles',22,9,'free',E'*Behold, a son shall be born to thee, who shall be a man of rest; and I will give him rest from all his enemies round about: for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9). The man of rest is the man who builds: Solomon''s *I purpose to build an house unto the name of Yahuah Elohai (the LORD my God)* (1 Kings 5:5) answers the rest his name itself proclaims.'),
    ('canon','1-kings',5,5,'canon','1-chronicles',22,10,'free',E'*He shall build an house for my name; and he shall be my son, and I will be his father; and I will establish the throne of his kingdom over Yashar''el (Israel) for ever* (1 Chronicles 22:10). David charges Solomon with the same word Solomon now cites to Hiram: *he shall build an house unto my name* (1 Kings 5:5). Father and son, house and throne for ever — the pattern the Formed Son fills.'),
    ('canon','1-kings',5,5,'canon','zechariah',6,12,'free',E'*Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). Solomon''s *he shall build an house unto my name* (1 Kings 5:5) foreshadows the greater builder — the BRANCH, the Davidic King, who builds the true temple of Yahuah.'),
    ('canon','1-kings',5,5,'canon','zechariah',6,13,'free',E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The house-building son of 1 Kings 5:5 — *he shall build an house unto my name* — opens forward to the One who builds and bears the glory, the Formed Son who reigns and is priest, having his Father.'),
    ('canon','1-kings',5,5,'canon','john',2,19,'free',E'*Yahusha (Jesus) answered and said unto them, Destroy this temple, and in three days I will raise it up* (John 2:19). Solomon raised an house of cedar and stone *unto the name of Yahuah Elohai (the LORD my God)* (1 Kings 5:5); the greater Son speaks of the true temple raised in three days — his own body.'),
    ('canon','1-kings',5,5,'canon','john',2,21,'free',E'*But he spake of the temple of his body* (John 2:21). The house Solomon purposed *unto the name of Yahuah Elohai (the LORD my God)* (1 Kings 5:5) was a shadow; the true dwelling for the Name is the body of the Formed Son, and through him the people built into a temple.'),

    -- THREAD 2: the rest then the temple — David could not build (5:3-4)
    ('canon','1-kings',5,3,'canon','1-chronicles',22,8,'free',E'*But the word of Yahuah (LORD) came to me, saying, Thou hast shed blood abundantly, and hast made great wars: thou shalt not build an house unto my name, because thou hast shed much blood upon the earth in my sight* (1 Chronicles 22:8). This is why *David my father could not build an house unto the name of Yahuah Elohav (the LORD his God) for the wars which were about him on every side* (1 Kings 5:3) — the warrior could not raise the house of peace.'),
    ('canon','1-kings',5,3,'canon','2-samuel',7,1,'free',E'*And it came to pass, when the king sat in his house, and Yahuah (LORD) had given him rest round about from all his enemies* (2 Samuel 7:1). David''s desire to build began here; yet the wars *which were about him on every side* (1 Kings 5:3) deferred the house to the son of rest, not the man of blood.'),
    ('canon','1-kings',5,4,'canon','2-samuel',7,11,'free',E'*And as since the time that I commanded judges to be over my people Yashar''el (Israel), and have caused thee to rest from all thine enemies. Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11). The rest Yahuah gives is the ground the house is built upon: *now Yahuah Elohai (the LORD my God) hath given me rest on every side, so that there is neither adversary nor evil occurrent* (1 Kings 5:4).'),
    ('canon','1-kings',5,4,'canon','1-chronicles',22,18,'free',E'*Is not Yahuah Elohaychem (the LORD your God) with you? and hath he not given you rest on every side?* (1 Chronicles 22:18). The same rest David proclaims to the princes Solomon now claims as his own — *Yahuah Elohai (the LORD my God) hath given me rest on every side* (1 Kings 5:4) — the appointed season for the holy work.'),
    ('canon','1-kings',5,4,'canon','hebrews',3,6,'free',E'*But Messiah (Christ) as a son over his own house; whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end* (Hebrews 3:6). The rest-then-house of Solomon (*hath given me rest on every side*, 1 Kings 5:4) reaches its end in the Son over his own house, and that house is the people who hold fast — the living temple entered through his rest.'),

    -- THREAD 3: the prepared stones and the true temple (5:17-18)
    ('canon','1-kings',5,17,'canon','ephesians',2,20,'free',E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20). The *great stones, costly stones, and hewed stones, to lay the foundation of the house* (1 Kings 5:17) shadow the true foundation: the people built upon prophets and the corner stone of the Formed Son.'),
    ('canon','1-kings',5,17,'canon','1-peter',2,4,'free',E'*To whom coming, as unto a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4). The costly hewed stones laid for the foundation (1 Kings 5:17) point to the living Stone, chosen and precious, on whom the spiritual house is built.'),
    ('canon','1-kings',5,18,'canon','1-peter',2,5,'free',E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). Solomon''s and Hiram''s builders *did hew them... so they prepared timber and stones to build the house* (1 Kings 5:18); the greater house is built of living stones — the people themselves, hewn and made ready as the stones were made ready before they were brought (1 Kings 6:7).'),
    ('canon','1-kings',5,18,'canon','ephesians',2,21,'free',E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21). The stones *prepared... to build the house* (1 Kings 5:18) — quietly made ready, *neither hammer nor axe nor any tool of iron heard in the house* (1 Kings 6:7) — foreshadow the building framed together into a holy temple of living stones.'),
    ('canon','1-kings',5,18,'canon','hebrews',3,3,'free',E'*For this man was counted worthy of more glory than Moses, inasmuch as he who hath builded the house hath more honour than the house* (Hebrews 3:3). The builders who *prepared timber and stones to build the house* (1 Kings 5:18) serve a house; the Son who builds the true house bears more honour, *for he that built all things is Elohim (God)* (Hebrews 3:4).'),

    -- THREAD 4: the counsel of peace between them both (5:12)
    ('canon','1-kings',5,12,'canon','1-chronicles',22,9,'free',E'*for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9). The wisdom and peace given Solomon — *Yahuah (LORD) gave Solomon wisdom, as he promised him: and there was peace between Hiram and Solomon* (1 Kings 5:12) — is the peace his very name proclaims, the rest in which the house is raised.'),
    ('canon','1-kings',5,12,'canon','zechariah',6,13,'free',E'*and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The *peace between Hiram and Solomon* and the league they two made (1 Kings 5:12) is a shadow of the counsel of peace that crowns the true temple-builder, the King-Priest upon his throne.'),
    ('canon','1-kings',5,12,'canon','ephesians',2,14,'free',E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14). The peace and league between the two kings building the house (1 Kings 5:12) opens forward to the Formed Son who is himself our peace, making the two houses one and gathering them as one temple.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-5-the-son-who-builds-the-house-unto-my-name',
       E'The son who builds the house unto my Name',
       E'Solomon sends to Hiram with his whole warrant in one sentence: *And, behold, I purpose to build an house unto the name of Yahuah Elohai (the LORD my God), as Yahuah (LORD) spake unto David my father, saying, Thy son, whom I will set upon thy throne in thy room, he shall build an house unto my name* (1 Kings 5:5). That is the word of 2 Samuel 7 come due: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). David charges the same upon Solomon — *He shall build an house for my name; and he shall be my son, and I will be his father* (1 Chronicles 22:10) — and names him the man of rest in whose days Yahuah gives *peace and quietness unto Yashar''el (Israel)* (1 Chronicles 22:9). Yet the everlasting throne reaches past the stone house Solomon raised. Zechariah sees the greater builder: *Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)... and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:12-13). And the Formed Son names the true temple plainly — *Destroy this temple, and in three days I will raise it up* (John 2:19) — for *he spake of the temple of his body* (John 2:21). The temple-building son of David is the type; the Branch who bears the glory and has a Father is the fulfilment.',
       sv.verse_id, ev.verse_id, 'free', 38000
  FROM _s342_1ki05_lookup sv, _s342_1ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-5-the-rest-then-the-temple-david-could-not-build',
       E'The rest, then the temple — David could not build',
       E'Before the house could be raised there had to be rest. Solomon tells Hiram why his father could not build: *Thou knowest how that David my father could not build an house unto the name of Yahuah Elohav (the LORD his God) for the wars which were about him on every side* (1 Kings 5:3). The reason is given to David himself: *Thou hast shed blood abundantly, and hast made great wars: thou shalt not build an house unto my name* (1 Chronicles 22:8). The man of blood prepares; the man of rest builds. So the desire that woke when *Yahuah (LORD) had given him rest round about from all his enemies* (2 Samuel 7:1) waits for the son, and Yahuah''s own word makes the rest the ground of the house: *have caused thee to rest from all thine enemies. Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11). Now the season is come: *But now Yahuah Elohai (the LORD my God) hath given me rest on every side, so that there is neither adversary nor evil occurrent* (1 Kings 5:4) — the same rest David proclaimed to the princes, *hath he not given you rest on every side?* (1 Chronicles 22:18). The pattern runs forward to its end in the Son over his own house: *whose house are we, if we hold fast the confidence and the rejoicing of the hope firm unto the end* (Hebrews 3:6) — the living temple entered through his rest.',
       sv.verse_id, ev.verse_id, 'free', 38003
  FROM _s342_1ki05_lookup sv, _s342_1ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-5-the-prepared-stones-and-the-true-temple',
       E'The prepared stones and the true temple',
       E'The work is provision and preparation for the holy house. *And the king commanded, and they brought great stones, costly stones, and hewed stones, to lay the foundation of the house* (1 Kings 5:17), and *Solomon''s builders and Hiram''s builders did hew them, and the stonesquarers: so they prepared timber and stones to build the house* (1 Kings 5:18). The making-ready is quiet and exact, so that — as the next chapter records — *the house, when it was in building, was built of stone made ready before it was brought thither: so that there was neither hammer nor axe nor any tool of iron heard in the house, while it was in building* (1 Kings 6:7). These prepared stones are the figure the apostles unfold. The foundation laid by Solomon shadows the true one: *built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), *in whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21). The stones are living: *To whom coming, as unto a living stone... ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:4-5). And the builder is greater than the house: *he who hath builded the house hath more honour than the house... he that built all things is Elohim (God)* (Hebrews 3:3-4). The hewn and made-ready stones of Solomon''s house are the people themselves, prepared in quietness and framed into the temple of the Name.',
       sv.verse_id, ev.verse_id, 'free', 38006
  FROM _s342_1ki05_lookup sv, _s342_1ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-5-the-counsel-of-peace-between-them-both',
       E'The counsel of peace between them both',
       E'The holy work goes forward in peace and provision. *And Yahuah (LORD) gave Solomon wisdom, as he promised him: and there was peace between Hiram and Solomon; and they two made a league together* (1 Kings 5:12). The peace is no accident of statecraft — it is the peace Solomon''s very name proclaims: *for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9). The two kings, each sending his servants to the work, the cedars of Tyre answering the harvest of Yashar''el, are a shadow of the counsel of peace that crowns the true temple-builder: *he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). And the peace reaches its fullness in the Formed Son, who is himself the peace that gathers: *For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14) — the two houses of Yashar''el made one, built together for an habitation of Elohim.',
       sv.verse_id, ev.verse_id, 'free', 38009
  FROM _s342_1ki05_lookup sv, _s342_1ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — the very promise Solomon cites as his warrant.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Behold, a son shall be born to thee, who shall be a man of rest... for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9) — the man of rest is the man who builds.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He shall build an house for my name; and he shall be my son, and I will be his father* (1 Chronicles 22:10) — father and son, house and throne for ever.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Behold the man whose name is The BRANCH... and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12) — the greater builder foreshadowed.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory... and he shall be a priest upon his throne* (Zechariah 6:13) — the Formed Son who builds and bears the glory, having his Father.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Destroy this temple, and in three days I will raise it up* (John 2:19) — the true temple Solomon''s house only shadowed.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*But he spake of the temple of his body* (John 2:21) — the true dwelling for the Name is the body of the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-son-who-builds-the-house-unto-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou hast shed blood abundantly, and hast made great wars: thou shalt not build an house unto my name* (1 Chronicles 22:8) — why the warrior could not build.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-rest-then-the-temple-david-could-not-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when the king sat in his house, and Yahuah (LORD) had given him rest round about from all his enemies* (2 Samuel 7:1) — where David''s desire to build began.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-rest-then-the-temple-david-could-not-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*have caused thee to rest from all thine enemies. Also Yahuah (LORD) telleth thee that he will make thee an house* (2 Samuel 7:11) — the rest is the ground of the house.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-rest-then-the-temple-david-could-not-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*hath he not given you rest on every side?* (1 Chronicles 22:18) — the same rest David proclaimed, now Solomon''s own.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-rest-then-the-temple-david-could-not-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Messiah (Christ) as a son over his own house; whose house are we, if we hold fast* (Hebrews 3:6) — the rest-then-house pattern reaching its end in the Son.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-rest-then-the-temple-david-could-not-build'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20) — the true foundation the costly stones shadow.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-prepared-stones-and-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To whom coming, as unto a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4) — the living Stone the foundation points to.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-prepared-stones-and-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5) — the people themselves, hewn and made ready as the stones were.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-prepared-stones-and-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21) — the quietly prepared stones framed into a holy temple.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-prepared-stones-and-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he who hath builded the house hath more honour than the house... he that built all things is Elohim (God)* (Hebrews 3:3) — the builder greater than the house.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-prepared-stones-and-the-true-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*for his name shall be Solomon, and I will give peace and quietness unto Yashar''el (Israel) in his days* (1 Chronicles 22:9) — the peace Solomon''s name proclaims.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-counsel-of-peace-between-them-both'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13) — the counsel of peace crowning the true temple-builder.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-counsel-of-peace-between-them-both'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14) — the Formed Son who is himself the peace gathering the two houses into one.'
  FROM cross_reference_threads t
  JOIN _s342_1ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s342_1ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-5-the-counsel-of-peace-between-them-both'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session342 — 1 Kings cross-references complete.'
