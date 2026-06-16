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

-- ----- fragment: minion_daniel_5.sql (Daniel 5) -----
-- Chapter: Daniel 5 — Belshazzar's feast; the golden vessels of the temple profaned; fingers of a man's
-- hand write upon the plaister of the wall; the wise men cannot read it; Daniel alone interprets:
-- MENE, MENE, TEKEL, UPHARSIN — *thou art weighed in the balances, and art found wanting*; the kingdom
-- numbered, finished, divided to the Medes and Persians; in that night Belshazzar slain. The proud
-- world-empire weighed out and judged in a night — Babylon the standing type, fallen.
-- Tag: dan05   Session: s306   Temp view: _s306_dan05_lookup
-- Sort band: base 30100, step 3 -> threads at 30100, 30103, 30106, 30109 (4 threads)
-- Source of EVERY row: 'canon','daniel',5,v
--
-- Daniel 5 coverage:
--   v.1-4 (Belshazzar made a great feast... commanded to bring the golden and silver vessels which his
--          father Nebuchadnezzar had taken out of the temple... they drank, and praised the gods of gold,
--          and of silver, of brass, of iron, of wood, and of stone)
--        NT:     ★ 1 Corinthians 10:21 (cannot drink the cup of Yahuah and the cup of devils) — held to
--                THREAD 2 (idolatry profaning the holy)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 27:22 (the vessels carried to Babylon, and the day Yahuah will restore them) —
--                THREAD 2 (the holy vessels profaned, their promised return)
--   ★ v.5-9 (fingers of a man's hand wrote over against the candlestick... the king's wise men could not
--          read the writing, nor make known the interpretation)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Daniel 2:27-28 (the wise men cannot shew, but there is a Elohim in heaven that revealeth
--                secrets), ★ Daniel 2:47 (a revealer of secrets) — THREAD 4 (wisdom-of-the-Most-High pattern)
--   v.10-16 (the queen names Daniel... an excellent spirit, knowledge, interpreting of dreams... clothed
--          with scarlet, a chain of gold, third ruler)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held to THREAD 4 (the man in whom is the spirit of the holy gods — the interpreter pattern)
--   ★ v.18-21 (the El Elyon gave Nebuchadnezzar a kingdom... but when his heart was lifted up... he was
--          deposed... till he knew that the El Elyon ruled in the kingdom of men)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Daniel 4:37 (those that walk in pride he is able to abase) — THREAD 3 (the lesson of ch4
--                Belshazzar refused)
--   ★★ v.22-23 (thou his son, O Belshazzar, hast not humbled thine heart, though thou knewest all this; but
--          hast lifted up thyself against Yahuah of heaven... praised the gods of silver and gold... and the
--          Elohim in whose hand thy breath is... hast thou not glorified)
--        NT:     ★ 1 Corinthians 10:21 (the cup of devils — fellowship with idols), ★ Acts 17:25 (he giveth
--                to all life, and breath), ★ Acts 17:28 (in him we live, and move, and have our being) —
--                THREAD 2 (pride/idolatry) + THREAD 3 (breath in His hand)
--        Extras: none warranted
--        Tanakh: ★ Daniel 4:37 (pride abased), ★ Isaiah 14:13-14 (I will ascend... I will be like the most
--                High — the proud-throne fall), ★ Job 12:10 (in whose hand is the breath of all mankind) —
--                THREAD 3
--   ★★★ v.24-28 (this is the writing... MENE, MENE, TEKEL, UPHARSIN... Elohim hath numbered thy kingdom,
--          and finished it; TEKEL; Thou art weighed in the balances, and art found wanting; PERES; Thy
--          kingdom is divided, and given to the Medes and Persians)
--        NT:     ★★ Revelation 18:2 (Babylon the great is fallen, is fallen) — THREAD 1 (Babylon judged in a
--                night, the standing type of the proud world-empire)
--        Extras: none warranted
--        Tanakh: ★★ Job 31:6 (let me be weighed in an even balance), ★★ Psalm 62:9 (laid in the balance,
--                lighter than vanity), ★★ Proverbs 16:2 (Yahuah weigheth the spirits), ★ Proverbs 21:2
--                (Yahuah pondereth the hearts) — THREAD 1 (the weighing/balance motif)
--   v.29-31 (Daniel clothed with scarlet... in that night was Belshazzar slain... Darius the Median took the
--          kingdom)
--        NT:     none warranted (the sentence executed; held in THREAD 1 prose — judged in a night)
--        Extras: none warranted
--        Tanakh: the divided kingdom *given to the Medes and Persians* (v.28) fulfilled in v.31 — woven in
--                THREAD 1 prose
--
-- Threads (slug — target libraries):
--   1. daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting — NT (Revelation 18) + Tanakh (Job 31,
--        Psalm 62, Proverbs 16, Proverbs 21) [free]
--      (★★★ MENE TEKEL UPHARSIN; the kingdom numbered/finished/divided; the weighing motif; Babylon fallen)
--   2. daniel-5-praised-the-gods-of-gold-and-the-holy-vessels-profaned — NT (1 Corinthians 10) + Tanakh
--        (Jeremiah 27) [free]
--      (★★ pride refusing the lesson of ch4; idolatry profaning the temple vessels; their promised return)
--   3. daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified — NT (Acts 17) + Tanakh
--        (Job 12, Daniel 4, Isaiah 14) [free]
--      (★★ the breath in His hand and all thy ways — the pride lifted up against the Lord of heaven, abased)
--   4. daniel-5-the-wise-men-could-not-read-the-writing-but-daniel-interpreted — Tanakh (Daniel 2) [free]
--      (★ the handwriting none of Babylon's wise men could read; the wisdom-of-the-Most-High pattern, ch2/ch4)
--
-- Framing notes:
--   ★★★ THOU ART WEIGHED IN THE BALANCES (THREAD 1): the fingers write four words on the wall and Daniel
--      reads the verdict: *MENE; Elohim (God) hath numbered thy kingdom, and finished it. TEKEL; Thou art
--      weighed in the balances, and art found wanting. PERES; Thy kingdom is divided, and given to the Medes
--      and Persians* (Daniel 5:26-28). The kingdom NUMBERED, FINISHED, DIVIDED — divine judgment weighed out.
--      The balance is the Tanakh's own measure of every life: *Let me be weighed in an even balance, that
--      Elohim (God) may know mine integrity* (Job 31:6); *men of high degree are a lie: to be laid in the
--      balance, they are altogether lighter than vanity* (Psalm 62:9); *Yahuah (LORD) weigheth the spirits*
--      (Proverbs 16:2); *Yahuah (LORD) pondereth the hearts* (Proverbs 21:2). Belshazzar, weighed, is found
--      wanting, and *in that night was Belshazzar the king of the Chaldeans slain* (5:30) — Babylon judged in
--      a single night, the standing type of the proud world-empire whose end John sees: *Babylon the great
--      is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2). The wall of the
--      feast is the assize of the nations.
--   ★★ THE HOLY VESSELS PROFANED (THREAD 2): Belshazzar *commanded to bring the golden and silver vessels
--      which his father Nebuchadnezzar had taken out of the temple which was in Jerusalem; that the king...
--      might drink therein* (5:2), *and praised the gods of gold, and of silver, of brass, of iron, of wood,
--      and of stone* (5:4). Pride that will not learn the lesson of ch4 turns to sacrilege: the holy vessels
--      of Yahuah's house made the cups of an idol-feast. Paul names the impossibility: *Ye cannot drink the
--      cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and
--      of the table of devils* (1 Corinthians 10:21). And the vessels themselves were under a promise —
--      Jeremiah had foretold both their captivity and their return: *They shall be carried to Babylon, and
--      there shall they be until the day that I visit them, saith Yahuah (LORD); then will I bring them up,
--      and restore them to this place* (Jeremiah 27:22). The night the cups are profaned is the night the
--      empire that holds them falls.
--   ★★ THE BREATH IN HIS HAND (THREAD 3): Daniel lays the charge bare: *thou his son, O Belshazzar, hast not
--      humbled thine heart, though thou knewest all this; But hast lifted up thyself against Yahuah (Lord) of
--      heaven... and the Elohim (God) in whose hand thy breath is, and whose are all thy ways, hast thou not
--      glorified* (5:22-23). He knew ch4 and would not bow — *those that walk in pride he is able to abase*
--      (Daniel 4:37). The self-exalting heart is the old fall: *I will ascend into heaven... I will be like
--      the El Elyon (most High)* (Isaiah 14:13-14). Yet the very breath the proud king spends in praising
--      dead gods is held in the hand he will not glorify: *In whose hand is the soul of every living thing,
--      and the breath of all mankind* (Job 12:10). Paul preaches the same to the idol-city: He *giveth to
--      all life, and breath, and all things* (Acts 17:25); *For in him we live, and move, and have our being*
--      (Acts 17:28). To refuse to glorify the One who holds your breath is to be found wanting.
--   ★ THE WISE MEN COULD NOT READ IT (THREAD 4): *Then came in all the king''s wise men: but they could not
--      read the writing, nor make known to the king the interpretation thereof* (5:8) — the astrologers,
--      Chaldeans, and soothsayers of Babylon are dumb before the hand of heaven, and Daniel alone interprets.
--      This is the fixed pattern of the book: the wisdom of the Most High given to His servant where Babylon''s
--      wisdom fails. In ch2: *The secret which the king hath demanded cannot the wise men, the astrologers,
--      the magicians, the soothsayers, shew unto the king; But there is a Elohim (God) in heaven that
--      revealeth secrets* (Daniel 2:27-28), and the king confessed *your Elohim (God) is... a revealer of
--      secrets* (Daniel 2:47). The same Daniel, the same Spirit, the same Most High who reveals what no
--      empire can read.
--   VERSES WITH NO SEPARATE ADD: v.1-4 carried in THREAD 2 (the feast and the profaned vessels, anchored at
--      v.2-4); v.10-16 (the queen's counsel and Daniel summoned — the interpreter pattern, woven in THREAD 4);
--      v.18-21 (Nebuchadnezzar's pride and abasement recounted — the ch4 lesson, woven in THREAD 3 via 4:37);
--      v.29-31 (Daniel rewarded, Belshazzar slain that night, Darius takes the kingdom — the sentence of
--      THREAD 1 executed, the *divided... to the Medes and Persians* fulfilled). All recorded above.

CREATE TEMP VIEW _s306_dan05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): MENE, MENE, TEKEL, UPHARSIN — thou art weighed in the balances, and art found wanting
    ('canon','daniel',5,27,'canon','job',31,6,'free',
      E'*Let me be weighed in an even balance, that Elohim (God) may know mine integrity* (Job 31:6). Job names the very figure the wall pronounces over Belshazzar — *Thou art weighed in the balances, and art found wanting* (Daniel 5:27). Every life is set in the balance of the Most High; where Job longs to be weighed and known upright, the proud king is weighed and found wanting.'),
    ('canon','daniel',5,27,'canon','psalms',62,9,'free',
      E'*Surely men of low degree are vanity, and men of high degree are a lie: to be laid in the balance, they are altogether lighter than vanity* (Psalm 62:9). The Psalm sets the proud of the earth in the very scales of Daniel 5:27 — *laid in the balance, they are altogether lighter than vanity*. Belshazzar, *king of the Chaldeans* at the height of an empire, is weighed and *found wanting*: high degree on the wall''s balance is a lie.'),
    ('canon','daniel',5,27,'canon','proverbs',16,2,'free',
      E'*All the ways of a man are clean in his own eyes; but Yahuah (LORD) weigheth the spirits* (Proverbs 16:2). The feast looked clean in Belshazzar''s own eyes, but *Yahuah (LORD) weigheth the spirits* — and the hand writes the weighing on the wall: *Thou art weighed in the balances, and art found wanting* (Daniel 5:27). The proverb is the principle; the feast is the instance.'),
    ('canon','daniel',5,27,'canon','proverbs',21,2,'free',
      E'*Every way of a man is right in his own eyes: but Yahuah (LORD) pondereth the hearts* (Proverbs 21:2). The king''s way was right in his own eyes as he drank from the temple vessels; but *Yahuah (LORD) pondereth the hearts*, and the verdict is weighed out: *Thou art weighed in the balances, and art found wanting* (Daniel 5:27). The One who ponders the heart is the One who holds the scale.'),
    ('canon','daniel',5,26,'canon','revelation',18,2,'free',
      E'*And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit* (Revelation 18:2). The word over Belshazzar — *Elohim (God) hath numbered thy kingdom, and finished it* (Daniel 5:26), and *in that night was Belshazzar... slain* (5:30) — is the historical first fall of Babylon, the standing type. John sees the type''s consummation: the proud world-empire, numbered and finished, *is fallen, is fallen*. Babylon judged in a night, then and at the end.'),

    -- THREAD 2 (★★): praised the gods of gold — the holy vessels of the temple profaned
    ('canon','daniel',5,23,'canon','1-corinthians',10,21,'free',
      E'*Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21). Belshazzar does the unthinkable thing Paul says cannot stand: he drinks from *the vessels of his house* and in the same breath *praised the gods of silver, and gold, of brass, iron, wood, and stone* (Daniel 5:23). The holy cup and the cup of devils joined at one table — and the wall answers it that night.'),
    ('canon','daniel',5,2,'canon','jeremiah',27,22,'free',
      E'*They shall be carried to Babylon, and there shall they be until the day that I visit them, saith Yahuah (LORD); then will I bring them up, and restore them to this place* (Jeremiah 27:22). The *golden and silver vessels which his father Nebuchadnezzar had taken out of the temple which was in Jerusalem* (Daniel 5:2) are the very vessels Jeremiah said would lie in Babylon *until the day that I visit them*. Belshazzar profanes what is under a promise of return — and the visitation falls on him the same night.'),

    -- THREAD 3 (★★): the Elohim in whose hand thy breath is, and whose are all thy ways, hast thou not glorified
    ('canon','daniel',5,23,'canon','acts',17,25,'free',
      E'*Neither is worshipped with men''s hands, as though he needed any thing, seeing he giveth to all life, and breath, and all things* (Acts 17:25). Daniel charges Belshazzar that *the Elohim (God) in whose hand thy breath is, and whose are all thy ways, hast thou not glorified* (Daniel 5:23). Paul preaches the same God to the idol-city: the One who *giveth to all life, and breath* — the breath the king spends praising dead gods is His gift, ungloried.'),
    ('canon','daniel',5,23,'canon','acts',17,28,'free',
      E'*For in him we live, and move, and have our being; as certain also of your own poets have said, For we are also his offspring* (Acts 17:28). *Whose are all thy ways* (Daniel 5:23) is precisely *in him we live, and move, and have our being* — the proud king''s every step is held by the One he will not glorify. To live and move in Him and praise gods that *see not, nor hear, nor know* (5:23) is to be found wanting.'),
    ('canon','daniel',5,23,'canon','job',12,10,'free',
      E'*In whose hand is the soul of every living thing, and the breath of all mankind* (Job 12:10). Job states the truth Belshazzar refuses to honour: *the Elohim (God) in whose hand thy breath is... hast thou not glorified* (Daniel 5:23). The very breath the king draws to praise idols rests in the hand of the One whose it is — *the breath of all mankind*.'),
    ('canon','daniel',5,22,'canon','daniel',4,37,'free',
      E'*Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). Belshazzar *knewest all this* (Daniel 5:22) — he had his father''s confession before him, that the King of heaven *is able to abase* the proud — yet *hast not humbled thine heart*. The lesson of ch4 stood written, refused, and the pride is abased that night.'),
    ('canon','daniel',5,23,'canon','isaiah',14,13,'free',
      E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13). The heart that *lifted up thyself against Yahuah (Lord) of heaven* (Daniel 5:23) is the old self-exalting fall — *I will ascend into heaven... I will exalt my throne*. The proud throne is the throne that is weighed and found wanting.'),
    ('canon','daniel',5,23,'canon','isaiah',14,14,'free',
      E'*I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* (Isaiah 14:14). The boast *I will be like the El Elyon (most High)* is the very pride Daniel names in Belshazzar, who *lifted up thyself against Yahuah (Lord) of heaven* (Daniel 5:23) and would not glorify the El Elyon his father confessed. To reach for the Most High''s place is to be deposed, as the wall decrees.'),

    -- THREAD 4 (★): the wise men could not read the writing, but Daniel interpreted (wisdom of the Most High)
    ('canon','daniel',5,8,'canon','daniel',2,27,'free',
      E'*Daniel answered in the presence of the king, and said, The secret which the king hath demanded cannot the wise men, the astrologers, the magicians, the soothsayers, shew unto the king* (Daniel 2:27). The same helplessness falls on Babylon''s wisdom in ch5: *they could not read the writing, nor make known to the king the interpretation thereof* (Daniel 5:8). The astrologers and soothsayers are dumb before heaven''s hand — the fixed pattern that sets up the Most High''s revealer.'),
    ('canon','daniel',5,8,'canon','daniel',2,28,'free',
      E'*But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:28). Where Babylon''s wise men *could not read the writing* (Daniel 5:8), *there is a Elohim (God) in heaven that revealeth secrets* — and gives the reading to Daniel. The hand on the wall is read not by magic but by the wisdom of the Most High in His servant.'),
    ('canon','daniel',5,12,'canon','daniel',2,47,'free',
      E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret* (Daniel 2:47). The queen commends Daniel as one in whom is *interpreting of dreams, and shewing of hard sentences, and dissolving of doubts* (Daniel 5:12) — the very gift Nebuchadnezzar had already confessed as the mark of *a revealer of secrets*. The same Daniel, the same Spirit, across the reigns.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting',
       E'MENE, MENE, TEKEL, UPHARSIN — thou art weighed in the balances, and art found wanting',
       E'In the same hour that the king drank from the holy vessels, *came forth fingers of a man''s hand, and wrote over against the candlestick upon the plaister of the wall* (Daniel 5:5), and when Babylon''s wise men could not read it, Daniel gave the verdict: *And this is the writing that was written, MENE, MENE, TEKEL, UPHARSIN. This is the interpretation of the thing: MENE; Elohim (God) hath numbered thy kingdom, and finished it. TEKEL; Thou art weighed in the balances, and art found wanting. PERES; Thy kingdom is divided, and given to the Medes and Persians* (Daniel 5:25-28). Numbered, finished, weighed, divided — divine judgment weighed out in four words. The balance is the Tanakh''s own measure of a life: *Let me be weighed in an even balance, that Elohim (God) may know mine integrity* (Job 31:6); *men of high degree are a lie: to be laid in the balance, they are altogether lighter than vanity* (Psalm 62:9); *All the ways of a man are clean in his own eyes; but Yahuah (LORD) weigheth the spirits* (Proverbs 16:2); *Every way of a man is right in his own eyes: but Yahuah (LORD) pondereth the hearts* (Proverbs 21:2). The One who ponders the heart holds the scale, and the proud king is found wanting. And the sentence is executed without delay: *In that night was Belshazzar the king of the Chaldeans slain. And Darius the Median took the kingdom* (5:30-31) — the kingdom *divided, and given to the Medes and Persians* in a single night. This first fall of Babylon is the standing type; John hears its consummation cried over the proud world-empire at the end: *Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit* (Revelation 18:2). The wall of the feast is the assize of the nations: weighed, and found wanting.',
       sv.verse_id, ev.verse_id, 'free', 30100
  FROM _s306_dan05_lookup sv, _s306_dan05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=5 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-5-praised-the-gods-of-gold-and-the-holy-vessels-profaned',
       E'They praised the gods of gold — the holy vessels of the temple profaned',
       E'Belshazzar''s feast is not merely drunken; it is deliberate sacrilege. *Belshazzar, whiles he tasted the wine, commanded to bring the golden and silver vessels which his father Nebuchadnezzar had taken out of the temple which was in Jerusalem; that the king, and his princes, his wives, and his concubines, might drink therein* (Daniel 5:2), *and praised the gods of gold, and of silver, of brass, of iron, of wood, and of stone* (5:4) — the very catalogue of dead idols, *which see not, nor hear, nor know* (5:23). This is pride that refuses the lesson of ch4 and turns to profane the holy: the cups of Yahuah''s house lifted to the gods of Babylon. Paul names the impossibility the king tramples: *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils* (1 Corinthians 10:21). And the vessels themselves were never abandoned by their Owner — Jeremiah had foretold both their captivity and their guaranteed return: *They shall be carried to Babylon, and there shall they be until the day that I visit them, saith Yahuah (LORD); then will I bring them up, and restore them to this place* (Jeremiah 27:22). Belshazzar profanes what is under promise — and *the day that I visit them* dawns as judgment on the empire that holds them. The night the holy cups are defiled is the night Babylon falls.',
       sv.verse_id, ev.verse_id, 'free', 30103
  FROM _s306_dan05_lookup sv, _s306_dan05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified',
       E'The Elohim in whose hand thy breath is, and whose are all thy ways, hast thou not glorified',
       E'Daniel will not soften the charge. He reminds the king of his father''s humbling — *those that walk in pride he is able to abase* (Daniel 4:37) — and then names the sin: *And thou his son, O Belshazzar, hast not humbled thine heart, though thou knewest all this; But hast lifted up thyself against Yahuah (Lord) of heaven; and they have brought the vessels of his house before thee... and thou hast praised the gods of silver, and gold, of brass, iron, wood, and stone, which see not, nor hear, nor know: and the Elohim (God) in whose hand thy breath is, and whose are all thy ways, hast thou not glorified* (Daniel 5:22-23). He KNEW the lesson of ch4 and would not bow. The self-exalting heart is the ancient fall: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13-14). Yet the very breath the king spends praising blind gods is held in the hand he will not glorify: *In whose hand is the soul of every living thing, and the breath of all mankind* (Job 12:10). Paul preaches exactly this God to the idol-city of Athens — the One who *giveth to all life, and breath, and all things* (Acts 17:25), in whom *we live, and move, and have our being* (Acts 17:28). *Whose are all thy ways* is the truth Belshazzar tramples: to refuse to glorify the One who holds your breath and orders your every step is, in the end, to be weighed and found wanting.',
       sv.verse_id, ev.verse_id, 'free', 30106
  FROM _s306_dan05_lookup sv, _s306_dan05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-5-the-wise-men-could-not-read-the-writing-but-daniel-interpreted',
       E'The wise men could not read the writing, but Daniel interpreted — the wisdom of the Most High',
       E'When the hand had written, *the king cried aloud to bring in the astrologers, the Chaldeans, and the soothsayers* (Daniel 5:7), but *Then came in all the king''s wise men: but they could not read the writing, nor make known to the king the interpretation thereof* (Daniel 5:8). Babylon''s assembled wisdom is dumb before the hand of heaven, and Daniel alone is brought in, the one in whom is *interpreting of dreams, and shewing of hard sentences, and dissolving of doubts* (5:12). This is the fixed pattern of the whole book: where the wisdom of the empire fails, the wisdom of the Most High is given to His servant. It was so in ch2, before this very throne''s father: *The secret which the king hath demanded cannot the wise men, the astrologers, the magicians, the soothsayers, shew unto the king; But there is a Elohim (God) in heaven that revealeth secrets, and maketh known to the king Nebuchadnezzar what shall be in the latter days* (Daniel 2:27-28). And Nebuchadnezzar confessed it: *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets* (Daniel 2:47). The same Daniel, the same indwelling Spirit, the same Most High who reveals what no astrologer can read — across the reigns of Babylon and into the night of its fall.',
       sv.verse_id, ev.verse_id, 'free', 30109
  FROM _s306_dan05_lookup sv, _s306_dan05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Let me be weighed in an even balance, that Elohim (God) may know mine integrity* (Job 31:6) — the very figure of Daniel 5:27; every life set in the balance of the Most High.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *to be laid in the balance, they are altogether lighter than vanity* (Psalm 62:9) — men of high degree weighed and found wanting; the king at the height of empire weighs nothing.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=62 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahuah (LORD) weigheth the spirits* (Proverbs 16:2) — the feast looked clean in the king''s own eyes; the hand writes the weighing on the wall.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) pondereth the hearts* (Proverbs 21:2) — the One who ponders the heart is the One who holds the scale that finds Belshazzar wanting.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Babylon the great is fallen, is fallen* (Revelation 18:2) — *Elohim hath numbered thy kingdom, and finished it* (Daniel 5:26); the first fall is the standing type of the proud world-empire''s end.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=26
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-thou-art-weighed-in-the-balances-and-art-found-wanting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils* (1 Corinthians 10:21) — Belshazzar joins the holy vessels to the praise of idols (Daniel 5:23); the two tables cannot stand together.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-praised-the-gods-of-gold-and-the-holy-vessels-profaned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *until the day that I visit them... then will I bring them up, and restore them* (Jeremiah 27:22) — the temple vessels (Daniel 5:2) were under a promise of return; the visitation falls on Babylon that night.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=27 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-praised-the-gods-of-gold-and-the-holy-vessels-profaned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he giveth to all life, and breath, and all things* (Acts 17:25) — the breath the king spends praising dead gods is His gift; *the Elohim in whose hand thy breath is* (Daniel 5:23).'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *in him we live, and move, and have our being* (Acts 17:28) — *whose are all thy ways* (Daniel 5:23); every step of the proud king is held by the One he will not glorify.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *In whose hand is the soul of every living thing, and the breath of all mankind* (Job 12:10) — Job states the truth Belshazzar refuses to honour (Daniel 5:23).'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *those that walk in pride he is able to abase* (Daniel 4:37) — Belshazzar *knewest all this* (Daniel 5:22), his father''s confession before him, yet would not humble his heart.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=22
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13) — the self-exalting fall behind Belshazzar''s *lifted up thyself against Yahuah of heaven* (Daniel 5:23).'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I will be like the El Elyon (most High)* (Isaiah 14:14) — the boast to reach the Most High''s place; Belshazzar would not glorify the El Elyon his father confessed.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-elohim-in-whose-hand-thy-breath-is-hast-thou-not-glorified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *cannot the wise men, the astrologers, the magicians, the soothsayers, shew unto the king* (Daniel 2:27) — Babylon''s wisdom dumb before heaven; the same helplessness as *they could not read the writing* (Daniel 5:8).'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-wise-men-could-not-read-the-writing-but-daniel-interpreted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *there is a Elohim (God) in heaven that revealeth secrets* (Daniel 2:28) — where the wise men fail to read the wall, the Most High gives the reading to Daniel.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-wise-men-could-not-read-the-writing-but-daniel-interpreted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *your Elohim (God) is... a revealer of secrets* (Daniel 2:47) — Nebuchadnezzar''s confession; the same gift in Daniel the queen commends (Daniel 5:12), across the reigns.'
  FROM cross_reference_threads t
  JOIN _s306_dan05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s306_dan05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-5-the-wise-men-could-not-read-the-writing-but-daniel-interpreted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_6.sql (Daniel 6) -----
