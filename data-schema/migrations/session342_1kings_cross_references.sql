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

-- ----- fragment: minion_1-kings_6.sql (1 Kings 6) -----
-- 1 Kings 6 — Solomon builds the house of Yahuah; the prepared stones, the
--             Torah-conditioned indwelling Presence, the most holy place, the cherubim.
-- TAG: 1ki06   VIEW: _s342_1ki06_lookup   SORT BAND: 38025, step 3 (38025,38028,38031,38034)
-- SOURCE rows all 'canon','1-kings',6,v.
--
-- 1 Kings 6 coverage:
--   v.1    (480th year after the exodus; began to build the house) — dating from the redemption.
--          NT:     none warranted   Extras: none warranted
--          Tanakh: covered laterally (exodus the anchor-event); none threaded
--   v.7    (the house built of stone made ready before brought; no hammer/axe/tool of iron heard)
--          NT:     1 Pet 2:4-5 (living/lively stones, spiritual house); Eph 2:21-22 (fitly framed temple) [thread 1]
--          Extras: none warranted
--          Tanakh: covered by NT weave; none added [thread 1]
--   v.11-13 (the word: IF thou wilt walk in my statutes... THEN I will dwell among Yashar'el)
--          NT:     John 1:14 (the Word dwelt among us); Rev 21:3 (the tabernacle of Elohim with men) [thread 2]
--          Extras: none warranted
--          Tanakh: Lev 26:3,11-12 (walk in my statutes / I will set my tabernacle among you, be my people);
--                  Deut 11:1,22 (love Yahuah, keep his commandments, cleave); 1 Kings 9:3-4 (echo, the condition) [thread 2]
--   v.16,19-22 (the oracle, the most holy place; the ark; overlaid with pure gold)
--          NT:     Heb 9:3-4 (the Holiest of all; the ark overlaid with gold) [thread 3]
--          Extras: none warranted
--          Tanakh: Exod 25:8-9 (make me a sanctuary that I may dwell; after the pattern) [thread 3]
--   v.23-28 (two cherubims of olive tree overlaid with gold in the oracle)
--          NT:     Heb 9:5 (the cherubims of glory shadowing the mercyseat) [thread 4]
--          Extras: none warranted
--          Tanakh: Exod 25:18-20,22 (two cherubims of gold; there I will meet with thee from between them) [thread 4]
--   v.2-6,8-10,14-15,17-18,29-38 (dimensions, chambers, cedar, carvings, courts, the seven years) —
--          construction detail, none warranted; load-bearing pieces folded into the threads above.
--
-- THREADS:
--   1-kings-6-the-prepared-stones-no-tool-of-iron-heard (free) — NT: 1Pet2, Eph2
--   1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell (free) — Tanakh+NT: Lev26, Deut11, 1Kings9, John1, Rev21
--   1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold (free) — Tanakh+NT: Exod25, Heb9
--   1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold (free) — Tanakh+NT: Exod25, Heb9
--
-- Framework-load-bearing framing: 6:12-13 is the keystone — the indwelling Presence is CONDITIONED
-- on Torah-keeping (*if thou wilt walk in my statutes... then will I... dwell among the children of
-- Yashar'el*), echoing Lev 26:3,11-12 and Deut 11; Torah is the condition of the tabernacling Glory,
-- never the curse. The goal of the whole story is Yahuah DWELLING among His people, opening forward to
-- the Word made flesh who dwelt among us (John 1:14, the Formed Glory, not a co-equal person) and the
-- consummation, the tabernacle of Elohim with men (Rev 21:3). The prepared stones (6:7) read forward to
-- the living-stones temple (1 Pet 2:5, Eph 2:21-22) — focused on the SILENCE / no tool of iron, distinct
-- from the ch5 prepared-stones thread (Zech 6 builder). The most holy place / cherubim are the heavenly
-- pattern (Exod 25:8-9,40) the NT names as figure (Heb 9).

CREATE TEMP VIEW _s342_1ki06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the prepared stones — no tool of iron heard (6:7)
    ('canon','1-kings',6,7,'canon','1-peter',2,4,'free',E'*To whom coming, as unto a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4). The house was *built of stone made ready before it was brought thither* (1 Kings 6:7) — every stone shaped beforehand, chosen and fitted away from the site; so the true temple is built of living stones, chosen of Elohim and made ready before they are set in their place.'),
    ('canon','1-kings',6,7,'canon','1-peter',2,5,'free',E'*Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ)* (1 Peter 2:5). The stone-house of Solomon, raised in silence so that *there was neither hammer nor axe nor any tool of iron heard in the house, while it was in building* (1 Kings 6:7), is the shadow of the spiritual house of living stones — the people of Yashar''el fitted into the dwelling of Yahuah.'),
    ('canon','1-kings',6,7,'canon','ephesians',2,21,'free',E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21). The stones of 1 Kings 6:7 are *made ready before* they are brought — fitly framed before the wall ever rises; the true temple grows the same way, each stone prepared and joined into one holy house for the Name.'),
    ('canon','1-kings',6,7,'canon','ephesians',2,22,'free',E'*In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). The silent, pre-fitted house of 1 Kings 6:7 — *there was neither hammer nor axe nor any tool of iron heard* — is the figure of the habitation of Elohim built together by the Spirit, the dwelling the whole chapter is reaching toward.'),

    -- THREAD 2: if thou wilt walk in my statutes, then I will dwell (6:11-13)
    ('canon','1-kings',6,12,'canon','leviticus',26,3,'free',E'*If ye walk in my statutes, and keep my commandments, and do them* (Leviticus 26:3). Solomon''s word from Yahuah is the same condition spoken at Sinai: *if thou wilt walk in my statutes, and execute my judgments, and keep all my commandments to walk in them; then will I perform my word with thee* (1 Kings 6:12). Torah-keeping is the condition — never the curse — of the promise.'),
    ('canon','1-kings',6,13,'canon','leviticus',26,11,'free',E'*And I will set my tabernacle among you: and my soul shall not abhor you* (Leviticus 26:11). The whole purpose of the house is this dwelling: *and I will dwell among the children of Yashar''el (Israel), and will not forsake my people Yashar''el (Israel)* (1 Kings 6:13). The tabernacling Presence, promised at Sinai, is what Solomon builds the house to receive.'),
    ('canon','1-kings',6,13,'canon','leviticus',26,12,'free',E'*And I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12). Yahuah''s vow *I will dwell among the children of Yashar''el (Israel), and will not forsake my people Yashar''el (Israel)* (1 Kings 6:13) is the Levitical covenant-formula — I dwelling, they my people — the heart of the two-house inheritance.'),
    ('canon','1-kings',6,12,'canon','deuteronomy',11,1,'free',E'*Therefore thou shalt love Yahuah Elohayka (the LORD thy God), and keep his charge, and his statutes, and his judgments, and his commandments, alway* (Deuteronomy 11:1). The IF of 1 Kings 6:12 — *if thou wilt walk in my statutes, and execute my judgments, and keep all my commandments to walk in them* — is the Deuteronomy charge laid on the house itself: the indwelling stands on covenant obedience.'),
    ('canon','1-kings',6,12,'canon','deuteronomy',11,22,'free',E'*For if ye shall diligently keep all these commandments which I command you, to do them, to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22). To *walk in my statutes... and keep all my commandments to walk in them* (1 Kings 6:12) is to cleave unto Yahuah; the blessing of His abiding nearness follows the keeping of His ways.'),
    ('canon','1-kings',6,12,'canon','1-kings',9,4,'free',E'*And if thou wilt walk before me, as David thy father walked, in integrity of heart, and in uprightness, to do according to all that I have commanded thee, and wilt keep my statutes and my judgments* (1 Kings 9:4). Yahuah speaks the same condition again once the house is finished, the IF of 1 Kings 6:12 renewed face to face: the throne and the dwelling alike hang on keeping the statutes.'),
    ('canon','1-kings',6,13,'canon','1-kings',9,3,'free',E'*I have hallowed this house, which thou hast built, to put my name there for ever; and mine eyes and mine heart shall be there perpetually* (1 Kings 9:3). The promise Solomon hears mid-building — *I will dwell among the children of Yashar''el (Israel)* (1 Kings 6:13) — is sealed when the house is done: Yahuah hallows it and sets His name and heart there, the indwelling Presence the whole work was for.'),
    ('canon','1-kings',6,13,'canon','john',1,14,'free',E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). Yahuah''s word over the house — *I will dwell among the children of Yashar''el (Israel)* (1 Kings 6:13) — opens forward to the Formed Glory tabernacling in flesh: the Word who dwelt among us, beheld in glory, who has a Father.'),
    ('canon','1-kings',6,13,'canon','revelation',21,3,'free',E'*Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The vow of 1 Kings 6:13 — *I will dwell among the children of Yashar''el (Israel), and will not forsake my people* — reaches its consummation here: the dwelling Presence with His people for ever, the goal of the whole story.'),

    -- THREAD 3: the oracle, the most holy place, overlaid with gold (6:16,19-22)
    ('canon','1-kings',6,16,'canon','exodus',25,8,'free',E'*And let them make me a sanctuary; that I may dwell among them* (Exodus 25:8). The oracle Solomon partitions off — *he even built them for it within, even for the oracle, even for the most holy place* (1 Kings 6:16) — answers the first command of the sanctuary: a holy place made so that Yahuah may dwell among His people.'),
    ('canon','1-kings',6,19,'canon','exodus',25,9,'free',E'*According to all that I shew thee, after the pattern of the tabernacle, and the pattern of all the instruments thereof, even so shall ye make it* (Exodus 25:9). Solomon''s oracle is built *to set there the ark of the covenant of Yahuah (LORD)* (1 Kings 6:19) — the same ark of the wilderness pattern, the house enlarging the tabernacle shown to Moses in the mount.'),
    ('canon','1-kings',6,20,'canon','hebrews',9,3,'free',E'*And after the second veil, the tabernacle which is called the Holiest of all* (Hebrews 9:3). The oracle Solomon overlaid — *twenty cubits in length, and twenty cubits in breadth, and twenty cubits in the height thereof: and he overlaid it with pure gold* (1 Kings 6:20) — is the Holiest of all, the inner room the high priest entered once a year, a figure of the true.'),
    ('canon','1-kings',6,22,'canon','hebrews',9,4,'free',E'*Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant* (Hebrews 9:4). *And the whole house he overlaid with gold, until he had finished all the house* (1 Kings 6:22): the gold-covered most holy place and its ark are the pattern Hebrews reads as the shadow of the heavenly things.'),

    -- THREAD 4: the cherubims of the oracle, overlaid with gold (6:23-28)
    ('canon','1-kings',6,23,'canon','exodus',25,18,'free',E'*And thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat* (Exodus 25:18). *And within the oracle he made two cherubims of olive tree, each ten cubits high* (1 Kings 6:23): Solomon enlarges the two cherubim of the mercy seat into the great olive-wood guardians of the oracle, the same throne-figures of the wilderness ark.'),
    ('canon','1-kings',6,27,'canon','exodus',25,20,'free',E'*And the cherubims shall stretch forth their wings on high, covering the mercy seat with their wings, and their faces shall look one to another; toward the mercy seat shall the faces of the cherubims be* (Exodus 25:20). *They stretched forth the wings of the cherubims... and their wings touched one another in the midst of the house* (1 Kings 6:27): the stretched wings of the oracle echo the mercy-seat cherubim, the canopy over the place of meeting.'),
    ('canon','1-kings',6,28,'canon','exodus',25,22,'free',E'*And there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). *And he overlaid the cherubims with gold* (1 Kings 6:28): the gilded cherubim mark the very place where Yahuah meets and communes with His people, the throne above the testimony.'),
    ('canon','1-kings',6,23,'canon','hebrews',9,5,'free',E'*And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly* (Hebrews 9:5). The two cherubims Solomon set within the oracle (1 Kings 6:23) are the cherubims of glory overshadowing the mercyseat — the figures Hebrews names as it reads the holy of holies as the pattern of the true.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS --

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-6-the-prepared-stones-no-tool-of-iron-heard', E'The prepared stones — no tool of iron heard', E'The house rose in silence: *the house, when it was in building, was built of stone made ready before it was brought thither: so that there was neither hammer nor axe nor any tool of iron heard in the house, while it was in building* (1 Kings 6:7). Every stone was shaped and fitted away from the site, then brought and set without a sound of cutting. That quiet, pre-fitted house is the figure of the true temple of living stones: *to whom coming, as unto a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious* (1 Peter 2:4); *ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5). Each stone is chosen and made ready beforehand, then joined into one house — *in whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21); *in whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). The people of Yashar''el, fitted by Yahuah, are the stones of the dwelling the whole chapter is reaching toward.',
       sv.verse_id, ev.verse_id, 'free', 38025
  FROM _s342_1ki06_lookup sv, _s342_1ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell', E'If thou wilt walk in my statutes, then I will dwell among them', E'Mid-building, the word of Yahuah comes to Solomon and names the condition of the whole work: *Concerning this house which thou art in building, if thou wilt walk in my statutes, and execute my judgments, and keep all my commandments to walk in them; then will I perform my word with thee, which I spake unto David thy father: And I will dwell among the children of Yashar''el (Israel), and will not forsake my people Yashar''el (Israel)* (1 Kings 6:12-13). The IF is Torah-keeping; the THEN is the indwelling Presence — the goal the house exists for. This is the Sinai covenant exactly: *if ye walk in my statutes, and keep my commandments, and do them* (Leviticus 26:3), *and I will set my tabernacle among you* (Leviticus 26:11), *and I will walk among you, and will be your Elohim (God), and ye shall be my people* (Leviticus 26:12). It is the Deuteronomy charge: *therefore thou shalt love Yahuah Elohayka (the LORD thy God), and keep his charge, and his statutes, and his judgments, and his commandments, alway* (Deuteronomy 11:1), *to love Yahuah Elohaychem (the LORD your God), to walk in all his ways, and to cleave unto him* (Deuteronomy 11:22). Torah is the condition of the abiding Glory, never the curse. Yahuah renews the same word when the house is finished: *I have hallowed this house... to put my name there for ever; and mine eyes and mine heart shall be there perpetually* (1 Kings 9:3) — *and if thou wilt walk before me, as David thy father walked* (1 Kings 9:4). And the dwelling itself opens forward: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14) — the Formed Glory tabernacling in flesh, who has a Father — until the consummation, *behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3).',
       sv.verse_id, ev.verse_id, 'free', 38028
  FROM _s342_1ki06_lookup sv, _s342_1ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold', E'The oracle — the most holy place overlaid with gold', E'Within the house Solomon partitions off the inner room: *he even built them for it within, even for the oracle, even for the most holy place* (1 Kings 6:16), *and the oracle he prepared in the house within, to set there the ark of the covenant of Yahuah (LORD)* (1 Kings 6:19). It is overlaid utterly with gold: *the oracle in the forepart was twenty cubits in length, and twenty cubits in breadth, and twenty cubits in the height thereof: and he overlaid it with pure gold* (1 Kings 6:20); *and the whole house he overlaid with gold, until he had finished all the house* (1 Kings 6:22). This is the first command of the sanctuary enlarged — *and let them make me a sanctuary; that I may dwell among them* (Exodus 25:8), *according to all that I shew thee, after the pattern of the tabernacle* (Exodus 25:9). And the NT names the inner room as the figure of the true: *and after the second veil, the tabernacle which is called the Holiest of all* (Hebrews 9:3), *which had... the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant* (Hebrews 9:4). The gold-covered most holy place is the shadow; the heavenly dwelling is the substance.',
       sv.verse_id, ev.verse_id, 'free', 38031
  FROM _s342_1ki06_lookup sv, _s342_1ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold', E'The cherubims of the oracle, overlaid with gold', E'Within the most holy place Solomon sets the great guardians: *and within the oracle he made two cherubims of olive tree, each ten cubits high* (1 Kings 6:23); *they stretched forth the wings of the cherubims, so that the wing of the one touched the one wall, and the wing of the other cherub touched the other wall; and their wings touched one another in the midst of the house* (1 Kings 6:27); *and he overlaid the cherubims with gold* (1 Kings 6:28). These enlarge the two cherubim of the wilderness mercy seat: *and thou shalt make two cherubims of gold, of beaten work shalt thou make them, in the two ends of the mercy seat* (Exodus 25:18); *and the cherubims shall stretch forth their wings on high, covering the mercy seat with their wings, and their faces shall look one to another* (Exodus 25:20). They mark the very place of meeting: *and there I will meet with thee, and I will commune with thee from above the mercy seat, from between the two cherubims which are upon the ark of the testimony* (Exodus 25:22). The NT reads them as the figures of the holy of holies: *and over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly* (Hebrews 9:5) — the gold-overlaid throne-figures over the place where Yahuah dwells with His people.',
       sv.verse_id, ev.verse_id, 'free', 38034
  FROM _s342_1ki06_lookup sv, _s342_1ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=6 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS --

-- THREAD 1: the prepared stones — no tool of iron heard (6:7)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Peter 2:4 — the living stone, chosen of Elohim and precious, made ready before being set.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-prepared-stones-no-tool-of-iron-heard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Peter 2:5 — lively stones built up a spiritual house; the silent stone-house as figure.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-prepared-stones-no-tool-of-iron-heard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ephesians 2:21 — the building fitly framed, each stone prepared before it rises.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-prepared-stones-no-tool-of-iron-heard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ephesians 2:22 — the habitation of Elohim built together by the Spirit; the dwelling sought.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-prepared-stones-no-tool-of-iron-heard'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: if thou wilt walk in my statutes, then I will dwell (6:11-13)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 26:3 — if ye walk in my statutes and keep my commandments; the Sinai condition.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 26:11 — I will set my tabernacle among you; the indwelling promised at Sinai.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 26:12 — I will walk among you, ye shall be my people; the covenant-formula.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 11:1 — love Yahuah, keep his statutes and commandments alway.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 11:22 — keep all these commandments, walk in his ways, and cleave unto him.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Kings 9:4 — the same condition renewed: if thou wilt walk before me and keep my statutes.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'1 Kings 9:3 — the house hallowed, the name and heart set there for ever; the dwelling sealed.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'John 1:14 — the Word made flesh dwelt among us; the Formed Glory tabernacling, who has a Father.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Revelation 21:3 — the tabernacle of Elohim with men; the indwelling Presence consummated.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=13
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-if-thou-wilt-walk-in-my-statutes-then-i-will-dwell'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the oracle, the most holy place, overlaid with gold (6:16,19-22)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 25:8 — make me a sanctuary that I may dwell among them; the oracle answers this.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 25:9 — after the pattern of the tabernacle; the oracle holds the ark of that pattern.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hebrews 9:3 — the Holiest of all behind the second veil; the gold oracle as figure.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 9:4 — the ark overlaid round about with gold; the whole house overlaid with gold.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-oracle-the-most-holy-place-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the cherubims of the oracle, overlaid with gold (6:23-28)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 25:18 — two cherubims of gold on the mercy seat; Solomon enlarges them in the oracle.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 25:20 — the cherubims stretch forth their wings on high, covering the mercy seat.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=27
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 25:22 — there I will meet with thee from between the two cherubims; the place of meeting.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=28
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 9:5 — the cherubims of glory shadowing the mercyseat; the figures of the holy of holies.'
  FROM cross_reference_threads t
  JOIN _s342_1ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s342_1ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-6-the-cherubims-of-the-oracle-overlaid-with-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_7.sql (1 Kings 7) -----
