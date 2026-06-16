-- =====================================================================
-- Session 306 — Daniel FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session306_daniel_cross_references.sql
-- =====================================================================

\echo 'session306 — Daniel cross-references starting...'
BEGIN;

-- ----- fragment: minion_daniel_1.sql (Daniel 1) -----
-- Chapter: Daniel 1 — the children of Yahudah (Judah) carried to Babylon, names changed; Daniel PURPOSED
-- in his heart that he would not defile himself with the king's meat; Elohim (God) gave the four
-- knowledge and skill in all learning and wisdom; Daniel found favour with the prince of the eunuchs and
-- CONTINUED even unto the first year of king Cyrus. The opening chapter of the captivity: the faithful
-- remnant of the two-house exile keeping Torah dietary holiness under a pagan empire, and outlasting it.
-- Tag: dan01   Temp view: _s306_dan01_lookup
-- Sort band: base 30000, step 3 -> threads at 30000, 30003, 30006, 30009 (4 threads)
-- Source of EVERY row: 'canon','daniel',1,v
--
-- Daniel 1 coverage:
--   v.1-2 (Nebuchadnezzar... besieged Jerusalem; Yahuah gave Jehoiakim into his hand, with part of the
--          vessels of the house of Elohim... carried into the land of Shinar)
--        NT:     none warranted (the historical carrying-off; the seed-preserved-in-exile woven in THREAD 2)
--        Extras: none warranted (no clean Babylon-vessels witness; held to canon)
--        Tanakh: ★ 2 Chronicles 36:7 (Nebuchadnezzar carried of the vessels of the house of Yahuah to
--                Babylon), ★ Jeremiah 25:9,11 (Nebuchadrezzar... my servant... seventy years), ★ Deuteronomy
--                28:36,49-50,64 (the exile-curse for covenant-breaking) — THREAD 2
--   v.3-7 (children of Yashar'el and of the king's seed... no blemish, skilful in all wisdom... taught the
--          learning and the tongue of the Chaldeans; names changed Daniel->Belteshazzar etc.)
--        NT:     none warranted (the name-change = pressure to erase covenant identity; woven in THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: held in THREAD 2 — the seed of the children of Yahudah (Judah) preserved through the exile
--   ★★ v.8 (Daniel PURPOSED in his heart that he would not defile himself with the portion of the king's
--          meat, nor with the wine which he drank... that he might not defile himself)
--        NT:     ★ 2 Corinthians 6:17 (come out from among them, and be ye separate... touch not the unclean
--                thing) + 6:14,16,18 (the temple of the living Elohim; I will be a Father unto you) — THREAD 1
--        Extras: none warranted (clean Torah-NT weave; no extras forced)
--        Tanakh: ★★ Leviticus 11:43-45 (ye shall therefore be holy, for I am holy; defile not yourselves),
--                ★★ Deuteronomy 14:2-3,21 (an holy people... thou shalt not eat any abominable thing) — THREAD 1
--   v.9 (Elohim had brought Daniel into favour and tender love with the prince of the eunuchs)
--        NT:     none warranted (the Yahuah-with-the-faithful-in-a-strange-land pattern; canon weave)
--        Extras: none warranted
--        Tanakh: ★ Genesis 39:2-4,21 (Yahuah was with Joseph... gave him favour) — THREAD 4
--   v.10-16 (the ten-day proof; pulse and water; their countenances fairer and fatter than the
--          king's-meat children)
--        NT:     none warranted (the vindication of the dietary stand; woven in THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: none separate (the proof confirms the purpose of v.8; held in THREAD 1)
--   ★ v.17,20 (Elohim gave them knowledge and skill in all learning and wisdom... ten times better than
--          all the magicians and astrologers)
--        NT:     ★ James 1:5 (if any of you lack wisdom, let him ask of Elohim, that giveth to all men
--                liberally) — THREAD 3
--        Extras: ★ Ecclesiasticus 1:1 (All wisdom comes from Yahuah, and is with him for ever) — THREAD 3
--        Tanakh: ★ Proverbs 2:6 (Yahuah giveth wisdom: out of his mouth cometh knowledge and
--                understanding), ★ 1 Kings 3:12 (I have given thee a wise and an understanding heart) — THREAD 3
--   v.18-19 (the king communed with them; none found like Daniel, Hananiah, Mishael, Azariah)
--        NT:     none warranted (the vindication of the gift; held in THREAD 3)
--        Extras: none warranted
--        Tanakh: none separate (held in THREAD 3)
--   ★ v.21 (And Daniel continued even unto the first year of king Cyrus)
--        NT:     none warranted (the remnant outlasts the empire; the Cyrus-deliverance woven in THREAD 4)
--        Extras: none warranted
--        Tanakh: ★ 2 Chronicles 36:22-23 (in the first year of Cyrus... Yahuah stirred up the spirit of
--                Cyrus... let him go up) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat — Tanakh (Leviticus 11, Deuteronomy 14) + NT (2 Corinthians 6) [free]
--      (★★ the faithful remnant keeping Torah dietary holiness in exile — clean food STANDS, not abolished; come out and be separate)
--   2. daniel-1-the-children-of-yahudah-carried-to-babylon — Tanakh (2 Chronicles 36, Jeremiah 25, Deuteronomy 28) [free]
--      (the exile-judgment of Deut 28 for covenant-breaking, NEVER the curse of the Torah itself; yet the seed preserved)
--   3. daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom — Tanakh (Proverbs 2, 1 Kings 3) + NT (James 1) + Extras (Ecclesiasticus) [extras]
--      (★ the gift of wisdom to the faithful — all wisdom comes from Yahuah, given to them that love him)
--   4. daniel-1-yahuah-was-with-the-remnant-that-outlasted-the-empire — Tanakh (Genesis 39, 2 Chronicles 36) [free]
--      (★ Elohim brought Daniel into favour as he was with Joseph; the remnant continues unto the first year of Cyrus — outlasting Babylon)
--
-- Framing notes:
--   ★★ DANIEL PURPOSED NOT TO DEFILE HIMSELF (THREAD 1): the keystone of the chapter and a load-bearing
--      proof of the framework — *But Daniel purposed in his heart that he would not defile himself with the
--      portion of the king''s meat, nor with the wine which he drank* (Daniel 1:8). In the heart of pagan
--      Babylon, under royal pressure, the faithful exile keeps the dietary holiness of the Torah: *ye shall
--      therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile
--      yourselves* (Leviticus 11:44); *thou art an holy people unto Yahuah Elohayka (the LORD thy God)...
--      Thou shalt not eat any abominable thing* (Deuteronomy 14:2-3). The clean/unclean distinction STANDS —
--      it is not a defunct ordinance but the holiness that marks Yahuah''s people, kept even in captivity.
--      Paul names the same separation: *come out from among them, and be ye separate, saith Yahuah (Lord),
--      and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). The vindication
--      follows: the four who ate pulse and water *appeared fairer and fatter in flesh* (1:15) than the
--      king''s-meat children — Torah-faithfulness honoured.
--   THE CHILDREN OF YAHUDAH CARRIED TO BABYLON (THREAD 2): the exile is the Deuteronomy 28 covenant-lawsuit
--      verdict, NEVER the Torah as curse — *Yahuah (LORD) shall bring a nation against thee from far... a
--      nation whose tongue thou shalt not understand* (Deut 28:49); *Yahuah (LORD) shall scatter thee among
--      all people* (28:64). Jeremiah named the instrument and the term — *Nebuchadrezzar the king of
--      Babylon, my servant* (Jeremiah 25:9), *these nations shall serve the king of Babylon seventy years*
--      (25:11) — and the vessels of the house of Elohim went with them (2 Chron 36:7). Yet the seed is
--      preserved: the king''s seed and the children of Yahudah (Judah), names changed to bury their
--      identity (Daniel->Belteshazzar), are kept alive in Babylon to outlast it (THREAD 4).
--   ★ ELOHIM GAVE THEM KNOWLEDGE AND SKILL (THREAD 3): *As for these four children, Elohim (God) gave them
--      knowledge and skill in all learning and wisdom: and Daniel had understanding in all visions and
--      dreams* (Daniel 1:17) — *ten times better than all the magicians and astrologers* (1:20). The wisdom
--      is a GIFT to the faithful, not the Chaldean arts they were taught: *For Yahuah (LORD) giveth wisdom:
--      out of his mouth cometh knowledge and understanding* (Proverbs 2:6); Solomon was given *a wise and an
--      understanding heart* (1 Kings 3:12); James gives the standing invitation — *If any of you lack
--      wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5); and the restored
--      witness sings it — *All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus
--      1:1). The four who kept the covenant in their bodies were given understanding above the empire''s sages.
--   ★ YAHUAH WAS WITH THE REMNANT THAT OUTLASTED THE EMPIRE (THREAD 4): *Now Elohim (God) had brought
--      Daniel into favour and tender love with the prince of the eunuchs* (Daniel 1:9) — the same hand that
--      was with Yoseph (Joseph) in Egypt: *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave
--      him favour in the sight of the keeper of the prison* (Genesis 39:21). And the chapter closes with the
--      remnant outliving Babylon itself: *And Daniel continued even unto the first year of king Cyrus*
--      (Daniel 1:21) — the very Cyrus who would end the captivity: *Now in the first year of Cyrus king of
--      Persia, that the word of Yahuah (LORD) spoken by the mouth of Jeremiah might be accomplished, Yahuah
--      (LORD) stirred up the spirit of Cyrus* (2 Chronicles 36:22). The faithful exile is kept by Yahuah and
--      sees the empire fall.
--   VERSES WITH NO SEPARATE ADD: v.3-7 (the name-change/Chaldean schooling — woven in THREAD 2), v.10-16
--      (the ten-day proof — the vindication of v.8, held in THREAD 1), v.18-19 (none found like the four —
--      held in THREAD 3). All recorded.

