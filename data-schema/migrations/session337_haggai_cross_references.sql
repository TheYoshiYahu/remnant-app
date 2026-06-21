-- =====================================================================
-- Session 337 — Haggai FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session337_haggai_cross_references.sql
-- =====================================================================

\echo 'session337 — Haggai cross-references starting...'
BEGIN;

-- ----- fragment: minion_haggai_1.sql (Haggai 1) -----
-- Chapter: Haggai 1 — "CONSIDER YOUR WAYS." After the return from Babylon the people build their own
-- paneled houses while Yahuah's house lies in ruins: *Is it time for you, O ye, to dwell in your cieled
-- houses, and this house lie waste?* (1:4); *Now therefore thus saith Yahuah Tseva'ot (LORD of hosts);
-- Consider your ways* (1:5,7). Their misplaced priorities draw the covenant-futility curse — *Ye have
-- sown much, and bring in little... and he that earneth wages earneth wages to put it into a bag with
-- holes* (1:6), the drought called upon the land *Because of mine house that is waste, and ye run every
-- man unto his own house* (1:9). The remnant obeys and fears, and Yahuah answers with presence — *I am
-- with you, saith Yahuah (LORD)* (1:13) — and *stirred up the spirit* of Zerubbabel, Joshua, and all
-- the remnant to the work (1:14). Read forward: seek first the kingdom (Matthew 6:33), the treasure where
-- the heart is (Matthew 6:19-21); the futility-curse of Deuteronomy 28 / Leviticus 26 reordered to
-- blessing when the house is built (Malachi 3:10); the "I am with you" of the Great Commission
-- (Matthew 28:20) and Elohim who *worketh in you both to will and to do* (Philippians 2:13).
-- Tag: hag01   Temp view: _s337_hag01_lookup
-- Sort band: base 45650, step 3 -> threads at 45650, 45653, 45656 (3 threads)
-- Source of EVERY row: 'canon','haggai',1,v
--
-- Haggai 1 coverage:
--   v.1-3 (the dating; the word came by Haggai to Zerubbabel and Joshua; This people say, The time is
--          not come... that the LORD'S house should be built)
--        NT:     none warranted (the dating/messenger frame; woven into the threads' prose)
--        Extras: none warranted distinct (the rebuilders Zerubbabel + Joshua surface in THREAD 3 via Sir 49)
--        Tanakh: none warranted distinct (preface to the rebuke of v.4-7)
--   ★★ v.4-7 (Is it time for you... to dwell in your cieled houses, and this house lie waste?... Consider
--          your ways)
--        NT:     ★★ Matthew 6:33 (But seek ye first the kingdom of Elohim (God), and his righteousness),
--                ★★ Matthew 6:19-21 (Lay not up... treasures upon earth... For where your treasure is,
--                there will your heart be also), Luke 12:31 (rather seek ye the kingdom of Elohim) — THREAD 1
--        Extras: none warranted (clean self-examination witness held in Lamentations)
--        Tanakh: ★ Lamentations 3:40 (Let us search and try our ways, and turn again to Yahuah) — THREAD 1
--   ★★ v.6-11 (Ye have sown much, and bring in little... a bag with holes... I called for a drought upon
--          the land... Because of mine house that is waste)
--        NT:     none warranted distinct (the covenant-futility curse is rooted in Torah — handled in
--                Tanakh; the reversal-to-blessing forward-weave is Malachi within the canon)
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 28:38 (Thou shalt carry much seed out into the field, and shalt gather
--                but little in), ★ Deuteronomy 28:40 (olive trees... but thou shalt not anoint thyself
--                with the oil), ★★ Leviticus 26:20 (your strength shall be spent in vain), ★ Micah 6:15
--                (Thou shalt sow, but thou shalt not reap), ★ Malachi 3:10 (Bring ye all the tithes into
--                the storehouse... if I will not open you the windows of heaven) — THREAD 2
--   ★★ v.12-14 (the remnant obeyed and feared before Yahuah... I am with you, saith Yahuah... And Yahuah
--          stirred up the spirit of Zerubbabel... and all the remnant... and they came and did work)
--        NT:     ★★ Matthew 28:20 (lo, I am with you alway, even unto the end of the world), ★ Philippians
--                2:13 (it is Elohim (God) which worketh in you both to will and to do) — THREAD 3
--        Extras: ★ Ecclesiasticus 49:11-12 (How shall we magnify Zorobabel?... So was Jesus the son of
--                Josedec: who in their time builded the house) — THREAD 3 (clean Zerubbabel+Joshua witness)
--        Tanakh: ★ Isaiah 41:10 (Fear thou not; for I am with thee... I will strengthen thee), ★ Joshua
--                1:9 (be not afraid... for Yahuah Elohayka is with thee), ★ Ezra 1:1 (Yahuah stirred up
--                the spirit of Cyrus... to build the house) — THREAD 3
--   v.15 (the four and twentieth day of the sixth month — the closing date) — none warranted (colophon)
--
-- Threads (slug — target libraries):
--   1. haggai-1-consider-your-ways-seek-first-the-kingdom — NT (Matthew 6, Luke 12) + Tanakh (Lamentations 3) [free]
--      (★★ misplaced priorities: cieled houses while my house lies waste -> seek first the kingdom / treasure-heart)
--   2. haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes — Tanakh (Deuteronomy 28, Leviticus 26, Micah 6, Malachi 3) [free]
--      (★★ the covenant-futility curse rooted in Torah; reordered to blessing when the house is built)
--   3. haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit — NT (Matthew 28, Philippians 2) + Extras (Ecclesiasticus 49) + Tanakh (Isaiah 41, Joshua 1, Ezra 1) [extras]
--      (★★ the obedient remnant; "I am with you"; Yahuah stirs the spirit to the work)
--
-- Framing notes:
--   ★★ CONSIDER YOUR WAYS (THREAD 1): *Is it time for you, O ye, to dwell in your cieled houses, and this
--      house lie waste? Now therefore thus saith Yahuah Tseva'ot (LORD of hosts); Consider your ways*
--      (1:4-5). The rebuke is of priorities reversed — paneled comfort for self while Yahuah's house lies
--      in ruins. Yahusha names the cure: *seek ye first the kingdom of Elohim (God), and his righteousness;
--      and all these things shall be added unto you* (Matthew 6:33), and *where your treasure is, there
--      will your heart be also* (Matthew 6:21). "Consider your ways" is the self-examination Lamentations
--      already taught: *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40).
--   ★★ THE BAG WITH HOLES (THREAD 2): *Ye have sown much, and bring in little... and he that earneth wages
--      earneth wages to put it into a bag with holes* (1:6); *I called for a drought upon the land* (1:11).
--      This is the Torah covenant-futility curse, word for word: *Thou shalt carry much seed out into the
--      field, and shalt gather but little in* (Deuteronomy 28:38); *your strength shall be spent in vain*
--      (Leviticus 26:20); *Thou shalt sow, but thou shalt not reap* (Micah 6:15). Not Torah-as-curse — the
--      Deuteronomy 28 / Leviticus 26 exile-judgment for neglecting the covenant; reorder the priorities and
--      the windows of heaven open: *prove me now herewith... if I will not open you the windows of heaven*
--      (Malachi 3:10).
--   ★★ I AM WITH YOU (THREAD 3): the remnant obeyed and *did fear before Yahuah* (1:12), and Yahuah answers
--      *I am with you, saith Yahuah (LORD)* (1:13) and *stirred up the spirit* of the rebuilders (1:14).
--      The presence-promise runs the whole canon — *Fear thou not; for I am with thee* (Isaiah 41:10),
--      *Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9) — and forward
--      to *lo, I am with you alway, even unto the end of the world* (Matthew 28:20). The STIRRED spirit is
--      Yahuah's own work in them, as he *stirred up the spirit of Cyrus* (Ezra 1:1) and as *it is Elohim
--      (God) which worketh in you both to will and to do* (Philippians 2:13). The restored witness names the
--      very rebuilders: *How shall we magnify Zorobabel?... So was Jesus the son of Josedec: who in their
--      time builded the house* (Ecclesiasticus 49:11-12).
--   EXTRAS: Ecclesiasticus 49:11-12 (Sirach's praise of Zerubbabel and Joshua who built the house) — a clean
--      witness, parse verified. 1 Esdras 5 (apocrypha-charles-vol1) NOT used as member: verse-wrapping
--      splits sentences across verse numbers in that parse.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (dating + messenger frame + "the time is not come"; preface woven
--      into THREAD 1/3 prose), v.8 (Go up... and build the house — woven into THREAD 1/2), v.15 (closing
--      date colophon). All recorded, none silently skipped.

CREATE TEMP VIEW _s337_hag01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Consider your ways — seek first the kingdom
    ('canon','haggai',1,4,'canon','matthew',6,33,'free',
      E'*But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33). Haggai''s rebuke — *Is it time for you, O ye, to dwell in your cieled houses, and this house lie waste?* (Haggai 1:4) — is priorities reversed: paneled comfort for self while Yahuah''s house lies in ruins. Yahusha names the cure: *seek ye first the kingdom*, and the rest is added. Put the house of Yahuah first, and the *much* they could not gather (1:6) is restored.'),
    ('canon','haggai',1,5,'canon','matthew',6,21,'free',
      E'*For where your treasure is, there will your heart be also* (Matthew 6:21). *Consider your ways* (Haggai 1:5) is the call to weigh where the heart''s treasure lies — *Lay not up for yourselves treasures upon earth... But lay up for yourselves treasures in heaven* (Matthew 6:19-20). The cieled houses are the earthly treasure; the house of Yahuah laid waste is the heavenly treasure neglected. Where the treasure is set, there the heart is — so consider your ways.'),
    ('canon','haggai',1,7,'canon','luke',12,31,'free',
      E'*But rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you* (Luke 12:31). The second *Consider your ways* (Haggai 1:7) reorders the seeking: the food, drink, and raiment they chased and never had enough of (1:6) are the very *all these things* — sought first, they fail; let the kingdom be sought first, and *all these things shall be added*.'),
    ('canon','haggai',1,5,'canon','lamentations',3,40,'free',
      E'*Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). *Consider your ways* (Haggai 1:5) is the self-examination Lamentations already taught the returning remnant — to *search and try our ways, and turn again to Yahuah*. The summons is not condemnation but a call to set the heart on the ways and turn back; consider, and rebuild.'),

    -- THREAD 2 (★★): Ye have sown much and bring in little — the bag with holes (the Torah futility-curse)
    ('canon','haggai',1,6,'canon','deuteronomy',28,38,'free',
      E'*Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38). *Ye have sown much, and bring in little* (Haggai 1:6) is this Torah futility-curse enacted — *much seed... but little in*. This is the Deuteronomy 28 covenant-judgment for neglecting Yahuah''s house, not Torah-as-curse: the very wording of the blessings-and-curses falls on the people who built their own houses first.'),
    ('canon','haggai',1,6,'canon','deuteronomy',28,40,'free',
      E'*Thou shalt have olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil; for thine olive shall cast his fruit* (Deuteronomy 28:40). The futility runs through every labour — *ye drink, but ye are not filled with drink; ye clothe you, but there is none warm* (Haggai 1:6) — exactly the curse of the oil that yields nothing: *olive trees... but thou shalt not anoint thyself with the oil*. The land withholds her increase while the house lies waste.'),
    ('canon','haggai',1,6,'canon','leviticus',26,20,'free',
      E'*And your strength shall be spent in vain: for your land shall not yield her increase, neither shall the trees of the land yield their fruits* (Leviticus 26:20). *He that earneth wages earneth wages to put it into a bag with holes* (Haggai 1:6) is *strength spent in vain* — labour poured out, nothing held. Leviticus named the curse for covenant-neglect; Haggai shows it falling, the wages leaking through the bag because the house of Yahuah is forsaken.'),
    ('canon','haggai',1,11,'canon','micah',6,15,'free',
      E'*Thou shalt sow, but thou shalt not reap; thou shalt tread the olives, but thou shalt not anoint thee with oil; and sweet wine, but shalt not drink wine* (Micah 6:15). The drought Yahuah *called for... upon the corn, and upon the new wine, and upon the oil* (Haggai 1:11) is Micah''s same futility-verdict — *sow, but not reap... olives, but not anoint... sweet wine, but not drink*. The prophets speak one covenant-lawsuit: labour without harvest while the people forsake Yahuah.'),
    ('canon','haggai',1,9,'canon','malachi',3,10,'free',
      E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house, and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). The curse falls *Because of mine house that is waste* (Haggai 1:9); Malachi shows the reversal — supply *meat in mine house* and the windows of heaven open. Honour the house of Yahuah first, and the futility-curse becomes blessing poured out.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s337_hag01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s337_hag01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★★): I am with you — Yahuah stirred up the spirit
    ('canon','haggai',1,13,'canon','matthew',28,20,'free',
      E'*Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you alway, even unto the end of the world. Amen* (Matthew 28:20). The remnant obeys and Yahuah answers *I am with you, saith Yahuah (LORD)* (Haggai 1:13) — the same presence-promise the Formed Son seals upon his sent ones: *lo, I am with you alway*. The word that strengthens the rebuilders of the house is the word that strengthens those sent to build; one Presence with his obedient people.'),
    ('canon','haggai',1,14,'canon','philippians',2,13,'free',
      E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). *Yahuah (LORD) stirred up the spirit of Zerubbabel... and the spirit of all the remnant of the people; and they came and did work* (Haggai 1:14) — the willing and the working are Yahuah''s own stirring within them. Paul names the same: it is *Elohim (God) which worketh in you both to will and to do*. The remnant''s obedience is Yahuah''s grace at work in the heart.'),
    ('canon','haggai',1,13,'canon','isaiah',41,10,'free',
      E'*Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness* (Isaiah 41:10). *I am with you, saith Yahuah (LORD)* (Haggai 1:13) is the same covenant-presence Isaiah sang to the servant-people — *Fear thou not; for I am with thee... I will strengthen thee*. The fear of Yahuah that gripped the remnant (1:12) is met with "fear thou not, for I am with thee."'),
    ('canon','haggai',1,13,'canon','joshua',1,9,'free',
      E'*Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9). Before the work of the land, *Yahuah Elohayka is with thee*; before the work of the house, *I am with you, saith Yahuah (LORD)* (Haggai 1:13). The same presence that commissioned Joshua son of Nun to take the land commissions Joshua son of Josedech to build the house — be strong, for Yahuah is with you.'),
    ('canon','haggai',1,14,'canon','ezra',1,1,'free',
      E'*Now in the first year of Cyrus king of Persia... Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom* (Ezra 1:1). Yahuah who *stirred up the spirit of Cyrus* to send the people home *stirred up the spirit of Zerubbabel... and all the remnant... and they came and did work in the house of Yahuah* (Haggai 1:14). The same hand that moved the king to release them moves the remnant to build — the whole return and rebuilding is Yahuah stirring the spirit.'),
    ('canon','haggai',1,12,'apocrypha','ecclesiasticus',49,11,'extras',
      E'*How shall we magnify Zorobabel? even he was as a signet on the right hand* (Ecclesiasticus 49:11). The restored witness honours the very man Haggai stirred — *Zerubbabel the son of Shealtiel... with all the remnant of the people, obeyed the voice of Yahuah (LORD) their Elohim (God)* (Haggai 1:12). Sirach remembers Zerubbabel *as a signet on the right hand*, the prince of the rebuilding the prophet roused to the work.'),
    ('canon','haggai',1,12,'apocrypha','ecclesiasticus',49,12,'extras',
      E'*So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Ecclesiasticus 49:12). Haggai names the same high priest — *Joshua the son of Josedech, the high priest* (Haggai 1:12) — and the restored witness records the outcome of the obedience: *who in their time builded the house, and set up an holy temple to Yahuah (God)*. The "I am with you" bore its fruit; the house that lay waste was raised.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s337_hag01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s337_hag01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-1-consider-your-ways-seek-first-the-kingdom',
       E'Consider your ways — cieled houses while my house lies waste; seek ye first the kingdom',
       E'The returned remnant has settled into comfort while Yahuah''s house lies in ruins, and the prophet names it: *Is it time for you, O ye, to dwell in your cieled houses, and this house lie waste? Now therefore thus saith Yahuah Tseva''ot (LORD of hosts); Consider your ways* (Haggai 1:4-5), and again *Thus saith Yahuah Tseva''ot (LORD of hosts); Consider your ways* (1:7). The rebuke is priorities reversed — paneled houses for self, Yahuah''s house forsaken. Yahusha gives the cure word for word: *Lay not up for yourselves treasures upon earth... But lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:19-21), and *seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33); so also *rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you* (Luke 12:31). The food, drink, and raiment they chased and never had enough of (1:6) are *all these things* — sought first, they fail; let the kingdom be sought first, and the rest is added. And "consider your ways" is the self-examination Lamentations already taught the remnant: *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). Set the heart on the ways, turn back, and rebuild.',
       sv.verse_id, ev.verse_id, 'free', 45650
  FROM _s337_hag01_lookup sv, _s337_hag01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes',
       E'Ye have sown much and bring in little — the bag with holes; the Torah futility-curse',
       E'Because the house of Yahuah lies waste, every labour leaks away: *Ye have sown much, and bring in little; ye eat, but ye have not enough; ye drink, but ye are not filled with drink; ye clothe you, but there is none warm; and he that earneth wages earneth wages to put it into a bag with holes* (Haggai 1:6); *Ye looked for much, and, lo, it came to little... Because of mine house that is waste, and ye run every man unto his own house* (1:9); *And I called for a drought upon the land, and upon the mountains, and upon the corn, and upon the new wine, and upon the oil* (1:11). This is the Torah covenant-futility curse falling — not Torah-as-curse, but the Deuteronomy 28 / Leviticus 26 judgment for neglecting Yahuah''s house: *Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38); *Thou shalt have olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil; for thine olive shall cast his fruit* (Deuteronomy 28:40); *And your strength shall be spent in vain: for your land shall not yield her increase* (Leviticus 26:20). The prophets speak the same lawsuit: *Thou shalt sow, but thou shalt not reap; thou shalt tread the olives, but thou shalt not anoint thee with oil* (Micah 6:15). And the reversal is just as sure when the house is honoured first: *Bring ye all the tithes into the storehouse, that there may be meat in mine house... if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). Reorder the priorities; the bag with holes becomes the windows of heaven opened.',
       sv.verse_id, ev.verse_id, 'free', 45653
  FROM _s337_hag01_lookup sv, _s337_hag01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit',
       E'I am with you, saith Yahuah — the obedient remnant, and Yahuah stirs the spirit to the work',
       E'The rebuke bears fruit: *Then Zerubbabel the son of Shealtiel, and Joshua the son of Josedech, the high priest, with all the remnant of the people, obeyed the voice of Yahuah (LORD) their Elohim (God)... and the people did fear before Yahuah (LORD)* (Haggai 1:12). To the obedient remnant Yahuah gives the greatest promise: *Then spake Haggai the LORD''S messenger in the LORD''S message unto the people, saying, I am with you, saith Yahuah (LORD)* (1:13). And the will to build is Yahuah''s own work in them: *And Yahuah (LORD) stirred up the spirit of Zerubbabel... and the spirit of all the remnant of the people; and they came and did work in the house of Yahuah Tseva''ot (LORD of hosts)* (1:14). The "I am with you" runs the whole canon — *Fear thou not; for I am with thee... I will strengthen thee; yea, I will help thee* (Isaiah 41:10); *be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9) — and forward to the Formed Son''s seal on his sent ones: *lo, I am with you alway, even unto the end of the world* (Matthew 28:20). The STIRRED spirit is grace at work: as Yahuah *stirred up the spirit of Cyrus king of Persia* to send them home (Ezra 1:1), so *it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). And the restored witness magnifies the very rebuilders: *How shall we magnify Zorobabel? even he was as a signet on the right hand: So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Ecclesiasticus 49:11-12). The house that lay waste was raised, because Yahuah was with them.',
       sv.verse_id, ev.verse_id, 'extras', 45656
  FROM _s337_hag01_lookup sv, _s337_hag01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:33) — the cure for *cieled houses while this house lie waste* (Haggai 1:4): put the house of Yahuah first.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-consider-your-ways-seek-first-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *For where your treasure is, there will your heart be also* (Matthew 6:21) — *Consider your ways* (Haggai 1:5): the cieled houses are earthly treasure, the house of Yahuah the heavenly treasure neglected.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-consider-your-ways-seek-first-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you* (Luke 12:31) — the food, drink, and raiment never enough (Haggai 1:6) are *all these things*; sought first they fail, the kingdom sought first they are added.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-consider-your-ways-seek-first-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40) — *Consider your ways* (Haggai 1:5) is the same call to search the ways and turn back.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-consider-your-ways-seek-first-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thou shalt carry much seed out into the field, and shalt gather but little in* (Deuteronomy 28:38) — *Ye have sown much, and bring in little* (Haggai 1:6) is the Torah futility-curse enacted for forsaking the house.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil* (Deuteronomy 28:40) — the oil-curse behind *ye are not filled... there is none warm* (Haggai 1:6).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *And your strength shall be spent in vain: for your land shall not yield her increase* (Leviticus 26:20) — *the bag with holes* (Haggai 1:6) is strength spent in vain, labour held by nothing.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Thou shalt sow, but thou shalt not reap; thou shalt tread the olives, but thou shalt not anoint thee with oil* (Micah 6:15) — the drought *upon the corn, and... the new wine, and... the oil* (Haggai 1:11) is the same prophetic futility-verdict.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Bring ye all the tithes into the storehouse... if I will not open you the windows of heaven, and pour you out a blessing* (Malachi 3:10) — the reversal of the curse that fell *Because of mine house that is waste* (Haggai 1:9): honour the house, the windows open.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-ye-have-sown-much-and-bring-in-little-the-bag-with-holes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *lo, I am with you alway, even unto the end of the world* (Matthew 28:20) — the Formed Son seals on his sent ones the promise Haggai brought the rebuilders: *I am with you, saith Yahuah (LORD)* (Haggai 1:13).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13) — *Yahuah stirred up the spirit... and they came and did work* (Haggai 1:14): the willing and the working are Yahuah''s own stirring.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Fear thou not; for I am with thee... I will strengthen thee; yea, I will help thee* (Isaiah 41:10) — the same covenant-presence meets the remnant''s fear (Haggai 1:12) with *I am with you* (1:13).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *be not afraid, neither be thou dismayed: for Yahuah Elohayka (the LORD thy God) is with thee whithersoever thou goest* (Joshua 1:9) — the presence that commissioned Joshua son of Nun commissions Joshua son of Josedech to build (Haggai 1:13).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yahuah (LORD) stirred up the spirit of Cyrus king of Persia... a proclamation throughout all his kingdom* (Ezra 1:1) — the same hand that stirred the king to release them stirs the remnant to build (Haggai 1:14).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *How shall we magnify Zorobabel? even he was as a signet on the right hand* (Ecclesiasticus 49:11) — the restored witness honours the very prince Haggai roused: *Zerubbabel... obeyed the voice of Yahuah (LORD) their Elohim (God)* (Haggai 1:12).'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God)* (Ecclesiasticus 49:12) — the fruit of the obedience of *Joshua the son of Josedech, the high priest* (Haggai 1:12): the waste house raised.'
  FROM cross_reference_threads t
  JOIN _s337_hag01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s337_hag01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-1-i-am-with-you-saith-yahuah-stirred-up-the-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_haggai_2.sql (Haggai 2) -----