-- 1 Kings 7 — Hiram's bronze work for the house: the two pillars Jachin and Boaz,
-- the molten sea on the twelve oxen, and all the vessels of bright brass finished.
-- TAG: 1ki07   VIEW: _s342_1ki07_lookup   SORT BAND: 38050, step 3 (38050,38053,38056,...)
-- SOURCE rows all 'canon','1-kings',7,v.
--
-- 1 Kings 7 coverage:
--   v.1-12 (Solomon's own house, the house of the forest of Lebanon, the porch of judgment)
--          NT:     none warranted (royal architecture; the porch of judgment is administrative)
--          Extras: none warranted
--          Tanakh: none warranted (parallel 2 Chron not extant for the royal houses)
--   v.21   (the two pillars set up; the right Jachin, the left Boaz) ★ keystone
--          NT:     Revelation 3:12 (overcomer made a pillar in the temple, go no more out) [thread 1]
--          Extras: none warranted
--          Tanakh: 2 Chronicles 3:15,17 (the parallel — the two pillars, Jachin and Boaz);
--                  Jeremiah 52:17,20,21 (the brass pillars broken and carried to Babylon) [thread 1]
--   v.15-16 (the two pillars cast, eighteen cubits, the chapiters) — folded into thread 1
--   v.23-26 (the molten sea, ten cubits, on twelve oxen, for the washing) ★ keystone
--          NT:     Revelation 4:6 (a sea of glass like crystal before the throne) [thread 2]
--          Extras: none warranted
--          Tanakh: 2 Chronicles 4:2,4,6 (the parallel sea; the priests to wash therein);
--                  Exodus 30:18,19,20 (the laver of brass, wash that they die not) [thread 2]
--   v.27-39 (the ten bases, the ten lavers, the wheels) — folded into thread 2 prose
--   v.40,45,48,51 (the vessels of bright brass; all the work finished; David's dedicated things)
--          NT:     none warranted (handled laterally; finishing weaves to Chron parallel)
--          Extras: none warranted
--          Tanakh: 2 Chronicles 4:11,16 (Huram made an end of all the work, bright brass);
--                  2 Chronicles 5:1 (all the work ended; David's dedicated things brought in) [thread 3]
--
-- THREADS:
--   1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple (free) — Tanakh+NT: 2Chr3, Jer52, Rev3
--   1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service (free) — Tanakh+NT: 2Chr4, Exod30, Rev4
--   1-kings-7-all-the-vessels-of-bright-brass-the-work-finished (free) — Tanakh: 2Chr4, 2Chr5
-- Framework-load-bearing framing:
--   7:21 — Jachin (*he shall establish*) and Boaz (*in him is strength*) are the named witness that
--          Yahuah establishes and strengthens his house. The overcomer is made *a pillar in the
--          temple of my Elohim* (Rev 3:12) and *shall go no more out* — the established, immovable
--          standing of the gathered. Jeremiah 52 shows the pillars broken and carried to Babylon for
--          covenant-breaking (the Deut 28 judgment on the sin, never the Torah) — yet the true temple,
--          the overcomer's pillar, can never be broken.
--   7:23-26 — the molten sea resting on twelve oxen (three toward each quarter) = the great laver of
--          cleansing borne by the twelve tribes; the washing of the priests for the holy service
--          (Exod 30:18-21, wash that they die not). It opens forward to the sea of glass before the
--          throne (Rev 4:6) — the cleansing perfected. The twelve oxen = the two-house people of the
--          twelve tribes bearing the cleansing of Yahuah.

CREATE TEMP VIEW _s342_1ki07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Jachin and Boaz — the overcomer a pillar in the temple (7:21)
    ('canon','1-kings',7,21,'canon','2-chronicles',3,17,'free',E'*And he reared up the pillars before the temple, one on the right hand, and the other on the left; and called the name of that on the right hand Jachin, and the name of that on the left Boaz* (2 Chronicles 3:17). The Chronicler records the same two named pillars Solomon set at the porch: *and he set up the right pillar, and called the name thereof Jachin: and he set up the left pillar, and called the name thereof Boaz* (1 Kings 7:21). Jachin — *he shall establish*; Boaz — *in him is strength*: the two witnesses that Yahuah establishes and strengthens his house.'),
    ('canon','1-kings',7,21,'canon','jeremiah',52,17,'free',E'*Also the pillars of brass that were in the house of Yahuah (LORD), and the bases, and the brasen sea that was in the house of Yahuah (LORD), the Chaldeans brake, and carried all the brass of them to Babylon* (Jeremiah 52:17). The very pillars Solomon *set up... in the porch of the temple* (1 Kings 7:21) were broken and carried away when the house was given over — the Deuteronomy 28 judgment upon covenant-breaking, never upon the Torah; the brass pillars fall, but what they witnessed — the established, strengthened house — endures past Babylon.'),
    ('canon','1-kings',7,21,'canon','jeremiah',52,21,'free',E'*And concerning the pillars, the height of one pillar was eighteen cubits; and a fillet of twelve cubits did compass it; and the thickness thereof was four fingers: it was hollow* (Jeremiah 52:21). Jeremiah measures the fallen pillar by the exact dimension Hiram cast — *two pillars of brass, of eighteen cubits high apiece: and a line of twelve cubits did compass either of them about* (1 Kings 7:15) — so that the reader knows these are the same Jachin and Boaz, carried to Babylon for the sin of the house.'),
    ('canon','1-kings',7,21,'canon','revelation',3,12,'free',E'*Him that overcometh will I make a pillar in the temple of my Elohim (God), and he shall go no more out: and I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem* (Revelation 3:12). Jachin and Boaz, *set up... in the porch of the temple* (1 Kings 7:21), are the type the Formed Son fills: the overcomer is himself made a pillar in the true temple, established and never again removed — the standing the bronze pillars only foreshadowed, with the very Name written upon him.'),

    -- THREAD 2: the molten sea on the twelve oxen — the washing for the holy service (7:23-26)
    ('canon','1-kings',7,23,'canon','2-chronicles',4,2,'free',E'*Also he made a molten sea of ten cubits from brim to brim, round in compass, and five cubits the height thereof; and a line of thirty cubits did compass it round about* (2 Chronicles 4:2). The Chronicler gives the same great laver Hiram cast: *And he made a molten sea, ten cubits from the one brim to the other: it was round all about, and his height was five cubits: and a line of thirty cubits did compass it round about* (1 Kings 7:23) — the vessel that held the water of cleansing for the house.'),
    ('canon','1-kings',7,25,'canon','2-chronicles',4,4,'free',E'*It stood upon twelve oxen, three looking toward the north, and three looking toward the west, and three looking toward the south, and three looking toward the east: and the sea was set above upon them, and all their hinder parts were inward* (2 Chronicles 4:4). Word for word with Solomon''s sea — *It stood upon twelve oxen, three looking toward the north, and three looking toward the west, and three looking toward the south, and three looking toward the east* (1 Kings 7:25): the twelve oxen bear the sea toward all four quarters, the twelve tribes of Yashar''el (Israel) bearing up the cleansing of Yahuah.'),
    ('canon','1-kings',7,23,'canon','2-chronicles',4,6,'free',E'*He made also ten lavers, and put five on the right hand, and five on the left, to wash in them: such things as they offered for the burnt offering they washed in them; but the sea was for the priests to wash in* (2 Chronicles 4:6). Chronicles names the purpose of the great sea Solomon made: it *was for the priests to wash in* — the washing that fits them for the holy service, the cleansing the molten sea (1 Kings 7:23) was cast to hold.'),
    ('canon','1-kings',7,23,'canon','exodus',30,18,'free',E'*Thou shalt also make a laver of brass, and his foot also of brass, to wash withal: and thou shalt put it between the tabernacle of the congregation and the altar, and thou shalt put water therein* (Exodus 30:18). The molten sea of brass (1 Kings 7:23) is the temple''s great answer to the tabernacle laver: the same brass vessel of water set for the washing, now grown to a sea borne by the twelve tribes.'),
    ('canon','1-kings',7,23,'canon','exodus',30,20,'free',E'*When they go into the tabernacle of the congregation, they shall wash with water, that they die not; or when they come near to the altar to minister, to burn offering made by fire unto Yahuah (LORD)* (Exodus 30:20). The water the molten sea held (1 Kings 7:23) is the water of life-or-death: the priests *wash with water, that they die not* before they minister — the cleansing the holy service requires, no man drawing near unwashed.'),
    ('canon','1-kings',7,23,'canon','revelation',4,6,'free',E'*And before the throne there was a sea of glass like unto crystal: and in the midst of the throne, and round about the throne, were four beasts full of eyes before and behind* (Revelation 4:6). The molten sea of cleansing in the earthly house (1 Kings 7:23) opens forward to its heavenly antitype: the sea of glass like crystal before the throne — the cleansing made perfect and still, where the washed stand before Yahuah.'),

    -- THREAD 3: all the vessels of bright brass — the work finished (7:40,45,51)
    ('canon','1-kings',7,40,'canon','2-chronicles',4,11,'free',E'*And Huram made the pots, and the shovels, and the basons. And Huram finished the work that he was to make for king Solomon for the house of Elohim (God)* (2 Chronicles 4:11). The Chronicler closes Hiram''s labour as Kings does — *And Hiram made the lavers, and the shovels, and the basons. So Hiram made an end of doing all the work that he made king Solomon for the house of Yahuah (LORD)* (1 Kings 7:40): the craftsman of Tyre brings the whole furnishing of the house to completion.'),
    ('canon','1-kings',7,45,'canon','2-chronicles',4,16,'free',E'*The pots also, and the shovels, and the fleshhooks, and all their instruments, did Huram his father make to king Solomon for the house of Yahuah (LORD) of bright brass* (2 Chronicles 4:16). Every vessel for the holy worship is of bright brass in both witnesses: *the pots, and the shovels, and the basons: and all these vessels, which Hiram made to king Solomon for the house of Yahuah (LORD), were of bright brass* (1 Kings 7:45) — the instruments of the service, burnished and ready.'),
    ('canon','1-kings',7,51,'canon','2-chronicles',5,1,'free',E'*Thus all the work that Solomon made for the house of Yahuah (LORD) was finished: and Solomon brought in all the things that David his father had dedicated; and the silver, and the gold, and all the instruments, put he among the treasures of the house of Elohim (God)* (2 Chronicles 5:1). Kings ends the building with the same finishing and the same act of remembrance — *So was ended all the work that king Solomon made for the house of Yahuah (LORD). And Solomon brought in the things which David his father had dedicated... did he put among the treasures of the house of Yahuah (LORD)* (1 Kings 7:51): the work is finished, and the father''s dedicated treasure is gathered into the house of the Name.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple',
       E'Jachin and Boaz — the overcomer a pillar in the temple',
       E'Hiram of Tyre, the widow''s son of Naphtali *filled with wisdom, and understanding, and cunning to work all works in brass* (1 Kings 7:14), casts two great pillars: *two pillars of brass, of eighteen cubits high apiece: and a line of twelve cubits did compass either of them about* (1 Kings 7:15). And he sets them at the threshold of the house and names them: *And he set up the pillars in the porch of the temple: and he set up the right pillar, and called the name thereof Jachin: and he set up the left pillar, and called the name thereof Boaz* (1 Kings 7:21). The names are a confession standing in bronze — Jachin, *he shall establish*; Boaz, *in him is strength*: Yahuah establishes the house and Yahuah is its strength. The Chronicler records the same two named pillars: *and called the name of that on the right hand Jachin, and the name of that on the left Boaz* (2 Chronicles 3:17). When the house is given over for covenant-breaking, the pillars themselves are broken: *the pillars of brass that were in the house of Yahuah (LORD)... the Chaldeans brake, and carried all the brass of them to Babylon* (Jeremiah 52:17), and Jeremiah measures the fallen pillar by Hiram''s exact cubits — *the height of one pillar was eighteen cubits; and a fillet of twelve cubits did compass it* (Jeremiah 52:21) — that no reader mistake which pillars fell. Yet the witness Jachin and Boaz bore can never be carried to Babylon, for the Formed Son fills the type: *Him that overcometh will I make a pillar in the temple of my Elohim (God), and he shall go no more out: and I will write upon him the name of my Elohim (God), and the name of the city of my Elohim (God), which is new Jerusalem* (Revelation 3:12). The overcomer is himself made the established, strengthened pillar in the true temple — set up, never again removed, the Name written upon him.',
       sv.verse_id, ev.verse_id, 'free', 38050
  FROM _s342_1ki07_lookup sv, _s342_1ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=7 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service',
       E'The molten sea on the twelve oxen — the washing for the holy service',
       E'Hiram casts a great basin of bronze for the house: *And he made a molten sea, ten cubits from the one brim to the other: it was round all about, and his height was five cubits: and a line of thirty cubits did compass it round about* (1 Kings 7:23). It does not rest on the ground but upon a living burden: *It stood upon twelve oxen, three looking toward the north, and three looking toward the west, and three looking toward the south, and three looking toward the east: and the sea was set above upon them* (1 Kings 7:25) — the twelve tribes of Yashar''el (Israel), facing every quarter of the earth, bearing up the cleansing of Yahuah. The Chronicler gives the same sea word for word and names its use: it *was for the priests to wash in* (2 Chronicles 4:6). This is the temple''s great answer to the tabernacle laver: *Thou shalt also make a laver of brass, and his foot also of brass, to wash withal... and thou shalt put water therein* (Exodus 30:18), the washing without which the priest may not draw near — *they shall wash with water, that they die not* (Exodus 30:20). Cleansing is not optional to the holy service; it is life or death at the threshold. And the molten sea is itself a shadow: John sees the cleansing made perfect and still before the throne — *before the throne there was a sea of glass like unto crystal* (Revelation 4:6). The twelve oxen bearing the sea toward all four winds are the two-house people of the twelve tribes upholding the cleansing of Yahuah, until the washed stand as a sea of glass before him.',
       sv.verse_id, ev.verse_id, 'free', 38053
  FROM _s342_1ki07_lookup sv, _s342_1ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=7 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-7-all-the-vessels-of-bright-brass-the-work-finished',
       E'All the vessels of bright brass — the work finished',
       E'The chapter closes with the whole furnishing of the house brought to completion. Hiram finishes the bronze: *And Hiram made the lavers, and the shovels, and the basons. So Hiram made an end of doing all the work that he made king Solomon for the house of Yahuah (LORD)* (1 Kings 7:40), and every instrument of the service is burnished and ready — *the pots, and the shovels, and the basons: and all these vessels, which Hiram made to king Solomon for the house of Yahuah (LORD), were of bright brass* (1 Kings 7:45). The Chronicler closes the same labour the same way: *And Huram finished the work that he was to make for king Solomon for the house of Elohim (God)* (2 Chronicles 4:11), *all their instruments, did Huram his father make to king Solomon for the house of Yahuah (LORD) of bright brass* (2 Chronicles 4:16). Then the building is sealed with an act of remembrance: *So was ended all the work that king Solomon made for the house of Yahuah (LORD). And Solomon brought in the things which David his father had dedicated; even the silver, and the gold, and the vessels, did he put among the treasures of the house of Yahuah (LORD)* (1 Kings 7:51) — and Chronicles echoes, *Thus all the work that Solomon made for the house of Yahuah (LORD) was finished: and Solomon brought in all the things that David his father had dedicated* (2 Chronicles 5:1). The work is finished, and the father''s long-dedicated treasure is gathered at last into the house of the Name — the son completing what the father purposed and laid up.',
       sv.verse_id, ev.verse_id, 'free', 38056
  FROM _s342_1ki07_lookup sv, _s342_1ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=7 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: Jachin and Boaz
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*and called the name of that on the right hand Jachin, and the name of that on the left Boaz* (2 Chronicles 3:17) — the parallel record of the same two named pillars.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the pillars of brass that were in the house of Yahuah (LORD)... the Chaldeans brake, and carried all the brass of them to Babylon* (Jeremiah 52:17) — the pillars broken for covenant-breaking, the Deut 28 judgment on the sin, not the Torah.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the height of one pillar was eighteen cubits; and a fillet of twelve cubits did compass it* (Jeremiah 52:21) — measured by Hiram''s exact cubits, so the reader knows these are Jachin and Boaz.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Him that overcometh will I make a pillar in the temple of my Elohim (God), and he shall go no more out... and I will write upon him the name of my Elohim (God)* (Revelation 3:12) — the overcomer himself made the established, strengthened pillar in the true temple.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-jachin-and-boaz-the-overcomer-a-pillar-in-the-temple'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the molten sea on the twelve oxen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Also he made a molten sea of ten cubits from brim to brim, round in compass, and five cubits the height thereof* (2 Chronicles 4:2) — the parallel record of the same great laver.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*It stood upon twelve oxen, three looking toward the north... three toward the west... three toward the south... three toward the east* (2 Chronicles 4:4) — the twelve tribes facing every quarter, bearing the sea of cleansing.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*but the sea was for the priests to wash in* (2 Chronicles 4:6) — Chronicles names the purpose: the washing that fits the priests for the holy service.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt also make a laver of brass... to wash withal... and thou shalt put water therein* (Exodus 30:18) — the tabernacle laver the molten sea answers and enlarges.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they shall wash with water, that they die not... when they come near to the altar to minister* (Exodus 30:20) — cleansing is life or death at the threshold of the holy service.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And before the throne there was a sea of glass like unto crystal* (Revelation 4:6) — the cleansing made perfect and still, the heavenly antitype of the molten sea.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-the-molten-sea-on-the-twelve-oxen-the-washing-for-the-holy-service'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: all the vessels of bright brass — the work finished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Huram finished the work that he was to make for king Solomon for the house of Elohim (God)* (2 Chronicles 4:11) — the parallel close of Hiram''s bronze labour.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=40
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-all-the-vessels-of-bright-brass-the-work-finished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all their instruments, did Huram his father make to king Solomon for the house of Yahuah (LORD) of bright brass* (2 Chronicles 4:16) — every vessel of the service burnished and ready.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=45
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-all-the-vessels-of-bright-brass-the-work-finished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thus all the work that Solomon made for the house of Yahuah (LORD) was finished: and Solomon brought in all the things that David his father had dedicated* (2 Chronicles 5:1) — the work sealed, the father''s dedicated treasure gathered into the house.'
  FROM cross_reference_threads t
  JOIN _s342_1ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=7 AND sv.verse_number=51
  JOIN _s342_1ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-7-all-the-vessels-of-bright-brass-the-work-finished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_8.sql (1 Kings 8) -----
-- Chapter: 1 Kings 8 — THE DEDICATION OF THE TEMPLE. Solomon assembles the elders of Yashar'el
-- and brings up the ark into the oracle, the most holy place, under the wings of the cherubims
-- (8:1-9). When the priests come out, *the cloud filled the house of Yahuah... for the glory of
-- Yahuah had filled the house* (8:10-11) — the Formed Glory-Presence taking up the house as it
-- took the tabernacle. Solomon blesses, recounts the Davidic promise fulfilled (8:14-21), then
-- prays the great dedication prayer: there is no Elohim like Yahuah, who keepeth covenant and
-- mercy (8:23); yet *the heaven and heaven of heavens cannot contain thee* (8:27) — the formless
-- Father uncontainable, while the Presence dwells. He prays the house into a house of prayer
-- toward which all supplication is made (8:29-30), even the stranger from a far country who comes
-- for the Name (8:41-43), and — the keystone — the scattered captives who bethink themselves,
-- repent, and return with all their heart (8:46-50). He closes blessing Yahuah who *hath given
-- rest unto his people Yashar'el... there hath not failed one word of all his good promise* (8:56).
-- Tag: 1ki08   Temp view: _s342_1ki08_lookup
-- Sort band: base 38075, step 3 -> threads at 38075, 38078, 38081, 38084, 38087, 38090, 38093, 38096 (8 threads)
-- Source of EVERY row: 'canon','1-kings',8,v
--
-- 1 Kings 8 coverage:
--   ★★★ v.10-11 (the cloud filled the house of Yahuah... for the glory of Yahuah had filled the house)
--        NT:     ★ John 1:14 (the Word made flesh, dwelt among us, we beheld his glory), ★ Revelation
--                21:3 (the tabernacle of Elohim is with men) — THREAD 1
--        Extras: none warranted (the Glory-filling carried best by the canon tabernacle/temple parallels)
--        Tanakh: ★ Exodus 40:34-35 (the cloud covered the tent... the glory filled the tabernacle),
--                2 Chronicles 5:13-14 (the house filled with a cloud... priests could not stand),
--                2 Chronicles 7:1-2 (the glory of Yahuah filled the house) — THREAD 1
--   ★ v.12-13 (Yahuah said that he would dwell in the thick darkness... a settled place... for ever)
--        NT:     none warranted distinct
--        Extras: none warranted distinct
--        Tanakh: ★ Psalm 132:13-14 (Yahuah hath chosen Zion... This is my rest for ever: here will I
--                dwell), Exodus 40:34 (the cloud — the thick darkness Yahuah dwells in) — THREAD 2
--   ★★ v.23 (there is no Elohim like thee... who keepest covenant and mercy)
--        NT:     none warranted distinct (the covenant-keeping El is a Torah/Tanakh confession)
--        Extras: none warranted distinct
--        Tanakh: ★ Deuteronomy 7:9 (the faithful Elohim, which keepeth covenant and mercy... to a
--                thousand generations), Nehemiah 1:5 (the great and terrible Elohim, that keepeth
--                covenant and mercy for them that love him and keep his commandments) — THREAD 3
--   ★★★ v.27 (the heaven and heaven of heavens cannot contain thee; how much less this house?)
--        NT:     ★★ Acts 7:48-49 (the Most High dwelleth not in temples made with hands... Heaven is
--                my throne, and earth is my footstool) — THREAD 4
--        Extras: ★ Wisdom of Solomon 9:8 (you commanded me to build a temple... a resemblance of the
--                holy tabernacle, which you have prepared from the beginning) — THREAD 4
--        Tanakh: ★★ 2 Chronicles 6:18 (verbatim parallel: heaven and the heaven of heavens cannot
--                contain thee), Isaiah 66:1 (The heaven is my throne, and the earth is my footstool) — THREAD 4
--   ★★ v.29-30 (thine eyes open toward this house... hearken to the prayer which thy servant shall
--          make toward this place)
--        NT:     ★ Luke 18:13 (the publican... smote upon his breast, saying, Elohim be merciful to me) — THREAD 5
--        Extras: none warranted distinct
--        Tanakh: ★ Daniel 6:10 (his windows being open... toward Jerusalem, he kneeled... and prayed) — THREAD 5
--   ★★ v.41-43 (the stranger... out of a far country for thy name's sake... that all people of the
--          earth may know thy name)
--        NT:     none warranted distinct (the Name-to-the-nations gathering weighed in Tanakh + extras)
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah), Tobit 14:6-7
--                (all nations shall turn, and fear Yahuah... his people shall confess Yahuah) — THREAD 6
--        Tanakh: ★★ Isaiah 56:6-7 (the sons of the stranger, that join themselves to Yahuah... mine
--                house shall be called an house of prayer for all people) — THREAD 6
--   ★★★ v.46-50 (carried away captives... bethink themselves... repent... return unto thee with all
--          their heart... then hear... and forgive)
--        NT:     none warranted distinct (the captivity-return = two-house regathering, weighed Tanakh + extras)
--        Extras: ★★ Baruch 2:30-34 (in the land of their captivities they shall remember themselves...
--                return... and I will bring them again into the land) — THREAD 7
--        Tanakh: ★★★ Deuteronomy 30:1-4 (thou shalt call them to mind among all the nations... return...
--                gather thee from all the nations), Nehemiah 1:8-9 (if ye turn unto me... yet will I
--                gather them from thence) — THREAD 7
--   ★ v.56 (Blessed be Yahuah, that hath given rest unto his people... there hath not failed one word
--          of all his good promise)
--        NT:     ★ Hebrews 4:8-9 (if Yahusha had given them rest... there remaineth a rest to the people
--                of Elohim) — THREAD 8
--        Extras: none warranted distinct
--        Tanakh: ★ Joshua 21:45 (There failed not ought of any good thing which Yahuah had spoken),
--                Joshua 23:14 (not one thing hath failed of all the good things) — THREAD 8
--   v.14-21 (the Davidic promise fulfilled — thy son... he shall build the house) — held in prose
--        (carried in the dedication frame; the seed/throne weave belongs to 2 Samuel 7 chapters)
--
-- THREADS (slug — target libraries):
--   1ki08-glory-filled-the-house            canon NT(John,Rev) + Tanakh(Exod,2Chr)         [free]
--   1ki08-dwell-in-thick-darkness-rest      canon Tanakh(Ps132,Exod)                       [free]
--   1ki08-no-elohim-like-thee-covenant      canon Tanakh(Deut,Neh)                         [free]
--   1ki08-heaven-of-heavens-cannot-contain  canon Tanakh(2Chr,Isa) + NT(Acts) + extras(Wis)[extras]
--   1ki08-house-of-prayer-toward-this-place canon Tanakh(Dan) + NT(Luke)                    [free]
--   1ki08-the-stranger-for-thy-names-sake   canon Tanakh(Isa56) + extras(Tobit)            [extras]
--   1ki08-captivity-and-return-regathering  canon Tanakh(Deut30,Neh) + extras(Baruch)      [extras]
--   1ki08-rest-not-one-word-of-promise      canon Tanakh(Josh) + NT(Heb)                   [free]

CREATE TEMP VIEW _s342_1ki08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the cloud filled the house — the Glory-Presence
    ('canon','1-kings',8,11,'canon','exodus',40,34,'free',
      E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34). What filled the tabernacle at its rearing fills the temple at its dedication: *the cloud filled the house of Yahuah (LORD)... for the glory of Yahuah (LORD) had filled the house* (1 Kings 8:11). The same Glory-Presence that led Yashar''el (Israel) through the wilderness now takes up the settled house — one Presence, one Formed Glory, dwelling among his people.'),
    ('canon','1-kings',8,11,'canon','exodus',40,35,'free',
      E'*And Moses was not able to enter into the tent of the congregation, because the cloud abode thereon, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:35). As Moses could not enter for the cloud, so *the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house* (1 Kings 8:11). The pattern is exact — when the Glory comes in fulness, flesh must give way; the ministering hand stops before the Presence.'),
    ('canon','1-kings',8,10,'canon','2-chronicles',5,13,'free',
      E'*the trumpeters and singers were as one... when they lifted up their voice... and praised Yahuah (LORD)... that then the house was filled with a cloud, even the house of Yahuah (LORD)* (2 Chronicles 5:13). The Chronicler tells the same moment from within the worship: as the song rose, *the cloud filled the house of Yahuah (LORD)* (1 Kings 8:10). The Glory descends upon the praise of the gathered house — the cloud answers the song.'),
    ('canon','1-kings',8,11,'canon','2-chronicles',5,14,'free',
      E'*So that the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God)* (2 Chronicles 5:14). Word for word the parallel to 1 Kings 8:11: *the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house*. Two witnesses to the one descent — the Presence so weighty that the priesthood itself falls still.'),
    ('canon','1-kings',8,11,'canon','2-chronicles',7,1,'free',
      E'*Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1). After the prayer the Glory comes a second time, sealing the dedication with fire — the same *glory of Yahuah... had filled the house* that fell at the ark''s entering (1 Kings 8:11). The house is doubly claimed: by cloud at the ark, by fire at the altar.'),
    ('canon','1-kings',8,11,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The Glory that *filled the house* (1 Kings 8:11) is the Formed Word — the expressed Presence drawn from the Formless Father. The verb *dwelt* is the tabernacling word: the same Glory that took the tent and then the temple at last took flesh, and they beheld it.'),
    ('canon','1-kings',8,11,'canon','revelation',21,3,'free',
      E'*Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The dedication of Solomon''s house — *the glory of Yahuah (LORD) had filled the house* (1 Kings 8:11) — is a down-payment on the consummation, when the Glory dwells with men without veil or cloud. Tent, temple, and flesh all point here: Elohim tabernacling with his people for ever.'),

    -- THREAD 2 (★): dwell in the thick darkness — the settled place, the rest for ever
    ('canon','1-kings',8,13,'canon','psalms',132,13,'free',
      E'*For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13). Solomon''s word — *I have surely built thee an house to dwell in, a settled place for thee to abide in for ever* (1 Kings 8:13) — answers the Psalm''s election of Zion. The house Solomon built is not the king''s choosing but Yahuah''s desire; Zion is the habitation he himself has chosen.'),
    ('canon','1-kings',8,13,'canon','psalms',132,14,'free',
      E'*This is my rest for ever: here will I dwell; for I have desired it* (Psalm 132:14). The Psalm gives Yahuah''s own answer to Solomon''s *a settled place for thee to abide in for ever* (1 Kings 8:13): *here will I dwell*. The temple is the place of his rest — the Presence settled, no longer a tent moved from station to station, but a dwelling he himself has desired.'),
    ('canon','1-kings',8,12,'canon','exodus',40,34,'free',
      E'*Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34). Solomon names the cloud the thick darkness Yahuah dwells in: *Yahuah (LORD) said that he would dwell in the thick darkness* (1 Kings 8:12). The covering cloud of the tabernacle is that very thick darkness — the veiled Glory, present yet shrouded, so that none may look upon the Formless and live.'),

    -- THREAD 3 (★★): there is no Elohim like thee — the covenant-keeping El
    ('canon','1-kings',8,23,'canon','deuteronomy',7,9,'free',
      E'*Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9). Solomon prays the Torah back to Yahuah: *there is no Elohim (God) like thee... who keepest covenant and mercy with thy servants that walk before thee with all their heart* (1 Kings 8:23). The covenant-keeping is bound to love-and-commandment-keeping — the keeping flows both ways, and the Torah is the faithful El''s own pledge, never the curse.'),
    ('canon','1-kings',8,23,'canon','nehemiah',1,5,'free',
      E'*I beseech thee, O Yahuah Elohim (LORD God) of heaven, the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5). Centuries after Solomon, Nehemiah opens his prayer with the same confession — *that keepeth covenant and mercy* (1 Kings 8:23). From the dedication to the return-from-exile, one unchanging El: the One who keeps covenant and mercy with those who love him and keep his commandments.'),

    -- THREAD 4 (★★★): heaven of heavens cannot contain thee — the Formless uncontained
    ('canon','1-kings',8,27,'canon','2-chronicles',6,18,'free',
      E'*But will Elohim (God) in very deed dwell with men on the earth? behold, heaven and the heaven of heavens cannot contain thee; how much less this house which I have built!* (2 Chronicles 6:18). The verbatim parallel to Solomon''s wonder: *the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The Formless Father is uncontainable — no house holds him — yet the Formed Presence condescends to dwell. The temple does not box in El; it is the place he chooses to set his Name.'),
    ('canon','1-kings',8,27,'canon','isaiah',66,1,'free',
      E'*Thus saith Yahuah (LORD), The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me? and where is the place of my rest?* (Isaiah 66:1). Isaiah voices Solomon''s own humility made prophecy — *the heaven and heaven of heavens cannot contain thee; how much less this house* (1 Kings 8:27). The Most High is not housed by hands; heaven itself is but his throne. The dedication never imagines the temple confines him — it is grace that he dwells there at all.'),
    ('canon','1-kings',8,27,'canon','acts',7,48,'free',
      E'*Howbeit the El Elyon (most High) dwelleth not in temples made with hands; as saith the prophet* (Acts 7:48). Stephen speaks straight from Solomon''s confession: *the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The temple was never the cage of the Most High — Solomon said so at the dedication itself. The Formless El is not held by walls; he is enthroned in the heaven of heavens and dwells where he wills.'),
    ('canon','1-kings',8,27,'canon','acts',7,49,'free',
      E'*Heaven is my throne, and earth is my footstool: what house will ye build me? saith Yahuah (Lord): or what is the place of my rest?* (Acts 7:49). Stephen seals the point with Isaiah''s words, the same wonder Solomon prayed — *how much less this house that I have builded?* (1 Kings 8:27). The Most High needs no house; heaven is his throne. The dwelling is condescension, not containment — the Formless cannot be enclosed.'),
    ('canon','1-kings',8,27,'apocrypha','the-wisdom-of-solomon',9,8,'extras',
      E'*You have commanded me to build a temple upon your holy mount, and an altar in the city in which you dwellest, a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8). Wisdom puts into Solomon''s mouth the very theology of his dedication prayer: the temple is *a resemblance of the holy tabernacle* — an earthly likeness of the heavenly pattern, not a container for the uncontainable. So Solomon marvels, *the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The house is a shadow of the true dwelling Yahuah prepared from the beginning.'),

    -- THREAD 5 (★★): the house of prayer — eyes open toward this place
    ('canon','1-kings',8,29,'canon','daniel',6,10,'free',
      E'*Now when Daniel knew that the writing was signed, he went into his house; and his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he did aforetime* (Daniel 6:10). Solomon prayed that Yahuah''s eyes would be *open toward this house... the place of which thou hast said, My name shall be there* (1 Kings 8:29) — and that the scattered would *pray toward this place* (8:30). Daniel, in Babylon, does exactly that: windows open toward Jerusalem, he prays toward the house, taking Solomon''s petition at its word from the land of captivity.'),
    ('canon','1-kings',8,30,'canon','luke',18,13,'free',
      E'*And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13). Solomon built the house for exactly this cry: *hearken thou to the supplication of thy servant, and of thy people... and when thou hearest, forgive* (1 Kings 8:30). The publican''s broken plea for mercy is the prayer toward the place answered — the supplication of the contrite, heard in heaven and forgiven.'),

    -- THREAD 6 (★★): the stranger for thy Name's sake — the Name to the nations
    ('canon','1-kings',8,43,'canon','isaiah',56,6,'free',
      E'*Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD), to be his servants, every one that keepeth the sabbath from polluting it, and taketh hold of my covenant* (Isaiah 56:6). Solomon''s stranger *that cometh out of a far country for thy name''s sake* (1 Kings 8:41) is no false-inclusion: he is the sojourner who joins himself to Yahuah, loves the Name, keeps the sabbath, and takes hold of the covenant. He does not abolish the covenant by coming — he enters it.'),
    ('canon','1-kings',8,43,'canon','isaiah',56,7,'free',
      E'*Even them will I bring to my holy mountain, and make them joyful in my house of prayer... for mine house shall be called an house of prayer for all people* (Isaiah 56:7). Solomon prayed *that all people of the earth may know thy name... and that they may know that this house... is called by thy name* (1 Kings 8:43). Isaiah answers: the house Solomon dedicated *shall be called an house of prayer for all people* — the Name made known to the nations, the joined stranger brought to the holy mountain.'),
    ('canon','1-kings',8,43,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). Tobit sings what Solomon prayed: *that all people of the earth may know thy name* (1 Kings 8:43). The far country of Solomon''s stranger becomes the *many nations... from far* who come to the Name — not Israel replaced, but the Name carried out and the nations drawn in to praise the King of heaven.'),
    ('canon','1-kings',8,43,'apocrypha','tobit',14,6,'extras',
      E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). The end of Solomon''s petition — *that all people of the earth may know thy name, to fear thee* (1 Kings 8:43) — is Tobit''s hope: all nations turning, fearing Yahuah, casting away their idols. The Name made known is not a tolerance of idols but their burial; the nations come to fear the one true El.'),
    ('canon','1-kings',8,43,'apocrypha','tobit',14,7,'extras',
      E'*So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people; and all those which love Yahuah (God) in truth and justice shall rejoice* (Tobit 14:7). Solomon''s stranger comes *that all people of the earth may know thy name* (1 Kings 8:43) — and Tobit completes the picture: the nations praise while *his people* are confessed and exalted. The ingathering of the stranger does not displace the people; both rejoice, those who love Yahuah in truth and justice.'),

    -- THREAD 7 (★★★): the captivity-and-return prayer — the two-house regathering through repentance
    ('canon','1-kings',8,47,'canon','deuteronomy',30,1,'free',
      E'*And it shall come to pass, when all these things are come upon thee, the blessing and the curse... and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1). Solomon prays the Deuteronomy 30 pattern straight into the dedication: *if they shall bethink themselves in the land whither they were carried captives* (1 Kings 8:47). To *bethink themselves* is to *call them to mind among all the nations* — the first turn of the scattered heart toward home.'),
    ('canon','1-kings',8,48,'canon','deuteronomy',30,2,'free',
      E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... thou and thy children, with all thine heart, and with all thy soul* (Deuteronomy 30:2). Solomon''s *and so return unto thee with all their heart, and with all their soul, in the land of their enemies* (1 Kings 8:48) is Deuteronomy 30:2 word for word. The return is whole-hearted obedience — turning back to the voice, the Torah taken up again, not abandoned.'),
    ('canon','1-kings',8,48,'canon','deuteronomy',30,3,'free',
      E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). When the captives *return... with all their heart* (1 Kings 8:48), this is Yahuah''s answer: he gathers them *from all the nations*. This is the two-house regathering — Yahudah (Judah) and the scattered house of Yashar''el (Israel) brought back through repentance, the divided people made one again.'),
    ('canon','1-kings',8,48,'canon','deuteronomy',30,4,'free',
      E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). No distance is too far for the regathering Solomon prays toward — *the land of the enemy, far or near* (1 Kings 8:46). Even the *outmost parts of heaven* yield up the scattered. The Shepherd who scattered Yashar''el (Israel) will fetch him home.'),
    ('canon','1-kings',8,47,'canon','nehemiah',1,8,'free',
      E'*Remember, I beseech thee, the word that thou commandedst thy servant Moses, saying, If ye transgress, I will scatter you abroad among the nations* (Nehemiah 1:8). Nehemiah pleads the same covenant Solomon built into his prayer — the scattering for transgression, *carried them away captives unto the land of the enemy* (1 Kings 8:46). The scattering is the Deuteronomy 28 exile-judgment for covenant-breaking, the very condition Solomon foresaw at the dedication.'),
    ('canon','1-kings',8,48,'canon','nehemiah',1,9,'free',
      E'*But if ye turn unto me, and keep my commandments, and do them; though there were of you cast out unto the uttermost part of the heaven, yet will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:9). Nehemiah prays the turn Solomon prayed — *so return unto thee with all their heart* (1 Kings 8:48) — and the gathering follows: brought back to *the place... to set my name there*, the very house Solomon dedicated. The regathering ends where the prayer began: at the Name.'),
    ('canon','1-kings',8,47,'apocrypha','baruch-with-the-letter-of-jeremiah',2,30,'extras',
      E'*For I knew that they would not hear me, because it is a stiffnecked people: but in the land of their captivities they shall remember themselves* (Baruch 2:30). Baruch echoes Solomon almost word for word — *yet if they shall bethink themselves in the land whither they were carried captives* (1 Kings 8:47). The *remember themselves* of Baruch is the *bethink themselves* of the dedication prayer: the first stirring of repentance in the land of exile.'),
    ('canon','1-kings',8,48,'apocrypha','baruch-with-the-letter-of-jeremiah',2,34,'extras',
      E'*And I will bring them again into the land which I promised with an oath to their fathers, Abraham, Isaac, and Jacob, and they shall be lords of it: and I will increase them, and they shall not be diminished* (Baruch 2:34). The return Solomon prays toward — *pray unto thee toward their land, which thou gavest unto their fathers* (1 Kings 8:48) — is the oath-bound regathering: brought again into the land sworn to Abraham, Isaac, and Jacob. The seed of promise, the paternal covenant line, gathered home and increased, no more diminished.'),

    -- THREAD 8 (★): rest given — not one word of his promise has failed
    ('canon','1-kings',8,56,'canon','joshua',21,45,'free',
      E'*There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45). Solomon''s benediction echoes Joshua''s — *there hath not failed one word of all his good promise* (1 Kings 8:56). From the conquest-rest under Joshua to the temple-rest under Solomon, the verdict is one: not one word fails. The faithful El keeps every good thing he has spoken.'),
    ('canon','1-kings',8,56,'canon','joshua',23,14,'free',
      E'*ye know in all your hearts and in all your souls, that not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14). Joshua''s farewell and Solomon''s dedication speak the identical testimony — *there hath not failed one word of all his good promise* (1 Kings 8:56). The witness is doubled across the generations: every good word of Yahuah stands; not one of them falls to the ground.'),
    ('canon','1-kings',8,56,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). Solomon blessed Yahuah *that hath given rest unto his people Yashar''el (Israel)* (1 Kings 8:56) — yet Hebrews shows the rest reaches further still: *if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day* (Hebrews 4:8). The temple-rest is real but not final; a sabbath-rest remains, the consummation toward which every given rest points.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-glory-filled-the-house',
       E'The cloud filled the house — the Glory-Presence taking up the temple',
       E'When the priests bring the ark into the oracle and come out, *the cloud filled the house of Yahuah (LORD), So that the priests could not stand to minister because of the cloud: for the glory of Yahuah (LORD) had filled the house of Yahuah (LORD)* (1 Kings 8:10-11). This is the same descent that crowned the tabernacle: *Then a cloud covered the tent of the congregation, and the glory of Yahuah (LORD) filled the tabernacle. And Moses was not able to enter... because the cloud abode thereon* (Exodus 40:34-35). Tent and temple receive the one Presence; when the Glory comes in fulness, flesh gives way and ministry stops. The Chronicler shows the cloud descending upon the praise — *as the trumpeters and singers were as one... the house was filled with a cloud* (2 Chronicles 5:13) — and a second time as fire after the prayer: *the fire came down from heaven... and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1). This Glory is the Formed Word, the expressed Presence drawn from the Formless Father — and the same Glory at last took flesh: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14), the tabernacling word. The dedication is a down-payment on the consummation, when the veil is gone: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3). Tent, temple, flesh, and the city to come — one Glory dwelling among his people.',
       sv.verse_id, ev.verse_id, 'free', 38075
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-dwell-in-thick-darkness-rest',
       E'He would dwell in the thick darkness — a settled place to abide for ever',
       E'Solomon names the descended cloud for what it is: *Yahuah (LORD) said that he would dwell in the thick darkness. I have surely built thee an house to dwell in, a settled place for thee to abide in for ever* (1 Kings 8:12-13). The thick darkness is the very *cloud* that *covered the tent of the congregation* (Exodus 40:34) — the veiled Glory, present yet shrouded, so that none looks upon the Formless and lives. And the *settled place* answers Yahuah''s own election of Zion: *For Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13); *This is my rest for ever: here will I dwell; for I have desired it* (Psalm 132:14). The house is not the king''s presumption but Yahuah''s desire — the wandering Presence of the wilderness now given a settled dwelling, the place of his rest, chosen and desired by him.',
       sv.verse_id, ev.verse_id, 'free', 38078
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-no-elohim-like-thee-covenant',
       E'There is no Elohim like thee — who keepest covenant and mercy',
       E'Solomon opens his prayer with the great confession: *Yahuah Elohim (LORD God) of Yashar''el (Israel), there is no Elohim (God) like thee, in heaven above, or on earth beneath, who keepest covenant and mercy with thy servants that walk before thee with all their heart* (1 Kings 8:23). This is the Torah''s own portrait of the faithful El: *Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9). The covenant-keeping and the commandment-keeping are bound together — the faithful El pledges himself to those who walk before him with all their heart. Centuries later Nehemiah prays the identical confession from the ruins of the exile: *the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5). From the dedication to the return, one unchanging El — and the Torah is his covenant pledge, never the curse.',
       sv.verse_id, ev.verse_id, 'free', 38081
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-heaven-of-heavens-cannot-contain',
       E'The heaven of heavens cannot contain thee — the Formless uncontained, yet dwelling',
       E'At the height of his prayer Solomon marvels: *But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). The dedication never imagines the temple boxes in the Most High — the Formless Father is uncontainable, and the house is grace, the place he chooses to set his Name, while the Formed Presence condescends to dwell. The Chronicler keeps it word for word: *heaven and the heaven of heavens cannot contain thee; how much less this house which I have built!* (2 Chronicles 6:18). Isaiah makes the wonder a prophecy: *The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1). And Stephen, on trial, speaks straight from Solomon: *the El Elyon (most High) dwelleth not in temples made with hands... Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:48-49). Even Wisdom puts the right theology in Solomon''s mouth — the temple is *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8), an earthly likeness of the heavenly pattern, never a container for the uncontainable. The house is a shadow; the dwelling is condescension, not confinement.',
       sv.verse_id, ev.verse_id, 'extras', 38084
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-house-of-prayer-toward-this-place',
       E'Thine eyes open toward this house — the place toward which the scattered pray',
       E'Solomon prays the house into a house of prayer: *That thine eyes may be open toward this house night and day, even toward the place of which thou hast said, My name shall be there: that thou mayest hearken unto the prayer which thy servant shall make toward this place. And hearken thou to the supplication of thy servant, and of thy people Yashar''el (Israel), when they shall pray toward this place... and when thou hearest, forgive* (1 Kings 8:29-30). The place becomes the direction of every plea — and Daniel, captive in Babylon, takes the petition at its word: *his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed* (Daniel 6:10). The house Solomon dedicated draws the prayers of the scattered home from exile. And the cry it is built to hear is the broken one: *the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — the supplication of the contrite, heard in heaven and forgiven.',
       sv.verse_id, ev.verse_id, 'free', 38087
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-the-stranger-for-thy-names-sake',
       E'Concerning a stranger from a far country — the Name made known to the nations',
       E'Solomon''s prayer reaches beyond Yashar''el (Israel): *Moreover concerning a stranger, that is not of thy people Yashar''el (Israel), but cometh out of a far country for thy name''s sake... Hear thou in heaven thy dwelling place, and do according to all that the stranger calleth to thee for: that all people of the earth may know thy name, to fear thee, as do thy people Yashar''el (Israel)* (1 Kings 8:41-43). This is no false inclusion that empties the covenant — it is the sojourner who comes *for thy name''s sake*, the one Isaiah describes: *the sons of the stranger, that join themselves to Yahuah (LORD), to serve him, and to love the name of Yahuah (LORD)... every one that keepeth the sabbath from polluting it, and taketh hold of my covenant* (Isaiah 56:6). He enters the covenant, he does not abolish it — and so *mine house shall be called an house of prayer for all people* (Isaiah 56:7). Tobit sings the same ingathering: *Many nations shall come from far to the name of Yahuah (God)* (Tobit 13:11); *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6); *So shall all nations praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people* (Tobit 14:7). The Name carried to the nations does not displace the people — both rejoice, those who love Yahuah in truth and justice.',
       sv.verse_id, ev.verse_id, 'extras', 38090
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=41
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-captivity-and-return-regathering',
       E'If they bethink themselves and return — the captivity-and-return prayer, the two-house regathering',
       E'The keystone of Solomon''s prayer foresees the exile and prays the way home: *If they sin against thee... and thou deliver them to the enemy, so that they carry them away captives unto the land of the enemy, far or near; Yet if they shall bethink themselves in the land whither they were carried captives, and repent, and make supplication unto thee... And so return unto thee with all their heart, and with all their soul... then hear thou their prayer... and forgive thy people* (1 Kings 8:46-50). This is the Deuteronomy 30 pattern built into the temple''s dedication: *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1); *And shalt return unto Yahuah Elohayka (the LORD thy God)... with all thine heart, and with all thy soul* (Deuteronomy 30:2); *will turn thy captivity... and will return and gather thee from all the nations* (Deuteronomy 30:3); *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4). This is the two-house regathering — Yahudah (Judah) and the scattered house of Yashar''el (Israel) brought home through repentance, the divided people made one. Nehemiah prays the same from the exile: *If ye transgress, I will scatter you abroad among the nations... But if ye turn unto me... yet will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:8-9). And Baruch echoes Solomon almost word for word: *in the land of their captivities they shall remember themselves* (Baruch 2:30); *And I will bring them again into the land which I promised with an oath to their fathers, Abraham, Isaac, and Jacob* (Baruch 2:34) — the seed of promise, the paternal covenant line, gathered home and increased, no more diminished. The scattering is the Deuteronomy 28 judgment for covenant-breaking, never the Torah itself; the return is the Torah taken up again, with all the heart.',
       sv.verse_id, ev.verse_id, 'extras', 38093
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- THREAD 8 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-8-rest-not-one-word-of-promise',
       E'Rest unto his people — not one word of all his good promise has failed',
       E'Solomon ends the dedication blessing Yahuah: *Blessed be Yahuah (LORD), that hath given rest unto his people Yashar''el (Israel), according to all that he promised: there hath not failed one word of all his good promise, which he promised by the hand of Moses his servant* (1 Kings 8:56). This is the standing verdict of the covenant. Joshua spoke it at the conquest-rest: *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45); and again in his farewell: *not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake concerning you; all are come to pass unto you, and not one thing hath failed thereof* (Joshua 23:14). From Joshua''s rest to Solomon''s rest, the testimony is one — the faithful El keeps every good word. Yet the rest is not yet final: *if Yahusha (Jesus) had given them rest, then would he not afterward have spoken of another day. There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:8-9). The temple-rest is real, and it points beyond itself to the sabbath-rest still to come — toward which not one word of the good promise will fail.',
       sv.verse_id, ev.verse_id, 'free', 38096
  FROM _s342_1ki08_lookup sv, _s342_1ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=56
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=8 AND ev.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34) — the tabernacle-filling that the temple-filling of 1 Kings 8:10-11 repeats; one Presence for tent and house.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Moses was not able to enter... because the cloud abode thereon* (Exodus 40:35) — as Moses could not enter, so the priests could not stand (1 Kings 8:11); flesh gives way before the fulness of the Glory.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the house was filled with a cloud* (2 Chronicles 5:13) — the Chronicler''s witness: the cloud descends upon the praise of the gathered house, the same cloud of 1 Kings 8:10.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the priests could not stand to minister by reason of the cloud: for the glory of Yahuah (LORD) had filled the house of Elohim (God)* (2 Chronicles 5:14) — word for word the parallel to 1 Kings 8:11; two witnesses to the one descent.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the fire came down from heaven... and the glory of Yahuah (LORD) filled the house* (2 Chronicles 7:1) — the Glory returns as fire after the prayer; the house doubly claimed, by cloud at the ark and fire at the altar (1 Kings 8:11).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the Word was made flesh, and dwelt among us... and we beheld his glory* (John 1:14) — the Glory that filled the house (1 Kings 8:11) is the Formed Word, the tabernacling Presence that at last took flesh.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the dedication is a down-payment on the consummation, the Glory dwelling with men without veil (1 Kings 8:11).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-glory-filled-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) hath chosen Zion; he hath desired it for his habitation* (Psalm 132:13) — the house Solomon built (1 Kings 8:13) is Yahuah''s own choosing, not the king''s presumption.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-dwell-in-thick-darkness-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*This is my rest for ever: here will I dwell; for I have desired it* (Psalm 132:14) — Yahuah''s own answer to Solomon''s *a settled place... for ever* (1 Kings 8:13).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-dwell-in-thick-darkness-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a cloud covered the tent... the glory of Yahuah (LORD) filled the tabernacle* (Exodus 40:34) — the covering cloud is the *thick darkness* Yahuah dwells in (1 Kings 8:12); the veiled Glory, present yet shrouded.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=40 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-dwell-in-thick-darkness-rest'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9) — the Torah''s own portrait of the El Solomon confesses in 1 Kings 8:23; covenant-mercy bound to commandment-keeping.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-no-elohim-like-thee-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5) — the identical confession prayed from the exile; from dedication to return, one covenant-keeping El (1 Kings 8:23).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=23
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-no-elohim-like-thee-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *heaven and the heaven of heavens cannot contain thee; how much less this house which I have built!* (2 Chronicles 6:18) — the verbatim parallel to 1 Kings 8:27; the Formless Father uncontained.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=6 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-heaven-of-heavens-cannot-contain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The heaven is my throne, and the earth is my footstool: where is the house that ye build unto me?* (Isaiah 66:1) — Solomon''s humility made prophecy; no house holds the Most High (1 Kings 8:27).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-heaven-of-heavens-cannot-contain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the El Elyon (most High) dwelleth not in temples made with hands* (Acts 7:48) — Stephen speaks straight from Solomon''s confession (1 Kings 8:27); the temple never the cage of the Most High.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-heaven-of-heavens-cannot-contain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Heaven is my throne, and earth is my footstool: what house will ye build me?* (Acts 7:49) — Stephen seals the point with Isaiah''s words, Solomon''s very wonder (1 Kings 8:27).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-heaven-of-heavens-cannot-contain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *a resemblance of the holy tabernacle, which you have prepared from the beginning* (Wisdom of Solomon 9:8) — the temple an earthly likeness of the heavenly pattern, never a container for the uncontainable (1 Kings 8:27).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-heaven-of-heavens-cannot-contain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed* (Daniel 6:10) — Daniel takes Solomon''s petition at its word, praying toward the house from captivity (1 Kings 8:29).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=29
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-house-of-prayer-toward-this-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the publican... smote upon his breast, saying, Elohim (God) be merciful to me a sinner* (Luke 18:13) — the broken cry for which the house of prayer is built, the supplication heard and forgiven (1 Kings 8:30).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=30
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-house-of-prayer-toward-this-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the sons of the stranger, that join themselves to Yahuah (LORD)... to love the name of Yahuah (LORD)... and taketh hold of my covenant* (Isaiah 56:6) — Solomon''s stranger who comes *for thy name''s sake* (1 Kings 8:41) enters the covenant, not abolishes it.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=43
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-the-stranger-for-thy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *mine house shall be called an house of prayer for all people* (Isaiah 56:7) — the house Solomon dedicated, the Name made known so *all people of the earth may know thy name* (1 Kings 8:43).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=43
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-the-stranger-for-thy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Many nations shall come from far to the name of Yahuah (God)* (Tobit 13:11) — the far country of Solomon''s stranger becomes the many nations drawn to the Name (1 Kings 8:43).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=43
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-the-stranger-for-thy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6) — the Name made known is not tolerance of idols but their burial; the nations come to fear the one El (1 Kings 8:43).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=43
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-the-stranger-for-thy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*all nations shall praise Yahuah (God), and his people shall confess Yahuah (God), and Yahuah (God) shall exalt his people* (Tobit 14:7) — the ingathering of the stranger does not displace the people; both rejoice (1 Kings 8:43).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=43
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-the-stranger-for-thy-names-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* (Deuteronomy 30:1) — to *bethink themselves* (1 Kings 8:47) is to call to mind among the nations; the first turn of the scattered heart.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=47
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *And shalt return unto Yahuah Elohayka (the LORD thy God)... with all thine heart, and with all thy soul* (Deuteronomy 30:2) — Solomon''s *return unto thee with all their heart, and with all their soul* (1 Kings 8:48) word for word; the whole-hearted return to the voice.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=48
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *will turn thy captivity... and will return and gather thee from all the nations* (Deuteronomy 30:3) — the two-house regathering: Yahudah and the scattered house of Yashar''el brought back when they return with all their heart (1 Kings 8:48).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=48
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4) — no distance too far for the regathering; *far or near* (1 Kings 8:46), the Shepherd fetches the scattered home.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=48
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If ye transgress, I will scatter you abroad among the nations* (Nehemiah 1:8) — the scattering for covenant-breaking that Solomon foresaw, *carried them away captives* (1 Kings 8:46); the Deuteronomy 28 judgment, never the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=47
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*But if ye turn unto me... yet will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:9) — the regathering ends at the Name, the very house Solomon dedicated (1 Kings 8:48).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=48
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *in the land of their captivities they shall remember themselves* (Baruch 2:30) — Baruch''s *remember themselves* is Solomon''s *bethink themselves* (1 Kings 8:47); the first stirring of repentance in exile.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=47
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=2 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *I will bring them again into the land which I promised with an oath to their fathers, Abraham, Isaac, and Jacob* (Baruch 2:34) — the oath-bound regathering, the paternal covenant line gathered home and increased (1 Kings 8:48).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=48
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-captivity-and-return-regathering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 8 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *There failed not ought of any good thing which Yahuah (LORD) had spoken unto the house of Yashar''el (Israel); all came to pass* (Joshua 21:45) — the conquest-rest verdict echoed in Solomon''s *not failed one word of all his good promise* (1 Kings 8:56).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=56
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=21 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-rest-not-one-word-of-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*not one thing hath failed of all the good things which Yahuah Elohaychem (the LORD your God) spake... all are come to pass* (Joshua 23:14) — Joshua''s farewell, the identical testimony to Solomon''s benediction (1 Kings 8:56); the witness doubled across the generations.'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=56
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-rest-not-one-word-of-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *if Yahusha (Jesus) had given them rest... There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:8-9) — the temple-rest is real but not final; a sabbath-rest remains, toward which Solomon''s given rest points (1 Kings 8:56).'
  FROM cross_reference_threads t
  JOIN _s342_1ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=8 AND sv.verse_number=56
  JOIN _s342_1ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-8-rest-not-one-word-of-promise'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_9.sql (1 Kings 9) -----