-- Chapter: Daniel 6 — Daniel in the lions' den. Darius sets him over the realm; the jealous
-- presidents can find no fault *except... concerning the law of his Elohim (God)* and trap him
-- with a signed, unalterable decree forbidding prayer to any but the king. Daniel, knowing the
-- writing was signed, *kneeled upon his knees three times a day, and prayed... his windows being
-- open... toward Jerusalem, as he did aforetime*; cast into the den, *my Elohim (God) hath sent his
-- angel, and hath shut the lions'' mouths*; he is taken up *because he believed in his Elohim
-- (God)*; and Darius decrees that all tremble before *the living Elohim (God), and stedfast for
-- ever, and his kingdom that which shall not be destroyed... He delivereth and rescueth*.
-- The blameless servant falsely accused, the covenant prayer-posture kept unto death, the angel
-- that shuts the lions' mouths (woven FORWARD to Hebrews 11 and 2 Timothy 4), and the pagan king
-- compelled to confess the everlasting kingdom (the 2:44/2:47/3:29/4:37/7:14 pattern).
-- Tag: dan06   Session: s306   Temp view: _s306_dan06_lookup
-- Sort band: base 30125, step 3 -> threads at 30125, 30128, 30131, 30134 (4 threads)
-- Source of EVERY row: 'canon','daniel',6,v
--
-- Daniel 6 coverage:
--   v.1-3 (Darius set 120 princes... Daniel preferred above the presidents... an excellent spirit)
--        NT:     none warranted (the promotion that provokes the envy; preface to THREAD 4)
--        Extras: none warranted
--        Tanakh: none separate (narrative setup; the Yosef-pattern envy carried in prose of THREAD 4)
--   ★ v.4-5 (sought to find occasion against Daniel... could find none... he was faithful... except
--          we find it against him concerning the law of his Elohim (God))
--        NT:     ★ 1 Peter 2:12 (whereas they speak against you as evildoers... by your good works),
--                ★ 1 Peter 3:16 (they may be ashamed that falsely accuse your good conversation) —
--                THREAD 4 (the blameless servant accused only for his faith)
--        Extras: none warranted
--        Tanakh: held in prose — the no-fault-found innocence carried into THREAD 2 (innocency found
--                in me, 6:22) and the Yosef-pattern envy noted in THREAD 4 prose
--   v.6-9 (a royal statute... whosoever shall ask a petition of any Elohim (God) or man for thirty
--          days, save of thee, O king... cast into the den of lions... the writing signed)
--        NT:     none warranted (the trap decree; the answer is THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (the unalterable decree of the Medes and Persians; the snare the
--                faithful prayer of v.10 defies)
--   ★ v.10 (when Daniel knew that the writing was signed... his windows being open in his chamber
--          toward Jerusalem, he kneeled upon his knees three times a day, and prayed... as aforetime)
--        NT:     ★ Acts 5:29 (We ought to obey Elohim (God) rather than men) — THREAD 1 (obey Yahuah
--                rather than the king's decree)
--        Extras: none warranted
--        Tanakh: ★★ 1 Kings 8:48 (pray unto thee toward... the city which thou hast chosen),
--                ★★ 2 Chronicles 6:38 (pray toward... the city which thou hast chosen), ★ Psalm 55:17
--                (Evening, and morning, and at noon, will I pray) — THREAD 1 (the covenant prayer-
--                posture toward Jerusalem, evening-morning-noon, kept despite the decree)
--   v.11-15 (found Daniel praying... the king sore displaced... laboured till the going down of the
--          sun to deliver him... no decree the king establisheth may be changed)
--        NT:     none warranted (the accusers press the unalterable decree; held to THREAD 1/2)
--        Extras: none warranted
--        Tanakh: none separate
--   v.16-21 (cast him into the den... Thy Elohim (God) whom thou servest continually, he will deliver
--          thee... a stone... sealed... the king passed the night fasting... servant of the living
--          Elohim (God), is thy Elohim (God)... able to deliver thee from the lions?)
--        NT:     held to THREAD 2 (the deliverance answered v.22-23)
--        Extras: none warranted
--        Tanakh: none separate (the stone on the den's mouth + the king's question answered in v.22)
--   ★ v.22-23 (My Elohim (God) hath sent his angel, and hath shut the lions'' mouths... innocency was
--          found in me... no manner of hurt... because he believed in his Elohim (God))
--        NT:     ★★ Hebrews 11:33 (through faith... stopped the mouths of lions), ★ 2 Timothy 4:17
--                (I was delivered out of the mouth of the lion) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Psalm 34:7 (the angel of Yahuah (LORD) encampeth round about them that fear him,
--                and delivereth them), ★ Psalm 91:11-13 (he shall give his angels charge over thee...
--                thou shalt tread upon the lion), ★ Psalm 22:21 (Save me from the lion''s mouth) —
--                THREAD 2 (the angel sent, the lions' mouths shut, faith that delivered)
--   v.24 (the accusers cast in... the lions had the mastery of them, and brake all their bones)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none separate (the snare returns on the snarers; the den that did not harm the
--                faithful devours the accusers; held in prose of THREAD 2/4)
--   ★ v.25-27 (Darius wrote unto all people... men tremble and fear before the Elohim (God) of Daniel:
--          for he is the living Elohim (God), and stedfast for ever, and his kingdom that which shall
--          not be destroyed... He delivereth and rescueth... who hath delivered Daniel from the lions)
--        NT:     none warranted distinct (the everlasting-kingdom confession; the NT-fulfilment of
--                Dan 7:14 dominion belongs to ch.7, bound laterally here within the book)
--        Extras: none warranted
--        Tanakh: ★ Daniel 2:44 (the Elohim of heaven shall set up a kingdom, which shall never be
--                destroyed), ★ Daniel 7:14 (his dominion is an everlasting dominion... his kingdom
--                that which shall not be destroyed), ★ Daniel 2:47 (your Elohim is a Elohim of gods),
--                ★ Daniel 3:29 (no other Elohim that can deliver after this sort), ★ Daniel 4:37
--                (I Nebuchadnezzar praise... the King of heaven) — THREAD 3 (the pagan king confesses
--                the everlasting kingdom — the recurring pattern of the book)
--   v.28 (So this Daniel prospered in the reign of Darius, and in the reign of Cyrus) — narrative
--          close; none warranted
--
-- Threads (slug — target libraries):
--   1. daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime — NT (Acts 5)
--        + Tanakh (1 Kings 8, 2 Chronicles 6, Psalm 55) [free]
--      (★ the covenant prayer-posture toward Jerusalem, evening-morning-noon, kept despite the signed
--        decree; obey Yahuah rather than men)
--   2. daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths — NT (Hebrews 11, 2 Timothy 4)
--        + Tanakh (Psalm 34, Psalm 91, Psalm 22) [free]
--      (★ the angel sent, the lions' mouths shut, the faithful preserved; *stopped the mouths of lions*)
--   3. daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed — Tanakh (Daniel 2,
--        Daniel 7, Daniel 3, Daniel 4) [free]
--      (★ the pagan king confesses the everlasting kingdom — the 2:44/2:47/3:29/4:37/7:14 pattern)
--   4. daniel-6-they-could-find-no-fault-except-concerning-the-law-of-his-elohim — NT (1 Peter 2,
--        1 Peter 3) [free]
--      (★ the blameless servant accused only for his faith; the righteous falsely accused → the den
--        a death-and-deliverance figure)
--
-- Framing notes:
--   ★ TOWARD JERUSALEM, AS HE DID AFORETIME (THREAD 1): the decree forbids prayer to any *Elohim
--      (God) or man... save of thee, O king* (6:7), and Daniel's answer is not defiance for its own
--      sake but faithfulness *as he did aforetime*: *Now when Daniel knew that the writing was signed,
--      he went into his house; and his windows being open in his chamber toward Jerusalem, he kneeled
--      upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he
--      did aforetime* (Daniel 6:10). This is the very posture Solomon foresaw for the captivity —
--      *and pray unto thee toward their land... the city which thou hast chosen, and the house which
--      I have built for thy name* (1 Kings 8:48; 2 Chronicles 6:38) — and the rhythm David sang:
--      *Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice*
--      (Psalm 55:17). When the king's law and Yahuah's worship collide, the remnant answers with the
--      apostles: *We ought to obey Elohim (God) rather than men* (Acts 5:29). Daniel obeys Yahuah and
--      lets the den come.
--   ★ HE HATH SHUT THE LIONS' MOUTHS (THREAD 2): cast in and sealed under a stone, Daniel is
--      preserved: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they
--      have not hurt me: forasmuch as before him innocency was found in me* (Daniel 6:22), *and no
--      manner of hurt was found upon him, because he believed in his Elohim (God)* (6:23). Hebrews
--      lists this very deliverance among the acts of faith — *Who through faith... stopped the mouths
--      of lions* (Hebrews 11:33) — and Paul testifies to the same hand in his own trial: *I was
--      delivered out of the mouth of the lion* (2 Timothy 4:17). The Psalms name the deliverer and
--      the very enemy: *The angel of Yahuah (LORD) encampeth round about them that fear him, and
--      delivereth them* (Psalm 34:7); *he shall give his angels charge over thee... Thou shalt tread
--      upon the lion and adder* (Psalm 91:11,13); *Save me from the lion''s mouth* (Psalm 22:21). The
--      angel sent into the den is the encamping angel of Yahuah; faith shut the lions' mouths.
--   ★ HIS KINGDOM THAT WHICH SHALL NOT BE DESTROYED (THREAD 3): the deliverance wrings from Darius the
--      same confession the whole book wrings from its kings — *men tremble and fear before the Elohim
--      (God) of Daniel: for he is the living Elohim (God), and stedfast for ever, and his kingdom that
--      which shall not be destroyed, and his dominion shall be even unto the end. He delivereth and
--      rescueth, and he worketh signs and wonders in heaven and in earth* (Daniel 6:26-27). The
--      everlasting kingdom Darius names is the very kingdom revealed by vision: *the Elohim (God) of
--      heaven shall set up a kingdom, which shall never be destroyed* (Daniel 2:44); *his dominion is
--      an everlasting dominion, which shall not pass away, and his kingdom that which shall not be
--      destroyed* (Daniel 7:14). And the pagan-confession pattern runs the book: *your Elohim (God) is
--      a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47); *there is no other Elohim
--      (God) that can deliver after this sort* (Daniel 3:29); *Now I Nebuchadnezzar praise and extol
--      and honour the King of heaven* (Daniel 4:37). The empires confess the kingdom that outlasts them.
--   ★ NO FAULT EXCEPT CONCERNING THE LAW OF HIS ELOHIM (THREAD 4): the envious presidents search and
--      come up empty — *they could find none occasion nor fault; forasmuch as he was faithful, neither
--      was there any error or fault found in him* (Daniel 6:4) — and conclude: *We shall not find any
--      occasion against this Daniel, except we find it against him concerning the law of his Elohim
--      (God)* (Daniel 6:5). The only "crime" is his faithfulness to Yahuah; the blameless servant is
--      accused solely for his devotion. Peter names this exact pattern of the falsely-accused faithful:
--      *whereas they speak against you as evildoers, they may by your good works, which they shall
--      behold, glorify Elohim (God) in the day of visitation* (1 Peter 2:12); *that, whereas they speak
--      evil of you, as of evildoers, they may be ashamed that falsely accuse your good conversation in
--      Messiah (Christ)* (1 Peter 3:16). The righteous man framed for his obedience, sealed in a den of
--      death, and brought up alive — a death-and-deliverance figure of the One falsely accused who rose.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the promotion that provokes the envy — the Yosef-pattern setup
--      carried in THREAD 4 prose); v.6-9 (the trap decree the prayer of v.10 defies — THREAD 1); v.11-15
--      (the accusers press the unalterable decree); v.16-21 (the casting-in, the sealed stone, the
--      king's question — answered in THREAD 2); v.24 (the snare returns on the snarers — held in prose);
--      v.28 (the narrative close, Daniel prospering under Darius and Cyrus). All recorded above.

CREATE TEMP VIEW _s306_dan06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): his windows being open toward Jerusalem, he prayed as aforetime
    ('canon','daniel',6,10,'canon','1-kings',8,48,'free',
      E'*And so return unto thee with all their heart, and with all their soul, in the land of their enemies, which led them away captive, and pray unto thee toward their land, which thou gavest unto their fathers, the city which thou hast chosen, and the house which I have built for thy name* (1 Kings 8:48). Solomon foresaw the captivity praying *toward... the city which thou hast chosen* — and Daniel, in Babylon, does exactly that: *his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed* (Daniel 6:10). The covenant posture kept in exile, despite the signed decree.'),
    ('canon','daniel',6,10,'canon','2-chronicles',6,38,'free',
      E'*If they return to thee with all their heart and with all their soul in the land of their captivity, whither they have carried them captives, and pray toward their land, which thou gavest unto their fathers, and toward the city which thou hast chosen, and toward the house which I have built for thy name* (2 Chronicles 6:38). The dedication prayer scripts Daniel''s very act: *toward the city which thou hast chosen*. With *his windows being open... toward Jerusalem* (Daniel 6:10), Daniel prays the prayer Solomon prepared for the scattered — the worship that the king''s decree cannot cancel.'),
    ('canon','daniel',6,10,'canon','psalms',55,17,'free',
      E'*Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice* (Psalm 55:17). David''s threefold daily prayer is Daniel''s rhythm: *he kneeled upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he did aforetime* (Daniel 6:10). Evening, morning, and noon — the settled habit of the faithful — is what the decree tried to outlaw, and what Daniel would not surrender.'),
    ('canon','daniel',6,10,'canon','acts',5,29,'free',
      E'*Then Peter and the other apostles answered and said, We ought to obey Elohim (God) rather than men* (Acts 5:29). When the king''s statute forbids prayer to any *Elohim (God) or man... save of thee, O king* (Daniel 6:7), Daniel answers as the apostles will — he keeps praying *as he did aforetime* (Daniel 6:10). The remnant obeys Yahuah rather than the decree of men, and lets the den come.'),

    -- THREAD 2 (★): My Elohim hath sent his angel, and hath shut the lions' mouths
    ('canon','daniel',6,22,'canon','hebrews',11,33,'free',
      E'*Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33). Hebrews catalogues this very night among the mighty acts of faith — *stopped the mouths of lions* is Daniel in the den: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22). The faith that shut their mouths is the faith Hebrews names; *because he believed in his Elohim (God)* (6:23) no hurt was found upon him.'),
    ('canon','daniel',6,22,'canon','2-timothy',4,17,'free',
      E'*Notwithstanding Yahuah (Lord) stood with me, and strengthened me; that by me the preaching might be fully known, and that all the Gentiles might hear: and I was delivered out of the mouth of the lion* (2 Timothy 4:17). Paul, on trial and forsaken, claims Daniel''s deliverance as his own — *delivered out of the mouth of the lion* echoes *he hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22). The same hand that sent the angel into the den stood with Paul in the court.'),
    ('canon','daniel',6,22,'canon','psalms',34,7,'free',
      E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). Daniel names exactly this angel: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths* (Daniel 6:22). The angel of Yahuah pitches his camp about those who fear Him — Daniel feared Him unto the den — and delivers them out of it.'),
    ('canon','daniel',6,22,'canon','psalms',91,11,'free',
      E'*For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11). The Psalm promises the angelic guard, and the next breath names the very beast of the den: *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet* (Psalm 91:13). Daniel walks it out — *he hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22); the angel charged to keep him kept him among the lions.'),
    ('canon','daniel',6,22,'canon','psalms',22,21,'free',
      E'*Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns* (Psalm 22:21). The suffering one''s cry is answered in the den: *he hath shut the lions'' mouths, that they have not hurt me* (Daniel 6:22). What the Psalm pleads — deliverance from the lion''s mouth — Daniel receives bodily; and *no manner of hurt was found upon him, because he believed in his Elohim (God)* (6:23).'),

    -- THREAD 3 (★): he is the living Elohim, and his kingdom that which shall not be destroyed
    ('canon','daniel',6,26,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people, but it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). Darius'' decree names the kingdom the vision revealed: *his kingdom that which shall not be destroyed, and his dominion shall be even unto the end* (Daniel 6:26) is the kingdom *which shall never be destroyed... it shall stand for ever*. The pagan king confesses what the dream foretold.'),
    ('canon','daniel',6,26,'canon','daniel',7,14,'free',
      E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The everlasting kingdom Darius confesses is the dominion given to the One like the Son of Adam — *his kingdom that which shall not be destroyed* (Daniel 6:26) is word for word *his kingdom that which shall not be destroyed* (7:14). The king''s decree names what the night-vision shows: the indestructible everlasting reign.'),
    ('canon','daniel',6,26,'canon','daniel',2,47,'free',
      E'*The king answered unto Daniel, and said, Of a truth it is, that your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings, and a revealer of secrets, seeing thou couldest reveal this secret* (Daniel 2:47). Nebuchadnezzar''s first confession is the pattern Darius now repeats — *the living Elohim (God), and stedfast for ever* (Daniel 6:26). The Most High bends the mouths of empires, one king after another, to confess Him.'),
    ('canon','daniel',6,26,'canon','daniel',3,29,'free',
      E'*Therefore I make a decree, That every people, nation, and language, which speak any thing amiss against the Elohim (God) of Shadrach, Meshach, and Abed-nego, shall be cut in pieces... because there is no other Elohim (God) that can deliver after this sort* (Daniel 3:29). After the furnace Nebuchadnezzar decreed reverence for the delivering Elohim; after the den Darius decrees the same — *He delivereth and rescueth* (Daniel 6:27). The deliverance from fire and the deliverance from lions wring the identical confession from the throne.'),
    ('canon','daniel',6,26,'canon','daniel',4,37,'free',
      E'*Now I Nebuchadnezzar praise and extol and honour the King of heaven, all whose works are truth, and his ways judgment: and those that walk in pride he is able to abase* (Daniel 4:37). The full praise Nebuchadnezzar reached after his humbling is the confession Darius now makes — *he is the living Elohim (God), and stedfast for ever* (Daniel 6:26). The book marches its kings, one by one, to honour the King of heaven.'),

    -- THREAD 4 (★): they could find no fault except concerning the law of his Elohim
    ('canon','daniel',6,5,'canon','1-peter',2,12,'free',
      E'*Having your conversation honest among the Gentiles: that, whereas they speak against you as evildoers, they may by your good works, which they shall behold, glorify Elohim (God) in the day of visitation* (1 Peter 2:12). Daniel''s accusers can find nothing but his faith to charge — *except we find it against him concerning the law of his Elohim (God)* (Daniel 6:5) — for *he was faithful, neither was there any error or fault found in him* (6:4). Peter names the same pattern: the blameless are slandered *as evildoers*, and their good works answer the slander.'),
    ('canon','daniel',6,5,'canon','1-peter',3,16,'free',
      E'*Having a good conscience; that, whereas they speak evil of you, as of evildoers, they may be ashamed that falsely accuse your good conversation in Messiah (Christ)* (1 Peter 3:16). The presidents *falsely accuse* the faultless Daniel — their only handle is *the law of his Elohim (God)* (Daniel 6:5). Peter''s word fits exactly: the accusers of a *good conscience* shall *be ashamed*, as Daniel''s did when the den that should have killed him brought him up alive.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime',
       E'His windows being open toward Jerusalem, he prayed as aforetime — obey Yahuah rather than men',
       E'The trap is a decree against worship: the jealous presidents persuade Darius to sign a *firm decree, that whosoever shall ask a petition of any Elohim (God) or man for thirty days, save of thee, O king, he shall be cast into the den of lions* (Daniel 6:7), sealed *according to the law of the Medes and Persians, which altereth not* (6:8). Daniel''s answer is not reckless defiance but steady faithfulness — he does what he always did: *Now when Daniel knew that the writing was signed, he went into his house; and his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed, and gave thanks before his Elohim (God), as he did aforetime* (Daniel 6:10). The posture is the covenant''s own. Solomon, dedicating the house, foresaw the captivity praying just so: *and pray unto thee toward their land, which thou gavest unto their fathers, the city which thou hast chosen, and the house which I have built for thy name* (1 Kings 8:48); *and pray toward their land... and toward the city which thou hast chosen, and toward the house which I have built for thy name* (2 Chronicles 6:38). And the rhythm is David''s: *Evening, and morning, and at noon, will I pray, and cry aloud: and he shall hear my voice* (Psalm 55:17). When the king''s law and Yahuah''s worship collide, the remnant answers with the apostles: *We ought to obey Elohim (God) rather than men* (Acts 5:29). Daniel keeps the window open toward the chosen city and lets the den come.',
       sv.verse_id, ev.verse_id, 'free', 30125
  FROM _s306_dan06_lookup sv, _s306_dan06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths',
       E'My Elohim hath sent his angel, and hath shut the lions'' mouths',
       E'Cast into the den and sealed under a stone, Daniel is kept untouched, and at dawn he names how: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt* (Daniel 6:22). He is taken up *and no manner of hurt was found upon him, because he believed in his Elohim (God)* (6:23). The whole library reaches for this night. Hebrews lists it among the acts of faith: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions* (Hebrews 11:33) — the very faith *because he believed in his Elohim (God)* that *stopped the mouths of lions*. Paul, on trial and abandoned, claims the same hand: *Notwithstanding Yahuah (Lord) stood with me, and strengthened me... and I was delivered out of the mouth of the lion* (2 Timothy 4:17). And the Psalms name the angel and the very beast: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7); *For he shall give his angels charge over thee, to keep thee in all thy ways... Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet* (Psalm 91:11,13); *Save me from the lion''s mouth: for thou hast heard me from the horns of the unicorns* (Psalm 22:21). The angel sent into the den is the encamping angel of Yahuah; faith shut the lions'' mouths, and the man of prayer walked out whole.',
       sv.verse_id, ev.verse_id, 'free', 30128
  FROM _s306_dan06_lookup sv, _s306_dan06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed',
       E'He is the living Elohim, and his kingdom that which shall not be destroyed — the king confesses the everlasting kingdom',
       E'The deliverance from the den wrings from Darius the same confession the whole book wrings from its kings. He writes to all the earth: *I make a decree, That in every dominion of my kingdom men tremble and fear before the Elohim (God) of Daniel: for he is the living Elohim (God), and stedfast for ever, and his kingdom that which shall not be destroyed, and his dominion shall be even unto the end. He delivereth and rescueth, and he worketh signs and wonders in heaven and in earth, who hath delivered Daniel from the power of the lions* (Daniel 6:26-27). The everlasting kingdom the pagan king names is the very kingdom revealed by vision: *the Elohim (God) of heaven shall set up a kingdom, which shall never be destroyed... it shall stand for ever* (Daniel 2:44); and the dominion given to the One like the Son of Adam — *his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14) — is word for word Darius'' *his kingdom that which shall not be destroyed*. And the pattern of compelled confession runs the whole book: *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47); *there is no other Elohim (God) that can deliver after this sort* (Daniel 3:29); *Now I Nebuchadnezzar praise and extol and honour the King of heaven* (Daniel 4:37). One throne after another — Babylon and now Persia — is bent to confess the living Elohim whose kingdom outlasts every empire that thought to destroy His servants.',
       sv.verse_id, ev.verse_id, 'free', 30131
  FROM _s306_dan06_lookup sv, _s306_dan06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-6-they-could-find-no-fault-except-concerning-the-law-of-his-elohim',
       E'They could find no fault, except concerning the law of his Elohim — the blameless servant falsely accused',
       E'The plot begins in envy. Daniel is *preferred above the presidents and princes, because an excellent spirit was in him* (Daniel 6:3), and they hunt for a charge: *Then the presidents and princes sought to find occasion against Daniel concerning the kingdom; but they could find none occasion nor fault; forasmuch as he was faithful, neither was there any error or fault found in him* (Daniel 6:4). The blameless man gives them nothing — so they conclude that his only vulnerability is his devotion: *We shall not find any occasion against this Daniel, except we find it against him concerning the law of his Elohim (God)* (Daniel 6:5). His sole "crime" is faithfulness to Yahuah; the righteous servant is framed for his obedience. Peter names this very pattern of the slandered faithful: *Having your conversation honest among the Gentiles: that, whereas they speak against you as evildoers, they may by your good works, which they shall behold, glorify Elohim (God) in the day of visitation* (1 Peter 2:12); *Having a good conscience; that, whereas they speak evil of you, as of evildoers, they may be ashamed that falsely accuse your good conversation in Messiah (Christ)* (1 Peter 3:16). The innocent man, accused only for his faith, sealed under a stone in a den of death, and brought up alive in the morning — *no manner of hurt was found upon him* (6:23) — is a death-and-deliverance figure of the One who, found with no fault and falsely accused, was sealed in a tomb and rose, while the accusers were *ashamed*.',
       sv.verse_id, ev.verse_id, 'free', 30134
  FROM _s306_dan06_lookup sv, _s306_dan06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *pray unto thee toward their land... the city which thou hast chosen, and the house which I have built for thy name* (1 Kings 8:48) — Solomon foresaw the captivity praying toward Jerusalem; Daniel keeps it *as he did aforetime*.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *pray toward... the city which thou hast chosen, and toward the house which I have built for thy name* (2 Chronicles 6:38) — the dedication prayer scripts Daniel''s very act with the windows open toward Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=6 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Evening, and morning, and at noon, will I pray, and cry aloud* (Psalm 55:17) — David''s threefold daily prayer is Daniel''s rhythm: *three times a day, and prayed... as he did aforetime*.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *We ought to obey Elohim (God) rather than men* (Acts 5:29) — the apostolic answer to the king''s decree; Daniel keeps praying despite the signed writing.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-his-windows-being-open-toward-jerusalem-he-prayed-as-aforetime'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *through faith... stopped the mouths of lions* (Hebrews 11:33) — Hebrews names Daniel''s den among the acts of faith; *because he believed in his Elohim (God)* the lions'' mouths were shut.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I was delivered out of the mouth of the lion* (2 Timothy 4:17) — Paul claims Daniel''s deliverance as his own; the same hand that sent the angel into the den stood with him in the court.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7) — exactly *My Elohim (God) hath sent his angel*; the angel encamps about the one who feared Him unto the den.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he shall give his angels charge over thee... Thou shalt tread upon the lion* (Psalm 91:11,13) — the angelic guard and the very beast of the den; the angel charged to keep Daniel kept him among the lions.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Save me from the lion''s mouth* (Psalm 22:21) — the suffering one''s cry answered bodily in the den: *he hath shut the lions'' mouths, that they have not hurt me*.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-my-elohim-hath-sent-his-angel-and-shut-the-lions-mouths'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the Elohim (God) of heaven shall set up a kingdom, which shall never be destroyed... it shall stand for ever* (Daniel 2:44) — the kingdom Darius confesses *which shall not be destroyed* is the kingdom the dream foretold.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *his dominion is an everlasting dominion... his kingdom that which shall not be destroyed* (Daniel 7:14) — word for word Darius'' decree; the dominion given to the One like the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *your Elohim (God) is a Elohim (God) of gods, and a Yahuah (Lord) of kings* (Daniel 2:47) — Nebuchadnezzar''s first confession; the pattern Darius now repeats under the next empire.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *there is no other Elohim (God) that can deliver after this sort* (Daniel 3:29) — the furnace wrung this decree from Nebuchadnezzar; the den wrings *He delivereth and rescueth* from Darius.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Now I Nebuchadnezzar praise and extol and honour the King of heaven* (Daniel 4:37) — the full praise after his humbling; the book marches its kings, one by one, to honour the King of heaven.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=26
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=4 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-he-is-the-living-elohim-and-his-kingdom-shall-not-be-destroyed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *whereas they speak against you as evildoers... by your good works... glorify Elohim (God)* (1 Peter 2:12) — the slandered faithful; Daniel''s only charge is *the law of his Elohim (God)*.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-they-could-find-no-fault-except-concerning-the-law-of-his-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they may be ashamed that falsely accuse your good conversation in Messiah (Christ)* (1 Peter 3:16) — the accusers of a good conscience shall be ashamed, as Daniel''s were when the den brought him up alive.'
  FROM cross_reference_threads t
  JOIN _s306_dan06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s306_dan06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-6-they-could-find-no-fault-except-concerning-the-law-of-his-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_7.sql (Daniel 7) -----
-- Chapter: Daniel 7 — THE KEYSTONE of the book: the four beasts from the sea (the four world-empires),
-- the Ancient of Days enthroned with the judgment set and the books opened, ONE LIKE THE SON OF ADAM
-- coming WITH THE CLOUDS OF HEAVEN to receive an everlasting dominion, the little horn that makes war
-- with the saints and thinks to change times and laws, and the saints of the El Elyon (most High) who
-- take and possess the kingdom for ever. The single most important Tanakh chapter for the Formed-Son /
-- Son-of-Adam Christology, and THE Tanakh kaph-comparative carve-out: "one LIKE the Son of Adam" (7:13).
-- Tag: dan07   Session: s306   Temp view: _s306_dan07_lookup
-- Sort band: base 30150, step 3 -> threads at 30150, 30153, 30156, 30159, 30162, 30165 (6 threads)
-- Source of EVERY row: 'canon','daniel',7,v
--
-- Daniel 7 coverage:
--   v.1 (Belshazzar; Daniel's dream and visions; he wrote the dream)
--        NT: none warranted   Extras: none warranted   Tanakh: none separate (the frame; preface)
--   ★ v.2-8 (the four winds strove upon the great sea; four great beasts — lion/eagle-wings, bear with
--           three ribs, leopard with four heads, dreadful iron-toothed beast with ten horns; the little
--           horn with eyes and a mouth speaking great things)
--        NT:     ★ Revelation 13:1-2 (the beast from the sea, like a leopard, feet of a bear, mouth of a
--                lion — John gathers all four of Daniel's beasts into one) — THREAD 6
--        Extras: none warranted (no clean Similitudes/Jubilees beast-parallel; held to canon)
--        Tanakh: ★★ Daniel 2:40,44 (the fourth iron kingdom + the stone-kingdom that breaks them all) —
--                THREAD 6 (the four metals of ch2 = the four beasts of ch7, same succession)
--   ★★ v.9-10 (the thrones cast down, the Ancient of days sat, garment white as snow, hair like pure
--           wool, throne the fiery flame, wheels burning fire; a fiery stream; thousand thousands
--           ministered, ten thousand times ten thousand stood; the judgment set, the books opened)
--        NT:     ★★ Revelation 20:11-12 (the great white throne, the dead judged, the books opened),
--                ★ Revelation 5:11 (ten thousand times ten thousand round the throne) — THREAD 3
--        Extras: ★★ 1 Enoch 14:15-18 (Enoch's throne-vision: the throne like crystal, the flaming fire,
--                columns of fire), ★★ 1 Enoch 47:3 (the Head of Days seated on the throne of His glory,
--                the books of the living opened before Him) — THREAD 3 (extras tier)
--        Tanakh: the throne-of-fire woven in prose; books-opened also at Daniel 12:1 (held there)
--   v.11-12 (the beast slain, body given to the burning flame; the rest of the beasts' dominion taken,
--           lives prolonged a season)
--        NT: held in prose (the beast's end answered in THREAD 5 by Rev 20:10 / Dan 7:26)   Extras: none
--        Tanakh: none separate (the verdict executed; woven into the little-horn thread)
--   ★★★ v.13-14 (one LIKE THE SON OF ADAM came WITH THE CLOUDS of heaven, came to the Ancient of days,
--           brought near before him; given dominion, glory, a kingdom, all people serve him; AN
--           EVERLASTING DOMINION which shall not pass away)
--        NT:     ★★★ Matthew 24:30 + ★★★ Matthew 26:64 + ★★★ Mark 14:62 (the Son of Adam coming in the
--                clouds — Yahusha's own self-citation of this verse), ★★ Revelation 1:7 (Behold, he
--                cometh with clouds), ★ Revelation 1:13 + ★ Revelation 14:14 (one like unto the Son of
--                Adam), ★ Revelation 11:15 (the everlasting kingdom) — THREAD 1 [free]
--        Extras: ★★★ 1 Enoch 46:1-3 (the Son of Adam with the Head of Days), ★★★ 1 Enoch 48:2-3 (his
--                name named before the sun and the stars), ★ 1 Enoch 49:2 (the Elect One before the
--                Yahuah of Spirits) — THREAD 2 [extras] (the Similitudes' direct development of THIS vision)
--        Tanakh: ★★ Psalm 110:1 (Sit thou at my right hand), ★★ Psalm 2:7 (Thou art my Son), ★ Daniel
--                2:44 (the everlasting kingdom) — THREAD 1
--   ★★ KAPH CARVE-OUT at 7:13: "one LIKE the Son of Adam" — the kaph-comparative is PRESERVED verbatim
--      ("like") in every note and member: the FORMED Son, brought near before the Ancient of Days (the
--      Father), who RECEIVES the everlasting kingdom; Yahuah who has a Father — NOT co-equal-persons, NOT
--      Arian/created. The "like" guards the Formed cloud-rider who took flesh, never a standing counterfeit.
--   v.15-17 (Daniel grieved; asks the interpretation; four beasts = four kings out of the earth)
--        NT: none warranted   Extras: none warranted   Tanakh: none separate (interpretation seam)
--   ★★ v.18 (the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for
--           ever, even for ever and ever)
--        NT:     ★★ Revelation 5:10 (made us kings; we shall reign on the earth), ★★ Revelation 20:4
--                (they lived and reigned with Messiah), ★ Matthew 25:34 (inherit the kingdom prepared),
--                ★★ Luke 12:32 (your Father's good pleasure to give you the kingdom) — THREAD 4 [free]
--        Extras: none warranted (clean canon weave)
--        Tanakh: ★ Daniel 2:44 (the kingdom that shall never be destroyed) — THREAD 4
--   v.19-20 (the fourth beast again; the ten horns; the little horn with eyes and a great-speaking mouth)
--        NT: woven into THREAD 5   Extras: none   Tanakh: none separate (re-asks the fourth-beast question)
--   ★ v.21-22 (the horn made war with the saints and prevailed, UNTIL the Ancient of days came, and
--           judgment was given to the saints; the saints possessed the kingdom)
--        NT:     ★★ Revelation 13:7 (it was given unto him to make war with the saints, and to overcome
--                them) — THREAD 5 — answered by the judgment given to the saints (the war is reversed)
--        Extras: none warranted   Tanakh: none separate (the reversal repeats v.18/v.27)
--   ★ v.23-25 (the fourth kingdom; the little horn speaks great words against the El Elyon, wears out the
--           saints, and THINK TO CHANGE TIMES AND LAWS; given into his hand a time, times, and dividing)
--        NT:     ★★ 2 Thessalonians 2:4 (the man of sin exalting himself above all that is called Elohim,
--                sitting in the temple), ★ Revelation 13:5 (a mouth speaking great things and blasphemies)
--                — THREAD 5 [free]
--        Extras: none warranted (clean canon weave; no extras forced)
--        Tanakh: ★ Daniel 8:25 (he shall magnify himself; stand up against the Prince of princes), ★
--                Daniel 11:36 (the king shall do according to his will; speak marvellous things against
--                the Elohim of gods), ★★ Leviticus 23:2 (the feasts of Yahuah — the appointed times the
--                horn merely THINKS to change, and does not succeed: Torah-and-feasts never abolished) — THREAD 5
--   ★ v.26-27 (the judgment shall sit; his dominion taken away; the kingdom under the whole heaven given
--           to the people of the saints; an everlasting kingdom; all dominions serve and obey him)
--        NT:     folded into THREAD 4 (the everlasting kingdom given to the saints — Rev 20:4 etc.)
--        Extras: none warranted   Tanakh: ★ Daniel 2:44 (folded into THREAD 4)
--   v.28 (the end of the matter; Daniel troubled; kept the matter in his heart)
--        NT: none   Extras: none   Tanakh: none separate (the close)
--
-- Threads (slug — target libraries):
--   1. daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven — NT (Matthew 24, Matthew 26,
--      Mark 14, Revelation 1, Revelation 14, Revelation 11) + Tanakh (Psalm 110, Psalm 2, Daniel 2) [free]
--      (★★★ THE central thread; the kaph "like" preserved; the Formed Son brought near, receiving the
--       everlasting kingdom from the Ancient of Days the Father)
--   2. daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes — Extras (1 Enoch 46, 48, 49) [extras]
--      (★★★ the Similitudes' direct development of 7:13 — the Son of Adam with the Head of Days, his name
--       named before the sun and the stars, the Elect One; kaph "like" honored in prose)
--   3. daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened — NT (Revelation 20,
--      Revelation 5) + Extras (1 Enoch 14, 47) [extras]
--      (★★ the throne-of-fire vision; the great white throne and the books opened; Enoch's throne-vision
--       and the Head of Days with the books of the living)
--   4. daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom — NT (Revelation 5,
--      Revelation 20, Matthew 25, Luke 12) + Tanakh (Daniel 2) [free]
--      (★★ the everlasting kingdom given to the two-house restored people under Messiah — NOT replacement)
--   5. daniel-7-the-little-horn-thinks-to-change-times-and-laws — NT (2 Thessalonians 2, Revelation 13)
--      + Tanakh (Daniel 8, Daniel 11, Leviticus 23) [free]
--      (★ the antichrist horn that THINKS to change the appointed times and the Torah — and does not
--       succeed; the man of sin; the feasts/Sabbath never abolished, the anti-antinomian frame)
--   6. daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms — NT (Revelation 13) + Tanakh (Daniel 2) [free]
--      (★ the four world-empires answering the metal image of ch2; the beast of Revelation gathers all four)
--
-- Framing notes:
--   ★★★ THE SON OF ADAM WITH THE CLOUDS (THREAD 1): *I saw in the night visions, and, behold, one like
--      the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought
--      him near before him. And there was given him dominion, and glory, and a kingdom... his dominion is
--      an everlasting dominion, which shall not pass away* (Daniel 7:13-14). The KAPH carve-out: *one LIKE
--      the Son of Adam* — the comparative is preserved; this is the FORMED Son, the visible One drawn from
--      the Formless Father, brought near before the Ancient of Days (the Father, the El Elyon) and given
--      the everlasting kingdom. He is Yahuah and HAS a Father — not co-equal-persons, not a created being.
--      Yahusha names HIMSELF this cloud-rider three times at the most weighted moments: *they shall see the
--      Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30); under oath
--      before Caiaphas, *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and
--      coming in the clouds of heaven* (Matthew 26:64; Mark 14:62) — fusing Daniel 7:13 with Psalm 110:1.
--      John seals it: *Behold, he cometh with clouds* (Revelation 1:7), *one like unto the Son of Adam*
--      (Revelation 1:13; 14:14 — the kaph again), and the everlasting kingdom realized (Revelation 11:15).
--   ★★★ THE SIMILITUDES (THREAD 2): 1 Enoch's Book of Parables develops THIS very vision — *One who had a
--      head of days... and with Him was another being whose countenance had the appearance of a man... This
--      is the Son of Adam who hath righteousness* (1 Enoch 46:1,3); *before the sun and the signs were
--      created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3); the Elect One who
--      *standeth before Yahuah (God) of Spirits* (1 Enoch 49:2). The restored witness reading Daniel 7:13
--      messianically and pre-temporally — the Son of Adam named before creation, the Formed Son.
--   ★★ THE ANCIENT OF DAYS / BOOKS OPENED (THREAD 3): *the Ancient of days did sit... his throne was like
--      the fiery flame... thousand thousands ministered unto him... the judgment was set, and the books
--      were opened* (Daniel 7:9-10) -> *a great white throne... the books were opened... the dead were
--      judged* (Revelation 20:11-12); *ten thousand times ten thousand* (Revelation 5:11). Enoch saw the
--      same throne — *the throne... of stibium, and the top of the throne was of sapphire... a flaming
--      fire* (1 Enoch 14:15-18) — and the Head of Days enthroned, *the books of the living were opened
--      before Him* (1 Enoch 47:3).
--   ★★ THE SAINTS POSSESS THE KINGDOM (THREAD 4): *the saints of the El Elyon (most High) shall take the
--      kingdom, and possess the kingdom for ever* (Daniel 7:18,27) — the everlasting kingdom given to the
--      two-house restored people UNDER the Son of Adam, never a replacement people: *they lived and reigned
--      with Messiah* (Revelation 20:4); *we shall reign on the earth* (Revelation 5:10); *it is your
--      Father's good pleasure to give you the kingdom* (Luke 12:32); *inherit the kingdom prepared for you*
--      (Matthew 25:34).
--   ★ THE LITTLE HORN CHANGES TIMES AND LAWS (THREAD 5): *he shall speak great words against the El Elyon
--      (most High), and shall wear out the saints... and think to change times and laws* (Daniel 7:25). He
--      THINKS to change them — he does not succeed: the appointed times and the Torah are Yahuah's and are
--      never abolished. He is the man of sin who *as Elohim (God) sitteth in the temple of Elohim* (2
--      Thessalonians 2:4), the beast with *a mouth speaking great things and blasphemies* (Revelation 13:5)
--      who *make[s] war with the saints* (Revelation 13:7); the same self-magnifying king of Daniel 8:25
--      and 11:36. The "times and laws" he reaches for are *the feasts of Yahuah (LORD)... my feasts*
--      (Leviticus 23:2) — the calendar and Torah he cannot abolish, only counterfeit.
--   ★ THE FOUR BEASTS (THREAD 6): *four great beasts came up from the sea, diverse one from another*
--      (Daniel 7:3) — lion, bear, leopard, dreadful iron beast — the same four-empire succession as the
--      metal image of Daniel 2: *the fourth kingdom shall be strong as iron* (Daniel 2:40), broken at last
--      by the stone-kingdom *which shall never be destroyed* (Daniel 2:44). John gathers all four into one
--      end-time beast: *like unto a leopard... the feet of a bear... the mouth of a lion* (Revelation 13:2).
--   VERSES WITH NO SEPARATE ADD: v.1 (the frame), v.11-12 (the beast slain — woven into THREAD 5),
--      v.15-17 (the interpretation seam), v.19-20 (re-asks the fourth-beast question — woven into THREADS
--      5/6), v.26-27 (the everlasting kingdom — folded into THREAD 4), v.28 (the close). All recorded.

CREATE TEMP VIEW _s306_dan07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): one LIKE the Son of Adam came with the clouds of heaven — NT + Tanakh [free]
    ('canon','daniel',7,13,'canon','matthew',24,30,'free',
      E'*And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30). Yahusha (Jesus) names himself the cloud-rider of *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13). The kaph carve-out is honored — *one LIKE the Son of Adam* — the Formed Son who took flesh, coming as Daniel saw, to receive the everlasting dominion.'),
    ('canon','daniel',7,13,'canon','matthew',26,64,'free',
      E'*Yahusha (Jesus) saith unto him, Thou hast said: nevertheless I say unto you, Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64). Under oath before the high priest, Yahusha (Jesus) claims Daniel''s vision as his own, fusing *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) with *Sit thou at my right hand* (Psalm 110:1). This is the Formed Son — brought near before the Ancient of Days, Yahuah who has a Father.'),
    ('canon','daniel',7,13,'canon','mark',14,62,'free',
      E'*And Yahusha (Jesus) said, I am: and ye shall see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Mark 14:62). The plainest claim: Yahusha (Jesus) is the *one like the Son of Adam* who *came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). The kaph comparative guards the truth — the FORMED One who took flesh, not a standing counterfeit; Yahuah, and yet brought near before the Father.'),
    ('canon','daniel',7,13,'canon','revelation',1,7,'free',
      E'*Behold, he cometh with clouds; and every eye shall see him, and they also which pierced him: and all kindreds of the earth shall wail because of him. Even so, Amen* (Revelation 1:7). John seals Daniel''s vision — *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) — as the consummation: *all the tribes of the earth shall mourn* (Daniel 7:13 read through Zechariah 12:10). The cloud-coming Son of Adam is the One who was pierced.'),
    ('canon','daniel',7,13,'canon','revelation',1,13,'free',
      E'*And in the midst of the seven candlesticks one like unto the Son of Adam, clothed with a garment down to the foot, and girt about the paps with a golden girdle* (Revelation 1:13). John sees the very figure of Daniel''s vision and keeps the kaph: *one LIKE unto the Son of Adam*, echoing *one like the Son of Adam* (Daniel 7:13) — and the white hair and flame of fire of the Ancient of Days (Daniel 7:9) now rest on him. The Formed Son bears the glory of the Father.'),
    ('canon','daniel',7,14,'canon','revelation',14,14,'free',
      E'*And I looked, and behold a white cloud, and upon the cloud one sat like unto the Son of Adam, having on his head a golden crown, and in his hand a sharp sickle* (Revelation 14:14). The crowned cloud-rider of *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) now reaps — *there was given him dominion, and glory, and a kingdom* (Daniel 7:14) made manifest. John holds the kaph: *one LIKE unto the Son of Adam*, crowned upon the cloud.'),
    ('canon','daniel',7,14,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). This is Daniel''s everlasting kingdom realized — *his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:14). The dominion given to the Son of Adam *for ever and ever*.'),
    ('canon','daniel',7,13,'canon','psalms',110,1,'free',
      E'*Yahuah (LORD) said unto my Lord, Sit thou at my right hand, until I make thine enemies thy footstool* (Psalm 110:1). The Son of Adam *brought... near before* the Ancient of Days (Daniel 7:13) is the *my Lord* whom Yahuah seats at his right hand. Yahusha (Jesus) joined these two verses in one breath before Caiaphas (Matthew 26:64) — the Formed Son enthroned beside the Father, given the everlasting dominion.'),
    ('canon','daniel',7,14,'canon','psalms',2,7,'free',
      E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee. Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:7-8). The kingdom given to the Son of Adam — *that all people, nations, and languages, should serve him* (Daniel 7:14) — is the inheritance the Father grants his begotten Son. The Formed Son has a Father, and from him receives the nations.'),
    ('canon','daniel',7,14,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). The everlasting kingdom of *his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14) is the same indestructible kingdom of the stone-vision of chapter 2 — set up by the Elohim of heaven and given to the Son of Adam.'),

    -- THREAD 2 (★★★): the Son of Adam named before the sun, in the Similitudes — EXTRAS [extras]
    ('canon','daniel',7,13,'enoch','1-enoch',46,1,'extras',
      E'*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels* (1 Enoch 46:1). The Book of Parables sees exactly Daniel''s vision — a Head of Days (white like wool, Daniel 7:9) and beside him *another being whose countenance had the appearance of a man* (the kaph again, *one like the Son of Adam*, Daniel 7:13). The restored witness reads this messianically.'),
    ('canon','daniel',7,13,'enoch','1-enoch',46,3,'extras',
      E'*This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). Enoch''s interpreting angel names the man-like One of Daniel 7:13 *the Son of Adam* — the chosen, righteous One who stands before the Head of Days, the Formed Son drawn near before the Ancient of Days.'),
    ('canon','daniel',7,14,'enoch','1-enoch',48,2,'extras',
      E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). The One given *dominion, and glory, and a kingdom* (Daniel 7:14) is named before the Head of Days — the same Ancient of Days of Daniel''s throne. The Son of Adam''s name lifted up before the Father, who grants him the everlasting reign.'),
    ('canon','daniel',7,14,'enoch','1-enoch',48,3,'extras',
      E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). The Son of Adam who receives *an everlasting dominion, which shall not pass away* (Daniel 7:14) was named before creation itself — the Formed Son, expressed from the Formless Father before the sun and stars, not a thing made among them.'),
    ('canon','daniel',7,14,'enoch','1-enoch',49,2,'extras',
      E'*Because the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever, And his might unto all generations* (1 Enoch 49:2). The everlasting *glory, and a kingdom* (Daniel 7:14) of the Son of Adam is the *glory... for ever and ever* of the Elect One who stands before the Father. The Similitudes bind Daniel''s cloud-rider, the Son of Adam, and the Elect One into one Person — the Formed Son.'),

    -- THREAD 3 (★★): the Ancient of Days, the judgment set, the books opened — NT + EXTRAS [extras]
    ('canon','daniel',7,10,'canon','revelation',20,12,'extras',
      E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). John''s judgment scene is Daniel''s — *the judgment was set, and the books were opened* (Daniel 7:10). The same court, the same opened books before the throne of the Ancient of Days.'),
    ('canon','daniel',7,9,'canon','revelation',20,11,'extras',
      E'*And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away; and there was found no place for them* (Revelation 20:11). The *thrones... cast down, and the Ancient of days did sit* of Daniel 7:9 is John''s great white throne — the Ancient of Days enthroned for the final judgment, before whom heaven and earth flee.'),
    ('canon','daniel',7,10,'canon','revelation',5,11,'extras',
      E'*And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11). John counts the heavenly court exactly as Daniel did — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* (Daniel 7:10). The numberless host that ministers before the Ancient of Days.'),
    ('canon','daniel',7,9,'enoch','1-enoch',14,15,'extras',
      E'*But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15). Enoch is carried up and sees the throne of the Most High, a vision twin to Daniel''s — *his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9). The same heavenly throne-room of the Ancient of Days, seen by Enoch before Daniel.'),
    ('canon','daniel',7,10,'enoch','1-enoch',47,3,'extras',
      E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him* (1 Enoch 47:3). The Similitudes show the very scene of Daniel 7:9-10 — the Head of Days enthroned, *the books of the living were opened* (so *the judgment was set, and the books were opened*, Daniel 7:10), the host standing before him.'),

    -- THREAD 4 (★★): the saints of the most High take and possess the kingdom — NT + Tanakh [free]
    ('canon','daniel',7,18,'canon','revelation',5,10,'free',
      E'*And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10). The promise that *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* (Daniel 7:18) is sung before the throne — the redeemed of every tribe made kings to reign on the earth. The two-house restored people possessing the everlasting kingdom under the Son of Adam.'),
    ('canon','daniel',7,18,'canon','revelation',20,4,'free',
      E'*and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus)... and they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4). Daniel''s *saints... shall take the kingdom, and possess the kingdom for ever* (Daniel 7:18) is fulfilled in those who *lived and reigned with Messiah* — the saints who endured the horn''s war now sharing the dominion given to the Son of Adam.'),
    ('canon','daniel',7,27,'canon','luke',12,32,'free',
      E'*Fear not, little flock; for it is your Father''s good pleasure to give you the kingdom* (Luke 12:32). The kingdom *given to the people of the saints of the El Elyon (most High)* (Daniel 7:27) is the Father''s good pleasure to give — not seized, but granted to the little flock. The everlasting kingdom of Daniel passes to the saints from the hand of the Ancient of Days.'),
    ('canon','daniel',7,27,'canon','matthew',25,34,'free',
      E'*Then shall the King say unto them on his right hand, Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34). *The kingdom and dominion... shall be given to the people of the saints of the El Elyon (most High)* (Daniel 7:27) is the inheritance the King grants the blessed of his Father — the everlasting kingdom prepared for the saints.'),
    ('canon','daniel',7,18,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). The kingdom *the saints of the El Elyon (most High) shall take... and possess... for ever* (Daniel 7:18) is the same indestructible kingdom of the stone-vision — set up by the Elohim of heaven, standing for ever, and given to the saints.'),

    -- THREAD 5 (★): the little horn thinks to change times and laws — NT + Tanakh [free]
    ('canon','daniel',7,25,'canon','2-thessalonians',2,4,'free',
      E'*Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). Paul''s man of sin is Daniel''s little horn — *he shall speak great words against the El Elyon (most High)* (Daniel 7:25). The self-exalting power that *think[s] to change times and laws* and sets himself in the place of Yahuah.'),
    ('canon','daniel',7,25,'canon','revelation',13,5,'free',
      E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* (Revelation 13:5). John''s beast carries Daniel''s horn — *a mouth speaking great things* (Daniel 7:8) that *speak[s] great words against the El Elyon (most High)* (Daniel 7:25) — and the *time and times and the dividing of time* (Daniel 7:25) becomes the forty-two months. The same blaspheming mouth, the same bounded season.'),
    ('canon','daniel',7,21,'canon','revelation',13,7,'free',
      E'*And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). This is Daniel''s horn that *made war with the saints, and prevailed against them* (Daniel 7:21) — but only *until the Ancient of days came, and judgment was given to the saints* (Daniel 7:22). The war is real, the victory permitted for a season, and then reversed by the throne.'),
    ('canon','daniel',7,25,'canon','daniel',8,25,'free',
      E'*and he shall magnify himself in his heart, and by peace shall destroy many: he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25). The same self-magnifying king as the little horn — *he shall speak great words against the El Elyon (most High), and shall wear out the saints* (Daniel 7:25) — stands against the Prince of princes, and is broken not by human hand but by the judgment of heaven (Daniel 7:26).'),
    ('canon','daniel',7,25,'canon','daniel',11,36,'free',
      E'*And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36). The willful king of Daniel 11 speaks the same blasphemies as the horn that *speak[s] great words against the El Elyon (most High)* (Daniel 7:25). One arrogant power across Daniel''s visions, exalting itself until the indignation is accomplished.'),
    ('canon','daniel',7,25,'canon','leviticus',23,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). The *times and laws* the horn merely THINKS to change (Daniel 7:25) are Yahuah''s own — *my feasts*, the appointed times and the Sabbath given to Yashar''el. The horn counterfeits them but cannot abolish them: the Torah and the feasts stand for ever, and his thought never becomes power over them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 6 four-beasts cross_references (separate INSERT block, same pattern)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','daniel',7,3,'canon','revelation',13,1,'free',
      E'*And I stood upon the sand of the sea, and saw a beast rise up out of the sea, having seven heads and ten horns, and upon his horns ten crowns, and upon his heads the name of blasphemy* (Revelation 13:1). John''s beast rises where Daniel''s did — *four great beasts came up from the sea* (Daniel 7:3) — and bears the ten horns of Daniel''s fourth beast (Daniel 7:7). The sea of nations gives up the final empire that gathers all the others.'),
    ('canon','daniel',7,6,'canon','revelation',13,2,'free',
      E'*And the beast which I saw was like unto a leopard, and his feet were as the feet of a bear, and his mouth as the mouth of a lion: and the dragon gave him his power, and his seat, and great authority* (Revelation 13:2). John gathers all FOUR of Daniel''s beasts — the leopard (Daniel 7:6), the bear (Daniel 7:5), the lion (Daniel 7:4) — into one end-time beast. The succession of empires Daniel saw culminates in the single beast empowered by the dragon.'),
    ('canon','daniel',7,7,'canon','daniel',2,40,'free',
      E'*And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things... shall it break in pieces and bruise* (Daniel 2:40). The dreadful fourth beast with *great iron teeth* that *devoured and brake in pieces* (Daniel 7:7) is the iron fourth kingdom of the metal image — the same empire, seen first as iron legs, now as the terrible iron-toothed beast.'),
    ('canon','daniel',7,7,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). The four beasts — culminating in the iron beast with *ten horns* (Daniel 7:7) — are the four kingdoms broken at last by the stone-kingdom of chapter 2, the everlasting kingdom given to the Son of Adam and the saints (Daniel 7:14,18).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven',
       E'One like the Son of Adam came with the clouds of heaven',
       E'At the height of the night visions Daniel sees the central figure of the whole book: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him. And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* (Daniel 7:13-14). Mark the *like* — the kaph comparative: *one LIKE the Son of Adam*. This is the FORMED Son, the visible One drawn from the Formless Father, brought near before the Ancient of Days (the Father, the El Elyon, most High) and given the everlasting kingdom. He is Yahuah and yet HAS a Father — not a co-equal person, not a created being, but the expressed Word who took flesh. Yahusha (Jesus) names HIMSELF this cloud-rider at the most weighted moments of his life: *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30); and under oath before the high priest, *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64), *I am: and ye shall see the Son of Adam... coming in the clouds of heaven* (Mark 14:62) — fusing Daniel 7:13 with *Sit thou at my right hand* (Psalm 110:1). The Father had already declared of him, *Thou art my Son; this day have I begotten thee. Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:7-8) — the very nations Daniel saw serve him. John seals the vision: *Behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7); he sees *one like unto the Son of Adam* among the candlesticks, white-haired and flaming as the Ancient of Days (Revelation 1:13), and *upon the cloud one sat like unto the Son of Adam, having on his head a golden crown* (Revelation 14:14) — the kaph preserved each time. And the everlasting dominion is realized: *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the indestructible kingdom of *which shall never be destroyed... and it shall stand for ever* (Daniel 2:44).',
       sv.verse_id, ev.verse_id, 'free', 30150
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes',
       E'The Son of Adam named before the sun — the Similitudes of Enoch on Daniel 7',
       E'The restored Book of Parables (1 Enoch 37-71, the Similitudes) is the single most important extra-canonical development of Daniel 7:13, reading the man-like One messianically and pre-temporally. Enoch sees the very pairing of Daniel''s throne-vision: *And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels* (1 Enoch 46:1) — a Head of Days, white like wool as in *the Ancient of days... the hair of his head like the pure wool* (Daniel 7:9), and beside him a man-like One, the kaph again of *one like the Son of Adam* (Daniel 7:13). The interpreting angel names him plainly: *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness... because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). And his exaltation answers the dominion given in Daniel 7:14: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2), *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3) — the Son of Adam named before creation itself, the Formed Son expressed from the Formless Father before sun and stars, not a thing made among them. The Similitudes bind this One to the Elect One: *the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever, And his might unto all generations* (1 Enoch 49:2) — the everlasting glory of *his dominion is an everlasting dominion, which shall not pass away* (Daniel 7:14). One Person: the Son of Adam, the Elect One, the cloud-rider — the Formed Son who stands before the Father.',
       sv.verse_id, ev.verse_id, 'extras', 30153
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened',
       E'The Ancient of days, the judgment set, and the books were opened',
       E'Before the Son of Adam comes, Daniel sees the throne-room of the Most High: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire. A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:9-10). John sees the same court at the end: *And I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11), *and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books* (Revelation 20:12) — the opened books of Daniel 7:10. And the numberless host is counted the same: *the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11), exactly *ten thousand times ten thousand stood before him* (Daniel 7:10). The restored witness saw this throne even earlier: Enoch, carried up in the whirlwind, beheld *the throne... of stibium, and the top of the throne was of sapphire... a flaming fire* (1 Enoch 14:15-16) — the fiery throne of the Ancient of Days; and the judgment scene itself: *I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him* (1 Enoch 47:3). The Head of Days enthroned, the books opened, the host standing — Daniel''s vision and Enoch''s are one throne-room, and John''s great white throne is its consummation.',
       sv.verse_id, ev.verse_id, 'extras', 30156
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom',
       E'The saints of the most High shall take and possess the kingdom for ever',
       E'The vision''s interpretation gives the kingdom not only to the Son of Adam but, under him, to his people: *But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever* (Daniel 7:18), and again at the close, *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). This is the two-house restored people of Yashar''el — Yahudah (Judah) and Ephraim/Yosef gathered as one — given the everlasting kingdom UNDER the Son of Adam; never a replacement people, but the saints who endured the horn''s war (Daniel 7:21-22) now sharing the dominion. The New Testament sings it before the throne: *And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10); *they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4). And it is the Father''s gift, not a thing seized: *Fear not, little flock; for it is your Father''s good pleasure to give you the kingdom* (Luke 12:32); *Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34). It is the same indestructible kingdom of the stone-vision — *a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44) — set up by the Elohim of heaven and given at last to the saints of the most High.',
       sv.verse_id, ev.verse_id, 'free', 30159
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-the-little-horn-thinks-to-change-times-and-laws',
       E'The little horn makes war with the saints and thinks to change times and laws',
       E'Among the ten horns of the fourth beast rises *another little horn... and, behold, in this horn were eyes like the eyes of man, and a mouth speaking great things* (Daniel 7:8). The interpreting word unfolds him: *I beheld, and the same horn made war with the saints, and prevailed against them; Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High)* (Daniel 7:21-22); *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25). Mark the framing: he *think[s] to change times and laws* — he merely THINKS to, he does not succeed. The *times and laws* are Yahuah''s own appointed times and Torah — *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) — the calendar and the commandments the horn can counterfeit but never abolish; they stand for ever. The New Testament names this power the man of sin: *Who opposeth and exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4); the beast with *a mouth speaking great things and blasphemies* (Revelation 13:5) to whom *it was given... to make war with the saints, and to overcome them* (Revelation 13:7) — Daniel''s war exactly, permitted for a bounded season (the forty-two months answering *a time and times and the dividing of time*). He is the self-magnifying king across Daniel''s visions: *he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25); *the king shall do according to his will... and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36). But the war is reversed at the throne — *the judgment shall sit, and they shall take away his dominion, to consume and to destroy it unto the end* (Daniel 7:26) — and the saints possess the kingdom.',
       sv.verse_id, ev.verse_id, 'free', 30162
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms',
       E'The four beasts from the sea — the four kingdoms answering the image of chapter 2',
       E'The vision opens with the four winds and the sea: *and, behold, the four winds of the heaven strove upon the great sea. And four great beasts came up from the sea, diverse one from another* (Daniel 7:2-3). The first *like a lion, and had eagle''s wings* (7:4); the second *like to a bear... three ribs in the mouth of it* (7:5); the third *like a leopard, which had upon the back of it four wings... and four heads* (7:6); the fourth *dreadful and terrible, and strong exceedingly; and it had great iron teeth... and it had ten horns* (7:7). These are *four kings, which shall arise out of the earth* (7:17) — the same four-empire succession Daniel had already seen as the metal image of chapter 2, where *the fourth kingdom shall be strong as iron* (Daniel 2:40), broken at last by the stone-kingdom *which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). And John gathers all four of Daniel''s beasts into one final beast from the same sea: *a beast rise up out of the sea, having seven heads and ten horns* (Revelation 13:1), *like unto a leopard, and his feet were as the feet of a bear, and his mouth as the mouth of a lion: and the dragon gave him his power* (Revelation 13:2). The leopard, the bear, the lion of Daniel 7 converge in the end-time beast the dragon empowers — the world-empires that culminate in the power the Son of Adam and the saints at last dispossess.',
       sv.verse_id, ev.verse_id, 'free', 30165
  FROM _s306_dan07_lookup sv, _s306_dan07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30) — Yahusha names himself the cloud-rider of *one LIKE the Son of Adam came with the clouds of heaven* (Daniel 7:13); the kaph "like" the Formed Son who took flesh.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven* (Matthew 26:64) — under oath, Yahusha fuses Daniel 7:13 (*one LIKE the Son of Adam*) with Psalm 110:1; the Formed Son brought near before the Father.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *I am: and ye shall see the Son of Adam... coming in the clouds of heaven* (Mark 14:62) — the plainest claim; Yahusha IS the *one LIKE the Son of Adam* of Daniel 7:13, the kaph guarding the Formed One who took flesh.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=14 AND tv.verse_number=62
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Behold, he cometh with clouds; and every eye shall see him* (Revelation 1:7) — John seals the cloud-coming of the Son of Adam (Daniel 7:13) as the consummation; the One who was pierced.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *one like unto the Son of Adam, clothed with a garment down to the foot* (Revelation 1:13) — John keeps the kaph "LIKE unto the Son of Adam" (Daniel 7:13), now bearing the white hair and flame of the Ancient of Days (Daniel 7:9).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *upon the cloud one sat like unto the Son of Adam, having on his head a golden crown* (Revelation 14:14) — the crowned cloud-rider of Daniel 7:13-14 reaps; the kaph "LIKE unto the Son of Adam" preserved, the dominion made manifest.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *and he shall reign for ever and ever* (Revelation 11:15) — the everlasting kingdom of Daniel 7:14 (*his dominion is an everlasting dominion, which shall not pass away*) realized: the kingdoms of this world become the Messiah''s.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *Sit thou at my right hand* (Psalm 110:1) — the *my Lord* whom Yahuah seats is the Son of Adam brought near before the Ancient of Days (Daniel 7:13); Yahusha joined the two verses before Caiaphas.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *Thou art my Son; this day have I begotten thee. Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:7-8) — the nations that serve the Son of Adam (Daniel 7:14) are the Father''s inheritance to his begotten Son; he has a Father.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44) — the everlasting dominion of the Son of Adam (Daniel 7:14) is the indestructible stone-kingdom of the metal-image vision.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-one-like-the-son-of-adam-came-with-the-clouds-of-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★, extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *One who had a head of days... and with Him was another being whose countenance had the appearance of a man* (1 Enoch 46:1) — the Similitudes see Daniel''s pairing: the Head of Days (white like wool, Daniel 7:9) and the man-like One (the kaph "like", Daniel 7:13).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *This is the Son of Adam who hath righteousness... because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3) — the interpreting angel names the man-like One of Daniel 7:13 the chosen, righteous Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=13
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2) — the Son of Adam''s name lifted before the Head of Days (the Ancient of Days), who grants the dominion of Daniel 7:14.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3) — the Son of Adam who receives the everlasting dominion (Daniel 7:14) was named before creation: the Formed Son, not a thing made.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the Elect One standeth before Yahuah (God) of Spirits, And his glory is for ever and ever* (1 Enoch 49:2) — the everlasting glory of Daniel 7:14 belongs to the Elect One; the Similitudes bind cloud-rider, Son of Adam, and Elect One into one Person.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=49 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-son-of-adam-named-before-the-sun-in-the-similitudes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★, extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the books were opened... and the dead were judged out of those things which were written in the books* (Revelation 20:12) — John''s opened books are Daniel''s: *the judgment was set, and the books were opened* (Daniel 7:10).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11) — the *Ancient of days did sit* on the fiery throne (Daniel 7:9) is John''s great white throne of judgment.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the number of them was ten thousand times ten thousand, and thousands of thousands* (Revelation 5:11) — John counts the court exactly as Daniel: *thousand thousands ministered... ten thousand times ten thousand stood before him* (Daniel 7:10).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the throne... of stibium, and the top of the throne was of sapphire... a flaming fire* (1 Enoch 14:15-16) — Enoch sees the fiery throne of the Most High, twin to *his throne was like the fiery flame* (Daniel 7:9).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *the Head of Days... seated Himself upon the throne of His glory, And the books of the living were opened before Him* (1 Enoch 47:3) — the very scene of Daniel 7:9-10: the Head of Days enthroned, the books opened, the host standing.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=10
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-ancient-of-days-the-judgment-set-and-the-books-were-opened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *made us... kings and priests: and we shall reign on the earth* (Revelation 5:10) — the saints who *take the kingdom, and possess the kingdom for ever* (Daniel 7:18); the two-house redeemed reigning under the Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they lived and reigned with Messiah (Christ) a thousand years* (Revelation 20:4) — the saints who endured the horn''s war (Daniel 7:21) now possess the kingdom (Daniel 7:18), reigning with the Messiah.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Fear not, little flock; for it is your Father''s good pleasure to give you the kingdom* (Luke 12:32) — the kingdom *given to the people of the saints* (Daniel 7:27) is the Father''s gift, not seized.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Come, ye blessed of my Father, inherit the kingdom prepared for you from the foundation of the world* (Matthew 25:34) — the kingdom given to the saints (Daniel 7:27) is the inheritance the King grants the blessed of his Father.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=27
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44) — the kingdom the saints possess for ever (Daniel 7:18) is the indestructible stone-kingdom of the metal-image vision.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-saints-of-the-most-high-shall-take-and-possess-the-kingdom'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim* (2 Thessalonians 2:4) — Paul''s man of sin is Daniel''s little horn that *speak[s] great words against the El Elyon (most High)* (Daniel 7:25).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a mouth speaking great things and blasphemies... power... to continue forty and two months* (Revelation 13:5) — Daniel''s great-speaking mouth (Daniel 7:8,25); the *time and times and dividing of time* becomes the forty-two months.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *it was given unto him to make war with the saints, and to overcome them* (Revelation 13:7) — Daniel''s horn that *made war with the saints, and prevailed* (Daniel 7:21), only until the Ancient of days came (Daniel 7:22).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=21
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25) — the same self-magnifying king as the horn (Daniel 7:25), broken by heaven''s judgment, not human hand.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the king shall do according to his will... and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36) — the willful king blasphemes as the horn does (Daniel 7:25); one arrogant power across Daniel''s visions.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Concerning the feasts of Yahuah (LORD)... even these are my feasts* (Leviticus 23:2) — the *times and laws* the horn merely THINKS to change (Daniel 7:25) are Yahuah''s own appointed times and Torah; counterfeited, never abolished.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=25
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-little-horn-thinks-to-change-times-and-laws'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a beast rise up out of the sea, having seven heads and ten horns* (Revelation 13:1) — John''s beast rises where Daniel''s did (*four great beasts came up from the sea*, Daniel 7:3), bearing the ten horns of the fourth beast (Daniel 7:7).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *like unto a leopard... feet... as the feet of a bear... mouth as the mouth of a lion* (Revelation 13:2) — John gathers all four of Daniel''s beasts (leopard 7:6, bear 7:5, lion 7:4) into one end-time beast the dragon empowers.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the fourth kingdom shall be strong as iron... shall it break in pieces and bruise* (Daniel 2:40) — the iron-toothed fourth beast (Daniel 7:7) is the iron fourth kingdom of the metal image; one empire, two visions.'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms* (Daniel 2:44) — the four beasts are broken at last by the stone-kingdom given to the Son of Adam and the saints (Daniel 7:14,18).'
  FROM cross_reference_threads t
  JOIN _s306_dan07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s306_dan07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-7-the-four-beasts-from-the-sea-the-four-kingdoms'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_daniel_8.sql (Daniel 8) -----
