-- =====================================================================
-- Session 346 — Ruth FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session346_ruth_cross_references.sql
-- =====================================================================

\echo 'session346 — Ruth cross-references starting...'
BEGIN;

-- ----- fragment: minion_ruth_1.sql (Ruth 1) -----
--
-- Chapter: Ruth 1 (THE PLEDGE — Ruth cleaves to Naomi) | tag: rut01 | view: _s346_rut01_lookup
-- Sort band: 36250, 36253, 36256, 36259
--
-- Ruth 1 coverage:
--   v.1-5  (famine drives Elimelech and Naomi from Beth-lehem-judah to Moab; Elimelech, Mahlon,
--           Chilion die; Naomi left with two Moabite daughters-in-law)
--          NT:     none warranted (the setting; the providence-frame is carried at v.6/v.22)
--          Extras: none warranted
--          Tanakh: Genesis 12:10 (a famine in the land drives the patriarch to sojourn) — woven into the
--                  providence thread as the famine that opens the door; the deaths set up the redemption
--   v.6-13 (Naomi hears Yahuah has visited his people with bread; urges both daughters back to Moab;
--           Orpah and Ruth weep)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Genesis 12:1 (the choosing — leave thy country) framed in the pledge thread (v.16-17);
--                  the visited-with-bread providence (v.6) carried in the providence thread
--   v.14-18 (Orpah kisses and returns to her people and her gods; RUTH CLEAVES — thy people my people,
--            thy Elohim my Elohim; the covenant-loyalty pledge)
--          NT:     Matthew 1:5 (Ruth in the Messiah's genealogy — the Moabitess absorbed into the seed)
--          Extras: none warranted
--          Tanakh: Genesis 12:1 (Abraham leaving country/kindred/father's house — the choosing);
--                  Joshua 24:15 (choose you this day whom ye will serve — as for me and my house);
--                  Deuteronomy 23:3 (an Ammonite or Moabite shall not enter — the bar the covenant-marriage
--                  absorption overcomes; entrance is by absorption into Yashar'el, NOT by mere confession)
--                  — the pledge thread
--   v.19-21 (Naomi returns to Beth-lehem; call me Mara; I went out full and Yahuah brought me home empty)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Job 1:21 (Yahuah gave, and Yahuah hath taken away; blessed be the name of Yahuah) —
--                  the emptiness/grief thread
--   v.22   (they came to Beth-lehem in the beginning of barley harvest)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Genesis 12:10 (famine→sojourn, the providence that brings them home); Ruth 4:13-17
--                  (the redemption already at the door — Boaz, Obed, the line of David) — providence thread
--
-- Threads (3):
--   ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves  [Tanakh + NT] free
--       v.16,17,14 -> Genesis 12:1 / Joshua 24:15 / Deuteronomy 23:3 / Matthew 1:5
--   ruth-1-call-me-mara-i-went-out-full-and-came-home-empty  [Tanakh] free
--       v.20,21 -> Job 1:21
--   ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence  [Tanakh] free
--       v.6,22 -> Genesis 12:10 / Ruth 4:13 / Ruth 4:14 / Ruth 4:17
--
-- Framework-load-bearing / contested verse: 1:16-17 — Ruth's pledge. Framed as a COVENANT cleaving
-- (chesed/covenant-loyalty), the marriage-covenant doorway by which a daughter-of-the-nations is
-- ABSORBED into the seed of promise — NOT mere confession. Deuteronomy 23:3 (Moabite shall not enter)
-- is the very bar that the covenant-marriage absorption overcomes: Ruth does not enter by saying words
-- but by cleaving to the natural family (Naomi), by the marriage to Mahlon then Boaz, a real entrance
-- into Yashar'el (Israel) that lands her in the Messiah's own bloodline (Matthew 1:5). The choosing
-- echoes Abraham leaving his country (Genesis 12:1) and the choose-this-day of Joshua 24:15 — election
-- of Yahuah's people and Yahuah's Elohim, paternal-blood-AND-covenant-word together, never word alone.

CREATE TEMP VIEW _s346_rut01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: thy people shall be my people — the Moabitess cleaves (the covenant-marriage absorption)
    ('canon','ruth',1,16, 'canon','genesis',12,1, 'free',
      E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Ruth''s pledge is Abraham''s call turned outside-in: where Abram is summoned OUT of his country and kindred toward the land of promise, Ruth the Moabitess leaves *her people, and her gods* to follow Naomi to Beth-lehem — *whither thou goest, I will go* (Ruth 1:16). The same leaving-of-country that began the seed of promise now draws a daughter of the nations INTO it.'),
    ('canon','ruth',1,16, 'canon','joshua',24,15, 'free',
      E'*And if it seem evil unto you to serve Yahuah (LORD), choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15). Ruth''s *thy Elohim (God) my Elohim (God)* (Ruth 1:16) is exactly this choosing — she turns from *her gods* (1:15) to Yahuah (LORD), electing His people and His Elohim. It is covenant-choice, not accident of birth: the same deliberate *choose you this day* by which Yashar''el (Israel) bound itself at Shechem.'),
    ('canon','ruth',1,16, 'canon','deuteronomy',23,3, 'free',
      E'*An Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD); even to their tenth generation shall they not enter into the congregation of Yahuah (LORD) for ever* (Deuteronomy 23:3). This is the very bar Ruth stands against — a MOABITESS, barred by the letter. Yet she enters, not by mere confession but by being ABSORBED: she cleaves to the natural family (Naomi), is married into the seed (Mahlon, then Boaz), and so passes through the covenant-marriage doorway into Yashar''el (Israel). *Thy people shall be my people* (Ruth 1:16) is no slogan of self-inclusion; it is a real grafting-in by covenant that lands her, a Moabitess, in the Messiah''s own bloodline.'),
    ('canon','ruth',1,17, 'canon','matthew',1,5, 'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). Ruth''s oath — *Where thou diest, will I die, and there will I be buried* (Ruth 1:17) — is the moment a Moabitess is bound for good into the people of promise, and the genealogy of the Messiah records the result: *Booz begat Obed of Ruth*. The covenant-loyalty (chesed) of the pledge becomes literal blood in the line of David and of Yahusha HaMashiach (Jesus Christ) — absorption into the seed, not inclusion by word alone.'),
    ('canon','ruth',1,14, 'canon','matthew',1,5, 'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). *Orpah kissed her mother in law; but Ruth clave unto her* (Ruth 1:14): two daughters of Moab, one kiss of farewell and one cleaving for life. The cleaving is the parting of the ways — Orpah returns to *her people, and... her gods* (1:15) and vanishes from the story, while Ruth who clave is written into the Messiah''s genealogy. The difference is covenant-cleaving, not feeling; absorption, not sentiment.'),

    -- THREAD 2: call me Mara — I went out full and came home empty (the grief that does not yet see)
    ('canon','ruth',1,20, 'canon','job',1,21, 'free',
      E'*And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). Naomi''s cry — *call me not Naomi, call me Mara: for the Almighty hath dealt very bitterly with me* (Ruth 1:20) — is Job''s anguish without yet his blessing: she names the Almighty as the hand behind her loss, *Yahuah (LORD) hath taken away*, but cannot yet say *blessed be the name*. Both stand stripped before the sovereign hand; Naomi grieves at the bottom of a providence whose redemption she cannot yet see.'),
    ('canon','ruth',1,21, 'canon','job',1,21, 'free',
      E'*Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). *I went out full, and Yahuah (LORD) hath brought me home again empty* (Ruth 1:21) is the same fullness-to-emptiness Job knew — the recognition that the same Yahuah (LORD) who gave is the one who has taken. Naomi confesses His hand even in bitterness; and as with Job, the emptiness is not the end of the account but the place from which Yahuah (LORD) begins to restore.'),

    -- THREAD 3: Yahuah visited his people with bread — the unseen providence (the redemption at the door)
    ('canon','ruth',1,6, 'canon','genesis',12,10, 'free',
      E'*And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10). The same pattern opens Ruth: a famine in the land drives the family to sojourn in a foreign country, and then Yahuah (LORD) turns it — *she had heard in the country of Moab how that Yahuah (LORD) had visited his people in giving them bread* (Ruth 1:6). Famine sends them out; the visiting of Yahuah (LORD) with bread calls them home, the unseen providence already moving beneath the grief.'),
    ('canon','ruth',1,22, 'canon','ruth',4,13, 'free',
      E'*So Boaz took Ruth, and she was his wife: and when he went in unto her, Yahuah (LORD) gave her conception, and she bare a son* (Ruth 4:13). They arrive *in the beginning of barley harvest* (Ruth 1:22) — the door of provision opening — and the harvest that begins here ends in a wedding and a child: the redemption was already at the door when Naomi could only see emptiness. The famine-driven return lands precisely at the field where Boaz the kinsman-redeemer waits.'),
    ('canon','ruth',1,22, 'canon','ruth',4,14, 'free',
      E'*And the women said unto Naomi, Blessed be Yahuah (LORD), which hath not left thee this day without a kinsman, that his name may be famous in Yashar''el (Israel)* (Ruth 4:14). The woman who came home *empty* (Ruth 1:21) at *the beginning of barley harvest* (1:22) will be told, *Blessed be Yahuah (LORD), which hath not left thee this day without a kinsman* — the very emptiness undone by the redemption the harvest was opening toward. Mara''s bitterness is answered by a Goel (redeemer) and a child.'),
    ('canon','ruth',1,22, 'canon','ruth',4,17, 'free',
      E'*And the women her neighbours gave it a name, saying, There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David* (Ruth 4:17). The barley harvest that begins as Naomi returns empty (Ruth 1:22) runs all the way to *Obed: he is the father of Jesse, the father of David* — the providence working unseen beneath the famine and the graves was carrying the line of the king. The empty homecoming is, in truth, the doorway to David.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s346_rut01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s346_rut01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves',
       E'Thy people shall be my people — the Moabitess cleaves: covenant absorption into the seed of promise',
       E'Two daughters of Moab stand at the parting of the ways. *And they lifted up their voice, and wept again: and Orpah kissed her mother in law; but Ruth clave unto her* (Ruth 1:14). Orpah''s kiss is farewell — she *is gone back unto her people, and unto her gods* (1:15) and vanishes from the story. Ruth''s cleaving is for life, and she speaks the pledge that defines the book: *Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy Elohim (God) my Elohim (God): Where thou diest, will I die, and there will I be buried: Yahuah (LORD) do so to me, and more also, if ought but death part thee and me* (1:16-17).\n\nThis is covenant-loyalty — chesed — not mere confession. Ruth does not include herself by a slogan; she is ABSORBED. She cleaves to the natural family (Naomi), is married into the seed (Mahlon, then Boaz), and so passes through the marriage-covenant doorway into Yashar''el (Israel). And the bar she stands against is real: *An Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD); even to their tenth generation shall they not enter... for ever* (Deuteronomy 23:3). The letter barred her — yet she enters, because she enters by absorption into the covenant people and not by words alone.\n\nThe choosing echoes the founding of the seed itself. *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1) — Ruth leaves country, kindred and gods just as Abraham did, but inward toward the promise. And it is the deliberate choose-this-day of Shechem: *choose you this day whom ye will serve... but as for me and my house, we will serve Yahuah (LORD)* (Joshua 24:15) — *thy Elohim (God) my Elohim (God)*, election of Yahuah''s people and Yahuah''s Elohim together.\n\nThe end of the cleaving is written in the Messiah''s own line: *And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). The covenant-loyalty of the pledge becomes literal blood in the line of David and of Yahusha HaMashiach (Jesus Christ) — a daughter of the nations grafted in by covenant-marriage, the seed of promise carried by paternal bloodline AND covenant-word together, never word alone.',
       sv.verse_id, ev.verse_id, 'free', 36250
  FROM _s346_rut01_lookup sv, _s346_rut01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-1-call-me-mara-i-went-out-full-and-came-home-empty',
       E'Call me Mara — I went out full and Yahuah brought me home empty: the grief that does not yet see',
       E'Naomi comes home stripped. *And it came to pass, when they were come to Beth-lehem, that all the city was moved about them, and they said, Is this Naomi? And she said unto them, Call me not Naomi, call me Mara: for the Almighty hath dealt very bitterly with me. I went out full, and Yahuah (LORD) hath brought me home again empty* (Ruth 1:19-21). She does not curse; she names the hand. The fullness she left with — husband, two sons — is gone, and she knows whose hand it is: *Yahuah (LORD) hath testified against me, and the Almighty hath afflicted me* (1:21).\n\nIt is Job''s confession at the bottom of loss: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21). Naomi has Job''s recognition — that the same Yahuah (LORD) who gave is the one who has taken — but not yet his blessing; she stands in the bitterness before the restoration. The grief is real and it is not rebuked.\n\nAnd as with Job, the emptiness is not the end of the account but the place from which Yahuah (LORD) begins to restore. Naomi names herself Mara — bitter — at the very moment, unknown to her, that the redemption is already at the door.',
       sv.verse_id, ev.verse_id, 'free', 36253
  FROM _s346_rut01_lookup sv, _s346_rut01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence',
       E'Yahuah visited his people with bread — the unseen providence: the redemption already at the door',
       E'A famine opens the book, just as it once drove the patriarch. *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10) — and here a famine drives Elimelech and Naomi from Beth-lehem-judah to sojourn in Moab. But the famine is not the last word. *Then she arose with her daughters in law, that she might return from the country of Moab: for she had heard in the country of Moab how that Yahuah (LORD) had visited his people in giving them bread* (Ruth 1:6). Famine sends them out; the visiting of Yahuah (LORD) with bread calls them home.\n\nAnd the timing of the homecoming is the quiet sign of the providence: *So Naomi returned, and Ruth the Moabitess, her daughter in law, with her, which returned out of the country of Moab: and they came to Beth-lehem in the beginning of barley harvest* (Ruth 1:22). They arrive at the very opening of the harvest — the door of provision swinging open precisely as the empty woman comes home.\n\nNaomi can see only emptiness, but the harvest she walks into runs straight to a redemption. *So Boaz took Ruth, and she was his wife: and when he went in unto her, Yahuah (LORD) gave her conception, and she bare a son* (Ruth 4:13); *Blessed be Yahuah (LORD), which hath not left thee this day without a kinsman, that his name may be famous in Yashar''el (Israel)* (4:14); and the child is named: *There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David* (4:17). The famine-driven return, the empty homecoming at the beginning of barley harvest, was in truth the doorway to a kinsman-redeemer and to David — the providence working unseen beneath the grief, carrying the line of the king.',
       sv.verse_id, ev.verse_id, 'free', 36256
  FROM _s346_rut01_lookup sv, _s346_rut01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1: thy people shall be my people — the Moabitess cleaves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*but Ruth clave unto her* (Ruth 1:14) → *Booz begat Obed of Ruth* (Matthew 1:5): the cleaving, not the kiss, is written into the Messiah''s line.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Get thee out of thy country, and from thy kindred* (Genesis 12:1) — Ruth''s leaving of people and gods is Abraham''s call turned inward toward the promise.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*choose you this day whom ye will serve* (Joshua 24:15) — *thy Elohim (God) my Elohim (God)* is the same deliberate covenant-choosing.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*An Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD)* (Deuteronomy 23:3) — the bar overcome by absorption, not by mere confession.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Booz begat Obed of Ruth* (Matthew 1:5) — the oath *where thou diest, will I die* (Ruth 1:17) becomes blood in the line of David and the Messiah.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-thy-people-shall-be-my-people-the-moabitess-cleaves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: call me Mara — I went out full and came home empty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21) — Naomi has Job''s recognition of the sovereign hand, not yet his blessing.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=20
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-call-me-mara-i-went-out-full-and-came-home-empty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) gave, and Yahuah (LORD) hath taken away* (Job 1:21) — *I went out full, and Yahuah (LORD) hath brought me home again empty* (Ruth 1:21): the same fullness-to-emptiness before the same sovereign hand.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-call-me-mara-i-went-out-full-and-came-home-empty'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Yahuah visited his people with bread — the unseen providence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there was a famine in the land: and Abram went down into Egypt to sojourn* (Genesis 12:10) — famine drives the family out, just as it drove the patriarch.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah (LORD) gave her conception, and she bare a son* (Ruth 4:13) — the barley harvest that begins at the empty homecoming (Ruth 1:22) ends in a wedding and a child.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*hath not left thee this day without a kinsman* (Ruth 4:14) — the *empty* woman (Ruth 1:21) answered by a Goel (redeemer) the harvest was opening toward.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Obed: he is the father of Jesse, the father of David* (Ruth 4:17) — the providence beneath the famine was carrying the line of the king.'
  FROM cross_reference_threads t
  JOIN _s346_rut01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=1 AND sv.verse_number=22
  JOIN _s346_rut01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-1-yahuah-visited-his-people-with-bread-the-unseen-providence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ruth_2.sql (Ruth 2) -----
-- Chapter: Ruth 2 (Ruth goes to glean; her hap to light on Boaz's field; the gleaning-law for
--   the poor and the stranger; Boaz's kindness; "under whose wings thou art come to trust"; Boaz
--   one of our next kinsmen / go'el)
-- Tag: rut02   View: _s346_rut02_lookup   Sort band: 36275 step 3 (36275,36278,36281,36284)
-- Source rows ALL 'canon','ruth',2,v.  Canon target tier 'free'; extras tier 'extras'.
-- Thread tier_required 'free' (every member canon).
--
-- Ruth 2 coverage:
--   v.1  (Naomi had a kinsman, a mighty man of wealth, of Elimelech's family, Boaz)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Ruth 3:9 (near kinsman) / Ruth 3:12 -> THREAD 1 (the go'el set up)
--   v.3  (her hap was to light on a part of the field belonging unto Boaz, of the kindred of Elimelech)
--        NT:     none warranted (the providence framing carried laterally within Ruth)
--        Extras: none warranted
--        Tanakh: Genesis 24:27 (Yahuah led me to the house of my master's brethren) -> THREAD 1
--   v.9,14,16 (Boaz bids her drink his water, eat his bread, handfuls of purpose for her)
--        NT:     none warranted (covered by the kindness/refuge weave)
--        Extras: none warranted
--        Tanakh: (the gleaning provision below)
--   v.7,15-16 (let her glean among the sheaves; let fall handfuls on purpose)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Leviticus 19:9-10; Leviticus 23:22; Deuteronomy 24:19,20,21 -> THREAD 2 (the gleaning-law)
--   v.10-11 (Ruth a stranger; left her father, mother, land of nativity)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Leviticus 19:10,34; Deuteronomy 24:19 (the stranger fed) -> THREAD 2
--   v.12 (a full reward of Yahuah Elohim of Yashar'el, under whose wings thou art come to trust)
--        NT:     none warranted (the refuge-under-wings figure is Tanakh-internal; Boaz becomes the wings, ch3:9)
--        Extras: none warranted
--        Tanakh: Psalm 17:8; Psalm 36:7; Psalm 91:1,4; Ruth 3:9 -> THREAD 3 (the refuge under the wings)
--   v.20 (Blessed be he of Yahuah... the man is near of kin unto us, one of our next kinsmen)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Ruth 3:9,12 (the go'el / near kinsman) -> THREAD 1
--
-- THREADS (3):
--   ruth-2-her-hap-was-to-light-on-the-field-of-boaz        [canon]  v.1-20 -> Gen24, Ruth3 (the "chance" that is providence; Boaz the kinsman/go'el)
--   ruth-2-the-gleaning-law-for-the-poor-and-the-stranger   [canon]  v.7-16 -> Lev19, Lev23, Deut24 (Torah's mercy for the poor/widow/sojourner -- never the curse)
--   ruth-2-under-whose-wings-thou-art-come-to-trust         [canon]  v.12  -> Ps17, Ps36, Ps91, Ruth3 (refuge under Yahuah's wings; Boaz becomes those wings, ch3:9)
--
-- FRAMING NOTES: v.3 "her hap was to light on a part of the field belonging unto Boaz" -- the
--   apparent chance that is the hidden hand of providence (Gen 24:27 the servant led straight to
--   the right house), the kinsman's field chosen for her without her knowing it. v.7-16 the
--   gleaning Ruth gathers is the TORAH'S OWN PROVISION for the poor and the stranger (Lev 19:9-10,
--   Lev 23:22, Deut 24:19-21) -- the widow and the sojourner fed by the standing law; Ruth is BOTH
--   widow and stranger, and the Torah feeds her. The Torah is the provision of grace for the
--   vulnerable, never the curse. v.12 "under whose wings thou art come to trust" -- the refuge in
--   Yahuah (Ps 17:8, Ps 36:7, Ps 91:1,4); and Boaz, who blesses her with that refuge, will himself
--   become the very "wings" spread over her when she asks him to "spread thy skirt [wing] over thine
--   handmaid; for thou art a near kinsman" (Ruth 3:9) -- the kinsman-redeemer the means of the
--   refuge he pronounces.

CREATE TEMP VIEW _s346_rut02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM ( VALUES
    -- THREAD 1: her hap was to light on the field of Boaz -- providence and the kinsman (v.3, v.20)
    ('canon','ruth',2,3,'canon','genesis',24,27,'free',
      E'*And he said, Blessed be Yahuah Elohim (the LORD God) of my master Abraham, who hath not left destitute my master of his mercy and his truth: I being in the way, Yahuah (LORD) led me to the house of my master''s brethren* (Genesis 24:27). Ruth''s *hap was to light on a part of the field belonging unto Boaz, who was of the kindred of Elimelech* (Ruth 2:3) is the same hidden hand: what looks like chance is Yahuah leading the stranger straight to the house of the kinsman, the providence that needs no miracle because it governs the ordinary step.'),
    ('canon','ruth',2,20,'canon','ruth',3,9,'free',
      E'*And he said, Who art thou? And she answered, I am Ruth thine handmaid: spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9). Naomi''s word -- *the man is near of kin unto us, one of our next kinsmen* (Ruth 2:20) -- opens the door the next chapter walks through: the go''el, the kinsman-redeemer, is the one who can redeem the field and raise up the name of the dead, and Ruth will ask Boaz himself to be that redeemer.'),
    ('canon','ruth',2,20,'canon','ruth',3,12,'free',
      E'*And now it is true that I am thy near kinsman: howbeit there is a kinsman nearer than I* (Ruth 3:12). Naomi names Boaz *one of our next kinsmen* (Ruth 2:20); Boaz confirms it -- he is a go''el, with the right and the duty to redeem -- and the whole drama of redemption turns on this kinship, the near one standing in for the dead to preserve the seed and the inheritance.'),

    -- THREAD 2: the gleaning-law for the poor and the stranger (v.7, v.15-16, v.10)
    ('canon','ruth',2,7,'canon','leviticus',19,9,'free',
      E'*And when ye reap the harvest of your land, thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest* (Leviticus 19:9). Ruth''s plea -- *let me glean and gather after the reapers among the sheaves* (Ruth 2:7) -- is her claim upon the Torah''s own provision: the standing law commands the landowner to leave the corners and the gleanings, and Ruth comes to gather what Yahuah''s instruction has already reserved for the poor.'),
    ('canon','ruth',2,7,'canon','leviticus',19,10,'free',
      E'*And thou shalt not glean thy vineyard, neither shalt thou gather every grape of thy vineyard; thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:10). Here is the very ground Ruth stands on -- *thou shalt leave them for the poor and stranger*. Ruth is both poor and a stranger, and the Torah feeds her; the gleaning-law is the mercy of Yahuah''s instruction toward the vulnerable, never the curse but the provision of grace.'),
    ('canon','ruth',2,15,'canon','leviticus',23,22,'free',
      E'*And when ye reap the harvest of your land, thou shalt not make clean riddance of the corners of thy field when thou reapest, neither shalt thou gather any gleaning of thy harvest: thou shalt leave them unto the poor, and to the stranger: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 23:22). Boaz commands his young men, *Let her glean even among the sheaves, and reproach her not* (Ruth 2:15) -- he does more than the law''s minimum, but the law is the frame: set right in the midst of the feasts of Yahuah, the harvest-mercy for the poor and the stranger is part of the same holy calendar.'),
    ('canon','ruth',2,16,'canon','deuteronomy',24,19,'free',
      E'*When thou cuttest down thine harvest in thy field, and hast forgot a sheaf in the field, thou shalt not go again to fetch it: it shall be for the stranger, for the fatherless, and for the widow: that Yahuah Elohayka (the LORD thy God) may bless thee in all the work of thine hands* (Deuteronomy 24:19). Boaz fulfils this with overflowing measure -- *let fall also some of the handfuls of purpose for her, and leave them, that she may glean them* (Ruth 2:16). The forgotten sheaf the Torah leaves for *the stranger, for the fatherless, and for the widow* Boaz multiplies on purpose, and the promised blessing on his hands becomes the line of David.'),
    ('canon','ruth',2,16,'canon','deuteronomy',24,20,'free',
      E'*When thou beatest thine olive tree, thou shalt not go over the boughs again: it shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:20). The same threefold mercy -- the stranger, the fatherless, the widow -- is the heart of the gleaning command, and Ruth the widowed Moabitess is exactly the one it was written to feed; Boaz''s *handfuls of purpose* (Ruth 2:16) are the Torah''s charity made generous.'),
    ('canon','ruth',2,16,'canon','deuteronomy',24,21,'free',
      E'*When thou gatherest the grapes of thy vineyard, thou shalt not glean it afterward: it shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:21). Three times the Torah names the same beneficiaries of the harvest-leavings, and three times it grounds them in mercy remembered: *thou shalt remember that thou wast a bondman in the land of Egypt* (Deut 24:22). Boaz, leaving handfuls on purpose for Ruth (Ruth 2:16), keeps the law not as burden but as the kindness Yahuah built into the field.'),
    ('canon','ruth',2,10,'canon','leviticus',19,34,'free',
      E'*But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:34). Ruth marvels, *Why have I found grace in thine eyes... seeing I am a stranger?* (Ruth 2:10) -- and the Torah has already answered her: the stranger who dwells with Yashar''el (Israel) is to be loved as the native-born, for Israel too was a stranger. Boaz''s kindness is the law of love to the sojourner kept in the flesh.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s346_rut02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s346_rut02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 3: under whose wings thou art come to trust (v.12)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM ( VALUES
    ('canon','ruth',2,12,'canon','psalms',17,8,'free',
      E'*Keep me as the apple of the eye, hide me under the shadow of thy wings* (Psalm 17:8). Boaz''s blessing -- *a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12) -- speaks the very refuge David sings: to come under Yahuah''s wings is to be hidden like the apple of His eye, and Ruth the stranger has chosen exactly that shelter.'),
    ('canon','ruth',2,12,'canon','psalms',36,7,'free',
      E'*How excellent is thy lovingkindness, O Elohim (God)! therefore the children of men put their trust under the shadow of thy wings* (Psalm 36:7). The image Boaz blesses Ruth with -- *under whose wings thou art come to trust* (Ruth 2:12) -- is the gospel of the Psalms: the children of men taking refuge under Yahuah''s wings, abundantly satisfied with the fatness of His house. Ruth, who left her land to trust the Elohim of Yashar''el (Israel), is one of those children come to that shadow.'),
    ('canon','ruth',2,12,'canon','psalms',91,4,'free',
      E'*He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4). Boaz names the very refuge of the ninety-first Psalm -- *under whose wings thou art come to trust* (Ruth 2:12) -- the one who dwells in the secret place of the El Elyon (most High) sheltered beneath Yahuah''s wings. Ruth has fled to that covering, and the reward Boaz pronounces is the safety of the trusting.'),
    ('canon','ruth',2,12,'canon','psalms',91,1,'free',
      E'*He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1). To come *under whose wings thou art come to trust* (Ruth 2:12) is to dwell in that secret place -- Ruth the Moabitess, who left father, mother, and the land of her nativity, has made the Almighty her habitation, and the shadow of His wings her home.'),
    ('canon','ruth',2,12,'canon','ruth',3,9,'free',
      E'*Spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9). The Hebrew is exact: the same word for *wing* that Boaz blesses Ruth with -- *under whose wings thou art come to trust* (Ruth 2:12) -- is the *skirt* Ruth asks him to spread over her. The kinsman who pronounced the refuge of Yahuah''s wings is asked to become those wings himself: the go''el is the means of the very shelter he blessed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s346_rut02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s346_rut02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-2-her-hap-was-to-light-on-the-field-of-boaz',
       E'Her hap was to light on the field of Boaz -- the chance that is providence',
       E'Ruth goes out empty to gather what she can, and the narrator lets the word *hap* fall almost carelessly: *and she went, and came, and gleaned in the field after the reapers: and her hap was to light on a part of the field belonging unto Boaz, who was of the kindred of Elimelech* (Ruth 2:3). It reads like chance -- a Moabite widow stumbling into one field among many -- but the whole book is built on the truth that this is no chance at all. It is the same hidden hand that led Abraham''s servant: *I being in the way, Yahuah (LORD) led me to the house of my master''s brethren* (Genesis 24:27). The providence that governs the seed-line needs no miracle; it governs the ordinary step into the right field. And the field is not random: Boaz is *a mighty man of wealth, of the family of Elimelech* (Ruth 2:1), and when Naomi hears the name she sees what Yahuah is doing -- *Blessed be he of Yahuah (LORD), who hath not left off his kindness to the living and to the dead. And Naomi said unto her, The man is near of kin unto us, one of our next kinsmen* (Ruth 2:20). The next kinsman is the go''el, the kinsman-redeemer, and the next chapter opens the door this one only set ajar: *I am Ruth thine handmaid: spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9), and Boaz answers, *it is true that I am thy near kinsman* (Ruth 3:12). The redeemer who will buy back the field and raise up the name of the dead is the one whose field Ruth''s *hap* found -- providence preparing redemption from the first careless-looking step.',
       sv.verse_id, ev.verse_id, 'free', 36275
  FROM _s346_rut02_lookup sv, _s346_rut02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-2-the-gleaning-law-for-the-poor-and-the-stranger',
       E'The gleaning-law -- the Torah''s mercy for the poor and the stranger',
       E'Ruth''s whole livelihood in this chapter rests on a single provision of the Torah, and it is worth seeing how completely the law has gone before her. Her plea is modest -- *let me glean and gather after the reapers among the sheaves* (Ruth 2:7) -- but it is not begging; it is a claim upon a right Yahuah wrote into the harvest: *and when ye reap the harvest of your land, thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest. And thou shalt not glean thy vineyard... thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:9-10). Ruth is *both* poor and stranger, and the standing law has already reserved for her exactly what she comes to gather. The same command is set in the midst of the feasts of Yahuah -- *thou shalt leave them unto the poor, and to the stranger* (Leviticus 23:22) -- and again in Deuteronomy with its threefold beneficiary named over and over: *it shall be for the stranger, for the fatherless, and for the widow: that Yahuah Elohayka (the LORD thy God) may bless thee in all the work of thine hands* (Deuteronomy 24:19; cf. 24:20-21). Ruth the widowed Moabitess is the very person these words were written to feed. And Boaz keeps the law not at its minimum but overflowing: *Let her glean even among the sheaves, and reproach her not... let fall also some of the handfuls of purpose for her* (Ruth 2:15-16). When she wonders why she finds grace *seeing I am a stranger* (2:10), the Torah has already answered her -- *the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself; for ye were strangers in the land of Egypt* (Leviticus 19:34). This is the Torah as it truly is: not the curse, but the provision of grace -- the mercy of Yahuah''s instruction caring for the widow and the sojourner, feeding the one the world would have left empty.',
       sv.verse_id, ev.verse_id, 'free', 36278
  FROM _s346_rut02_lookup sv, _s346_rut02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-2-under-whose-wings-thou-art-come-to-trust',
       E'Under whose wings thou art come to trust -- the refuge in Yahuah',
       E'The heart of the chapter is Boaz''s blessing over the stranger who has thrown herself on the mercy of Yashar''el''s (Israel''s) Elohim: *Yahuah (LORD) recompense thy work, and a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12). It is the language of the Psalms, the great figure of refuge. David prays, *hide me under the shadow of thy wings* (Psalm 17:8); he sings, *therefore the children of men put their trust under the shadow of thy wings* (Psalm 36:7); and the ninety-first Psalm makes the shelter sure -- *he that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty... he shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:1,4). Ruth, who *left her father and her mother, and the land of her nativity* (Ruth 2:11) to come to a people she did not know, is precisely one of those children of men who have fled to that covering; she has made the Almighty her habitation. But there is a deeper turn the Hebrew carries: the word Boaz uses for *wings* is the same word Ruth will use in the next chapter when she asks him, *spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9) -- spread your *wing* over me. The kinsman who blessed her with the refuge of Yahuah''s wings is asked to become those wings himself. The go''el, the redeemer, is the very means of the shelter he pronounced -- the picture of how Yahuah''s refuge reaches the trusting through the kinsman who takes their cause as his own.',
       sv.verse_id, ev.verse_id, 'free', 36281
  FROM _s346_rut02_lookup sv, _s346_rut02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1: her hap was to light on the field of Boaz
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I being in the way, Yahuah (LORD) led me to the house of my master''s brethren* (Genesis 24:27) -- the same hidden hand: what looks like *hap* (Ruth 2:3) is Yahuah leading the stranger to the kinsman''s field.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-her-hap-was-to-light-on-the-field-of-boaz'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9) -- *one of our next kinsmen* (Ruth 2:20) is the go''el; the next chapter walks through the door this one set ajar.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-her-hap-was-to-light-on-the-field-of-boaz'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It is true that I am thy near kinsman: howbeit there is a kinsman nearer than I* (Ruth 3:12) -- Boaz confirms the kinship Naomi named (Ruth 2:20); the redemption turns on the go''el.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-her-hap-was-to-light-on-the-field-of-boaz'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the gleaning-law for the poor and the stranger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not wholly reap the corners of thy field, neither shalt thou gather the gleanings of thy harvest* (Leviticus 19:9) -- the standing law that Ruth''s *let me glean... among the sheaves* (Ruth 2:7) lays claim to.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt leave them for the poor and stranger: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 19:10) -- Ruth is both poor and stranger; the Torah feeds her, the provision of grace, never the curse.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt leave them unto the poor, and to the stranger* (Leviticus 23:22) -- the harvest-mercy set among the feasts of Yahuah; Boaz''s *let her glean even among the sheaves* (Ruth 2:15) keeps it overflowing.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*It shall be for the stranger, for the fatherless, and for the widow: that Yahuah Elohayka (the LORD thy God) may bless thee* (Deuteronomy 24:19) -- the forgotten sheaf Boaz multiplies *of purpose* (Ruth 2:16); the blessing on his hands becomes David''s line.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*It shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:20) -- the threefold mercy at the heart of the gleaning-law; Ruth the widowed Moabitess is exactly who it was written to feed.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*When thou gatherest the grapes of thy vineyard, thou shalt not glean it afterward: it shall be for the stranger, for the fatherless, and for the widow* (Deuteronomy 24:21) -- three times the same beneficiaries named; Boaz keeps the law as kindness, not burden.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*The stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself* (Leviticus 19:34) -- the Torah''s answer to Ruth''s *seeing I am a stranger* (Ruth 2:10): Boaz''s kindness is the law of love to the sojourner kept in the flesh.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-the-gleaning-law-for-the-poor-and-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: under whose wings thou art come to trust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Hide me under the shadow of thy wings* (Psalm 17:8) -- the refuge Boaz blesses Ruth with (Ruth 2:12): to come under Yahuah''s wings is to be hidden as the apple of His eye.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=17 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-under-whose-wings-thou-art-come-to-trust'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The children of men put their trust under the shadow of thy wings* (Psalm 36:7) -- Ruth, who left her land to trust Yashar''el''s (Israel''s) Elohim, is one of those children come to that shadow (Ruth 2:12).'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-under-whose-wings-thou-art-come-to-trust'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He shall cover thee with his feathers, and under his wings shalt thou trust* (Psalm 91:4) -- the very refuge Boaz names (Ruth 2:12); the reward he pronounces is the safety of the trusting.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-under-whose-wings-thou-art-come-to-trust'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1) -- Ruth, who left father, mother, and land, has made the Almighty her habitation (Ruth 2:12).'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-under-whose-wings-thou-art-come-to-trust'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9) -- the same Hebrew *wing* Boaz blessed her with (Ruth 2:12); the kinsman is asked to become the very refuge he pronounced.'
  FROM cross_reference_threads t
  JOIN _s346_rut02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s346_rut02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-2-under-whose-wings-thou-art-come-to-trust'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ruth_3.sql (Ruth 3) -----
-- Chapter: Ruth 3  |  Tag: rut03  |  View: _s346_rut03_lookup  |  Sort band: 36300, 36303, 36306, 36309
--
-- Ruth 3 coverage:
--   v.1-8 (Naomi's instruction, the threshing floor at night, Ruth uncovers Boaz's feet)
--        NT:     none warranted (narrative setup; the redemption-types land at v.9, v.12-13, v.18)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.9  (spread thy skirt over thine handmaid; for thou art a near kinsman)
--        NT:     none direct here (the kinsman-redeemer forward weave is carried on the v.9/12-13 go'el thread)
--        Extras: none warranted
--        Tanakh: Ruth 2:12 (under whose wings thou art come to trust — same kanaph), Ezekiel 16:8 (I spread
--                my skirt over thee... entered into a covenant), Psalm 91:4 (under his wings shalt thou trust)
--   v.10-11 (Boaz blesses her kindness; I will do all that thou requirest; a virtuous woman)
--        NT/Extras/Tanakh: folded into the go'el thread (the agreement to redeem)
--   v.12-13 (I am thy near kinsman... I will do the part of a kinsman, as Yahuah liveth; a nearer kinsman first)
--        NT:     Isaiah 59:20 forward → Romans 11:26 (the Redeemer/Deliverer out of Zion), Titus 2:14
--                (gave himself to redeem... a peculiar people), Galatians 4:4-5 (sent forth his Son... to redeem)
--        Extras: none warranted
--        Tanakh: Leviticus 25:25 (kinsman redeems the possession), Leviticus 25:48-49 (kinsman redeems the
--                person), Deuteronomy 25:5-6 (levirate raising up the dead's name), Ruth 4:9-10 (accomplished),
--                Isaiah 59:20 (the Redeemer shall come to Zion)
--   v.14-17 (Ruth lies at his feet till morning; six measures of barley; go not empty)
--        NT/Extras/Tanakh: none warranted (narrative; the pledge carries into v.18)
--   v.18  (the man will not be in rest, until he have finished the thing this day)
--        NT:     none direct member (the finished-redemption forward weight rides Isaiah 59:20/Titus 2:14 on
--                the go'el thread); kept canon-Tanakh here
--        Extras: none warranted
--        Tanakh: Ruth 4:1 (Boaz up to the gate that same day), Ruth 4:9-10 (the redemption finished, witnessed)
--
-- Threads (3 curated):
--   1. ruth-3-spread-thy-skirt-over-thine-handmaid-the-wing-of-refuge   [Tanakh]  band 36300
--      3:9 appeal → Ruth 2:12, Ezekiel 16:8, Psalm 91:4  (the kanaph/wing-of-refuge, covenant-marriage)
--   2. ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems             [NT+Tanakh] band 36303
--      3:9/3:12-13 the go'el → Lev 25:25, Lev 25:48-49, Deut 25:5-6, Ruth 4:9-10, Isaiah 59:20, Romans 11:26,
--      Titus 2:14, Galatians 4:4-5  (the kinsman-redeemer who redeems the lost inheritance → Messiah our Kinsman)
--   3. ruth-3-he-will-not-be-in-rest-until-he-have-finished            [Tanakh]  band 36306
--      3:18 → Ruth 4:1, Ruth 4:9-10  (the redeemer who will not rest until the redemption is accomplished)

CREATE TEMP VIEW _s346_rut03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: spread thy skirt / the wing of refuge (3:9)
    ('canon','ruth',3,9,'canon','ruth',2,12,'free',E'*Yahuah (LORD) recompense thy work, and a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12). The very wing (Heb. kanaph, skirt/corner) under which Boaz had blessed her to find shelter in the field is now the wing she asks him himself to spread: *spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9). The refuge she fled to is answered by the kinsman who becomes her covering.'),
    ('canon','ruth',3,9,'canon','ezekiel',16,8,'free',E'*Now when I passed by thee, and looked upon thee, behold, thy time was the time of love; and I spread my skirt over thee, and covered thy nakedness: yea, I sware unto thee, and entered into a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine* (Ezekiel 16:8). Ruth''s plea, *spread therefore thy skirt over thine handmaid* (Ruth 3:9), is the identical covenant-marriage image: the spread skirt is the betrothal, Yahuah''s own picture of how He took Yashar''el (Israel) to be His own.'),
    ('canon','ruth',3,9,'canon','psalms',91,4,'free',E'*He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4). The same wing-of-refuge runs through the Psalms: to be covered under the wing is to trust under it. When Ruth asks Boaz, *spread therefore thy skirt over thine handmaid* (Ruth 3:9), she asks the kinsman to be to her what the wing of the Most High is to all who shelter there.'),

    -- Thread 2: the go'el / near kinsman who redeems (3:9, 3:12, 3:13)
    ('canon','ruth',3,12,'canon','leviticus',25,25,'free',E'*If thy brother be waxen poor, and hath sold away some of his possession, and if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25). This is the Torah office Boaz claims when he says *it is true that I am thy near kinsman* (Ruth 3:12): the go''el, the near-of-kin redeemer, whose duty is to buy back the lost inheritance of his impoverished brother.'),
    ('canon','ruth',3,12,'canon','leviticus',25,48,'free',E'*After that he is sold he may be redeemed again; one of his brethren may redeem him* (Leviticus 25:48). The kinsman redeems not only the land but the person; the go''el buys back the one fallen into bondage. Boaz''s claim, *I am thy near kinsman* (Ruth 3:12), reaches to this whole redemption of both inheritance and people.'),
    ('canon','ruth',3,12,'canon','leviticus',25,49,'free',E'*Either his uncle, or his uncle''s son, may redeem him, or any that is nigh of kin unto him of his family may redeem him; or if he be able, he may redeem himself* (Leviticus 25:49). The Torah names exactly the order Boaz honours — the one nigh of kin redeems — which is why he flags *there is a kinsman nearer than I* (Ruth 3:12): the right of redemption belongs first to the nearest.'),
    ('canon','ruth',3,13,'canon','deuteronomy',25,5,'free',E'*If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her* (Deuteronomy 25:5). Boaz''s pledge *I will do the part of a kinsman to thee, as Yahuah (LORD) liveth* (Ruth 3:13) is this levirate duty: the kinsman marries the widow of the dead to keep the dead man''s line alive.'),
    ('canon','ruth',3,13,'canon','deuteronomy',25,6,'free',E'*And it shall be, that the firstborn which she beareth shall succeed in the name of his brother which is dead, that his name be not put out of Yashar''el (Israel)* (Deuteronomy 25:6). The whole point of the kinsman''s part Boaz swears to do — *I will do the part of a kinsman to thee* (Ruth 3:13) — is that the name of the dead not be cut off; the redeemer raises up seed to carry the name forward.'),
    ('canon','ruth',3,13,'canon','ruth',4,9,'free',E'*And Boaz said unto the elders, and unto all the people, Ye are witnesses this day, that I have bought all that was Elimelech''s, and all that was Chilion''s and Mahlon''s, of the hand of Naomi* (Ruth 4:9). The oath of Ruth 3:13, *I will do the part of a kinsman to thee, as Yahuah (LORD) liveth*, is performed: the go''el buys back the whole lost inheritance, lawfully, before witnesses at the gate.'),
    ('canon','ruth',3,13,'canon','ruth',4,10,'free',E'*Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren* (Ruth 4:10). The kinsman''s part sworn in Ruth 3:13 is fully kept: Boaz redeems both the land and the widow, raising up the name of the dead — the levirate and the land-redemption joined in one redeemer.'),
    ('canon','ruth',3,13,'canon','isaiah',59,20,'free',E'*And the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD)* (Isaiah 59:20). The go''el Boaz swears to be — *I will do the part of a kinsman to thee, as Yahuah (LORD) liveth* (Ruth 3:13) — is the shadow of the great Redeemer Himself: the same word goel, the near Kinsman who comes to redeem His own.'),
    ('canon','ruth',3,13,'canon','romans',11,26,'free',E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). Isaiah''s Redeemer is read forward to Messiah, the Kinsman who redeems all Yashar''el (Israel) — the very office Boaz fills in figure when he vows *I will do the part of a kinsman* (Ruth 3:13).'),
    ('canon','ruth',3,13,'canon','titus',2,14,'free',E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). Boaz the near kinsman who redeems the lost inheritance — *I will do the part of a kinsman to thee* (Ruth 3:13) — is the type of Messiah our Kinsman, who gives himself to redeem and to make a peculiar people His own.'),
    ('canon','ruth',3,13,'canon','galatians',4,5,'free',E'*To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5). The Son is sent, made of a woman, to redeem — the kinsman-redeemer''s work made flesh. Boaz''s sworn pledge, *I will do the part of a kinsman to thee* (Ruth 3:13), foreshadows the near Kinsman who redeems and brings the redeemed into the family as sons.'),

    -- Thread 3: he will not be in rest until he have finished (3:18)
    ('canon','ruth',3,18,'canon','ruth',4,1,'free',E'*Then went Boaz up to the gate, and sat him down there: and, behold, the kinsman of whom Boaz spake came by* (Ruth 4:1). Naomi''s word is proved true at once: *the man will not be in rest, until he have finished the thing this day* (Ruth 3:18). The very same day the redeemer goes up to the gate to settle the redemption lawfully and not let it rest.'),
    ('canon','ruth',3,18,'canon','ruth',4,10,'free',E'*Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day* (Ruth 4:10). *The man will not be in rest, until he have finished the thing this day* (Ruth 3:18) — and he finishes it: the redemption is accomplished, witnessed, complete in that same day.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s346_rut03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s346_rut03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-3-spread-thy-skirt-over-thine-handmaid-the-wing-of-refuge',
       E'Spread Thy Skirt Over Thine Handmaid — the Wing of Refuge',
       E'At the threshing floor Ruth makes her appeal to Boaz: *I am Ruth thine handmaid: spread therefore thy skirt over thine handmaid; for thou art a near kinsman* (Ruth 3:9). The word is kanaph — skirt, corner, wing. It is the very wing under which Boaz had already blessed her to find shelter: *Yahuah (LORD) recompense thy work, and a full reward be given thee of Yahuah Elohim (the LORD God) of Yashar''el (Israel), under whose wings thou art come to trust* (Ruth 2:12). Now she asks the kinsman himself to be that covering — the refuge answered by a redeemer. The Psalms sing the same wing: *He shall cover thee with his feathers, and under his wings shalt thou trust: his truth shall be thy shield and buckler* (Psalm 91:4). And Yahuah (LORD) makes the spread skirt His own covenant-marriage image: *I spread my skirt over thee, and covered thy nakedness: yea, I sware unto thee, and entered into a covenant with thee, saith Adonai Yahuah (the Lord GOD), and thou becamest mine* (Ezekiel 16:8). Ruth''s plea is a betrothal under the wing — the kinsman becoming covering, covenant, and home.',
       sv.verse_id, ev.verse_id, 'free', 36300
  FROM _s346_rut03_lookup sv, _s346_rut03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems',
       E'Thou Art a Near Kinsman — the Go''el Who Redeems',
       E'*And now it is true that I am thy near kinsman... I will do the part of a kinsman to thee, as Yahuah (LORD) liveth* (Ruth 3:12-13). Boaz claims the Torah office of the go''el — the near-of-kin redeemer. The instruction is plain: *if thy brother be waxen poor, and hath sold away some of his possession, and if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25); and the kinsman redeems the person too — *after that he is sold he may be redeemed again; one of his brethren may redeem him* (Leviticus 25:48) — *or any that is nigh of kin unto him of his family may redeem him* (Leviticus 25:49). This is why Boaz honours the order, flagging *there is a kinsman nearer than I* (Ruth 3:12): the right belongs first to the nearest. Joined to it is the levirate: *her husband''s brother shall go in unto her, and take her to him to wife* (Deuteronomy 25:5), *that his name be not put out of Yashar''el (Israel)* (Deuteronomy 25:6). Boaz keeps both at the gate: *I have bought all that was Elimelech''s* (Ruth 4:9) and *Ruth... have I purchased to be my wife, to raise up the name of the dead upon his inheritance* (Ruth 4:10). And the whole figure points forward: *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD)* (Isaiah 59:20) — read in Messiah, *There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). He is the Kinsman *who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people* (Titus 2:14), the Son *sent forth... to redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5). Boaz the go''el is the shadow; Messiah our near Kinsman redeems the lost inheritance and raises up the dead.',
       sv.verse_id, ev.verse_id, 'free', 36303
  FROM _s346_rut03_lookup sv, _s346_rut03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-3-he-will-not-be-in-rest-until-he-have-finished',
       E'He Will Not Be in Rest Until He Have Finished',
       E'Naomi sends Ruth home to wait, certain of the redeemer''s resolve: *Sit still, my daughter, until thou know how the matter will fall: for the man will not be in rest, until he have finished the thing this day* (Ruth 3:18). The redeemer does not delay. That very day *went Boaz up to the gate, and sat him down there: and, behold, the kinsman of whom Boaz spake came by* (Ruth 4:1) — he goes at once to settle the redemption lawfully, in order, before the elders. And he finishes it: *Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren, and from the gate of his place: ye are witnesses this day* (Ruth 4:10). The kinsman-redeemer will not rest until the redemption is accomplished, witnessed, complete — a man of integrity who finishes the thing this day.',
       sv.verse_id, ev.verse_id, 'free', 36306
  FROM _s346_rut03_lookup sv, _s346_rut03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- Thread 1: wing of refuge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ruth 2:12 — *under whose wings thou art come to trust*: the same kanaph (skirt/wing) Boaz blessed her under, now asked of him.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-spread-thy-skirt-over-thine-handmaid-the-wing-of-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezekiel 16:8 — *I spread my skirt over thee... and entered into a covenant with thee*: Yahuah''s own covenant-marriage image, the same spread skirt Ruth asks of Boaz.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-spread-thy-skirt-over-thine-handmaid-the-wing-of-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 91:4 — *under his wings shalt thou trust*: the wing-of-refuge sung; to shelter under the wing is to trust under it.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-spread-thy-skirt-over-thine-handmaid-the-wing-of-refuge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the go'el who redeems
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 25:25 — *if any of his kin come to redeem it... he redeem that which his brother sold*: the Torah office of the go''el Boaz claims.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 25:48 — *one of his brethren may redeem him*: the kinsman redeems the person, not only the land.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 25:49 — *any that is nigh of kin... may redeem him*: the Torah names the order of nearness Boaz honours (Ruth 3:12, a nearer kinsman first).'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Deuteronomy 25:5 — *her husband''s brother shall... take her to him to wife*: the levirate duty Boaz swears to perform.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 25:6 — *that his name be not put out of Yashar''el (Israel)*: the redeemer raises up the dead man''s name.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ruth 4:9 — *I have bought all that was Elimelech''s*: the sworn kinsman''s part performed; the lost inheritance redeemed.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Ruth 4:10 — *to raise up the name of the dead upon his inheritance*: land-redemption and levirate joined in one redeemer.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Isaiah 59:20 — *the Redeemer shall come to Zion*: the same word goel; Boaz the near kinsman is the shadow of the great Redeemer.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Romans 11:26 — *There shall come out of Sion the Deliverer*: Isaiah''s Redeemer read forward to Messiah, the Kinsman who redeems all Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'Titus 2:14 — *gave himself for us, that he might redeem us... and purify unto himself a peculiar people*: Messiah our Kinsman who redeems and makes a people His own.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'Galatians 4:5 — *to redeem them that were under the law, that we might receive the adoption of sons*: the kinsman-redeemer''s work made flesh, bringing the redeemed into the family.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-thou-art-a-near-kinsman-the-goel-who-redeems'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: he will not be in rest until he have finished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ruth 4:1 — *Then went Boaz up to the gate*: that same day the redeemer goes to settle it lawfully; he will not rest.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-he-will-not-be-in-rest-until-he-have-finished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ruth 4:10 — *ye are witnesses this day*: the redemption finished and witnessed in that same day, as Naomi foretold.'
  FROM cross_reference_threads t
  JOIN _s346_rut03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s346_rut03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-3-he-will-not-be-in-rest-until-he-have-finished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_ruth_4.sql (Ruth 4) -----
--
-- Chapter: Ruth 4 (THE FINAL CHAPTER OF RUTH — and the close of the whole Former-Prophets/historical track:
--          Boaz redeems; Obed born; the genealogy to David) | tag: rut04 | view: _s346_rut04_lookup
-- Sort band: 36325, 36328, 36331, 36334, 36337, 36340
--
-- Ruth 4 coverage:
--   v.1-6  (Boaz at the gate, the nearer kinsman, the field + Ruth; he declines lest he mar his inheritance)
--          NT:     none warranted (the type is carried in the BOAZ-redeems thread)
--          Extras: none warranted
--          Tanakh: Leviticus 25:25 (the go'el redeems his brother's possession); Deuteronomy 25:5-6
--                  (the levirate — raise up the name of the dead) — the kinsman-who-would-not-redeem thread
--   v.7-8  (the shoe/sandal custom — a testimony in Yashar'el confirming the transfer)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 25:7-10 (loose his shoe — the Torah custom Ruth 4 fulfils with honour, not
--                  shame) — carried in the kinsman-who-would-not-redeem thread
--   v.9-10 (BOAZ buys all that was Elimelech's; PURCHASES Ruth to wife to raise up the name of the dead)
--          NT:     Galatians 4:4-5 (made under the law to REDEEM them, that we receive the adoption)
--          Extras: none warranted
--          Tanakh: Leviticus 25:25 (the go'el pays the price); Isaiah 59:20 (the Redeemer shall come to Zion)
--                  — the Boaz-kinsman-redeemer / Messiah-our-Redeemer thread
--   v.11-12 (the elders' blessing — like Rachel and Leah who built Yashar'el; like the house of Pharez)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Genesis 38:29 (Pharez born of Tamar — the Messianic line of Yahudah); Genesis 49:10
--                  (the sceptre shall not depart from Yahudah until Shiloh come) — the matriarchs / line-of-Pharez thread
--   v.13-17a (Yahuah gives conception; the women bless Naomi; a restorer of life; a son born to Naomi; Obed)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: (Naomi's emptiness of ch1 reversed) — the empty-filled / Obed-born thread
--   v.17b-22 (Obed begat Jesse, Jesse begat DAVID; the toledot Pharez->...->Boaz->Obed->Jesse->David)
--          NT:     Matthew 1:5 (Booz begat Obed of RUTH... unto David the king); Luke 3:32 (...Obed... Booz...)
--          Extras: none warranted
--          Tanakh: 1 Chronicles 2:11-15 (Salma begat Boaz... Jesse begat David — the line confirmed);
--                  Micah 5:2 (Beth-lehem Ephratah, out of thee the ruler in Yashar'el) — the genealogy-to-David thread
--
-- Threads (5):
--   ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance  [Tanakh] free
--       v.4,5,6,8 -> Leviticus 25:25 / Deuteronomy 25:5,6,7,9 (the go'el-duty declined; the shoe loosed)
--   ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride  [Tanakh + NT] free
--       v.9,10 -> Leviticus 25:25 / Isaiah 59:20 / Galatians 4:4,5 (the go'el who pays the full price = Messiah our Redeemer)
--   ruth-4-ruth-joined-to-the-matriarchs-the-line-of-pharez  [Tanakh] free
--       v.11,12 -> Genesis 29:32(?no) -> Genesis 38:29 / Genesis 49:10 (Rachel & Leah built Yashar'el; the Messianic line of Yahudah)
--   ruth-4-the-empty-filled-a-restorer-of-life-obed-born-to-naomi  [Tanakh] free
--       v.14,15,17 -> Ruth 1:21 / Ruth 1:5 (Naomi's emptiness reversed — the redemption that fills the empty)
--   ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line  [Tanakh + NT] free
--       v.17,21,22 -> 1 Chronicles 2:11,12,15 / Micah 5:2 / Matthew 1:5 / Luke 3:32 (Ruth the Moabitess in the line of David and the Messiah)
--
-- Framework: the kinsman-redeemer GO'EL is the load-bearing type. The NEARER kinsman would redeem the field
-- alone but recoils when the price includes RUTH and the raising-up of the dead's name — *lest I MAR mine own
-- inheritance* (4:6): the redeemer who will not pay the full cost. BOAZ pays it all — *Moreover Ruth the Moabitess...
-- have I purchased to be my wife* (4:10) — the go'el (Lev 25:25) who buys back the lost inheritance AND takes the
-- bride: the type of Messiah our Redeemer (Isa 59:20 *the Redeemer shall come to Zion*; Gal 4:4-5 sent *to redeem
-- them... that we might receive the adoption*). RUTH the Moabitess — daughter of the nations — is grafted into
-- Yashar'el and the royal line by MARRIAGE-COVENANT ABSORPTION (the same pattern as Rahab, Matthew 1:5), NOT by
-- confession-alone and NOT replacing the seed: she is married IN, joined to the matriarchs *which two did build
-- the house of Yashar'el* (4:11) and to the line of Pharez (the Messianic line of Yahudah, Gen 38 / Gen 49:10).
-- The empty Naomi of ch1 is FILLED — Obed born, *a restorer of thy life* (4:15). And the whole quiet book lands
-- on the line to DAVID (4:17,22) — Beth-lehem the setting (Micah 5:2), the Moabitess standing in the genealogy of
-- the Son of David, the true Kinsman-Redeemer-King who answers the kingless ache that ended Judges. The whole
-- Former-Prophets/historical track ends HERE: on the line to David and the Messiah.

CREATE TEMP VIEW _s346_rut04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== B. cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the kinsman who would not redeem — lest I mar mine own inheritance
    ('canon','ruth',4,4,  'canon','leviticus',25,25, 'free',
      E'*If thy brother be waxen poor, and hath sold away some of his possession, and if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25). This is the Torah of the go''el, the kinsman-redeemer, the law beneath the whole scene at the gate. When Boaz says *If thou wilt redeem it, redeem it* (Ruth 4:4), he is invoking exactly this statute — the near kinsman''s right and duty to buy back the lost inheritance of his house. The nearer man says *I will redeem it* — until he hears the price.'),
    ('canon','ruth',4,5,  'canon','deuteronomy',25,5, 'free',
      E'*If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband''s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband''s brother unto her* (Deuteronomy 25:5). Boaz binds the field to the widow: *thou must buy it also of Ruth the Moabitess, the wife of the dead, to raise up the name of the dead upon his inheritance* (Ruth 4:5). The land cannot be taken without the levirate duty — the redemption of the field IS the raising-up of the dead man''s name through his wife.'),
    ('canon','ruth',4,5,  'canon','deuteronomy',25,6, 'free',
      E'*And it shall be, that the firstborn which she beareth shall succeed in the name of his brother which is dead, that his name be not put out of Yashar''el (Israel)* (Deuteronomy 25:6). The whole purpose Boaz names — *to raise up the name of the dead upon his inheritance* (Ruth 4:5) — is this Torah word exactly: a son born to carry the dead man''s name so it *be not put out of Yashar''el (Israel)*. Redemption here is not mere property; it is a name rescued from being cut off.'),
    ('canon','ruth',4,6,  'canon','leviticus',25,25, 'free',
      E'*If thy brother be waxen poor... then shall he redeem that which his brother sold* (Leviticus 25:25). The near kinsman recoils: *I cannot redeem it for myself, lest I mar mine own inheritance: redeem thou my right to thyself* (Ruth 4:6). He will take the field but not the widow and the dead man''s name with it — the redeemer who counts the cost and will not pay the full price of the go''el-duty. He keeps his own inheritance intact and steps aside.'),
    ('canon','ruth',4,8,  'canon','deuteronomy',25,7, 'free',
      E'*And if the man like not to take his brother''s wife, then let his brother''s wife go up to the gate unto the elders, and say, My husband''s brother refuseth to raise up unto his brother a name in Yashar''el (Israel)* (Deuteronomy 25:7). The refusal at the gate — *Therefore the kinsman said unto Boaz, Buy it for thee. So he drew off his shoe* (Ruth 4:8) — follows the very Torah procedure: the man who will not perform the duty steps back at the gate before the elders, and the next of kin takes his place.'),
    ('canon','ruth',4,8,  'canon','deuteronomy',25,9, 'free',
      E'*Then shall his brother''s wife come unto him in the presence of the elders, and loose his shoe from off his foot... and shall answer and say, So shall it be done unto that man that will not build up his brother''s house* (Deuteronomy 25:9). The loosed shoe of Ruth 4:8 — *So he drew off his shoe* — is the Torah sign of this very refusal. In Deuteronomy it carries reproach; in Ruth the custom is named only as *a testimony in Yashar''el (Israel)* (4:7), the legal seal that frees Boaz to redeem. The shoe transfers the right of redemption from the one who would not pay to the one who will.'),

    -- THREAD 2: Boaz the kinsman-redeemer who pays the price and takes the bride
    ('canon','ruth',4,9,  'canon','leviticus',25,25, 'free',
      E'*...if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25). Boaz fulfils the go''el to the letter: *I have bought all that was Elimelech''s, and all that was Chilion''s and Mahlon''s, of the hand of Naomi* (Ruth 4:9). Where the nearer kinsman would not, Boaz redeems the whole lost inheritance of the dead — the kinsman who pays the full price to buy back what the family had lost.'),
    ('canon','ruth',4,10, 'canon','leviticus',25,25, 'free',
      E'*...then shall he redeem that which his brother sold* (Leviticus 25:25). The go''el redeems not only the field but the widow: *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren* (Ruth 4:10). Boaz pays the FULL price the near kinsman refused — the inheritance AND the bride — the redeemer who takes to himself the very thing that would have *marred* a lesser man.'),
    ('canon','ruth',4,10, 'canon','isaiah',59,20, 'free',
      E'*And the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD)* (Isaiah 59:20). Boaz the go''el — *have I purchased to be my wife, to raise up the name of the dead* (Ruth 4:10) — is the living type the prophet names with the same word: the REDEEMER who comes to buy back his own. As Boaz pays the full price to redeem the lost inheritance and take the bride, so the Redeemer comes to Zion to ransom His people and gather them to Himself.'),
    ('canon','ruth',4,10, 'canon','galatians',4,4, 'free',
      E'*But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). Boaz the kinsman-redeemer who *purchased* the bride and the inheritance (Ruth 4:10) foreshadows the Son *made under the law* — entering the family of Adam, under the same Torah of redemption, to act as the near Kinsman who alone can pay the price for His people.'),
    ('canon','ruth',4,10, 'canon','galatians',4,5, 'free',
      E'*To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5). The whole work of Boaz — *have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off* (Ruth 4:10) — is here unveiled: the Kinsman-Redeemer pays the price *to redeem them*, restoring the lost inheritance and securing a name and adoption for those who could not redeem themselves. Boaz buys back the bride; Messiah buys back His.'),

    -- THREAD 3: Ruth joined to the matriarchs — the line of Pharez (the Messianic line of Yahudah)
    ('canon','ruth',4,11, 'canon','genesis',49,10, 'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The elders bless the Moabitess into the house that *did build the house of Yashar''el (Israel)* (Ruth 4:11) and into Beth-lehem of Yahudah — the very tribe carrying the sceptre until Shiloh. Ruth is married into the royal line of Yahudah, the line down which the gathering King will come.'),
    ('canon','ruth',4,12, 'canon','genesis',38,29, 'free',
      E'*And it came to pass, as he drew back his hand, that, behold, his brother came out: and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez* (Genesis 38:29). The elders'' blessing reaches straight back to this birth: *let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah)* (Ruth 4:12). Pharez — son of Tamar, herself an outsider grafted in to raise up seed for the dead — is the head of the Messianic line of Yahudah; Ruth''s house is blessed to be like his, and indeed becomes his very continuation to David.'),
    ('canon','ruth',4,12, 'canon','genesis',49,10, 'free',
      E'*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). To be *like the house of Pharez, whom Tamar bare unto Yahudah (Judah)* (Ruth 4:12) is to be planted in the sceptre-bearing line. The blessing over Ruth''s coming house is a blessing into the very channel of the promise — the house of Yahudah from which Shiloh, the gathering King, shall come.'),

    -- THREAD 4: the empty filled — a restorer of life, Obed born to Naomi
    ('canon','ruth',4,14, 'canon','ruth',1,21, 'free',
      E'*I went out full, and Yahuah (LORD) hath brought me home again empty: why then call ye me Naomi, seeing Yahuah (LORD) hath testified against me, and the Almighty hath afflicted me?* (Ruth 1:21). The woman who came home *empty* is now answered: *Blessed be Yahuah (LORD), which hath not left thee this day without a kinsman* (Ruth 4:14). The redemption fills the emptiness — the same Yahuah she said had emptied her now sends a go''el to fill her again.'),
    ('canon','ruth',4,15, 'canon','ruth',1,5, 'free',
      E'*And Mahlon and Chilion died also both of them; and the woman was left of her two sons and her husband* (Ruth 1:5). Naomi was stripped to nothing — husband and both sons dead. Now the kinsman shall be *a restorer of thy life, and a nourisher of thine old age: for thy daughter in law, which loveth thee, which is better to thee than seven sons, hath born him* (Ruth 4:15). The bereaved and empty one is restored; the loss of ch1 is reversed by the child of redemption.'),
    ('canon','ruth',4,17, 'canon','ruth',1,5, 'free',
      E'*And the woman was left of her two sons and her husband* (Ruth 1:5). The empty house gains a son again: *There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David* (Ruth 4:17). The widow who lost her sons holds a child in her bosom — and that child is the grandfather of the king. The emptiness of Beth-lehem''s famine-stricken family becomes the cradle of the throne.'),

    -- THREAD 5: the genealogy to David — the Moabitess in the Messianic line
    ('canon','ruth',4,17, 'canon','1-chronicles',2,12, 'free',
      E'*And Boaz begat Obed, and Obed begat Jesse* (1 Chronicles 2:12). The chronicler confirms the line Ruth 4 closes on — *Obed... he is the father of Jesse, the father of David* (Ruth 4:17). The quiet Beth-lehem story is woven into the official register of Yahudah''s royal house: Boaz, Obed, Jesse — the steps to the king.'),
    ('canon','ruth',4,22, 'canon','1-chronicles',2,11, 'free',
      E'*And Nahshon begat Salma, and Salma begat Boaz* (1 Chronicles 2:11). The closing toledot of Ruth — *Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21) — is the same royal genealogy the chronicler preserves. The line of Pharez runs straight through Boaz the redeemer, exactly as the elders blessed it (4:12).'),
    ('canon','ruth',4,22, 'canon','1-chronicles',2,15, 'free',
      E'*Ozem the sixth, David the seventh* (1 Chronicles 2:15). The whole register lands where Ruth lands: *Obed begat Jesse, and Jesse begat David* (Ruth 4:22). The Moabitess grafted in by marriage-covenant stands in the bloodline that produces DAVID — the historical track of the Former Prophets comes to rest on the king of Yahudah''s line.'),
    ('canon','ruth',4,22, 'canon','micah',5,2, 'free',
      E'*But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). Ruth ends in Beth-lehem with *Jesse begat David* (Ruth 4:22) — and out of that same Beth-lehem of Ephratah, from David''s line, comes the everlasting Ruler. The redemption of a Moabitess in Beth-lehem is the quiet seed-bed of the Messiah who comes forth from Beth-lehem.'),
    ('canon','ruth',4,17, 'canon','matthew',1,5, 'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). The Messiah''s own genealogy names her: *Obed of RUTH* — the Moabitess of this chapter standing in the line of the Son of David. Like Rachab (Rahab) before her, a daughter of the nations is grafted into the seed of promise by MARRIAGE-covenant absorption, married IN to the house of Yahudah, not replacing the seed but carried by it into the line of the Messiah.'),
    ('canon','ruth',4,22, 'canon','matthew',1,5, 'free',
      E'*And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5). The toledot that closes Ruth — *Salmon begat Boaz... Obed begat Jesse, and Jesse begat David* (Ruth 4:21-22) — is the very spine of the Messiah''s genealogy. The kinsman-redeemer Boaz and his Moabitess bride stand four generations above the king, and the king stands at the head of the line of the Son of David.'),
    ('canon','ruth',4,22, 'canon','luke',3,32, 'free',
      E'*Which was the son of Jesse, which was the son of Obed, which was the son of Booz, which was the son of Salmon, which was the son of Naasson* (Luke 3:32). Luke traces the Messiah''s descent through the same names Ruth ends on — Jesse, Obed, Boaz, Salmon. The closing genealogy of Ruth (4:21-22) is read again, in reverse, as the lineage of Yahusha (Jesus): the redemption at Beth-lehem stands in the recorded line of the Redeemer Himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s346_rut04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s346_rut04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== C. threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance',
       E'The kinsman who would not redeem — *lest I mar mine own inheritance*',
       E'Boaz goes up to the gate and seats ten elders, the lawful court of redemption: *Then went Boaz up to the gate, and sat him down there* (Ruth 4:1). He sets before the nearer kinsman the Torah right of the go''el — *If thy brother be waxen poor, and hath sold away some of his possession, and if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25). *If thou wilt redeem it, redeem it* (Ruth 4:4), Boaz says, and the man answers eagerly, *I will redeem it.*\n\nThen comes the full price. The field cannot be taken bare: *thou must buy it also of Ruth the Moabitess, the wife of the dead, to raise up the name of the dead upon his inheritance* (4:5) — the levirate duty, *her husband''s brother shall go in unto her... and perform the duty of an husband''s brother* (Deuteronomy 25:5), *that his name be not put out of Yashar''el (Israel)* (25:6). At this the nearer kinsman recoils: *I cannot redeem it for myself, lest I mar mine own inheritance: redeem thou my right to thyself; for I cannot redeem it* (Ruth 4:6). He will take the field, but not the widow and the dead man''s name with it — the redeemer who counts the cost and will not pay it, who keeps his own inheritance whole and steps aside.\n\nThe transfer is sealed by the ancient sign: *a man plucked off his shoe, and gave it to his neighbour: and this was a testimony in Yashar''el (Israel)* (4:7), the same custom the Torah names for the man who *refuseth to raise up unto his brother a name* (Deuteronomy 25:7), whose shoe is loosed before the elders (25:9). *So he drew off his shoe* (Ruth 4:8). The right of redemption now passes to the one who WILL pay — and the chapter turns to Boaz.',
       sv.verse_id, ev.verse_id, 'free', 36325
  FROM _s346_rut04_lookup sv, _s346_rut04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride',
       E'Boaz the kinsman-redeemer who pays the full price and takes the bride — Messiah our Redeemer',
       E'Where the nearer kinsman would not, Boaz does. Before all the witnesses he pays the whole price the other refused: *I have bought all that was Elimelech''s, and all that was Chilion''s and Mahlon''s, of the hand of Naomi* (Ruth 4:9). The go''el of the Torah — *if any of his kin come to redeem it, then shall he redeem that which his brother sold* (Leviticus 25:25) — buys back the entire lost inheritance of the dead.\n\nAnd he takes the bride with it: *Moreover Ruth the Moabitess, the wife of Mahlon, have I purchased to be my wife, to raise up the name of the dead upon his inheritance, that the name of the dead be not cut off from among his brethren* (4:10). This is the FULL price the nearer man called *marring* — and Boaz pays it gladly: the inheritance bought back AND the widow taken to wife, the dead man''s name rescued from being cut off.\n\nThis is the type the prophet names with the same word: *And the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD)* (Isaiah 59:20). And the apostle unfolds it: *when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law, To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:4-5). The Son enters the family of Adam, under the same Torah of redemption, as the near Kinsman who alone can pay — buying back the lost inheritance, taking to Himself a bride, and raising up a name and an adoption for those who could not redeem themselves. Boaz at the gate of Beth-lehem is the living shadow of Messiah our Redeemer.',
       sv.verse_id, ev.verse_id, 'free', 36328
  FROM _s346_rut04_lookup sv, _s346_rut04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-4-ruth-joined-to-the-matriarchs-the-line-of-pharez',
       E'Ruth joined to the matriarchs who built Yashar''el — the line of Pharez, the Messianic line of Yahudah',
       E'The whole gate blesses the Moabitess into the heart of Yashar''el (Israel): *Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem* (Ruth 4:11). A daughter of Moab is set beside the mothers of the twelve tribes — joined to the matriarchs, married IN to the covenant people, planted in Beth-lehem of Yahudah.\n\nThen the blessing names the very channel of the promise: *let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman* (4:12). Pharez was born of Tamar — herself an outsider who acted to raise up seed for the dead — *and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez* (Genesis 38:29). Pharez heads the Messianic line of Yahudah, the tribe that carries the sceptre: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10).\n\nSo the elders'' words are no mere courtesy. To be *like the house of Pharez* is to be grafted into the sceptre-bearing line — and Ruth''s house does not merely resemble it but becomes its very continuation to David. The Moabitess, absorbed by marriage-covenant like Tamar before her, is set down in the channel from which Shiloh, the gathering King, shall come.',
       sv.verse_id, ev.verse_id, 'free', 36331
  FROM _s346_rut04_lookup sv, _s346_rut04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-4-the-empty-filled-a-restorer-of-life-obed-born-to-naomi',
       E'The empty filled — a restorer of life: Obed born, Naomi restored',
       E'The book opened with Naomi stripped bare: *And Mahlon and Chilion died also both of them; and the woman was left of her two sons and her husband* (Ruth 1:5); and she cried, *I went out full, and Yahuah (LORD) hath brought me home again empty* (1:21). The emptiness of Beth-lehem''s famine-broken family was total — no husband, no sons, no future.\n\nRedemption reverses it. *Yahuah (LORD) gave her conception, and she bare a son* (Ruth 4:13), and the women turn to the empty one with a blessing: *Blessed be Yahuah (LORD), which hath not left thee this day without a kinsman, that his name may be famous in Yashar''el (Israel)* (4:14). The very Yahuah Naomi said had emptied her now sends a go''el to fill her again. *And he shall be unto thee a restorer of thy life, and a nourisher of thine old age: for thy daughter in law, which loveth thee, which is better to thee than seven sons, hath born him* (4:15).\n\nThe widow who lost her sons takes a child to her bosom: *There is a son born to Naomi; and they called his name Obed* (4:17). The emptiness is not merely patched but overflowed — for this child *is the father of Jesse, the father of David.* The bereaved house of ch1 becomes the cradle of the throne. The redemption that buys back the lost inheritance fills the empty hands with a son, and that son with a king.',
       sv.verse_id, ev.verse_id, 'free', 36334
  FROM _s346_rut04_lookup sv, _s346_rut04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line',
       E'The genealogy to David — the Moabitess Ruth in the line of David and the Messiah',
       E'The quiet Beth-lehem story lands on a throne. *There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David* (Ruth 4:17). And the book closes with the toledot of Pharez: *Salmon begat Boaz, and Boaz begat Obed, And Obed begat Jesse, and Jesse begat David* (Ruth 4:21-22). The chronicler keeps the same register — *And Nahshon begat Salma, and Salma begat Boaz, And Boaz begat Obed, and Obed begat Jesse* (1 Chronicles 2:11-12), down to *David the seventh* (2:15). The redemption of a Moabitess is woven into the official royal line of Yahudah.\n\nAnd it lands in Beth-lehem — the very town the prophet marks: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). Out of the same Beth-lehem where Boaz redeemed Ruth comes the everlasting Ruler.\n\nThe Messiah''s own genealogy names her by name: *And Salmon begat Booz of Rachab; and Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5); and Luke traces the same line, *the son of Obed, which was the son of Booz, which was the son of Salmon* (Luke 3:32). Like Rachab (Rahab) before her, a daughter of the nations is grafted into the seed of promise by MARRIAGE-COVENANT absorption — married IN to the house of Yahudah, not replacing the seed but carried by it — and so the Moabitess Ruth stands in the line of the Son of David, the true Kinsman-Redeemer-King. The whole Former-Prophets/historical track, which ended in Judges aching *there was no king in Yashar''el (Israel)*, comes here to rest: on the line to David, and through David to the Messiah.',
       sv.verse_id, ev.verse_id, 'free', 36337
  FROM _s346_rut04_lookup sv, _s346_rut04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='ruth' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ===================== D. thread_members =====================
-- THREAD 1: the kinsman who would not redeem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then shall he redeem that which his brother sold* (Leviticus 25:25) — the Torah of the go''el, the law beneath *If thou wilt redeem it, redeem it* (Ruth 4:4).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*her husband''s brother shall go in unto her... and perform the duty* (Deuteronomy 25:5) — the levirate that binds the field to the widow (Ruth 4:5).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that his name be not put out of Yashar''el (Israel)* (Deuteronomy 25:6) — the purpose Boaz names: *to raise up the name of the dead* (Ruth 4:5).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*then shall he redeem that which his brother sold* (Leviticus 25:25) — the duty the nearer kinsman refuses: *lest I mar mine own inheritance* (Ruth 4:6).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*My husband''s brother refuseth to raise up unto his brother a name* (Deuteronomy 25:7) — the Torah procedure for the refusal at the gate (Ruth 4:8).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*loose his shoe from off his foot* (Deuteronomy 25:9) — the very sign Ruth 4:8 names *a testimony in Yashar''el*: *So he drew off his shoe.*'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=8
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-kinsman-who-would-not-redeem-lest-i-mar-my-inheritance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: Boaz the kinsman-redeemer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then shall he redeem that which his brother sold* (Leviticus 25:25) — Boaz buys back the whole inheritance (Ruth 4:9).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*then shall he redeem that which his brother sold* (Leviticus 25:25) — the go''el takes the bride too: *Ruth... have I purchased to be my wife* (Ruth 4:10).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And the Redeemer shall come to Zion* (Isaiah 59:20) — Boaz the go''el is the living type of the Redeemer who buys back His own.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the Son enters as the near Kinsman under the Torah of redemption.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*To redeem them that were under the law, that we might receive the adoption of sons* (Galatians 4:5) — Boaz buys back the bride; Messiah buys back His.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-boaz-the-kinsman-redeemer-who-pays-the-price-and-takes-the-bride'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: Ruth joined to the matriarchs — the line of Pharez
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10) — Ruth married into Beth-lehem of the sceptre-bearing tribe (Ruth 4:11).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-ruth-joined-to-the-matriarchs-the-line-of-pharez'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his name was called Pharez* (Genesis 38:29) — the head of the Messianic line of Yahudah, born of Tamar; Ruth''s house blessed to be like his (Ruth 4:12).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-ruth-joined-to-the-matriarchs-the-line-of-pharez'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*unto him shall the gathering of the people be* (Genesis 49:10) — the house of Pharez is the very channel from which Shiloh, the gathering King, comes.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-ruth-joined-to-the-matriarchs-the-line-of-pharez'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the empty filled — Obed born to Naomi
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) hath brought me home again empty* (Ruth 1:21) — the empty one now *not left... without a kinsman* (Ruth 4:14).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-empty-filled-a-restorer-of-life-obed-born-to-naomi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the woman was left of her two sons and her husband* (Ruth 1:5) — the bereavement reversed: *a restorer of thy life... better to thee than seven sons* (Ruth 4:15).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-empty-filled-a-restorer-of-life-obed-born-to-naomi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the woman was left of her two sons and her husband* (Ruth 1:5) — the widow holds a son again: *There is a son born to Naomi... Obed* (Ruth 4:17), grandfather of the king.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-empty-filled-a-restorer-of-life-obed-born-to-naomi'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the genealogy to David — the Moabitess in the Messianic line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Boaz begat Obed, and Obed begat Jesse* (1 Chronicles 2:12) — the chronicler confirms the line Ruth 4:17 closes on.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Salma begat Boaz* (1 Chronicles 2:11) — the same royal toledot as *Salmon begat Boaz, and Boaz begat Obed* (Ruth 4:21).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*David the seventh* (1 Chronicles 2:15) — the register lands where Ruth lands: *Jesse begat David* (Ruth 4:22).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*thou, Beth-lehem Ephratah... out of thee shall he come forth... ruler in Yashar''el* (Micah 5:2) — out of the same Beth-lehem comes the everlasting Ruler.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Booz begat Obed of RUTH* (Matthew 1:5) — the Moabitess named in the Messiah''s genealogy, grafted in by marriage like Rahab.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Booz begat Obed of Ruth; and Obed begat Jesse* (Matthew 1:5) — the closing toledot of Ruth (4:21-22) is the spine of the Messiah''s genealogy.'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the son of Obed, which was the son of Booz, which was the son of Salmon* (Luke 3:32) — the same line read as the lineage of Yahusha (Jesus).'
  FROM cross_reference_threads t
  JOIN _s346_rut04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='ruth' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s346_rut04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='ruth-4-the-genealogy-to-david-the-moabitess-in-the-messianic-line'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session346 — Ruth cross-references complete.'
