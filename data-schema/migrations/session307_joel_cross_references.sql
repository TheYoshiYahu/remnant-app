-- =====================================================================
-- Session 307 — Joel FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session307_joel_cross_references.sql
-- =====================================================================

\echo 'session307 — Joel cross-references starting...'
BEGIN;

-- ----- fragment: minion_joel_1.sql (Joel 1) -----
-- Chapter: Joel 1 — the four-fold locust plague (palmerworm/locust/cankerworm/caterpiller); the vine,
-- fig, and harvest destroyed; the meat offering and drink offering CUT OFF from the house of Yahuah;
-- the call to the priests to gird with sackcloth, SANCTIFY A FAST, call a SOLEMN ASSEMBLY; and the
-- book's spine introduced — ALAS FOR THE DAY! for the day of Yahuah (LORD) is at hand, and as a
-- destruction from the Almighty shall it come. The DAY-OF-YAHUAH motif begins here and deepens in ch2-3.
-- Tag: joel01   Temp view: _s307_joel01_lookup   Session: s307
-- Sort band: base 31000, step 3 -> threads at 31000, 31003, 31006, 31009 (4 threads)
-- Source of EVERY row: 'canon','joel',1,v
--
-- Joel 1 coverage:
--   v.1 (the word of Yahuah that came to Joel the son of Pethuel)
--        NT:     none warranted (superscription)
--        Extras: none warranted
--        Tanakh: none warranted (the prophetic-word formula; woven in prose)
--   v.2-4 (Hear this, ye old men... Tell ye your children... That which the palmerworm hath left hath
--          the locust eaten...)
--        NT:     none warranted (the four-fold devastation; restoration answer held to Joel 2:25)
--        Extras: none warranted
--        Tanakh: ★ Joel 2:25 (I will restore... the years that the locust hath eaten) — THREAD 4 (the
--                lateral restoration answer set up here; Deuteronomy 28:38 also bound in THREAD 3)
--   v.5-12 (Awake, ye drunkards... the new wine is cut off... He hath laid my vine waste, and barked my
--          fig tree... the meat offering and the drink offering is cut off from the house of Yahuah...
--          the vine is dried up, and the fig tree languisheth... all the trees of the field are withered)
--        NT:     none warranted (the harvest-curse; temple service interrupted; woven in prose)
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 28:38-40 (the locust shall consume it... thou shalt plant vineyards...
--                but shalt neither drink of the wine... thine olive shall cast his fruit) — THREAD 3 (the
--                covenant-curse on the LAND for covenant-breaking, NEVER the Torah as curse)
--   ★ v.13-14 (Gird yourselves, and lament, ye priests... come, lie all night in sackcloth... SANCTIFY
--          YE A FAST, CALL A SOLEMN ASSEMBLY, gather the elders... and CRY UNTO YAHUAH)
--        NT:     none warranted distinct (the corporate-repentance frame is OT-rooted; leads into 2:15-17)
--        Extras: none warranted
--        Tanakh: ★ 2 Chronicles 20:3-4 (Jehoshaphat... proclaimed a fast throughout all Yahudah... to
--                seek Yahuah), ★ Jonah 3:5,8-9 (the people of Nineveh... proclaimed a fast, and put on
--                sackcloth... cry mightily unto Elohim... turn every one from his evil way) — THREAD 2
--   ★★ v.15 (ALAS FOR THE DAY! for the day of Yahuah (LORD) is at hand, and as a destruction from the
--          Almighty shall it come)
--        NT:     ★ 1 Thessalonians 5:2 (the day of Yahuah so cometh as a thief in the night), ★ 2 Peter
--                3:10 (the day of Yahuah will come as a thief in the night) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 13:6 (the day of Yahuah is at hand; it shall come as a destruction from the
--                Almighty — Joel echoes it nearly verbatim) + Isaiah 13:9 (the day of Yahuah cometh),
--                ★ Zephaniah 1:14-15 (the great day of Yahuah is near... a day of wrath), ★ Amos 5:18
--                (the day of Yahuah is darkness, and not light) — THREAD 1
--   v.16-20 (Is not the meat cut off... the seed is rotten... the beasts groan... O Yahuah, to thee will
--          I cry: for the fire hath devoured the pastures... the rivers of waters are dried up)
--        NT:     none warranted (the cry of the land under judgment; woven in THREAD 2/THREAD 3 prose)
--        Extras: none warranted
--        Tanakh: none separate (the famine-and-fire lament continues v.5-12; the cry to Yahuah of v.19
--                joins the call of v.14)
--
-- Threads (slug — target libraries):
--   1. joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand — NT (1 Thessalonians 5, 2 Peter 3) + Tanakh
--      (Isaiah 13, Zephaniah 1, Amos 5) [free]
--      (★★ the day-of-Yahuah motif introduced — the book's spine; Joel echoes Isaiah 13:6 nearly verbatim;
--       forward to the day that comes as a thief)
--   2. joel-1-sanctify-ye-a-fast-call-a-solemn-assembly — Tanakh (2 Chronicles 20, Jonah 3) [free]
--      (★ the call to corporate repentance — gird with sackcloth, gather the elders, cry unto Yahuah; the
--       appointed-assembly frame that leads into Joel 2:15-17)
--   3. joel-1-the-locust-consuming-the-covenant-curse-on-the-land — Tanakh (Deuteronomy 28) [free]
--      (★★ the meat and drink offering cut off; vine and fig and oil destroyed = the Deuteronomy 28 curse
--       for covenant-breaking, NEVER the Torah as curse)
--   4. joel-1-that-which-the-palmerworm-hath-left-the-locust-eaten — Tanakh (Joel 2) [free]
--      (the four-fold locust devastation, laterally answered by 2:25 — I will restore the years the locust
--       hath eaten; the wound named here, the healing promised in ch2)
--
-- Framing notes:
--   ★★ THE DAY OF YAHUAH IS AT HAND (THREAD 1): the book's spine is struck here — *Alas for the day! for
--      the day of Yahuah (LORD) is at hand, and as a destruction from the Almighty shall it come* (Joel
--      1:15). Joel echoes Isaiah almost word for word: *Howl ye; for the day of Yahuah (LORD) is at hand;
--      it shall come as a destruction from the Almighty* (Isaiah 13:6). Zephaniah names the same day —
--      *The great day of Yahuah (LORD) is near... That day is a day of wrath, a day of trouble and
--      distress* (Zephaniah 1:14-15) — and Amos warns it is not the light the presumptuous expect: *the
--      day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). The locust plague is a near, local
--      foretaste; the day itself deepens through Joel 2-3 and reaches FORWARD to the consummation that
--      *so cometh as a thief in the night* (1 Thessalonians 5:2) — *But the day of Yahuah (Lord) will come
--      as a thief in the night; in the which the heavens shall pass away with a great noise* (2 Peter
--      3:10). One day of Yahuah, prophesied here, answered at the end.
--   ★ SANCTIFY YE A FAST (THREAD 2): the prophet's answer to the judgment is corporate repentance —
--      *Gird yourselves, and lament, ye priests... come, lie all night in sackcloth... Sanctify ye a fast,
--      call a solemn assembly, gather the elders and all the inhabitants of the land into the house of
--      Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD)* (Joel 1:13-14). This is the
--      appointed-assembly frame that flowers in 2:15-17. The pattern is the same as Jehoshaphat — *and
--      proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3) — and Nineveh — *proclaimed
--      a fast, and put on sackcloth... cry mightily unto Elohim (God): yea, let them turn every one from
--      his evil way* (Jonah 3:5,8). The fast is not the point; the turning is.
--   ★★ THE LOCUST CONSUMING — THE COVENANT CURSE (THREAD 3): *the meat offering and the drink offering is
--      cut off from the house of Yahuah (LORD)* (Joel 1:9); the vine, fig, oil, and harvest are stripped
--      (1:10-12). This is precisely the Deuteronomy 28 curse pronounced for covenant-breaking — *Thou
--      shalt carry much seed out into the field, and shalt gather but little in; for the locust shall
--      consume it. Thou shalt plant vineyards... but shalt neither drink of the wine... thine olive shall
--      cast his fruit* (Deuteronomy 28:38-40). The land withers under the covenant lawsuit. The CURSE is
--      the exile-judgment for breaking covenant — NEVER the Torah itself, which is the inheritance.
--   THE FOUR-FOLD LOCUST, RESTORED IN CH2 (THREAD 4): *That which the palmerworm hath left hath the locust
--      eaten; and that which the locust hath left hath the cankerworm eaten; and that which the cankerworm
--      hath left hath the caterpiller eaten* (Joel 1:4). The wound is named in four waves here; the healing
--      is promised in the next chapter — *And I will restore to you the years that the locust hath eaten,
--      the cankerworm, and the caterpiller, and the palmerworm, my great army which I sent among you*
--      (Joel 2:25). The same four creatures, named to devastate and named to be undone.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription), v.16-20 (the famine-and-fire lament continues the
--      harvest-curse of v.5-12 and the cry of v.19 joins the call of v.14 — woven in THREAD 2/3 prose).
--      All recorded above.