-- Chapter: Daniel 8 — the ram (Media-Persia) and the he-goat (Greece); the LITTLE HORN that waxed
-- exceeding great toward the pleasant land, cast down the host and the stars, magnified himself
-- against the prince of the host, took away the daily sacrifice and cast down the sanctuary; the
-- 2300 evening-mornings and the cleansing of the sanctuary; Gabriel the angel-interpreter; the king
-- of fierce countenance who stands up against the Prince of princes but is BROKEN WITHOUT HAND; the
-- sealed vision for the time of the end.
-- Tag: dan08   Temp view: _s306_dan08_lookup
-- Sort band: base 30175, step 3 -> threads at 30175, 30178, 30181, 30184 (4 threads)
-- Source of EVERY row: 'canon','daniel',8,v
--
-- Daniel 8 coverage:
--   v.1-2 (third year of Belshazzar; Shushan in the palace; the river of Ulai)
--        NT:     none warranted (vision setting)
--        Extras: none warranted
--        Tanakh: none warranted (historical/locational frame)
--   v.3-8,20-22 (the ram with two horns = Media and Persia; the he goat from the west = Greece, the
--          great horn the first king, broken, four come up for it)
--        NT:     none warranted (the empires identified by Gabriel in vv.20-22)
--        Extras: none warranted
--        Tanakh: ★ Daniel 7:17 (these great beasts... are four kings), ★ Daniel 2:39 (after thee
--                shall arise another kingdom... a third kingdom of brass) — THREAD 4 (lateral to Dan 7
--                beasts and Dan 2 image; the same succession of empires)
--   ★ v.9-12 (a little horn waxed exceeding great toward the pleasant land; cast down the host and
--          the stars; magnified himself to the prince of the host; the daily sacrifice taken away;
--          the place of his sanctuary cast down; cast down the truth)
--        NT:     ★★ 2 Thessalonians 2:4 (exalteth himself above all that is called Elohim... sitteth
--                in the temple), ★ 2 Thessalonians 2:3 (that man of sin be revealed), ★★ Revelation
--                13:5 (a mouth speaking great things and blasphemies; forty and two months), ★ Rev
--                13:6 (blasphemy against Elohim, his tabernacle), ★ Rev 13:7 (war with the saints) — THREAD 1
--        Extras: ★★ 1 Maccabees 1:54 (set up the abomination of desolation upon the altar), ★ 1
--                Maccabees 1:45 (forbid sacrifice... profane the sabbaths) — THREAD 1 (the Antiochus
--                prototype: the daily taken away, the sanctuary defiled — the historical horn the
--                vision sees THROUGH to the end)
--        Tanakh: ★★ Daniel 7:25 (speak great words against the most High, wear out the saints), ★★
--                Daniel 11:31 (pollute the sanctuary, take away the daily sacrifice, place the
--                abomination), ★ Daniel 12:11 (the daily sacrifice taken away, the abomination set up),
--                ★ Daniel 9:27 (cause the sacrifice to cease... abominations... desolate) — THREAD 1
--   ★ v.23-25 (a king of fierce countenance, understanding dark sentences; destroy the holy people;
--          magnify himself in his heart; stand up against the Prince of princes; BROKEN WITHOUT HAND)
--        NT:     (joined to THREAD 1 — the man of sin / beast)
--        Extras: (joined to THREAD 1)
--        Tanakh: ★★ Daniel 2:34 (a stone was cut out WITHOUT HANDS, which smote the image), ★ Daniel
--                2:45 (the stone cut out of the mountain without hands) — THREAD 1 (the horn "broken
--                without hand" 8:25 echoes the stone "cut out without hands" — judged by no human power)
--   ★ v.13-14 (How long shall be the vision... the daily sacrifice and the transgression of
--          desolation... the sanctuary and the host trodden under foot? Unto 2300 days; then shall
--          the sanctuary be cleansed)
--        NT:     ★★ Revelation 11:2 (the holy city shall they tread under foot forty and two months) — THREAD 2
--        Extras: none warranted (Maccabean defilement held to THREAD 1)
--        Tanakh: ★ Daniel 12:10 (many shall be purified, and made white, and tried) — THREAD 2 (the
--                appointed limit on the desolation; the cleansing/purifying at the end)
--   ★ v.15-19,26 (Gabriel, make this man to understand the vision; at the time of the end shall be
--          the vision; the last end of the indignation; shut thou up the vision, for many days)
--        NT:     ★ Revelation 22:10 (Seal not the sayings of the prophecy of this book: the time is at hand) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Daniel 12:4 (shut up the words, and seal the book, to the time of the end), ★★
--                Daniel 12:9 (the words are closed up and sealed till the time of the end) — THREAD 3
--                (the angel-interpreter and the sealed vision for the appointed end)
--   v.27 (Daniel fainted, was sick, astonished at the vision; none understood it)
--        NT:     none warranted (held to THREAD 3 — the vision sealed, not yet understood)
--        Extras: none warranted
--        Tanakh: none separate (the sealing-effect; woven in THREAD 3 prose)
--
-- Threads (slug — target libraries):
--   1. daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host — NT (2 Thess 2, Rev 13)
--      + Extras (1 Maccabees 1) + Tanakh (Daniel 7, 11, 12, 9, 2) [extras]
--      (★ the self-exalting horn that takes the daily and defiles the sanctuary; man of sin / beast;
--       Antiochus the prototype; broken without hand = the stone cut without hands)
--   2. daniel-8-then-shall-the-sanctuary-be-cleansed — NT (Revelation 11) + Tanakh (Daniel 12) [free]
--      (★ the 2300 evening-mornings: the appointed limit on the desolation; the holy city trodden a
--       measured time; the purifying at the end)
--   3. daniel-8-gabriel-make-this-man-to-understand-the-vision — NT (Revelation 22) + Tanakh (Daniel 12) [free]
--      (★ the angel-interpreter; the sealed vision for the time of the end)
--   4. daniel-8-the-ram-and-the-he-goat-the-kingdoms-identified — Tanakh (Daniel 7, Daniel 2) [free]
--      (the ram = Media-Persia, the he-goat = Greece; lateral to Dan 7's beasts and Dan 2's image —
--       the same succession of empires moving toward the kingdom that shall never be destroyed)
--
-- Framing notes:
--   ★ THE LITTLE HORN AGAINST THE PRINCE OF PRINCES (THREAD 1): *And out of one of them came forth a
--      little horn, which waxed exceeding great, toward the south, and toward the east, and toward the
--      pleasant land... Yea, he magnified himself even to the prince of the host, and by him the daily
--      sacrifice was taken away, and the place of his sanctuary was cast down* (Daniel 8:9-11); the
--      king of fierce countenance *shall magnify himself in his heart... he shall also stand up against
--      the Prince of princes; but he shall be broken without hand* (8:25). This is the self-exalting
--      power that defiles the sanctuary. Paul weaves it forward: *that man of sin... who opposeth and
--      exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in
--      the temple of Elohim (God)* (2 Thess 2:3-4); John sees the same beast — *a mouth speaking great
--      things and blasphemies... to make war with the saints* (Rev 13:5-7). Laterally it is Daniel's
--      own little horn that *speak great words against the most High, and shall wear out the saints*
--      (Dan 7:25), the arms that *take away the daily sacrifice, and... place the abomination that
--      maketh desolate* (Dan 11:31; Dan 12:11; Dan 9:27). The Antiochus persecution is the historical
--      prototype the vision sees through: *they set up the abomination of desolation upon the altar*
--      (1 Macc 1:54), forbidding sacrifice and profaning the sabbaths (1:45). And mark the verdict:
--      he *stand up against the Prince of princes; but he shall be broken WITHOUT HAND* (8:25) — the
--      same judgment as the stone *cut out without hands* that smote the image (Dan 2:34,45): no human
--      power topples him; Yahuah breaks him.
--   ★ THEN SHALL THE SANCTUARY BE CLEANSED (THREAD 2): *How long shall be the vision concerning the
--      daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host
--      to be trodden under foot? ... Unto two thousand and three hundred days; then shall the sanctuary
--      be cleansed* (Daniel 8:13-14). The desolation has an APPOINTED LIMIT and the sanctuary a
--      cleansing. John measures the same trodden time: *the holy city shall they tread under foot forty
--      and two months* (Rev 11:2); and Daniel's own end-word answers the purifying: *Many shall be
--      purified, and made white, and tried* (Dan 12:10). The treading is measured; the cleansing comes.
--   ★ GABRIEL, MAKE THIS MAN TO UNDERSTAND (THREAD 3): *Gabriel, make this man to understand the
--      vision... Understand, O son of Adam: for at the time of the end shall be the vision* (Daniel
--      8:16-17); *shut thou up the vision; for it shall be for many days* (8:26). The angel-interpreter
--      seals the vision for the appointed end — exactly as Daniel 12 will: *shut up the words, and seal
--      the book, even to the time of the end* (Dan 12:4); *the words are closed up and sealed till the
--      time of the end* (Dan 12:9). At the consummation the seal is lifted: *Seal not the sayings of
--      the prophecy of this book: for the time is at hand* (Rev 22:10). The vision belongs to the end.
--   THE RAM AND THE HE-GOAT (THREAD 4): Gabriel names the empires plainly — *The ram which thou sawest
--      having two horns are the kings of Media and Persia. And the rough goat is the king of Grecia*
--      (Daniel 8:20-21). The same succession Daniel saw as the four beasts — *These great beasts, which
--      are four, are four kings* (Dan 7:17) — and as the image's metals — *after thee shall arise
--      another kingdom... and another third kingdom of brass, which shall bear rule over all the earth*
--      (Dan 2:39). One vision in three figures, moving toward the kingdom that *shall never be
--      destroyed* (Dan 2:44).
--   VERSES WITH NO SEPARATE ADD: v.1-2 (vision setting — Shushan, the Ulai), v.18 (the deep sleep,
--      set upright — woven in THREAD 3 prose), v.27 (Daniel sick, none understood it — the sealing
--      effect, held in THREAD 3). All recorded above.

CREATE TEMP VIEW _s306_dan08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the little horn that magnified himself against the Prince of princes
    ('canon','daniel',8,11,'canon','2-thessalonians',2,4,'free',
      E'*Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). Paul''s man of sin is Daniel''s self-exalting horn carried forward: the horn *magnified himself even to the prince of the host, and by him the daily sacrifice was taken away, and the place of his sanctuary was cast down* (Daniel 8:11). The same defiance of the sanctuary and the same self-deification — he sets himself in the holy place against the One who dwells there.'),
    ('canon','daniel',8,11,'canon','2-thessalonians',2,3,'free',
      E'*Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition* (2 Thessalonians 2:3). The horn that *magnified himself even to the prince of the host* (Daniel 8:11) and the king who *shall magnify himself in his heart... against the Prince of princes* (8:25) are the pattern of the man of sin revealed at the end — the self-exalting power judged at the consummation.'),
    ('canon','daniel',8,11,'canon','revelation',13,5,'free',
      E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* (Revelation 13:5). The little horn that *waxed exceeding great* and *magnified himself even to the prince of the host* (Daniel 8:9,11) is John''s beast with the boastful, blaspheming mouth — given a measured time to prosper, as the horn *practised, and prospered* (8:12).'),
    ('canon','daniel',8,11,'canon','revelation',13,6,'free',
      E'*And he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle, and them that dwell in heaven* (Revelation 13:6). The horn whose magnifying *cast down the place of his sanctuary* (Daniel 8:11) is the beast whose blasphemy is aimed at the tabernacle and the dwellers of heaven — the same assault on the sanctuary and the host of heaven (8:10-11).'),
    ('canon','daniel',8,24,'canon','revelation',13,7,'free',
      E'*And it was given unto him to make war with the saints, and to overcome them: and power was given him over all kindreds, and tongues, and nations* (Revelation 13:7). The king of fierce countenance who *shall destroy wonderfully... and shall destroy the mighty and the holy people* (Daniel 8:24) is the beast given to make war with the saints. The horn''s warfare against *the holy people* is the same end-time assault.'),
    ('canon','daniel',8,11,'canon','daniel',7,25,'free',
      E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time* (Daniel 7:25). Daniel''s own earlier little horn is the same self-exalting power: the horn of chapter 8 *magnified himself even to the prince of the host* and took *the daily sacrifice* (8:11); the horn of chapter 7 *speak great words against the most High* and wears out the saints for an appointed, limited time.'),
    ('canon','daniel',8,11,'canon','daniel',11,31,'free',
      E'*And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The very deed of the little horn — *by him the daily sacrifice was taken away, and the place of his sanctuary was cast down* (Daniel 8:11) — is spelled out again in chapter 11: the sanctuary polluted, the daily taken, the abomination set up. One desolating power across the visions.'),
    ('canon','daniel',8,11,'canon','daniel',12,11,'free',
      E'*And from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up, there shall be a thousand two hundred and ninety days* (Daniel 12:11). The taking of *the daily sacrifice* and the casting down of the sanctuary in 8:11 is measured again at the close of the book — the daily removed, the abomination set up, a numbered count to the end. The same desolation the angel measured in 8:13-14.'),
    ('canon','daniel',8,11,'canon','daniel',9,27,'free',
      E'*And he shall confirm the covenant with many for one week: and in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate, even until the consummation* (Daniel 9:27). The horn that *the daily sacrifice was taken away* by him (Daniel 8:11) is the prince who *cause the sacrifice and the oblation to cease* and brings the abomination — the same cessation and desolation, bounded *until the consummation*.'),
    ('canon','daniel',8,25,'canon','daniel',2,34,'free',
      E'*Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces* (Daniel 2:34). The king who *stand up against the Prince of princes; but he shall be broken WITHOUT HAND* (Daniel 8:25) is judged exactly as the image is broken — by a stone *cut out without hands*. No human power topples him; Yahuah (the LORD) breaks him.'),
    ('canon','daniel',8,25,'canon','daniel',2,45,'free',
      E'*Forasmuch as thou sawest that the stone was cut out of the mountain without hands, and that it brake in pieces the iron, the brass, the clay, the silver, and the gold... and the dream is certain, and the interpretation thereof sure* (Daniel 2:45). The horn *broken without hand* (Daniel 8:25) and the stone *cut out of the mountain without hands* (2:45) are the same verdict: the self-exalting kingdom is shattered not by men but by the kingdom of the great Elohim (God) that shall never be destroyed.'),
    ('canon','daniel',8,11,'apocrypha','1-maccabees',1,54,'extras',
      E'*Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side* (1 Maccabees 1:54). The history records the prototype of the horn''s deed: *by him the daily sacrifice was taken away, and the place of his sanctuary was cast down* (Daniel 8:11). Antiochus set the abomination on the very altar — the desolation Daniel saw, enacted in time, and the vision sees through it to the end.'),
    ('canon','daniel',8,11,'apocrypha','1-maccabees',1,45,'extras',
      E'*And forbid burnt offerings, and sacrifice, and drink offerings, in the temple; and that they should profane the sabbaths and festival days* (1 Maccabees 1:45). The taking of *the daily sacrifice* (Daniel 8:11) is recorded as it happened: the offerings forbidden, the sabbaths and feasts profaned, the sanctuary polluted. The appointed times themselves were the target — the horn wars against Yahuah''s (the LORD''s) calendar and the daily before his face.'),

    -- THREAD 2 (★): then shall the sanctuary be cleansed — the 2300 evening-mornings
    ('canon','daniel',8,13,'canon','revelation',11,2,'free',
      E'*But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles: and the holy city shall they tread under foot forty and two months* (Revelation 11:2). The saint''s question — *How long... to give both the sanctuary and the host to be trodden under foot?* (Daniel 8:13) — is answered with the same measured treading: the holy city trodden a fixed term. The desolation is bounded; the cleansing of 8:14 follows the appointed limit.'),
    ('canon','daniel',8,14,'canon','daniel',12,10,'free',
      E'*Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand* (Daniel 12:10). The promise *then shall the sanctuary be cleansed* (Daniel 8:14) reaches its end-time fulfilment: at the time of the end the people themselves are purified and made white. The cleansing of the sanctuary and the purifying of the wise are one appointed work.'),

    -- THREAD 3 (★): Gabriel, make this man to understand — the sealed vision for the time of the end
    ('canon','daniel',8,26,'canon','daniel',12,4,'free',
      E'*But thou, O Daniel, shut up the words, and seal the book, even to the time of the end: many shall run to and fro, and knowledge shall be increased* (Daniel 12:4). The command *shut thou up the vision; for it shall be for many days* (Daniel 8:26) is repeated at the book''s close: the words sealed *to the time of the end*. The vision belongs to the appointed end, kept until its hour.'),
    ('canon','daniel',8,26,'canon','daniel',12,9,'free',
      E'*And he said, Go thy way, Daniel: for the words are closed up and sealed till the time of the end* (Daniel 12:9). Daniel is told twice to seal the vision — *shut thou up the vision; for it shall be for many days* (Daniel 8:26) — *the words are closed up and sealed till the time of the end* (12:9). Gabriel set the rule in chapter 8: *at the time of the end shall be the vision* (8:17).'),
    ('canon','daniel',8,17,'canon','revelation',22,10,'free',
      E'*And he saith unto me, Seal not the sayings of the prophecy of this book: for the time is at hand* (Revelation 22:10). Gabriel told Daniel *at the time of the end shall be the vision* (Daniel 8:17) and bade him seal it; John, standing at the consummation, is told the opposite — *Seal not... for the time is at hand*. The vision Daniel sealed for the end is opened when the end has come.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4 (Tanakh-only) cross_references — the ram and the he-goat, the kingdoms identified
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','daniel',8,20,'canon','daniel',7,17,'free',
      E'*These great beasts, which are four, are four kings, which shall arise out of the earth* (Daniel 7:17). The ram and the he-goat Gabriel names — *the kings of Media and Persia... the king of Grecia* (Daniel 8:20-21) — are the same succession Daniel saw as the four beasts. One unfolding of empires, shown twice and interpreted by the heavenly messenger.'),
    ('canon','daniel',8,21,'canon','daniel',2,39,'free',
      E'*And after thee shall arise another kingdom inferior to thee, and another third kingdom of brass, which shall bear rule over all the earth* (Daniel 2:39). The he-goat that is *the king of Grecia* (Daniel 8:21) is the third kingdom of Nebuchadnezzar''s image, the brass that bears rule over all the earth. Ram, goat, beast, metal — the same powers, moving toward the kingdom of the great Elohim (God) that shall never be destroyed (Daniel 2:44).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s306_dan08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s306_dan08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★) — extras tier (1 Maccabees members)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host',
       E'The little horn that magnified himself against the Prince of princes — but broken without hand',
       E'Out of the broken Greek horn rises the figure the whole vision turns on: *And out of one of them came forth a little horn, which waxed exceeding great, toward the south, and toward the east, and toward the pleasant land. And it waxed great, even to the host of heaven; and it cast down some of the host and of the stars to the ground, and stamped upon them. Yea, he magnified himself even to the prince of the host, and by him the daily sacrifice was taken away, and the place of his sanctuary was cast down* (Daniel 8:9-11). At the end Gabriel names him again: *a king of fierce countenance, and understanding dark sentences, shall stand up... he shall magnify himself in his heart, and by peace shall destroy many: he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:23,25). This is the self-exalting power that defiles the sanctuary and takes away the daily. Paul carries it forward to the man of sin: *Let no man deceive you by any means: for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition; Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:3-4). John sees the same beast: *And there was given unto him a mouth speaking great things and blasphemies... And he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle... And it was given unto him to make war with the saints, and to overcome them* (Revelation 13:5-7). And it is Daniel''s own little horn of chapter 7 — *he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws* (Daniel 7:25) — and the desolating power of chapters 11, 12, and 9: *they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31); *from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up* (Daniel 12:11); *in the midst of the week he shall cause the sacrifice and the oblation to cease, and for the overspreading of abominations he shall make it desolate* (Daniel 9:27). The history of Antiochus is the prototype the vision sees through: *they set up the abomination of desolation upon the altar* (1 Maccabees 1:54), having *forbid burnt offerings, and sacrifice, and drink offerings, in the temple; and that they should profane the sabbaths and festival days* (1 Maccabees 1:45) — the horn wars against Yahuah''s (the LORD''s) appointed times and the daily before his face. But mark the verdict that breaks the boast: he *stand up against the Prince of princes; but he shall be broken WITHOUT HAND* (Daniel 8:25) — the very judgment of the image, *a stone was cut out without hands, which smote the image* (Daniel 2:34), *the stone was cut out of the mountain without hands* (Daniel 2:45). No human arm topples him; the kingdom of the great Elohim (God) that shall never be destroyed shatters him.',
       sv.verse_id, ev.verse_id, 'extras', 30175
  FROM _s306_dan08_lookup sv, _s306_dan08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=8 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-8-then-shall-the-sanctuary-be-cleansed',
       E'Then shall the sanctuary be cleansed — the appointed limit on the desolation',
       E'The treading-down of the holy place is not endless; it is measured. A saint asks the question the whole vision presses: *How long shall be the vision concerning the daily sacrifice, and the transgression of desolation, to give both the sanctuary and the host to be trodden under foot? And he said unto me, Unto two thousand and three hundred days; then shall the sanctuary be cleansed* (Daniel 8:13-14). The desolation has an APPOINTED END, and beyond it a cleansing. John measures the same trodden time in his vision: *the holy city shall they tread under foot forty and two months* (Revelation 11:2) — a fixed term, not forever. And Daniel''s own end-word names the purifying that answers the cleansing: *Many shall be purified, and made white, and tried; but the wicked shall do wickedly... but the wise shall understand* (Daniel 12:10). The sanctuary cleansed and the people purified are one appointed work at the close. The horn prospers for a measured season (8:12), and then the limit falls and the holy place is made clean.',
       sv.verse_id, ev.verse_id, 'free', 30178
  FROM _s306_dan08_lookup sv, _s306_dan08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-8-gabriel-make-this-man-to-understand-the-vision',
       E'Gabriel, make this man to understand the vision — sealed for the time of the end',
       E'When Daniel sought the meaning, the angel-interpreter was sent: *And I heard a man''s voice between the banks of Ulai, which called, and said, Gabriel, make this man to understand the vision. So he came near where I stood... but he said unto me, Understand, O son of Adam: for at the time of the end shall be the vision* (Daniel 8:16-17). The vision belongs to the appointed end, and so it is sealed: *And the vision of the evening and the morning which was told is true: wherefore shut thou up the vision; for it shall be for many days* (Daniel 8:26) — and Daniel is left astonished, *but none understood it* (8:27). The book''s close repeats the very command: *But thou, O Daniel, shut up the words, and seal the book, even to the time of the end* (Daniel 12:4); *Go thy way, Daniel: for the words are closed up and sealed till the time of the end* (Daniel 12:9). The sealed vision waits for its hour. And when that hour has come, the seal is lifted — John at the consummation is told the opposite of Daniel: *Seal not the sayings of the prophecy of this book: for the time is at hand* (Revelation 22:10). What Daniel sealed for the end is opened when the end is here; the vision was always for the time appointed.',
       sv.verse_id, ev.verse_id, 'free', 30181
  FROM _s306_dan08_lookup sv, _s306_dan08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (Tanakh-only)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'daniel-8-the-ram-and-the-he-goat-the-kingdoms-identified',
       E'The ram and the he-goat — the kingdoms named, one vision in three figures',
       E'The vision is not left to guesswork; Gabriel names the empires: *The ram which thou sawest having two horns are the kings of Media and Persia. And the rough goat is the king of Grecia: and the great horn that is between his eyes is the first king* (Daniel 8:20-21). The ram pushing west, north, and south (8:4) is the Medo-Persian power; the he-goat from the west, touching not the ground, with the notable horn (8:5), is Greece, its great horn broken and four kingdoms rising for it (8:8,22). This is the same succession Daniel saw in his other visions, shown under different figures. As the four beasts: *These great beasts, which are four, are four kings, which shall arise out of the earth* (Daniel 7:17). As the metals of the image: *after thee shall arise another kingdom inferior to thee, and another third kingdom of brass, which shall bear rule over all the earth* (Daniel 2:39). Ram and goat, beast and metal — the kingdoms of men rising and falling in their turn, every vision bending toward the same end: the kingdom of the great Elohim (God) that *shall never be destroyed... and it shall stand for ever* (Daniel 2:44).',
       sv.verse_id, ev.verse_id, 'free', 30184
  FROM _s306_dan08_lookup sv, _s306_dan08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='daniel' AND ev.chapter_number=8 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — the man of sin is Daniel''s horn that magnified himself to the prince of the host and cast down the sanctuary (8:11).'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *that man of sin be revealed, the son of perdition* (2 Thessalonians 2:3) — the self-exalting horn (8:11,25) is the pattern of the man of sin revealed at the end.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *a mouth speaking great things and blasphemies... forty and two months* (Revelation 13:5) — the horn that waxed exceeding great and prospered (8:9,12) is John''s beast, given a measured time to boast.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:6) — the horn cast down the host of heaven and the sanctuary (8:10-11); the beast blasphemes the tabernacle and heaven''s dwellers.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *to make war with the saints, and to overcome them* (Revelation 13:7) — the king of fierce countenance shall destroy the mighty and the holy people (8:24); the beast wars on the saints.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=24
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *speak great words against the El Elyon (most High)... and think to change times and laws* (Daniel 7:25) — Daniel''s own earlier little horn; the same self-exalting power for an appointed, limited time.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *pollute the sanctuary of strength, and shall take away the daily sacrifice, and... place the abomination* (Daniel 11:31) — the horn''s deed of 8:11 spelled out: sanctuary polluted, daily taken, abomination set up.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *from the time that the daily sacrifice shall be taken away, and the abomination that maketh desolate set up* (Daniel 12:11) — the daily removed and the abomination set up, counted to the end; the same desolation of 8:13-14.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *in the midst of the week he shall cause the sacrifice and the oblation to cease... until the consummation* (Daniel 9:27) — the prince who stops the daily and brings the abomination; the same cessation, bounded to the end.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★★ *a stone was cut out without hands, which smote the image* (Daniel 2:34) — the horn ''broken without hand'' (8:25) is judged as the image is: by a stone cut without hands, no human power.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=25
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'★ *the stone was cut out of the mountain without hands... the dream is certain* (Daniel 2:45) — the horn broken without hand and the stone cut without hands are one verdict: shattered by the kingdom of the great Elohim (God).'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=25
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'★★ *they set up the abomination of desolation upon the altar* (1 Maccabees 1:54) — the Antiochus prototype enacted in time: the daily taken, the sanctuary cast down (8:11), the abomination on the altar.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'★ *forbid burnt offerings, and sacrifice... and... profane the sabbaths and festival days* (1 Maccabees 1:45) — the daily taken (8:11) is the appointed times themselves attacked: the horn wars on Yahuah''s (the LORD''s) calendar.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=11
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-little-horn-that-magnified-himself-against-the-prince-of-the-host'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the holy city shall they tread under foot forty and two months* (Revelation 11:2) — the saint''s ''how long... trodden under foot?'' (8:13) answered: the treading is measured, not endless.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-then-shall-the-sanctuary-be-cleansed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Many shall be purified, and made white, and tried... the wise shall understand* (Daniel 12:10) — the sanctuary cleansed (8:14) and the people purified are one appointed end-time work.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-then-shall-the-sanctuary-be-cleansed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *shut up the words, and seal the book, even to the time of the end* (Daniel 12:4) — the command ''shut thou up the vision; for it shall be for many days'' (8:26) repeated at the book''s close.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=26
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-gabriel-make-this-man-to-understand-the-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the words are closed up and sealed till the time of the end* (Daniel 12:9) — Gabriel''s rule of 8:17 (''at the time of the end shall be the vision'') sealed to the appointed hour.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=26
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-gabriel-make-this-man-to-understand-the-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Seal not the sayings of the prophecy of this book: for the time is at hand* (Revelation 22:10) — what Daniel sealed for the end (8:17,26) is opened when the end is here.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-gabriel-make-this-man-to-understand-the-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (Tanakh-only)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *These great beasts, which are four, are four kings* (Daniel 7:17) — the ram and the goat (8:20-21) are the same empires Daniel saw as the four beasts, interpreted by the messenger.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=20
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-ram-and-the-he-goat-the-kingdoms-identified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a third kingdom of brass, which shall bear rule over all the earth* (Daniel 2:39) — the he-goat ''the king of Grecia'' (8:21) is the brass of Nebuchadnezzar''s image; ram, goat, beast, metal, one succession.'
  FROM cross_reference_threads t
  JOIN _s306_dan08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='daniel' AND sv.chapter_number=8 AND sv.verse_number=21
  JOIN _s306_dan08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='daniel-8-the-ram-and-the-he-goat-the-kingdoms-identified'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session306 — Daniel cross-references complete.'