CREATE TEMP VIEW _s306_dan01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Daniel purposed not to defile himself with the king's meat — Torah dietary holiness STANDS
    ('canon','daniel',1,8,'canon','leviticus',11,44,'free',
      E'*For I am Yahuah Elohaychem (the LORD your God): ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing that creepeth upon the earth* (Leviticus 11:44). When Daniel *purposed in his heart that he would not defile himself with the portion of the king''s meat* (Daniel 1:8), he was keeping this very word — the dietary holiness that marks Yahuah''s people as set apart. The clean/unclean distinction STANDS in Babylon; it is not abolished but the badge of holiness carried into exile.'),
    ('canon','daniel',1,8,'canon','leviticus',11,45,'free',
      E'*For I am Yahuah (LORD) that bringeth you up out of the land of Egypt, to be your Elohim (God): ye shall therefore be holy, for I am holy* (Leviticus 11:45). The call to be holy *for I am holy* is the ground of Daniel''s resolve *that he might not defile himself* (Daniel 1:8). The God who redeemed Yashar''el (Israel) out of Egypt is the God whose holiness the faithful exile honours at the pagan king''s table.'),
    ('canon','daniel',1,8,'canon','deuteronomy',14,2,'free',
      E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth* (Deuteronomy 14:2). The dietary code Daniel keeps is framed by election: a *peculiar people* set apart from *all the nations*. Refusing *the portion of the king''s meat* (Daniel 1:8) is refusing to be assimilated into Babylon — holding the covenant identity the name-change tried to bury.'),
    ('canon','daniel',1,8,'canon','deuteronomy',14,3,'free',
      E'*Thou shalt not eat any abominable thing* (Deuteronomy 14:3). The plain command stands behind Daniel''s purpose *that he would not defile himself with the portion of the king''s meat* (Daniel 1:8). The king''s table mingled the unclean and the idol-portion; the faithful exile would not eat the abominable thing, and Elohim (God) vindicated him.'),
    ('canon','daniel',1,8,'canon','2-corinthians',6,17,'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). Paul names the same separation Daniel lived — *touch not the unclean thing* answers *he would not defile himself with the portion of the king''s meat* (Daniel 1:8). Set-apartness in the midst of a pagan world, with the promise: *and I will receive you*, *and will be a Father unto you* (6:18).'),

    -- THREAD 2: the children of Yahudah carried to Babylon — the exile-judgment, the seed preserved
    ('canon','daniel',1,2,'canon','2-chronicles',36,7,'free',
      E'*Nebuchadnezzar also carried of the vessels of the house of Yahuah (LORD) to Babylon, and put them in his temple at Babylon* (2 Chronicles 36:7). This is the same carrying-off Daniel records — *part of the vessels of the house of Elohim (God): which he carried into the land of Shinar to the house of his god* (Daniel 1:2). The vessels of Yahuah''s house in a pagan temple mark the depth of the judgment, yet they (and the seed) are preserved to return.'),
    ('canon','daniel',1,1,'canon','jeremiah',25,9,'free',
      E'*Behold, I will send and take all the families of the north, saith Yahuah (LORD), and Nebuchadrezzar the king of Babylon, my servant... and make them an astonishment, and an hissing, and perpetual desolations* (Jeremiah 25:9). Daniel''s opening — *Nebuchadnezzar king of Babylon unto Jerusalem, and besieged it* (Daniel 1:1) — is the prophesied stroke. Babylon is the rod, *my servant*, raised against Jerusalem for covenant-breaking; the judgment is Yahuah''s, not the empire''s own glory.'),
    ('canon','daniel',1,1,'canon','jeremiah',25,11,'free',
      E'*And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11). The seventy-year term frames the whole captivity that opens in Daniel 1:1. Daniel himself will later read these very words (Daniel 9:2) — the besieging of Jerusalem is the start of a measured exile, not a final abandonment of the seed.'),
    ('canon','daniel',1,2,'canon','deuteronomy',28,36,'free',
      E'*Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known; and there shalt thou serve other gods, wood and stone* (Deuteronomy 28:36). The carrying of the king and the people into Babylon (Daniel 1:1-2) is the Deuteronomy 28 covenant-curse coming to pass — the exile-judgment for breaking covenant, NEVER the Torah itself as curse. The instruction was the life; the breaking of it brought the captivity.'),
    ('canon','daniel',1,2,'canon','deuteronomy',28,64,'free',
      E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). The scattering Moses foretold is fulfilled as the children of Yahudah (Judah) are carried *into the land of Shinar* (Daniel 1:2). This is the two-house judgment in motion — yet the scattered seed is gathered again, and the remnant in Babylon is kept.'),

    -- THREAD 3 (★): Elohim gave them knowledge and skill in all learning and wisdom
    ('canon','daniel',1,17,'canon','proverbs',2,6,'free',
      E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). When *Elohim (God) gave them knowledge and skill in all learning and wisdom* (Daniel 1:17), this proverb was embodied — the wisdom of the four was no Chaldean art but the gift of Yahuah, *out of his mouth* the knowledge and understanding that left the empire''s sages behind.'),
    ('canon','daniel',1,17,'canon','1-kings',3,12,'free',
      E'*Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee* (1 Kings 3:12). As Yahuah gave Solomon *a wise and an understanding heart*, so *Elohim (God) gave* the four exiles *knowledge and skill in all learning and wisdom* (Daniel 1:17) — among them *was found none like Daniel, Hananiah, Mishael, and Azariah* (1:19). The same Giver, the same surpassing gift to the faithful.'),
    ('canon','daniel',1,17,'canon','james',1,5,'free',
      E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). The wisdom *Elohim (God) gave* the four children (Daniel 1:17) is the standing promise James names: God *giveth to all men liberally*. The four sought to keep covenant in a strange land, and were given understanding above all the magicians and astrologers (1:20).'),
    ('canon','daniel',1,17,'apocrypha','ecclesiasticus',1,1,'extras',
      E'*All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1). The restored witness opens with the very truth Daniel 1:17 displays — *Elohim (God) gave them knowledge and skill in all learning and wisdom* — for all wisdom *comes from Yahuah (God)*, given *to them that love him* (1:10). The four who kept Yahuah''s covenant received the wisdom that is his alone to give.'),

    -- THREAD 4 (★): Yahuah was with the remnant that outlasted the empire
    ('canon','daniel',1,9,'canon','genesis',39,21,'free',
      E'*But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison* (Genesis 39:21). The same hand is on Daniel: *Now Elohim (God) had brought Daniel into favour and tender love with the prince of the eunuchs* (Daniel 1:9). As Yahuah was with Yoseph (Joseph) in Egypt, so he is with Daniel in Babylon — the faithful exile carried by the favour of God in a strange land.'),
    ('canon','daniel',1,9,'canon','genesis',39,2,'free',
      E'*And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian* (Genesis 39:2). The Yoseph (Joseph) pattern is the template for Daniel — Yahuah''s presence prospering the captive in the captor''s house. *Elohim (God) had brought Daniel into favour and tender love with the prince of the eunuchs* (Daniel 1:9) is the same providence opening the way for the exile to be raised up.'),
    ('canon','daniel',1,21,'canon','2-chronicles',36,22,'free',
      E'*Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) spoken by the mouth of Jeremiah might be accomplished, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom* (2 Chronicles 36:22). Daniel''s closing line — *And Daniel continued even unto the first year of king Cyrus* (Daniel 1:21) — points to this very deliverance. The remnant outlasts Babylon and lives to see the word of Jeremiah fulfilled and the captivity ended.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat',
       E'Daniel purposed in his heart that he would not defile himself with the king''s meat',
       E'In the heart of pagan Babylon, under the king who appointed *a daily provision of the king''s meat, and of the wine which he drank* (Daniel 1:5), the faithful exile draws a line: *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself* (Daniel 1:8). This is the Torah''s dietary holiness kept in captivity — the clean/unclean distinction not as a defunct ordinance but as the living mark of a holy people: *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves with any manner of creeping thing* (Leviticus 11:44), *ye shall therefore be holy, for I am holy* (11:45). Deuteronomy frames it by election: *thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself* (Deuteronomy 14:2); *Thou shalt not eat any abominable thing* (14:3). To refuse the king''s table was to refuse assimilation — to hold the covenant identity the very name-change (Daniel to Belteshazzar) was meant to bury. Paul names the same set-apartness for the scattered people: *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). And Yahuah vindicated the stand: after ten days of pulse and water *their countenances appeared fairer and fatter in flesh than all the children which did eat the portion of the king''s meat* (Daniel 1:15). The Torah is not the captivity''s casualty — it is the holiness that survives the captivity.',
       sv.verse_id, ev.verse_id, 'free', 30000
  FROM _s306_dan01_lookup sv, _s306_dan01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-1-the-children-of-yahudah-carried-to-babylon',
       E'The children of Yahudah carried to Babylon — the exile-judgment, the seed preserved',
       E'The book opens on the judgment foretold: *In the third year of the reign of Jehoiakim king of Yahudah (Judah) came Nebuchadnezzar king of Babylon unto Jerusalem, and besieged it. And Yahuah (Lord) gave Jehoiakim king of Yahudah (Judah) into his hand, with part of the vessels of the house of Elohim (God): which he carried into the land of Shinar to the house of his god* (Daniel 1:1-2). This is no accident of empire — it is the Deuteronomy 28 covenant-curse coming to pass for covenant-breaking: *Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known* (Deuteronomy 28:36); *Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (28:64). The curse is the exile, NEVER the Torah itself — the instruction was the covenant life, and the breaking of it brought the scattering. Jeremiah named the rod and the term: *Nebuchadrezzar the king of Babylon, my servant* (Jeremiah 25:9), *these nations shall serve the king of Babylon seventy years* (25:11); and the chronicler records the vessels'' fate — *Nebuchadnezzar also carried of the vessels of the house of Yahuah (LORD) to Babylon, and put them in his temple at Babylon* (2 Chronicles 36:7). Yet through the judgment the seed is preserved: *the children of Yashar''el (Israel), and of the king''s seed* (Daniel 1:3), *the children of Yahudah (Judah)* (1:6), are carried alive into Babylon, their names changed to bury their identity — Daniel to Belteshazzar, Hananiah to Shadrach, Mishael to Meshach, Azariah to Abed-nego (1:7) — but their covenant kept (THREAD 1) and the remnant raised up to outlast the empire (THREAD 4).',
       sv.verse_id, ev.verse_id, 'free', 30003
  FROM _s306_dan01_lookup sv, _s306_dan01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★) — Sirach member -> extras
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom',
       E'Elohim gave them knowledge and skill in all learning and wisdom',
       E'The four were schooled in *the learning and the tongue of the Chaldeans* (Daniel 1:4), but the wisdom that set them apart was not the empire''s art — it was a gift: *As for these four children, Elohim (God) gave them knowledge and skill in all learning and wisdom: and Daniel had understanding in all visions and dreams* (Daniel 1:17), so that *in all matters of wisdom and understanding, that the king enquired of them, he found them ten times better than all the magicians and astrologers that were in all his realm* (1:20). This is the Tanakh''s own doctrine of wisdom: *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). It is the gift Yahuah gave Solomon — *I have given thee a wise and an understanding heart; so that there was none like thee before thee* (1 Kings 3:12). It is the standing invitation of the apostolic word: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). And the restored witness opens on the same confession: *All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1), given *to them that love him* (1:10). The four who kept Yahuah''s covenant in their very bodies (THREAD 1) were granted the understanding that comes from him alone — and were found, among all the king''s sages, without equal.',
       sv.verse_id, ev.verse_id, 'extras', 30006
  FROM _s306_dan01_lookup sv, _s306_dan01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-1-yahuah-was-with-the-remnant-that-outlasted-the-empire',
       E'Yahuah was with the remnant — favour like Yoseph''s, and Daniel outlasted the empire',
       E'In the captor''s house, the faithful exile is carried by the favour of God: *Now Elohim (God) had brought Daniel into favour and tender love with the prince of the eunuchs* (Daniel 1:9). It is the Yoseph (Joseph) pattern exactly — *And Yahuah (LORD) was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian* (Genesis 39:2); *But Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison* (Genesis 39:21). The same presence that prospered Yoseph in Egypt prospers Daniel in Babylon — the captive raised up in the land of his captivity. And the chapter closes by marking how long that providence held: *And Daniel continued even unto the first year of king Cyrus* (Daniel 1:21). That date is the deliverance: *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) spoken by the mouth of Jeremiah might be accomplished, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom* (2 Chronicles 36:22) — *let him go up* (36:23). The remnant outlasts the empire that carried it off. Babylon took the vessels and changed the names, but Daniel was still standing when Babylon fell and Cyrus sent the captives home.',
       sv.verse_id, ev.verse_id, 'free', 30009
  FROM _s306_dan01_lookup sv, _s306_dan01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye shall therefore sanctify yourselves, and ye shall be holy; for I am holy: neither shall ye defile yourselves* (Leviticus 11:44) — the dietary holiness Daniel keeps in Babylon; clean food STANDS, not abolished.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye shall therefore be holy, for I am holy* (Leviticus 11:45) — the God who redeemed Yashar''el (Israel) out of Egypt is the One whose holiness the exile honours at the pagan king''s table.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thou art an holy people unto Yahuah Elohayka (the LORD thy God)... a peculiar people unto himself* (Deuteronomy 14:2) — refusing the king''s meat = refusing assimilation; holding the covenant identity the name-change tried to bury.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not eat any abominable thing* (Deuteronomy 14:3) — the plain command behind Daniel''s purpose not to defile himself with the king''s table.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing* (2 Corinthians 6:17) — Paul names the same set-apartness Daniel lived; the scattered people kept distinct in a pagan world.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-daniel-purposed-not-to-defile-himself-with-the-kings-meat'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Nebuchadnezzar also carried of the vessels of the house of Yahuah (LORD) to Babylon* (2 Chronicles 36:7) — the same vessels Daniel 1:2 records carried into the house of the pagan god.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-the-children-of-yahudah-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Nebuchadrezzar the king of Babylon, my servant* (Jeremiah 25:9) — Babylon is the rod Yahuah raises against Jerusalem; the besieging of 1:1 is the prophesied stroke, not the empire''s own glory.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-the-children-of-yahudah-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11) — the measured term of the exile that opens here; Daniel will later read these very words (Daniel 9:2).'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-the-children-of-yahudah-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) shall bring thee, and thy king... unto a nation which neither thou nor thy fathers have known* (Deuteronomy 28:36) — the exile-curse for covenant-breaking, fulfilled in the carrying to Shinar; NEVER the Torah itself as curse.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-the-children-of-yahudah-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) shall scatter thee among all people* (Deuteronomy 28:64) — the two-house scattering in motion as the children of Yahudah (Judah) are carried to Babylon; yet the seed is preserved to be gathered.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-the-children-of-yahudah-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★) — Sirach is extras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — the wisdom of the four was no Chaldean art but the gift of Yahuah himself.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I have given thee a wise and an understanding heart; so that there was none like thee* (1 Kings 3:12) — as Yahuah gave Solomon, so he gave the four; none was found like them before the king (Daniel 1:19).'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5) — the standing promise; the gift Elohim gave the four is offered to all who ask in faith.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *All wisdom comes from Yahuah (God), and is with him for ever* (Ecclesiasticus 1:1) — the restored witness opens on the very truth Daniel 1:17 displays; wisdom is Yahuah''s to give, *to them that love him*.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-elohim-gave-them-knowledge-and-skill-in-all-wisdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) was with Joseph, and shewed him mercy, and gave him favour in the sight of the keeper of the prison* (Genesis 39:21) — the Yoseph (Joseph) pattern; the same hand brings Daniel into favour with the prince of the eunuchs.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-yahuah-was-with-the-remnant-that-outlasted-the-empire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Yahuah (LORD) was with Joseph, and he was a prosperous man* (Genesis 39:2) — Yahuah''s presence prospering the captive in the captor''s house; the template for Daniel in Babylon.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=39 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-yahuah-was-with-the-remnant-that-outlasted-the-empire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *in the first year of Cyrus king of Persia... Yahuah (LORD) stirred up the spirit of Cyrus* (2 Chronicles 36:22) — the very date Daniel 1:21 marks; the remnant outlasts Babylon and sees the captivity ended.'
  FROM cross_reference_threads t
  JOIN _s306_dan01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=1 AND sv.verse_number=21
  JOIN _s306_dan01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-1-yahuah-was-with-the-remnant-that-outlasted-the-empire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_2.sql (Daniel 2) -----