CREATE TEMP VIEW _s307_joel01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Alas for the day! the day of Yahuah is at hand, as a destruction from the Almighty
    ('canon','joel',1,15,'canon','isaiah',13,6,'free',
      E'*Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6). Joel echoes this oracle almost word for word: *Alas for the day! for the day of Yahuah (LORD) is at hand, and as a destruction from the Almighty shall it come* (Joel 1:15). The same day-of-Yahuah motif runs through both prophets — a near judgment on the land that opens onto the great and terrible day itself.'),
    ('canon','joel',1,15,'canon','isaiah',13,9,'free',
      E'*Behold, the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate: and he shall destroy the sinners thereof out of it* (Isaiah 13:9). Where Joel cries *the day of Yahuah (LORD) is at hand* (Joel 1:15), Isaiah unfolds what that day does — it lays the land desolate and purges the sinners. The locust foretaste of Joel is one stroke of the larger day Isaiah describes.'),
    ('canon','joel',1,15,'canon','zephaniah',1,14,'free',
      E'*The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly* (Zephaniah 1:14). Zephaniah strikes the same note as Joel''s *the day of Yahuah (LORD) is at hand* (Joel 1:15) — the day is near and hastens; the strong man''s bitter cry answers Joel''s *Alas for the day!*'),
    ('canon','joel',1,15,'canon','zephaniah',1,15,'free',
      E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). This is the texture of the day Joel announces — *the day of Yahuah (LORD) is at hand, and as a destruction from the Almighty shall it come* (Joel 1:15). Joel 2:2 will take up the very same words: *a day of darkness and of gloominess, a day of clouds and of thick darkness*.'),
    ('canon','joel',1,15,'canon','amos',5,18,'free',
      E'*Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). Amos warns that the day Joel cries *Alas* over (Joel 1:15) is no triumph for the presumptuous — it is darkness, not light. The day of Yahuah judges before it delivers; only the turning of the next verses (Joel 1:13-14; 2:12-13) finds mercy in it.'),
    ('canon','joel',1,15,'canon','1-thessalonians',5,2,'free',
      E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). The day Joel introduces — *the day of Yahuah (LORD) is at hand* (Joel 1:15) — reaches forward to the consummation Paul names with the same title: it *so cometh as a thief in the night*, sudden upon those who say *Peace and safety* (5:3). Joel''s near foretaste and Paul''s final day are one motif, opened here.'),
    ('canon','joel',1,15,'canon','2-peter',3,10,'free',
      E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). Joel''s *the day of Yahuah (LORD) is at hand, and as a destruction from the Almighty shall it come* (Joel 1:15) finds its furthest reach in Peter''s great day — the same day of Yahuah, now consuming the heavens and the earth. The locust-stripped land is the first sign of a day that ends in fire.'),

    -- THREAD 2 (★): Sanctify ye a fast, call a solemn assembly, and cry unto Yahuah
    ('canon','joel',1,14,'canon','2-chronicles',20,3,'free',
      E'*And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3). Joel''s command — *Sanctify ye a fast, call a solemn assembly... and cry unto Yahuah (LORD)* (Joel 1:14) — is the very pattern Jehoshaphat kept when the great multitude came against him: the proclaimed fast that gathers a people to seek Yahuah in the day of threat.'),
    ('canon','joel',1,14,'canon','2-chronicles',20,4,'free',
      E'*And Yahudah (Judah) gathered themselves together, to ask help of Yahuah (LORD): even out of all the cities of Yahudah (Judah) they came to seek Yahuah (LORD)* (2 Chronicles 20:4). This is the solemn assembly Joel calls for — *gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God)* (Joel 1:14). The whole people gathered to one place to seek deliverance; the fast is the gathering of the heart, not a mere abstinence.'),
    ('canon','joel',1,14,'canon','jonah',3,5,'free',
      E'*So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). Joel''s call to *gird yourselves, and lament... come, lie all night in sackcloth* (Joel 1:13) and *Sanctify ye a fast* (1:14) is exactly what Nineveh did when the word of judgment came — a whole city in sackcloth, great and small, turning to seek mercy.'),
    ('canon','joel',1,14,'canon','jonah',3,8,'free',
      E'*But let man and beast be covered with sackcloth, and cry mightily unto Elohim (God): yea, let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8). Nineveh''s decree names the heart of Joel''s fast — *cry mightily unto Elohim* answers *cry unto Yahuah (LORD)* (Joel 1:14), and the turning from evil is the point of the gathering. The fast without the turning is empty; the turning is what finds mercy.'),
    ('canon','joel',1,14,'canon','jonah',3,9,'free',
      E'*Who can tell if Elohim (God) will turn and repent, and turn away from his fierce anger, that we perish not?* (Jonah 3:9). This is the hope behind Joel''s solemn assembly — the people *cry unto Yahuah (LORD)* (Joel 1:14) not presuming on mercy but seeking it, as Joel 2:14 will echo: *Who knoweth if he will return and repent, and leave a blessing behind him?* The same humility, the same open door.'),

    -- THREAD 3 (★★): the locust consuming — the Deuteronomy 28 covenant-curse on the land
    ('canon','joel',1,9,'canon','deuteronomy',28,38,'free',
      E'*Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38). The locust that strips Joel''s land — leaving *the meat offering and the drink offering... cut off from the house of Yahuah (LORD)* (Joel 1:9) — is the very covenant-curse Moses pronounced for covenant-breaking. The land withers under the lawsuit; the curse is the exile-judgment, never the Torah itself.'),
    ('canon','joel',1,7,'canon','deuteronomy',28,39,'free',
      E'*Thou shalt plant vineyards, and dress them, but shalt neither drink of the wine, nor gather the grapes; for the worms shall eat them* (Deuteronomy 28:39). Joel''s *He hath laid my vine waste, and barked my fig tree* (Joel 1:7) and the dried-up new wine (1:5,10) are the outworking of this curse — the vine planted but never drunk. The covenant-breaking land bears the judgment Moses foretold, not a flaw in the covenant.'),
    ('canon','joel',1,10,'canon','deuteronomy',28,40,'free',
      E'*Thou shalt have olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil; for thine olive shall cast his fruit* (Deuteronomy 28:40). Joel''s lament — *the oil languisheth* (Joel 1:10) — is this curse made present: the olive failing, the oil gone. The harvest-stripping of Joel 1 is Deuteronomy 28 enacted on a covenant-breaking land; the remedy is the turning of 1:13-14, not a release from the covenant.'),

    -- THREAD 4: the four-fold locust, laterally answered by the restoration of Joel 2:25
    ('canon','joel',1,4,'canon','joel',2,25,'free',
      E'*And I will restore to you the years that the locust hath eaten, the cankerworm, and the caterpiller, and the palmerworm, my great army which I sent among you* (Joel 2:25). The four-fold devastation named here — *That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten; and that which the cankerworm hath left hath the caterpiller eaten* (Joel 1:4) — is answered creature for creature in the next chapter. The same four named to ruin are named to be undone; the wound of ch1 is the healing of ch2.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s307_joel01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s307_joel01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand',
       E'Alas for the day! — the day of Yahuah is at hand, a destruction from the Almighty',
       E'The locust plague is the near sign of a far greater thing, and here the book''s spine is struck: *Alas for the day! for the day of Yahuah (LORD) is at hand, and as a destruction from the Almighty shall it come* (Joel 1:15). This is the day-of-Yahuah motif that will deepen through chapters 2 and 3. Joel echoes Isaiah almost word for word — *Howl ye; for the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6) — and Isaiah unfolds what that day does: *Behold, the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate* (Isaiah 13:9). Zephaniah names the same day and its texture: *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly* (Zephaniah 1:14); *That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15) — words Joel will take up in 2:2. And Amos warns it is no triumph for the presumptuous: *Woe unto you that desire the day of Yahuah (LORD)!... the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). The motif reaches FORWARD to the consummation under the same title: *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2); *But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10). One day of Yahuah — foretasted in a stripped land, consummated in fire. The only refuge is the turning Joel commands in the verses just before, and the mercy he holds out in 2:12-13.',
       sv.verse_id, ev.verse_id, 'free', 31000
  FROM _s307_joel01_lookup sv, _s307_joel01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-1-sanctify-ye-a-fast-call-a-solemn-assembly',
       E'Sanctify ye a fast, call a solemn assembly — and cry unto Yahuah',
       E'Against the judgment, the prophet calls not for panic but for corporate repentance: *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God)* (Joel 1:13), *Sanctify ye a fast, call a solemn assembly, gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD)* (Joel 1:14). This is the appointed-assembly frame that flowers in 2:15-17 (*Blow the trumpet in Zion, sanctify a fast, call a solemn assembly*). It is the same pattern Jehoshaphat kept when the great multitude came against Yahudah: *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3); *And Yahudah (Judah) gathered themselves together, to ask help of Yahuah (LORD)* (2 Chronicles 20:4). And it is what Nineveh did at the word of judgment: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5); *let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8). The fast is never the point — the turning is. And the door is left open in the same humble hope: *Who can tell if Elohim (God) will turn and repent, and turn away from his fierce anger, that we perish not?* (Jonah 3:9), which Joel himself will echo: *Who knoweth if he will return and repent, and leave a blessing behind him?* (Joel 2:14).',
       sv.verse_id, ev.verse_id, 'free', 31003
  FROM _s307_joel01_lookup sv, _s307_joel01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-1-the-locust-consuming-the-covenant-curse-on-the-land',
       E'The meat and drink offering cut off — the Deuteronomy 28 curse on the land',
       E'The locust does more than ruin a harvest; it interrupts the temple service itself: *The meat offering and the drink offering is cut off from the house of Yahuah (LORD); the priests, the LORD''S ministers, mourn* (Joel 1:9). The vine, the fig, the oil, and the field are stripped: *He hath laid my vine waste, and barked my fig tree* (Joel 1:7); *the new wine is dried up, the oil languisheth* (Joel 1:10); *all the trees of the field, are withered* (1:12). This is precisely the covenant-curse Moses pronounced over a covenant-breaking land: *Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38); *Thou shalt plant vineyards, and dress them, but shalt neither drink of the wine, nor gather the grapes; for the worms shall eat them* (Deuteronomy 28:39); *Thou shalt have olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil; for thine olive shall cast his fruit* (Deuteronomy 28:40). The withered land is the covenant lawsuit enacted. Mark the framework carefully: the CURSE is the Deuteronomy 28 exile-judgment for breaking covenant — it is NEVER the Torah itself, which is the inheritance and the instruction of life. The remedy is not release from the covenant but return to it — the fast and the turning of 1:13-14, which Yahuah answers in 2:18-19 by sending again the corn, the wine, and the oil.',
       sv.verse_id, ev.verse_id, 'free', 31006
  FROM _s307_joel01_lookup sv, _s307_joel01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-1-that-which-the-palmerworm-hath-left-the-locust-eaten',
       E'That which the palmerworm hath left — the four-fold locust, restored in chapter two',
       E'The devastation comes in four waves, each finishing what the last began: *That which the palmerworm hath left hath the locust eaten; and that which the locust hath left hath the cankerworm eaten; and that which the cankerworm hath left hath the caterpiller eaten* (Joel 1:4). It is total — *a nation is come up upon my land, strong, and without number, whose teeth are the teeth of a lion* (Joel 1:6). But the wound named here in four creatures is answered creature for creature in the very next chapter: *And I will restore to you the years that the locust hath eaten, the cankerworm, and the caterpiller, and the palmerworm, my great army which I sent among you* (Joel 2:25). The same four named to ruin are named to be undone. Joel names the loss precisely so that the restoration can be just as precise — what the army of Yahuah consumed, Yahuah himself will restore, *and ye shall eat in plenty, and be satisfied, and praise the name of Yahuah Elohaychem (the LORD your God)* (Joel 2:26). The wound of chapter one is set down here so the healing of chapter two can lift it.',
       sv.verse_id, ev.verse_id, 'free', 31009
  FROM _s307_joel01_lookup sv, _s307_joel01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the day of Yahuah (LORD) is at hand; it shall come as a destruction from the Almighty* (Isaiah 13:6) — Joel 1:15 echoes Isaiah nearly verbatim; the same day-of-Yahuah motif.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate* (Isaiah 13:9) — what the day at hand (Joel 1:15) does to the land.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly* (Zephaniah 1:14) — the same nearness Joel cries; the day hastens.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a day of wrath... a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15) — the texture of the day; Joel 2:2 takes up the same words.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18) — the day at hand is no triumph for the presumptuous; only the turning finds mercy in it.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — the motif reaches forward; the same day, now the consummation, sudden upon those who say Peace and safety.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise* (2 Peter 3:10) — the furthest reach of the day; the locust-stripped land is the first sign of a day that ends in fire.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-alas-for-the-day-the-day-of-yahuah-is-at-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Jehoshaphat... proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3) — the same proclaimed fast Joel 1:14 commands when threat comes upon the land.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-sanctify-ye-a-fast-call-a-solemn-assembly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahudah (Judah) gathered themselves together, to ask help of Yahuah (LORD)* (2 Chronicles 20:4) — the solemn assembly Joel calls for; the whole people gathered to seek deliverance.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-sanctify-ye-a-fast-call-a-solemn-assembly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the people of Nineveh... proclaimed a fast, and put on sackcloth, from the greatest of them even to the least* (Jonah 3:5) — a whole city in sackcloth at the word of judgment; Joel 1:13-14''s pattern.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-sanctify-ye-a-fast-call-a-solemn-assembly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*cry mightily unto Elohim (God): yea, let them turn every one from his evil way* (Jonah 3:8) — the heart of Joel''s fast; the turning, not the abstinence, is the point.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-sanctify-ye-a-fast-call-a-solemn-assembly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Who can tell if Elohim (God) will turn and repent... that we perish not?* (Jonah 3:9) — the humble hope behind the assembly; echoed by Joel 2:14.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-sanctify-ye-a-fast-call-a-solemn-assembly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *for the locust shall consume it* (Deuteronomy 28:38) — the meat and drink offering cut off (Joel 1:9) is the Deuteronomy 28 curse for covenant-breaking, never the Torah as curse.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-the-locust-consuming-the-covenant-curse-on-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt plant vineyards... but shalt neither drink of the wine* (Deuteronomy 28:39) — Joel''s wasted vine and dried new wine (1:5,7,10) are this curse made present.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-the-locust-consuming-the-covenant-curse-on-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thou shalt not anoint thyself with the oil; for thine olive shall cast his fruit* (Deuteronomy 28:40) — Joel''s *the oil languisheth* (1:10); the harvest-stripping is Deuteronomy 28 enacted, the remedy is return.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-the-locust-consuming-the-covenant-curse-on-the-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will restore to you the years that the locust hath eaten, the cankerworm, and the caterpiller, and the palmerworm* (Joel 2:25) — the four creatures of 1:4 answered creature for creature; the wound of ch1, the healing of ch2.'
  FROM cross_reference_threads t
  JOIN _s307_joel01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s307_joel01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-1-that-which-the-palmerworm-hath-left-the-locust-eaten'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joel_2.sql (Joel 2) -----