-- Chapter: 1 Kings 9 — Yahuah appears to Solomon the SECOND time; the Name placed in the house
--   for ever; the CONDITIONAL throne (Torah-keeping the condition); the exile-judgment for
--   covenant-breaking (Deut 28-29 / Lev 26 — the curse is the breach-consequence, NEVER the
--   Torah itself); Solomon's building works, Cabul, the navy of Ophir gold.
-- Tag: 1ki09   View: _s342_1ki09_lookup   Sort band: 38100 step 3 (38100..38112)
--
-- 1 Kings 9 coverage:
--   v.3  (the Name in the house for ever; prayer heard)
--        NT:     none warranted here (Name-placement is the Tanakh thread; NT throne sits at v.5)
--        Extras: none warranted
--        Tanakh: 1 Kings 8:29 (Solomon's prayer this answers); 2 Samuel 7:13 (house for my name);
--                Deuteronomy 28:58 (the glorious and fearful Name) — Name-thread
--   v.4-5 (the conditional throne — Torah the condition; throne upon Yashar'el for ever)
--        NT:     Luke 1:32-33 (the throne of his father David, reign for ever — the Formed Son)
--        Extras: none warranted
--        Tanakh: 2 Samuel 7:12-16 (the Davidic covenant); 2 Chronicles 7:17-18 (the parallel) — throne-thread
--   v.6-9 (turn away / cut off / cast out / proverb-byword / because they forsook)
--        NT:     none warranted (covenant-sanction is Tanakh-internal here)
--        Extras: none warranted
--        Tanakh: Deuteronomy 28:36-37,45,64; Deuteronomy 29:24-28; Leviticus 26:31-33;
--                2 Chronicles 7:19-22; Jeremiah 22:8-9 — covenant-sanction thread
--   v.7  (Yashar'el a proverb and a byword; this house cast out — the scattering of both houses)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Kings 17:6,18,20-21 (the north scattered to Assyria); 1 Kings 11:11,31
--                (the kingdom rent); Deuteronomy 28:37 — scattering thread
--   v.10-28 (Hiram / Cabul / the levy / building works / navy of Ophir) — narrative detail,
--        no library cross-add warranted (none of the three layers carries framework weight here
--        beyond what the conditional-covenant threads above already bear).
--
-- Threads (4):
--   1-kings-9-i-have-hallowed-this-house-to-put-my-name-there-for-ever  (Tanakh) — v.3
--   1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk  (Tanakh+NT) — v.4-5
--   1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel  (Tanakh) — v.6-9
--   1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering  (Tanakh) — v.7
--
-- FRAMING NOTE (load-bearing / contested): vv.6-9 are the Deuteronomy 28-29 / Leviticus 26
-- covenant sanction. The exile-judgment is the CONSEQUENCE of forsaking the covenant and going
-- after other gods (9:9 — *Because they forsook Yahuah their Elohim... therefore hath Yahuah
-- brought upon them all this evil*) — it is NEVER the Torah itself being a curse. The condition
-- in v.4 is Torah-keeping (*keep my statutes and my judgments*); the breach in v.6 is idolatry
-- (*go and serve other gods*). This is the exact backstory to the scattering of BOTH houses
-- (2 Kings 17 → north to Assyria; the south later to Babylon, Jer 22:8-9), the two-house exile
-- the whole library exists to reverse by ingathering.

CREATE TEMP VIEW _s342_1ki09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Name placed in the house for ever (9:3)
    ('canon','1-kings',9,3,'canon','1-kings',8,29,'free',E'*That thine eyes may be open toward this house night and day, even toward the place of which thou hast said, My name shall be there: that thou mayest hearken unto the prayer which thy servant shall make toward this place* (1 Kings 8:29). The second appearance answers the exact prayer Solomon prayed at the dedication: when 9:3 says *I have heard thy prayer and thy supplication, that thou hast made before me: I have hallowed this house... to put my name there for ever; and mine eyes and mine heart shall be there perpetually*, Yahuah is granting word-for-word what was asked — the Name, the open eyes, the place of prayer.'),
    ('canon','1-kings',9,3,'canon','2-samuel',7,13,'free',E'*He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The house Solomon finished is the house promised to David for the Name; when Yahuah says *I have hallowed this house, which thou hast built, to put my name there for ever*, he is fulfilling the word spoken to David — the Name and the everlasting throne are bound together in the same covenant.'),
    ('canon','1-kings',9,3,'canon','deuteronomy',28,58,'free',E'*If thou wilt not observe to do all the words of this law that are written in this book, that thou mayest fear this glorious and fearful name, THE Yahuah (LORD) THY GOD* (Deuteronomy 28:58). The Name placed *there for ever* in 9:3 is the same *glorious and fearful name* the Torah commands Yashar''el (Israel) to fear and keep — the house exists to house the Name, and forsaking the Name (9:9) is the very breach the sanction answers.'),

    -- THREAD 2: the conditional throne — Torah-keeping the condition (9:4-5)
    ('canon','1-kings',9,5,'canon','2-samuel',7,12,'free',E'*And when thy days be fulfilled, and thou shalt sleep with thy fathers, I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The promise *Then I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever, as I promised to David thy father* (9:5) reaches straight back to the seed-promise to David — the throne is the Davidic line, carried by paternal bloodline AND covenant-word together.'),
    ('canon','1-kings',9,5,'canon','2-samuel',7,16,'free',E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). When 9:5 says *as I promised to David thy father, saying, There shall not fail thee a man upon the throne of Yashar''el (Israel)*, it is quoting back the for-ever throne of the Davidic covenant — the unbreakable promise that the conditional sets Solomon''s own footing within.'),
    ('canon','1-kings',9,4,'canon','2-chronicles',7,17,'free',E'*And as for thee, if thou wilt walk before me, as David thy father walked, and do according to all that I have commanded thee, and shalt observe my statutes and my judgments* (2 Chronicles 7:17). The Chronicler''s parallel of the same night carries the same condition word for word — *if thou wilt walk before me, as David thy father walked... and wilt keep my statutes and my judgments* (9:4): the condition of the throne is Torah-keeping, never anything less.'),
    ('canon','1-kings',9,5,'canon','2-chronicles',7,18,'free',E'*Then will I stablish the throne of thy kingdom, according as I have covenanted with David thy father, saying, There shall not fail thee a man to be ruler in Yashar''el (Israel)* (2 Chronicles 7:18). The twin of 9:5 — the same establishing of the throne *upon Yashar''el (Israel) for ever* — confirms the covenant frame: the everlasting Davidic rule held out on the condition of walking in the statutes.'),
    ('canon','1-kings',9,5,'canon','luke',1,32,'free',E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The throne held out conditionally to Solomon finds its unfailing heir in the Formed Son — the One who walks before the Father in perfect integrity where Solomon would fail (1 Kings 11), so that *there shall not fail thee a man upon the throne of Yashar''el (Israel)* (9:5) stands for ever in him.'),
    ('canon','1-kings',9,5,'canon','luke',1,33,'free',E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The *for ever* of 9:5 — *I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever* — is the very for-ever the Formed Son fulfils, reigning over the house of Jacob (both houses regathered) with a kingdom that has no end.'),

    -- THREAD 3: the exile-judgment for covenant-breaking — Deut 28-29 / Lev 26 (9:6-9)
    ('canon','1-kings',9,7,'canon','deuteronomy',28,36,'free',E'*Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known; and there shalt thou serve other gods, wood and stone* (Deuteronomy 28:36). The threat *Then will I cut off Yashar''el (Israel) out of the land which I have given them* (9:7) is the Deuteronomy 28 covenant sanction restated to Solomon — the exile is the consequence of going to *serve other gods* (9:6), never the Torah itself being a curse.'),
    ('canon','1-kings',9,7,'canon','deuteronomy',28,37,'free',E'*And thou shalt become an astonishment, a proverb, and a byword, among all nations whither Yahuah (LORD) shall lead thee* (Deuteronomy 28:37). The very words *Yashar''el (Israel) shall be a proverb and a byword among all people* (9:7) are lifted from the Torah''s own sanction — Solomon is being shown that the breach he is warned against triggers the exact curse Moses spoke, the breach-consequence, not the inheritance.'),
    ('canon','1-kings',9,9,'canon','deuteronomy',28,45,'free',E'*Moreover all these curses shall come upon thee, and shall pursue thee, and overtake thee, till thou be destroyed; because thou hearkenedst not unto the voice of Yahuah Elohayka (the LORD thy God), to keep his commandments and his statutes which he commanded thee* (Deuteronomy 28:45). The cause named in 9:9 — *Because they forsook Yahuah (LORD) their Elohim (God)... therefore hath Yahuah (LORD) brought upon them all this evil* — is the Torah''s own logic: the curse comes *because* of forsaking, the breach of the covenant, never the keeping of it.'),
    ('canon','1-kings',9,7,'canon','deuteronomy',28,64,'free',E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). Cutting Yashar''el (Israel) off *out of the land* (9:7) is the scattering Moses foretold — the exile-judgment that follows turning to *serve other gods* (9:6), the covenant-faithfulness sanction, not Torah-as-curse.'),
    ('canon','1-kings',9,9,'canon','deuteronomy',29,24,'free',E'*Even all nations shall say, Wherefore hath Yahuah (LORD) done thus unto this land? what meaneth the heat of this great anger?* (Deuteronomy 29:24). The passer-by''s question in 9:8 — *Why hath Yahuah (LORD) done thus unto this land, and to this house?* — is the very question Moses put in the nations'' mouths; the answer is identical: the covenant was forsaken.'),
    ('canon','1-kings',9,9,'canon','deuteronomy',29,25,'free',E'*Then men shall say, Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers, which he made with them when he brought them forth out of the land of Egypt* (Deuteronomy 29:25). The answer of 9:9 — *Because they forsook Yahuah (LORD) their Elohim (God), who brought forth their fathers out of the land of Egypt* — is word for word the answer Moses gave: the exile is the consequence of forsaking the covenant, not the covenant condemning the people.'),
    ('canon','1-kings',9,9,'canon','deuteronomy',29,28,'free',E'*And Yahuah (LORD) rooted them out of their land in anger, and in wrath, and in great indignation, and cast them into another land, as it is this day* (Deuteronomy 29:28). The casting *out of the land* threatened in 9:7 is the rooting-out Moses described — the same covenant sanction, the breach-consequence falling because they *take hold upon other gods* (9:9).'),
    ('canon','1-kings',9,7,'canon','leviticus',26,31,'free',E'*And I will make your cities waste, and bring your sanctuaries unto desolation, and I will not smell the savour of your sweet odours* (Leviticus 26:31). The house *cast out of my sight* in 9:7 is the desolated sanctuary Leviticus warned of — the third witness (with Deut 28 and Deut 29) that the exile is the covenant sanction for idolatry, never the Torah being the curse.'),
    ('canon','1-kings',9,7,'canon','leviticus',26,33,'free',E'*And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). Cutting Yashar''el (Israel) off *out of the land* (9:7) is the Levitical scattering — and Leviticus 26 ends not in abandonment but in remembered covenant (26:42-45), the very mercy that makes the scattering a discipline, not a divorce without return.'),
    ('canon','1-kings',9,9,'canon','2-chronicles',7,22,'free',E'*And it shall be answered, Because they forsook Yahuah Elohim (the LORD God) of their fathers, which brought them forth out of the land of Egypt, and laid hold on other gods, and worshipped them, and served them: therefore hath he brought all this evil upon them* (2 Chronicles 7:22). The Chronicler''s parallel of 9:9 gives the identical verdict — the evil came *because they forsook* and *laid hold on other gods*: the consequence of breaking faith, never the law itself.'),
    ('canon','1-kings',9,9,'canon','jeremiah',22,9,'free',E'*Then they shall answer, Because they have forsaken the covenant of Yahuah (LORD) their Elohim (God), and worshipped other gods, and served them* (Jeremiah 22:9). Generations later Jeremiah gives the same answer to the same question — proving the warning of 9:6-9 was no idle threat: Yahudah (Judah) too would forsake the covenant and *worship other gods*, and the byword would come exactly as foretold.'),

    -- THREAD 4: a proverb and a byword — the scattering of both houses (9:7)
    ('canon','1-kings',9,7,'canon','2-kings',17,6,'free',E'*In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). The threat of 9:7 — *Then will I cut off Yashar''el (Israel) out of the land* — falls on the northern house first: the ten tribes carried into Assyria, the very scattering the conditional warned of, the two-house exile the whole library exists to reverse.'),
    ('canon','1-kings',9,7,'canon','2-kings',17,18,'free',E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18). *Removed... out of his sight* is the cutting-off of 9:7 made history — and it leaves *Yahudah (Judah) only*, the two houses now visibly split: the north divorced and scattered, the south alone for a season.'),
    ('canon','1-kings',9,7,'canon','2-kings',17,20,'free',E'*And Yahuah (LORD) rejected all the seed of Yashar''el (Israel), and afflicted them, and delivered them into the hand of spoilers, until he had cast them out of his sight* (2 Kings 17:20). The house and the land *cast out of my sight* (9:7) — here it is, *cast... out of his sight*; the byword among the nations begins, the scattering that Ezekiel''s two sticks and Jeremiah''s *He that scattered Yashar''el (Israel) will gather him* are spoken to undo.'),
    ('canon','1-kings',9,7,'canon','1-kings',11,11,'free',E'*Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). Two chapters on, Solomon himself does exactly what 9:6 warned — *turn from following me* — and the rending begins in him: the conditional of chapter 9 is not abstract; the king it was spoken to is the first to break it.'),
    ('canon','1-kings',9,7,'canon','1-kings',11,31,'free',E'*And he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The ten pieces given to Jeroboam are the birth of the two houses — Yashar''el (Israel)/Ephraim in the north, Yahudah (Judah) in the south — the division that begins the road to the proverb-and-byword scattering of 9:7.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS --

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-9-i-have-hallowed-this-house-to-put-my-name-there-for-ever',
       E'I have hallowed this house, to put my name there for ever',
       E'Yahuah (LORD) appears to Solomon the second time and answers, word for word, the prayer of the dedication: *I have heard thy prayer and thy supplication, that thou hast made before me: I have hallowed this house, which thou hast built, to put my name there for ever; and mine eyes and mine heart shall be there perpetually* (1 Kings 9:3). This is the granting of what Solomon asked — *That thine eyes may be open toward this house night and day, even toward the place of which thou hast said, My name shall be there* (1 Kings 8:29). And it is the keeping of the word to David: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13). The Name placed *there for ever* is the same *glorious and fearful name, THE Yahuah (LORD) THY GOD* (Deuteronomy 28:58) the Torah commands Yashar''el (Israel) to fear — so that to forsake the Name (as 9:9 warns) is to break the very covenant the house was raised to honour.',
       sv.verse_id, ev.verse_id, 'free', 38100
  FROM _s342_1ki09_lookup sv, _s342_1ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk',
       E'The throne upon Yashar''el for ever — if thou wilt walk before me',
       E'The promise of the everlasting throne is held out on a condition, and the condition is Torah-keeping: *And if thou wilt walk before me, as David thy father walked, in integrity of heart, and in uprightness, to do according to all that I have commanded thee, and wilt keep my statutes and my judgments: Then I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever* (1 Kings 9:4-5). The throne itself is the Davidic seed-promise — *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12), *thy throne shall be established for ever* (2 Samuel 7:16) — and the Chronicler''s parallel of the same night carries the same condition: *if thou wilt walk before me, as David thy father walked... and shalt observe my statutes and my judgments; Then will I stablish the throne of thy kingdom* (2 Chronicles 7:17-18). Solomon would not keep it (1 Kings 11), so the unfailing *man upon the throne of Yashar''el (Israel)* is found at last in the Formed Son: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32), *and he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the for-ever throne kept by the One who walks before the Father in perfect integrity, reigning over both houses regathered.',
       sv.verse_id, ev.verse_id, 'free', 38103
  FROM _s342_1ki09_lookup sv, _s342_1ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel',
       E'If ye turn from following me — the curse is the breach, never the Torah',
       E'The other half of the conditional is the covenant sanction, spoken straight out of the Torah: *But if ye shall at all turn from following me... and will not keep my commandments and my statutes which I have set before you, but go and serve other gods, and worship them: Then will I cut off Yashar''el (Israel) out of the land which I have given them; and this house... will I cast out of my sight* (1 Kings 9:6-7). The trigger is idolatry — *go and serve other gods* — and the verdict is named plainly: *Because they forsook Yahuah (LORD) their Elohim (God)... therefore hath Yahuah (LORD) brought upon them all this evil* (1 Kings 9:9). This is the Deuteronomy 28-29 / Leviticus 26 curse-for-breaking, and the wording is lifted from the Torah itself: *Yahuah (LORD) shall scatter thee among all people* (Deuteronomy 28:64), the curses come *because thou hearkenedst not... to keep his commandments* (Deuteronomy 28:45), the nations ask *Wherefore hath Yahuah (LORD) done thus unto this land?* and the answer is *Because they have forsaken the covenant* (Deuteronomy 29:24-25,28); *I will make your cities waste, and bring your sanctuaries unto desolation... I will scatter you among the heathen* (Leviticus 26:31,33). The Chronicler''s parallel gives the same verdict (2 Chronicles 7:22), and Jeremiah will give it again over the southern house: *Because they have forsaken the covenant of Yahuah (LORD) their Elohim (God)* (Jeremiah 22:9). The curse is always the consequence of forsaking — never the law itself; and Leviticus 26 ends not in divorce but in remembered covenant (26:42-45), the discipline that holds the door open for return.',
       sv.verse_id, ev.verse_id, 'free', 38106
  FROM _s342_1ki09_lookup sv, _s342_1ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering',
       E'A proverb and a byword — the scattering of both houses begins',
       E'The byword named in the warning is the backstory of the two-house exile: *Yashar''el (Israel) shall be a proverb and a byword among all people* (1 Kings 9:7) — the very curse Moses spoke, *thou shalt become an astonishment, a proverb, and a byword, among all nations* (Deuteronomy 28:37). It does not stay theoretical. Solomon himself breaks the condition first: *thou hast not kept my covenant and my statutes... I will surely rend the kingdom from thee* (1 Kings 11:11), and the ten tribes are torn away — *Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — the birth of the two houses, Yashar''el (Israel)/Ephraim in the north and Yahudah (Judah) in the south. Then the northern house is cut off *out of the land* exactly as 9:7 threatened: *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6); *Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18); *and Yahuah (LORD) rejected all the seed of Yashar''el (Israel)... until he had cast them out of his sight* (2 Kings 17:20). The house *cast out of my sight* of 9:7 is now history — and it is precisely this scattering that the two sticks made one (Ezekiel 37) and *He that scattered Yashar''el (Israel) will gather him* (Jeremiah 31:10) are spoken to reverse.',
       sv.verse_id, ev.verse_id, 'free', 38109
  FROM _s342_1ki09_lookup sv, _s342_1ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS --

-- Thread 1: the Name in the house for ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The very prayer answered: *That thine eyes may be open toward this house... My name shall be there* (1 Kings 8:29) — 9:3 grants it word for word.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-i-have-hallowed-this-house-to-put-my-name-there-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The word to David fulfilled: *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* (2 Samuel 7:13) — Name and everlasting throne bound together.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-i-have-hallowed-this-house-to-put-my-name-there-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The same Name to be feared and kept: *this glorious and fearful name, THE Yahuah (LORD) THY GOD* (Deuteronomy 28:58) — to forsake it (9:9) is to break the covenant.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-i-have-hallowed-this-house-to-put-my-name-there-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the conditional throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The Davidic seed-promise: *I will set up thy seed after thee... and I will establish his kingdom* (2 Samuel 7:12) — the throne is the line carried by bloodline and word together.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The for-ever throne quoted back: *thy throne shall be established for ever* (2 Samuel 7:16) — the unbreakable promise the conditional sets Solomon''s footing within.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The parallel condition, word for word: *if thou wilt walk before me, as David thy father walked... and shalt observe my statutes and my judgments* (2 Chronicles 7:17) — Torah-keeping is the condition.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=4
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'The parallel establishing of the throne: *Then will I stablish the throne of thy kingdom... There shall not fail thee a man to be ruler in Yashar''el (Israel)* (2 Chronicles 7:18).'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The unfailing heir: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the Formed Son keeps the condition Solomon would break.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'The for-ever reign over both houses: *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the *for ever* of 9:5 fulfilled.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-the-throne-of-thy-kingdom-upon-yasharel-for-ever-if-thou-walk'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the curse is the breach, never the Torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The sanction restated: *Yahuah (LORD) shall bring thee, and thy king... unto a nation... and there shalt thou serve other gods* (Deuteronomy 28:36) — exile is the consequence of idolatry.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The byword lifted from the Torah: *thou shalt become an astonishment, a proverb, and a byword, among all nations* (Deuteronomy 28:37) — 9:7 quotes Moses'' own curse.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The Torah''s own logic of cause: the curses come *because thou hearkenedst not... to keep his commandments* (Deuteronomy 28:45) — the breach, never the keeping.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'The scattering foretold: *Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — cutting off *out of the land* (9:7).'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The nations'' question, put first by Moses: *Wherefore hath Yahuah (LORD) done thus unto this land?* (Deuteronomy 29:24) — echoed exactly in 9:8.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'The identical answer: *Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers* (Deuteronomy 29:25) — the consequence of forsaking, matching 9:9.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'The rooting-out: *Yahuah (LORD) rooted them out of their land in anger... and cast them into another land* (Deuteronomy 29:28) — the casting *out of the land* of 9:7.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'The third witness — the desolated sanctuary: *I will make your cities waste, and bring your sanctuaries unto desolation* (Leviticus 26:31) — the house cast out of sight (9:7).'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'The Levitical scattering — held within mercy: *I will scatter you among the heathen* (Leviticus 26:33), yet 26:42-45 remembers the covenant: discipline, not divorce without return.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'The Chronicler''s identical verdict: *Because they forsook Yahuah Elohim (the LORD God) of their fathers... therefore hath he brought all this evil upon them* (2 Chronicles 7:22).'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'The southern house too, generations later: *Because they have forsaken the covenant of Yahuah (LORD) their Elohim (God), and worshipped other gods* (Jeremiah 22:9) — the warning proved true.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-if-ye-turn-from-following-me-then-will-i-cut-off-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: a proverb and a byword — the scattering of both houses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'The northern house carried off: *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6) — the cutting-off of 9:7 made history.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The two houses visibly split: *removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18).'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'The house cast out of sight, exactly as 9:7: *cast them out of his sight* (2 Kings 17:20) — the scattering the two sticks (Ezekiel 37) are spoken to undo.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Solomon breaks the condition first: *thou hast not kept my covenant... I will surely rend the kingdom from thee* (1 Kings 11:11) — 9:6 made flesh in the king it was spoken to.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'The birth of the two houses: *I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — Ephraim north, Yahudah (Judah) south.'
  FROM cross_reference_threads t
  JOIN _s342_1ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s342_1ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-9-yasharel-shall-be-a-proverb-and-a-byword-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_10.sql (1 Kings 10) -----
-- 1 Kings 10 — the queen of Sheba seeks the wisdom; the kingdom-glory foretaste; the quiet warning of accumulation.
-- TAG: 1ki10   VIEW: _s342_1ki10_lookup   SORT BAND: 38125, step 3 (38125,38128,38131,38134)
-- SOURCE rows all 'canon','1-kings',10,v.
--
-- 1 Kings 10 coverage:
--   v.1    (queen of Sheba heard the fame of Solomon concerning the NAME of Yahuah; came to prove him)
--          NT:     Matthew 12:42; Luke 11:31 (the queen of the south came to hear the wisdom; a greater than Solomon is here) [thread 1]
--          Extras: none warranted
--          Tanakh: 2 Chronicles 9:1 (parallel); Isaiah 60:3,6 (kings to thy light; Sheba bring gold) [thread 1/2]
--   v.6-7  (it was a true report... the half was not told me: thy wisdom and prosperity exceedeth the fame)
--          NT:     Matthew 12:42; Luke 11:31 (she came from the uttermost parts; a greater than Solomon) [thread 1]
--          Extras: none warranted
--          Tanakh: 2 Chronicles 9:5-6 (parallel) [folded into thread 1 prose]
--   v.9    (Blessed be Yahuah... which delighted in thee, to set thee on the throne of Yashar'el; loved Yashar'el for ever)
--          NT:     none warranted (covered laterally + thread 2)
--          Extras: none warranted
--          Tanakh: Psalm 72:1-2,17,18 (give the king thy judgments; blessed be Yahuah Elohim of Yashar'el) [thread 2]
--   v.10,25 (she gave gold and spices and precious stones; all brought gold, spices)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Psalm 72:10-11,15 (kings of Sheba shall offer gifts; gold of Sheba given him); Isaiah 60:6 (from Sheba gold and incense) [thread 3]
--   v.23-24 (Solomon exceeded all the kings of the earth for riches and wisdom; all the earth sought him)
--          NT:     none warranted (thread 3 carries the kingdom-glory weave)
--          Extras: none warranted
--          Tanakh: Psalm 72:11 (all kings shall fall down before him); Isaiah 60:3 (kings to the brightness of thy rising) [thread 3]
--   v.26-28 (Solomon gathered chariots and horsemen; multiplied silver as stones; horses out of Egypt)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 17:16-17 (the king shall not multiply horses, nor cause to return to Egypt, nor multiply silver and gold); 1 Kings 11:1-3 (the heart turned away) [thread 4]
--
-- THREADS:
--   1-kings-10-the-queen-of-the-south-who-sought-the-wisdom (free) — Tanakh+NT: 2Chr9, Matt12, Luke11
--   1-kings-10-the-nations-drawn-to-the-name-and-the-light-of-zion (free) — Tanakh: Isa60, Ps72
--   1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold (free) — Tanakh: Ps72, Isa60
--   1-kings-10-the-quiet-warning-of-accumulation-the-kings-law (free) — Tanakh: Deut17, 1Kings11
-- Framework-load-bearing framing: 10:1's fame is *concerning the name of Yahuah (LORD)* — the
-- queen is drawn by the NAME, not bare statecraft. The Formed Son reads her forward: she SOUGHT
-- the wisdom from the uttermost parts and so condemns the generation that ignores the greater Son
-- (Matt 12:42 / Luke 11:31) — the nations drawn to the light of Zion and the Name (Isa 60), the
-- kings bringing gifts to the Davidic King (Ps 72), NOT replacement of Yashar'el but the nations
-- streaming to her restored King. Thread 4 holds the quiet warning: 10:26-28's multiplying of
-- horses (out of Egypt), silver, and gold brushes against the king-law of Deut 17:16-17 and
-- foreshadows the fall of ch11 — the glory was real but the accumulation seeds the turning.

CREATE TEMP VIEW _s342_1ki10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the queen of the south who sought the wisdom (10:1,6,7)
    ('canon','1-kings',10,1,'canon','2-chronicles',9,1,'free',E'*And when the queen of Sheba heard of the fame of Solomon, she came to prove Solomon with hard questions at Jerusalem* (2 Chronicles 9:1). The Chronicler tells the same coming the same way; here the fame is named for what it truly is — *the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD)* (1 Kings 10:1). She is drawn not by gold but by the Name.'),
    ('canon','1-kings',10,1,'canon','matthew',12,42,'free',E'*The queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Matthew 12:42). The Formed Son reads the queen of 1 Kings 10:1 forward: she crossed the uttermost parts to seek the wisdom *concerning the name of Yahuah (LORD)*, and so she rises to condemn those who ignore the greater Son standing before them.'),
    ('canon','1-kings',10,1,'canon','luke',11,31,'free',E'*The queen of the south shall rise up in the judgment with the men of this generation, and condemn them: for she came from the utmost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Luke 11:31). The seeking heart of the queen — who *came to prove him with hard questions* (1 Kings 10:1) — judges the unseeking generation; the one who sought the lesser wisdom condemns those who spurn the greater.'),
    ('canon','1-kings',10,7,'canon','matthew',12,42,'free',E'*and, behold, a greater than Solomon is here* (Matthew 12:42). The queen confessed *the half was not told me: thy wisdom and prosperity exceedeth the fame which I heard* (1 Kings 10:7); the wonder that overwhelmed her at Solomon''s wisdom is the measure of how much greater the One the generation refused.'),

    -- THREAD 2: the nations drawn to the Name and the light of Zion (10:1,9)
    ('canon','1-kings',10,1,'canon','isaiah',60,3,'free',E'*And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3). The queen who came because she *heard of the fame of Solomon concerning the name of Yahuah (LORD)* (1 Kings 10:1) is the firstfruits of the prophet''s vision — the nations and their kings streaming to the light risen upon Yashar''el (Israel), drawn by the Name.'),
    ('canon','1-kings',10,9,'canon','psalms',72,17,'free',E'*His name shall endure for ever: his name shall be continued as long as the sun: and men shall be blessed in him: all nations shall call him blessed* (Psalm 72:17). The queen blessed Yahuah for the king — *Blessed be Yahuah Elohayka (the LORD thy God), which delighted in thee, to set thee on the throne of Yashar''el (Israel)* (1 Kings 10:9) — a foreshadow of the day all nations call the Davidic King blessed.'),
    ('canon','1-kings',10,9,'canon','psalms',72,18,'free',E'*Blessed be Yahuah Elohim (the LORD God), the Elohim (God) of Yashar''el (Israel), who only doeth wondrous things* (Psalm 72:18). The queen''s blessing and the psalm''s blessing are one breath: she blesses *Yahuah Elohayka (the LORD thy God)... because Yahuah (LORD) loved Yashar''el (Israel) for ever* (1 Kings 10:9) — the throne stands not for Solomon''s sake but for the everlasting love of Yahuah for his people.'),

    -- THREAD 3: the kingdom-glory foretaste, the kings bring gold (10:10,23,24,25)
    ('canon','1-kings',10,10,'canon','psalms',72,15,'free',E'*And he shall live, and to him shall be given of the gold of Sheba: prayer also shall be made for him continually; and daily shall he be praised* (Psalm 72:15). The hundred and twenty talents of gold and the spices the queen *gave to king Solomon* (1 Kings 10:10) are the gold of Sheba the psalm sings — the tribute of the nations to the King, a foretaste of the messianic kingdom-glory.'),
    ('canon','1-kings',10,10,'canon','isaiah',60,6,'free',E'*all they from Sheba shall come: they shall bring gold and incense; and they shall shew forth the praises of Yahuah (LORD)* (Isaiah 60:6). Sheba''s gold and *spices very great store* brought to Solomon (1 Kings 10:10) prefigure the day Sheba comes again — not to a man''s court only, but bringing gold and incense to show forth the praises of Yahuah in the restored kingdom.'),
    ('canon','1-kings',10,23,'canon','psalms',72,11,'free',E'*Yea, all kings shall fall down before him: all nations shall serve him* (Psalm 72:11). That *Solomon exceeded all the kings of the earth for riches and for wisdom* (1 Kings 10:23) is a shadow cast forward: the kingdom where all kings bow and all nations serve the King whom Yahuah sets on the throne.'),
    ('canon','1-kings',10,24,'canon','isaiah',60,3,'free',E'*And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3). When *all the earth sought to Solomon, to hear his wisdom, which Elohim (God) had put in his heart* (1 Kings 10:24), the seeking of all the earth toward the wisdom of Yahuah''s king is the firstfruit of the nations coming to the light of Zion.'),
    ('canon','1-kings',10,25,'canon','psalms',72,10,'free',E'*The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalm 72:10). The yearly tribute — *they brought every man his present, vessels of silver, and vessels of gold... a rate year by year* (1 Kings 10:25) — is the kings'' offered gifts of the psalm, the nations'' homage gathered to the throne.'),

    -- THREAD 4: the quiet warning of accumulation, the king-law (10:26,27,28)
    ('canon','1-kings',10,26,'canon','deuteronomy',17,16,'free',E'*But he shall not multiply horses to himself, nor cause the people to return to Egypt, to the end that he should multiply horses: forasmuch as Yahuah (LORD) hath said unto you, Ye shall henceforth return no more that way* (Deuteronomy 17:16). The king-law stands as the measure: *Solomon gathered together chariots and horsemen: and he had a thousand and four hundred chariots, and twelve thousand horsemen* (1 Kings 10:26). The glory is real, yet the multiplying of horses brushes the very line Torah drew.'),
    ('canon','1-kings',10,27,'canon','deuteronomy',17,17,'free',E'*Neither shall he multiply wives to himself, that his heart turn not away: neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:17). *The king made silver to be in Jerusalem as stones* (1 Kings 10:27) — the greatly-multiplied silver and gold the king was warned against, the quiet beginning of the heart''s turning the very next chapter records.'),
    ('canon','1-kings',10,28,'canon','deuteronomy',17,16,'free',E'*nor cause the people to return to Egypt, to the end that he should multiply horses* (Deuteronomy 17:16). *And Solomon had horses brought out of Egypt* (1 Kings 10:28) — the one road Torah forbade the king to reopen. The splendour of the chapter ends pointing back to Egypt, and the warning of Deuteronomy hangs over it.'),
    ('canon','1-kings',10,27,'canon','1-kings',11,3,'free',E'*And he had seven hundred wives, princesses, and three hundred concubines: and his wives turned away his heart* (1 Kings 11:3). The accumulation that began in glory — *the king made silver to be in Jerusalem as stones* (1 Kings 10:27) — runs on into the multiplied wives of the next chapter, and the heart Deuteronomy warned would *turn away* (Deuteronomy 17:17) is turned. The foretaste of glory and the seed of the fall stand side by side.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-10-the-queen-of-the-south-who-sought-the-wisdom',
       E'The queen of the south who sought the wisdom',
       E'A queen crosses the desert because of a Name. *And when the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD), she came to prove him with hard questions* (1 Kings 10:1) — and the Chronicler tells it the same way, *she came to prove Solomon with hard questions at Jerusalem* (2 Chronicles 9:1). What she found broke her: *Howbeit I believed not the words, until I came, and mine eyes had seen it: and, behold, the half was not told me: thy wisdom and prosperity exceedeth the fame which I heard* (1 Kings 10:7). The Formed Son takes her up as a witness against his own generation: *The queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Matthew 12:42), *and condemn them: for she came from the utmost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here* (Luke 11:31). The one who travelled the uttermost parts to seek the lesser wisdom condemns those who would not cross the room to the greater Son. The seeking heart, not the lineage, is what rises in the judgment — and the Name that drew her draws the nations still.',
       sv.verse_id, ev.verse_id, 'free', 38125
  FROM _s342_1ki10_lookup sv, _s342_1ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-10-the-nations-drawn-to-the-name-and-the-light-of-zion',
       E'The nations drawn to the Name and the light of Zion',
       E'The queen of Sheba is not an exception but a firstfruit. She came *concerning the name of Yahuah (LORD)* (1 Kings 10:1), and Isaiah sees the whole vision behind her single journey: *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3). When she blessed the king it was Yahuah she blessed, and for his people''s sake: *Blessed be Yahuah Elohayka (the LORD thy God), which delighted in thee, to set thee on the throne of Yashar''el (Israel): because Yahuah (LORD) loved Yashar''el (Israel) for ever, therefore made he thee king, to do judgment and justice* (1 Kings 10:9). The throne stands not for the man but for the everlasting love of Yahuah for Yashar''el. The psalm of the king sings the same to its end: *His name shall endure for ever: his name shall be continued as long as the sun: and men shall be blessed in him: all nations shall call him blessed* (Psalm 72:17), *Blessed be Yahuah Elohim (the LORD God), the Elohim (God) of Yashar''el (Israel), who only doeth wondrous things* (Psalm 72:18). The nations drawn to the Name do not replace Yashar''el; they stream to her restored King and bless the Elohim of Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 38128
  FROM _s342_1ki10_lookup sv, _s342_1ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=10 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold',
       E'The kingdom-glory foretaste — the kings bring gold',
       E'The gold pouring into Jerusalem is more than a king''s wealth; it is a foretaste of the messianic kingdom-glory the psalm and the prophet describe. The queen *gave the king an hundred and twenty talents of gold, and of spices very great store, and precious stones* (1 Kings 10:10), and the gold of Sheba is exactly what Psalm 72 sings to the King: *And he shall live, and to him shall be given of the gold of Sheba* (Psalm 72:15); *The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalm 72:10). The yearly homage matches the psalm: *they brought every man his present, vessels of silver, and vessels of gold... a rate year by year* (1 Kings 10:25), for *Solomon exceeded all the kings of the earth for riches and for wisdom* (1 Kings 10:23) and *all the earth sought to Solomon, to hear his wisdom, which Elohim (God) had put in his heart* (1 Kings 10:24) — the very shape of *all kings shall fall down before him: all nations shall serve him* (Psalm 72:11). And Isaiah names Sheba''s gold again, but turned to its true end: *all they from Sheba shall come: they shall bring gold and incense; and they shall shew forth the praises of Yahuah (LORD)* (Isaiah 60:6). Solomon''s golden hour is the small picture; the kingdom where the nations bring their glory to the praise of Yahuah is the great one.',
       sv.verse_id, ev.verse_id, 'free', 38131
  FROM _s342_1ki10_lookup sv, _s342_1ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=10 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-10-the-quiet-warning-of-accumulation-the-kings-law',
       E'The quiet warning of accumulation — the king-law',
       E'The chapter that crowns Solomon also, in its last verses, brushes against the one law written for the king. Torah had drawn three lines: *he shall not multiply horses to himself, nor cause the people to return to Egypt, to the end that he should multiply horses... neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:16-17). Now read the close of 1 Kings 10 against it: *Solomon gathered together chariots and horsemen: and he had a thousand and four hundred chariots, and twelve thousand horsemen* (1 Kings 10:26); *the king made silver to be in Jerusalem as stones* (1 Kings 10:27); *and Solomon had horses brought out of Egypt* (1 Kings 10:28) — the one road the king was forbidden to reopen. Every line of the warning is here in the splendour. And the warning had a reason: that *his heart turn not away* (Deuteronomy 17:17). The very next chapter records the turning: *he had seven hundred wives, princesses, and three hundred concubines: and his wives turned away his heart* (1 Kings 11:3). The foretaste of glory and the seed of the fall stand in the same chapter — the accumulation that dazzled the queen is the accumulation Torah warned would undo the king.',
       sv.verse_id, ev.verse_id, 'free', 38134
  FROM _s342_1ki10_lookup sv, _s342_1ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=10 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: the queen of the south who sought the wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And when the queen of Sheba heard of the fame of Solomon, she came to prove Solomon with hard questions at Jerusalem* (2 Chronicles 9:1) — the parallel telling of the same coming.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-queen-of-the-south-who-sought-the-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The queen of the south shall rise up in the judgment with this generation, and shall condemn it... a greater than Solomon is here* (Matthew 12:42) — the seeking queen judges the unseeking generation.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-queen-of-the-south-who-sought-the-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The queen of the south shall rise up in the judgment with the men of this generation, and condemn them... a greater than Solomon is here* (Luke 11:31) — she sought the lesser wisdom; the generation spurned the greater.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-queen-of-the-south-who-sought-the-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and, behold, a greater than Solomon is here* (Matthew 12:42) — her wonder at *the half was not told me* (1 Kings 10:7) measures how much greater the One refused.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=7
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-queen-of-the-south-who-sought-the-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the nations drawn to the Name and the light of Zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3) — the queen drawn by the Name is the firstfruit of the nations streaming to Zion''s light.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-nations-drawn-to-the-name-and-the-light-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*His name shall endure for ever... and men shall be blessed in him: all nations shall call him blessed* (Psalm 72:17) — the day all nations bless the Davidic King the queen''s blessing foreshadows.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-nations-drawn-to-the-name-and-the-light-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed be Yahuah Elohim (the LORD God), the Elohim (God) of Yashar''el (Israel), who only doeth wondrous things* (Psalm 72:18) — one breath with the queen''s blessing; the throne stands for Yahuah''s everlasting love of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-nations-drawn-to-the-name-and-the-light-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the kingdom-glory foretaste, the kings bring gold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And he shall live, and to him shall be given of the gold of Sheba* (Psalm 72:15) — the queen''s gold of Sheba is the tribute the psalm sings to the King.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all they from Sheba shall come: they shall bring gold and incense; and they shall shew forth the praises of Yahuah (LORD)* (Isaiah 60:6) — Sheba''s gold turned to its true end, the praise of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yea, all kings shall fall down before him: all nations shall serve him* (Psalm 72:11) — Solomon exceeding all the kings of the earth is the shadow of the King all kings serve.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=23
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3) — all the earth seeking Solomon''s wisdom is the firstfruit of the nations coming to Zion''s light.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=24
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The kings of Tarshish and of the isles shall bring presents: the kings of Sheba and Seba shall offer gifts* (Psalm 72:10) — the yearly tribute is the kings'' offered gifts of the psalm.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-kingdom-glory-foretaste-the-kings-bring-gold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the quiet warning of accumulation, the king-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he shall not multiply horses to himself, nor cause the people to return to Egypt... to multiply horses* (Deuteronomy 17:16) — the king-law against the chariots and horsemen Solomon gathered.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=26
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-quiet-warning-of-accumulation-the-kings-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*neither shall he greatly multiply to himself silver and gold* (Deuteronomy 17:17) — the silver made as stones in Jerusalem is the very multiplying the king was warned against.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=27
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-quiet-warning-of-accumulation-the-kings-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*nor cause the people to return to Egypt, to the end that he should multiply horses* (Deuteronomy 17:16) — Solomon''s horses brought out of Egypt reopen the one road Torah forbade.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=28
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-quiet-warning-of-accumulation-the-kings-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and his wives turned away his heart* (1 Kings 11:3) — the accumulation begun in glory runs on into the heart Deuteronomy warned would turn away.'
  FROM cross_reference_threads t
  JOIN _s342_1ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=10 AND sv.verse_number=27
  JOIN _s342_1ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-10-the-quiet-warning-of-accumulation-the-kings-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_11.sql (1 Kings 11) -----
-- 1 Kings 11 — the wisest man's heart turned by forbidden alliance; the first commandment and the
-- king-law broken; the kingdom SENTENCED to be rent, yet the lamp/one-tribe kept for David; Ahijah
-- rends the garment into twelve and gives Jeroboam ten — the two houses about to be born.
-- TAG: 1ki11   VIEW: _s342_1ki11_lookup   SORT BAND: 38150, step 3 (38150,38153,38156,38159,38162)
-- SOURCE rows all 'canon','1-kings',11,v.
--
-- 1 Kings 11 coverage:
--   v.1-2  (Solomon loved many strange women of the nations Yahuah forbade; they will turn away your heart)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 7:3-4 (make no marriages; they will turn away thy son to other gods); Nehemiah 13:26 (did not Solomon sin by these things?) [thread 1]
--   v.3    (seven hundred wives, three hundred concubines; his wives turned away his heart)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 17:17 (the king shall not multiply wives, that his heart turn not away); Nehemiah 13:26 (outlandish women caused him to sin) [thread 1]
--   v.4-8  (his heart not perfect; went after Ashtoreth, Milcom, Chemosh, Molech; built high places)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 20:3,5 (no other gods before me; a jealous Elohim); Deuteronomy 7:4 (they will turn away thy son to serve other gods); 2 Kings 17:7-8 (the same idolatry that scattered the north) [thread 2]
--   v.9-13 (Yahuah angry; thou hast not kept my covenant; I will rend the kingdom; yet one tribe for David's sake)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 7:15 (my mercy shall not depart from him); 1 Kings 9:6-7 (if ye turn, I will cut off Yashar'el) [thread 3]
--   v.30-33 (Ahijah rends the new garment into twelve; ten tribes to Jeroboam; one tribe for David)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 12:15,19-20 (the rending performed, Yashar'el rebels against the house of David); 2 Kings 17:21 (he rent Yashar'el from the house of David); Ezekiel 37:22 (they shall be no more two nations) [thread 4]
--   v.34-39 (one tribe that David may have a light alway; I will afflict the seed of David, but not for ever)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 7:16 (thy throne shall be established for ever); 1 Kings 9:5 (the throne established as I promised David); Ezekiel 37:24 (David my servant king over the gathered houses) [thread 5]
--
-- THREADS:
--   1-kings-11-the-forbidden-alliances-that-turn-the-heart (free) — Tanakh: Deut7, Deut17, Neh13
--   1-kings-11-the-first-commandment-broken-the-high-places (free) — Tanakh: Exod20, Deut7, 2Kings17
--   1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david (free) — Tanakh: 2Sam7, 1Kings9
--   1-kings-11-ahijah-rends-the-garment-the-two-houses-born (free) — Tanakh: 1Kings12, 2Kings17, Ezek37
--   1-kings-11-the-seed-of-david-afflicted-but-not-for-ever (free) — Tanakh: 2Sam7, 1Kings9, Ezek37
-- Framework-load-bearing framing: this is the hinge chapter of the whole two-house framework. The
-- wisest man's heart is turned by forbidden alliance (Deut 7:3-4) — NOT lineage failing but the
-- covenant-word broken; he breaks the first commandment (Exod 20:3) and the king-law (Deut 17:17),
-- and Nehemiah names it directly (*did not Solomon king of Yashar'el sin by these things?* Neh 13:26).
-- The kingdom is rent as covenant-judgment (Torah the broken covenant, NEVER the curse), YET the lamp
-- is kept for David's sake — the seed-line mercy of 2 Samuel 7:15-16 preserved even in judgment.
-- Ahijah's torn garment (ten to Jeroboam, one to David) is the literal birth of the two houses that
-- Ezekiel 37 will one day make one stick again — the division sentenced here is the division healed
-- there. The affliction of the seed of David is *but not for ever* (11:39) — the everlasting throne
-- of 2 Samuel 7 and the one David/one shepherd of Ezekiel 37:24 stand over the whole judgment.

CREATE TEMP VIEW _s342_1ki11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the forbidden alliances that turn the heart (11:1,2,3)
    ('canon','1-kings',11,2,'canon','deuteronomy',7,3,'free',E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). This is the very command the chapter says Solomon trampled — *the nations concerning which Yahuah (LORD) said unto the children of Yashar''el (Israel), Ye shall not go in to them, neither shall they come in unto you* (1 Kings 11:2). The covenant-word was plain; the wisest man broke it.'),
    ('canon','1-kings',11,2,'canon','deuteronomy',7,4,'free',E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly* (Deuteronomy 7:4). Torah named the exact danger in advance, and the chapter echoes it word for word — *for surely they will turn away your heart after their gods* (1 Kings 11:2). The marriage-ban was never about blood-purity but about the heart kept whole for Yahuah; the seed of promise is carried by bloodline AND covenant-word together, and here the word is cast off.'),
    ('canon','1-kings',11,1,'canon','nehemiah',13,26,'free',E'*Did not Solomon king of Yashar''el (Israel) sin by these things? yet among many nations was there no king like him, who was beloved of his Elohim (God), and Elohim (God) made him king over all Yashar''el (Israel): nevertheless even him did outlandish women cause to sin* (Nehemiah 13:26). Centuries later Nehemiah reaches back to this very chapter — *king Solomon loved many strange women* (1 Kings 11:1) — as the standing warning against the forbidden alliance: if the wisest king was turned, no man is too strong for it.'),
    ('canon','1-kings',11,3,'canon','deuteronomy',17,17,'free',E'*Neither shall he multiply wives to himself, that his heart turn not away* (Deuteronomy 17:17). The king-law spoke the outcome before it happened, and the chapter records the law and its breaking in one stroke — *he had seven hundred wives, princesses, and three hundred concubines: and his wives turned away his heart* (1 Kings 11:3). The very turning Torah foresaw is the turning that befalls him.'),
    ('canon','1-kings',11,3,'canon','nehemiah',13,26,'free',E'*nevertheless even him did outlandish women cause to sin* (Nehemiah 13:26). The multiplied wives whose end was that they *turned away his heart* (1 Kings 11:3) are the outlandish women Nehemiah names — the inspired verdict on the chapter, that the alliance, not the lineage, undid him.'),

    -- THREAD 2: the first commandment broken, the high places (11:4,5,6,7,8)
    ('canon','1-kings',11,4,'canon','exodus',20,3,'free',E'*Thou shalt have no other gods before me* (Exodus 20:3). The first word of the ten is the word Solomon''s old age overturns — *his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God)* (1 Kings 11:4). The heart that is not perfect with Yahuah is the heart that has set up other gods before him.'),
    ('canon','1-kings',11,4,'canon','deuteronomy',7,4,'free',E'*For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). What Torah warned the strange wives would do, they have now done to the wisest son of all — *when Solomon was old, that his wives turned away his heart after other gods* (1 Kings 11:4). The warning of the marriage-ban is fulfilled in the very king who should have known it best.'),
    ('canon','1-kings',11,5,'canon','exodus',20,5,'free',E'*Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5). When *Solomon went after Ashtoreth the goddess of the Zidonians, and after Milcom the abomination of the Ammonites* (1 Kings 11:5), he served the gods the jealous Elohim forbade — and the anger of 11:9 is the jealousy of the second word answered.'),
    ('canon','1-kings',11,7,'canon','exodus',20,3,'free',E'*Thou shalt have no other gods before me* (Exodus 20:3). The high place Solomon built *for Chemosh, the abomination of Moab... and for Molech, the abomination of the children of Ammon* (1 Kings 11:7) raises the very rival altars the first commandment forbids — built, of all places, *in the hill that is before Jerusalem*, in sight of the house of Yahuah.'),
    ('canon','1-kings',11,8,'canon','2-kings',17,8,'free',E'*And walked in the statutes of the heathen, whom Yahuah (LORD) cast out from before the children of Yashar''el (Israel)* (2 Kings 17:8). The strange wives'' altars where they *burnt incense and sacrificed unto their gods* (1 Kings 11:8) are the first stones of the road that ends with the northern house scattered for walking in the statutes of the heathen — the sin sown here is the sin that empties the land.'),
    ('canon','1-kings',11,6,'canon','2-kings',17,7,'free',E'*For so it was, that the children of Yashar''el (Israel) had sinned against Yahuah (LORD) their Elohim (God)... and had feared other gods* (2 Kings 17:7). That *Solomon did evil in the sight of Yahuah (LORD), and went not fully after Yahuah (LORD)* (1 Kings 11:6) is the headwater of the indictment 2 Kings will lay against the whole northern house — the fearing of other gods that began in the king''s own bed.'),

    -- THREAD 3: the kingdom rent yet the lamp kept for David (11:11,12,13)
    ('canon','1-kings',11,11,'canon','1-kings',9,6,'free',E'*But if ye shall at all turn from following me, ye or your children, and will not keep my commandments and my statutes which I have set before you, but go and serve other gods, and worship them* (1 Kings 9:6). At the second appearing Yahuah set the condition, and now the sentence falls on the breach of it — *thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee* (1 Kings 11:11). The judgment is the covenant''s own word coming true; the Torah is the broken covenant here, never the curse.'),
    ('canon','1-kings',11,11,'canon','1-kings',9,7,'free',E'*Then will I cut off Yashar''el (Israel) out of the land which I have given them; and this house, which I have hallowed for my name, will I cast out of my sight* (1 Kings 9:7). The threatened cutting-off begins its slow work in the rending — *I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). What was warned at the temple''s dedication is now spoken over the king''s house.'),
    ('canon','1-kings',11,12,'canon','2-samuel',7,15,'free',E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15). The judgment is real, yet it bends to the Davidic promise — *Notwithstanding in thy days I will not do it for David thy father''s sake: but I will rend it out of the hand of thy son* (1 Kings 11:12). The mercy that would not depart from David''s house stays the hand of the sentence; the seed-line is spared even as the kingdom is rent.'),
    ('canon','1-kings',11,13,'canon','2-samuel',7,16,'free',E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). This is why one tribe is kept — *I will not rend away all the kingdom; but will give one tribe to thy son for David my servant''s sake, and for Jerusalem''s sake which I have chosen* (1 Kings 11:13). The everlasting throne sworn to David is the reason the lamp is not put out; the covenant mercy preserves the seed even in the day of judgment.'),

    -- THREAD 4: Ahijah rends the garment, the two houses born (11:30,31,32,33)
    ('canon','1-kings',11,31,'canon','1-kings',12,15,'free',E'*Wherefore the king hearkened not unto the people; for the cause was from Yahuah (LORD), that he might perform his saying, which Yahuah (LORD) spake by Ahijah the Shilonite unto Jeroboam the son of Nebat* (1 Kings 12:15). The torn garment is no mere sign; the next chapter records its performing — *Take thee ten pieces: for thus saith Yahuah (LORD)... I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The prophet''s word and its fulfilment frame the birth of the division.'),
    ('canon','1-kings',11,31,'canon','1-kings',12,20,'free',E'*there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20). The ten pieces given to Jeroboam become the ten tribes that follow him, and the one tribe kept for David becomes Yahudah standing alone — *will give ten tribes to thee* (1 Kings 11:31) is the very shape of the kingdom that splits in two.'),
    ('canon','1-kings',11,30,'canon','2-kings',17,21,'free',E'*For he rent Yashar''el (Israel) from the house of David; and they made Jeroboam the son of Nebat king* (2 Kings 17:21). The rending Ahijah enacted with a garment — *Ahijah caught the new garment that was on him, and rent it in twelve pieces* (1 Kings 11:30) — is named again as the founding wound of the northern house, the tearing-away that 2 Kings traces to the very exile of Israel.'),
    ('canon','1-kings',11,33,'canon','2-kings',17,21,'free',E'*and Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD), and made them sin a great sin* (2 Kings 17:21). The reason given for the rending — *because that they have forsaken me, and have worshipped Ashtoreth... Chemosh... and Milcom* (1 Kings 11:33) — is the same idolatry that, deepened under Jeroboam, carries the northern house all the way to Assyria.'),
    ('canon','1-kings',11,31,'canon','ezekiel',37,22,'free',E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two kingdoms Ezekiel promises to undo are the two born here — *I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The division sentenced by Ahijah''s torn garment is the very division Ezekiel''s two sticks will one day heal into one.'),

    -- THREAD 5: the seed of David afflicted but not for ever (11:34,36,38,39)
    ('canon','1-kings',11,36,'canon','2-samuel',7,16,'free',E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The one tribe is kept so the lamp never goes out — *that David my servant may have a light alway before me in Jerusalem, the city which I have chosen me to put my name there* (1 Kings 11:36). The light kept burning in Jerusalem is the everlasting throne of the Davidic covenant guarded through the night of judgment.'),
    ('canon','1-kings',11,34,'canon','1-kings',9,5,'free',E'*Then I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever, as I promised to David thy father, saying, There shall not fail thee a man upon the throne of Yashar''el (Israel)* (1 Kings 9:5). The reason Solomon is left prince all his days — *for David my servant''s sake, whom I chose, because he kept my commandments and my statutes* (1 Kings 11:34) — is the promise of the second appearing held fast: the throne is upheld for David''s faithfulness, not Solomon''s.'),
    ('canon','1-kings',11,39,'canon','2-samuel',7,15,'free',E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15). The affliction is bounded by a promise — *And I will for this afflict the seed of David, but not for ever* (1 Kings 11:39). The mercy that will not depart sets the limit on the chastening; the seed of David is afflicted, never abandoned.'),
    ('canon','1-kings',11,39,'canon','ezekiel',37,24,'free',E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The *not for ever* of the affliction (1 Kings 11:39) opens toward the day the seed of David rules the regathered houses as one shepherd — the kingdom rent here is restored in the one David Ezekiel sees, the two houses made one under him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-11-the-forbidden-alliances-that-turn-the-heart',
       E'The forbidden alliances that turn the heart',
       E'The wisest man Yahuah ever made is undone not by a foreign army but by a forbidden alliance. *But king Solomon loved many strange women, together with the daughter of Pharaoh, women of the Moabites, Ammonites, Edomites, Zidonians, and Hittites; of the nations concerning which Yahuah (LORD) said unto the children of Yashar''el (Israel), Ye shall not go in to them, neither shall they come in unto you: for surely they will turn away your heart after their gods: Solomon clave unto these in love* (1 Kings 11:1-2). The marriage-ban was Torah''s, word for word: *Neither shalt thou make marriages with them... For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:3-4). It was never blood-purity Torah guarded but the heart kept whole for Yahuah — the seed of promise carried by bloodline AND covenant-word together, and here the word is thrown away. The king-law had named the very outcome: *Neither shall he multiply wives to himself, that his heart turn not away* (Deuteronomy 17:17). And it turned: *he had seven hundred wives, princesses, and three hundred concubines: and his wives turned away his heart* (1 Kings 11:3). Centuries on, Nehemiah reaches back to this chapter as the standing warning: *Did not Solomon king of Yashar''el (Israel) sin by these things? yet among many nations was there no king like him... nevertheless even him did outlandish women cause to sin* (Nehemiah 13:26). If the wisest was turned, none is too strong for the snare.',
       sv.verse_id, ev.verse_id, 'free', 38150
  FROM _s342_1ki11_lookup sv, _s342_1ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-11-the-first-commandment-broken-the-high-places',
       E'The first commandment broken — the high places',
       E'The turned heart bears its fruit in stone and fire. *For it came to pass, when Solomon was old, that his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God), as was the heart of David his father* (1 Kings 11:4) — the heart not perfect with Yahuah is the heart that has set up rivals, and the very first word of the ten is overturned: *Thou shalt have no other gods before me* (Exodus 20:3). He went after the gods of the second word too: *For Solomon went after Ashtoreth the goddess of the Zidonians, and after Milcom the abomination of the Ammonites* (1 Kings 11:5), and the jealous Elohim had said *Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5). Then he built the rival altars in sight of the house: *Then did Solomon build an high place for Chemosh, the abomination of Moab, in the hill that is before Jerusalem, and for Molech, the abomination of the children of Ammon* (1 Kings 11:7). What the strange wives would do, Torah had foretold: *they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). And this idolatry begun in the king''s own bed is the headwater of the great scattering: *the children of Yashar''el (Israel) had sinned against Yahuah (LORD) their Elohim (God)... and had feared other gods, and walked in the statutes of the heathen* (2 Kings 17:7-8). The sin sown here is the sin that one day empties the northern land.',
       sv.verse_id, ev.verse_id, 'free', 38153
  FROM _s342_1ki11_lookup sv, _s342_1ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david',
       E'The kingdom rent — yet the lamp kept for David',
       E'The sentence falls, and it is the covenant''s own word coming true — never the Torah as a curse, but the broken covenant answering. *Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). The condition had been set at the second appearing: *But if ye shall at all turn from following me... but go and serve other gods, and worship them* (1 Kings 9:6), with the threat *then will I cut off Yashar''el (Israel) out of the land which I have given them* (1 Kings 9:7). Yet the judgment bends to the Davidic promise and will not break it. *Notwithstanding in thy days I will not do it for David thy father''s sake: but I will rend it out of the hand of thy son. Howbeit I will not rend away all the kingdom; but will give one tribe to thy son for David my servant''s sake, and for Jerusalem''s sake which I have chosen* (1 Kings 11:12-13). This is the mercy of 2 Samuel 7 holding the seed-line fast: *But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15); *thy throne shall be established for ever* (2 Samuel 7:16). The kingdom is torn for covenant-breaking, yet one tribe — one lamp — is kept burning, because the everlasting throne sworn to David cannot fail.',
       sv.verse_id, ev.verse_id, 'free', 38156
  FROM _s342_1ki11_lookup sv, _s342_1ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=11 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-11-ahijah-rends-the-garment-the-two-houses-born',
       E'Ahijah rends the garment — the two houses born',
       E'Here, in a field outside Jerusalem, the two houses of the framework are born. *And Ahijah caught the new garment that was on him, and rent it in twelve pieces: and he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:30-31) — but *he shall have one tribe for my servant David''s sake* (1 Kings 11:32). The reason is the idolatry the chapter has traced: *because that they have forsaken me, and have worshipped Ashtoreth the goddess of the Zidonians, Chemosh the god of the Moabites, and Milcom the god of the children of Ammon* (1 Kings 11:33). The torn garment is no empty sign; the next chapter performs it — *the cause was from Yahuah (LORD), that he might perform his saying, which Yahuah (LORD) spake by Ahijah the Shilonite* (1 Kings 12:15) — and Yashar''el follows Jeroboam while *there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20). Long after, the founding wound is named again: *For he rent Yashar''el (Israel) from the house of David; and they made Jeroboam the son of Nebat king; and Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD)* (2 Kings 17:21). Two kingdoms are made this day — and the very tearing is what Ezekiel is sent to undo: *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The torn garment of Ahijah is the two sticks Ezekiel will join into one.',
       sv.verse_id, ev.verse_id, 'free', 38159
  FROM _s342_1ki11_lookup sv, _s342_1ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=11 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-11-the-seed-of-david-afflicted-but-not-for-ever',
       E'The seed of David afflicted — but not for ever',
       E'Even in the sentence of division, the Davidic covenant sets the bounds of the judgment. Solomon is left prince all his days for one reason: *I will make him prince all the days of his life for David my servant''s sake, whom I chose, because he kept my commandments and my statutes* (1 Kings 11:34) — the promise of the second appearing held fast, *Then I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever, as I promised to David thy father, saying, There shall not fail thee a man upon the throne of Yashar''el (Israel)* (1 Kings 9:5). The one tribe is kept so the lamp never goes out: *that David my servant may have a light alway before me in Jerusalem, the city which I have chosen me to put my name there* (1 Kings 11:36) — the throne *established for ever* of *thine house and thy kingdom shall be established for ever before thee* (2 Samuel 7:16). And the chastening itself is bounded by mercy: *And I will for this afflict the seed of David, but not for ever* (1 Kings 11:39), the *my mercy shall not depart away from him* of 2 Samuel 7:15 setting the limit. That *not for ever* opens all the way to the day the seed of David rules the regathered houses as one shepherd: *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The kingdom rent in this chapter is the kingdom restored under the one David — the affliction was never the end of the seed-line, only its night.',
       sv.verse_id, ev.verse_id, 'free', 38162
  FROM _s342_1ki11_lookup sv, _s342_1ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=11 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: the forbidden alliances that turn the heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — the marriage-ban Solomon trampled, word for word.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-forbidden-alliances-that-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — Torah named the exact danger; 1 Kings 11:2 echoes it verbatim.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-forbidden-alliances-that-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Did not Solomon king of Yashar''el (Israel) sin by these things?... even him did outlandish women cause to sin* (Nehemiah 13:26) — the inspired verdict reaching back to this chapter.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=13 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-forbidden-alliances-that-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Neither shall he multiply wives to himself, that his heart turn not away* (Deuteronomy 17:17) — the king-law spoke the outcome before it happened.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=17 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-forbidden-alliances-that-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*nevertheless even him did outlandish women cause to sin* (Nehemiah 13:26) — the multiplied wives of 11:3 named as the outlandish women who undid him.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=13 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-forbidden-alliances-that-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the first commandment broken, the high places
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt have no other gods before me* (Exodus 20:3) — the first word of the ten, overturned by the heart not perfect with Yahuah.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — the marriage-ban''s warning fulfilled in the wisest son of all.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:5) — the jealousy answered by the anger of 11:9.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=5
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt have no other gods before me* (Exodus 20:3) — the high place for Chemosh and Molech raised in sight of Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=7
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And walked in the statutes of the heathen, whom Yahuah (LORD) cast out from before the children of Yashar''el (Israel)* (2 Kings 17:8) — the strange wives'' altars are the first stones of the road to the northern exile.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the children of Yashar''el (Israel) had sinned against Yahuah (LORD)... and had feared other gods* (2 Kings 17:7) — Solomon doing evil is the headwater of the indictment against the whole northern house.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=6
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-first-commandment-broken-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the kingdom rent yet the lamp kept for david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*But if ye shall at all turn from following me... but go and serve other gods, and worship them* (1 Kings 9:6) — the condition set at the second appearing, now breached.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then will I cut off Yashar''el (Israel) out of the land which I have given them* (1 Kings 9:7) — the threatened cutting-off begins its work in the rending.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*But my mercy shall not depart away from him, as I took it from Saul* (2 Samuel 7:15) — the Davidic mercy stays the hand: not in thy days, but thy son''s.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thy throne shall be established for ever* (2 Samuel 7:16) — the everlasting throne is why one tribe is kept for David''s sake.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=13
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-kingdom-rent-yet-the-lamp-kept-for-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: ahijah rends the garment, the two houses born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the cause was from Yahuah (LORD), that he might perform his saying, which Yahuah (LORD) spake by Ahijah the Shilonite* (1 Kings 12:15) — the torn garment performed in the next chapter.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-ahijah-rends-the-garment-the-two-houses-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20) — the ten pieces become the ten tribes, the one tribe becomes Yahudah alone.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-ahijah-rends-the-garment-the-two-houses-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For he rent Yashar''el (Israel) from the house of David; and they made Jeroboam the son of Nebat king* (2 Kings 17:21) — the founding wound of the northern house named again.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=30
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-ahijah-rends-the-garment-the-two-houses-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD), and made them sin a great sin* (2 Kings 17:21) — the idolatry of 11:33, deepened, carries the north to Assyria.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=33
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-ahijah-rends-the-garment-the-two-houses-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two kingdoms born here are the two Ezekiel''s sticks will join into one.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=31
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-ahijah-rends-the-garment-the-two-houses-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: the seed of david afflicted but not for ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy throne shall be established for ever* (2 Samuel 7:16) — the one tribe kept so David has a light alway in Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=36
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-seed-of-david-afflicted-but-not-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then I will establish the throne of thy kingdom upon Yashar''el (Israel) for ever, as I promised to David thy father* (1 Kings 9:5) — Solomon left prince for David''s sake, the second-appearing promise held fast.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=34
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-seed-of-david-afflicted-but-not-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*But my mercy shall not depart away from him, as I took it from Saul* (2 Samuel 7:15) — the mercy sets the limit: afflicted, *but not for ever*.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=39
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-seed-of-david-afflicted-but-not-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And David my servant shall be king over them; and they all shall have one shepherd* (Ezekiel 37:24) — the *not for ever* opens to the one David ruling the regathered houses.'
  FROM cross_reference_threads t
  JOIN _s342_1ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=11 AND sv.verse_number=39
  JOIN _s342_1ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-11-the-seed-of-david-afflicted-but-not-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_12.sql (1 Kings 12) -----
-- 1 Kings 12 — THE KEYSTONE: the kingdom splits at Shechem; the two houses are born; Jeroboam's golden calves.
-- TAG: 1ki12   VIEW: _s342_1ki12_lookup   SORT BAND: 38175, step 3 (38175,38178,38181,38184,38187,38190)
-- SOURCE rows all 'canon','1-kings',12,v.
--
-- 1 Kings 12 coverage:
--   v.10-11,14 (Rehoboam forsakes the old men; the heavy yoke; whips and scorpions)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 10:10-11,14 (parallel telling); 1 Kings 11:11 (the sentence to be performed) [thread 1]
--   v.15   (the king hearkened not; the cause was from Yahuah, that he might perform his saying by Ahijah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 11:11,31 (the rending decreed; the ten tribes); 2 Chronicles 10:15 (parallel) [thread 1]
--   v.16,19,20 (THE SPLIT — what portion in David; to your tents; Yashar'el rebels; none but Yahudah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Samuel 20:1 (the SAME cry — Sheba: no part in David); 1 Kings 11:31 (ten tribes torn);
--                  Ezekiel 37:16,19,22 (the two sticks made one; no more two nations); Hosea 1:11 (one head) [thread 2]
--   v.21,24 (Rehoboam musters to fight; Yahuah forbids — ye shall not fight against your brethren; this is from me)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 11:1,4 (parallel); Ezekiel 37:22 (one nation, no more divided — the brethren reunited) [thread 3]
--   v.26-28 (Jeroboam's fear; the two calves of gold; behold thy gods which brought thee out of Egypt)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Exodus 32:4,8 (Aaron's calf — the EXACT words); 1 Kings 11:31 (the ten tribes he now corrupts) [thread 4]
--   v.28,30 (the calves; this thing became a sin — the founding sin of the north)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Hosea 8:5-6 (calf of Samaria broken in pieces); Hosea 13:2 (kiss the calves); 2 Kings 17:21-23 (Jeroboam drave Yashar'el from Yahuah; the scattering) [thread 5]
--   v.31-33 (priests of the lowest, not Levi; a feast in the eighth month, devised of his own heart)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Leviticus 23:34,39 (the feast of tabernacles — the SEVENTH month, the appointed time counterfeited);
--                  2 Chronicles 11:14-15 (the Levites cast off; priests for the calves); Amos 7:13 (Beth-el the king's chapel) [thread 6]
--
-- THREADS:
--   1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed (free) — Tanakh: 2Chr10, 1Kings11
--   1-kings-12-what-portion-in-david-the-two-houses-are-born (free) — Tanakh: 2Sam20, 1Kings11, Ezek37, Hosea1
--   1-kings-12-ye-shall-not-fight-against-your-brethren (free) — Tanakh: 2Chr11, Ezek37
--   1-kings-12-the-two-calves-of-gold-aarons-sin-recapitulated (free) — Tanakh: Exod32, 1Kings11
--   1-kings-12-the-sin-of-jeroboam-that-scattered-the-north (free) — Tanakh: Hosea8, Hosea13, 2Kings17
--   1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced (free) — Tanakh: Lev23, 2Chr11, Amos7
-- Framework-load-bearing framing:
--   ★★★ THE TWO HOUSES (thread 2): 12:16's cry *What portion have we in David?* is verbatim the rebel
--   cry of Sheba (2 Sam 20:1); here it succeeds, and *there was none that followed the house of David, but
--   the tribe of Yahudah (Judah) only* (12:20) — Yahudah/south vs Yashar'el-Ephraim/north, the wound the
--   rest of the canon labors to heal (Ezek 37:16-22 the two sticks made one, no more two nations; Hosea 1:11
--   one head). Framed NOT as God's rejection of the north but as the division the prophets promise to heal.
--   ★ Brethren not enemies (thread 3): 12:24 *your brethren the children of Yashar'el (Israel)* — victims of
--   a covenant breach, never enemies; the war is forbidden because they are one people torn.
--   ★★★ THE CALVES (thread 4): 12:28's *behold thy gods, O Yashar'el (Israel), which brought thee up out of
--   the land of Egypt* is word-for-word Aaron's calf (Exod 32:4,8) — Jeroboam's founding sin recapitulates
--   the wilderness apostasy, and it scatters the north (thread 5; 2 Kings 17:21-23, Hosea 8/13).
--   ★ The moedim counterfeited (thread 6): the feast moved from the SEVENTH month (Lev 23:34,39, the feast of
--   tabernacles, *a statute for ever*) to the eighth, *which he had devised of his own heart* (12:33) — man's
--   calendar against Yahuah's appointed times; the Levitical order displaced by *priests of the lowest of the
--   people, which were not of the sons of Levi* (12:31).

CREATE TEMP VIEW _s342_1ki12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the heavy yoke and the scorpions, the sentence performed (12:11,14,15)
    ('canon','1-kings',12,11,'canon','2-chronicles',10,11,'free',E'*For whereas my father put a heavy yoke upon you, I will put more to your yoke: my father chastised you with whips, but I will chastise you with scorpions* (2 Chronicles 10:11). The Chronicler tells the folly word for word; Rehoboam takes the young men''s counsel and threatens to crush the very people who begged him to *make thou it lighter unto us* (1 Kings 12:11).'),
    ('canon','1-kings',12,14,'canon','2-chronicles',10,14,'free',E'*And answered them after the advice of the young men, saying, My father made your yoke heavy, but I will add thereto: my father chastised you with whips, but I will chastise you with scorpions* (2 Chronicles 10:14). The same hardness in both tellings — *My father made your yoke heavy, and I will add to your yoke... I will chastise you with scorpions* (1 Kings 12:14) — the king forsakes the old men''s servant-counsel and seals the breach.'),
    ('canon','1-kings',12,15,'canon','1-kings',11,11,'free',E'*Wherefore Yahuah (LORD) said unto Solomon... I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11). The narrator names the deeper cause: *the cause was from Yahuah (LORD), that he might perform his saying* (1 Kings 12:15) — Rehoboam''s folly is the instrument by which the sentence already spoken upon Solomon''s idolatry comes to pass.'),
    ('canon','1-kings',12,15,'canon','1-kings',11,31,'free',E'*and will give ten tribes to thee* (1 Kings 11:31). The saying Yahuah *spake by Ahijah the Shilonite unto Jeroboam the son of Nebat* (1 Kings 12:15) is the prophet''s torn garment of the chapter before — ten pieces given to Jeroboam — now coming true through a king who would not listen.'),
    ('canon','1-kings',12,15,'canon','2-chronicles',10,15,'free',E'*for the cause was of Elohim (God), that Yahuah (LORD) might perform his word, which he spake by the hand of Ahijah the Shilonite to Jeroboam the son of Nebat* (2 Chronicles 10:15). The parallel confirms the hidden hand: the breach is judgment for the covenant Solomon broke, not blind politics.'),

    -- THREAD 2: what portion in David, the two houses are born (12:16,19,20)
    ('canon','1-kings',12,16,'canon','2-samuel',20,1,'free',E'*We have no part in David, neither have we inheritance in the son of Jesse: every man to his tents, O Yashar''el (Israel)* (2 Samuel 20:1). This is the very cry of Sheba the man of Belial — and now, at Shechem, it succeeds: *What portion have we in David? neither have we inheritance in the son of Jesse: to your tents, O Yashar''el (Israel)* (1 Kings 12:16). The rebel slogan once put down becomes the founding word of the northern kingdom.'),
    ('canon','1-kings',12,16,'canon','1-kings',11,31,'free',E'*Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The departure of the ten tribes — *So Yashar''el (Israel) departed unto their tents* (1 Kings 12:16) — is the tearing Ahijah enacted with the new garment; the word becomes a nation walking away from the house of David.'),
    ('canon','1-kings',12,19,'canon','ezekiel',37,22,'free',E'*and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). 1 Kings 12:19 names the wound — *So Yashar''el (Israel) rebelled against the house of David unto this day* — and Ezekiel names its healing: the two kingdoms born here will be divided no more.'),
    ('canon','1-kings',12,20,'canon','ezekiel',37,16,'free',E'*take thee one stick, and write upon it, For Yahudah (Judah)... then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16). The two sticks are the two houses born in this verse: *there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20) — Yahudah in one hand, Joseph-Ephraim in the other, waiting to be joined.'),
    ('canon','1-kings',12,20,'canon','ezekiel',37,19,'free',E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The division of 1 Kings 12:20 — Yahudah alone following David — is exactly what the LORD promises to undo, making the two one in his hand.'),
    ('canon','1-kings',12,20,'canon','hosea',1,11,'free',E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). When *none... followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20), two heads were set up where there had been one; Hosea promises the day the two houses appoint themselves one head again.'),

    -- THREAD 3: ye shall not fight against your brethren (12:21,24)
    ('canon','1-kings',12,21,'canon','2-chronicles',11,1,'free',E'*And when Rehoboam was come to Jerusalem, he gathered of the house of Yahudah (Judah) and Benjamin an hundred and fourscore thousand chosen men, which were warriors, to fight against Yashar''el (Israel)* (2 Chronicles 11:1). The parallel of the muster: Rehoboam assembles Yahudah and Benjamin *to fight against the house of Yashar''el (Israel), to bring the kingdom again* (1 Kings 12:21) — a civil war against his own people, halted before it begins.'),
    ('canon','1-kings',12,24,'canon','2-chronicles',11,4,'free',E'*Thus saith Yahuah (LORD), Ye shall not go up, nor fight against your brethren: return every man to his house: for this thing is done of me* (2 Chronicles 11:4). The word through Shemaiah, told twice, forbids the war and names the reason: they are *brethren*, and *this thing is from me* (1 Kings 12:24) — the split is Yahuah''s judgment, not a quarrel to be settled by the sword.'),
    ('canon','1-kings',12,24,'canon','ezekiel',37,22,'free',E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all* (Ezekiel 37:22). Yahuah will not let Yahudah destroy *your brethren the children of Yashar''el (Israel)* (1 Kings 12:24) because the torn houses are still one people — the very people he promises to make one nation again under one king.'),

    -- THREAD 4: the two calves of gold, Aaron's sin recapitulated (12:28)
    ('canon','1-kings',12,28,'canon','exodus',32,4,'free',E'*and they said, These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4). Jeroboam speaks Aaron''s words almost letter for letter: *behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). The founding sin of the northern kingdom is the wilderness golden calf raised up again.'),
    ('canon','1-kings',12,28,'canon','exodus',32,8,'free',E'*They have turned aside quickly out of the way which I commanded them: they have made them a molten calf, and have worshipped it... and said, These be thy gods, O Yashar''el (Israel), which have brought thee up out of the land of Egypt* (Exodus 32:8). Yahuah''s own indictment of the calf is the template; Jeroboam''s two calves of gold (1 Kings 12:28) repeat the turning-aside the LORD condemned at Sinai.'),
    ('canon','1-kings',12,28,'canon','1-kings',11,31,'free',E'*Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The ten tribes Yahuah gave into Jeroboam''s hand he now leads into sin: fearing they will *go up to Jerusalem* (1 Kings 12:28), he gives them gods of gold instead — the gift of a kingdom turned into the founding of an apostasy.'),

    -- THREAD 5: the sin of Jeroboam that scattered the north (12:28,30)
    ('canon','1-kings',12,28,'canon','hosea',8,5,'free',E'*Thy calf, O Samaria, hath cast thee off; mine anger is kindled against them: how long will it be ere they attain to innocency? For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (Hosea 8:5-6). The two calves Jeroboam *made* (1 Kings 12:28) become *the calf of Samaria* the prophet condemns — a workman''s thing, no god at all, doomed to be broken.'),
    ('canon','1-kings',12,30,'canon','hosea',13,2,'free',E'*And now they sin more and more, and have made them molten images of their silver, and idols according to their own understanding, all of it the work of the craftsmen: they say of them, Let the men that sacrifice kiss the calves* (Hosea 13:2). *And this thing became a sin* (1 Kings 12:30) — the kissing of the calves Hosea names is the long fruit of the sin Jeroboam planted at Beth-el and Dan.'),
    ('canon','1-kings',12,30,'canon','2-kings',17,21,'free',E'*For he rent Yashar''el (Israel) from the house of David; and they made Jeroboam the son of Nebat king: and Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD), and made them sin a great sin* (2 Kings 17:21). The narrator of the exile reads 1 Kings 12 back from the end: *this thing became a sin* (1 Kings 12:30), and that sin, never repented, *drave Yashar''el from following Yahuah* — the road to the Assyrian scattering.'),
    ('canon','1-kings',12,28,'canon','2-kings',17,16,'free',E'*And they left all the commandments of Yahuah (LORD) their Elohim (God), and made them molten images, even two calves, and made a grove, and worshipped all the host of heaven, and served Baal* (2 Kings 17:16). *Two calves of gold* (1 Kings 12:28) is named at the end as the very sin that emptied the land — the two calves of Jeroboam still standing in the indictment that explains the exile.'),

    -- THREAD 6: the counterfeit feast and priesthood, the moedim displaced (12:31,32,33)
    ('canon','1-kings',12,31,'canon','2-chronicles',11,14,'free',E'*For the Levites left their suburbs and their possession, and came to Yahudah (Judah) and Jerusalem: for Jeroboam and his sons had cast them off from executing the priest''s office unto Yahuah (LORD)* (2 Chronicles 11:14). Jeroboam *made priests of the lowest of the people, which were not of the sons of Levi* (1 Kings 12:31); the Chronicler shows the other side — the true Levites driven out, the ordained order overthrown.'),
    ('canon','1-kings',12,31,'canon','2-chronicles',11,15,'free',E'*And he ordained him priests for the high places, and for the devils, and for the calves which he had made* (2 Chronicles 11:15). The non-Levite priesthood of 1 Kings 12:31 is named for what it served — the high places, the devils, the calves; a counterfeit clergy for a counterfeit cult.'),
    ('canon','1-kings',12,32,'canon','leviticus',23,34,'free',E'*Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34). Yahuah set his feast in the SEVENTH month; Jeroboam *ordained a feast in the eighth month, on the fifteenth day of the month, like unto the feast that is in Yahudah (Judah)* (1 Kings 12:32) — the appointed time copied, but moved a month off Yahuah''s calendar.'),
    ('canon','1-kings',12,33,'canon','leviticus',23,39,'free',E'*Also in the fifteenth day of the seventh month, when ye have gathered in the fruit of the land, ye shall keep a feast unto Yahuah (LORD) seven days... It shall be a statute for ever in your generations: ye shall celebrate it in the seventh month* (Leviticus 23:39,41). The feast was *a statute for ever* in the seventh month; Jeroboam kept it *in the month which he had devised of his own heart* (1 Kings 12:33) — man''s invented worship set against Yahuah''s standing appointment.'),
    ('canon','1-kings',12,32,'canon','amos',7,13,'free',E'*But prophesy not again any more at Beth-el: for it is the king''s chapel, and it is the king''s court* (Amos 7:13). The altar Jeroboam built and the feast he kept *in Beth-el* (1 Kings 12:32) become, generations later, *the king''s chapel* from which the prophet is expelled — the devised worship hardened into a royal sanctuary that cannot bear the word of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed',
       E'The heavy yoke and the scorpions — the sentence performed',
       E'A whole kingdom hangs on a young king''s answer. The people ask only relief: *Thy father made our yoke grievous: now therefore make thou the grievous service of thy father, and his heavy yoke which he put upon us, lighter, and we will serve thee* (1 Kings 12:4). The old men counsel mercy — *if thou wilt be a servant unto this people this day... then they will be thy servants for ever* (1 Kings 12:7) — but Rehoboam forsakes them for the young men and threatens to crush: *My father made your yoke heavy, and I will add to your yoke: my father also chastised you with whips, but I will chastise you with scorpions* (1 Kings 12:14), word for word as the Chronicler tells it (2 Chronicles 10:11,14). Yet the narrator lifts the curtain on a deeper cause: *Wherefore the king hearkened not unto the people; for the cause was from Yahuah (LORD), that he might perform his saying, which Yahuah (LORD) spake by Ahijah the Shilonite unto Jeroboam the son of Nebat* (1 Kings 12:15). The folly is real, and the man is accountable — but it is also the instrument of the sentence already spoken: *I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11), the *ten tribes* (1 Kings 11:31) torn from the house of David for the covenant Solomon broke. The scorpions are not the cause of the split; they are the occasion through which a long-decreed judgment arrives.',
       sv.verse_id, ev.verse_id, 'free', 38175
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-what-portion-in-david-the-two-houses-are-born',
       E'What portion have we in David? — the two houses are born',
       E'This is the wound the rest of the canon labors to heal. When the king will not relent, the ten tribes raise an old, dangerous cry: *What portion have we in David? neither have we inheritance in the son of Jesse: to your tents, O Yashar''el (Israel): now see to thine own house, David. So Yashar''el (Israel) departed unto their tents* (1 Kings 12:16). It is verbatim the slogan of Sheba the man of Belial, *We have no part in David, neither have we inheritance in the son of Jesse: every man to his tents, O Yashar''el (Israel)* (2 Samuel 20:1) — once a rebellion put down, now the founding word of a nation. The breach is permanent: *So Yashar''el (Israel) rebelled against the house of David unto this day* (1 Kings 12:19), and *there was none that followed the house of David, but the tribe of Yahudah (Judah) only* (1 Kings 12:20). The torn garment of Ahijah has come true — *I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). From this day there are TWO houses: Yahudah in the south, Yashar''el-Ephraim-Joseph in the north. But the same canon that records the wound promises its healing. Ezekiel takes two sticks, *For Yahudah (Judah)... For Joseph, the stick of Ephraim* (Ezekiel 37:16), and joins them: *I will take the stick of Joseph, which is in the hand of Ephraim... and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Hosea sings the same hope: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11). Two heads were set up at Shechem; one Head is promised at the end. The division is never God''s final word over his people — it is the wound the Shepherd comes to bind.',
       sv.verse_id, ev.verse_id, 'free', 38178
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-ye-shall-not-fight-against-your-brethren',
       E'Ye shall not fight against your brethren',
       E'The split could have become a slaughter. Rehoboam musters for civil war: *he assembled all the house of Yahudah (Judah), with the tribe of Benjamin, an hundred and fourscore thousand chosen men, which were warriors, to fight against the house of Yashar''el (Israel), to bring the kingdom again to Rehoboam* (1 Kings 12:21; so too 2 Chronicles 11:1). But the word of Elohim through Shemaiah stops the sword and names the bond that forbids it: *Thus saith Yahuah (LORD), Ye shall not go up, nor fight against your brethren the children of Yashar''el (Israel): return every man to his house; for this thing is from me* (1 Kings 12:24; 2 Chronicles 11:4). Two things hold here at once. They are *brethren* — the northern tribes are not enemies to be destroyed but kin torn away, victims of a covenant breach. And *this thing is from me* — the division is Yahuah''s own judgment for Solomon''s sin, not a quarrel for armies to undo. So the very God who tore the kingdom forbids Yahudah to make the tearing into a bloodbath, because the torn houses are still one people. That is why the war is unlawful: they are the same flock he will one day gather — *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all* (Ezekiel 37:22). You do not slaughter the brother you are destined to be made one with.',
       sv.verse_id, ev.verse_id, 'free', 38181
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-the-two-calves-of-gold-aarons-sin-recapitulated',
       E'The two calves of gold — Aaron''s sin recapitulated',
       E'Fearing the people will return to David if they keep going up to the temple, Jeroboam invents a religion. *And Jeroboam said in his heart, Now shall the kingdom return to the house of David: if this people go up to do sacrifice in the house of Yahuah (LORD) at Jerusalem, then shall the heart of this people turn again unto their lord* (1 Kings 12:26-27). So he reaches back for the oldest apostasy of all: *the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). The words are not new — they are Aaron''s. At Sinai the people made a molten calf and cried *These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4), and Yahuah himself indicted them: *they have made them a molten calf, and have worshipped it... and said, These be thy gods, O Yashar''el (Israel), which have brought thee up out of the land of Egypt* (Exodus 32:8). Jeroboam recapitulates the wilderness sin and builds a kingdom on it. The cruelest irony: the ten tribes were Yahuah''s gift to him — *I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — and he turns the gift into a golden calf at Beth-el and Dan. What Israel did once in a moment of panic, Jeroboam makes the permanent state religion of the north.',
       sv.verse_id, ev.verse_id, 'free', 38184
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-the-sin-of-jeroboam-that-scattered-the-north',
       E'The sin of Jeroboam that scattered the north',
       E'*And this thing became a sin: for the people went to worship before the one, even unto Dan* (1 Kings 12:30). That single sentence is the seed of the exile. The phrase becomes the refrain of 1 and 2 Kings — the sin of Jeroboam who made Yashar''el to sin — and the prophets of the north spend their breath on it. Hosea names the calf and pronounces its doom: *Thy calf, O Samaria, hath cast thee off... the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (Hosea 8:5-6); and he watches the apostasy deepen until *they say of them, Let the men that sacrifice kiss the calves* (Hosea 13:2). The historian of the captivity reads it all back from the end: *For he rent Yashar''el (Israel) from the house of David; and they made Jeroboam the son of Nebat king: and Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD), and made them sin a great sin* (2 Kings 17:21), and among the sins that emptied the land he lists *molten images, even two calves* (2 Kings 17:16). The two calves Jeroboam *made* (1 Kings 12:28) are still standing in the indictment that explains why the northern kingdom was carried into Assyria. The founding sin and the scattering are one long line. And this is exactly why the two-house promise matters: the north was not cast off forever for its calf — it was scattered to be gathered, *He that scattered Yashar''el (Israel) will gather him*, the lost sheep sought and found.',
       sv.verse_id, ev.verse_id, 'free', 38187
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced',
       E'The counterfeit feast and priesthood — the moedim displaced',
       E'Having made the gods, Jeroboam makes the clergy and the calendar to match — a whole counterfeit of Yahuah''s appointed worship. First the priesthood: *he made an house of high places, and made priests of the lowest of the people, which were not of the sons of Levi* (1 Kings 12:31). The ordained Levitical order is simply discarded; the Chronicler shows the cost from the other side — *Jeroboam and his sons had cast them off from executing the priest''s office unto Yahuah (LORD)* (2 Chronicles 11:14), so that he *ordained him priests for the high places, and for the devils, and for the calves which he had made* (2 Chronicles 11:15). Then the calendar: *Jeroboam ordained a feast in the eighth month, on the fifteenth day of the month, like unto the feast that is in Yahudah (Judah)* (1 Kings 12:32). The feast he copies is the feast of tabernacles, which Yahuah fixed in the SEVENTH month: *The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34), *a statute for ever in your generations: ye shall celebrate it in the seventh month* (Leviticus 23:41). Jeroboam keeps the shape but moves the time one month — *even in the month which he had devised of his own heart* (1 Kings 12:33). That phrase is the whole indictment: Yahuah''s appointed times are not man''s to redesign. The moedim are his calendar, creation-rooted and prophetic; to shift the feast off its day is to set man''s devising against Yahuah''s standing word. And the place of this invented worship hardens over the generations into a royal shrine that cannot bear correction: *prophesy not again any more at Beth-el: for it is the king''s chapel, and it is the king''s court* (Amos 7:13). The counterfeit feast becomes the king''s religion, and the king''s religion silences the prophet.',
       sv.verse_id, ev.verse_id, 'free', 38190
  FROM _s342_1ki12_lookup sv, _s342_1ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=12 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: the heavy yoke and the scorpions, the sentence performed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will chastise you with scorpions* (2 Chronicles 10:11) — the parallel telling of Rehoboam''s threatened crushing.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*My father made your yoke heavy, but I will add thereto... I will chastise you with scorpions* (2 Chronicles 10:14) — the same hardness in both tellings as the king answers roughly.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will surely rend the kingdom from thee, and will give it to thy servant* (1 Kings 11:11) — the sentence on Solomon''s idolatry the folly now performs.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=15
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and will give ten tribes to thee* (1 Kings 11:31) — the saying spoken by Ahijah to Jeroboam, the ten pieces of the torn garment now coming true.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=15
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*for the cause was of Elohim (God), that Yahuah (LORD) might perform his word, which he spake by the hand of Ahijah* (2 Chronicles 10:15) — the hidden hand named in the parallel: judgment, not blind politics.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=15
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-heavy-yoke-and-the-scorpions-the-sentence-performed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: what portion in David, the two houses are born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*We have no part in David, neither have we inheritance in the son of Jesse: every man to his tents, O Yashar''el (Israel)* (2 Samuel 20:1) — Sheba''s rebel cry, now the founding word of the northern kingdom.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=16
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — the tearing Ahijah enacted; the word becomes a nation walking away.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=16
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the healing of the rebellion 1 Kings 12:19 records.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=19
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*take thee one stick... For Yahudah (Judah)... another stick... For Joseph, the stick of Ephraim* (Ezekiel 37:16) — the two sticks are the two houses born when Yahudah alone follows David.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=20
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will take the stick of Joseph... and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19) — the division of v.20 is exactly what the LORD promises to undo.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=20
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the children of Yahudah (Judah) and the children of Yashar''el (Israel)... shall appoint themselves one head* (Hosea 1:11) — two heads set up at Shechem; one Head promised at the end.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=20
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-what-portion-in-david-the-two-houses-are-born'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: ye shall not fight against your brethren
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he gathered of the house of Yahudah (Judah) and Benjamin an hundred and fourscore thousand chosen men... to fight against Yashar''el (Israel)* (2 Chronicles 11:1) — the parallel of the muster for civil war.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=21
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-ye-shall-not-fight-against-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye shall not go up, nor fight against your brethren: return every man to his house: for this thing is done of me* (2 Chronicles 11:4) — the word that forbids the war and names them brethren.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-ye-shall-not-fight-against-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will make them one nation... and one king shall be king to them all* (Ezekiel 37:22) — you do not slaughter the brother you are destined to be made one with.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-ye-shall-not-fight-against-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the two calves of gold, Aaron's sin recapitulated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4) — Aaron''s words at Sinai, spoken almost letter for letter by Jeroboam.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-two-calves-of-gold-aarons-sin-recapitulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they have made them a molten calf, and have worshipped it... These be thy gods, O Yashar''el (Israel)* (Exodus 32:8) — Yahuah''s own indictment of the calf, the template Jeroboam repeats.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-two-calves-of-gold-aarons-sin-recapitulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — the gift of a kingdom turned into a golden calf at Beth-el and Dan.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-two-calves-of-gold-aarons-sin-recapitulated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: the sin of Jeroboam that scattered the north
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thy calf, O Samaria, hath cast thee off... the calf of Samaria shall be broken in pieces* (Hosea 8:5-6) — the prophet pronounces doom on the calf Jeroboam made.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-sin-of-jeroboam-that-scattered-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they say of them, Let the men that sacrifice kiss the calves* (Hosea 13:2) — the long fruit of the sin Jeroboam planted, the calf-worship deepened.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=30
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-sin-of-jeroboam-that-scattered-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Jeroboam drave Yashar''el (Israel) from following Yahuah (LORD), and made them sin a great sin* (2 Kings 17:21) — the historian of the exile reads this sin back from the scattering.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=30
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-sin-of-jeroboam-that-scattered-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*made them molten images, even two calves... and served Baal* (2 Kings 17:16) — the two calves still standing in the indictment that explains the Assyrian exile.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=28
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-sin-of-jeroboam-that-scattered-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: the counterfeit feast and priesthood, the moedim displaced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Jeroboam and his sons had cast them off from executing the priest''s office unto Yahuah (LORD)* (2 Chronicles 11:14) — the true Levites driven out, the ordained order overthrown.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=31
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=11 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he ordained him priests for the high places, and for the devils, and for the calves which he had made* (2 Chronicles 11:15) — the non-Levite priesthood named for what it served.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=31
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The fifteenth day of this seventh month shall be the feast of tabernacles... unto Yahuah (LORD)* (Leviticus 23:34) — Yahuah''s feast in the SEVENTH month, copied but moved to the eighth.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a statute for ever in your generations: ye shall celebrate it in the seventh month* (Leviticus 23:39,41) — the appointed time Jeroboam kept in the month he devised of his own heart.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=33
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*prophesy not again any more at Beth-el: for it is the king''s chapel, and it is the king''s court* (Amos 7:13) — the devised worship hardened into a royal shrine that silences the prophet.'
  FROM cross_reference_threads t
  JOIN _s342_1ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=12 AND sv.verse_number=32
  JOIN _s342_1ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-12-the-counterfeit-feast-and-priesthood-the-moedim-displaced'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_13.sql (1 Kings 13) -----
-- 1 Kings 13 — the man of Elohim out of Yahudah cries against the altar at Beth-el; Josiah named
-- three hundred years before; the withered hand and the rent altar; the lying old prophet and the
-- angel's word; the man of Elohim slain by the lion for turning from the plain word of Yahuah.
-- TAG: 1ki13   VIEW: _s342_1ki13_lookup   SORT BAND: 38200, step 3 (38200,38203,38206,38209)
-- SOURCE rows all 'canon','1-kings',13,v.
--
-- 1 Kings 13 coverage:
--   v.2    (O altar, altar... a child shall be born unto the house of David, JOSIAH by name; upon thee shall he offer the priests of the high places)
--          NT:     none warranted (the named-prophecy weave is Tanakh-internal, fulfilled 2 Kings 23)
--          Extras: none warranted
--          Tanakh: 2 Kings 23:15,16,17,20 (Josiah breaks down the Beth-el altar, burns men's bones, slays the priests of the high places — the prophecy fulfilled to the letter) [thread 1]; 1 Kings 12:28,29,33 (Jeroboam's calf-altar at Beth-el that the man of Elohim cries against) [thread 1 prose/member]
--   v.3    (he gave a sign: the altar shall be rent, and the ashes poured out)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 18:22 (the test of the true prophet: if the thing follow not, Yahuah hath not spoken it) [thread 2]
--   v.4-6  (Jeroboam's hand dried up; the altar rent; the king intreats, the hand restored)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 18:22 (the sign that came to pass marks the true word) [thread 2]
--   v.9,17 (charged by the word of Yahuah: eat no bread, drink no water, nor turn again the same way)
--          NT:     none warranted (the obedience weave anchors thread 4)
--          Extras: none warranted
--          Tanakh: Deuteronomy 13:3,4 (walk after Yahuah, keep his commandments, obey his voice) [thread 4]
--   v.18   (the old prophet lies: I am a prophet also; an angel spake unto me by the word of Yahuah — bring him back)
--          NT:     Galatians 1:8 (though an angel from heaven preach any other gospel... let him be accursed) [thread 4]
--          Extras: none warranted
--          Tanakh: Deuteronomy 13:1,3,5 (the prophet who turns you aside, even with a sign, shall be put to death); Deuteronomy 18:20 (the prophet who presumes to speak a word I have not commanded shall die) [thread 4]
--   v.21-22 (thou hast disobeyed the mouth of Yahuah, and hast not kept the commandment... thy carcase shall not come unto the sepulchre of thy fathers)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 20:12 (Moses believed me not... therefore ye shall not bring this congregation into the land — the prophet judged for turning from the plain word) [thread 4]
--   v.24,26 (a lion met him and slew him; the lion stood by the carcase, not eating it; Yahuah delivered him unto the lion)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 13:5 / 18:20 (carried in thread 4 prose — the judgment on disobedience)
--   v.32   (the saying against the altar in Beth-el... shall surely come to pass)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 23:15-20 (the saying came surely to pass); Deuteronomy 18:22 (the word that comes to pass is the word Yahuah hath spoken) [threads 1/2]
--
-- THREADS:
--   1-kings-13-the-altar-named-josiah-three-hundred-years-before (free) — Tanakh: 2 Kings 23, 1 Kings 12 — the sure word fulfilled to the letter
--   1-kings-13-the-rent-altar-and-the-withered-hand-the-sign-confirmed (free) — Tanakh: Deuteronomy 18 — the true prophet's sign comes to pass
--   1-kings-13-the-saying-against-bethel-shall-surely-come-to-pass (free) — Tanakh: 2 Kings 23, Deuteronomy 18 — the certainty of the prophetic word
--   1-kings-13-obey-the-plain-word-over-an-angels-claim (free) — Tanakh+NT: Deuteronomy 13, Deuteronomy 18, Numbers 20, Galatians 1 — the plain word of Yahuah over a claimed new/angelic word
-- Framework-load-bearing framing: 13:2's prophecy NAMES Josiah by name ~300 years before he is born
-- and 2 Kings 23:15-20 records the fulfilment to the letter — the certainty of Yahuah's word, the
-- sure word that does not fail. Thread 4 is the anti-antinomian core of the chapter: the man of
-- Elohim is slain not for a moral crime but for TURNING FROM THE PLAIN WORD OF YAHUAH he had
-- received (13:9) on the strength of a claimed NEW revelation — *an angel spake unto me* (13:18).
-- Galatians 1:8 reads it forward exactly: *though we, or an angel from heaven, preach any other
-- gospel... let him be accursed*. Deut 13 and Deut 18:20 are the Torah-root: no sign, no dream, no
-- claimed angel overturns the word already given. Obedience to Yahuah's word — not a new
-- revelation — is the issue (the lens, not Torah-as-curse). Numbers 20:12 is the lateral pattern:
-- even a true prophet is judged when he turns from the plain word. The lion standing by the carcase
-- unfeeding (13:24,28) marks it as Yahuah's deliberate judgment, not a wild accident.

CREATE TEMP VIEW _s342_1ki13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the altar named Josiah three hundred years before (13:2,3,32)
    ('canon','1-kings',13,2,'canon','2-kings',23,15,'free',E'*Moreover the altar that was at Beth-el, and the high place which Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin, had made, both that altar and the high place he brake down, and burned the high place, and stamped it small to powder, and burned the grove* (2 Kings 23:15). The man of Elohim cried *O altar, altar, thus saith Yahuah (LORD)... a child shall be born unto the house of David, Josiah by name* (1 Kings 13:2); some three hundred years later the very altar he stood before is broken down by the very king he named — the sure word of Yahuah fulfilled to the letter.'),
    ('canon','1-kings',13,2,'canon','2-kings',23,16,'free',E'*And as Josiah turned himself, he spied the sepulchres that were there in the mount, and sent, and took the bones out of the sepulchres, and burned them upon the altar, and polluted it, according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed, who proclaimed these words* (2 Kings 23:16). The prophecy was exact: *upon thee shall he offer the priests of the high places that burn incense upon thee, and men''s bones shall be burnt upon thee* (1 Kings 13:2). The Chronicler of Kings names the fulfilment as *according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed* — the word did not fall to the ground.'),
    ('canon','1-kings',13,2,'canon','2-kings',23,17,'free',E'*Then he said, What title is that that I see? And the men of the city told him, It is the sepulchre of the man of Elohim (God), which came from Yahudah (Judah), and proclaimed these things that thou hast done against the altar of Beth-el* (2 Kings 23:17). Standing at the broken altar, Josiah finds the grave of the very man who named him centuries before — the prophecy of 1 Kings 13:2 and its fulfilment meet over one tomb. *Let him alone; let no man move his bones* (2 Kings 23:18): the king honours the sure word and the one who carried it.'),
    ('canon','1-kings',13,2,'canon','2-kings',23,20,'free',E'*And he slew all the priests of the high places that were there upon the altars, and burned men''s bones upon them, and returned to Jerusalem* (2 Kings 23:20). The word named the act before there was a Josiah to do it — *upon thee shall he offer the priests of the high places* (1 Kings 13:2). Three centuries did not blunt the certainty of Yahuah''s word; what was cried at Beth-el was done at Beth-el.'),
    ('canon','1-kings',13,2,'canon','1-kings',12,28,'free',E'*Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). This is the altar the man of Elohim cried against: Jeroboam''s calf-shrine that *became a sin* (1 Kings 12:30). The word against *the altar* (1 Kings 13:2) is the word against the whole counterfeit worship that tore the north from the house of David.'),

    -- THREAD 2: the rent altar and the withered hand — the sign confirmed (13:3,4,5,6)
    ('canon','1-kings',13,3,'canon','deuteronomy',18,22,'free',E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him* (Deuteronomy 18:22). Torah set the test, and the man of Elohim gives it openly: *This is the sign which Yahuah (LORD) hath spoken; Behold, the altar shall be rent, and the ashes that are upon it shall be poured out* (1 Kings 13:3). The sign that comes to pass marks the true word; the false prophet''s word falls.'),
    ('canon','1-kings',13,5,'canon','deuteronomy',18,22,'free',E'*if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken* (Deuteronomy 18:22). The thing followed at once: *The altar also was rent, and the ashes poured out from the altar, according to the sign which the man of Elohim (God) had given by the word of Yahuah (LORD)* (1 Kings 13:5). By Torah''s own measure the word stands proven — what was spoken came to pass before the king''s eyes.'),

    -- THREAD 3: the saying against Beth-el shall surely come to pass (13:32)
    ('canon','1-kings',13,32,'canon','2-kings',23,19,'free',E'*And all the houses also of the high places that were in the cities of Samaria, which the kings of Yashar''el (Israel) had made to provoke Yahuah (LORD) to anger, Josiah took away, and did to them according to all the acts that he had done in Beth-el* (2 Kings 23:19). The old prophet declared *the saying which he cried by the word of Yahuah (LORD) against the altar in Beth-el, and against all the houses of the high places which are in the cities of Samaria, shall surely come to pass* (1 Kings 13:32) — and Josiah did to all the houses of the high places in Samaria exactly that. The word reached every detail it named.'),
    ('canon','1-kings',13,32,'canon','deuteronomy',18,22,'free',E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken* (Deuteronomy 18:22). The old prophet''s certainty rests on Torah''s test read the right way round: because this word IS the word of Yahuah, *it shall surely come to pass* (1 Kings 13:32). The true word is not merely vindicated after the fact — it is sure before the fact.'),

    -- THREAD 4: obey the plain word over an angel's claim (13:9,17,18,21,22,24,26)
    ('canon','1-kings',13,9,'canon','deuteronomy',13,4,'free',E'*Ye shall walk after Yahuah Elohaychem (the LORD your God), and fear him, and keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). The man of Elohim had one plain charge: *Eat no bread, nor drink water, nor turn again by the same way that thou camest* (1 Kings 13:9). To keep his commandment and obey his voice was the whole of his task — Torah''s very definition of cleaving to Yahuah.'),
    ('canon','1-kings',13,18,'canon','galatians',1,8,'free',E'*But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed* (Galatians 1:8). The old prophet''s lie wore the form of a new revelation: *I am a prophet also as thou art; and an angel spake unto me by the word of Yahuah (LORD)... But he lied unto him* (1 Kings 13:18). Paul names the exact danger this chapter dramatises — no angel, no new voice, overturns the plain word already given; let it be accursed.'),
    ('canon','1-kings',13,18,'canon','deuteronomy',13,1,'free',E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1) — *Thou shalt not hearken unto the words of that prophet* (Deuteronomy 13:3). The old prophet claimed the credential of prophecy and an angelic word to draw the man of Elohim aside; Torah had already armed him against exactly this — the claim of revelation does not loose a man from the word of Yahuah he has heard.'),
    ('canon','1-kings',13,18,'canon','deuteronomy',13,3,'free',E'*Thou shalt not hearken unto the words of that prophet, or that dreamer of dreams: for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem (the LORD your God) with all your heart and with all your soul* (Deuteronomy 13:3). The lying angel-word was the proving: would the man of Elohim love Yahuah enough to hold the plain charge of 13:9, or be turned by a fairer-sounding new word? He was turned, and the proving exposed it.'),
    ('canon','1-kings',13,18,'canon','deuteronomy',18,20,'free',E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20). The old prophet spoke in Yahuah''s name a word Yahuah never gave — *an angel spake unto me by the word of Yahuah (LORD)... But he lied* (1 Kings 13:18). Torah marks the presumptuous prophet-word for what it is; the deceiver clothed his lie in the holiest Name.'),
    ('canon','1-kings',13,21,'canon','numbers',20,12,'free',E'*And Yahuah (LORD) spake unto Moses and Aaron, Because ye believed me not, to sanctify me in the eyes of the children of Yashar''el (Israel), therefore ye shall not bring this congregation into the land which I have given them* (Numbers 20:12). Even a true prophet is judged when he turns from the plain word: *Forasmuch as thou hast disobeyed the mouth of Yahuah (LORD), and hast not kept the commandment which Yahuah Elohayka (the LORD thy God) commanded thee* (1 Kings 13:21). As Moses was barred from the land for one departure, the man of Elohim is barred from his fathers'' sepulchre — the word of Yahuah does not bend to status.'),
    ('canon','1-kings',13,26,'canon','deuteronomy',13,5,'free',E'*And that prophet, or that dreamer of dreams, shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)... So shalt thou put the evil away from the midst of thee* (Deuteronomy 13:5). The old prophet himself confesses the verdict: *It is the man of Elohim (God), who was disobedient unto the word of Yahuah (LORD): therefore Yahuah (LORD) hath delivered him unto the lion* (1 Kings 13:26). The turning-aside Torah marks for death is here executed by a lion that stood by and did not feed — Yahuah''s deliberate judgment, not a wild accident.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-13-the-altar-named-josiah-three-hundred-years-before',
       E'The altar named Josiah three hundred years before',
       E'A man of Elohim out of Yahudah (Judah) stands before Jeroboam''s counterfeit altar and speaks a name no one yet bears: *O altar, altar, thus saith Yahuah (LORD); Behold, a child shall be born unto the house of David, Josiah by name; and upon thee shall he offer the priests of the high places that burn incense upon thee, and men''s bones shall be burnt upon thee* (1 Kings 13:2). The altar he names is Jeroboam''s calf-shrine — *behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28), the sin that tore the north from the house of David. Some three hundred years pass. Then a king named Josiah comes to Beth-el, and the word is done to the letter: *Moreover the altar that was at Beth-el... both that altar and the high place he brake down* (2 Kings 23:15); *and took the bones out of the sepulchres, and burned them upon the altar, and polluted it, according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed* (2 Kings 23:16); *and he slew all the priests of the high places that were there upon the altars, and burned men''s bones upon them* (2 Kings 23:20). Standing at the rubble Josiah finds the prophet''s own grave — *It is the sepulchre of the man of Elohim (God), which came from Yahudah (Judah), and proclaimed these things that thou hast done against the altar of Beth-el* (2 Kings 23:17) — prophecy and fulfilment meeting over one tomb. Three centuries did not blunt the certainty of Yahuah''s word: what was cried at Beth-el was done at Beth-el, by the very king named before he was born.',
       sv.verse_id, ev.verse_id, 'free', 38200
  FROM _s342_1ki13_lookup sv, _s342_1ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-13-the-rent-altar-and-the-withered-hand-the-sign-confirmed',
       E'The rent altar and the withered hand — the sign confirmed',
       E'The man of Elohim does not ask to be believed on bare claim; he gives a sign that Torah''s own test can weigh. *And he gave a sign the same day, saying, This is the sign which Yahuah (LORD) hath spoken; Behold, the altar shall be rent, and the ashes that are upon it shall be poured out* (1 Kings 13:3). Torah''s measure is plain: *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The thing followed at once — and not the sign only: when Jeroboam stretched out his hand to seize the prophet, *his hand, which he put forth against him, dried up, so that he could not pull it in again to him* (1 Kings 13:4), *and the altar also was rent, and the ashes poured out from the altar, according to the sign which the man of Elohim (God) had given by the word of Yahuah (LORD)* (1 Kings 13:5). The king who would arrest the word can only beg for mercy from it — *Intreat now the face of Yahuah Elohayka (the LORD thy God)... that my hand may be restored* (1 Kings 13:6). By Torah''s own measure the word stands proven, the sign come to pass before the king''s eyes.',
       sv.verse_id, ev.verse_id, 'free', 38203
  FROM _s342_1ki13_lookup sv, _s342_1ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-13-the-saying-against-bethel-shall-surely-come-to-pass',
       E'The saying against Beth-el shall surely come to pass',
       E'Even the lying old prophet, having buried the man he deceived, knows one thing for certain — the word cried against the altar will not fail. *For the saying which he cried by the word of Yahuah (LORD) against the altar in Beth-el, and against all the houses of the high places which are in the cities of Samaria, shall surely come to pass* (1 Kings 13:32). His certainty is Torah''s test read the right way round: *if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken* (Deuteronomy 18:22) — therefore the word that IS Yahuah''s is sure before ever it comes to pass. And the fulfilment swept up the very breadth the saying named: not Beth-el only but Samaria too — *And all the houses also of the high places that were in the cities of Samaria, which the kings of Yashar''el (Israel) had made to provoke Yahuah (LORD) to anger, Josiah took away, and did to them according to all the acts that he had done in Beth-el* (2 Kings 23:19). The word reached every detail it named; the prophetic word of Yahuah is sure.',
       sv.verse_id, ev.verse_id, 'free', 38206
  FROM _s342_1ki13_lookup sv, _s342_1ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=13 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-13-obey-the-plain-word-over-an-angels-claim',
       E'Obey the plain word over an angel''s claim',
       E'The most sobering thread in the chapter is the death of a true prophet. He had cried down a king''s altar and seen his sign confirmed — yet he is slain on the road home. Why? Not for a moral crime, but for turning from the plain word of Yahuah he had already received: *For so was it charged me by the word of Yahuah (LORD), saying, Eat no bread, nor drink water, nor turn again by the same way that thou camest* (1 Kings 13:9) — the very thing Torah calls cleaving to Yahuah: *keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4). An old prophet of Beth-el overturns the charge with a counterfeit revelation: *I am a prophet also as thou art; and an angel spake unto me by the word of Yahuah (LORD), saying, Bring him back with thee into thine house, that he may eat bread and drink water. But he lied unto him* (1 Kings 13:18). Here is the whole peril named in Torah and named again by Paul: *If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder... Thou shalt not hearken unto the words of that prophet* (Deuteronomy 13:1,3); *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20); and read forward, *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed* (Galatians 1:8). No angel, no new voice, no fairer-sounding word looses a man from the plain word of Yahuah he has heard. The verdict falls: *Forasmuch as thou hast disobeyed the mouth of Yahuah (LORD), and hast not kept the commandment which Yahuah Elohayka (the LORD thy God) commanded thee... thy carcase shall not come unto the sepulchre of thy fathers* (1 Kings 13:21,22) — the same pattern by which even Moses was barred from the land for one departure: *Because ye believed me not... therefore ye shall not bring this congregation into the land* (Numbers 20:12). And the judgment is unmistakably Yahuah''s and not chance: a lion meets him and slays him, yet *the lion had not eaten the carcase, nor torn the ass* (1 Kings 13:28), standing by as the old prophet confesses, *It is the man of Elohim (God), who was disobedient unto the word of Yahuah (LORD): therefore Yahuah (LORD) hath delivered him unto the lion* (1 Kings 13:26). Obedience to the plain word of Yahuah — not a new revelation, not an angel''s claim — is the whole issue this chapter sets before the reader.',
       sv.verse_id, ev.verse_id, 'free', 38209
  FROM _s342_1ki13_lookup sv, _s342_1ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=13 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: the altar named Josiah three hundred years before
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*both that altar and the high place he brake down, and burned the high place, and stamped it small to powder* (2 Kings 23:15) — Josiah breaks down the very Beth-el altar the man of Elohim cried against, ~300 years on.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-altar-named-josiah-three-hundred-years-before'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*took the bones out of the sepulchres, and burned them upon the altar... according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed* (2 Kings 23:16) — the men''s bones burnt on the altar, exactly as 13:2 foretold.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-altar-named-josiah-three-hundred-years-before'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It is the sepulchre of the man of Elohim (God), which came from Yahudah (Judah), and proclaimed these things* (2 Kings 23:17) — Josiah finds the grave of the prophet who named him; prophecy and fulfilment meet over one tomb.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-altar-named-josiah-three-hundred-years-before'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And he slew all the priests of the high places that were there upon the altars, and burned men''s bones upon them* (2 Kings 23:20) — the priests of the high places offered upon the altar, the word named before there was a Josiah to do it.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-altar-named-josiah-three-hundred-years-before'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*made two calves of gold... behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28) — the calf-altar at Beth-el the man of Elohim was sent to cry against.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-altar-named-josiah-three-hundred-years-before'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the rent altar and the withered hand — the sign confirmed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken* (Deuteronomy 18:22) — Torah''s test; the man of Elohim openly gives the sign of the altar rent.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-rent-altar-and-the-withered-hand-the-sign-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if the thing follow not, nor come to pass... Yahuah (LORD) hath not spoken* (Deuteronomy 18:22) — the thing followed at once: the altar rent and the ashes poured out, the word proven by Torah''s own measure.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-rent-altar-and-the-withered-hand-the-sign-confirmed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the saying against Beth-el shall surely come to pass
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And all the houses also of the high places that were in the cities of Samaria... Josiah took away, and did to them according to all the acts that he had done in Beth-el* (2 Kings 23:19) — the word reached the whole breadth it named, not Beth-el only but Samaria too.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=32
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-saying-against-bethel-shall-surely-come-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not... Yahuah (LORD) hath not spoken* (Deuteronomy 18:22) — read the right way round: the word that IS Yahuah''s is sure before ever it comes to pass.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=32
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-the-saying-against-bethel-shall-surely-come-to-pass'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: obey the plain word over an angel's claim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*keep his commandments, and obey his voice, and ye shall serve him, and cleave unto him* (Deuteronomy 13:4) — to keep the plain charge of 13:9 was Torah''s very definition of cleaving to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*though we, or an angel from heaven, preach any other gospel... let him be accursed* (Galatians 1:8) — Paul names the exact peril: the old prophet''s *an angel spake unto me... But he lied* (13:18) does not overturn the word already given.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1) — Torah arms against exactly the credential the old prophet wielded.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you* (Deuteronomy 13:3) — the lying angel-word was the proving of whether he loved Yahuah enough to hold the plain charge.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20) — the old prophet clothed a lie in the holiest Name.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Because ye believed me not... therefore ye shall not bring this congregation into the land* (Numbers 20:12) — even a true prophet is judged when he turns from the plain word; as Moses was barred from the land, the man of Elohim from his fathers'' sepulchre.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah* (Deuteronomy 13:5) — the turning-aside Torah marks for death, executed by a lion that stood by and did not feed: Yahuah''s deliberate judgment.'
  FROM cross_reference_threads t
  JOIN _s342_1ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=13 AND sv.verse_number=26
  JOIN _s342_1ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-13-obey-the-plain-word-over-an-angels-claim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_14.sql (1 Kings 14) -----
--
-- Book: 1 Kings, chapter 14   TAG: 1ki14   session prefix: s342
-- View: _s342_1ki14_lookup
-- Sort band: base 38225, step 3  ->  38225, 38228, 38231
--
-- 1 Kings 14 coverage checklist (NT / Extras / Tanakh weighed per block):
--   v.7-9 (Ahijah's word: I exalted thee, rent the kingdom from David, thou hast done evil)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1-kings 11:31-33 (the rending first given to Jeroboam) -> THREAD 1
--   v.10-11,14 (cut off him that pisseth against the wall; raise a king to cut off the house)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1-kings 15:29-30 (Baasha smites all the house of Jeroboam, per Ahijah);
--                1-kings 12:28-30 (the two calves — the root sin named) -> THREAD 1
--   v.13 (the child the one good thing in Jeroboam's house, mourned by all Yashar'el)
--        NT/Extras/Tanakh: none warranted (narrative; folded in summary prose)
--   v.15-16 (KEYSTONE: smite Yashar'el as a reed, root up, scatter beyond the river,
--            give Yashar'el up for the sins of Jeroboam who made Yashar'el to sin)
--        NT:     none warranted (the regathering FORWARD belongs to the Ezek37/Hos1 anchors)
--        Extras: none warranted
--        Tanakh: 2-kings 17:6 + 17:23 (the Assyrian exile — this prophecy fulfilled);
--                deuteronomy 28:64 + 28:36 (the Torah curse: scatter, serve other gods);
--                hosea 1:6 + 1:9 (Lo-ruhamah / Lo-ammi — the northern house divorced) -> THREAD 2
--   v.21-24 (Rehoboam of Yahudah does evil: high places, images, groves, sodomites)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1-kings 11:5-7 (the high places' origin — Solomon built them) -> THREAD 3
--   v.25-26 (Shishak takes the treasures of the house of Yahuah, the golden shields)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2-chronicles 12:2 + 12:9 (the parallel account — they had transgressed) -> THREAD 3
--   v.1-6,12,17-20,27-31 (narrative frame: the disguise, the blind prophet, the child dies,
--            brasen shields, the chronicles, the deaths) — none warranted; carried in prose.
--
-- THREADS:
--   1. 1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung   [Tanakh only; free]
--        members: 1-kings 11:31, 11:33, 12:28, 12:30, 15:29, 15:30
--   2. 1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted   [Tanakh only; free]
--        members: 2-kings 17:6, 17:23, deuteronomy 28:64, 28:36, hosea 1:6, 1:9
--   3. 1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered   [Tanakh only; free]
--        members: 1-kings 11:5, 11:7, 2-chronicles 12:2, 12:9
--
-- Framework-load-bearing notes:
--   * THREAD 2 is the two-house keystone backstory: the EXILE of the northern house is FORETOLD
--     here (14:15-16, "scatter them beyond the river" = Assyria) and FULFILLED at 2 Kings 17:6,23.
--     Deut 28 is the Torah curse foretold — the curse is the exile-judgment for covenant-breaking,
--     NEVER the Torah itself. Hosea 1 names the divorce (Lo-ruhamah / Lo-ammi) that this scattering
--     enacts; the regathering of BOTH sticks (Ezek 37 / Hos 1:10-11) answers it forward.
--   * THREAD 1: the doom is covenant-lawsuit conduct (Jeroboam measured against David who kept the
--     commandments, 14:8) — victims-not-enemies; the calves (12:28) are the root sin named.

CREATE TEMP VIEW _s342_1ki14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== CROSS_REFERENCES ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (
    VALUES
    -- THREAD 1: the doom of the house of Jeroboam
    ('canon','1-kings',14,7,'canon','1-kings',11,31,'free',
      E'Ahijah''s word to Jeroboam''s wife reaches back to Ahijah''s own first oracle to Jeroboam in the field: *And he said to Jeroboam, Take thee ten pieces: for thus saith Yahuah (LORD), the Elohim (God) of Yashar''el (Israel), Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31). The same prophet who first told him *that I should be king over this people* (14:2) now turns to indict him — *Forasmuch as I exalted thee from among the people, and made thee prince over my people Yashar''el (Israel)* (14:7). The kingdom was a gift; the throne came with covenant terms.'),
    ('canon','1-kings',14,8,'canon','1-kings',11,33,'free',
      E'The charge against Jeroboam matches the charge that first rent the kingdom from Solomon: *Because that they have forsaken me, and have worshipped Ashtoreth the goddess of the Zidonians... and have not walked in my ways, to do that which is right in mine eyes, and to keep my statutes and my judgments, as did David his father* (1 Kings 11:33). The measure is the same in both verses — David, *who kept my commandments, and who followed me with all his heart, to do that only which was right in mine eyes* (14:8). The Torah is the standard the kings are weighed by; David is the pattern, not the contrast.'),
    ('canon','1-kings',14,9,'canon','1-kings',12,28,'free',
      E'The *molten images* Jeroboam *made... to provoke me to anger* (14:9) are named earlier: *Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). The calves are the root sin the whole chapter turns on — the false worship that diverts the northern house from Jerusalem and seeds the scattering to come.'),
    ('canon','1-kings',14,10,'canon','1-kings',15,29,'free',
      E'*I will bring evil upon the house of Jeroboam, and will cut off from Jeroboam him that pisseth against the wall... and will take away the remnant of the house of Jeroboam, as a man taketh away dung, till it be all gone* (14:10) — and it came to pass exactly: *when he reigned, that he smote all the house of Jeroboam; he left not to Jeroboam any that breathed, until he had destroyed him, according unto the saying of Yahuah (LORD), which he spake by his servant Ahijah the Shilonite* (1 Kings 15:29). The word of Yahuah by the blind prophet runs to the letter.'),
    ('canon','1-kings',14,16,'canon','1-kings',15,30,'free',
      E'The reason given for the doom of Jeroboam''s house, *because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (14:16), is repeated as the ground of its destruction by Baasha: *Because of the sins of Jeroboam which he sinned, and which he made Yashar''el (Israel) sin, by his provocation wherewith he provoked Yahuah Elohim (the LORD God) of Yashar''el (Israel) to anger* (1 Kings 15:30). The same indictment seals the house and, in the next thread, scatters the nation.'),
    ('canon','1-kings',14,14,'canon','1-kings',12,30,'free',
      E'*Moreover Yahuah (LORD) shall raise him up a king over Yashar''el (Israel), who shall cut off the house of Jeroboam that day* (14:14) — the king Yahuah would raise (Baasha) executes the sentence on the very thing that *became a sin*: *And this thing became a sin: for the people went to worship before the one, even unto Dan* (1 Kings 12:30). The calf-worship that built the house is what topples it.'),

    -- THREAD 2: Yashar'el scattered beyond the river (the northern exile foretold)
    ('canon','1-kings',14,15,'canon','2-kings',17,6,'free',
      E'*For Yahuah (LORD) shall smite Yashar''el (Israel), as a reed is shaken in the water, and he shall root up Yashar''el (Israel) out of this good land, which he gave to their fathers, and shall scatter them beyond the river* (14:15) — *beyond the river* is Assyria, and here is the fulfilment: *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). The uprooting of the northern house is foretold in this chapter and enacted there.'),
    ('canon','1-kings',14,16,'canon','2-kings',17,23,'free',
      E'*And he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (14:16) is named again as the cause of the exile: *Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). The scattering of the northern house — the divorced house of Yosef / Ephraim — traces straight back to Jeroboam''s calves.'),
    ('canon','1-kings',14,15,'canon','deuteronomy',28,64,'free',
      E'The scattering Ahijah pronounces is the Torah curse for covenant-breaking, foretold by Moses: *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The curse is the exile-judgment that falls when the covenant is forsaken — never the Torah itself; the *groves* of 14:15 are the *other gods* of Deuteronomy 28:64.'),
    ('canon','1-kings',14,15,'canon','deuteronomy',28,36,'free',
      E'Moses had already named the uprooting and the going *beyond the river*: *Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known; and there shalt thou serve other gods, wood and stone* (Deuteronomy 28:36). Ahijah''s *he shall... scatter them beyond the river* (14:15) is the covenant-sanction of Deuteronomy 28 coming due upon the northern house.'),
    ('canon','1-kings',14,16,'canon','hosea',1,6,'free',
      E'The giving-up of the northern house is the divorce Hosea is sent to enact: *And she conceived again, and bare a daughter. And Elohim (God) said unto him, Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6). *He shall give Yashar''el (Israel) up* (14:16) and *I will utterly take them away* are the one sentence on the same house — Ephraim put away for the sin of the calves.'),
    ('canon','1-kings',14,16,'canon','hosea',1,9,'free',
      E'The end of the matter is the un-naming of the people: *Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). The house given up in 14:16 becomes *not my people* — yet the same prophecy turns: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), and *the children of Yahudah (Judah) and the children of Yashar''el (Israel)* are gathered as one (Hosea 1:11). The scattering of this chapter is one half of the two-house story whose other half is the regathering.'),

    -- THREAD 3: both houses decline — Rehoboam's evil and the temple plundered
    ('canon','1-kings',14,23,'canon','1-kings',11,5,'free',
      E'The *high places, and images, and groves, on every high hill, and under every green tree* (14:23) that defile Yahudah under Rehoboam were first raised by his grandfather: *For Solomon went after Ashtoreth the goddess of the Zidonians, and after Milcom the abomination of the Ammonites* (1 Kings 11:5). The rot in the southern house did not begin with Rehoboam; it was inherited from Solomon''s strange wives.'),
    ('canon','1-kings',14,24,'canon','1-kings',11,7,'free',
      E'The *abominations of the nations* of 14:24 are the very shrines Solomon built: *Then did Solomon build an high place for Chemosh, the abomination of Moab, in the hill that is before Jerusalem, and for Molech, the abomination of the children of Ammon* (1 Kings 11:7). Both houses are declining together — the north into calf-worship and exile, the south into the high places Solomon planted before Jerusalem itself.'),
    ('canon','1-kings',14,25,'canon','2-chronicles',12,2,'free',
      E'The Chronicler gives the reason behind Shishak''s coming up: *And it came to pass, that in the fifth year of king Rehoboam Shishak king of Egypt came up against Jerusalem, because they had transgressed against Yahuah (LORD)* (2 Chronicles 12:2). The bare report of 14:25, *in the fifth year of king Rehoboam, that Shishak king of Egypt came up against Jerusalem*, is covenant-judgment: Yahudah''s sin (14:22-24) brings Egypt back up against the city.'),
    ('canon','1-kings',14,26,'canon','2-chronicles',12,9,'free',
      E'The plundering of the temple is told twice: *And he took away the treasures of the house of Yahuah (LORD), and the treasures of the king''s house; he even took away all: and he took away all the shields of gold which Solomon had made* (14:26); *So Shishak king of Egypt came up against Jerusalem, and took away the treasures of the house of Yahuah (LORD)... he carried away also the shields of gold which Solomon had made* (2 Chronicles 12:9). The golden age fades — Solomon''s gold carried off, replaced with brass; the glory already departing from the divided kingdom.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== THREADS ==============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung',
       E'The doom of the house of Jeroboam — cut off as dung',
       E'Jeroboam''s son lies sick, and the king sends his disguised wife to the blind old prophet Ahijah at Shiloh — the same prophet who first told him *that I should be king over this people* (14:2). The disguise fails before a man who cannot see: *Come in, thou wife of Jeroboam; why feignest thou thyself to be another? for I am sent to thee with heavy tidings* (14:6). The word that made Jeroboam king now unmakes his house. Ahijah''s first oracle had given him the kingdom — *Behold, I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee* (1 Kings 11:31) — on covenant terms, measured against David *who kept my commandments, and who followed me with all his heart* (14:8). But Jeroboam *made thee other gods, and molten images, to provoke me to anger* (14:9): the *two calves of gold* of 1 Kings 12:28, the worship that *became a sin* and drew the people to Dan (1 Kings 12:30). So the sentence falls: *I will bring evil upon the house of Jeroboam, and will cut off from Jeroboam him that pisseth against the wall... and will take away the remnant of the house of Jeroboam, as a man taketh away dung, till it be all gone* (14:10). Yahuah will *raise him up a king over Yashar''el (Israel), who shall cut off the house of Jeroboam that day* (14:14) — fulfilled when Baasha *smote all the house of Jeroboam; he left not to Jeroboam any that breathed, according unto the saying of Yahuah (LORD), which he spake by his servant Ahijah the Shilonite* (1 Kings 15:29), *because of the sins of Jeroboam which he sinned, and which he made Yashar''el (Israel) sin* (1 Kings 15:30; cf. 14:16). This is covenant-lawsuit, not vengeance on a people: the king who made the nation sin is measured against David and found to have *cast me behind thy back* (14:9). Only the sick child is spared the dogs and the fowls, *because in him there is found some good thing toward Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (14:13) — and all Yashar''el mourns him, the one good thing in a doomed house.',
       sv.verse_id, ev.verse_id, 'free', 38225
  FROM _s342_1ki14_lookup sv, _s342_1ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted',
       E'Yashar''el scattered beyond the river — the northern house uprooted',
       E'In the middle of the doom on one house, Ahijah lifts the lens to the whole northern nation and foretells the exile that will not come for two hundred years: *For Yahuah (LORD) shall smite Yashar''el (Israel), as a reed is shaken in the water, and he shall root up Yashar''el (Israel) out of this good land, which he gave to their fathers, and shall scatter them beyond the river, because they have made their groves, provoking Yahuah (LORD) to anger. And he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (14:15-16). *Beyond the river* is Assyria. This is the 2 Kings 17 exile prophesied here at its root — fulfilled when *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6), *until Yahuah (LORD) removed Yashar''el (Israel) out of his sight... So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). The scattering is the Torah curse falling due, exactly as Moses warned: *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods... even wood and stone* (Deuteronomy 28:64), *unto a nation which neither thou nor thy fathers have known* (Deuteronomy 28:36). The curse is the exile-judgment for breaking the covenant — never the Torah itself, which is the inheritance Yashar''el forsook. And it is the divorce Hosea is sent to dramatize over this same northern house: *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6), *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9). This is the two-house backstory — Yahudah in the south, Ephraim / Yosef in the north divorced and scattered. Yet the sentence is never the last word: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), when *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11). The reed shaken in the water in 14:15 will be gathered and made one stick again.',
       sv.verse_id, ev.verse_id, 'free', 38228
  FROM _s342_1ki14_lookup sv, _s342_1ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered',
       E'Both houses decline — Rehoboam''s evil and the temple plundered',
       E'The chapter turns south to Yahudah, and the verdict is no kinder: *And Yahudah (Judah) did evil in the sight of Yahuah (LORD), and they provoked him to jealousy with their sins which they had committed, above all that their fathers had done. For they also built them high places, and images, and groves, on every high hill, and under every green tree. And there were also sodomites in the land* (14:22-24). This rot was inherited, not invented — Solomon himself had *built an high place for Chemosh, the abomination of Moab, in the hill that is before Jerusalem, and for Molech, the abomination of the children of Ammon* (1 Kings 11:7), going *after Ashtoreth the goddess of the Zidonians, and after Milcom the abomination of the Ammonites* (1 Kings 11:5). Both houses are sliding together: the north into the calves and the coming exile, the south into the very shrines Solomon planted before Jerusalem. And the judgment is swift: *in the fifth year of king Rehoboam, that Shishak king of Egypt came up against Jerusalem* (14:25) — which the Chronicler reads as covenant-sanction: *Shishak king of Egypt came up against Jerusalem, because they had transgressed against Yahuah (LORD)* (2 Chronicles 12:2). The glory of the golden age is carried off: *he took away the treasures of the house of Yahuah (LORD), and the treasures of the king''s house; he even took away all: and he took away all the shields of gold which Solomon had made* (14:26; cf. *he carried away also the shields of gold which Solomon had made*, 2 Chronicles 12:9). Rehoboam *made in their stead brasen shields* (14:27) — gold for brass, the fading of Solomon''s splendour. The divided kingdom is impoverished and plundered, both crowns declining, the temple stripped of its glory within a generation of the schism.',
       sv.verse_id, ev.verse_id, 'free', 38231
  FROM _s342_1ki14_lookup sv, _s342_1ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=14 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ============================== THREAD MEMBERS ==============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 11:31 — Ahijah''s first oracle: *I will rend the kingdom out of the hand of Solomon, and will give ten tribes to thee*; the same prophet who gave Jeroboam the throne now indicts him.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=7
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 11:33 — the charge that first rent the kingdom (*have not walked in my ways... to keep my statutes and my judgments, as did David*) is the same charge against Jeroboam in 14:8; David is the standard.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 12:28 — the *two calves of gold* are the *molten images* of 14:9; the root sin that drew the north from Jerusalem and seeds the scattering.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 15:29 — the sentence of 14:10 fulfilled: Baasha *smote all the house of Jeroboam... according unto the saying of Yahuah (LORD)... by his servant Ahijah the Shilonite*.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=15 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Kings 15:30 — the ground of the doom repeated: *because of the sins of Jeroboam which he sinned, and which he made Yashar''el (Israel) sin* — the same indictment as 14:16.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=15 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Kings 12:30 — the calf-worship that *became a sin* (the people going to worship even unto Dan) is the very thing the raised-up king of 14:14 cuts off.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-the-doom-of-the-house-of-jeroboam-cut-off-as-dung'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 17:6 — the fulfilment: *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria... by the river of Gozan* — Ahijah''s *scatter them beyond the river* (14:15) come to pass.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=15
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 17:23 — *So was Yashar''el (Israel) carried away out of their own land to Assyria* — the giving-up of 14:16 traced back to the sins of Jeroboam by the historian himself.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 28:64 — the Torah curse foretold: *Yahuah (LORD) shall scatter thee among all people... and there thou shalt serve other gods*; the scattering of 14:15 is the covenant-sanction falling due, never the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=15
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 28:36 — *Yahuah (LORD) shall bring thee, and thy king... unto a nation which neither thou nor thy fathers have known* — Moses already names the uprooting beyond the river that Ahijah pronounces in 14:15.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=15
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Hosea 1:6 — *Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* — the giving-up of the northern house in 14:16 dramatized as divorce.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Hosea 1:9 — *Lo-ammi: for ye are not my people* — the northern house un-named; yet the same chapter turns to regathering (1:10-11), the two-house promise answering this scattering.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=16
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-yashar-el-scattered-beyond-the-river-the-northern-house-uprooted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 11:5 — Solomon *went after Ashtoreth the goddess of the Zidonians, and after Milcom the abomination of the Ammonites* — the high-place idolatry of 14:23 inherited from the grandfather.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=23
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 11:7 — Solomon *build an high place for Chemosh... and for Molech... in the hill that is before Jerusalem* — the very *abominations of the nations* that defile Yahudah in 14:24.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=24
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Chronicles 12:2 — the cause behind Shishak''s coming up: *because they had transgressed against Yahuah (LORD)* — 14:25 read as covenant-judgment on Yahudah''s sin.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=25
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Chronicles 12:9 — the parallel plundering: Shishak *carried away also the shields of gold which Solomon had made* — confirming 14:26, the golden age stripped and replaced with brass.'
  FROM cross_reference_threads t
  JOIN _s342_1ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=14 AND sv.verse_number=26
  JOIN _s342_1ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-14-both-houses-decline-rehoboams-evil-and-the-temple-plundered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1-kings_15.sql (1 Kings 15) -----
-- 1 Kings 15 — the kings of Yahudah and Yashar'el: Abijam walks in his father's sins yet the
-- lamp is kept for David's sake; Asa the reforming king whose heart was perfect; Nadab and
-- Baasha in the north; the doom of Jeroboam's house fulfilled by the word of Yahuah.
-- TAG: 1ki15   VIEW: _s342_1ki15_lookup   SORT BAND: 38250, step 3 (38250,38253,38256,38259)
-- SOURCE rows all 'canon','1-kings',15,v.
--
-- 1 Kings 15 coverage:
--   v.3-5  (Abijam's heart not perfect; NEVERTHELESS for David's sake a LAMP in Jerusalem; David
--          did right save only in the matter of Uriah)
--          NT:     Luke 1:32-33 (the throne of his father David; reign over the house of Jacob for ever);
--                  Luke 1:69 (an horn of salvation in the house of his servant David) [thread 1]
--          Extras: none warranted
--          Tanakh: 2 Samuel 7:15-16 (my mercy shall not depart; thine house established for ever);
--                  Psalm 132:17 (the horn of David to bud; I have ordained a lamp for mine anointed);
--                  1 Kings 11:36 (a light alway before me in Jerusalem); 2 Kings 8:19 (give him alway a light) [thread 1]
--   v.11-15 (Asa did right as David; took away sodomites and idols; deposed Maachah; heart perfect)
--          NT:     none warranted (Tanakh chronicle-parallel carries the reform weave)
--          Extras: none warranted
--          Tanakh: 2 Chronicles 14:2-4 (Asa did good and right; took away strange gods; commanded
--                  Yahudah to do the law and the commandment); 2 Chronicles 15:8,16,17 (put away
--                  abominable idols; removed Maachah; heart perfect) [thread 2]
--   v.16-22 (Asa's league with Ben-hadad of Syria against Baasha — the faith-compromise)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 16 (the seer's rebuke — relied on Syria not on Yahuah) -- WEIGHED,
--                  NOT ADDED: 2 Chronicles 16 not pulled/verified this pass; the league named in
--                  thread 2 prose, member not added without a verified target verse.
--   v.25-26,33-34 (Nadab did evil, walked in the way of his father; Baasha walked in the way of
--          Jeroboam — the calf-sin continuing in the north)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 11:31 (rend the kingdom; ten tribes); 1 Kings 14:16 (he shall give
--                  Yashar'el up because of the sins of Jeroboam, who made Yashar'el to sin) [thread 4]
--   v.29-30 (Baasha smote ALL the house of Jeroboam, left none that breathed, ACCORDING UNTO the
--          saying of Yahuah by his servant Ahijah; because of the sins of Jeroboam)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 14:10 (I will cut off from Jeroboam... take away the remnant as dung);
--                  1 Kings 14:11 (him that dieth in the city shall the dogs eat); 1 Kings 14:14
--                  (a king who shall cut off the house of Jeroboam) [thread 3]
--
-- THREADS:
--   1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake (free) — Tanakh+NT: 2Sam7, Ps132, 1Kings11, 2Kings8, Luke1
--   1-kings-15-asa-the-reforming-king-whose-heart-was-perfect (free) — Tanakh: 2Chr14, 2Chr15
--   1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word (free) — Tanakh: 1Kings14
--   1-kings-15-the-northern-cycle-of-the-calf-sin-of-jeroboam (free) — Tanakh: 1Kings11, 1Kings14
-- Framework-load-bearing framing: 15:4 *Nevertheless for David's sake did Yahuah Elohav give him
-- a lamp in Jerusalem, to set up his son after him* — the Davidic-covenant LAMP, the seed-line
-- mercy preserved THROUGH judgment even under a wicked king. This is the paternal-bloodline-plus-
-- covenant-word promise of 2 Sam 7 carried unbroken (*my mercy shall not depart away from him*),
-- the lamp Yahuah *ordained for mine anointed* (Ps 132:17), the *light alway* repeated through the
-- dynasty (1 Kings 11:36; 2 Kings 8:19), and fulfilled when the Formed Son receives *the throne of
-- his father David* (Luke 1:32) — the *horn of salvation in the house of his servant David* (Luke
-- 1:69). NOT the throne abolished or transferred to another people; the lamp burns down to Messiah.
-- 15:5 names David's one fault *save only in the matter of Uriah* — the chronicle is honest, not
-- whitewashing; the mercy is grace upon a covenant-keeper, not lineage alone. The doom of
-- Jeroboam's house (15:29 *according unto the saying of Yahuah... by his servant Ahijah*) is the
-- 14:10-14 word coming exactly to pass — Yahuah's word stands. Baasha, the rod of judgment, then
-- *walked in the way of Jeroboam* himself (15:34): the northern dynasties revolve in the same
-- calf-sin, victims of an inherited lie, never enemies. The high places *were not removed* (15:14)
-- yet Asa's *heart was perfect* — covenant faithfulness measured by the heart turned to Yahuah.

CREATE TEMP VIEW _s342_1ki15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the lamp kept in Jerusalem for David's sake (15:4,5)
    ('canon','1-kings',15,4,'canon','2-samuel',7,15,'free',E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15). The lamp kept under a wicked king is this mercy holding: *Nevertheless for David''s sake did Yahuah Elohav (the LORD his God) give him a lamp in Jerusalem, to set up his son after him* (1 Kings 15:4). Abijam''s heart was not perfect, yet the covenant mercy did not depart — the seed-line is carried through judgment, not by the son''s merit but by the oath to David.'),
    ('canon','1-kings',15,4,'canon','2-samuel',7,16,'free',E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The everlasting throne is exactly what the lamp guards: *to set up his son after him, and to establish Jerusalem* (1 Kings 15:4). Even when the reigning son walks in his father''s sins, the house and the throne stand — the promise is *for ever*, anchored in Yahuah''s word, not the worth of any one king.'),
    ('canon','1-kings',15,4,'canon','psalms',132,17,'free',E'*There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). The narrative''s *lamp in Jerusalem* (1 Kings 15:4) is the very lamp the psalm says Yahuah *ordained for mine anointed* — the Davidic light that cannot be put out, budding down the generations toward the Anointed it was ordained for.'),
    ('canon','1-kings',15,4,'canon','1-kings',11,36,'free',E'*And unto his son will I give one tribe, that David my servant may have a light alway before me in Jerusalem, the city which I have chosen me to put my name there* (1 Kings 11:36). The word spoken at the kingdom''s tearing is the word kept now: the *light alway* promised when ten tribes were rent away is the *lamp in Jerusalem* (1 Kings 15:4) still burning for David''s sake a generation later.'),
    ('canon','1-kings',15,4,'canon','2-kings',8,19,'free',E'*Yet Yahuah (LORD) would not destroy Yahudah (Judah) for David his servant''s sake, as he promised him to give him alway a light, and to his children* (2 Kings 8:19). The same word echoes forward in the same history: the *lamp in Jerusalem* (1 Kings 15:4) is the *light* Yahuah promised *alway... and to his children* — the dynasty preserved through king after wicked king for the oath''s sake.'),
    ('canon','1-kings',15,4,'canon','luke',1,32,'free',E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The lamp *to set up his son after him* (1 Kings 15:4) burns down the whole dynasty to this Son — the Formed One who at last receives *the throne of his father David* and reigns over the house of Jacob for ever; the lamp was kept for him.'),
    ('canon','1-kings',15,4,'canon','luke',1,69,'free',E'*And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69). Zacharias names the end of the lamp: the *horn of salvation... in the house of his servant David* is what the *lamp in Jerusalem* (1 Kings 15:4) was preserved to bring forth — the seed-line kept through judgment until the horn of David buds into the One who saves his people.'),
    ('canon','1-kings',15,5,'canon','2-samuel',7,15,'free',E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15). The chronicle is honest about David — *David did that which was right in the eyes of Yahuah (LORD)... save only in the matter of Uriah the Hittite* (1 Kings 15:5) — naming his one great fault, yet the mercy held; the covenant rests on Yahuah''s word, not a flawless man.'),

    -- THREAD 2: Asa the reforming king whose heart was perfect (15:11,12,13,14)
    ('canon','1-kings',15,11,'canon','2-chronicles',14,2,'free',E'*And Asa did that which was good and right in the eyes of Yahuah Elohav (the LORD his God)* (2 Chronicles 14:2). The Chronicler tells it the same way: *And Asa did that which was right in the eyes of Yahuah (LORD), as did David his father* (1 Kings 15:11) — the good reforming king measured by the father David, the seed-line standard of the heart turned wholly to Yahuah.'),
    ('canon','1-kings',15,12,'canon','2-chronicles',14,3,'free',E'*For he took away the altars of the strange gods, and the high places, and brake down the images, and cut down the groves* (2 Chronicles 14:3). The reform of *he took away the sodomites out of the land, and removed all the idols that his fathers had made* (1 Kings 15:12) is the same purge — the inherited idolatry of the fathers torn down, the land cleansed for Yahuah.'),
    ('canon','1-kings',15,12,'canon','2-chronicles',14,4,'free',E'*And commanded Yahudah (Judah) to seek Yahuah Elohim (the LORD God) of their fathers, and to do the law and the commandment* (2 Chronicles 14:4). Asa''s removing of idols (1 Kings 15:12) was no bare reform but a turning to Torah: he *commanded Yahudah... to do the law and the commandment* — the covenant instruction kept, not abolished, the very heart of the good king''s work.'),
    ('canon','1-kings',15,13,'canon','2-chronicles',15,16,'free',E'*And also concerning Maachah the mother of Asa the king, he removed her from being queen, because she had made an idol in a grove: and Asa cut down her idol, and stamped it, and burnt it at the brook Kidron* (2 Chronicles 15:16). The Chronicler doubles the account word for word: *And also Maachah his mother, even her he removed from being queen... and Asa destroyed her idol, and burnt it by the brook Kidron* (1 Kings 15:13). The grandmother who inherited the lie is deposed and her idol burned — the system dismantled, the truth set above kin.'),
    ('canon','1-kings',15,14,'canon','2-chronicles',15,17,'free',E'*But the high places were not taken away out of Yashar''el (Israel): nevertheless the heart of Asa was perfect all his days* (2 Chronicles 15:17). The same honest verdict stands in both: *the high places were not removed: nevertheless Asa''s heart was perfect with Yahuah (LORD) all his days* (1 Kings 15:14). The reform was incomplete, yet the measure is the heart — Asa''s perfect, turned to Yahuah, even where the work was unfinished.'),
    ('canon','1-kings',15,15,'canon','2-chronicles',15,18,'free',E'*And he brought into the house of Elohim (God) the things that his father had dedicated, and that he himself had dedicated, silver, and gold, and vessels* (2 Chronicles 15:18). The Chronicler records the same offering: *he brought in the things which his father had dedicated, and the things which himself had dedicated, into the house of Yahuah (LORD), silver, and gold, and vessels* (1 Kings 15:15) — the dedicated treasure carried into the house of Yahuah, the worship restored.'),

    -- THREAD 3: the doom of Jeroboam's house fulfilled by the word (15:29,30)
    ('canon','1-kings',15,29,'canon','1-kings',14,10,'free',E'*Therefore, behold, I will bring evil upon the house of Jeroboam, and will cut off from Jeroboam him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel), and will take away the remnant of the house of Jeroboam, as a man taketh away dung, till it be all gone* (1 Kings 14:10). The word Ahijah spoke comes exactly to pass: *he smote all the house of Jeroboam; he left not to Jeroboam any that breathed, until he had destroyed him, according unto the saying of Yahuah (LORD), which he spake by his servant Ahijah the Shilonite* (1 Kings 15:29). What was prophesied as judgment is fulfilled to the letter — Yahuah''s word stands.'),
    ('canon','1-kings',15,29,'canon','1-kings',14,11,'free',E'*Him that dieth of Jeroboam in the city shall the dogs eat; and him that dieth in the field shall the fowls of the air eat: for Yahuah (LORD) hath spoken it* (1 Kings 14:11). The doom sealed with *for Yahuah hath spoken it* is the doom now executed: Baasha *left not to Jeroboam any that breathed... according unto the saying of Yahuah* (1 Kings 15:29). The prophetic word and its fulfilment frame the whole house of Jeroboam — spoken, then done.'),
    ('canon','1-kings',15,29,'canon','1-kings',14,14,'free',E'*Moreover Yahuah (LORD) shall raise him up a king over Yashar''el (Israel), who shall cut off the house of Jeroboam that day: but what? even now* (1 Kings 14:14). Ahijah foretold the very instrument: a king Yahuah would *raise up... who shall cut off the house of Jeroboam* — and Baasha is that king, who *smote all the house of Jeroboam* (1 Kings 15:29). The doom names its own executioner before he rises.'),
    ('canon','1-kings',15,30,'canon','1-kings',14,16,'free',E'*And he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). The reason given for the fall of the house is the reason Ahijah named: *Because of the sins of Jeroboam which he sinned, and which he made Yashar''el (Israel) sin, by his provocation wherewith he provoked Yahuah Elohim (the LORD God) of Yashar''el (Israel) to anger* (1 Kings 15:30) — the calf-sin that made the whole north to sin brings the dynasty down.'),

    -- THREAD 4: the northern cycle of the calf-sin of Jeroboam (15:26,34)
    ('canon','1-kings',15,26,'canon','1-kings',14,16,'free',E'*And he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). Nadab the son inherits the father''s sin unbroken: *he did evil in the sight of Yahuah (LORD), and walked in the way of his father, and in his sin wherewith he made Yashar''el (Israel) to sin* (1 Kings 15:26). The made-to-sin spreads down the dynasty — the north walking the inherited lie, victims of it before they are judged for it.'),
    ('canon','1-kings',15,34,'canon','1-kings',14,16,'free',E'*who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). Baasha, the very rod that cut off Jeroboam''s house, then takes up Jeroboam''s sin: *he did evil in the sight of Yahuah (LORD), and walked in the way of Jeroboam, and in his sin wherewith he made Yashar''el (Israel) to sin* (1 Kings 15:34). The instrument of judgment becomes the next to be judged — the northern dynasties revolve in the same calf-sin.'),
    ('canon','1-kings',15,34,'canon','1-kings',11,31,'free',E'*and will give ten tribes to thee* (1 Kings 11:31). The ten tribes Yahuah gave Jeroboam *the Elohim (God) of Yashar''el (Israel)* are the very people now bound in the calf-sin: Baasha *walked in the way of Jeroboam, and in his sin wherewith he made Yashar''el (Israel) to sin* (1 Kings 15:34). The house given to be ruled is the house led astray — the northern stick of Yashar''el scattered toward the divorce Hosea will name.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake',
       E'The lamp kept in Jerusalem for David''s sake',
       E'A wicked king reigns, and still the lamp does not go out. *And he walked in all the sins of his father... and his heart was not perfect with Yahuah Elohav (the LORD his God), as the heart of David his father* (1 Kings 15:3) — yet *Nevertheless for David''s sake did Yahuah Elohav (the LORD his God) give him a lamp in Jerusalem, to set up his son after him, and to establish Jerusalem* (1 Kings 15:4). The lamp is the Davidic-covenant mercy preserved THROUGH judgment, not earned by the son. It is the oath of 2 Samuel 7 holding fast: *But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15), *And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). It is the very lamp the psalm sings: *There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). The word was spoken when the kingdom was torn — *that David my servant may have a light alway before me in Jerusalem* (1 Kings 11:36) — and echoes on through the same history — *Yet Yahuah (LORD) would not destroy Yahudah (Judah) for David his servant''s sake, as he promised him to give him alway a light, and to his children* (2 Kings 8:19). The chronicle is honest about the man it rests on: David did right *save only in the matter of Uriah the Hittite* (1 Kings 15:5) — the mercy is grace upon a covenant-keeper, not lineage alone, and not whitewash. And the lamp burns down the whole line to its end: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever* (Luke 1:32-33); *And hath raised up an horn of salvation for us in the house of his servant David* (Luke 1:69). The lamp was never abolished and never handed to another people; it was kept in Jerusalem for David''s sake until the Formed Son received the throne it guarded.',
       sv.verse_id, ev.verse_id, 'free', 38250
  FROM _s342_1ki15_lookup sv, _s342_1ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=15 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-15-asa-the-reforming-king-whose-heart-was-perfect',
       E'Asa the reforming king whose heart was perfect',
       E'After the wicked Abijam a good king rises in Yahudah. *And Asa did that which was right in the eyes of Yahuah (LORD), as did David his father* (1 Kings 15:11) — measured, like every king of the line, by the father David and the heart turned wholly to Yahuah. The Chronicler tells it the same: *And Asa did that which was good and right in the eyes of Yahuah Elohav (the LORD his God)* (2 Chronicles 14:2), *For he took away the altars of the strange gods, and the high places, and brake down the images, and cut down the groves* (2 Chronicles 14:3). And his reform was a turning back to the covenant instruction, not a reform apart from it: he *commanded Yahudah (Judah) to seek Yahuah Elohim (the LORD God) of their fathers, and to do the law and the commandment* (2 Chronicles 14:4). So in our chapter: *And he took away the sodomites out of the land, and removed all the idols that his fathers had made* (1 Kings 15:12). He would not spare even his own house — *And also Maachah his mother, even her he removed from being queen, because she had made an idol in a grove; and Asa destroyed her idol, and burnt it by the brook Kidron* (1 Kings 15:13), word for word with *Asa cut down her idol, and stamped it, and burnt it at the brook Kidron* (2 Chronicles 15:16). The grandmother who inherited the lie is deposed and her idol burned; the system is dismantled, the truth set above kin. The verdict is honest about what was left undone — *But the high places were not removed* — yet final about the man: *nevertheless Asa''s heart was perfect with Yahuah (LORD) all his days* (1 Kings 15:14), echoing *the heart of Asa was perfect all his days* (2 Chronicles 15:17). And he restored the worship, bringing the dedicated *silver, and gold, and vessels* into the house of Yahuah (1 Kings 15:15; 2 Chronicles 15:18). Covenant faithfulness is the heart turned to Yahuah, even where the hand''s work is unfinished.',
       sv.verse_id, ev.verse_id, 'free', 38253
  FROM _s342_1ki15_lookup sv, _s342_1ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=15 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word',
       E'The doom of Jeroboam''s house fulfilled by the word',
       E'In the north, the word of Yahuah spoken against Jeroboam comes exactly to pass. Ahijah had foretold it: *Therefore, behold, I will bring evil upon the house of Jeroboam, and will cut off from Jeroboam him that pisseth against the wall... and will take away the remnant of the house of Jeroboam, as a man taketh away dung, till it be all gone* (1 Kings 14:10); *Him that dieth of Jeroboam in the city shall the dogs eat; and him that dieth in the field shall the fowls of the air eat: for Yahuah (LORD) hath spoken it* (1 Kings 14:11); and even the instrument was named — *Yahuah (LORD) shall raise him up a king over Yashar''el (Israel), who shall cut off the house of Jeroboam that day* (1 Kings 14:14). Now Baasha is that king: *And it came to pass, when he reigned, that he smote all the house of Jeroboam; he left not to Jeroboam any that breathed, until he had destroyed him, according unto the saying of Yahuah (LORD), which he spake by his servant Ahijah the Shilonite* (1 Kings 15:29). The cause is exactly the cause Ahijah gave — *because of the sins of Jeroboam which he sinned, and which he made Yashar''el (Israel) sin* (1 Kings 15:30), which is *because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). The prophetic word and its fulfilment frame the whole house: spoken, then done. Yahuah''s word does not fall to the ground.',
       sv.verse_id, ev.verse_id, 'free', 38256
  FROM _s342_1ki15_lookup sv, _s342_1ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=15 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-kings-15-the-northern-cycle-of-the-calf-sin-of-jeroboam',
       E'The northern cycle of the calf-sin of Jeroboam',
       E'The northern kingdom revolves in a single inherited sin. Nadab the son takes up the father''s way unbroken: *And he did evil in the sight of Yahuah (LORD), and walked in the way of his father, and in his sin wherewith he made Yashar''el (Israel) to sin* (1 Kings 15:26). And Baasha — the very rod Yahuah used to cut off Jeroboam''s house — then becomes the next to walk that same way: *he did evil in the sight of Yahuah (LORD), and walked in the way of Jeroboam, and in his sin wherewith he made Yashar''el (Israel) to sin* (1 Kings 15:34). The phrase that haunts the whole book first sounded in Ahijah''s doom — *who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16) — and now it stamps king after king. These are the ten tribes Yahuah himself gave Jeroboam to rule — *and will give ten tribes to thee* (1 Kings 11:31) — the northern stick of Yashar''el, led by their shepherds into the calf-sin and so scattered toward the divorce Hosea will name *Lo-Ammi*, not my people. They are victims of an inherited lie before they are judged for it; the system of the calves, set up to keep them from going up to Jerusalem, is the thing that condemns the dynasty — never the people themselves cast off, for the One who scattered Yashar''el will gather him again.',
       sv.verse_id, ev.verse_id, 'free', 38259
  FROM _s342_1ki15_lookup sv, _s342_1ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='1-kings' AND ev.chapter_number=15 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: the lamp kept in Jerusalem for David's sake
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*But my mercy shall not depart away from him, as I took it from Saul* (2 Samuel 7:15) — the covenant mercy holding; the lamp kept though the son''s heart was not perfect.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thy throne shall be established for ever* (2 Samuel 7:16) — the everlasting throne the lamp guards; the house stands though the reigning son sins.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I have ordained a lamp for mine anointed* (Psalm 132:17) — the very lamp the psalm names, the Davidic light that cannot be put out.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a light alway before me in Jerusalem* (1 Kings 11:36) — the word spoken when the kingdom was torn, kept now a generation later.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*to give him alway a light, and to his children* (2 Kings 8:19) — the same promise echoing on through the same history.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=8 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the lamp burns down the whole dynasty to the Formed Son who receives the throne.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*an horn of salvation for us in the house of his servant David* (Luke 1:69) — the end the lamp was preserved to bring forth.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=4
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=69
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*my mercy shall not depart away from him* (2 Samuel 7:15) — read against *save only in the matter of Uriah* (1 Kings 15:5): the chronicle honest about David, the mercy resting on Yahuah''s word.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-lamp-kept-in-jerusalem-for-davids-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: Asa the reforming king whose heart was perfect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Asa did that which was good and right in the eyes of Yahuah Elohav* (2 Chronicles 14:2) — the Chronicler''s same verdict, the king measured by the father David.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=11
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he took away the altars of the strange gods, and the high places... and cut down the groves* (2 Chronicles 14:3) — the same purge as the removed idols and sodomites.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*commanded Yahudah... to do the law and the commandment* (2 Chronicles 14:4) — the reform was a turning to Torah, the covenant kept not abolished.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*concerning Maachah the mother of Asa... he removed her from being queen... burnt it at the brook Kidron* (2 Chronicles 15:16) — the grandmother who inherited the lie deposed, the idol burned, word for word.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=13
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the high places were not taken away... nevertheless the heart of Asa was perfect all his days* (2 Chronicles 15:17) — the same honest verdict; the measure is the heart turned to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=14
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he brought into the house of Elohim... the things that his father had dedicated... silver, and gold, and vessels* (2 Chronicles 15:18) — the dedicated treasure carried into the house of Yahuah, the worship restored.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=15
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-asa-the-reforming-king-whose-heart-was-perfect'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the doom of Jeroboam's house fulfilled by the word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will bring evil upon the house of Jeroboam... take away the remnant... as a man taketh away dung* (1 Kings 14:10) — the word Ahijah spoke, now fulfilled to the letter.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Him that dieth of Jeroboam in the city shall the dogs eat... for Yahuah hath spoken it* (1 Kings 14:11) — the doom sealed by Yahuah''s word, now executed.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah shall raise him up a king... who shall cut off the house of Jeroboam* (1 Kings 14:14) — the doom named its own executioner; Baasha is that king.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*because of the sins of Jeroboam... who made Yashar''el to sin* (1 Kings 14:16) — the cause Ahijah named is the cause given for the fall.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=30
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-doom-of-jeroboams-house-fulfilled-by-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the northern cycle of the calf-sin of Jeroboam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*who did sin, and who made Yashar''el to sin* (1 Kings 14:16) — Nadab inherits the father''s made-to-sin unbroken.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=26
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-northern-cycle-of-the-calf-sin-of-jeroboam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*who did sin, and who made Yashar''el to sin* (1 Kings 14:16) — Baasha, the rod of judgment, becomes the next to walk the way of Jeroboam.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=34
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-northern-cycle-of-the-calf-sin-of-jeroboam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*and will give ten tribes to thee* (1 Kings 11:31) — the northern stick of Yashar''el given Jeroboam to rule, now led astray into the calf-sin, scattered toward the divorce Hosea names.'
  FROM cross_reference_threads t
  JOIN _s342_1ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='1-kings' AND sv.chapter_number=15 AND sv.verse_number=34
  JOIN _s342_1ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='1-kings-15-the-northern-cycle-of-the-calf-sin-of-jeroboam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session342 — 1 Kings cross-references complete.'