-- Chapter: Daniel 2 — Nebuchadnezzar's dream of the great image; THE STONE CUT OUT WITHOUT HANDS that
-- smites the image on its feet and becomes a great mountain filling the whole earth; the Elohim (God) of
-- heaven sets up a kingdom which shall NEVER be destroyed and shall stand for ever; Daniel's blessing
-- (he changeth the times and the seasons, removeth and setteth up kings, giveth wisdom); the Elohim (God)
-- in heaven that revealeth secrets; the succession of world-empires (gold/silver/brass/iron+clay) that
-- leads to the beasts of Daniel 7. A ★ FRAMEWORK-KEYSTONE chapter: the everlasting kingdom of the Formed Son.
-- Tag: dan02   Temp view: _s306_dan02_lookup
-- Sort band: base 30025, step 3 -> threads at 30025, 30028, 30031, 30034, 30037 (5 threads)
-- Source of EVERY row: 'canon','daniel',2,v
--
-- Daniel 2 coverage:
--   v.1-16 (Nebuchadnezzar's troubled dream; the wise men of Babylon cannot shew it; the decree to slay
--          them; Daniel desires time)
--        NT:     none warranted (narrative setup; the helplessness of the magicians frames the secrets-thread)
--        Extras: none warranted
--        Tanakh: held in prose — the Joseph/Daniel parallel (Genesis 41, none can interpret) belongs to THREAD 3
--   v.17-19 (Daniel and his fellows desire mercies of the Elohim (God) of heaven concerning this SECRET;
--          the secret revealed in a night vision)
--        NT:     none separate (the revealing belongs to THREAD 3 with v.28,47)
--        Extras: none warranted
--        Tanakh: the secret revealed = the Most High alone reveals (THREAD 3)
--   ★ v.20-23 (Daniel's blessing: Blessed be the name of Elohim (God) for ever... he changeth the times and
--          the seasons; he removeth kings, and setteth up kings; he giveth wisdom unto the wise)
--        NT:     ★ James 1:5 (if any of you lack wisdom, let him ask of Elohim) — THREAD 2
--        Extras: none warranted (clean canon weave; no extras forced)
--        Tanakh: ★ Job 12:16-22 (with him is strength and wisdom... he looseth the bond of kings), ★ Psalm
--                75:6-7 (Elohim is the judge: he putteth down one, and setteth up another), Proverbs 2:6
--                (Yahuah giveth wisdom) — THREAD 2
--   ★ v.28-30,47 (there is an Elohim (God) in heaven that revealeth secrets; this secret is not revealed for
--          any wisdom that I have; a revealer of secrets)
--        NT:     none warranted (Tanakh/Joseph weave carries it; held to ch.4/7 for NT apocalyptic)
--        Extras: none warranted
--        Tanakh: ★ Amos 3:7 (he revealeth his secret unto his servants the prophets), Deuteronomy 29:29 (the
--                secret things belong unto Yahuah), ★ Genesis 41:16,25,39 (the Joseph pattern — It is not in
--                me: Elohim shall give Pharaoh an answer) — THREAD 3
--   v.31-43 (the great image — head of gold, breast/arms of silver, belly/thighs of brass, legs of iron,
--          feet iron+clay; the succession of world-empires)
--        NT:     none warranted distinct (held; the everlasting-kingdom forward-weave is THREAD 1)
--        Extras: none warranted
--        Tanakh: ★ Daniel 7:13-14,27 (the lateral tie — the four metals become the four beasts; the
--                everlasting kingdom given to the Son and to the saints) — THREAD 4
--   ★★★ v.34-35,44-45 (a STONE CUT OUT WITHOUT HANDS smote the image upon his feet... became a great
--          mountain, and filled the whole earth; the Elohim (God) of heaven shall set up a kingdom, which
--          shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall
--          stand for ever)
--        NT:     ★★★ Revelation 11:15 (the kingdoms of this world are become the kingdoms of our Lord, and of
--                his Messiah), ★★ Matthew 21:44 + Luke 20:18 (whosoever shall fall on this stone shall be
--                broken... it will grind him to powder), ★★ 1 Peter 2:4,6,7 (a living stone... a chief corner
--                stone, elect, precious), Luke 1:32-33 (the throne of his father David... of his kingdom
--                there shall be no end) — THREAD 1
--        Extras: none warranted (clean canon-NT weave; no extras forced)
--        Tanakh: ★★ Psalm 118:22 (the stone which the builders refused is become the head stone of the
--                corner), ★ Isaiah 28:16 (a sure foundation), ★★ Daniel 7:14,27 (the everlasting kingdom of
--                the Son and the saints) — THREAD 1
--   ★ v.45 (the dream is certain, and the interpretation thereof sure)
--        NT:     none warranted (the prophetic word stands; NT certainty woven in prose)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 46:9-10 (declaring the end from the beginning... my counsel shall stand),
--                Numbers 23:19 (hath he said, and shall he not do it?) — THREAD 5
--   v.46-49 (Nebuchadnezzar honours Daniel; Daniel made ruler; Shadrach, Meshach, Abed-nego set over the
--          province)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none separate (the Joseph-exaltation pattern woven into THREAD 3 prose, Genesis 41:39-41)
--
-- Threads (slug — target libraries):
--   1. daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom — NT (Revelation 11, Matthew 21,
--      Luke 20, 1 Peter 2, Luke 1) + Tanakh (Psalm 118, Isaiah 28, Daniel 7) [free]
--      (★★★ THE central keystone thread; the kingdom not of human hands; the Formed Son's everlasting reign)
--   2. daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings — NT (James 1) +
--      Tanakh (Job 12, Psalm 75, Proverbs 2) [free]
--      (★ Daniel's blessing; the Most High sovereign over kingdoms and the appointed times; wisdom given)
--   3. daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets — Tanakh (Amos 3, Deuteronomy 29,
--      Genesis 41) [free]
--      (★ revelation belongs to the Most High alone; the Joseph/Daniel dream-interpreter parallel)
--   4. daniel-2-the-image-of-the-kingdoms-and-the-beasts-of-daniel-seven — Tanakh (Daniel 7) [free]
--      (★ the four metals = the four world-empires that become the four beasts; the everlasting kingdom given)
--   5. daniel-2-the-dream-is-certain-and-the-interpretation-thereof-sure — Tanakh (Isaiah 46, Numbers 23) [free]
--      (★ the prophetic word stands; what the great Elohim hath shewn shall surely come to pass)
--
-- Framing notes:
--   ★★★ THE STONE CUT OUT WITHOUT HANDS (THREAD 1): *Thou sawest till that a stone was cut out without hands,
--      which smote the image upon his feet that were of iron and clay, and brake them to pieces... and the
--      stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:34-35), and
--      its interpretation: *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom,
--      which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall
--      stand for ever* (Daniel 2:44). The stone is CUT WITHOUT HANDS — not of human empire, not of flesh-built
--      kingdom; it is the kingdom of the Formed Son, set up by the Elohim (God) of heaven himself. John hears
--      the consummation: *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah
--      (Christ); and he shall reign for ever and ever* (Revelation 11:15). Messiah names himself the Stone:
--      *whosoever shall fall on this stone shall be broken: but on whomsoever it shall fall, it will grind him
--      to powder* (Matthew 21:44; Luke 20:18) — the very stone that grinds the image to chaff. He is the
--      rejected-stone-become-head — *The stone which the builders refused is become the head stone of the
--      corner* (Psalm 118:22), *a sure foundation* (Isaiah 28:16), *a living stone... a chief corner stone,
--      elect, precious* (1 Peter 2:4,6). And the everlasting kingdom is given to the Son and to his people —
--      *his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14); *the throne of his
--      father David... of his kingdom there shall be no end* (Luke 1:32-33). NOT replacement: the everlasting
--      kingdom is the restored two-house people of Yashar'el under their Messiah, the saints of the Most High
--      (Daniel 7:27).
--   ★ HE CHANGETH THE TIMES AND THE SEASONS (THREAD 2): Daniel's doxology — *Blessed be the name of Elohim
--      (God) for ever and ever: for wisdom and might are his: And he changeth the times and the seasons: he
--      removeth kings, and setteth up kings: he giveth wisdom unto the wise* (Daniel 2:20-21). The Most High
--      is sovereign over the kingdoms (the very point the dream makes) AND over the appointed times. Job sings
--      it — *With him is strength and wisdom... He looseth the bond of kings* (Job 12:16-18); the Psalm — *But
--      Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7); and wisdom is his
--      to give — *For Yahuah (LORD) giveth wisdom* (Proverbs 2:6), *If any of you lack wisdom, let him ask of
--      Elohim (God)* (James 1:5), exactly as Daniel asked and received (2:18-19,23).
--   ★ THERE IS AN ELOHIM IN HEAVEN THAT REVEALETH SECRETS (THREAD 3): *there is a Elohim (God) in heaven that
--      revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days*
--      (Daniel 2:28); *a revealer of secrets* (2:47). Revelation belongs to the Most High alone — *Surely
--      Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the
--      prophets* (Amos 3:7); *The secret things belong unto Yahuah Eloheinu (the LORD our God)* (Deuteronomy
--      29:29). The Joseph/Daniel parallel is exact: a Hebrew captive alone can read a heathen king's dream
--      because *It is not in me: Elohim (God) shall give Pharaoh an answer of peace* (Genesis 41:16), *Elohim
--      (God) hath shewed Pharaoh what he is about to do* (41:25) — and both are exalted ruler over the realm
--      (41:39-41; Daniel 2:48). Daniel says the same: *this secret is not revealed to me for any wisdom that I
--      have* (2:30).
--   ★ THE IMAGE AND THE BEASTS (THREAD 4): the lateral tie — the four metals of the image (gold, silver,
--      brass, iron+clay, Daniel 2:32-33) are the same four world-empires that return as the four beasts of
--      Daniel 7, and both visions end in the same everlasting kingdom: *one like the Son of Adam came with the
--      clouds of heaven... And there was given him dominion, and glory, and a kingdom... his dominion is an
--      everlasting dominion* (Daniel 7:13-14); *the kingdom and dominion... shall be given to the people of the
--      saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). The stone
--      that fills the earth (2:35,44) IS that everlasting kingdom of the Son and the saints.
--   ★ THE DREAM IS CERTAIN, THE INTERPRETATION SURE (THREAD 5): *the great Elohim (God) hath made known to the
--      king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure*
--      (Daniel 2:45). The prophetic word stands because the One who speaks it cannot fail — *Declaring the end
--      from the beginning... My counsel shall stand, and I will do all my pleasure* (Isaiah 46:10); *hath he
--      said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19).
--   VERSES WITH NO SEPARATE ADD: v.1-16 (the troubled dream and helpless magicians — the secrets-thread frame,
--      Joseph parallel held to THREAD 3), v.17-19 (the secret revealed — THREAD 3), v.46-49 (Daniel exalted —
--      the Joseph-exaltation pattern woven into THREAD 3 prose, Genesis 41:39-41). All recorded.