-- Chapter: Joel 2 — Blow the trumpet in Zion; the day of Yahuah and the great army; REND YOUR HEART
-- and not your garments; the restoration of the years the locust hath eaten; and ★★★ THE OUTPOURING OF
-- THE SPIRIT — *I will pour out my spirit upon all flesh* — the text Peter preaches at Shavuot/Pentecost
-- (Acts 2), with the sun darkened and the moon turned to blood before the great and terrible day.
-- Tag: joel02   Session: s307   Temp view: _s307_joel02_lookup
-- Sort band: base 31025, step 3 -> threads at 31025, 31028, 31031, 31034, 31037 (5 threads)
-- Source of EVERY row: 'canon','joel',2,v
--
-- Joel 2 coverage:
--   ★ v.1 (Blow ye the trumpet in Zion, and sound an alarm in my holy mountain... the day of Yahuah cometh)
--        NT:     ★ forward to the last trump (1 Corinthians 15:52 / 1 Thessalonians 4:16) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Numbers 10:9 (blow an alarm... ye shall be remembered), ★ Zephaniah 1:16 (a day of the
--                trumpet and alarm) — THREAD 4
--   v.2-11 (a day of darkness... a great people and a strong... the sun and the moon shall be dark... the
--          day of Yahuah is great and very terrible; and who can abide it?)
--        NT:     none warranted distinct (the great army = instrument of the day of Yahuah; v.10 sun/moon
--                signs answered in THREAD 2; v.11 "who can abide it" woven into THREAD 4 prose)
--        Extras: none warranted
--        Tanakh: v.2 "a day of darkness and of gloominess, a day of clouds and of thick darkness" = the
--                Zephaniah day-of-Yahuah language — folded into THREAD 4 (the trumpet/day-of-Yahuah)
--   ★★ v.12-13 (turn ye even to me with all your heart... AND REND YOUR HEART, and not your garments...
--          for he is gracious and merciful, slow to anger, and of great kindness)
--        NT:     ★ James 4:8 (Draw nigh to Elohim, and he will draw nigh to you... purify your hearts) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Exodus 34:6 (Yahuah... merciful and gracious, longsuffering — the Name-proclamation
--                Joel quotes), ★ Psalm 51:17 (a broken and a contrite heart), ★ Jonah 4:2 (a gracious
--                Elohim, and merciful, slow to anger — same divine formula) — THREAD 3
--   ★ v.15-17 (Blow the trumpet in Zion, sanctify a fast, call a solemn assembly... gather the people...
--          let the priests weep... Spare thy people, O Yahuah)
--        NT:     none warranted distinct (the solemn-assembly/Trumpets architecture; v.15 shofar -> THREAD 4)
--        Extras: none warranted
--        Tanakh: folded into THREAD 4 (the appointed-times trumpet-and-assembly frame)
--   v.18-24 (Then will Yahuah be jealous for his land... I will send you corn, and wine, and oil... the
--          former rain and the latter rain... the floors shall be full of wheat)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: the material restoration; prefaces THREAD 5 (the answer to ch1's devastation)
--   ★ v.25-27 (I will restore to you the years that the locust hath eaten... ye shall know that I am in
--          the midst of Yashar'el... my people shall never be ashamed)
--        NT:     ★ Romans 10:11 (Whosoever believeth on him shall not be ashamed) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Isaiah 54:4 (Fear not; for thou shalt not be ashamed) — THREAD 5 (the two-house "my
--                people in the midst", never put to shame)
--   ★★★ v.28-29,32 (I will pour out my spirit upon ALL FLESH; your sons and your daughters shall
--          prophesy... whosoever shall call on the name of Yahuah shall be delivered)
--        NT:     ★★★ Acts 2:17 + 2:18 + 2:21 (Peter quotes Joel VERBATIM at Pentecost — "this is that
--                which was spoken by the prophet Joel"), ★★ Acts 2:39 (the promise is to you and your
--                children), ★★ Romans 10:13 (whosoever shall call upon the name of Yahuah shall be saved
--                — Paul quotes Joel 2:32) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes),
--                ★★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts)
--                — THREAD 1 (the Spirit put within = the Torah written on the heart; Spirit and Torah
--                inseparable, NOT Torah replaced)
--   ★★ v.30-31 (I will shew wonders in the heavens and in the earth, blood, and fire... the SUN shall be
--          turned into darkness, and the MOON into blood, before the great and the terrible day of Yahuah)
--        NT:     ★★ Acts 2:19-20 (Peter includes the cosmic signs in the Joel quotation), ★★ Matthew 24:29
--                (the sun darkened, the moon shall not give her light), ★★ Revelation 6:12 (the sun black,
--                the moon as blood) — THREAD 2
--        Extras: none warranted
--        Tanakh: tied to v.10 (the sun and the moon shall be dark) and the day-of-Yahuah frame
--
-- Threads (slug — target libraries):
--   1. joel-2-i-will-pour-out-my-spirit-upon-all-flesh — NT (Acts 2:17,18,21,39; Romans 10:13) + Tanakh
--      (Ezekiel 36:27; Jeremiah 31:33) [free]  (★★★ THE KEYSTONE: Shavuot/Pentecost outpouring; whosoever
--      calls on the Name delivered; Spirit-within = Torah-on-the-heart, inseparable)
--   2. joel-2-the-sun-into-darkness-and-the-moon-into-blood — NT (Acts 2:19-20; Matthew 24:29;
--      Revelation 6:12) [free]  (★★ the cosmic signs before the great and terrible day of Yahuah)
--   3. joel-2-rend-your-heart-and-not-your-garments — NT (James 4:8) + Tanakh (Exodus 34:6; Psalm 51:17;
--      Jonah 4:2) [free]  (★★ true repentance; the Name-proclamation gracious-and-merciful Joel quotes)
--   4. joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah — NT (1 Corinthians 15:52; 1 Thessalonians 4:16)
--      + Tanakh (Numbers 10:9; Zephaniah 1:16) [free]  (★ the shofar/solemn-assembly frame; the day of
--      Yahuah; forward to the last-trump ingathering)
--   5. joel-2-i-will-restore-the-years-my-people-never-ashamed — NT (Romans 10:11) + Tanakh (Isaiah 54:4)
--      [free]  (★ the restoration answer to ch1; my people in the midst of Yashar'el, never put to shame)
--
-- Framing notes:
--   ★★★ THE OUTPOURING OF THE SPIRIT (THREAD 1): *And it shall come to pass afterward, that I will pour
--      out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28) and
--      *whosoever shall call on the name of Yahuah (LORD) shall be delivered* (Joel 2:32). This is the
--      text Peter stands up and preaches at Shavuot — *this is that which was spoken by the prophet Joel*
--      (Acts 2:16) — and quotes verbatim (Acts 2:17-21). Shavuot is the APPOINTED TIME the Spirit is
--      poured: the same feast the Torah was given at Sinai is the feast the Spirit is given. And the
--      Spirit-within is the SAME new-covenant gift as the Torah written on the heart — *I will put my
--      spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27); *I will put my law in
--      their inward parts, and write it in their hearts* (Jeremiah 31:33). The Spirit and the Torah are
--      inseparable; the outpouring writes the law on the heart, it does not abolish it. Paul seals the
--      universal call — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans
--      10:13) quotes Joel 2:32 — and Peter adds *the promise is unto you, and to your children, and to
--      all that are afar off* (Acts 2:39): the two-house promise, near and far, gathered by the one Name.
--   ★★ THE SUN INTO DARKNESS, THE MOON INTO BLOOD (THREAD 2): *The sun shall be turned into darkness, and
--      the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31) —
--      the cosmic signs of the day of Yahuah, picked up the same way the Spirit-prophecy was. Peter
--      includes them in the Pentecost quotation (Acts 2:19-20); the Messiah repeats them (Matthew 24:29);
--      the sixth seal opens upon them (Revelation 6:12). One day-of-Yahuah signature across the library.
--   ★★ REND YOUR HEART (THREAD 3): *turn ye even to me with all your heart... And rend your heart, and not
--      your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful,
--      slow to anger, and of great kindness* (Joel 2:12-13). Joel quotes the Name-proclamation of Sinai
--      verbatim — *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and
--      abundant in goodness and truth* (Exodus 34:6) — the same formula Jonah throws back (Jonah 4:2). The
--      torn heart, not the torn garment, is the sacrifice Yahuah will not despise (Psalm 51:17), and the
--      apostle gives the same call: *Draw nigh to Elohim (God), and he will draw nigh to you... purify
--      your hearts* (James 4:8).
--   ★ BLOW THE TRUMPET IN ZION (THREAD 4): *Blow ye the trumpet in Zion, and sound an alarm in my holy
--      mountain* (Joel 2:1); *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel
--      2:15) — the shofar-and-assembly architecture of the appointed times, sounded because *the day of
--      Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). The Torah set the
--      alarm-trumpet for the day of battle — *ye shall blow an alarm with the trumpets; and ye shall be
--      remembered* (Numbers 10:9) — and Zephaniah names the same day *a day of the trumpet and alarm*
--      (Zephaniah 1:16). The trumpet runs forward to the last trump that gathers — *at the last trump:
--      for the trumpet shall sound* (1 Corinthians 15:52); *with the trump of Elohim (God)* (1
--      Thessalonians 4:16).
--   ★ I WILL RESTORE THE YEARS (THREAD 5): *And I will restore to you the years that the locust hath
--      eaten* (Joel 2:25); *ye shall know that I am in the midst of Yashar'el (Israel)... and my people
--      shall never be ashamed* (Joel 2:27). The answer to ch1's devastation: Yahuah in the midst of his
--      people, who *shall never be ashamed* — Isaiah's same promise to restored Yashar'el (*thou shalt
--      not be ashamed* — Isaiah 54:4), sealed forward in Paul (*Whosoever believeth on him shall not be
--      ashamed* — Romans 10:11).
--   VERSES WITH NO SEPARATE ADD: v.2-11 (the great army / day of darkness — the instrument of the day of
--      Yahuah; v.10 sun/moon signs carried by THREAD 2, v.11 "who can abide it" woven into THREAD 4
--      prose); v.15-17 (solemn-assembly/priests-weep — the appointed-times frame, v.15 shofar in THREAD
--      4); v.18-24 (the material restoration — corn, wine, oil, former and latter rain — the preface to
--      THREAD 5). All recorded; no library silently skipped.