-- Chapter: Haggai 2 — THE CLIMAX OF HAGGAI AND THE CLOSE OF THE WHOLE TWELVE-MINOR-PROPHET BUILD.
-- The discouraged builders of the second temple are comforted (*Who is left among you that saw this
-- house in her first glory?... Yet now be strong, O Zerubbabel... for I am with you* 2:3-4) and
-- promised the abiding covenant-Spirit (*so my spirit remaineth among you: fear ye not* 2:5). Then the
-- keystone: *Yet once, it is a little while, and I will shake the heavens, and the earth... And I will
-- shake all nations, and the desire of all nations shall come: and I will fill this house with glory*
-- (2:6-7) — quoted in Hebrews 12:26-27, the Messiah/the Desire of nations who comes to the temple, the
-- house filled with the Glory (the Formed Son drawn from the Formless Father). *The glory of this latter
-- house shall be greater than of the former... and in this place will I give peace* (2:9) — the greater
-- glory is the Presence of the Messiah in the second temple; the peace is His own (Ephesians 2:14). The
-- Torah is consulted as authoritative on clean/unclean (*Ask now the priests concerning the law* 2:11);
-- the turning-point blessing (*from this day will I bless you* 2:19). And the capstone: *will I take
-- thee, O Zerubbabel, my servant... and will make thee as a signet: for I have chosen thee* (2:23) — the
-- reversal of the Coniah/Jeconiah signet-curse (Jeremiah 22:24), the Davidic Messianic line sealed and
-- preserved (Matthew 1:12, Luke 3:27), the chosen servant (Isaiah 42:1), the kingdom that cannot be
-- shaken (Daniel 2:44, Hebrews 12:28).
-- Tag: hag02   Temp view: _s337_hag02_lookup
-- Sort band: base 45670, step 3 -> threads at 45670, 45673, 45676, 45679, 45682, 45685 (6 threads)
-- Source of EVERY row: 'canon','haggai',2,v
--
-- Haggai 2 coverage:
--   v.1-2 (the dating; the word to Zerubbabel, Joshua, the residue)
--        NT/Extras/Tanakh: woven into THREAD 1 / THREAD 6 prose; no separate add (framing verses)
--   ★ v.3-5 (Who is left... saw this house in her first glory?... be strong... for I am with you...
--          so my spirit remaineth among you: fear ye not)
--        NT:     ★ John 14:16-17 (he shall give you another Comforter, that he may abide with you for
--                ever... the Spirit of truth... he dwelleth with you, and shall be in you) — THREAD 1
--        Extras: none warranted (no clean abiding-Spirit witness needed)
--        Tanakh: ★ Haggai 1:13 (I am with you, saith Yahuah), ★ Isaiah 63:11 (Where is he that put his
--                holy Spirit within him?), ★ Joshua 1:9-style "be strong" held in prose — THREAD 1
--   ★★★ v.6-7 (I will shake the heavens, and the earth... and the desire of all nations shall come: and
--          I will fill this house with glory) — KEYSTONE
--        NT:     ★★★ Hebrews 12:26 (Yet once more I shake not the earth only, but also heaven),
--                ★★★ Hebrews 12:27 (the removing of those things that are shaken... that those things
--                which cannot be shaken may remain), ★★ John 1:14 (the Word was made flesh... and we
--                beheld his glory), ★ Luke 2:32 (A light to lighten the Gentiles) — THREAD 2
--        Extras: none warranted distinct (Hebrews carries the shaking; held in prose)
--        Tanakh: ★ Malachi 3:1 (Yahuah, whom ye seek, shall suddenly come to his temple) — THREAD 2
--   ★★ v.8-9 (The silver is mine, and the gold is mine... The glory of this latter house shall be
--          greater than of the former... and in this place will I give peace) — KEYSTONE
--        NT:     ★★ Ephesians 2:14 (he is our peace, who hath made both one), ★ John 14:27 (Peace I
--                leave with you, my peace I give unto you), ★ Luke 2:14 (on earth peace, good will
--                toward men) — THREAD 3
--        Extras: none warranted (Sirach temple-glory witness placed on the signet thread, THREAD 6)
--        Tanakh: ★ Psalm 50:10-12 (every beast of the forest is mine... the world is mine, and the
--                fulness thereof) — THREAD 3 (the silver/gold are Yahuah's own)
--   ★ v.10-14 (Ask now the priests concerning the law... If one bear holy flesh... if one that is
--          unclean by a dead body touch... It shall be unclean... So is this people)
--        NT:     none warranted distinct (Torah consulted as binding; the object-lesson is Levitical)
--        Extras: none warranted
--        Tanakh: ★ Numbers 19:11-13 (He that toucheth the dead body of any man shall be unclean...
--                defileth the tabernacle of Yahuah), ★ Leviticus 6:27 (Whatsoever shall touch the
--                flesh thereof shall be holy) — THREAD 4 (the Torah consulted as authoritative)
--   v.15-17 (consider from this day... twenty measures, there were but ten... I smote you with blasting
--          and mildew and hail... yet ye turned not to me)
--        NT/Extras: none warranted
--        Tanakh: Haggai 1:6/1:9-11 + Deuteronomy 28 curse-for-disobedience held in prose (preface to
--                THREAD 5's blessing turn); woven, not forced to a separate add
--   ★ v.18-19 (Consider now from this day... Is the seed yet in the barn?... from this day will I bless
--          you)
--        NT:     none warranted distinct (the blessing-for-obedience is the Torah's own promise)
--        Extras: none warranted
--        Tanakh: ★ Malachi 3:10 (prove me now herewith... if I will not open you the windows of heaven,
--                and pour you out a blessing), ★ Deuteronomy 28:8 (Yahuah shall command the blessing
--                upon thee in thy storehouses), ★ Deuteronomy 28:12 (Yahuah shall open unto thee his
--                good treasure) — THREAD 5
--   v.20-22 (I will shake the heavens and the earth; And I will overthrow the throne of kingdoms...
--          every one by the sword of his brother)
--        NT:     ★ Hebrews 12:28 (we receiving a kingdom which cannot be moved) — woven into THREAD 6
--        Extras: none warranted
--        Tanakh: ★ Daniel 2:44 (the Elohim of heaven set up a kingdom, which shall never be destroyed)
--                — THREAD 6 (the shaking of kingdoms vs the unshakable kingdom)
--   ★★★ v.23 (will I take thee, O Zerubbabel, my servant... and will make thee as a signet: for I have
--          chosen thee) — KEYSTONE CAPSTONE
--        NT:     ★★★ Matthew 1:12 (Salathiel begat Zorobabel), ★★ Matthew 1:13 (Zorobabel begat Abiud),
--                ★ Luke 3:27 (the son of Zorobabel, which was the son of Salathiel) — THREAD 6
--        Extras: ★★ Ecclesiasticus 49:11 (How shall we magnify Zorobabel? even he was as a signet on
--                the right hand), ★ Ecclesiasticus 49:12 (So was Jesus the son of Josedec: who... set
--                up an holy temple to Yahuah, which was prepared for everlasting glory) — THREAD 6
--        Tanakh: ★★★ Jeremiah 22:24 (though Coniah... were the signet upon my right hand, yet would I
--                pluck thee thence), ★ Isaiah 42:1 (Behold my servant... mine elect, in whom my soul
--                delighteth), ★ Daniel 2:44 (the kingdom which shall never be destroyed) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth — NT (John 14) + Tanakh (Haggai 1,
--      Isaiah 63) [free] (★ the discouraged builders comforted; the abiding covenant-Spirit)
--   2. haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory — NT
--      (Hebrews 12, John 1, Luke 2) + Tanakh (Malachi 3) [free] (★★★ KEYSTONE: the shaking + the Desire
--      of nations + the house filled with the Glory; the Messiah comes to the temple)
--   3. haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace — NT (Ephesians 2, John 14,
--      Luke 2) + Tanakh (Psalm 50) [free] (★★ KEYSTONE: the latter glory greater than the former; the
--      peace the Formed Son gives in this place)
--   4. haggai-2-ask-now-the-priests-concerning-the-law — Tanakh (Numbers 19, Leviticus 6) [free]
--      (★ the Torah consulted as authoritative on holiness/defilement — Torah binding, not abolished)
--   5. haggai-2-from-this-day-will-i-bless-you — Tanakh (Malachi 3, Deuteronomy 28) [free]
--      (★ the turning-point blessing for obedience; the storehouse opened)
--   6. haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee — NT (Matthew 1, Luke 3) + Extras
--      (Ecclesiasticus 49) + Tanakh (Jeremiah 22, Isaiah 42, Daniel 2) [extras] (★★★ KEYSTONE CAPSTONE:
--      the Coniah signet-curse reversed; the Davidic Messianic line sealed; the chosen servant; the
--      unshakable kingdom)
--
-- Framing notes:
--   ★ BE STRONG, MY SPIRIT REMAINETH (THREAD 1): the builders are dismayed because the new house is as
--      nothing beside Solomon's (2:3); the answer is presence, not splendour — *be strong... and work:
--      for I am with you* (2:4), the same word of Haggai 1:13 (*I am with you, saith Yahuah*), and the
--      covenant-Spirit abiding from the Exodus (*so my spirit remaineth among you* 2:5; *Where is he that
--      put his holy Spirit within him?* Isaiah 63:11). The Formed Son names that abiding Spirit forward:
--      *another Comforter, that he may abide with you for ever* (John 14:16). Torah/Spirit inseparable.
--   ★★★ THE DESIRE OF ALL NATIONS (THREAD 2): *I will shake the heavens, and the earth... and the desire
--      of all nations shall come: and I will fill this house with glory* (2:6-7) is quoted as still-future
--      in Hebrews 12:26-27 — *Yet once more I shake not the earth only, but also heaven... that those
--      things which cannot be shaken may remain*. The Desire of nations is the Messiah, the Glory who
--      came to the second temple (*Yahuah, whom ye seek, shall suddenly come to his temple* Malachi 3:1;
--      *the Word was made flesh... and we beheld his glory* John 1:14). The Formed Son fills the house.
--   ★★ THE LATTER GLORY + PEACE (THREAD 3): the silver and gold are Yahuah's own (2:8; *the world is
--      mine, and the fulness thereof* Psalm 50:12); the greater glory is His Presence, and the peace is
--      His own gift — *he is our peace* (Ephesians 2:14), *my peace I give unto you* (John 14:27), *on
--      earth peace* (Luke 2:14). The latter house outshines the former because the Desire of nations
--      Himself stood in it.
--   ★ ASK THE PRIESTS CONCERNING THE TORAH (THREAD 4): Haggai settles a question by Torah authority —
--      *Ask now the priests concerning the law* (2:11) — drawing on the holiness/defilement statutes
--      (Leviticus 6:27, Numbers 19:11-13). The Torah is consulted as living and binding; the lesson is
--      that uncleanness spreads but holiness does not transfer by mere contact — their unhallowed work
--      defiled the offering. Torah honoured, never abolished.
--   ★ FROM THIS DAY WILL I BLESS YOU (THREAD 5): the curse-for-neglect (the heap of twenty yielding ten,
--      the blasting and mildew, 2:16-17, the Deuteronomy 28 covenant judgment) turns to blessing the day
--      the foundation is honoured — *from this day will I bless you* (2:19); the storehouse opened
--      (Malachi 3:10), the blessing commanded (Deuteronomy 28:8). The curse is for covenant-breaking,
--      the blessing for obedience — Torah, never the curse itself.
--   ★★★ ZERUBBABEL THE SIGNET (THREAD 6, CAPSTONE): *will I take thee, O Zerubbabel, my servant... and
--      will make thee as a signet: for I have chosen thee* (2:23) reverses the curse on his grandfather
--      Coniah/Jeconiah — *though Coniah... were the signet upon my right hand, yet would I pluck thee
--      thence* (Jeremiah 22:24). The plucked signet is replaced; the Davidic line is sealed and preserved
--      THROUGH Zerubbabel — *Salathiel begat Zorobabel* (Matthew 1:12), *the son of Zorobabel* (Luke
--      3:27) — to the Messiah. The chosen servant (Isaiah 42:1), the kingdom that cannot be shaken
--      (Daniel 2:44, Hebrews 12:28). And the restored witness magnifies the very pair: *How shall we
--      magnify Zorobabel? even he was as a signet on the right hand: So was Jesus the son of Josedec:
--      who... set up an holy temple to Yahuah, which was prepared for everlasting glory* (Ecclesiasticus
--      49:11-12) — a stunning clean echo of Haggai 2:23 and 2:9.
--   EXTRAS: Ecclesiasticus 49:11-12 (Zerubbabel the signet + Joshua building the everlasting-glory
--      temple) — clean witness, parse verified, placed on THREAD 6. No other extras forced.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (dating/recipients — framing, woven into THREADS 1 and 6),
--      v.15-17 (the curse-for-neglect — preface to THREAD 5's blessing, held in prose with Deut 28),
--      v.20-22 (the shaking of kingdoms — woven into THREAD 6 with Daniel 2:44 / Hebrews 12:28). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s337_hag02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Be strong, for I am with you — my spirit remaineth (the abiding covenant-Spirit)
    ('canon','haggai',2,4,'canon','haggai',1,13,'free',
      E'*Then spake Haggai the LORD''S messenger in the LORD''S message unto the people, saying, I am with you, saith Yahuah (LORD)* (Haggai 1:13). The comfort to the dismayed builders — *be strong, all ye people of the land, saith Yahuah (LORD), and work: for I am with you, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:4) — is the same word that stirred them in the first chapter: *I am with you*. The presence of Yahuah, not the splendour of the house, is the ground of their strength.'),
    ('canon','haggai',2,5,'canon','isaiah',63,11,'free',
      E'*Then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11). Haggai grounds the promise in the Exodus covenant: *According to the word that I covenanted with you when ye came out of Egypt, so my spirit remaineth among you: fear ye not* (Haggai 2:5). The same holy Spirit Yahuah *put within* his people at the sea *remaineth among* them still — the covenant-Spirit abides, unbroken from the Exodus.'),
    ('canon','haggai',2,5,'canon','john',14,16,'free',
      E'*And I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever* (John 14:16). The promise *so my spirit remaineth among you: fear ye not* (Haggai 2:5) reaches its fullness in the Formed Son''s word: the Father gives *another Comforter, that he may abide... for ever*. The abiding Spirit of the covenant — given at the Exodus, remaining through the second temple — is the Comforter who dwells with and in his people without end.'),
    ('canon','haggai',2,5,'canon','john',14,17,'free',
      E'*Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you* (John 14:17). *My spirit remaineth among you* (Haggai 2:5) is the same Spirit of truth who *dwelleth with you, and shall be in you*. The covenant-Spirit does not depart with the former glory; he abides among the builders and indwells the people of the restored house.'),

    -- THREAD 2 (★★★): The desire of all nations shall come — I will fill this house with glory (KEYSTONE)
    ('canon','haggai',2,6,'canon','hebrews',12,26,'free',
      E'*Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). Hebrews quotes Haggai directly: *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6). The promised shaking of heaven and earth is still future and final — the same word Yahuah Tseva''ot spoke to the builders is the word that will shake all things at the end.'),
    ('canon','haggai',2,6,'canon','hebrews',12,27,'free',
      E'*And this word, Yet once more, signifieth the removing of those things that are shaken, as of things that are made, that those things which cannot be shaken may remain* (Hebrews 12:27). The shaking of *the heavens, and the earth, and the sea, and the dry land* (Haggai 2:6) has a purpose: to remove what is made and leave standing what cannot be shaken — the kingdom Yahuah sets up. Haggai''s shaking is the sifting that establishes the unshakable.'),
    ('canon','haggai',2,7,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). *The desire of all nations shall come: and I will fill this house with glory* (Haggai 2:7) is fulfilled when the Formed Son, the Word drawn from the Formless Father, *was made flesh, and dwelt among us* and *we beheld his glory*. The Glory that fills the house is the Desire of nations Himself, come to His temple.'),
    ('canon','haggai',2,7,'canon','luke',2,32,'free',
      E'*A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* (Luke 2:32). When the Desire of all nations comes (*the desire of all nations shall come* Haggai 2:7), aged Simeon holds Him in the temple and names Him *a light to lighten the Gentiles* — the Glory drawing the nations, exactly the house *filled with glory* that Haggai foretold.'),
    ('canon','haggai',2,7,'canon','malachi',3,1,'free',
      E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant, whom ye delight in: behold, he shall come, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:1). The house *filled with glory* (Haggai 2:7) is the temple to which *Yahuah, whom ye seek, shall suddenly come*. Both prophets of the restoration point to the same coming: the Lord Himself entering the latter house, the Desire of nations and the messenger of the covenant.'),

    -- THREAD 3 (★★): The latter glory greater — in this place will I give peace (KEYSTONE)
    ('canon','haggai',2,8,'canon','psalms',50,12,'free',
      E'*If I were hungry, I would not tell thee: for the world is mine, and the fulness thereof* (Psalm 50:12). *The silver is mine, and the gold is mine, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:8) sings the same truth: the builders need not mourn the poverty of the new house, for *the world is mine, and the fulness thereof* — every beast of the forest and the cattle on a thousand hills are His (Psalm 50:10). Yahuah owns the wealth that adorns His house.'),
    ('canon','haggai',2,9,'canon','ephesians',2,14,'free',
      E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14). *In this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:9) is given in a Person: the Formed Son *is our peace, who hath made both one* — the two houses of Yashar''el reconciled, the peace of the latter house secured in Him who stood within it.'),
    ('canon','haggai',2,9,'canon','john',14,27,'free',
      E'*Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid* (John 14:27). The promise *in this place will I give peace* (Haggai 2:9) is fulfilled in the Messiah''s own gift: *my peace I give unto you*. The peace of the latter house is not the world''s peace but His — given to the troubled, just as the troubled builders were told *fear ye not* (Haggai 2:5).'),
    ('canon','haggai',2,9,'canon','luke',2,14,'free',
      E'*Glory to Elohim (God) in the highest, and on earth peace, good will toward men* (Luke 2:14). When the Glory comes to fill the house, heaven proclaims *on earth peace* — the very peace *in this place will I give* (Haggai 2:9). The latter glory greater than the former and the peace of the latter house arrive together in the birth of the Desire of nations.'),

    -- THREAD 4 (★): Ask now the priests concerning the Torah (Torah consulted as authoritative)
    ('canon','haggai',2,11,'canon','leviticus',6,27,'free',
      E'*Whatsoever shall touch the flesh thereof shall be holy: and when there is sprinkled of the blood thereof upon any garment, thou shalt wash that whereon it was sprinkled in the holy place* (Leviticus 6:27). When Haggai says *Ask now the priests concerning the law* (Haggai 2:11) and asks whether *holy flesh in the skirt of his garment* sanctifies what it touches (2:12), he is drawing on this very statute of the holy offerings. The Torah is consulted as the living authority that settles the matter.'),
    ('canon','haggai',2,13,'canon','numbers',19,11,'free',
      E'*He that toucheth the dead body of any man shall be unclean seven days* (Numbers 19:11). Haggai''s second question — *If one that is unclean by a dead body touch any of these, shall it be unclean? And the priests answered and said, It shall be unclean* (Haggai 2:13) — is the law of the red heifer applied: corpse-defilement spreads by contact. The lesson is that uncleanness transfers but holiness does not, so the people''s unhallowed work *that which they offer there is unclean* (2:14). Torah honoured as binding.'),
    ('canon','haggai',2,13,'canon','numbers',19,13,'free',
      E'*Whosoever toucheth the dead body of any man that is dead, and purifieth not himself, defileth the tabernacle of Yahuah (LORD); and that soul shall be cut off from Yashar''el (Israel): because the water of separation was not sprinkled upon him, he shall be unclean; his uncleanness is yet upon him* (Numbers 19:13). The priests'' answer *It shall be unclean* (Haggai 2:13) rests here: corpse-defilement reaches even the sanctuary unless cleansed. So Haggai presses home *that which they offer there is unclean* (2:14) — the offering of unclean hands cannot be made holy by the altar alone.'),

    -- THREAD 5 (★): From this day will I bless you (the turning-point blessing for obedience)
    ('canon','haggai',2,19,'canon','malachi',3,10,'free',
      E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house, and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). *From this day will I bless you* (Haggai 2:19) is the same covenant arithmetic: honour the house, and Yahuah opens the windows of heaven. The seed yet in the barn, the vine and fig not yet fruited, are about to be blessed for the obedience that built the house.'),
    ('canon','haggai',2,19,'canon','deuteronomy',28,8,'free',
      E'*Yahuah (LORD) shall command the blessing upon thee in thy storehouses, and in all that thou settest thine hand unto; and he shall bless thee in the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Deuteronomy 28:8). The turn from blasting and mildew (Haggai 2:17) to *from this day will I bless you* (2:19) is the Torah''s own promise: obedience draws the commanded blessing on the storehouses. The curse was for neglect of the house; the blessing follows the work resumed — Torah, never the curse itself.'),
    ('canon','haggai',2,19,'canon','deuteronomy',28,12,'free',
      E'*Yahuah (LORD) shall open unto thee his good treasure, the heaven to give the rain unto thy land in his season, and to bless all the work of thine hand: and thou shalt lend unto many nations, and thou shalt not borrow* (Deuteronomy 28:12). *Is the seed yet in the barn?... from this day will I bless you* (Haggai 2:19) is Yahuah opening *his good treasure, the heaven* upon the obedient — the same blessing of the work of the hands promised in the Torah for those who hearken.'),

    -- THREAD 6 (★★★): Zerubbabel the signet — for I have chosen thee (KEYSTONE CAPSTONE)
    ('canon','haggai',2,23,'canon','jeremiah',22,24,'free',
      E'*As I live, saith Yahuah (LORD), though Coniah the son of Jehoiakim king of Yahudah (Judah) were the signet upon my right hand, yet would I pluck thee thence* (Jeremiah 22:24). The capstone of Haggai reverses this curse: Coniah (Jeconiah), Zerubbabel''s own grandfather, was the signet Yahuah *plucked* off His hand — yet now *will I take thee, O Zerubbabel... and will make thee as a signet: for I have chosen thee* (Haggai 2:23). The plucked seal is restored in the grandson; the Davidic line, sentenced in Jeremiah, is sealed again in Zerubbabel.'),
    ('canon','haggai',2,23,'canon','isaiah',42,1,'free',
      E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles* (Isaiah 42:1). Zerubbabel is named *my servant... for I have chosen thee* (Haggai 2:23) — the same election language of the chosen Servant, *mine elect, in whom my soul delighteth*. The signet-servant of the restored line foreshadows the chosen Servant who springs from it, the Messiah upon whom the Spirit rests.'),
    ('canon','haggai',2,23,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). Haggai''s shaking — *I will overthrow the throne of kingdoms, and I will destroy the strength of the kingdoms of the heathen* (Haggai 2:22) — clears the way for the kingdom *which shall never be destroyed*. The signet chosen in Zerubbabel''s line bears the throne that outlasts every shaken kingdom.'),
    ('canon','haggai',2,23,'canon','matthew',1,12,'extras',
      E'*And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12). The signet chosen in Haggai 2:23 stands in the very heart of the Messianic genealogy — *Salathiel begat Zorobabel* — carrying the Davidic line through the captivity from Jechonias (the plucked Coniah of Jeremiah 22:24) to the Messiah. The line cursed in Jeconiah is preserved and sealed through the chosen signet Zerubbabel.'),
    ('canon','haggai',2,23,'canon','matthew',1,13,'extras',
      E'*And Zorobabel begat Abiud; and Abiud begat Eliakim; and Eliakim begat Azor* (Matthew 1:13). From the signet Zerubbabel the line runs unbroken toward the Messiah — *Zorobabel begat Abiud*. *Will I... make thee as a signet: for I have chosen thee* (Haggai 2:23) is the seal upon the very link that carries David''s house to *Yahusha (Jesus), who is called Messiah (Christ)* (Matthew 1:16).'),
    ('canon','haggai',2,23,'canon','luke',3,27,'extras',
      E'*Which was the son of Joanna, which was the son of Rhesa, which was the son of Zorobabel, which was the son of Salathiel, which was the son of Neri* (Luke 3:27). Luke''s genealogy of Yahusha also runs through *Zorobabel... Salathiel* — the chosen signet of Haggai 2:23 stands in the Messiah''s line. The seal Yahuah set on Zerubbabel preserved the royal seed all the way to the Formed Son who took flesh.'),
    ('canon','haggai',2,23,'apocrypha','ecclesiasticus',49,11,'extras',
      E'*How shall we magnify Zorobabel? even he was as a signet on the right hand* (Ecclesiasticus 49:11). The restored witness magnifies the very man Haggai sealed: Zerubbabel *was as a signet on the right hand* — echoing word for word *will I... make thee as a signet* (Haggai 2:23), and answering Jeremiah''s plucked signet (Jeremiah 22:24). Ben Sira remembers him as the seal restored to the right hand of Yahuah.'),
    ('canon','haggai',2,23,'apocrypha','ecclesiasticus',49,12,'extras',
      E'*So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Ecclesiasticus 49:12). The witness pairs Zerubbabel the signet with Joshua (Jesus) son of Josedech — the very pair addressed in Haggai 2:2 — who *builded the house, and set up an holy temple... prepared for everlasting glory*. This is Haggai''s own promise remembered: the latter house *filled with glory* (Haggai 2:7), the glory *greater than of the former* (2:9), prepared for everlasting glory.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s337_hag02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s337_hag02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth',
       E'Be strong, for I am with you — my spirit remaineth among you',
       E'The builders look on the second temple and despair: *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* (Haggai 2:3). The answer is not greater splendour but Presence: *Yet now be strong, O Zerubbabel, saith Yahuah (LORD); and be strong, O Joshua, son of Josedech, the high priest; and be strong, all ye people of the land, saith Yahuah (LORD), and work: for I am with you, saith Yahuah Tseva''ot (LORD of hosts)* (2:4) — the same word that first stirred them, *I am with you, saith Yahuah (LORD)* (Haggai 1:13). And the ground of that presence is the abiding covenant-Spirit: *According to the word that I covenanted with you when ye came out of Egypt, so my spirit remaineth among you: fear ye not* (2:5) — the very Spirit *put within* the people at the sea (*Where is he that put his holy Spirit within him?* Isaiah 63:11). The Formed Son names that abiding Spirit forward, the Comforter who never departs: *I will pray the Father, and he shall give you another Comforter, that he may abide with you for ever* (John 14:16); *the Spirit of truth... he dwelleth with you, and shall be in you* (John 14:17). The Spirit and the covenant are inseparable; the abiding Presence, not the lost glory, is the builders'' strength.',
       sv.verse_id, ev.verse_id, 'free', 45670
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory',
       E'The desire of all nations shall come — I will fill this house with glory',
       E'To builders who mourn the poverty of the new house comes the keystone promise: *For thus saith Yahuah Tseva''ot (LORD of hosts); Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land; And I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:6-7). Hebrews quotes it as still-future and final: *Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26), *the removing of those things that are shaken... that those things which cannot be shaken may remain* (12:27). The shaking sifts away what is made and leaves the unshakable kingdom standing. And the Desire of all nations is a Person — the Glory who came to the latter temple: *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14); *Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* (Malachi 3:1); and held in Simeon''s arms in that very temple, *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* (Luke 2:32). The house is filled with glory not by silver and gold but by the coming of the Desire of nations Himself — the Formed Son drawn from the Formless Father, the visible Glory entering His house.',
       sv.verse_id, ev.verse_id, 'free', 45673
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace',
       E'The glory of this latter house greater — in this place will I give peace',
       E'The builders need not fear the poverty of the house, for the wealth is Yahuah''s own: *The silver is mine, and the gold is mine, saith Yahuah Tseva''ot (LORD of hosts)* (Haggai 2:8) — *for the world is mine, and the fulness thereof* (Psalm 50:12), every beast of the forest and the cattle on a thousand hills His already (Psalm 50:10). Then the second keystone: *The glory of this latter house shall be greater than of the former, saith Yahuah Tseva''ot (LORD of hosts): and in this place will I give peace, saith Yahuah Tseva''ot (LORD of hosts)* (2:9). The latter glory surpasses Solomon''s not in gold but in Presence — the Desire of nations stood in it. And the peace is given in a Person: *he is our peace, who hath made both one* (Ephesians 2:14), the two houses of Yashar''el reconciled in Him; *Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you* (John 14:27); and proclaimed at His coming, *on earth peace, good will toward men* (Luke 2:14). The latter house outshines the former because the Glory and the peace of Yahuah came to it in the flesh of the Formed Son.',
       sv.verse_id, ev.verse_id, 'free', 45676
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-ask-now-the-priests-concerning-the-law',
       E'Ask now the priests concerning the law — the Torah consulted as authoritative',
       E'Haggai settles a question of holiness and defilement not by his own word but by the standing Torah: *Thus saith Yahuah Tseva''ot (LORD of hosts); Ask now the priests concerning the law* (Haggai 2:11). The first question — *If one bear holy flesh in the skirt of his garment, and with his skirt do touch bread, or pottage, or wine, or oil, or any meat, shall it be holy? And the priests answered and said, No* (2:12) — draws on the law of the holy offerings, *Whatsoever shall touch the flesh thereof shall be holy: and when there is sprinkled of the blood thereof upon any garment, thou shalt wash that whereon it was sprinkled in the holy place* (Leviticus 6:27): holiness does not spread by casual contact. The second — *If one that is unclean by a dead body touch any of these, shall it be unclean? And the priests answered and said, It shall be unclean* (2:13) — is the law of corpse-defilement, *He that toucheth the dead body of any man shall be unclean seven days* (Numbers 19:11), which even reaches the sanctuary, *defileth the tabernacle of Yahuah (LORD)* (Numbers 19:13). The lesson: uncleanness transfers but holiness does not, *so is this people, and so is this nation before me, saith Yahuah (LORD); and so is every work of their hands; and that which they offer there is unclean* (2:14). The Torah is consulted as the living, binding authority — honoured, never abolished.',
       sv.verse_id, ev.verse_id, 'free', 45679
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-from-this-day-will-i-bless-you',
       E'From this day will I bless you — the turning-point blessing for obedience',
       E'The years of neglect brought the covenant curse — the heap of twenty yielding ten, *I smote you with blasting and with mildew and with hail in all the labours of your hands; yet ye turned not to me, saith Yahuah (LORD)* (Haggai 2:16-17). But the day the foundation is honoured the verdict turns: *Consider now from this day and upward, from the four and twentieth day of the ninth month, even from the day that the foundation of the LORD''S temple was laid, consider it. Is the seed yet in the barn? yea, as yet the vine, and the fig tree, and the pomegranate, and the olive tree, hath not brought forth: from this day will I bless you* (2:18-19). The barren ground is about to be blessed for the obedience that resumed the work — the same covenant arithmetic Malachi sings, *prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10), and the Torah promises, *Yahuah (LORD) shall command the blessing upon thee in thy storehouses* (Deuteronomy 28:8), *Yahuah (LORD) shall open unto thee his good treasure, the heaven... and to bless all the work of thine hand* (Deuteronomy 28:12). The curse was for neglecting the house; the blessing follows the work resumed — the inheritance of obedience, never the curse of the Torah itself.',
       sv.verse_id, ev.verse_id, 'free', 45682
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee',
       E'Zerubbabel the signet — for I have chosen thee (the curse reversed, the line sealed)',
       E'The book of Haggai — and with it the whole company of the twelve prophets — closes on the Messianic seal. After the shaking of kingdoms (*I will overthrow the throne of kingdoms, and I will destroy the strength of the kingdoms of the heathen* Haggai 2:22) comes the capstone: *In that day, saith Yahuah Tseva''ot (LORD of hosts), will I take thee, O Zerubbabel, my servant, the son of Shealtiel, saith Yahuah (LORD), and will make thee as a signet: for I have chosen thee, saith Yahuah Tseva''ot (LORD of hosts)* (2:23). This reverses the bitterest curse of the captivity. Zerubbabel''s own grandfather Coniah (Jeconiah) had been the signet Yahuah tore from His hand: *though Coniah the son of Jehoiakim king of Yahudah (Judah) were the signet upon my right hand, yet would I pluck thee thence* (Jeremiah 22:24). The plucked seal is now restored in the grandson — the Davidic line, sentenced in Jeremiah, sealed again in Zerubbabel as *my servant... for I have chosen thee*, the very election of the chosen Servant (*Behold my servant... mine elect, in whom my soul delighteth* Isaiah 42:1). Through this sealed line runs the genealogy of the Messiah: *Salathiel begat Zorobabel* (Matthew 1:12), *Zorobabel begat Abiud* (Matthew 1:13), *the son of Zorobabel, which was the son of Salathiel* (Luke 3:27) — the royal seed preserved from the curse all the way to the Formed Son who took flesh. The shaken kingdoms give way to the throne that cannot fall: *the Elohim (God) of heaven shall set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). And the restored witness magnifies the very pair Haggai addressed: *How shall we magnify Zorobabel? even he was as a signet on the right hand: So was Jesus the son of Josedec: who in their time builded the house, and set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Ecclesiasticus 49:11-12) — Zerubbabel the signet and Joshua the high priest, builders of the latter house *prepared for everlasting glory*, the very glory *greater than of the former* (Haggai 2:9) that Haggai foretold.',
       sv.verse_id, ev.verse_id, 'extras', 45685
  FROM _s337_hag02_lookup sv, _s337_hag02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='haggai' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am with you, saith Yahuah (LORD)* (Haggai 1:13) — the same word of presence that first stirred the builders is the ground of *be strong... for I am with you* (Haggai 2:4).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Where is he that put his holy Spirit within him?* (Isaiah 63:11) — the Exodus-Spirit *put within* the people is the same that *remaineth among you* (Haggai 2:5).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *another Comforter, that he may abide with you for ever* (John 14:16) — *my spirit remaineth among you* (Haggai 2:5) reaches its fullness in the abiding Comforter the Father gives.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the Spirit of truth... he dwelleth with you, and shall be in you* (John 14:17) — the covenant-Spirit that *remaineth among you* (Haggai 2:5) is the indwelling Spirit of truth.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-be-strong-for-i-am-with-you-my-spirit-remaineth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) — Hebrews quotes *I will shake the heavens, and the earth* (Haggai 2:6) as the final shaking still to come.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *the removing of those things that are shaken... that those things which cannot be shaken may remain* (Hebrews 12:27) — the shaking of Haggai 2:6 sifts away the made and leaves the unshakable kingdom.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the Word was made flesh, and dwelt among us, (and we beheld his glory)* (John 1:14) — the Desire of all nations *shall come* (Haggai 2:7) is the Formed Son whose glory filled the house.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *A light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel)* (Luke 2:32) — the Desire of nations held in the temple, the house *filled with glory* (Haggai 2:7).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yahuah (Lord), whom ye seek, shall suddenly come to his temple* (Malachi 3:1) — the latter house *filled with glory* (Haggai 2:7) is the temple the Lord Himself enters.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-desire-of-all-nations-shall-come-and-i-will-fill-this-house-with-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the world is mine, and the fulness thereof* (Psalm 50:12) — *The silver is mine, and the gold is mine* (Haggai 2:8); Yahuah owns the wealth that adorns His house.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he is our peace, who hath made both one* (Ephesians 2:14) — *in this place will I give peace* (Haggai 2:9) is given in the Person who reconciled the two houses.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *my peace I give unto you: not as the world giveth* (John 14:27) — the peace of the latter house (Haggai 2:9) is the Messiah''s own gift to the troubled.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *on earth peace, good will toward men* (Luke 2:14) — the peace *in this place* (Haggai 2:9) proclaimed by heaven at the coming of the Glory.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-the-latter-glory-greater-and-in-this-place-will-i-give-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Whatsoever shall touch the flesh thereof shall be holy* (Leviticus 6:27) — the law of the holy offerings behind *Ask now the priests concerning the law* (Haggai 2:11).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=6 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-ask-now-the-priests-concerning-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He that toucheth the dead body of any man shall be unclean seven days* (Numbers 19:11) — the corpse-defilement law behind the priests'' answer *It shall be unclean* (Haggai 2:13).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-ask-now-the-priests-concerning-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*defileth the tabernacle of Yahuah (LORD)... his uncleanness is yet upon him* (Numbers 19:13) — defilement reaches even the sanctuary, so *that which they offer there is unclean* (Haggai 2:14).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=19 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-ask-now-the-priests-concerning-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *prove me now herewith... if I will not open you the windows of heaven, and pour you out a blessing* (Malachi 3:10) — the same covenant arithmetic as *from this day will I bless you* (Haggai 2:19).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-from-this-day-will-i-bless-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) shall command the blessing upon thee in thy storehouses* (Deuteronomy 28:8) — the Torah''s promise of blessing for obedience, fulfilled in *from this day will I bless you* (Haggai 2:19).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-from-this-day-will-i-bless-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahuah (LORD) shall open unto thee his good treasure, the heaven... and to bless all the work of thine hand* (Deuteronomy 28:12) — the blessing on the work of the hands behind *from this day will I bless you* (Haggai 2:19).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-from-this-day-will-i-bless-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *though Coniah... were the signet upon my right hand, yet would I pluck thee thence* (Jeremiah 22:24) — the signet-curse on Zerubbabel''s grandfather, reversed in *will I... make thee as a signet* (Haggai 2:23).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Behold my servant... mine elect, in whom my soul delighteth* (Isaiah 42:1) — Zerubbabel named *my servant... for I have chosen thee* (Haggai 2:23), the election that foreshadows the chosen Servant.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the Elohim (God) of heaven shall set up a kingdom, which shall never be destroyed... it shall stand for ever* (Daniel 2:44) — the shaken kingdoms (Haggai 2:22) give way to the throne the signet-line bears.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *Salathiel begat Zorobabel* (Matthew 1:12) — the chosen signet (Haggai 2:23) stands in the Messiah''s line, carrying David''s house through the captivity from the plucked Coniah.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Zorobabel begat Abiud* (Matthew 1:13) — from the signet Zerubbabel the line runs unbroken toward *Yahusha... who is called Messiah* (Matthew 1:16).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the son of Zorobabel, which was the son of Salathiel* (Luke 3:27) — Luke''s genealogy of Yahusha also runs through the chosen signet (Haggai 2:23).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *How shall we magnify Zorobabel? even he was as a signet on the right hand* (Ecclesiasticus 49:11) — the restored witness echoes *make thee as a signet* (Haggai 2:23) word for word, answering Jeremiah''s plucked signet.'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *So was Jesus the son of Josedec: who... set up an holy temple to Yahuah (God), which was prepared for everlasting glory* (Ecclesiasticus 49:12) — the pair of Haggai 2:2 remembered, the latter house *prepared for everlasting glory* (cf. Haggai 2:9).'
  FROM cross_reference_threads t
  JOIN _s337_hag02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='haggai' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s337_hag02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=49 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='haggai-2-zerubbabel-the-signet-for-i-have-chosen-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session337 — Haggai cross-references complete.'