CREATE TEMP VIEW _s306_dan02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): the stone cut out without hands — the everlasting kingdom
    ('canon','daniel',2,44,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). This is the consummation of Daniel''s stone-kingdom: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). The kingdom not built by human hands breaks all the empires and remains alone — the everlasting reign of Yahuah and of the Formed Son, his Messiah.'),
    ('canon','daniel',2,45,'canon','matthew',21,44,'free',
      E'*And whosoever shall fall on this stone shall be broken: but on whomsoever it shall fall, it will grind him to powder* (Matthew 21:44). Messiah names himself the very Stone of Daniel''s dream — the one *cut out of the mountain without hands* that *brake in pieces the iron, the brass, the clay, the silver, and the gold* (Daniel 2:45). He breaks the kingdoms that strike against him and grinds them to chaff, exactly as the stone ground the image to powder the wind carried away (2:35).'),
    ('canon','daniel',2,35,'canon','luke',20,18,'free',
      E'*Whosoever shall fall upon that stone shall be broken; but on whomsoever it shall fall, it will grind him to powder* (Luke 20:18). After naming himself the rejected stone *become the head of the corner* (Luke 20:17), Messiah is the falling stone of Daniel''s vision — the one that *became a great mountain, and filled the whole earth* after it ground the image *like the chaff of the summer threshingfloors* (Daniel 2:35). The same Stone is salvation to those who trust him and ruin to those it falls upon.'),
    ('canon','daniel',2,34,'canon','1-peter',2,6,'free',
      E'*Wherefore also it is contained in the scripture, Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6). The stone *cut out without hands* (Daniel 2:34) is the chosen corner stone laid in Zion — not quarried by human empire but set by the Elohim (God) of heaven. The same Stone that smites the image is the precious foundation on which the believing are built up a spiritual house (1 Peter 2:4-5).'),
    ('canon','daniel',2,35,'canon','psalms',118,22,'free',
      E'*The stone which the builders refused is become the head stone of the corner* (Psalm 118:22). The stone *cut out without hands* that *became a great mountain, and filled the whole earth* (Daniel 2:35) is the rejected-stone-become-head — refused by the builders of the kingdoms of men, yet made the chief corner of the everlasting kingdom. What the empires would not have becomes the mountain that fills all the earth.'),
    ('canon','daniel',2,44,'canon','isaiah',28,16,'free',
      E'*Therefore thus saith Adonai Yahuah (the Lord GOD), Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The kingdom that *shall never be destroyed... and shall stand for ever* (Daniel 2:44) rests on the Stone Yahuah himself lays in Zion — a *sure foundation*. The everlasting kingdom is sure because its corner stone is sure.'),
    ('canon','daniel',2,44,'canon','daniel',7,14,'free',
      E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). Daniel''s own later vision names the everlasting kingdom of the stone: the kingdom *which shall never be destroyed... and shall stand for ever* (Daniel 2:44) is *given* to the one *like the Son of Adam* who comes with the clouds — the Formed Son who took flesh, whose dominion does not pass away.'),
    ('canon','daniel',2,44,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). Gabriel announces the everlasting kingdom of Daniel''s stone in the womb of Miriam: the kingdom that *shall never be destroyed... and it shall stand for ever* (Daniel 2:44) is the throne of David given to the Son — *of his kingdom there shall be no end*. The reign is over *the house of Jacob*, the restored two-house people, not a kingdom severed from Yashar''el (Israel).'),

    -- THREAD 2 (★): he changeth the times and the seasons; he removeth and setteth up kings
    ('canon','daniel',2,21,'canon','psalms',75,7,'free',
      E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). The Psalm sings Daniel''s blessing — *he removeth kings, and setteth up kings* (Daniel 2:21). Promotion comes neither from east nor west (Psalm 75:6) but from the Most High alone, who is sovereign over every throne the dream-image displays. The empires rise and fall at his word.'),
    ('canon','daniel',2,21,'canon','job',12,18,'free',
      E'*He looseth the bond of kings, and girdeth their loins with a girdle* (Job 12:18). Job confesses what Daniel blesses — *he removeth kings, and setteth up kings* (Daniel 2:21). The One *with him is strength and wisdom* (Job 12:16) leads counsellors away spoiled and pours contempt on princes (12:17,21); the kingdoms of the image stand and fall only as he wills.'),
    ('canon','daniel',2,22,'canon','job',12,22,'free',
      E'*He discovereth deep things out of darkness, and bringeth out to light the shadow of death* (Job 12:22). Daniel blesses the same — *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* (Daniel 2:22). The Most High who sets up and removes kings is the One who brings the hidden into light; the king''s secret dream is no secret to him.'),
    ('canon','daniel',2,21,'canon','proverbs',2,6,'free',
      E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). Daniel blesses the Giver — *he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). The wisdom by which Daniel reads the dream is not his own but received; *I thank thee, and praise thee, O thou Elohim (God) of my fathers, who hast given me wisdom and might* (2:23).'),
    ('canon','daniel',2,23,'canon','james',1,5,'free',
      E'*If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). Daniel does exactly this — he and his fellows *desire mercies of the Elohim (God) of heaven concerning this secret* (Daniel 2:18), and the wisdom is given: *who hast given me wisdom and might, and hast made known unto me now what we desired of thee* (Daniel 2:23). Wisdom asked of the Most High is wisdom received.'),

    -- THREAD 3 (★): there is an Elohim in heaven that revealeth secrets — the Joseph/Daniel parallel
    ('canon','daniel',2,28,'canon','amos',3,7,'free',
      E'*Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (Amos 3:7). There is *a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). Revelation belongs to the Most High alone, and he unveils his counsel to his servants — the latter-day secret given to Daniel is the prophet''s portion Amos names.'),
    ('canon','daniel',2,28,'canon','deuteronomy',29,29,'free',
      E'*The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law* (Deuteronomy 29:29). The dream is a *secret thing* belonging to Yahuah until he reveals it — *there is a Elohim (God) in heaven that revealeth secrets* (Daniel 2:28). What he discloses he gives that his people may walk in his word; the revealing is never idle.'),
    ('canon','daniel',2,30,'canon','genesis',41,16,'free',
      E'*And Joseph answered Pharaoh, saying, It is not in me: Elohim (God) shall give Pharaoh an answer of peace* (Genesis 41:16). Daniel answers Nebuchadnezzar in the very words of Joseph: *this secret is not revealed to me for any wisdom that I have more than any living* (Daniel 2:30). Two Hebrew captives, alone able to read a heathen king''s dream, both refuse the credit and point to the Elohim (God) of heaven who alone reveals.'),
    ('canon','daniel',2,28,'canon','genesis',41,25,'free',
      E'*And Joseph said unto Pharaoh, The dream of Pharaoh is one: Elohim (God) hath shewed Pharaoh what he is about to do* (Genesis 41:25). Joseph and Daniel say the same thing to the same kind of king: *there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). The dream of the throne is the disclosure of *what he is about to do* — and only the Most High can give it.'),
    ('canon','daniel',2,48,'canon','genesis',41,39,'free',
      E'*And Pharaoh said unto Joseph, Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* (Genesis 41:39). The Joseph pattern closes the same way Daniel''s does — the heathen king exalts the Hebrew interpreter to rule the realm: *Then the king made Daniel a great man, and gave him many great gifts, and made him ruler over the whole province of Babylon* (Daniel 2:48). The Most High who reveals the secret also lifts up his servant before the nations.'),

    -- THREAD 4 (★): the image of the kingdoms and the beasts of Daniel 7
    ('canon','daniel',2,38,'canon','daniel',7,13,'free',
      E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13). The succession of empires shown as metals in the image — *Thou art this head of gold* (Daniel 2:38) and the inferior kingdoms after — returns in Daniel 7 as the four beasts, and both visions climax in the same scene: the Son of Adam who receives the everlasting kingdom from the Ancient of days.'),
    ('canon','daniel',2,44,'canon','daniel',7,27,'free',
      E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). The stone-kingdom that *shall never be destroyed... and shall stand for ever* (Daniel 2:44) is the same everlasting kingdom given in Daniel 7 — given to the Son and to *the people of the saints of the El Elyon (most High)*, the restored two-house people of Yashar''el (Israel) under their Messiah.'),

    -- THREAD 5 (★): the dream is certain, and the interpretation thereof sure
    ('canon','daniel',2,45,'canon','isaiah',46,10,'free',
      E'*Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure* (Isaiah 46:10). The reason *the dream is certain, and the interpretation thereof sure* (Daniel 2:45) is that the One who shewed it declares the end from the beginning and cannot fail: *My counsel shall stand*. The march of the empires and the rise of the everlasting kingdom are fixed by his unbreakable word.'),
    ('canon','daniel',2,45,'canon','numbers',23,19,'free',
      E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). *The great Elohim (God) hath made known to the king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure* (Daniel 2:45). What the Most High has spoken he will surely perform; the prophetic word of the dream stands as firm as his own faithfulness.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom',
       E'The stone cut out without hands — the kingdom that shall never be destroyed',
       E'At the feet of the great image — the succession of the world-empires — Daniel sees the turning of all history: *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces. Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:34-35). And the interpretation: *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). Mark the words *without hands* — this kingdom is not quarried by human empire, not built by flesh or sword; it is set up by the Elohim (God) of heaven himself. It is the kingdom of the Formed Son. John hears its consummation when the seventh trumpet sounds: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). Messiah names himself the very Stone: *whosoever shall fall on this stone shall be broken: but on whomsoever it shall fall, it will grind him to powder* (Matthew 21:44; Luke 20:18) — the stone that grinds the image to chaff. He is the rejected-stone-become-head: *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22); the *sure foundation* laid in Zion (Isaiah 28:16); *a living stone, disallowed indeed of men, but chosen of Elohim (God), and precious... a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:4,6). And the everlasting kingdom is given to him and to his people: *his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14); *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). This is NOT a kingdom that replaces Yashar''el (Israel) — it is the restored two-house people, *the saints of the El Elyon (most High)* (Daniel 7:27), reigning under their Messiah, the mountain that fills the whole earth.',
       sv.verse_id, ev.verse_id, 'free', 30025
  FROM _s306_dan02_lookup sv, _s306_dan02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=34
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=2 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings',
       E'He changeth the times and the seasons; he removeth and setteth up kings',
       E'When the secret is revealed, Daniel does not run to the king — he blesses the One who gave it: *Daniel answered and said, Blessed be the name of Elohim (God) for ever and ever: for wisdom and might are his: And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding: He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* (Daniel 2:20-22). This is the very theme the dream will unfold: the Most High is sovereign over every throne in the image and over the appointed times themselves. The Psalm sings it: *For promotion cometh neither from the east, nor from the west, nor from the south. But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:6-7). Job confesses it: *With him is strength and wisdom... He looseth the bond of kings, and girdeth their loins with a girdle... He discovereth deep things out of darkness, and bringeth out to light the shadow of death* (Job 12:16,18,22). And the wisdom by which Daniel reads the dream is not his own but given — *For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — asked and received exactly as the apostle promises: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). Daniel asked mercy of the Elohim (God) of heaven concerning the secret (2:18), and gave thanks for the wisdom and might given him (2:23). The kingdoms of men rise and fall in the hand of the One who alone gives wisdom and reveals the deep things.',
       sv.verse_id, ev.verse_id, 'free', 30028
  FROM _s306_dan02_lookup sv, _s306_dan02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets',
       E'There is an Elohim (God) in heaven that revealeth secrets',
       E'The magicians, astrologers, sorcerers and Chaldeans of Babylon are helpless before the king''s demand — *There is not a man upon the earth that can shew the king''s matter... except the gods, whose dwelling is not with flesh* (Daniel 2:10-11). But there is One who does dwell with flesh through his servant: *there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28); *a revealer of secrets* (2:47). Revelation belongs to the Most High alone — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (Amos 3:7); *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us and to our children for ever, that we may do all the words of this law* (Deuteronomy 29:29). And the parallel to Joseph is exact and deliberate: a Hebrew held captive in a foreign court, alone able to read the dream of a heathen king, who refuses all credit and points to heaven. *And Joseph answered Pharaoh, saying, It is not in me: Elohim (God) shall give Pharaoh an answer of peace* (Genesis 41:16) — *The dream of Pharaoh is one: Elohim (God) hath shewed Pharaoh what he is about to do* (Genesis 41:25). Daniel says the same: *this secret is not revealed to me for any wisdom that I have more than any living, but for their sakes that shall make known the interpretation to the king* (Daniel 2:30). And both stories end the same way — the king exalts the interpreter to rule his realm: *Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* (Genesis 41:39); *Then the king made Daniel a great man, and gave him many great gifts, and made him ruler over the whole province of Babylon* (Daniel 2:48). The Most High who reveals the secret lifts up his servant before the nations.',
       sv.verse_id, ev.verse_id, 'free', 30031
  FROM _s306_dan02_lookup sv, _s306_dan02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=2 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-2-the-image-of-the-kingdoms-and-the-beasts-of-daniel-seven',
       E'The image of the kingdoms — the metals that become the beasts of Daniel 7',
       E'The dream is a map of history: *This image''s head was of fine gold, his breast and his arms of silver, his belly and his thighs of brass, His legs of iron, his feet part of iron and part of clay* (Daniel 2:32-33) — a succession of world-empires, beginning with Babylon: *Thou art this head of gold. And after thee shall arise another kingdom inferior to thee, and another third kingdom of brass... And the fourth kingdom shall be strong as iron* (Daniel 2:38-40). This same succession returns in Daniel''s later vision, no longer as a noble image but as four ravening beasts — and both visions climax in the identical scene. *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him* (Daniel 7:13), and to him the everlasting kingdom is given: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). The stone that smites the image at its feet and *became a great mountain, and filled the whole earth* (Daniel 2:35) IS this everlasting kingdom of the Son and the saints — the restored people of Yashar''el (Israel) under their Messiah. The empires of men are gold, silver, brass, and iron mixed with clay; the kingdom of the Most High is the unbreakable mountain that outlasts them all.',
       sv.verse_id, ev.verse_id, 'free', 30034
  FROM _s306_dan02_lookup sv, _s306_dan02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=2 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-2-the-dream-is-certain-and-the-interpretation-thereof-sure',
       E'The dream is certain, and the interpretation thereof sure',
       E'Daniel seals the interpretation with a guarantee that rests on the character of the One who gave it: *Forasmuch as thou sawest that the stone was cut out of the mountain without hands, and that it brake in pieces the iron, the brass, the clay, the silver, and the gold; the great Elohim (God) hath made known to the king what shall come to pass hereafter: and the dream is certain, and the interpretation thereof sure* (Daniel 2:45). The prophetic word is certain because the Most High declares the end from the beginning and cannot fail: *Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure* (Isaiah 46:10). And his word is sure because he is not a man that he should lie: *Elohim (God) is not a man, that he should lie; neither the son of man, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). The whole march of the empires and the rising of the everlasting kingdom are fixed by his unbreakable word; what the great Elohim (God) has shewn shall surely come to pass.',
       sv.verse_id, ev.verse_id, 'free', 30037
  FROM _s306_dan02_lookup sv, _s306_dan02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=45
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=2 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the consummation of the stone-kingdom of Daniel 2:44; the everlasting reign at the seventh trumpet.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=44
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *whosoever shall fall on this stone shall be broken: but on whomsoever it shall fall, it will grind him to powder* (Matthew 21:44) — Messiah names himself the Stone of Daniel 2:45 that grinds the image to chaff.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=45
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Whosoever shall fall upon that stone shall be broken; but on whomsoever it shall fall, it will grind him to powder* (Luke 20:18) — the falling stone of Daniel 2:35 that became a great mountain and filled the whole earth.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=35
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Behold, I lay in Sion a chief corner stone, elect, precious: and he that believeth on him shall not be confounded* (1 Peter 2:6) — the stone cut without hands (Daniel 2:34) is the chosen corner stone, not quarried by human empire.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=34
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *The stone which the builders refused is become the head stone of the corner* (Psalm 118:22) — the stone that became a great mountain and filled the whole earth (Daniel 2:35) is the rejected-stone-become-head.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=35
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *a tried stone, a precious corner stone, a sure foundation* (Isaiah 28:16) — the kingdom that shall stand for ever (Daniel 2:44) rests on the sure foundation Yahuah lays in Zion.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=44
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14) — the everlasting kingdom of Daniel 2:44 given to the one like the Son of Adam, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=44
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the everlasting kingdom is the throne of David over the restored house of Jacob, not severed from Yashar''el (Israel).'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=44
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-stone-cut-out-without-hands-the-everlasting-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7) — the Psalm sings Daniel 2:21, the Most High sovereign over every throne in the image.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He looseth the bond of kings, and girdeth their loins with a girdle* (Job 12:18) — Job confesses what Daniel 2:21 blesses; the One with whom is strength and wisdom raises and removes kings.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He discovereth deep things out of darkness, and bringeth out to light the shadow of death* (Job 12:22) — Daniel 2:22, the Most High who reveals the deep and secret things, with whom the light dwelleth.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=22
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For Yahuah (LORD) giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6) — Daniel 2:21, the wisdom Daniel reads the dream by is received, not his own.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally* (James 1:5) — Daniel does exactly this (2:18), and the wisdom is given (2:23).'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-he-changeth-the-times-and-the-seasons-he-removeth-and-setteth-up-kings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets* (Amos 3:7) — Daniel 2:28, revelation belongs to the Most High alone and is given to his servants.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us* (Deuteronomy 29:29) — Daniel 2:28, the dream is a secret thing belonging to Yahuah until he reveals it.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *It is not in me: Elohim (God) shall give Pharaoh an answer of peace* (Genesis 41:16) — Joseph''s words are Daniel''s (2:30); the Hebrew captive refuses credit and points to heaven.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The dream of Pharaoh is one: Elohim (God) hath shewed Pharaoh what he is about to do* (Genesis 41:25) — Daniel 2:28, the dream of the throne is the disclosure of what the Most High is about to do.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* (Genesis 41:39) — the Joseph-exaltation pattern; the king lifts up the interpreter to rule (Daniel 2:48).'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=48
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-there-is-an-elohim-in-heaven-that-revealeth-secrets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13) — the metals of the image (Daniel 2:38) return as the beasts of ch.7, climaxing in the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=38
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-image-of-the-kingdoms-and-the-beasts-of-daniel-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27) — the stone-kingdom of Daniel 2:44 given to the Son and the restored two-house saints.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=44
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-image-of-the-kingdoms-and-the-beasts-of-daniel-seven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Declaring the end from the beginning... My counsel shall stand, and I will do all my pleasure* (Isaiah 46:10) — the dream is certain (Daniel 2:45) because the One who shewed it declares the end from the beginning.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=45
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-dream-is-certain-and-the-interpretation-thereof-sure'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19) — the interpretation is sure (Daniel 2:45) because the Most High is not a man that he should lie.'
  FROM cross_reference_threads t
  JOIN _s306_dan02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=2 AND sv.verse_number=45
  JOIN _s306_dan02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-2-the-dream-is-certain-and-the-interpretation-thereof-sure'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_3.sql (Daniel 3) -----