CREATE TEMP VIEW _s307_joel02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): I will pour out my spirit upon all flesh — Shavuot/Pentecost; Spirit-within = Torah-on-heart
    ('canon','joel',2,28,'canon','acts',2,17,'free',
      E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams* (Acts 2:17). Peter stands up at Shavuot and preaches Joel word for word — *this is that which was spoken by the prophet Joel* (Acts 2:16) — quoting *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28). The appointed time the Torah was given at Sinai is the appointed time the Spirit is poured.'),
    ('canon','joel',2,29,'canon','acts',2,18,'free',
      E'*And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy* (Acts 2:18). Peter continues Joel''s line exactly — *And also upon the servants and upon the handmaids in those days will I pour out my spirit* (Joel 2:29). The outpouring falls on the lowest of the household; none is excluded from the Spirit poured at Shavuot.'),
    ('canon','joel',2,32,'canon','acts',2,21,'free',
      E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21). Peter closes the Joel quotation with Joel 2:32 verbatim — *whosoever shall call on the name of Yahuah (LORD) shall be delivered*. The deliverance promised *in mount Zion and in Jerusalem* and *in the remnant whom Yahuah (LORD) shall call* (Joel 2:32) is opened to all who call on the Name.'),
    ('canon','joel',2,32,'canon','acts',2,39,'free',
      E'*For the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39). Peter applies Joel''s *the remnant whom Yahuah (LORD) shall call* (Joel 2:32): the promise reaches *you, and... your children, and... all that are afar off* — the two houses, near and far, gathered by the one Name they call upon.'),
    ('canon','joel',2,32,'canon','romans',10,13,'free',
      E'*For whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). Paul quotes Joel 2:32 directly — *whosoever shall call on the name of Yahuah (LORD) shall be delivered* — to seal the universal call: there is no difference between the Yahudi (Jew) and the Greek (Romans 10:12), for the same Yahuah is rich to all that call upon him.'),
    ('canon','joel',2,28,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit Joel pours out — *I will pour out my spirit upon all flesh* (Joel 2:28) — is the same Spirit Ezekiel promises put WITHIN, and its work is named: to cause the walk in Yahuah''s statutes. The outpouring writes the Torah on the heart; the Spirit and the Torah are inseparable, never opposed.'),
    ('canon','joel',2,28,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The same new-covenant gift as Joel''s outpoured Spirit: the law written on the heart of *the house of Yashar''el (Israel)*. The Spirit poured (Joel 2:28) and the Torah inscribed (Jeremiah 31:33) are one act — the covenant renewed, not replaced.'),

    -- THREAD 2 (★★): the sun into darkness and the moon into blood — the day of Yahuah signs
    ('canon','joel',2,31,'canon','acts',2,20,'free',
      E'*The sun shall be turned into darkness, and the moon into blood, before that great and notable day of Yahuah (Lord) come* (Acts 2:20). Peter carries Joel''s cosmic signs into the Pentecost sermon exactly — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). The same day-of-Yahuah signature stands over the whole prophecy.'),
    ('canon','joel',2,30,'canon','acts',2,19,'free',
      E'*And I will shew wonders in heaven above, and signs in the earth beneath; blood, and fire, and vapour of smoke* (Acts 2:19). Peter quotes Joel''s wonders — *And I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke* (Joel 2:30) — as part of the one prophecy fulfilled and yet unfolding: the Spirit poured and the day of Yahuah heralded together.'),
    ('canon','joel',2,31,'canon','matthew',24,29,'free',
      E'*Immediately after the tribulation of those days shall the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven, and the powers of the heavens shall be shaken* (Matthew 24:29). The Messiah names the very signs of Joel — *The sun shall be turned into darkness, and the moon into blood* (Joel 2:31) — before he comes in the clouds. The cosmic darkening of the day of Yahuah is his coming.'),
    ('canon','joel',2,31,'canon','revelation',6,12,'free',
      E'*And I beheld when he had opened the sixth seal, and, lo, there was a great earthquake; and the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). The sixth seal opens upon Joel''s signs precisely — *the sun became black... and the moon became as blood* answers *The sun shall be turned into darkness, and the moon into blood* (Joel 2:31). The great and terrible day of Yahuah arrives bearing the sign Joel foretold.'),

    -- THREAD 3 (★★): rend your heart and not your garments — the gracious-and-merciful Name-proclamation
    ('canon','joel',2,13,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). Joel quotes the Sinai Name-proclamation verbatim: *turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness* (Joel 2:13). The torn heart turns to the One who revealed himself as mercy itself; his character is the ground of the call to repent.'),
    ('canon','joel',2,13,'canon','psalms',51,17,'free',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). The torn heart of Joel — *rend your heart, and not your garments* (Joel 2:13) — is David''s broken and contrite heart, the sacrifice Yahuah will not despise. Not the outward token but the inward turning is what the gracious and merciful One receives.'),
    ('canon','joel',2,13,'canon','jonah',4,2,'free',
      E'*I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2). Jonah throws back at Yahuah the same divine formula Joel calls upon — *gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). The character that drives Jonah to flight is the character that makes repentance worth the rending: Yahuah relents toward the contrite.'),
    ('canon','joel',2,12,'canon','james',4,8,'free',
      E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The apostolic echo of Joel''s call — *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). The same inward turning: draw near, purify the heart, and the gracious and merciful One draws near in answer.'),

    -- THREAD 4 (★): Blow the trumpet in Zion — the day of Yahuah; forward to the last trump
    ('canon','joel',2,1,'canon','numbers',10,9,'free',
      E'*And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). The Torah set the alarm-trumpet for the day of battle, that Yashar''el be remembered and saved. Joel sounds that very alarm — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1) — for the day of Yahuah is at hand.'),
    ('canon','joel',2,1,'canon','zephaniah',1,16,'free',
      E'*A day of the trumpet and alarm against the fenced cities, and against the high towers* (Zephaniah 1:16). Zephaniah names the day of Yahuah with the same trumpet-and-alarm Joel sounds — *Blow ye the trumpet in Zion, and sound an alarm* (Joel 2:1) — and with the same darkness: *a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15; Joel 2:2). One great and terrible day, one shofar-cry.'),
    ('canon','joel',2,1,'canon','1-corinthians',15,52,'free',
      E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trumpet of Zion runs forward to the last trump that gathers — *Blow ye the trumpet in Zion, and sound an alarm* (Joel 2:1). The same shofar that warns of the day of Yahuah is the shofar that raises the dead at the ingathering.'),
    ('canon','joel',2,1,'canon','1-thessalonians',4,16,'free',
      E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The trumpet Joel sounds in Zion — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1) — is the trump of Elohim at the day of Yahuah, when the One descends and the dead rise: one ingathering, not severed from Yashar''el.'),

    -- THREAD 5 (★): I will restore the years... my people shall never be ashamed
    ('canon','joel',2,26,'canon','isaiah',54,4,'free',
      E'*Fear not; for thou shalt not be ashamed: neither be thou confounded; for thou shalt not be put to shame: for thou shalt forget the shame of thy youth, and shalt not remember the reproach of thy widowhood any more* (Isaiah 54:4). Isaiah gives restored Yashar''el the same promise Joel seals — *my people shall never be ashamed* (Joel 2:26). The years the locust ate are restored, the reproach forgotten; the gathered people is never again put to shame.'),
    ('canon','joel',2,26,'canon','romans',10,11,'free',
      E'*For the scripture saith, Whosoever believeth on him shall not be ashamed* (Romans 10:11). Paul carries forward the promise of Joel — *my people shall never be ashamed* (Joel 2:26) — to all who trust the One the prophets testified of. The same assurance: those who are Yahuah''s, in the midst of whom he dwells, shall never be put to shame.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s307_joel02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s307_joel02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-2-i-will-pour-out-my-spirit-upon-all-flesh',
       E'I will pour out my spirit upon all flesh — the Spirit poured at Shavuot, the Torah written on the heart',
       E'This is the heart of the book and the text Peter preaches on the day of Pentecost: *And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy, your old men shall dream dreams, your young men shall see visions: And also upon the servants and upon the handmaids in those days will I pour out my spirit* (Joel 2:28-29), and *whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance... and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). When the Spirit falls at Shavuot, Peter stands up and names the prophecy outright — *this is that which was spoken by the prophet Joel* (Acts 2:16) — and quotes it word for word: *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17), *And on my servants and on my handmaidens I will pour out in those days of my Spirit; and they shall prophesy* (Acts 2:18), *And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21). Shavuot is the APPOINTED TIME: the same feast at which the Torah was given at Sinai is the feast at which the Spirit is poured. And the gift is one gift — the Spirit put WITHIN is the Torah written on the HEART. *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The outpouring does not abolish the Torah — it inscribes it; the Spirit and the Torah are inseparable. And the call goes out to the two houses, near and far: Peter applies *the remnant whom Yahuah (LORD) shall call* (Joel 2:32) as *the promise is unto you, and to your children, and to all that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39), and Paul seals it — *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13) — gathering all who call upon the one Name.',
       sv.verse_id, ev.verse_id, 'free', 31025
  FROM _s307_joel02_lookup sv, _s307_joel02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=2 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-2-the-sun-into-darkness-and-the-moon-into-blood',
       E'The sun into darkness and the moon into blood — the signs before the great and terrible day of Yahuah',
       E'With the Spirit-outpouring comes the day-of-Yahuah signature: *And I will shew wonders in the heavens and in the earth, blood, and fire, and pillars of smoke. The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:30-31) — the same darkening already foreshadowed in the army''s advance, when *the sun and the moon shall be dark, and the stars shall withdraw their shining* (Joel 2:10). Peter quotes these signs as part of the one Pentecost prophecy: *And I will shew wonders in heaven above, and signs in the earth beneath; blood, and fire, and vapour of smoke: The sun shall be turned into darkness, and the moon into blood, before that great and notable day of Yahuah (Lord) come* (Acts 2:19-20). The Messiah names the very same: *Immediately after the tribulation of those days shall the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29). And the sixth seal opens upon them exactly: *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12). One day-of-Yahuah sign, foretold by Joel, repeated by the Messiah, and unsealed in the Revelation — the heavens themselves announce the great and terrible day.',
       sv.verse_id, ev.verse_id, 'free', 31028
  FROM _s307_joel02_lookup sv, _s307_joel02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=2 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-2-rend-your-heart-and-not-your-garments',
       E'Rend your heart, and not your garments — for he is gracious and merciful, slow to anger',
       E'In the face of the day of Yahuah, the call is not to outward tokens but to the inward turning: *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning: And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:12-13). The ground of the call is the very character Yahuah proclaimed at Sinai, which Joel quotes verbatim: *And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). It is the same formula Jonah flings back in his anger — *I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2) — proof that Yahuah relents toward the contrite. And the torn heart, not the torn garment, is precisely the sacrifice he receives: *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). The apostle gives the selfsame call: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). Turn with the whole heart, and the gracious and merciful One turns toward you.',
       sv.verse_id, ev.verse_id, 'free', 31031
  FROM _s307_joel02_lookup sv, _s307_joel02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah',
       E'Blow the trumpet in Zion — the alarm for the day of Yahuah, and the last trump',
       E'The chapter opens with the shofar and closes the call with it again: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1), and *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15). This is the appointed-times architecture — the trumpet and the solemn assembly — sounded because *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). The Torah ordained that very alarm for the day of battle: *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). Zephaniah names the same day in the same terms — *A day of the trumpet and alarm against the fenced cities* (Zephaniah 1:16), *a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15; Joel 2:2). And the trumpet of Zion runs forward to the last trump, the ingathering: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52); *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). One shofar — the alarm of the day of Yahuah and the trumpet of the gathering — sounded over the one people, never severed from Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 31034
  FROM _s307_joel02_lookup sv, _s307_joel02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-2-i-will-restore-the-years-my-people-never-ashamed',
       E'I will restore the years the locust hath eaten — my people shall never be ashamed',
       E'The answer to the devastation of chapter 1 is restoration and indwelling presence: *And I will restore to you the years that the locust hath eaten, the cankerworm, and the caterpiller, and the palmerworm, my great army which I sent among you* (Joel 2:25). The promise rises to its height in the doubled assurance: *And ye shall eat in plenty, and be satisfied, and praise the name of Yahuah Elohaychem (the LORD your God), that hath dealt wondrously with you: and my people shall never be ashamed. And ye shall know that I am in the midst of Yashar''el (Israel), and that I am Yahuah Elohaychem (the LORD your God), and none else: and my people shall never be ashamed* (Joel 2:26-27). Yahuah in the MIDST of his people, who shall never again be put to shame — this is Isaiah''s same word to restored Yashar''el: *Fear not; for thou shalt not be ashamed: neither be thou confounded; for thou shalt not be put to shame: for thou shalt forget the shame of thy youth, and shalt not remember the reproach of thy widowhood any more* (Isaiah 54:4). Paul carries it forward to all who trust the One the prophets testified of: *Whosoever believeth on him shall not be ashamed* (Romans 10:11). The years are restored, the reproach forgotten, and the people in whose midst Yahuah dwells is never put to shame.',
       sv.verse_id, ev.verse_id, 'free', 31037
  FROM _s307_joel02_lookup sv, _s307_joel02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=2 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy* (Acts 2:17) — Peter preaches Joel 2:28 verbatim at Shavuot: *this is that which was spoken by the prophet Joel*.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *And on my servants and on my handmaidens I will pour out in those days of my Spirit* (Acts 2:18) — Joel 2:29 continued; the Spirit falls on the lowest of the household, none excluded.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=29
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21) — Joel 2:32 verbatim; the deliverance in Zion opened to all who call on the Name.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=32
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the promise is unto you, and to your children, and to all that are afar off* (Acts 2:39) — Peter applies *the remnant whom Yahuah shall call* (Joel 2:32): the two houses, near and far.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=32
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13) — Paul quotes Joel 2:32; no difference between Yahudi (Jew) and Greek, the one Name for all who call.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=32
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the outpoured Spirit (Joel 2:28) put WITHIN to keep the Torah; Spirit and Torah inseparable.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the same new-covenant gift as the outpoured Spirit: the Torah inscribed on the heart, not replaced.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=28
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-pour-out-my-spirit-upon-all-flesh'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *The sun shall be turned into darkness, and the moon into blood, before that great and notable day of Yahuah (Lord) come* (Acts 2:20) — Peter carries Joel 2:31 into the Pentecost sermon verbatim.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=31
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-the-sun-into-darkness-and-the-moon-into-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will shew wonders in heaven above, and signs in the earth beneath; blood, and fire, and vapour of smoke* (Acts 2:19) — Joel 2:30''s wonders, part of the one Pentecost prophecy.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=30
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-the-sun-into-darkness-and-the-moon-into-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29) — the Messiah names Joel''s signs before he comes in the clouds.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=31
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-the-sun-into-darkness-and-the-moon-into-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the sun became black as sackcloth of hair, and the moon became as blood* (Revelation 6:12) — the sixth seal opens upon Joel 2:31; the great and terrible day arrives bearing the sign.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=31
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-the-sun-into-darkness-and-the-moon-into-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — Joel 2:13 quotes the Sinai Name-proclamation; mercy itself is the ground of repentance.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-rend-your-heart-and-not-your-garments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the torn heart of Joel 2:13 is the sacrifice Yahuah receives, not the outward token.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-rend-your-heart-and-not-your-garments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a gracious Elohim (God), and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2) — Jonah throws back the same formula Joel 2:13 calls upon; Yahuah relents toward the contrite.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-rend-your-heart-and-not-your-garments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Draw nigh to Elohim (God), and he will draw nigh to you... purify your hearts* (James 4:8) — the apostolic echo of *turn ye even to me with all your heart* (Joel 2:12); the inward turning.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-rend-your-heart-and-not-your-garments'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem... and ye shall be saved* (Numbers 10:9) — the Torah''s alarm-trumpet, sounded by Joel 2:1 for the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *A day of the trumpet and alarm against the fenced cities* (Zephaniah 1:16) — Zephaniah names the day of Yahuah with Joel''s same trumpet-and-darkness (Joel 2:1-2).'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52) — the trumpet of Zion (Joel 2:1) forward to the last-trump ingathering.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the shofar of Joel 2:1 is the trump at the day of Yahuah and the gathering.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Fear not; for thou shalt not be ashamed... thou shalt forget the shame of thy youth* (Isaiah 54:4) — Isaiah''s same promise to restored Yashar''el as Joel 2:26: never put to shame.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=26
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-restore-the-years-my-people-never-ashamed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Whosoever believeth on him shall not be ashamed* (Romans 10:11) — Paul carries Joel 2:26''s *my people shall never be ashamed* forward to all who trust the One the prophets testified of.'
  FROM cross_reference_threads t
  JOIN _s307_joel02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=26
  JOIN _s307_joel02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-2-i-will-restore-the-years-my-people-never-ashamed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_joel_3.sql (Joel 3) -----