-- Chapter: Daniel 3 — the golden image in the plain of Dura; the three Hebrews refuse to bow;
-- *our Elohim (God) whom we serve is able to deliver us... But if not... we will not serve thy gods*;
-- the burning fiery furnace heated seven times; the FOURTH in the fire *like the Son of Elohim (God)*;
-- the angel sent to deliver the servants that trusted in him; Nebuchadnezzar's decree to the Most High.
-- The faithful remnant keeping the first two commandments unto death — and the image-of-the-beast
-- pattern of Revelation previewed in the plain of Dura.
-- Tag: dan03   Session: s306   Temp view: _s306_dan03_lookup
-- Sort band: base 30050, step 3 -> threads at 30050, 30053, 30056, 30059 (4 threads)
-- Source of EVERY row: 'canon','daniel',3,v
--
-- Daniel 3 coverage:
--   v.1-7 (Nebuchadnezzar made an image of gold... fall down and worship the golden image... cast into
--          the midst of a burning fiery furnace)
--        NT:     ★ Revelation 13:15 / 14:9,11 (the image of the beast which all are compelled to worship
--                on pain of death) — held to THREAD 1, where the refusal is voiced (v.18)
--        Extras: none warranted
--        Tanakh: ★ Exodus 20:3-5 (no other gods, no graven image) — the law the decree assaults; held to
--                THREAD 1 (the refusal)
--   v.8-15 (the Chaldeans accuse the Yahudim (Jews)... they serve not thy gods... who is that Elohim (God)
--          that shall deliver you out of my hands?)
--        NT:     none warranted distinct (the accusation/threat; the answer is THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (Nebuchadnezzar's boast *who is that Elohim... that shall deliver you* is
--                answered in v.17 — held to THREAD 1)
--   ★ v.16-18 (our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace... But
--          if not... we will not serve thy gods, nor worship the golden image)
--        NT:     ★★ Revelation 13:15 (image of the beast — worship or be killed), ★★ Revelation 14:9,11
--                (worship the beast and his image... no rest day nor night), ★ Matthew 10:28 (fear not them
--                which kill the body) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Exodus 20:3 (no other gods), ★★ Exodus 20:4 (no graven image), ★ Exodus 20:5 (bow not
--                down... for I am a jealous Elohim) — THREAD 1 (the first two commandments kept unto death)
--   v.19-23 (the furnace heated seven times more... bound... cast into the midst of the burning fiery
--          furnace; the flame slew the men that took them up)
--        NT:     none warranted distinct (the casting-in; deliverance answered THREAD 3)
--        Extras: none warranted
--        Tanakh: none separate
--   ★★ v.24-25 (Lo, I see four men loose, walking in the midst of the fire... the form of the fourth is
--          like the Son of Elohim (God))
--        NT:     none warranted distinct (the Christophany itself; NT walk-through-fire weave is Tanakh
--                Isaiah 43:2, bound laterally)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 43:2 (when thou walkest through the fire, thou shalt not be burned; neither
--                shall the flame kindle upon thee — *I will be with thee*) — THREAD 2 (the Formed Son who
--                walks with his own in the fire)
--   v.26-27 (ye servants of the El Elyon (most high God), come forth... the fire had no power, nor was an
--          hair of their head singed)
--        NT:     held to THREAD 3 (the deliverance; Hebrews 11:34)
--        Extras: none warranted
--        Tanakh: none separate
--   v.28 (Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and
--          delivered his servants that trusted in him)
--        NT:     ★ Hebrews 11:34 (quenched the violence of fire) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Psalm 34:7 (the angel of Yahuah (LORD) encampeth round about them that fear him, and
--                delivereth them) — THREAD 3
--   v.29 (I make a decree, That every people... which speak any thing amiss against the Elohim (God) of
--          Shadrach... because there is no other Elohim (God) that can deliver after this sort)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Daniel 2:47 (your Elohim is a Elohim of gods), ★ Daniel 4:37 (I Nebuchadnezzar praise...
--                the King of heaven), ★ Daniel 6:26 (Darius: men tremble and fear before the Elohim of
--                Daniel) — THREAD 4 (the pagan king compelled to confess the Most High)
--   v.30 (the king promoted Shadrach, Meshach, and Abed-nego) — narrative close; none warranted
--
-- Threads (slug — target libraries):
--   1. daniel-3-but-if-not-we-will-not-serve-thy-gods — NT (Revelation 13, Revelation 14, Matthew 10)
--        + Tanakh (Exodus 20) [free]
--      (★ the faithful remnant keeping the first two commandments unto death; the image-of-the-beast pattern)
--   2. daniel-3-the-form-of-the-fourth-is-like-the-son-of-elohim — Tanakh (Isaiah 43) [free]
--      (★★ the Formed Son present in the furnace; *when thou walkest through the fire... I will be with thee*)
--   3. daniel-3-he-hath-sent-his-angel-and-delivered-his-servants — NT (Hebrews 11) + Tanakh (Psalm 34) [free]
--      (★ the angel sent to deliver; quenched the violence of fire; the angel encampeth round them that fear him)
--   4. daniel-3-there-is-no-other-elohim-that-can-deliver-after-this-sort — Tanakh (Daniel 2, 4, 6) [free]
--      (the pagan king compelled to confess the Most High — the pattern with 2:47, 4:37, 6:26)
--
-- Framing notes:
--   ★ THE FIRST TWO COMMANDMENTS UNTO DEATH (THREAD 1): the decree of Dura commands every people to
--      *fall down and worship the golden image* (3:5) on pain of *a burning fiery furnace* (3:6) — a direct
--      assault on the first two words of the covenant: *Thou shalt have no other gods before me* (Exodus
--      20:3) and *Thou shalt not make unto thee any graven image... Thou shalt not bow down thyself to
--      them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus
--      20:4-5). The three answer as the faithful remnant: *our Elohim (God) whom we serve is able to
--      deliver us from the burning fiery furnace... But if not, be it known unto thee, O king, that we will
--      not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:17-18). Obedience
--      is not contingent on rescue — *But if not* — they keep the commandment whether delivered or burned.
--      This is the very pattern Revelation previews: *he had power to give life unto the image of the
--      beast... that as many as would not worship the image of the beast should be killed* (Revelation
--      13:15); *If any man worship the beast and his image, and receive his mark... The same shall drink of
--      the wine of the wrath of Elohim (God)* (Revelation 14:9-10), *and they have no rest day nor night,
--      who worship the beast and his image* (14:11). The plain of Dura is the dress-rehearsal of the
--      image-of-the-beast and the mark; the faithful refuse the image and trust the One who can deliver —
--      *And fear not them which kill the body, but are not able to kill the soul* (Matthew 10:28).
--   ★★ THE FOURTH LIKE THE SON OF ELOHIM (THREAD 2): cast bound into the seven-times furnace, they are
--      seen *loose, walking in the midst of the fire* with a fourth: *the form of the fourth is like the
--      Son of Elohim (God)* (Daniel 3:25). This is the FORMED Son — the visible One drawn from the Formless
--      Father, the Angel of Yahuah who bears the Name, who walked with Yashar'el through the Tanakh; he is
--      Yahuah and has a Father (NOT a created angel, NOT a co-equal third person). Isaiah names exactly this
--      presence: *When thou passest through the waters, I will be with thee... when thou walkest through the
--      fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2) — spoken by
--      *Yahuah (LORD) that created thee, O Jacob, and he that formed thee, O Yashar'el (Israel)* (43:1). He
--      who formed Yashar'el is the One in the fire WITH them — bound laterally, the Tanakh's own commentary
--      on the furnace.
--   ★ THE ANGEL SENT TO DELIVER (THREAD 3): the king confesses the rescue: *Blessed be the Elohim (God)
--      of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that
--      trusted in him* (Daniel 3:28). Hebrews catalogues this very deliverance among the acts of faith —
--      *Quenched the violence of fire* (Hebrews 11:34) — and the Psalm names the encamping deliverer: *The
--      angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7).
--      The servants *trusted in him*; the angel He sent is the same Formed presence of THREAD 2.
--   THE PAGAN KING COMPELLED TO CONFESS (THREAD 4): *there is no other Elohim (God) that can deliver after
--      this sort* (Daniel 3:29) — the same compelled confession runs through the book: *your Elohim (God)
--      is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47); *Now I Nebuchadnezzar praise
--      and extol and honour the King of heaven* (Daniel 4:37); and Darius: *men tremble and fear before the
--      Elohim (God) of Daniel: for he is the living Elohim (God), and stedfast for ever* (Daniel 6:26). The
--      Most High bends the mouths of empires to confess Him.
--   VERSES WITH NO SEPARATE ADD: v.1-7 (the decree/image — the law it assaults and the beast-image it
--      previews are carried in THREAD 1, anchored at the refusal v.18); v.8-15 (the accusation and threat,
--      answered in THREAD 1); v.19-23 (the casting-in, deliverance answered THREAD 3); v.26-27 (the
--      come-forth, the fire had no power — THREAD 3); v.30 (narrative promotion). All recorded above.