-- Chapter: Joel 3 — the judgment of the nations in the valley of Jehoshaphat; the war-muster of the
-- heathen (beat your plowshares into swords); the harvest-sickle and the valley of decision; the day
-- of Yahuah (LORD); the roar out of Zion; and the consummation — Yahuah dwelling in Zion, the fountain
-- from the house of Yahuah, Yahudah (Judah) dwelling for ever. The two-house regathering ("my people...
-- whom they have scattered") is the frame, and the nations that scattered them are brought to judgment.
-- NOTE: dump_canon.py joel 3 returns 21 verses (this edition numbers the valley-of-Jehoshaphat oracle
-- as its own ch.3, not folded into ch.2). Authored from those actual verse numbers.
-- Tag: joel03   Session: s307   Temp view: _s307_joel03_lookup
-- Sort band: base 31050, step 3 -> threads at 31050, 31053, 31056, 31059 (4 threads)
-- Source of EVERY row: 'canon','joel',3,v
--
-- Joel 3 coverage:
--   ★★ v.1-2 (in those days... when I shall bring again the captivity of Yahudah and Jerusalem, I will
--          also gather all nations... into the valley of Jehoshaphat, and will plead with them there for
--          my people and for my heritage Yashar'el, whom they have scattered among the nations)
--        NT:     ★★ Matthew 25:31-32 (the Son of Adam gathers all nations before him), ★ Revelation
--                16:14 (gathered to the battle of that great day) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh weave)
--        Tanakh: ★★ Ezekiel 38:16 (Gog brought up against my people Yashar'el in the latter days),
--                ★ Ezekiel 39:27-28 (gathered out of their enemies' lands), ★★ Zechariah 14:2-3 (all
--                nations gathered against Jerusalem, then Yahuah goes forth and fights) — THREAD 1
--   v.3-8 (cast lots for my people; Tyre, Zidon, Palestine, the Grecians; return your recompence on
--          your own head; sell your sons into the hand of Yahudah)
--        NT:     none warranted (the specific lawsuit against the slave-trading nations; the recompence
--                principle woven into THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: none forced (the named coast-nations' judgment — measure-for-measure; the regathering
--                of v.1-2 and v.7 "I will raise them out of the place" carried in THREAD 1)
--   ★ v.9-10 (Proclaim ye this among the Gentiles; Prepare war... Beat your plowshares into swords, and
--          your pruninghooks into spears: let the weak say, I am strong)
--        NT:     ★ Revelation 19:19 (the beast and the kings of the earth gathered together to make war) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 2:4 + ★★ Micah 4:3 (they shall beat their SWORDS into PLOWSHARES — the
--                DELIBERATE REVERSAL; the nations arm for the final confrontation before the peace) — THREAD 2
--   v.11-12 (Assemble yourselves... all ye heathen... thither cause thy mighty ones to come down... to
--          the valley of Jehoshaphat: for there will I sit to judge all the heathen round about)
--        NT:     held in THREAD 1 (Matthew 25:31-32 the throne of judgment over all nations)
--        Extras: none warranted
--        Tanakh: held in THREAD 1 (v.12 "judge all the heathen" = the valley-of-Jehoshaphat judgment-seat,
--                same scene as v.2; bound there)
--   ★ v.13-16 (Put ye in the sickle, for the harvest is ripe... the press is full... Multitudes,
--          multitudes in the valley of decision: for the day of Yahuah is near... The sun and the moon
--          shall be darkened... Yahuah also shall roar out of Zion)
--        NT:     ★ Revelation 14:14-16 (one like the Son of Adam... a sharp sickle... thrust in thy
--                sickle... for the harvest of the earth is ripe — John draws Joel directly), ★ Matthew
--                13:39 (the harvest is the end of the world) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Amos 1:2 (Yahuah will roar from Zion, and utter his voice from Jerusalem — verbatim
--                lateral), ★ Joel 2:31 (the sun shall be turned into darkness... before the great and
--                terrible day of Yahuah — the same book's day-of-Yahuah sign) — THREAD 3
--   ★ v.17-21 (So shall ye know that I am Yahuah Elohaychem dwelling in Zion, my holy mountain... a
--          fountain shall come forth of the house of Yahuah... Yahudah shall dwell for ever... for
--          Yahuah dwelleth in Zion)
--        NT:     ★ Revelation 21:3 (the tabernacle of Elohim is with men), ★ Revelation 22:1 (a pure
--                river of water of life... proceeding out of the throne), ★ Revelation 22:3 (no more
--                curse) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 47:1 (waters issued out from under the threshold of the house — the temple
--                river), ★ Zechariah 14:8 (living waters shall go out from Jerusalem) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered — NT (Matthew 25, Revelation 16) + Tanakh (Ezekiel 38, Ezekiel 39, Zechariah 14) [free]
--      (★★ the two-house regathering AND the judgment of the nations that scattered them; one valley-of-Jehoshaphat scene)
--   2. joel-3-beat-your-plowshares-into-swords-the-reversal — NT (Revelation 19) + Tanakh (Isaiah 2, Micah 4) [free]
--      (★ the war-muster of the nations = the deliberate REVERSAL of Isaiah 2:4 / Micah 4:3; arms before the peace)
--   3. joel-3-put-ye-in-the-sickle-the-valley-of-decision — NT (Revelation 14, Matthew 13) + Tanakh (Amos 1, Joel 2) [free]
--      (★ the harvest-sickle and the day of Yahuah; John draws Joel directly; the roar out of Zion)
--   4. joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah — NT (Revelation 21, Revelation 22) + Tanakh (Ezekiel 47, Zechariah 14) [free]
--      (★ the consummation: Yahuah dwelling with his restored people, the temple river, no more curse, Jerusalem holy for ever)
--
-- Framing notes:
--   ★★ THE VALLEY OF JEHOSHAPHAT (THREAD 1): *For, behold, in those days, and in that time, when I shall
--      bring again the captivity of Yahudah (Judah) and Jerusalem, I will also gather all nations, and
--      will bring them down into the valley of Jehoshaphat, and will plead with them there for my people
--      and for my heritage Yashar''el (Israel), whom they have scattered among the nations* (Joel 3:1-2).
--      The regathering of the scattered covenant people and the judgment of the nations that scattered
--      them are ONE scene. *Whom they have scattered* is the two-house frame — Yahudah and Yashar''el,
--      divided and dispersed, now pleaded for. Ezekiel sets the same court: Gog *come up against my people
--      of Yashar''el (Israel)... in the latter days* (Ezek 38:16), after Yahuah has *gathered them out of
--      their enemies'' lands* (Ezek 39:27). Zechariah: *I will gather all nations against Jerusalem to
--      battle... Then shall Yahuah (LORD) go forth, and fight against those nations* (Zech 14:2-3). The
--      Formed Son holds the assize: *When the Son of Adam shall come in his glory... before him shall be
--      gathered all nations* (Matt 25:31-32); the unclean spirits *gather them to the battle of that great
--      day of El Shaddai (God Almighty)* (Rev 16:14). The nations muster; Yahuah judges; his people are
--      gathered home.
--   ★ THE REVERSAL — PLOWSHARES INTO SWORDS (THREAD 2): *Beat your plowshares into swords, and your
--      pruninghooks into spears: let the weak say, I am strong* (Joel 3:10). This is the DELIBERATE
--      INVERSION of the peace-oracle: *they shall beat their swords into plowshares, and their spears into
--      pruninghooks: nation shall not lift up sword against nation* (Isaiah 2:4; Micah 4:3). Before the
--      Zion-peace comes, the nations arm for the final confrontation — the same beasts-and-kings gathered
--      *to make war against him that sat on the horse* (Rev 19:19). The reversed words mark the muster
--      that precedes the harvest of v.13.
--   ★ THE SICKLE AND THE VALLEY OF DECISION (THREAD 3): *Put ye in the sickle, for the harvest is ripe...
--      Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley
--      of decision... Yahuah (LORD) also shall roar out of Zion* (Joel 3:13-16). John draws Joel directly:
--      *one sat like unto the Son of Adam... a sharp sickle... Thrust in thy sickle, and reap... for the
--      harvest of the earth is ripe* (Rev 14:14-15); and the Master names it — *the harvest is the end of
--      the world* (Matt 13:39). The roar is Amos''s word too: *Yahuah (LORD) will roar from Zion, and utter
--      his voice from Jerusalem* (Amos 1:2); the darkened lights are this same book''s day-of-Yahuah sign:
--      *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible
--      day of Yahuah (LORD) come* (Joel 2:31). Yet the roar is also the refuge: *Yahuah will be the hope of
--      his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:16).
--   ★ YAHUAH DWELLING IN ZION (THREAD 4): *So shall ye know that I am Yahuah Elohaychem (the LORD your God)
--      dwelling in Zion, my holy mountain... a fountain shall come forth of the house of Yahuah (LORD)...
--      But Yahudah (Judah) shall dwell for ever... for Yahuah (LORD) dwelleth in Zion* (Joel 3:17-21). The
--      consummation: Yahuah dwelling with his restored people, the land flowing, Jerusalem holy for ever.
--      *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them* (Rev 21:3). Joel''s
--      fountain from the house of Yahuah is the temple river of Ezekiel — *waters issued out from under the
--      threshold of the house* (Ezek 47:1) — and Zechariah''s *living waters shall go out from Jerusalem*
--      (Zech 14:8) — and John''s *pure river of water of life... proceeding out of the throne of Elohim
--      (God) and of the Lamb* (Rev 22:1), where *there shall be no more curse* (Rev 22:3). The two-house
--      restoration consummated in the dwelling-place of Yahuah.
--   VERSES WITH NO SEPARATE ADD: v.3-8 (the lawsuit against Tyre, Zidon, Palestine, and the Grecians for
--      selling the children of Yahudah — measure-for-measure recompence; the regathering pledge of v.7
--      carried in THREAD 1 prose), v.11-12 (the assembling of the heathen and "there will I sit to judge"
--      = the same valley-of-Jehoshaphat judgment-seat of v.2, bound into THREAD 1). All recorded.

CREATE TEMP VIEW _s307_joel03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the valley of Jehoshaphat — gather all nations / my people whom they have scattered
    ('canon','joel',3,2,'canon','matthew',25,31,'free',
      E'*When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory* (Matthew 25:31). The valley-of-Jehoshaphat assize — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat... for there will I sit to judge all the heathen round about* (Joel 3:2,12) — is the throne of the Son of Adam, the Formed One who sits in glory to judge the gathered nations. The same scene: all nations gathered, the seat of judgment, the verdict on those who scattered his people.'),
    ('canon','joel',3,2,'canon','matthew',25,32,'free',
      E'*And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats* (Matthew 25:32). Joel''s *I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel)* (Joel 3:2) is this gathering and separating: the nations brought before the throne, judged for how they treated his heritage. The pleading *for my people* is the shepherd dividing sheep from goats.'),
    ('canon','joel',3,2,'canon','revelation',16,14,'free',
      E'*For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The nations Joel sees brought *down into the valley of Jehoshaphat* (Joel 3:2) are gathered by the unclean spirits *to the battle of that great day* — the same end-time muster of all nations to the place of judgment, where Yahuah pleads for his scattered people.'),
    ('canon','joel',3,2,'canon','ezekiel',38,16,'free',
      E'*And thou shalt come up against my people of Yashar''el (Israel), as a cloud to cover the land; it shall be in the latter days, and I will bring thee against my land, that the heathen may know me, when I shall be sanctified in thee, O Gog, before their eyes* (Ezekiel 38:16). Joel''s gathering of *all nations... into the valley of Jehoshaphat* to plead *for my people and for my heritage Yashar''el* (Joel 3:2) is Ezekiel''s latter-day Gog brought up against the land — the nations drawn to the place of judgment that Yahuah may be sanctified before their eyes.'),
    ('canon','joel',3,1,'canon','ezekiel',39,27,'free',
      E'*When I have brought them again from the people, and gathered them out of their enemies'' lands, and am sanctified in them in the sight of many nations* (Ezekiel 39:27). Joel''s *when I shall bring again the captivity of Yahudah (Judah) and Jerusalem* (Joel 3:1) is Ezekiel''s regathering — the scattered house brought home from the nations. The judgment of the heathen and the ingathering of the covenant people are one act, the same latter-day deliverance.'),
    ('canon','joel',3,1,'canon','ezekiel',39,28,'free',
      E'*Then shall they know that I am Yahuah (LORD) their Elohim (God), which caused them to be led into captivity among the heathen: but I have gathered them unto their own land, and have left none of them any more there* (Ezekiel 39:28). Joel''s pledge to *bring again the captivity of Yahudah (Judah) and Jerusalem* (Joel 3:1) is this complete regathering — *gathered them unto their own land... none of them any more there* — the scattered, two-house people brought back so that they know Yahuah is their Elohim.'),
    ('canon','joel',3,2,'canon','zechariah',14,2,'free',
      E'*For I will gather all nations against Jerusalem to battle; and the city shall be taken, and the houses rifled, and the women ravished; and half of the city shall go forth into captivity, and the residue of the people shall not be cut off from the city* (Zechariah 14:2). This is the same gathering Joel announces — *I will also gather all nations, and will bring them down into the valley of Jehoshaphat* (Joel 3:2) — the nations massed against Jerusalem at the day of Yahuah, drawn to the very place where they will be judged.'),
    ('canon','joel',3,2,'canon','zechariah',14,3,'free',
      E'*Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:3). When the nations are gathered against Jerusalem, Yahuah himself goes forth — exactly Joel''s *I will... plead with them there for my people and for my heritage Yashar''el (Israel)* (Joel 3:2). The pleading is the Formed One going forth to fight for his scattered people against those who divided his land.'),

    -- THREAD 2 (★): Beat your plowshares into swords — the deliberate reversal
    ('canon','joel',3,10,'canon','isaiah',2,4,'free',
      E'*And he shall judge among the nations, and shall rebuke many people: and they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up sword against nation, neither shall they learn war any more* (Isaiah 2:4). Joel deliberately REVERSES this peace-oracle word for word: *Beat your plowshares into swords, and your pruninghooks into spears* (Joel 3:10). Isaiah''s Zion-peace is the end; Joel''s reversed command is the muster of the nations for the final war that must come FIRST, before that peace.'),
    ('canon','joel',3,10,'canon','micah',4,3,'free',
      E'*And he shall judge among many people, and rebuke strong nations afar off; and they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up a sword against nation, neither shall they learn war any more* (Micah 4:3). Micah''s twin of Isaiah''s peace is inverted by Joel: *Beat your plowshares into swords, and your pruninghooks into spears: let the weak say, I am strong* (Joel 3:10). The same instruments, the opposite direction — the nations arm themselves for the valley of decision before the swords are ever turned back to plowshares.'),
    ('canon','joel',3,9,'canon','revelation',19,19,'free',
      E'*And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army* (Revelation 19:19). Joel''s war-proclamation — *Proclaim ye this among the Gentiles; Prepare war, wake up the mighty men, let all the men of war draw near* (Joel 3:9) — is this final muster: the beast and the kings of the earth gathered for the last war, drawn up against the Rider, the very confrontation Joel summons to the valley.'),

    -- THREAD 3 (★): Put ye in the sickle — the valley of decision, the day of Yahuah, the roar from Zion
    ('canon','joel',3,13,'canon','revelation',14,15,'free',
      E'*And another angel came out of the temple, crying with a loud voice to him that sat on the cloud, Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe* (Revelation 14:15). John draws Joel directly: *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow* (Joel 3:13). The ripe harvest and the full winepress of Joel are the sickle-and-vintage judgment of Revelation, the reaping of the earth at the end.'),
    ('canon','joel',3,13,'canon','revelation',14,14,'free',
      E'*And I looked, and behold a white cloud, and upon the cloud one sat like unto the Son of Adam, having on his head a golden crown, and in his hand a sharp sickle* (Revelation 14:14). The One who wields the sickle of Joel''s harvest — *Put ye in the sickle, for the harvest is ripe* (Joel 3:13) — is the Son of Adam crowned upon the cloud, the Formed One who reaps the ripe earth. Joel''s command is fulfilled in the cloud-rider''s sharp sickle.'),
    ('canon','joel',3,13,'canon','matthew',13,39,'free',
      E'*The enemy that sowed them is the devil; the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). The Master names the meaning of Joel''s ripe harvest — *Put ye in the sickle, for the harvest is ripe... for their wickedness is great* (Joel 3:13): *the harvest is the end of the world*. The reaping in the valley of decision is the final separation, gathered by the angels at the consummation.'),
    ('canon','joel',3,16,'canon','amos',1,2,'free',
      E'*And he said, Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of Carmel shall wither* (Amos 1:2). Joel''s *Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem* (Joel 3:16) is Amos''s opening word almost to the letter — the Lion''s roar from the holy mountain at the day of judgment. The same voice that shakes the heavens and the earth is the hope of his people.'),
    ('canon','joel',3,15,'canon','joel',2,31,'free',
      E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). Joel''s own earlier sign returns: *The sun and the moon shall be darkened, and the stars shall withdraw their shining* (Joel 3:15). The darkened lights are the fixed token of the day of Yahuah — *for the day of Yahuah (LORD) is near in the valley of decision* (Joel 3:14) — the heavens themselves announcing the harvest-judgment.'),

    -- THREAD 4 (★): Yahuah dwelling in Zion — a fountain from the house of Yahuah, no more curse
    ('canon','joel',3,17,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). Joel''s consummation — *So shall ye know that I am Yahuah Elohaychem (the LORD your God) dwelling in Zion, my holy mountain* (Joel 3:17) — is this dwelling of Yahuah with his people. The holy mountain where no stranger passes through becomes the tabernacle of Elohim with men, his restored people his own for ever.'),
    ('canon','joel',3,18,'canon','revelation',22,1,'free',
      E'*And he shewed me a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). Joel''s *a fountain shall come forth of the house of Yahuah (LORD)* (Joel 3:18) is this river of life from the throne. The water issuing from the dwelling-place of Yahuah, flowing to make the land live, is the same stream John sees proceeding out of the throne in the consummated city.'),
    ('canon','joel',3,18,'canon','ezekiel',47,1,'free',
      E'*Afterward he brought me again unto the door of the house; and, behold, waters issued out from under the threshold of the house eastward... and the waters came down from under from the right side of the house, at the south side of the altar* (Ezekiel 47:1). Joel''s *a fountain shall come forth of the house of Yahuah (LORD)* (Joel 3:18) is Ezekiel''s temple river — the waters from under the threshold of the house that deepen and heal wherever they go. The same fountain from the dwelling-place of Yahuah waters the valley.'),
    ('canon','joel',3,18,'canon','zechariah',14,8,'free',
      E'*And it shall be in that day, that living waters shall go out from Jerusalem; half of them toward the former sea, and half of them toward the hinder sea: in summer and in winter shall it be* (Zechariah 14:8). Joel''s fountain from the house of Yahuah (Joel 3:18) is Zechariah''s living waters from Jerusalem, perpetual in summer and winter — the river of the day of Yahuah, flowing from the city where Yahuah dwells as king over all the earth.'),
    ('canon','joel',3,21,'canon','revelation',22,3,'free',
      E'*And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it; and his servants shall serve him* (Revelation 22:3). Joel''s closing word — *For I will cleanse their blood that I have not cleansed: for Yahuah (LORD) dwelleth in Zion* (Joel 3:21) — is the curse lifted and the dwelling sealed: the bloodguilt purged, Yahuah dwelling in Zion, the throne in the midst, no more curse. The consummation of the holy mountain that *Yahudah (Judah) shall dwell for ever* (Joel 3:20).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s307_joel03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s307_joel03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered',
       E'The valley of Jehoshaphat — my people, whom they have scattered among the nations',
       E'Joel''s last chapter opens the great assize: *For, behold, in those days, and in that time, when I shall bring again the captivity of Yahudah (Judah) and Jerusalem, I will also gather all nations, and will bring them down into the valley of Jehoshaphat, and will plead with them there for my people and for my heritage Yashar''el (Israel), whom they have scattered among the nations, and parted my land* (Joel 3:1-2). Two things happen at once: the scattered covenant people are brought home, and the nations that scattered them are judged. *Whom they have scattered* is the two-house frame — Yahudah in the south and Yashar''el/Ephraim in the north, divided and dispersed, now pleaded for as Yahuah''s own heritage. The same court convenes everywhere in the prophets. Ezekiel sees the latter-day muster: *thou shalt come up against my people of Yashar''el (Israel)... it shall be in the latter days, and I will bring thee against my land* (Ezekiel 38:16), after the regathering — *I have gathered them unto their own land, and have left none of them any more there* (Ezekiel 39:28). Zechariah sets the same scene: *I will gather all nations against Jerusalem to battle... Then shall Yahuah (LORD) go forth, and fight against those nations, as when he fought in the day of battle* (Zechariah 14:2-3). And the Formed Son holds the throne of the verdict: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory: And before him shall be gathered all nations: and he shall separate them one from another, as a shepherd divideth his sheep from the goats* (Matthew 25:31-32) — the nations gathered, as the unclean spirits *gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The nations are drawn to the very place of their judgment; the scattered people are gathered home; Yahuah pleads for his heritage. (The lawsuit of vv.3-8 against Tyre, Zidon, Palestine, and the Grecians for selling the children of Yahudah is the measure-for-measure recompence — *I will return your recompence upon your own head* — and his pledge *I will raise them out of the place whither ye have sold them* (3:7) is this same regathering.)',
       sv.verse_id, ev.verse_id, 'free', 31050
  FROM _s307_joel03_lookup sv, _s307_joel03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-3-beat-your-plowshares-into-swords-the-reversal',
       E'Beat your plowshares into swords — the deliberate reversal before the peace',
       E'To the gathered nations Joel cries the war-muster: *Proclaim ye this among the Gentiles; Prepare war, wake up the mighty men, let all the men of war draw near; let them come up: Beat your plowshares into swords, and your pruninghooks into spears: let the weak say, I am strong* (Joel 3:9-10). This is a DELIBERATE REVERSAL — the exact inversion of the great Zion peace-oracle: *they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up sword against nation, neither shall they learn war any more* (Isaiah 2:4), word for word in its twin *they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up a sword against nation* (Micah 4:3). Isaiah and Micah give the END — the law going forth from Zion, the nations at peace. Joel gives what comes FIRST: the nations arming themselves, the implements of harvest turned to weapons, the final confrontation that must be met before the peace can come. It is the same last war John sees: *And I saw the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse, and against his army* (Revelation 19:19). The nations muster their full strength — *let the weak say, I am strong* — and march up to the valley of decision, where the sickle of the next verses waits.',
       sv.verse_id, ev.verse_id, 'free', 31053
  FROM _s307_joel03_lookup sv, _s307_joel03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-3-put-ye-in-the-sickle-the-valley-of-decision',
       E'Put ye in the sickle — the harvest is ripe; multitudes in the valley of decision',
       E'The muster done, the reaping is called: *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great. Multitudes, multitudes in the valley of decision: for the day of Yahuah (LORD) is near in the valley of decision. The sun and the moon shall be darkened, and the stars shall withdraw their shining. Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:13-16). John draws this scene directly: *one sat like unto the Son of Adam, having on his head a golden crown, and in his hand a sharp sickle* (Revelation 14:14), and the cry goes up, *Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe* (Revelation 14:15). The Master names the meaning: *the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39). The roar from Zion is the very word Amos opens with: *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2). And the darkened lights are this book''s own fixed sign of the day: *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). The harvest-judgment falls on the gathered nations — yet to his own people the same roaring One is refuge: *Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)*.',
       sv.verse_id, ev.verse_id, 'free', 31056
  FROM _s307_joel03_lookup sv, _s307_joel03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah',
       E'Yahuah dwelling in Zion — a fountain shall come forth of the house of Yahuah',
       E'The harvest past, the book closes in the consummation: *So shall ye know that I am Yahuah Elohaychem (the LORD your God) dwelling in Zion, my holy mountain: then shall Jerusalem be holy, and there shall no strangers pass through her any more... and a fountain shall come forth of the house of Yahuah (LORD), and shall water the valley of Shittim... But Yahudah (Judah) shall dwell for ever, and Jerusalem from generation to generation... for Yahuah (LORD) dwelleth in Zion* (Joel 3:17-21). This is Yahuah dwelling with his restored people, the land flowing with new wine and milk, the city holy for ever. John hears it: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them* (Revelation 21:3). And the fountain from the house of Yahuah is the river the prophets all saw — Ezekiel''s temple stream, *waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1); Zechariah''s *living waters shall go out from Jerusalem... in summer and in winter shall it be* (Zechariah 14:8); and John''s consummation of them all, *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1), where *there shall be no more curse* (Revelation 22:3). Joel''s last line — *For I will cleanse their blood that I have not cleansed: for Yahuah (LORD) dwelleth in Zion* (Joel 3:21) — is that curse lifted and the dwelling sealed: the bloodguilt purged, Yahuah enthroned in Zion, the two-house restoration brought home to the place where he dwells for ever.',
       sv.verse_id, ev.verse_id, 'free', 31059
  FROM _s307_joel03_lookup sv, _s307_joel03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='joel' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *When the Son of Adam shall come in his glory... then shall he sit upon the throne of his glory* (Matthew 25:31) — the valley-of-Jehoshaphat judgment-seat is the throne of the Formed Son over the gathered nations.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *before him shall be gathered all nations: and he shall separate them one from another* (Matthew 25:32) — Joel''s gathering of all nations to plead for his heritage is the shepherd dividing sheep from goats.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14) — the end-time muster of all nations to the place of judgment, the valley of Jehoshaphat.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *thou shalt come up against my people of Yashar''el (Israel)... it shall be in the latter days* (Ezekiel 38:16) — Gog brought to the land = the nations drawn to the place of judgment.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *When I have brought them again from the people, and gathered them out of their enemies'' lands* (Ezekiel 39:27) — Joel''s regathering of the captivity of Yahudah and Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I have gathered them unto their own land, and have left none of them any more there* (Ezekiel 39:28) — the complete two-house ingathering Joel pledges.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=39 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *I will gather all nations against Jerusalem to battle* (Zechariah 14:2) — the same gathering of all nations Joel announces to the valley of Jehoshaphat.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *Then shall Yahuah (LORD) go forth, and fight against those nations* (Zechariah 14:3) — Yahuah''s pleading for his people = the Formed One going forth to fight for them.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-the-valley-of-jehoshaphat-my-people-whom-they-have-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up sword against nation* (Isaiah 2:4) — Joel 3:10 is the deliberate REVERSAL; the muster before the peace.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-beat-your-plowshares-into-swords-the-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they shall beat their swords into plowshares, and their spears into pruninghooks* (Micah 4:3) — the twin peace-oracle Joel inverts; same instruments, opposite direction.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-beat-your-plowshares-into-swords-the-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the beast, and the kings of the earth, and their armies, gathered together to make war against him that sat on the horse* (Revelation 19:19) — Joel''s war-proclamation is the final muster against the Rider.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-beat-your-plowshares-into-swords-the-reversal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thrust in thy sickle, and reap... for the harvest of the earth is ripe* (Revelation 14:15) — John draws Joel''s ripe harvest and full winepress directly.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-put-ye-in-the-sickle-the-valley-of-decision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *one sat like unto the Son of Adam... in his hand a sharp sickle* (Revelation 14:14) — the wielder of Joel''s sickle is the crowned cloud-rider, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-put-ye-in-the-sickle-the-valley-of-decision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the harvest is the end of the world; and the reapers are the angels* (Matthew 13:39) — the Master names the meaning of Joel''s ripe harvest.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-put-ye-in-the-sickle-the-valley-of-decision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2) — Joel 3:16 almost to the letter; the Lion''s roar from the holy mountain.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-put-ye-in-the-sickle-the-valley-of-decision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31) — this book''s own fixed sign of the day, returning at 3:15.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-put-ye-in-the-sickle-the-valley-of-decision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — Joel''s Yahuah dwelling in Zion = the tabernacle of Elohim with his restored people.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *a pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1) — Joel''s fountain from the house of Yahuah, consummated.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *waters issued out from under the threshold of the house eastward... at the south side of the altar* (Ezekiel 47:1) — Joel''s fountain from the house of Yahuah is the temple river.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *living waters shall go out from Jerusalem... in summer and in winter shall it be* (Zechariah 14:8) — the same perpetual day-of-Yahuah river from the city where Yahuah dwells.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *And there shall be no more curse: but the throne of Elohim (God) and of the Lamb shall be in it* (Revelation 22:3) — Joel''s *I will cleanse their blood... for Yahuah dwelleth in Zion* (3:21): the curse lifted, the dwelling sealed.'
  FROM cross_reference_threads t
  JOIN _s307_joel03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s307_joel03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='joel-3-yahuah-dwelling-in-zion-a-fountain-from-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session307 — Joel cross-references complete.'