CREATE TEMP VIEW _s306_dan03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): But if not — we will not serve thy gods (the first two commandments unto death)
    ('canon','daniel',3,18,'canon','exodus',20,3,'free',
      E'*Thou shalt have no other gods before me* (Exodus 20:3). The decree of Dura commands the worship of *the golden image* (Daniel 3:18); the three keep the first word of the covenant unto death — *we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). No other god is owned, whatever the furnace.'),
    ('canon','daniel',3,18,'canon','exodus',20,4,'free',
      E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). The *image of gold* (Daniel 3:1) is exactly the graven image the Torah forbids; the refusal *nor worship the golden image which thou hast set up* (Daniel 3:18) is the second commandment kept under threat of death.'),
    ('canon','daniel',3,18,'canon','exodus',20,5,'free',
      E'*Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me* (Exodus 20:5). The herald''s command to *fall down and worship* (Daniel 3:5) is the bowing the jealous Elohim forbids; *we will not serve thy gods* (Daniel 3:18) honours Him who alone is to be served.'),
    ('canon','daniel',3,18,'canon','revelation',13,15,'free',
      E'*And he had power to give life unto the image of the beast, that the image of the beast should both speak, and cause that as many as would not worship the image of the beast should be killed* (Revelation 13:15). Dura is the dress-rehearsal: an image set up, worship compelled, death for refusal. The three who *will not... worship the golden image* (Daniel 3:18) preview the faithful who refuse the image of the beast and are threatened with death for it.'),
    ('canon','daniel',3,18,'canon','revelation',14,9,'free',
      E'*And the third angel followed them, saying with a loud voice, If any man worship the beast and his image, and receive his mark in his forehead, or in his hand* (Revelation 14:9). The worship-or-burn of Dura is the same test the everlasting gospel warns against — the image and the mark. The three who refuse *the golden image which thou hast set up* (Daniel 3:18) are the pattern of those who will not worship the beast and his image.'),
    ('canon','daniel',3,18,'canon','revelation',14,11,'free',
      E'*And the smoke of their torment ascendeth up for ever and ever: and they have no rest day nor night, who worship the beast and his image, and whosoever receiveth the mark of his name* (Revelation 14:11). The furnace threatens a moment''s fire; the wrath upon image-worshippers is *for ever and ever*. The three choose the seven-times furnace over the golden image (Daniel 3:18) — the faithful who fear the right fire.'),
    ('canon','daniel',3,18,'canon','matthew',10,28,'free',
      E'*And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* (Matthew 10:28). This is the courage of *But if not... we will not serve thy gods* (Daniel 3:18): Nebuchadnezzar can heat the furnace, but the three fear the One who *is able to deliver us* (3:17) rather than the king who can only *kill the body*.'),

    -- THREAD 2 (★★): the form of the fourth is like the Son of Elohim (the Formed Son in the fire)
    ('canon','daniel',3,25,'canon','isaiah',43,2,'free',
      E'*When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2). This is the Tanakh''s own word on the furnace: the One who *formed thee, O Yashar''el (Israel)* (43:1) walks WITH his own through the fire. The fourth *like the Son of Elohim (God)* (Daniel 3:25) is that Formed presence — *I will be with thee* — and the flame *had no power* (3:27) upon them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): he hath sent his angel, and delivered his servants that trusted in him
    ('canon','daniel',3,28,'canon','hebrews',11,34,'free',
      E'*Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens* (Hebrews 11:34). Hebrews catalogues the furnace among the great acts of faith — *quenched the violence of fire* is Shadrach, Meshach, and Abed-nego, whom *the fire had no power* over (Daniel 3:27); *who hath sent his angel, and delivered his servants that trusted in him* (Daniel 3:28).'),
    ('canon','daniel',3,28,'canon','psalms',34,7,'free',
      E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). The king confesses exactly this: *who hath sent his angel, and delivered his servants that trusted in him* (Daniel 3:28). The angel of Yahuah — the Formed presence in the fire — encamps about those who fear Him and delivers them out of the furnace.'),

    -- THREAD 4: there is no other Elohim that can deliver after this sort (the king's compelled confession)
    ('canon','daniel',3,29,'canon','daniel',2,47,'free',
      E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret* (Daniel 2:47). The same king who confessed the *Elohim of gods* now decrees *there is no other Elohim (God) that can deliver after this sort* (Daniel 3:29) — the Most High bends the empire''s mouth to confess Him a second time.'),
    ('canon','daniel',3,29,'canon','daniel',4,37,'free',
      E'*Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). The decree of 3:29 ripens into full praise in ch.4: the king who built the golden image is brought to *praise and extol and honour the King of heaven* — *those that walk in pride he is able to abase*.'),
    ('canon','daniel',3,29,'canon','daniel',6,26,'free',
      E'*I make a decree, That in every dominion of my kingdom men tremble and fear before the Elohim (God) of Daniel: for he is the living Elohim (God), and stedfast for ever, and his kingdom that which shall not be destroyed, and his dominion shall be even unto the end* (Daniel 6:26). Darius repeats Nebuchadnezzar''s pattern: the pagan king decrees reverence for *the living Elohim* — as 3:29 decreed *there is no other Elohim (God) that can deliver after this sort*. The empires confess what they cannot overcome.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-3-but-if-not-we-will-not-serve-thy-gods',
       E'But if not — we will not serve thy gods: the first two commandments kept unto death',
       E'The decree in the plain of Dura is a frontal assault on the first two words of the covenant: every people must *fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5) or be *cast into the midst of a burning fiery furnace* (3:6). The Torah forbids exactly this: *Thou shalt have no other gods before me* (Exodus 20:3); *Thou shalt not make unto thee any graven image... Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)* (Exodus 20:4-5). The three Hebrews answer as the faithful remnant, and the heart of their answer is the unconditional *But if not*: *our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king. But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:17-18). Their obedience does not hang on the rescue — delivered or burned, they will not bow. This is the very scene Revelation previews as the climax of the age: *he had power to give life unto the image of the beast... that as many as would not worship the image of the beast should be killed* (Revelation 13:15); *If any man worship the beast and his image, and receive his mark in his forehead, or in his hand, The same shall drink of the wine of the wrath of Elohim (God)* (Revelation 14:9-10), *and they have no rest day nor night, who worship the beast and his image* (14:11). The image set up, worship compelled, death decreed for refusal — Dura is the dress-rehearsal of the image of the beast and the mark, and the three are the pattern of the faithful who refuse it. And the courage is named by the Master himself: *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell* (Matthew 10:28). Nebuchadnezzar can only heat the furnace; the three fear the One who is able to deliver.',
       sv.verse_id, ev.verse_id, 'free', 30050
  FROM _s306_dan03_lookup sv, _s306_dan03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-3-the-form-of-the-fourth-is-like-the-son-of-elohim',
       E'The form of the fourth is like the Son of Elohim — the Formed Son in the furnace',
       E'Cast bound into a furnace heated *one seven times more than it was wont to be heated* (Daniel 3:19), the three are not consumed. The king, astonied, looks in: *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God)* (Daniel 3:24-25). There is a fourth in the fire. This is the FORMED Son — the visible One drawn from the Formless Father, the Angel of Yahuah who bears the Name, who appeared and walked with Yashar''el throughout the Tanakh; He is Yahuah and has a Father (not a created angel, not a co-equal third person). The prophet Isaiah gives the Tanakh''s own commentary on this furnace, and it is a promise of His presence: *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2) — and the speaker is named: *Yahuah (LORD) that created thee, O Jacob, and he that formed thee, O Yashar''el (Israel)* (Isaiah 43:1). The One who FORMED Yashar''el is the One walking with them in the flame. The result is exactly His word: *upon whose bodies the fire had no power, nor was an hair of their head singed... nor the smell of fire had passed on them* (Daniel 3:27) — *neither shall the flame kindle upon thee*. He does not merely deliver from the fire; He is IN it with His own.',
       sv.verse_id, ev.verse_id, 'free', 30053
  FROM _s306_dan03_lookup sv, _s306_dan03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=3 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-3-he-hath-sent-his-angel-and-delivered-his-servants',
       E'He hath sent his angel, and delivered his servants that trusted in him',
       E'When the three come forth untouched, the king himself names the deliverance: *Blessed be the Elohim (God) of Shadrach, Meshach, and Abed-nego, who hath sent his angel, and delivered his servants that trusted in him, and have changed the king''s word, and yielded their bodies, that they might not serve nor worship any god, except their own Elohim (God)* (Daniel 3:28). They *trusted in him* and *yielded their bodies* — and the angel He sent is the same Formed presence who stood with them in the flame. Hebrews catalogues this very furnace among the mighty acts of faith: *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong* (Hebrews 11:34) — *the fire had no power* upon them (Daniel 3:27), the violence of fire quenched by faith. And the Psalm names the encamping deliverer: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). The angel of Yahuah pitches His camp about those who fear Him; the three feared Him unto the furnace, and He delivered them out of it.',
       sv.verse_id, ev.verse_id, 'free', 30056
  FROM _s306_dan03_lookup sv, _s306_dan03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-3-there-is-no-other-elohim-that-can-deliver-after-this-sort',
       E'There is no other Elohim that can deliver after this sort — the pagan king compelled to confess',
       E'The deliverance wrings a decree from the very king who built the image: *Therefore I make a decree, That every people, nation, and language, which speak any thing amiss against the Elohim (God) of Shadrach, Meshach, and Abed-nego, shall be cut in pieces, and their houses shall be made a dunghill: because there is no other Elohim (God) that can deliver after this sort* (Daniel 3:29). This is the recurring pattern of the book — the Most High bending the mouths of empires to confess Him. Nebuchadnezzar had already confessed once: *Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets* (Daniel 2:47); and after his humbling he confesses fully: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). The pattern repeats under the next empire — Darius decrees: *That in every dominion of my kingdom men tremble and fear before the Elohim (God) of Daniel: for he is the living Elohim (God), and stedfast for ever, and his kingdom that which shall not be destroyed, and his dominion shall be even unto the end* (Daniel 6:26). The kings who set up images and dens are compelled to confess the living Elohim whose servants they could not destroy.',
       sv.verse_id, ev.verse_id, 'free', 30059
  FROM _s306_dan03_lookup sv, _s306_dan03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=3 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thou shalt have no other gods before me* (Exodus 20:3) — the first commandment the golden-image decree assaults; the three own no other god, whatever the furnace.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Thou shalt not make unto thee any graven image* (Exodus 20:4) — the *image of gold* (Daniel 3:1) is the very graven image the Torah forbids; the second commandment kept under death.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou shalt not bow down thyself to them, nor serve them: for I... am a jealous Elohim (God)* (Exodus 20:5) — the bowing to the image (Daniel 3:5) the jealous Elohim forbids; *we will not serve thy gods*.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *as many as would not worship the image of the beast should be killed* (Revelation 13:15) — Dura is the dress-rehearsal: an image, compelled worship, death for refusal.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *If any man worship the beast and his image, and receive his mark* (Revelation 14:9) — the everlasting-gospel warning the three preview by refusing *the golden image which thou hast set up*.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they have no rest day nor night, who worship the beast and his image* (Revelation 14:11) — the furnace is a moment; the wrath upon image-worship is for ever. The three choose the right fire to fear.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *fear not them which kill the body... but rather fear him which is able to destroy both soul and body* (Matthew 10:28) — the courage of *But if not*; the king can heat the furnace, but they fear the One able to deliver.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-but-if-not-we-will-not-serve-thy-gods'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee* (Isaiah 43:2) — the One who *formed thee, O Yashar''el* (43:1) is the fourth in the furnace; *I will be with thee*.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=25
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-the-form-of-the-fourth-is-like-the-son-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Quenched the violence of fire* (Hebrews 11:34) — Hebrews names the furnace among the acts of faith; *the fire had no power* upon them (Daniel 3:27).'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-he-hath-sent-his-angel-and-delivered-his-servants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7) — exactly *who hath sent his angel, and delivered his servants that trusted in him* (Daniel 3:28).'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=28
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-he-hath-sent-his-angel-and-delivered-his-servants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47) — the same king''s earlier compelled confession; now he decrees *there is no other Elohim that can deliver after this sort*.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=29
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-there-is-no-other-elohim-that-can-deliver-after-this-sort'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Now I Nebuchadnezzar praise and extol and honour the King of heaven... those that walk in pride he is able to abase* (Daniel 4:37) — the decree of 3:29 ripens into full praise after his humbling.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=29
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-there-is-no-other-elohim-that-can-deliver-after-this-sort'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *men tremble and fear before the Elohim (God) of Daniel: for he is the living Elohim (God), and stedfast for ever* (Daniel 6:26) — Darius repeats the pattern under the next empire; the kings confess what they cannot destroy.'
  FROM cross_reference_threads t
  JOIN _s306_dan03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=3 AND sv.verse_number=29
  JOIN _s306_dan03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-3-there-is-no-other-elohim-that-can-deliver-after-this-sort'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_4.sql (Daniel 4) -----
-- Chapter: Daniel 4 — Nebuchadnezzar's tree-dream, the watchers' decree, the seven-times madness,
-- and the restored king's confession. THE great Gentile-empire chapter: the El Elyon (most High)
-- RULETH in the kingdom of men and giveth it to whomsoever he will (vv.17,25,32); the proud abased,
-- the Most High exalted (v.37). The tree-of-pride hewn down, the stump bound, seven times; repentance
-- by righteousness and mercy to the poor (v.27); the holy WATCHERS executing the decree (vv.13,17,23).
-- Tag: dan04   Temp view: _s306_dan04_lookup
-- Sort band: base 30075, step 3 -> threads at 30075, 30078, 30081, 30084 (4 threads)
-- Source of EVERY row: 'canon','daniel',4,v
--
-- Daniel 4 coverage:
--   v.1-9 (Nebuchadnezzar's proclamation; the dream that made him afraid; the wise men of Babylon
--          fail; Daniel/Belteshazzar called)
--        NT:     none warranted (narrative frame; the doxology of v.3 echoed forward at v.34-37)
--        Extras: none warranted
--        Tanakh: none separate (preface to the dream of v.10ff)
--   v.10-12 (a tree in the midst of the earth, height reached unto heaven, meat for all, beasts and
--          fowls under it)
--        NT:     none distinct here (the felled-tree weave carried in THREAD 3 from v.14)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 31:3-9 (the Assyrian a cedar in Lebanon, all the trees of Eden envied him),
--                Isaiah 14:13-14 (I will ascend... be like the most High) — THREAD 3 (the great tree
--                of pride that the same Most High hews down)
--   ★ v.13,17,23 (a WATCHER and an holy one came down from heaven... this matter is by the decree of
--          the watchers, and the demand by the word of the holy ones... the most High ruleth in the
--          kingdom of men, and giveth it to whomsoever he will, and setteth up... the basest of men)
--        NT:     none warranted (the sovereignty-over-empires theme woven to Psalms below)
--        Extras: ★ 1 Enoch 20:1 (these are the names of the holy angels who WATCH) — THREAD 1 (the
--                holy watcher tradition; the holy ones who execute the Most High's decree), 1 Enoch
--                12:2-3 (his activities had to do with the Watchers... the holy ones) — THREAD 1
--        Tanakh: ★ Psalm 75:6-7 (promotion cometh neither from east nor west... Elohim is the judge:
--                he putteth down one, and setteth up another), ★ Psalm 103:19 (Yahuah hath prepared
--                his throne in the heavens; and his kingdom ruleth over all) — THREAD 1
--   v.14-16,20-26 (Hew down the tree... leave the stump of his roots... a band of iron and brass...
--          let seven times pass over him; the abasement-then-restoration of the king)
--        NT:     ★ Matthew 3:10 (the axe is laid unto the root of the trees: every tree which
--                bringeth not forth good fruit is hewn down) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 31:10-12,18 (because thou hast lifted up thyself in height... I have driven
--                him out for his wickedness... strangers... have cut him off), Isaiah 14:12 (How art
--                thou fallen from heaven... how art thou cut down to the ground) — THREAD 3
--   ★ v.27 (break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor)
--        NT:     none warranted distinct (the mercy-to-the-poor weave is Tanakh-rooted here)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 58:6-7 (the fast I have chosen... to deal thy bread to the hungry, bring the
--                poor that are cast out to thy house), ★ Proverbs 14:31 (he that honoureth him hath
--                mercy on the poor) — THREAD 4
--   v.28-33 (Is not this great Babylon that I have built... by the might of my power; the voice from
--          heaven; driven from men, did eat grass as oxen, seven times)
--        NT:     ★ Acts 12:23 (the angel of Yahuah smote Herod, because he gave not Elohim the glory —
--                the UN-repentant counter-type) — THREAD 2
--        Extras: none warranted
--        Tanakh: held in THREAD 1/2 prose (the boast of v.30 answered by the decree of v.31-32)
--   ★★ v.34-37 (mine understanding returned... I blessed the most High... whose dominion is an
--          everlasting dominion... and those that walk in PRIDE he is able to abase)
--        NT:     ★★ Luke 1:51-52 (he hath scattered the proud... put down the mighty from their
--                seats, and exalted them of low degree), ★ Luke 14:11 (whosoever exalteth himself
--                shall be abased), ★ James 4:6,10 (Elohim resisteth the proud, but giveth grace unto
--                the humble; humble yourselves and he shall lift you up), ★ 1 Peter 5:5-6 (be clothed
--                with humility... humble yourselves under the mighty hand of Elohim) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Proverbs 16:18 (pride goeth before destruction, and an haughty spirit before a
--                fall), Psalm 75:7 (he putteth down one, and setteth up another) — THREAD 2
--
-- Threads (slug — target libraries):
--   1. daniel-4-the-most-high-ruleth-in-the-kingdom-of-men — Extras (1 Enoch 20, 1 Enoch 12) + Tanakh
--      (Psalm 75, Psalm 103) [extras] (★ the watchers' decree; Yahuah sovereign over every empire; the
--      holy watchers who execute the Most High's word)
--   2. daniel-4-those-that-walk-in-pride-he-is-able-to-abase — NT (Luke 1, Luke 14, James 4, 1 Peter 5,
--      Acts 12) + Tanakh (Proverbs 16, Psalm 75) [free] (★★ pride abased, the Most High exalted; Herod
--      the un-repentant counter-type)
--   3. daniel-4-the-great-tree-hewn-down-the-stump-bound — NT (Matthew 3) + Tanakh (Ezekiel 31,
--      Isaiah 14) [free] (the tree-of-pride felled; the Assyrian cedar, the fallen one, the axe to the root)
--   4. daniel-4-break-off-thy-sins-by-shewing-mercy-to-the-poor — Tanakh (Isaiah 58, Proverbs 14) [free]
--      (repentance by righteousness and mercy to the poor)
--
-- Framing notes:
--   ★ THE MOST HIGH RULETH IN THE KINGDOM OF MEN (THREAD 1): the spine of Daniel. The sentence on
--      Babylon's king comes *by the decree of the watchers, and the demand by the word of the holy
--      ones: to the intent that the living may know that the El Elyon (most High) ruleth in the kingdom
--      of men, and giveth it to whomsoever he will, and setteth up over it the basest of men* (Daniel
--      4:17), thrice repeated (vv.25,32). The WATCHERS here are the HOLY ones — *a watcher and an holy
--      one came down from heaven* (4:13) — the holy angels who keep vigil and carry out the Most High's
--      verdict, NOT the fallen Watchers of Genesis 6. The restored library names them exactly: *And
--      these are the names of the holy angels who watch* (1 Enoch 20:1); Enoch's *activities had to do
--      with the Watchers, and his days were with the holy ones* (1 Enoch 12:2). And the Psalms sing the
--      same sovereignty: *promotion cometh neither from the east, nor from the west, nor from the south.
--      But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:6-7);
--      *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm
--      103:19). Every empire holds its crown at the Most High's pleasure. Tier = extras (Enoch members).
--   ★★ THOSE THAT WALK IN PRIDE HE IS ABLE TO ABASE (THREAD 2): the restored king's confession is the
--      framework in one line — *Now I Nebuchadnezzar praise and extol and honour the King of heaven,
--      all whose works are truth, and his ways judgment: and those that walk in pride he is able to
--      abase* (Daniel 4:37). Miriam (Mary) sings it forward: *He hath shewed strength with his arm; he
--      hath scattered the proud in the imagination of their hearts. He hath put down the mighty from
--      their seats, and exalted them of low degree* (Luke 1:51-52). The Messiah states the law: *for
--      whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke
--      14:11). James and Peter both quote Proverbs 3:34 to the same end — *Elohim (God) resisteth the
--      proud, but giveth grace unto the humble* (James 4:6; 1 Peter 5:5), *Humble yourselves... and he
--      shall lift you up* (James 4:10; 1 Peter 5:6). Proverbs gives the proverb behind the whole chapter:
--      *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). And Herod
--      is the UN-repentant counter-type — where Nebuchadnezzar lifted his eyes to heaven and was
--      restored, Herod took the glory and *the angel of Yahuah (Lord) smote him, because he gave not
--      Elohim (God) the glory* (Acts 12:23). Same throne of the Most High, two ends.
--   THE GREAT TREE HEWN DOWN (THREAD 3): the king is a cosmic tree *whose height reached unto the
--      heaven, and the sight thereof to all the earth* (4:20), and the watcher cries *Hew down the
--      tree... Nevertheless leave the stump of his roots* (4:14-15). Ezekiel sets the same image over
--      Assyria/Pharaoh — *the Assyrian was a cedar in Lebanon... all the trees of Eden, that were in the
--      garden of Elohim (God), envied him* (Ezekiel 31:3,9) — felled *Because thou hast lifted up
--      thyself in height* (31:10). Isaiah's fallen one boasts *I will ascend above the heights of the
--      clouds; I will be like the El Elyon (most High)* (Isaiah 14:14) and is *cut down to the ground*
--      (14:12). And John the Immerser: *now also the axe is laid unto the root of the trees: therefore
--      every tree which bringeth not forth good fruit is hewn down* (Matthew 3:10). But Daniel's tree
--      keeps its STUMP — abasement unto restoration, not destruction.
--   BREAK OFF THY SINS BY SHEWING MERCY TO THE POOR (THREAD 4): Daniel's counsel — *break off thy sins
--      by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening
--      of thy tranquillity* (Daniel 4:27) — is pure Torah-ethics. Isaiah names the same true fast: *to
--      loose the bands of wickedness... to deal thy bread to the hungry, and that thou bring the poor
--      that are cast out to thy house* (Isaiah 58:6-7). Proverbs binds mercy to the poor to honouring
--      the Maker: *he that oppresseth the poor reproacheth his Maker: but he that honoureth him hath
--      mercy on the poor* (Proverbs 14:31). Repentance is measured in righteousness done, not in words.
--   VERSES WITH NO SEPARATE ADD: v.1-9 (the proclamation, the dream, the failing wise men — narrative
--      preface; v.3 doxology echoed at v.34-37 within THREAD 2), v.18-19 (Daniel astonied, the
--      interpretation to thine enemies — narrative), v.28-33 (the boast of *great Babylon* and the
--      seven-times madness — the decree of THREAD 1 enacted, the counter-type of THREAD 2 in Acts 12).
--      All recorded above.

CREATE TEMP VIEW _s306_dan04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the most High ruleth in the kingdom of men — the watchers' decree
    ('canon','daniel',4,17,'enoch','1-enoch',20,1,'extras',
      E'*And these are the names of the holy angels who watch* (1 Enoch 20:1). Daniel''s *a watcher and an holy one came down from heaven* (Daniel 4:13) and *the decree of the watchers, and the demand by the word of the holy ones* (Daniel 4:17) name the very order the restored book of Enoch lists: the HOLY angels who keep vigil — Uriel, Raphael, Michael, Gabriel and their fellows — the set-apart ones who execute the Most High''s verdict. These are not the fallen Watchers of Genesis 6 but the holy ones through whom *the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will*.'),
    ('canon','daniel',4,17,'enoch','1-enoch',12,2,'extras',
      E'*And his activities had to do with the Watchers, and his days were with the holy ones* (1 Enoch 12:2). The Watchers-and-holy-ones pairing that frames Daniel''s decree — *the decree of the watchers, and the demand by the word of the holy ones* (Daniel 4:17) — is the same heavenly council Enoch walks among. The holy ones carry the word of the Most High; the verdict on Babylon''s king issues from that throne, that the living may know who *ruleth in the kingdom of men*.'),
    ('canon','daniel',4,17,'canon','psalms',75,7,'free',
      E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). This is Daniel''s decree set to song: the Most High *ruleth in the kingdom of men, and giveth it to whomsoever he will, and setteth up over it the basest of men* (Daniel 4:17). Crowns do not rise *from the east, nor from the west, nor from the south* (Psalm 75:6) but from the hand of the One who *putteth down one, and setteth up another*.'),
    ('canon','daniel',4,17,'canon','psalms',75,6,'free',
      E'*For promotion cometh neither from the east, nor from the west, nor from the south* (Psalm 75:6). Against every empire''s boast, the psalm denies that exaltation comes from any earthly quarter — exactly the lesson decreed over Nebuchadnezzar, that *the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will* (Daniel 4:17). Promotion is the Most High''s alone to give.'),
    ('canon','daniel',4,17,'canon','psalms',103,19,'free',
      E'*Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm 103:19). The throne over which Nebuchadnezzar is humbled is the one the psalm names: *his kingdom ruleth over all*. The decree that *the El Elyon (most High) ruleth in the kingdom of men* (Daniel 4:17) is no provincial claim — the heavens'' throne governs every kingdom of men.'),

    -- THREAD 2 (★★): those that walk in pride he is able to abase
    ('canon','daniel',4,37,'canon','luke',1,51,'free',
      E'*He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51). Miriam (Mary) sings forward the very lesson Nebuchadnezzar confessed — *those that walk in pride he is able to abase* (Daniel 4:37). The arm of the Most High *scattered the proud*; the king who said *Is not this great Babylon, that I have built... by the might of my power* (Daniel 4:30) is the proud the Magnificat sings against.'),
    ('canon','daniel',4,37,'canon','luke',1,52,'free',
      E'*He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52). Daniel''s king is the mighty one *put down* from his seat and then, humbled, exalted again — the double motion of *those that walk in pride he is able to abase* (Daniel 4:37). The Most High pulls down thrones and lifts the lowly; the restored king of v.36 is himself a sign of it.'),
    ('canon','daniel',4,37,'canon','luke',14,11,'free',
      E'*For whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11). The Messiah states as law what Nebuchadnezzar learned in the field with the beasts — *those that walk in pride he is able to abase* (Daniel 4:37). The king exalted himself (*the might of my power*, 4:30), was abased, then humbled himself and *blessed the El Elyon (most High)* (4:34), and was exalted.'),
    ('canon','daniel',4,37,'canon','james',4,6,'free',
      E'*But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6). James quotes the proverb that runs under Daniel 4 — the Most High *resisteth the proud*, which is *those that walk in pride he is able to abase* (Daniel 4:37). The king who boasted was resisted unto madness; the king who humbled himself received grace and his kingdom restored.'),
    ('canon','daniel',4,37,'canon','james',4,10,'free',
      E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10). This is Nebuchadnezzar''s own path: abased to the beasts, he *lifted up mine eyes unto heaven* (Daniel 4:34) and was lifted up — *excellent majesty was added unto me* (4:36). *Those that walk in pride he is able to abase* (4:37); those who humble themselves he lifts up.'),
    ('canon','daniel',4,37,'canon','1-peter',5,5,'free',
      E'*Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Peter, like James, quotes the proverb that frames Daniel 4 — the Most High *resisteth the proud*, the truth Nebuchadnezzar confessed: *those that walk in pride he is able to abase* (Daniel 4:37). Humility is clothed on; pride is stripped off in the field.'),
    ('canon','daniel',4,37,'canon','1-peter',5,6,'free',
      E'*Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). The *mighty hand* is the one *none can stay* (Daniel 4:35); under it the king was humbled and *in due time* restored. *Those that walk in pride he is able to abase* (Daniel 4:37) — and those who humble themselves beneath that hand he exalts.'),
    ('canon','daniel',4,37,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). The proverb is the whole arc of the chapter in a line: the haughty boast *Is not this great Babylon* (Daniel 4:30) goes before the fall to the beasts, and the confession that *those that walk in pride he is able to abase* (Daniel 4:37) is the lesson written in the king''s own madness and recovery.'),
    ('canon','daniel',4,37,'canon','psalms',75,7,'free',
      E'*But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7). The same hand that *ruleth in the kingdom of men* (Daniel 4:17) is the hand that abases the proud (4:37) — *he putteth down one, and setteth up another*. Nebuchadnezzar was put down to the grass and set up again, that he might honour the King of heaven.'),
    ('canon','daniel',4,30,'canon','acts',12,23,'free',
      E'*And immediately the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). Herod is the UN-repentant counter-type of Nebuchadnezzar. Where the king boasted *Is not this great Babylon, that I have built... by the might of my power* (Daniel 4:30) yet later lifted his eyes to heaven and blessed the Most High, Herod took the glory of *the voice of a god* and *gave not Elohim (God) the glory* — and was struck down with no restoration. *Those that walk in pride he is able to abase* (Daniel 4:37).'),

    -- THREAD 3: the great tree hewn down, the stump bound
    ('canon','daniel',4,14,'canon','ezekiel',31,10,'free',
      E'*Therefore thus saith Adonai Yahuah (the Lord GOD); Because thou hast lifted up thyself in height, and he hath shot up his top among the thick boughs, and his heart is lifted up in his height* (Ezekiel 31:10). Ezekiel''s great cedar is felled for the same sin as Daniel''s tree — height that lifts up the heart. The watcher''s cry *Hew down the tree* (Daniel 4:14) answers the cedar *lifted up... in height* (Ezekiel 31:10): the Most High brings down every tree whose heart is exalted.'),
    ('canon','daniel',4,11,'canon','ezekiel',31,3,'free',
      E'*Behold, the Assyrian was a cedar in Lebanon with fair branches, and with a shadowing shroud, and of an high stature; and his top was among the thick boughs* (Ezekiel 31:3). Ezekiel''s cedar is twin to Daniel''s tree: *The tree grew, and was strong, and the height thereof reached unto heaven, and the sight thereof to the end of all the earth* (Daniel 4:11). Both are mighty empires sheltering the nations under their boughs — and both are appointed to be hewn down for pride.'),
    ('canon','daniel',4,12,'canon','ezekiel',31,6,'free',
      E'*All the fowls of heaven made their nests in his boughs, and under his branches did all the beasts of the field bring forth their young, and under his shadow dwelt all great nations* (Ezekiel 31:6). The picture matches Daniel''s tree to the leaf — *the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* (Daniel 4:12). The empire that shelters all flesh is the same empire the Most High will fell.'),
    ('canon','daniel',4,14,'canon','isaiah',14,12,'free',
      E'*How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12). Isaiah''s fallen one, *cut down to the ground*, is the archetype of every proud power hewn down — the watcher''s *Hew down the tree, and cut off his branches* (Daniel 4:14). The one who said *I will be like the El Elyon (most High)* (Isaiah 14:14) is brought to the dust, as Babylon''s king to the beasts.'),
    ('canon','daniel',4,30,'canon','isaiah',14,14,'free',
      E'*I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14). The boast Isaiah records is the heart of Nebuchadnezzar''s *Is not this great Babylon, that I have built... by the might of my power, and for the honour of my majesty?* (Daniel 4:30). To make oneself like the Most High is the pride that goes before the fall — and the One who is truly El Elyon abases it.'),
    ('canon','daniel',4,14,'canon','matthew',3,10,'free',
      E'*And now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10). John the Immerser''s axe-to-the-root is the watcher''s *Hew down the tree* (Daniel 4:14) carried forward: every proud, fruitless tree is felled. Yet Daniel''s tree keeps *the stump of his roots* (4:15) — abasement unto repentance, the door Nebuchadnezzar walked through.'),

    -- THREAD 4: break off thy sins by shewing mercy to the poor
    ('canon','daniel',4,27,'canon','isaiah',58,7,'free',
      E'*Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* (Isaiah 58:7). Isaiah names the same righteousness Daniel prescribes — *break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor* (Daniel 4:27). True repentance is mercy enacted toward the poor, the hungry, the cast-out; the fast Yahuah chooses is the king''s counsel made flesh.'),
    ('canon','daniel',4,27,'canon','isaiah',58,6,'free',
      E'*Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6). Daniel''s *break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor* (Daniel 4:27) is the very fast Isaiah names — repentance that loosens the burdens of the oppressed, not mere words. The king is told to break off his iniquity by breaking the yokes he had laid.'),
    ('canon','daniel',4,27,'canon','proverbs',14,31,'free',
      E'*He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor* (Proverbs 14:31). The proverb binds mercy to the poor to honouring the Most High — exactly Daniel''s counsel: *break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor* (Daniel 4:27). To honour the King of heaven the king must have mercy on the poor; to oppress them is to reproach his Maker.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-4-the-most-high-ruleth-in-the-kingdom-of-men',
       E'The most High ruleth in the kingdom of men — the watchers'' decree',
       E'The sentence on the world''s greatest king is handed down by the heavenly council: *I saw in the visions of my head upon my bed, and, behold, a watcher and an holy one came down from heaven* (Daniel 4:13); *This matter is by the decree of the watchers, and the demand by the word of the holy ones: to the intent that the living may know that the El Elyon (most High) ruleth in the kingdom of men, and giveth it to whomsoever he will, and setteth up over it the basest of men* (Daniel 4:17). Thrice the chapter drives it home (4:25,32). Mark who the watchers are HERE: *a watcher and an HOLY one* — the holy angels who keep vigil and carry out the Most High''s verdict, NOT the fallen Watchers of Genesis 6 who left their estate. The restored library names this very order: *And these are the names of the holy angels who watch* (1 Enoch 20:1) — Uriel, Raphael, Michael, Gabriel and their fellows; and Enoch, walking among them, whose *activities had to do with the Watchers, and his days were with the holy ones* (1 Enoch 12:2). The decree issues from that throne. And the Psalms sing the same sovereignty over the nations: *For promotion cometh neither from the east, nor from the west, nor from the south. But Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:6-7); *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm 103:19). Babylon, Persia, Greece, Rome — every empire holds its crown at the pleasure of the Most High, and is given to whomsoever He will.',
       sv.verse_id, ev.verse_id, 'extras', 30075
  FROM _s306_dan04_lookup sv, _s306_dan04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-4-those-that-walk-in-pride-he-is-able-to-abase',
       E'Those that walk in pride he is able to abase — the proud cast down, the Most High exalted',
       E'The chapter ends in the mouth of a restored Gentile king who has learned the one lesson: *Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). The whole arc is pride abased and the Most High exalted: he boasted *Is not this great Babylon, that I have built for the house of the kingdom by the might of my power, and for the honour of my majesty?* (Daniel 4:30), and *while the word was in the king''s mouth, there fell a voice from heaven* (4:31), driving him to eat grass as oxen until *I lifted up mine eyes unto heaven, and mine understanding returned unto me, and I blessed the El Elyon (most High)* (4:34). The New Testament makes this the rule of the kingdom. Miriam (Mary) sings it: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts. He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:51-52). The Messiah states the law: *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11). James and Peter both lay it down: *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6; 1 Peter 5:5); *Humble yourselves... and he shall lift you up* (James 4:10); *Humble yourselves therefore under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6). Proverbs gives the seed: *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18); and Psalm 75:7 the engine — *he putteth down one, and setteth up another*. And set against Nebuchadnezzar stands the UN-repentant counter-type: Herod took the crowd''s cry *the voice of a god* and *gave not Elohim (God) the glory*, and *immediately the angel of Yahuah (Lord) smote him... and he was eaten of worms, and gave up the ghost* (Acts 12:23) — no field, no recovery, no confession. Two proud kings, one throne of the Most High; the one who lifted his eyes to heaven was restored, the one who kept the glory was destroyed.',
       sv.verse_id, ev.verse_id, 'free', 30078
  FROM _s306_dan04_lookup sv, _s306_dan04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-4-the-great-tree-hewn-down-the-stump-bound',
       E'The great tree hewn down, the stump bound — the empire of pride felled',
       E'The king sees himself as a cosmic tree: *The tree grew, and was strong, and the height thereof reached unto heaven, and the sight thereof to the end of all the earth: The leaves thereof were fair, and the fruit thereof much, and in it was meat for all: the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof* (Daniel 4:11-12). The watcher cries: *Hew down the tree, and cut off his branches... Nevertheless leave the stump of his roots in the earth, even with a band of iron and brass* (Daniel 4:14-15). The prophets had drawn this tree before. Ezekiel sets it over Assyria and Pharaoh — *Behold, the Assyrian was a cedar in Lebanon with fair branches... and his top was among the thick boughs* (Ezekiel 31:3), under whom *all great nations* dwelt (31:6), felled *Because thou hast lifted up thyself in height... and his heart is lifted up in his height* (31:10). Isaiah''s fallen one boasted *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14) and was *cut down to the ground* (14:12). John the Immerser carries the axe forward: *now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10). But Daniel''s tree is unique in mercy: the stump is LEFT, bound but living, *till seven times pass over him* (4:16) — the empire felled, the man preserved unto repentance. Abasement, here, opens a door the proud may walk through.',
       sv.verse_id, ev.verse_id, 'free', 30081
  FROM _s306_dan04_lookup sv, _s306_dan04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-4-break-off-thy-sins-by-shewing-mercy-to-the-poor',
       E'Break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor',
       E'Before the judgment falls, Daniel gives the king a way of repentance — not creed, but conduct: *Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity* (Daniel 4:27). Repentance is measured in righteousness done and mercy shown, the Torah-ethic of the prophets. Isaiah names the same true fast: *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6), *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him* (Isaiah 58:7). And Proverbs binds mercy to the poor directly to honouring the Most High the king is told to honour: *He that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor* (Proverbs 14:31). The king who would honour the King of heaven must break off his iniquities by mercy to the poor — the righteousness that lengthens tranquillity.',
       sv.verse_id, ev.verse_id, 'free', 30084
  FROM _s306_dan04_lookup sv, _s306_dan04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=4 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *these are the names of the holy angels who watch* (1 Enoch 20:1) — the holy watcher order Daniel names: *a watcher and an holy one* who carry the Most High''s decree.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=20 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-most-high-ruleth-in-the-kingdom-of-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his activities had to do with the Watchers, and his days were with the holy ones* (1 Enoch 12:2) — the Watchers-and-holy-ones council from which the decree of Daniel 4:17 issues.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-most-high-ruleth-in-the-kingdom-of-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Elohim (God) is the judge: he putteth down one, and setteth up another* (Psalm 75:7) — Daniel''s decree set to song; the Most High gives the kingdom to whomsoever he will.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-most-high-ruleth-in-the-kingdom-of-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*promotion cometh neither from the east, nor from the west, nor from the south* (Psalm 75:6) — exaltation comes from no earthly quarter, only the Most High who ruleth in the kingdom of men.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-most-high-ruleth-in-the-kingdom-of-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm 103:19) — the throne over which Babylon''s king is humbled governs every kingdom of men.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-most-high-ruleth-in-the-kingdom-of-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he hath scattered the proud in the imagination of their hearts* (Luke 1:51) — Miriam (Mary) sings forward *those that walk in pride he is able to abase* (Daniel 4:37).'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *He hath put down the mighty from their seats, and exalted them of low degree* (Luke 1:52) — the double motion of the king put down to the grass and lifted up again.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *whosoever exalteth himself shall be abased; and he that humbleth himself shall be exalted* (Luke 14:11) — the Messiah states as law the lesson Nebuchadnezzar learned in the field.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=14 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6) — the proverb under Daniel 4; the proud resisted unto madness, the humble given grace.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Humble yourselves in the sight of Yahuah (Lord), and he shall lift you up* (James 4:10) — the king''s own path: abased to the beasts, he lifted his eyes to heaven and was lifted up.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5) — Peter quotes the same proverb; humility clothed on, pride stripped off in the field.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Humble yourselves... under the mighty hand of Elohim (God), that he may exalt you in due time* (1 Peter 5:6) — the mighty hand none can stay (Daniel 4:35); under it, abased then in due time restored.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — the whole arc of the chapter in a line; the boast of v.30 goes before the fall to the beasts.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he putteth down one, and setteth up another* (Psalm 75:7) — the same hand that ruleth in the kingdom of men abases the proud; put down to the grass, set up again.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory* (Acts 12:23) — Herod the un-repentant counter-type; he kept the glory of *great Babylon* (Daniel 4:30) and was destroyed with no restoration.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=30
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-those-that-walk-in-pride-he-is-able-to-abase'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the Assyrian was a cedar in Lebanon... his top was among the thick boughs* (Ezekiel 31:3) — Ezekiel''s cedar is twin to Daniel''s tree whose height reached unto heaven.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=31 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the fowls of heaven made their nests in his boughs... under his shadow dwelt all great nations* (Ezekiel 31:6) — matches Daniel''s tree to the leaf; the empire that shelters all flesh.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Because thou hast lifted up thyself in height... and his heart is lifted up in his height* (Ezekiel 31:10) — the cedar felled for the same sin: height that lifts up the heart.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*How art thou fallen from heaven... how art thou cut down to the ground* (Isaiah 14:12) — the archetype of every proud power hewn down; the watcher''s *Hew down the tree*.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14) — the boast behind *Is not this great Babylon* (Daniel 4:30); to make oneself like the Most High is the pride that falls.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=30
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down* (Matthew 3:10) — John carries the watcher''s axe forward; yet Daniel''s tree keeps its stump unto repentance.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-the-great-tree-hewn-down-the-stump-bound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Is not this the fast that I have chosen? to loose the bands of wickedness... to let the oppressed go free* (Isaiah 58:6) — the true fast that is Daniel''s counsel made flesh: repentance that breaks the yoke.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-break-off-thy-sins-by-shewing-mercy-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house* (Isaiah 58:7) — the mercy to the poor by which the king is told to break off his iniquities.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-break-off-thy-sins-by-shewing-mercy-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he that oppresseth the poor reproacheth his Maker: but he that honoureth him hath mercy on the poor* (Proverbs 14:31) — to honour the King of heaven the king must have mercy on the poor.'
  FROM cross_reference_threads t
  JOIN _s306_dan04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=4 AND sv.verse_number=27
  JOIN _s306_dan04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-4-break-off-thy-sins-by-shewing-mercy-to-the-poor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session306 — Daniel cross-references complete.'
