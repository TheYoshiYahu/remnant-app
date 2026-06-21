-- =====================================================================
-- Session 333 — Micah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session333_micah_cross_references.sql
-- =====================================================================

\echo 'session333 — Micah cross-references starting...'
BEGIN;

-- ----- fragment: minion_micah_1.sql (Micah 1) -----
-- Chapter: Micah 1 — YAHUAH COMES FORTH OUT OF HIS PLACE, COMES DOWN, AND TREADS THE HIGH PLACES
-- (the judgment-theophany), and the covenant-controversy against BOTH capitals — Samaria the
-- transgression of Jacob, the high places of Yahudah (Judah) which are Jerusalem (1:5) — the two
-- houses indicted; the prophet's wailing lament over the incurable wound that comes up to the
-- gate of Jerusalem (1:8-9) and the wordplay-lament over the doomed towns into captivity (1:10-16).
-- Tag: mic01   Temp view: _s333_mic01_lookup
-- Sort band: base 45400, step 3 -> threads at 45400, 45403, 45406, 45409 (4 threads)
-- Source of EVERY row: 'canon','micah',1,v
--
-- Micah 1 coverage:
--   v.1  (The word of Yahuah... concerning Samaria and Jerusalem)
--        NT/Extras/Tanakh: none warranted separate — the superscription naming the two capitals is
--        woven into THREAD 2's prose (both-houses controversy frame).
--   v.2  (Hear, all ye people... let Adonai Yahuah be witness against you, Yahuah from his holy temple)
--        Tanakh: woven into THREAD 1 (Yahuah from his holy temple = the descending Judge); no separate add.
--   ★★ v.3-4 (Yahuah cometh forth out of his place, and will come down, and tread upon the high places
--          of the earth. And the mountains shall be molten under him... as wax before the fire)
--        NT:     ★★ Revelation 6:14,16,17 (every mountain... moved out of their places... the great day
--                of his wrath is come), ★ 2 Peter 3:10,12 (the elements shall melt with fervent heat) — THREAD 1
--        Extras: ★★★ 1 Enoch 1:3,4,6 (The Holy Great One will come forth from His dwelling... will tread
--                upon the earth... the high mountains shall be shaken... shall melt like wax before the
--                flame) — a SUPERB clean witness on the very theophany — THREAD 1
--        Tanakh: ★★ Amos 4:13 (he that formeth the mountains... treadeth upon the high places of the
--                earth, Yahuah), ★★ Isaiah 64:1,3 (come down, that the mountains might flow down at thy
--                presence), ★ Psalm 18:7,9 (He bowed the heavens also, and came down), ★ Nahum 1:5,6
--                (the mountains quake... the hills melt... the earth is burned at his presence) — THREAD 1
--   ★ v.5 (For the transgression of Jacob is all this, and for the sins of the house of Yashar''el...
--          is it not Samaria?... the high places of Yahudah... are they not Jerusalem?)
--   ★ v.6-7 (Samaria as an heap... graven images... the hire of an harlot)
--        NT:     none warranted distinct (the two-house indictment's restoration answer is the Tanakh's own)
--        Extras: none warranted (clean theophany witness reserved to THREAD 1)
--        Tanakh: ★ Hosea 8:5,6 (Thy calf, O Samaria... the calf of Samaria shall be broken in pieces) —
--                the idolatry of the northern house; ★★ Ezekiel 37:19,22 (the stick of Joseph... the
--                stick of Yahudah... make them one stick... no more two nations) — THE TWO-HOUSE GUARD/answer — THREAD 2
--   ★ v.8-9 (I will wail and howl, I will go stripped and naked... For her wound is incurable; for it
--          is come unto Yahudah; he is come unto the gate of my people, even to Jerusalem)
--        NT:     none warranted (the prophet's grief weaves laterally to the prophets' lament)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 9:1 (Oh that my head were waters... that I might weep day and night), ★ Jeremiah
--                30:12 (Thy bruise is incurable, and thy wound is grievous), ★ Isaiah 10:32 (he shall shake
--                his hand against the mount of the daughter of Zion, the hill of Jerusalem — the Assyrian at
--                the gate) — THREAD 3
--   v.10-16 (Declare ye it not at Gath... the wordplay-lament over the towns... gone into captivity)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ 2 Samuel 1:20 (Tell it not in Gath, publish it not in the streets of Askelon) — David's
--                dirge echoed in 1:10; ★★ Ezekiel 37:19 self-link as the captivity's restoration answer
--                NOT re-forced (held in THREAD 2); the towns grouped into ONE lament-into-captivity thread — THREAD 4
--
-- Threads (slug — target libraries):
--   1. micah-1-yahuah-comes-down-and-treads-the-high-places — NT (Revelation 6, 2 Peter 3) + Extras
--      (1 Enoch 1) + Tanakh (Amos 4, Isaiah 64, Psalm 18, Nahum 1) [extras]
--      (★★ THE KEYSTONE — the descending judgment-theophany; the Formed Son who comes forth, comes down,
--       treads the high places, the mountains melting as wax → the day of Yahuah)
--   2. micah-1-the-transgression-of-jacob-both-houses-indicted — Tanakh (Hosea 8, Ezekiel 37) [free]
--      (★ the controversy against BOTH capitals; the harlot-hire calf of the north; the two-house
--       indictment that ends in the two sticks made one — Romans 11 guard: a controversy, never a cast-off)
--   3. micah-1-i-will-wail-and-howl-the-incurable-wound — Tanakh (Jeremiah 9, Jeremiah 30, Isaiah 10) [free]
--      (★ the weeping prophet, the incurable wound that comes up to the gate of Jerusalem)
--   4. micah-1-tell-it-not-in-gath-the-lament-into-captivity — Tanakh (2 Samuel 1) [free]
--      (★ the wordplay-dirge over the doomed towns, gone into captivity — David's "Tell it not in Gath" echoed)
--
-- Framing notes:
--   ★★ THE DESCENDING THEOPHANY (THREAD 1, KEYSTONE): *For, behold, Yahuah (LORD) cometh forth out of
--      his place, and will come down, and tread upon the high places of the earth. And the mountains
--      shall be molten under him, and the valleys shall be cleft, as wax before the fire* (Micah 1:3-4).
--      This is the Formed Son — the One who appears, who comes DOWN — read through the whole library's
--      theophany of judgment. Amos sings him by name as the One who treads: *he that formeth the
--      mountains... and treadeth upon the high places of the earth, Yahuah (LORD)* (Amos 4:13). Isaiah
--      pleads the same descent: *that thou wouldest come down, that the mountains might flow down at thy
--      presence... thou camest down, the mountains flowed down* (Isaiah 64:1,3). David saw it: *He bowed
--      the heavens also, and came down* (Psalm 18:9). Nahum: *The mountains quake at him, and the hills
--      melt* (Nahum 1:5). And the restored witness is a near-verbatim parallel: *The Holy Great One will
--      come forth from His dwelling, And the eternal Elohim (God) will tread upon the earth... the high
--      mountains shall be shaken... And shall melt like wax before the flame* (1 Enoch 1:3,4,6) — come
--      forth, tread, melt like wax. The forward-weave is the day of wrath: *every mountain and island
--      were moved out of their places... For the great day of his wrath is come* (Revelation 6:14,17),
--      *the elements shall melt with fervent heat* (2 Peter 3:10). One descending Judge across the canon.
--   ★ BOTH HOUSES INDICTED (THREAD 2): *For the transgression of Jacob is all this, and for the sins of
--      the house of Yashar''el (Israel). What is the transgression of Jacob? is it not Samaria? and what
--      are the high places of Yahudah (Judah)? are they not Jerusalem?* (Micah 1:5). The controversy
--      strikes BOTH capitals — Samaria the head of the northern house, Jerusalem the high places of the
--      south. The northern idolatry is the calf: *Thy calf, O Samaria, hath cast thee off... the calf of
--      Samaria shall be broken in pieces* (Hosea 8:5,6) — the harlot-hire idols Micah says shall be
--      beaten to pieces (1:7). This is covenant-lawsuit against both houses, NEVER a cast-off: the same
--      two houses are made ONE again — *I will take the stick of Joseph... and the stick of Yahudah
--      (Judah), and make them one stick... they shall be no more two nations* (Ezekiel 37:19,22). The
--      indictment and the ingathering name the same two-house people.
--   ★ THE INCURABLE WOUND (THREAD 3): *Therefore I will wail and howl, I will go stripped and naked... For
--      her wound is incurable; for it is come unto Yahudah (Judah); he is come unto the gate of my people,
--      even to Jerusalem* (Micah 1:8-9). The prophet's grief is the weeping prophet's: *Oh that my head
--      were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the
--      daughter of my people* (Jeremiah 9:1). The wound is the incurable bruise: *Thy bruise is incurable,
--      and thy wound is grievous* (Jeremiah 30:12). And the foe coming up to the gate is the Assyrian:
--      *he shall shake his hand against the mount of the daughter of Zion, the hill of Jerusalem* (Isaiah
--      10:32). The blow reaches from Samaria all the way to Jerusalem's gate.
--   ★ TELL IT NOT IN GATH (THREAD 4): *Declare ye it not at Gath, weep ye not at all: in the house of
--      Aphrah roll thyself in the dust* (Micah 1:10) — the prophet takes up David's dirge: *Tell it not in
--      Gath, publish it not in the streets of Askelon; lest the daughters of the Philistines rejoice* (2
--      Samuel 1:20). The dense wordplay over the doomed towns (Saphir, Zaanan, Lachish, Achzib, Mareshah)
--      ends in captivity: *Make thee bald... enlarge thy baldness as the eagle; for they are gone into
--      captivity from thee* (Micah 1:16). One mourning-song over a land being carried away.
--   EXTRAS: 1 Enoch 1:3,4,6 (the Holy Great One comes forth, treads the earth, the mountains melt like
--      wax) — a clean, near-verbatim witness on the theophany, parse verified. No extras forced on the
--      two-house indictment, the wound, or the town-lament.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription — woven into THREAD 2), v.2 (witness from his holy
--      temple — woven into THREAD 1 as the descending Judge), v.6-7 (Samaria's heap/harlot-hire — bound
--      in THREAD 2), v.11-15 (the town wordplay — grouped into THREAD 4 with v.10,16, not a thread per
--      town per the brief). All recorded, none silently skipped.

CREATE TEMP VIEW _s333_mic01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★ KEYSTONE): Yahuah comes down and treads the high places — the descending judgment-theophany
    ('canon','micah',1,3,'canon','amos',4,13,'free',
      E'*For, lo, he that formeth the mountains, and createth the wind, and declareth unto man what is his thought, that maketh the morning darkness, and treadeth upon the high places of the earth, Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13). Micah''s *Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth* (Micah 1:3) is Amos'' very confession — the One who *treadeth upon the high places of the earth* is Yahuah, the Formed Son who appears and treads. The same title, the same descent to judge.'),
    ('canon','micah',1,3,'canon','isaiah',64,1,'free',
      E'*Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1). Isaiah pleads for the descent Micah announces — *Yahuah (LORD)... will come down* (Micah 1:3) — and the mountains answer the same way: they *flow down at thy presence*, as Micah''s *mountains shall be molten under him* (1:4). The coming-down of Yahuah melts the heights.'),
    ('canon','micah',1,4,'canon','isaiah',64,3,'free',
      E'*When thou didst terrible things which we looked not for, thou camest down, the mountains flowed down at thy presence* (Isaiah 64:3). Micah''s *the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire* (1:4) is Isaiah''s memory of the theophany: *thou camest down, the mountains flowed down at thy presence*. When the Formed Son comes down, the earth cannot hold its shape.'),
    ('canon','micah',1,3,'canon','psalms',18,9,'free',
      E'*He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9). David sings the same descent Micah foretells — *Yahuah (LORD)... will come down* (Micah 1:3): *He bowed the heavens also, and came down*. The Deliverer who came down to David is the Judge who comes down to tread the high places.'),
    ('canon','micah',1,4,'canon','psalms',18,7,'free',
      E'*Then the earth shook and trembled; the foundations also of the hills moved and were shaken, because he was wroth* (Psalm 18:7). When Yahuah comes down the earth convulses — Micah''s *the mountains shall be molten under him, and the valleys shall be cleft* (1:4) is David''s *the foundations also of the hills moved and were shaken*. The descent of the Formed Son shakes the very foundations.'),
    ('canon','micah',1,4,'canon','nahum',1,5,'free',
      E'*The mountains quake at him, and the hills melt, and the earth is burned at his presence, yea, the world, and all that dwell therein* (Nahum 1:5). Nahum says of the same theophany what Micah says — *the mountains shall be molten under him... as wax before the fire* (Micah 1:4): *the mountains quake at him, and the hills melt... at his presence*. The Presence that comes down melts the everlasting hills.'),
    ('canon','micah',1,4,'canon','nahum',1,6,'free',
      E'*Who can stand before his indignation? and who can abide in the fierceness of his anger? his fury is poured out like fire, and the rocks are thrown down by him* (Nahum 1:6). Micah''s melting mountains *as wax before the fire* (1:4) raise Nahum''s question: *Who can stand before his indignation?* — *his fury is poured out like fire*. The descending Judge none can withstand.'),
    ('canon','micah',1,4,'canon','revelation',6,14,'free',
      E'*And the heaven departed as a scroll when it is rolled together; and every mountain and island were moved out of their places* (Revelation 6:14). The forward-weave of Micah''s melting heights — *the mountains shall be molten under him, and the valleys shall be cleft* (1:4) — is the day of wrath: *every mountain and island were moved out of their places*. The high places Yahuah treads down are removed in the great day.'),
    ('canon','micah',1,3,'canon','revelation',6,17,'free',
      E'*For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Micah''s *Yahuah (LORD) cometh forth out of his place, and will come down* (1:3) is the day John names: *the great day of his wrath is come; and who shall be able to stand?* The coming-forth of Yahuah from his place IS the day of wrath, before the face of him that sitteth on the throne and the wrath of the Lamb (6:16).'),
    ('canon','micah',1,4,'canon','2-peter',3,10,'free',
      E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). Micah''s mountains *molten under him... as wax before the fire* (1:4) reach their consummation in the day of Yahuah: *the elements shall melt with fervent heat*. The treading-down of the high places is the first word of the dissolving of all things.'),
    ('canon','micah',1,4,'canon','2-peter',3,12,'free',
      E'*Looking for and hasting unto the coming of the day of Elohim (God), wherein the heavens being on fire shall be dissolved, and the elements shall melt with fervent heat?* (2 Peter 3:12). The wax-before-the-fire of Micah 1:4 is the elements melting at the day of Elohim — *the heavens being on fire shall be dissolved, and the elements shall melt*. One fire, one melting, from the high places of the earth to the heavens themselves.'),
    ('canon','micah',1,3,'enoch','1-enoch',1,3,'extras',
      E'*Concerning the elect I said, and took up my parable concerning them: The Holy Great One will come forth from His dwelling* (1 Enoch 1:3). The restored witness opens with Micah''s very announcement — *Yahuah (LORD) cometh forth out of his place* (Micah 1:3): *The Holy Great One will come forth from His dwelling*. The Judge comes forth out of his place to come down upon the earth.'),
    ('canon','micah',1,3,'enoch','1-enoch',1,4,'extras',
      E'*And the eternal Elohim (God) will tread upon the earth, (even) on Mount Sinai, And appear in the strength of His might from the heaven of heavens* (1 Enoch 1:4). This is Micah''s *tread upon the high places of the earth* (1:3) word for deed — *the eternal Elohim (God) will tread upon the earth*. The descending One who treads is the same in the prophet and the witness; he appears in the strength of his might.'),
    ('canon','micah',1,4,'enoch','1-enoch',1,6,'extras',
      E'*And the high mountains shall be shaken, And the high hills shall be made low, And shall melt like wax before the flame* (1 Enoch 1:6). A near-verbatim witness to Micah''s *the mountains shall be molten under him... as wax before the fire* (1:4): *the high mountains shall be shaken... And shall melt like wax before the flame*. The high places brought low, the mountains melting as wax — one theophany, the prophet and the witness saying the same thing.'),

    -- THREAD 2 (★): The transgression of Jacob — both houses indicted (Samaria + Jerusalem)
    ('canon','micah',1,5,'canon','hosea',8,5,'free',
      E'*Thy calf, O Samaria, hath cast thee off; mine anger is kindled against them: how long will it be ere they attain to innocency?* (Hosea 8:5). Micah asks *What is the transgression of Jacob? is it not Samaria?* (1:5) — and Hosea names the transgression: *Thy calf, O Samaria*. The harlot-hire idols Micah says shall be beaten to pieces (1:7) are the calf of the northern house that cast Yashar''el (Israel) off.'),
    ('canon','micah',1,7,'canon','hosea',8,6,'free',
      E'*For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (Hosea 8:6). Micah''s *all the graven images thereof shall be beaten to pieces... she gathered it of the hire of an harlot* (1:7) is Hosea''s sentence on the same idol — *the calf of Samaria shall be broken in pieces*. The made-thing that is *not Elohim (God)* is ground to powder.'),
    ('canon','micah',1,5,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). Micah indicts BOTH houses — *the transgression of Jacob... is it not Samaria? and what are the high places of Yahudah (Judah)? are they not Jerusalem?* (1:5) — the very two houses Yahuah makes ONE again: *the stick of Joseph... and the stick of Yahudah (Judah)... make them one stick*. The controversy and the ingathering name the same two-house people; never a cast-off.'),
    ('canon','micah',1,5,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Samaria and Jerusalem — the two capitals Micah names in *the transgression of Jacob is all this, and for the sins of the house of Yashar''el (Israel)* (1:5) — are the two kingdoms healed into one: *they shall be no more two nations*. The lawsuit against both houses ends in both houses made one nation under one king.'),

    -- THREAD 3 (★): I will wail and howl — the incurable wound to the gate of Jerusalem
    ('canon','micah',1,8,'canon','jeremiah',9,1,'free',
      E'*Oh that my head were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the daughter of my people!* (Jeremiah 9:1). Micah''s *I will wail and howl, I will go stripped and naked* (1:8) is the weeping prophet''s grief — *that I might weep day and night for the slain of the daughter of my people*. The prophet does not gloat over the judgment; he mourns his own people to the dust.'),
    ('canon','micah',1,9,'canon','jeremiah',30,12,'free',
      E'*For thus saith Yahuah (LORD), Thy bruise is incurable, and thy wound is grievous* (Jeremiah 30:12). Micah''s *her wound is incurable; for it is come unto Yahudah (Judah)* (1:9) is Jeremiah''s very word — *Thy bruise is incurable, and thy wound is grievous*. The blow upon the people is past human healing, yet the same Yahuah who wounds is the One who binds up (Jeremiah 30:17).'),
    ('canon','micah',1,9,'canon','isaiah',10,32,'free',
      E'*As yet shall he remain at Nob that day: he shall shake his hand against the mount of the daughter of Zion, the hill of Jerusalem* (Isaiah 10:32). Micah''s *he is come unto the gate of my people, even to Jerusalem* (1:9) is the Assyrian at the gate — *he shall shake his hand against the mount of the daughter of Zion, the hill of Jerusalem*. The wound that began in Samaria comes all the way up to the gate of Jerusalem.'),

    -- THREAD 4 (★): Tell it not in Gath — the lament over the doomed towns into captivity
    ('canon','micah',1,10,'canon','2-samuel',1,20,'free',
      E'*Tell it not in Gath, publish it not in the streets of Askelon; lest the daughters of the Philistines rejoice, lest the daughters of the uncircumcised triumph* (2 Samuel 1:20). Micah takes up David''s dirge over Saul and Jonathan — *Declare ye it not at Gath, weep ye not at all* (1:10) is David''s *Tell it not in Gath, publish it not in the streets of Askelon*. The prophet mourns the doomed towns of Yahudah with the king''s own funeral-song, the lament that ends in captivity (1:16).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-1-yahuah-comes-down-and-treads-the-high-places',
       E'Yahuah comes down and treads the high places — the descending judgment-theophany',
       E'Micah opens not with a date but with a descent: *Hear, all ye people; hearken, O earth, and all that therein is: and let Adonai Yahuah (the Lord GOD) be witness against you, Yahuah (Lord) from his holy temple. For, behold, Yahuah (LORD) cometh forth out of his place, and will come down, and tread upon the high places of the earth. And the mountains shall be molten under him, and the valleys shall be cleft, as wax before the fire, and as the waters that are poured down a steep place* (Micah 1:2-4). This is the Formed Son — the One who appears, who comes DOWN — and the whole library sings the same theophany. Amos confesses him by name as the One who treads: *he that formeth the mountains, and createth the wind... and treadeth upon the high places of the earth, Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13). Isaiah pleads for the descent: *Oh that thou wouldest rend the heavens, that thou wouldest come down, that the mountains might flow down at thy presence... thou camest down, the mountains flowed down at thy presence* (Isaiah 64:1,3). David saw it come to pass: *He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9), and *the foundations also of the hills moved and were shaken* (18:7). Nahum says it plainly: *The mountains quake at him, and the hills melt, and the earth is burned at his presence* (Nahum 1:5); *Who can stand before his indignation?* (1:6). And the restored witness is a near-verbatim parallel: *The Holy Great One will come forth from His dwelling, And the eternal Elohim (God) will tread upon the earth... And the high mountains shall be shaken... And shall melt like wax before the flame* (1 Enoch 1:3,4,6) — come forth, tread, melt like wax. The forward-weave is the great day of wrath: *every mountain and island were moved out of their places... For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:14,17), and the whole creation dissolves — *the elements shall melt with fervent heat* (2 Peter 3:10,12). One descending Judge, from Micah''s high places to the day of Yahuah; the Formed Son who comes forth out of his place to tread the earth.',
       sv.verse_id, ev.verse_id, 'extras', 45400
  FROM _s333_mic01_lookup sv, _s333_mic01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-1-the-transgression-of-jacob-both-houses-indicted',
       E'The transgression of Jacob — both houses indicted, Samaria and Jerusalem',
       E'The controversy strikes BOTH capitals at once: *For the transgression of Jacob is all this, and for the sins of the house of Yashar''el (Israel). What is the transgression of Jacob? is it not Samaria? and what are the high places of Yahudah (Judah)? are they not Jerusalem?* (Micah 1:5). Samaria is the head of the northern house, Jerusalem the high places of the south — the two houses both under lawsuit. The northern sin is the calf and the harlot-hire idols Micah says shall be beaten to pieces: *And all the graven images thereof shall be beaten to pieces, and all the hires thereof shall be burned with the fire... for she gathered it of the hire of an harlot* (1:7). Hosea names the same idol and the same sentence: *Thy calf, O Samaria, hath cast thee off* (Hosea 8:5); *the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (8:6). But this is covenant-lawsuit, NEVER a cast-off people — the very two houses Micah indicts are the two Yahuah makes ONE again: *I will take the stick of Joseph, which is in the hand of Ephraim... and the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (37:22). The indictment of Samaria and Jerusalem and the ingathering of the two sticks name the same two-house people; the controversy is conduct within the covenant, the end of which is one nation under one king.',
       sv.verse_id, ev.verse_id, 'free', 45403
  FROM _s333_mic01_lookup sv, _s333_mic01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-1-i-will-wail-and-howl-the-incurable-wound',
       E'I will wail and howl — the incurable wound come up to the gate of Jerusalem',
       E'The prophet does not gloat over the judgment; he grieves: *Therefore I will wail and howl, I will go stripped and naked: I will make a wailing like the dragons, and mourning as the owls. For her wound is incurable; for it is come unto Yahudah (Judah); he is come unto the gate of my people, even to Jerusalem* (Micah 1:8-9). This is the weeping prophet''s posture — *Oh that my head were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the daughter of my people!* (Jeremiah 9:1). The wound is the incurable bruise Jeremiah names: *Thy bruise is incurable, and thy wound is grievous* (Jeremiah 30:12) — past all human healing, yet the same Yahuah who wounds is the One who binds up. And the blow that begins in Samaria comes all the way up to the gate of Jerusalem — the Assyrian at the wall: *he shall shake his hand against the mount of the daughter of Zion, the hill of Jerusalem* (Isaiah 10:32). Victims, not enemies: the prophet wails stripped and naked over his own people, mourning like the dragons and the owls as the incurable wound reaches the gate.',
       sv.verse_id, ev.verse_id, 'free', 45406
  FROM _s333_mic01_lookup sv, _s333_mic01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-1-tell-it-not-in-gath-the-lament-into-captivity',
       E'Declare ye it not at Gath — the dirge over the doomed towns into captivity',
       E'The chapter closes in a dense wordplay-lament over the doomed towns of Yahudah, and the prophet takes up the king''s own funeral-song to do it: *Declare ye it not at Gath, weep ye not at all: in the house of Aphrah roll thyself in the dust* (Micah 1:10) — David''s dirge over Saul and Jonathan: *Tell it not in Gath, publish it not in the streets of Askelon; lest the daughters of the Philistines rejoice, lest the daughters of the uncircumcised triumph* (2 Samuel 1:20). Town by town the lament rolls — Saphir stripped, Zaanan that came not forth, *O thou inhabitant of Lachish, bind the chariot to the swift beast: she is the beginning of the sin to the daughter of Zion* (1:13), the houses of Achzib a lie, an heir brought to Mareshah — until it ends in exile: *Make thee bald, and poll thee for thy delicate children; enlarge thy baldness as the eagle; for they are gone into captivity from thee* (1:16). One mourning-song over a land being carried away, sung in David''s own words of grief.',
       sv.verse_id, ev.verse_id, 'free', 45409
  FROM _s333_mic01_lookup sv, _s333_mic01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he that formeth the mountains... and treadeth upon the high places of the earth, Yahuah (LORD), The Elohim (God) of hosts, is his name* (Amos 4:13) — the One who *treadeth upon the high places* (Micah 1:3) named: Yahuah, the Formed Son who treads.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *that thou wouldest come down, that the mountains might flow down at thy presence* (Isaiah 64:1) — Isaiah pleads for the descent Micah announces; the coming-down melts the heights.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thou camest down, the mountains flowed down at thy presence* (Isaiah 64:3) — Micah''s *molten under him... as wax before the fire* (1:4) is Isaiah''s memory of the theophany.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He bowed the heavens also, and came down: and darkness was under his feet* (Psalm 18:9) — David sings the very descent Micah foretells (1:3).'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the foundations also of the hills moved and were shaken, because he was wroth* (Psalm 18:7) — the descent that melts mountains (Micah 1:4) shakes the foundations of the hills.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *The mountains quake at him, and the hills melt, and the earth is burned at his presence* (Nahum 1:5) — the Presence that comes down melts the everlasting hills, as Micah''s *as wax before the fire* (1:4).'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Who can stand before his indignation?... his fury is poured out like fire* (Nahum 1:6) — the melting mountains of Micah 1:4 raise the question none can answer.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *every mountain and island were moved out of their places* (Revelation 6:14) — the high places Yahuah treads down (Micah 1:3-4) removed in the great day of wrath.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17) — the coming-forth of Yahuah from his place (Micah 1:3) IS the day of wrath.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10) — Micah''s mountains *molten... as wax before the fire* (1:4) consummated in the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*the heavens being on fire shall be dissolved, and the elements shall melt with fervent heat* (2 Peter 3:12) — the wax-before-the-fire (Micah 1:4) is the elements melting at the day of Elohim.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'★★★ *The Holy Great One will come forth from His dwelling* (1 Enoch 1:3) — Micah''s *Yahuah cometh forth out of his place* (1:3) in the restored witness; the Judge comes forth to come down.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'★★★ *the eternal Elohim (God) will tread upon the earth* (1 Enoch 1:4) — Micah''s *tread upon the high places of the earth* (1:3) word for deed in the witness.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 14, E'★★★ *the high mountains shall be shaken... And shall melt like wax before the flame* (1 Enoch 1:6) — a near-verbatim witness to Micah''s *molten... as wax before the fire* (1:4); the high places brought low.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-yahuah-comes-down-and-treads-the-high-places'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thy calf, O Samaria, hath cast thee off; mine anger is kindled against them* (Hosea 8:5) — the transgression of Jacob that *is it not Samaria?* (Micah 1:5) is the calf of the northern house.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-the-transgression-of-jacob-both-houses-indicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (Hosea 8:6) — Micah''s *graven images... beaten to pieces... the hire of an harlot* (1:7) is the same idol ground to powder.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-the-transgression-of-jacob-both-houses-indicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the two houses Micah indicts (1:5) are the two Yahuah makes one; the TWO-HOUSE guard, never a cast-off.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-the-transgression-of-jacob-both-houses-indicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — Samaria and Jerusalem (Micah 1:5) healed into one nation under one king.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-the-transgression-of-jacob-both-houses-indicted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Oh that my head were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the daughter of my people!* (Jeremiah 9:1) — Micah''s *I will wail and howl* (1:8) is the weeping prophet''s grief over his own people.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-i-will-wail-and-howl-the-incurable-wound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thy bruise is incurable, and thy wound is grievous* (Jeremiah 30:12) — Micah''s *her wound is incurable* (1:9) is Jeremiah''s very word; past human healing, yet the same Yahuah binds up.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-i-will-wail-and-howl-the-incurable-wound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he shall shake his hand against the mount of the daughter of Zion, the hill of Jerusalem* (Isaiah 10:32) — Micah''s *he is come unto the gate of my people, even to Jerusalem* (1:9) is the Assyrian at the gate.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-i-will-wail-and-howl-the-incurable-wound'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Tell it not in Gath, publish it not in the streets of Askelon; lest the daughters of the Philistines rejoice* (2 Samuel 1:20) — Micah''s *Declare ye it not at Gath, weep ye not at all* (1:10) takes up David''s dirge for the doomed towns into captivity.'
  FROM cross_reference_threads t
  JOIN _s333_mic01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s333_mic01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=1 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-1-tell-it-not-in-gath-the-lament-into-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_2.sql (Micah 2) -----
-- Chapter: Micah 2 — WOE to those who devise iniquity and covet fields, taking the poor's
-- inheritance by violence (2:1-2); the judgment devised against them in return (2:3-5); the people
-- who silence the true prophet, preferring smooth words — *Prophesy ye not, say they to them that
-- prophesy* (2:6); the women cast out, the false prophet of wine and strong drink (2:8-11); and THE
-- KEYSTONE: *I will surely assemble, O Jacob, all of thee; I will surely gather the remnant of
-- Yashar'el (Israel)... as the flock in the midst of their fold* (2:12), *The breaker is come up
-- before them... and their king shall pass before them, and Yahuah (LORD) on the head of them* (2:13)
-- — the regathering of the two-house flock and the Breaker-Shepherd-King who opens the way and leads
-- them out through the gate, the Formed Son who has a Father, leading the remnant home (NOT
-- replacement — Romans 11).
-- Tag: mic02   Temp view: _s333_mic02_lookup
-- Sort band: base 45414, step 3 -> threads at 45414, 45417, 45420, 45423 (4 threads)
-- Source of EVERY row: 'canon','micah',2,v
--
-- Micah 2 coverage:
--   ★★ v.1-2 (Woe to them that devise iniquity... they covet fields, and take them by violence; and
--          houses, and take them away: so they oppress a man and his house, even a man and his heritage)
--        NT:     ★ James 5:1-6 (ye rich men... the hire of the labourers who have reaped down your
--                fields, which is of you kept back by fraud, crieth) — THREAD 1
--        Extras: none warranted (the covet/inheritance weave is fully carried by Torah + 1 Kings + Isaiah)
--        Tanakh: ★ Exodus 20:17 (Thou shalt not covet... any thing that is thy neighbour's) — THREAD 1;
--                ★ Leviticus 25:23 (The land shall not be sold for ever: for the land is mine) — THREAD 1;
--                ★ Deuteronomy 27:17 (Cursed be he that removeth his neighbour's landmark) — THREAD 1;
--                ★ 1 Kings 21:3 (Naboth: Yahuah forbid... that I should give the inheritance of my fathers) — THREAD 1;
--                ★ Isaiah 5:8 (Woe unto them that join house to house, that lay field to field) — THREAD 1
--   v.3-5 (against this family do I devise an evil... he hath changed the portion of my people...
--          turning away he hath divided our fields)
--        NT/Extras/Tanakh: none warranted as separate adds — the measure-for-measure (their devised
--          evil answered by Yahuah's devised evil, the divided fields requited) is woven into THREAD 1's
--          prose; the lost lot in the congregation (2:5) follows from the seized inheritance.
--   ★ v.6-7 (Prophesy ye not, say they to them that prophesy... O thou that art named the house of
--          Jacob, is the spirit of Yahuah straitened?... do not my words do good to him that walketh uprightly?)
--        NT:     ★ 2 Timothy 4:3 (they will not endure sound doctrine; but after their own lusts shall
--                they heap to themselves teachers, having itching ears) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Isaiah 30:10 (Prophesy not unto us right things, speak unto us smooth things) — THREAD 2;
--                ★ Amos 2:12 (commanded the prophets, saying, Prophesy not) — THREAD 2;
--                ★ Amos 7:13 (prophesy not again any more at Beth-el: for it is the king's chapel) — THREAD 2
--   v.8-11 (the women cast out of their pleasant houses... the prophet of wine and strong drink)
--        NT/Extras/Tanakh: none warranted distinct — the false-prophet-of-wine inverts the smooth-prophet
--          of THREAD 2 (the people get the prophet they want); the oppression of the defenceless
--          continues THREAD 1's lawsuit. Held in prose, recorded here, not silently skipped.
--   ★★★ v.12 (I will surely assemble, O Jacob, all of thee; I will surely gather the remnant of
--          Yashar'el (Israel)... as the flock in the midst of their fold)
--        NT:     held with v.13 in THREAD 4 (the Shepherd who goes before)
--        Extras: ★★ 2 Esdras 13:40 (Those are the ten tribes, which were carried away prisoners...
--                whom Salmanasar... led away captive) — THREAD 3 (the scattered ten tribes gathered)
--        Tanakh: ★★ Ezekiel 34:12-13 (I will seek out my sheep... gather them from the countries...
--                bring them to their own land) — THREAD 3; ★★ Ezekiel 37:21-22 (gather them... make
--                them one nation... no more two nations) — THREAD 3
--   ★★★ v.13 (The breaker is come up before them... passed through the gate... their king shall pass
--          before them, and Yahuah (LORD) on the head of them)
--        NT:     ★★★ John 10:4 (he goeth before them, and the sheep follow him), ★★★ John 10:11 (I am
--                the good shepherd: the good shepherd giveth his life for the sheep), ★ Hebrews 6:20
--                (Whither the forerunner is for us entered, even Yahusha (Jesus)) — THREAD 4
--        Extras: none warranted (the keystone forward-weave is the NT Shepherd-King itself)
--        Tanakh: ★ Isaiah 52:12 (Yahuah (LORD) will go before you; and the Elohim of Yashar'el will be
--                your rereward) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. micah-2-they-covet-fields-and-take-them-by-violence — Tanakh (Exodus 20, Leviticus 25,
--      Deuteronomy 27, 1 Kings 21, Isaiah 5) + NT (James 5) [free]
--      (★★ the broken tenth word + the stolen inalienable inheritance the Torah protected)
--   2. micah-2-prophesy-ye-not-the-smooth-prophets — Tanakh (Isaiah 30, Amos 2, Amos 7) + NT (2 Timothy 4) [free]
--      (★ silencing the true prophet, preferring the comfortable word; itching ears)
--   3. micah-2-i-will-surely-gather-the-remnant-of-yasharel — Tanakh (Ezekiel 34, Ezekiel 37) + Extras (2 Esdras 13) [extras]
--      (★★★ the regathered two-house flock; the scattered ten tribes brought home, made one nation)
--   4. micah-2-the-breaker-is-come-up-before-them-the-king — NT (John 10, Hebrews 6) + Tanakh (Isaiah 52) [free]
--      (★★★ the Breaker / Shepherd-King who opens the way, goes before the flock through the gate —
--      the Formed Son who has a Father, leading the remnant out of exile)
--
-- Framing notes:
--   ★★ THE COVETED FIELDS (THREAD 1): *And they covet fields, and take them by violence; and houses,
--      and take them away: so they oppress a man and his house, even a man and his heritage* (2:2). This
--      is the tenth word broken — *Thou shalt not covet... any thing that is thy neighbour's* (Exodus
--      20:17) — and the inalienable inheritance violated, the land the Torah declared could never be
--      sold away: *The land shall not be sold for ever: for the land is mine; for ye are strangers and
--      sojourners with me* (Leviticus 25:23); the landmark the curse protected: *Cursed be he that
--      removeth his neighbour's landmark* (Deuteronomy 27:17). Naboth dies refusing exactly this — *Yahuah
--      (LORD) forbid it me, that I should give the inheritance of my fathers unto thee* (1 Kings 21:3) —
--      and Isaiah cries the same woe: *Woe unto them that join house to house, that lay field to field*
--      (Isaiah 5:8). James carries it forward to the last days: *the hire of the labourers who have reaped
--      down your fields, which is of you kept back by fraud, crieth* (James 5:4). The Torah's defence of
--      the poor man's heritage is one across the whole library.
--   ★ THE SMOOTH PROPHETS (THREAD 2): *Prophesy ye not, say they to them that prophesy* (2:6). The
--      people silence the true word and demand the comfortable one — *speak unto us smooth things* (Isaiah
--      30:10); *ye... commanded the prophets, saying, Prophesy not* (Amos 2:12); *prophesy not again any
--      more at Beth-el* (Amos 7:13). Paul names the same itch at the end: *they will not endure sound
--      doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears*
--      (2 Timothy 4:3). Yet Micah answers that the word does good to the upright — *do not my words do good
--      to him that walketh uprightly?* (2:7).
--   ★★★ THE REMNANT GATHERED (THREAD 3): *I will surely assemble, O Jacob, all of thee; I will surely
--      gather the remnant of Yashar'el (Israel)... as the flock in the midst of their fold* (2:12). This is
--      the two-house ingathering — the scattered flock sought out and brought home: *I will seek out my
--      sheep... and gather them from the countries, and will bring them to their own land* (Ezekiel
--      34:12-13); *I will take the children of Yashar'el (Israel) from among the heathen... and bring them
--      into their own land: And I will make them one nation... and they shall be no more two nations*
--      (Ezekiel 37:21-22). The restored witness names the scattered ten tribes by name: *Those are the ten
--      tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom
--      Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the lost north, gathered. Not
--      replacement; the remnant of Jacob/Israel made one (Romans 11).
--   ★★★ THE BREAKER, THE SHEPHERD-KING (THREAD 4): *The breaker is come up before them: they have broken
--      up, and have passed through the gate, and are gone out by it: and their king shall pass before them,
--      and Yahuah (LORD) on the head of them* (2:13). The Breaker (ha-poretz) opens the way and the King
--      leads the regathered flock out through the gate — the Messianic Shepherd-King. Yahusha is that
--      Shepherd who goes before: *he goeth before them, and the sheep follow him: for they know his voice*
--      (John 10:4); *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11).
--      He is the forerunner who has gone ahead: *Whither the forerunner is for us entered, even Yahusha
--      (Jesus)* (Hebrews 6:20). And it is the very pattern of the exodus the prophets sing: *Yahuah (LORD)
--      will go before you; and the Elohim (God) of Yashar'el (Israel) will be your rereward* (Isaiah 52:12).
--      The Breaker-King at the head of the flock is the Formed Son — Yahuah who leads, and who HAS a Father
--      (the One whose Father loves him, John 10:17; NOT a co-equal trinitarian person, NOT a counterfeit).
--   VERSES WITH NO SEPARATE ADD: v.3-5 (the devised evil requited, the divided fields — woven into THREAD
--      1), v.8-11 (the women cast out, the prophet of wine — the inversion of THREAD 2's smooth prophet,
--      continuing THREAD 1's oppression). All recorded, none silently skipped.

CREATE TEMP VIEW _s333_mic02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): they covet fields and take them by violence — broken tenth word, stolen inheritance
    ('canon','micah',2,2,'canon','exodus',20,17,'free',
      E'*Thou shalt not covet thy neighbour''s house, thou shalt not covet thy neighbour''s wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour''s* (Exodus 20:17). The men who *covet fields, and take them by violence; and houses, and take them away* (Micah 2:2) break the tenth word at its root — the coveting that becomes seizure. Micah''s woe is the Decalogue''s own indictment: the desire forbidden, then enacted by force upon a man and his heritage.'),
    ('canon','micah',2,2,'canon','leviticus',25,23,'free',
      E'*The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me* (Leviticus 25:23). The fields and houses the oppressors *take away* (Micah 2:2) are not theirs to take — the land is Yahuah''s, granted as inalienable inheritance, returned to every family at the jubile (25:10). To seize *a man and his house, even a man and his heritage* is to overthrow the very statute that made the poor man''s portion untouchable.'),
    ('canon','micah',2,2,'canon','deuteronomy',27,17,'free',
      E'*Cursed be he that removeth his neighbour''s landmark. And all the people shall answer and say, Amen* (Deuteronomy 27:17). The covenant curse falls on exactly what Micah''s rich men do — *they covet fields, and take them by violence* (Micah 2:2), moving the boundary, swallowing the neighbour''s portion. The Amen of all Yashar''el (Israel) at mount Ebal stands against them.'),
    ('canon','micah',2,2,'canon','1-kings',21,3,'free',
      E'*And Naboth said to Ahab, Yahuah (LORD) forbid it me, that I should give the inheritance of my fathers unto thee* (1 Kings 21:3). Naboth dies refusing the very surrender Micah condemns — the king covets the vineyard, and the inheritance is seized by violence and false witness. *They covet fields, and take them by violence... so they oppress a man and his house, even a man and his heritage* (Micah 2:2) is Ahab and Naboth written as a nation''s sin.'),
    ('canon','micah',2,2,'canon','isaiah',5,8,'free',
      E'*Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8). Isaiah cries the same woe Micah cries — the land-greed that piles house on house and field on field. *They covet fields, and take them by violence; and houses, and take them away* (Micah 2:2) is the prophet''s twin lawsuit against the engrossers who leave the poor no place.'),
    ('canon','micah',2,2,'canon','james',5,4,'free',
      E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). James carries Micah''s woe into the last days — the rich who defraud the poor of their fields and wages. The oppression of *a man and his house, even a man and his heritage* (Micah 2:2) still cries up to Yahuah of hosts, and the judgment still comes (James 5:1).'),

    -- THREAD 2 (★): Prophesy ye not — the smooth prophets, itching ears
    ('canon','micah',2,6,'canon','isaiah',30,10,'free',
      E'*Which say to the seers, See not; and to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). Micah meets the same demand — *Prophesy ye not, say they to them that prophesy* (Micah 2:6) — a people silencing the true word because it will not flatter. Isaiah names the appetite exactly: not right things, but smooth things; not the word that convicts, but the word that soothes.'),
    ('canon','micah',2,6,'canon','amos',2,12,'free',
      E'*But ye gave the Nazarites wine to drink; and commanded the prophets, saying, Prophesy not* (Amos 2:12). Amos records the identical command Micah hears — *they shall not prophesy to them* (Micah 2:6). To muzzle the prophet is itself the covenant-sin: corrupting the Nazarite, gagging the seer, refusing the word Yahuah sent.'),
    ('canon','micah',2,6,'canon','amos',7,13,'free',
      E'*But prophesy not again any more at Beth-el: for it is the king''s chapel, and it is the king''s court* (Amos 7:13). Amaziah the priest silences Amos with the same words Micah quotes — *Prophesy ye not* (Micah 2:6) — preferring the king''s comfortable court to the prophet''s hard word. The true prophet is driven out wherever men love the smooth word.'),
    ('canon','micah',2,6,'canon','2-timothy',4,3,'free',
      E'*For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). Paul names the same heart Micah confronts — *Prophesy ye not, say they to them that prophesy* (Micah 2:6). The itching ear cannot bear the sound word and hires the teacher who scratches it; the smooth-prophet appetite runs the whole length of the library.'),

    -- THREAD 3 (★★★): I will surely gather the remnant of Yashar'el — the two-house flock regathered
    ('canon','micah',2,12,'canon','ezekiel',34,12,'free',
      E'*As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day* (Ezekiel 34:12). Micah''s promise — *I will surely gather the remnant of Yashar''el (Israel)... as the flock in the midst of their fold* (Micah 2:12) — is Ezekiel''s shepherd-search: the scattered sheep sought out by Yahuah himself, delivered from every place of exile.'),
    ('canon','micah',2,12,'canon','ezekiel',34,13,'free',
      E'*And I will bring them out from the people, and gather them from the countries, and will bring them to their own land, and feed them upon the mountains of Yashar''el (Israel) by the rivers, and in all the inhabited places of the country* (Ezekiel 34:13). The flock *put together... in the midst of their fold* (Micah 2:12) is the flock Ezekiel brings home — gathered from the countries, fed on the mountains of Yashar''el. One regathering, the remnant of Jacob returned to the land.'),
    ('canon','micah',2,12,'canon','ezekiel',37,21,'free',
      E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Micah''s *I will surely assemble, O Jacob, all of thee; I will surely gather the remnant of Yashar''el (Israel)* (Micah 2:12) is the two-stick gathering — the scattered children taken from among the heathen and brought home on every side.'),
    ('canon','micah',2,12,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The remnant Micah gathers *all of thee* (Micah 2:12) becomes one nation under one king — the two houses, Yahudah (Judah) and Yashar''el (Israel)/Ephraim, made one, divided no more. The ingathering is the reunion of the two sticks.'),
    ('canon','micah',2,12,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). The restored witness names the lost flock by name — the ten tribes of the northern house, scattered into the nations. Micah''s *I will surely gather the remnant of Yashar''el (Israel)* (Micah 2:12) is the promise that this very scattered north — *the multitude with peace* (13:47) — comes home in the latter time.'),

    -- THREAD 4 (★★★): The breaker is come up before them — the Shepherd-King who leads the flock out
    ('canon','micah',2,13,'canon','john',10,4,'free',
      E'*And when he putteth forth his own sheep, he goeth before them, and the sheep follow him: for they know his voice* (John 10:4). Micah''s King *shall pass before them* (Micah 2:13) — the Breaker who opens the way and leads the flock out through the gate — is Yahusha (Jesus) the Shepherd who *goeth before them*. The regathered flock follows the One who breaks open the path before them.'),
    ('canon','micah',2,13,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). The *king* who passes before the flock with *Yahuah (LORD) on the head of them* (Micah 2:13) is the good Shepherd — the Breaker-King who leads the sheep through the gate and lays down his life for them. He is the Formed Son who has a Father: *therefore doth my Father love me, because I lay down my life* (John 10:17).'),
    ('canon','micah',2,13,'canon','hebrews',6,20,'free',
      E'*Whither the forerunner is for us entered, even Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). *The breaker is come up before them... and are gone out by it* (Micah 2:13) — the One who breaks open the way and goes ahead is the forerunner who has already entered within the veil for us. The Breaker who leads the flock through the gate is the High Priest gone before.'),
    ('canon','micah',2,13,'canon','isaiah',52,12,'free',
      E'*For ye shall not go out with haste, nor go by flight: for Yahuah (LORD) will go before you; and the Elohim (God) of Yashar''el (Israel) will be your rereward* (Isaiah 52:12). Micah''s Breaker-King *shall pass before them, and Yahuah (LORD) on the head of them* (Micah 2:13) is the second-exodus pattern Isaiah sings: Yahuah going before the redeemed and guarding their rear. The flock does not flee alone — the King breaks the way at their head.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-2-they-covet-fields-and-take-them-by-violence',
       E'They covet fields and take them by violence — the broken tenth word, the stolen inheritance',
       E'The woe opens on premeditated greed: *Woe to them that devise iniquity, and work evil upon their beds! when the morning is light, they practise it, because it is in the power of their hand. And they covet fields, and take them by violence; and houses, and take them away: so they oppress a man and his house, even a man and his heritage* (Micah 2:1-2). This is the tenth word broken at its root — *Thou shalt not covet thy neighbour''s house... nor any thing that is thy neighbour''s* (Exodus 20:17) — the desire that hardens overnight into seizure. And it overthrows the inalienable inheritance the Torah hedged about: *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me* (Leviticus 25:23), the portion restored to every family at the jubile. The covenant curse names the very deed: *Cursed be he that removeth his neighbour''s landmark* (Deuteronomy 27:17). Naboth dies refusing exactly this surrender — *Yahuah (LORD) forbid it me, that I should give the inheritance of my fathers unto thee* (1 Kings 21:3) — and Isaiah cries the twin woe: *Woe unto them that join house to house, that lay field to field, till there be no place* (Isaiah 5:8). James carries it to the last days, the defrauded fields still crying: *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The Torah''s defence of the poor man''s heritage is one across the whole library — and so is the judgment on those who tear it away.',
       sv.verse_id, ev.verse_id, 'free', 45414
  FROM _s333_mic02_lookup sv, _s333_mic02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-2-prophesy-ye-not-the-smooth-prophets',
       E'Prophesy ye not — the people who silence the true prophet and demand the smooth word',
       E'A people that will not bear the true word tries to gag it: *Prophesy ye not, say they to them that prophesy: they shall not prophesy to them, that they shall not take shame* (Micah 2:6). Yet the prophet answers that the fault is theirs, not the word''s: *O thou that art named the house of Jacob, is the spirit of Yahuah (LORD) straitened? are these his doings? do not my words do good to him that walketh uprightly?* (2:7) — the word does good to the upright; it only stings the one who will not turn. This silencing is a covenant-long sin. Isaiah names the appetite exactly: *Which say to the seers, See not; and to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). Amos records the same command — *commanded the prophets, saying, Prophesy not* (Amos 2:12) — and Amaziah the priest drives him from the king''s court: *prophesy not again any more at Beth-el: for it is the king''s chapel* (Amos 7:13). And Paul names the very heart at the end of the age: *they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). The itching ear hires the prophet of wine and strong drink (Micah 2:11) and silences the prophet of Yahuah; the appetite for the smooth word runs the whole length of Scripture.',
       sv.verse_id, ev.verse_id, 'free', 45417
  FROM _s333_mic02_lookup sv, _s333_mic02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-2-i-will-surely-gather-the-remnant-of-yasharel',
       E'I will surely gather the remnant of Yashar''el — the scattered two-house flock brought home',
       E'After the lawsuit, the turn to mercy: *I will surely assemble, O Jacob, all of thee; I will surely gather the remnant of Yashar''el (Israel); I will put them together as the sheep of Bozrah, as the flock in the midst of their fold: they shall make great noise by reason of the multitude of men* (Micah 2:12). This is the two-house ingathering — the scattered flock sought out by Yahuah himself: *As a shepherd seeketh out his flock... so will I seek out my sheep, and will deliver them out of all places where they have been scattered* (Ezekiel 34:12), *and gather them from the countries, and will bring them to their own land, and feed them upon the mountains of Yashar''el (Israel)* (Ezekiel 34:13). It is the two sticks made one: *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land: And I will make them one nation... and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:21-22). The restored witness even names the lost northern flock by name: *Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — carried over the waters into another land, to come home *in the latter time* (13:46). Micah''s *all of thee* is the whole flock — Yahudah (Judah) in the south and the scattered house of Yashar''el (Israel)/Ephraim in the north — gathered as one. Never replacement; the remnant of Jacob restored (Romans 11).',
       sv.verse_id, ev.verse_id, 'extras', 45420
  FROM _s333_mic02_lookup sv, _s333_mic02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-2-the-breaker-is-come-up-before-them-the-king',
       E'The breaker is come up before them — the Shepherd-King who opens the way through the gate',
       E'The keystone: *The breaker is come up before them: they have broken up, and have passed through the gate, and are gone out by it: and their king shall pass before them, and Yahuah (LORD) on the head of them* (Micah 2:13). The Breaker (ha-poretz) goes up first, opens the way, and the King leads the regathered flock out through the gate — the Messianic Shepherd-King at the head of his people. Yahusha (Jesus) is that Shepherd who goes before: *when he putteth forth his own sheep, he goeth before them, and the sheep follow him: for they know his voice* (John 10:4); *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). He is the forerunner already gone ahead within the veil: *Whither the forerunner is for us entered, even Yahusha (Jesus), made an high priest for ever after the order of Melek Tsadiq (Melchizedek)* (Hebrews 6:20). And it is the very second-exodus pattern the prophets sing: *Yahuah (LORD) will go before you; and the Elohim (God) of Yashar''el (Israel) will be your rereward* (Isaiah 52:12). The Breaker-King who passes before the flock with *Yahuah on the head of them* is the Formed Son — Yahuah who leads, and who HAS a Father, the One whose Father loves him for laying down his life (John 10:17). Not a co-equal trinitarian person, not a standing counterfeit: the visible King at the head of the redeemed, drawn from the Formless Father, breaking open the way home.',
       sv.verse_id, ev.verse_id, 'free', 45423
  FROM _s333_mic02_lookup sv, _s333_mic02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt not covet... any thing that is thy neighbour''s* (Exodus 20:17) — the tenth word broken at its root; the coveting of Micah 2:2 that hardens into seizure.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *The land shall not be sold for ever: for the land is mine* (Leviticus 25:23) — the inalienable inheritance the seizers of Micah 2:2 overthrow.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Cursed be he that removeth his neighbour''s landmark* (Deuteronomy 27:17) — the Ebal curse on exactly the field-seizure of Micah 2:2.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) forbid it me, that I should give the inheritance of my fathers unto thee* (1 Kings 21:3) — Naboth dies refusing the surrender Micah 2:2 condemns; Ahab''s sin as a nation''s.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Woe unto them that join house to house, that lay field to field* (Isaiah 5:8) — Isaiah''s twin woe on the land-greed of Micah 2:2.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth* (James 5:4) — Micah''s woe carried to the last days; the defrauded fields still cry to Yahuah of hosts.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-they-covet-fields-and-take-them-by-violence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Prophesy not unto us right things, speak unto us smooth things* (Isaiah 30:10) — the appetite named exactly; the demand behind the *Prophesy ye not* of Micah 2:6.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-prophesy-ye-not-the-smooth-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *commanded the prophets, saying, Prophesy not* (Amos 2:12) — the identical gag-command Micah 2:6 hears; muzzling the seer is itself the covenant-sin.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-prophesy-ye-not-the-smooth-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *prophesy not again any more at Beth-el: for it is the king''s chapel* (Amos 7:13) — Amaziah drives out Amos with the same words; the true prophet expelled for the king''s comfort.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=7 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-prophesy-ye-not-the-smooth-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3) — Paul names the same heart at the end of the age; the smooth-word appetite of Micah 2:6.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-prophesy-ye-not-the-smooth-prophets'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *so will I seek out my sheep, and will deliver them out of all places where they have been scattered* (Ezekiel 34:12) — Micah''s gathered *flock in the midst of their fold* (2:12) is the shepherd-search after the scattered sheep.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-i-will-surely-gather-the-remnant-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *gather them from the countries, and will bring them to their own land, and feed them upon the mountains of Yashar''el (Israel)* (Ezekiel 34:13) — the remnant of Micah 2:12 brought home and fed on the mountains.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-i-will-surely-gather-the-remnant-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will take the children of Yashar''el (Israel) from among the heathen... and gather them on every side, and bring them into their own land* (Ezekiel 37:21) — the two-stick gathering of Micah''s *all of thee* (2:12).'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-i-will-surely-gather-the-remnant-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will make them one nation... and they shall be no more two nations* (Ezekiel 37:22) — the gathered remnant of Micah 2:12 made one: Yahudah and Yashar''el/Ephraim, divided no more.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-i-will-surely-gather-the-remnant-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the restored witness names the lost northern flock; the *remnant of Yashar''el* (Micah 2:12) come home in the latter time.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-i-will-surely-gather-the-remnant-of-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *he goeth before them, and the sheep follow him: for they know his voice* (John 10:4) — the King who *shall pass before them* (Micah 2:13) is the Shepherd who goes before the flock.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-the-breaker-is-come-up-before-them-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the Breaker-King of Micah 2:13 is the good Shepherd, the Formed Son who has a Father (John 10:17).'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-the-breaker-is-come-up-before-them-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Whither the forerunner is for us entered, even Yahusha (Jesus)* (Hebrews 6:20) — the Breaker who *is come up before them* (Micah 2:13) is the forerunner gone ahead within the veil.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-the-breaker-is-come-up-before-them-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) will go before you; and the Elohim (God) of Yashar''el (Israel) will be your rereward* (Isaiah 52:12) — the second-exodus pattern of Micah 2:13: the King breaks the way at the flock''s head.'
  FROM cross_reference_threads t
  JOIN _s333_mic02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s333_mic02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-2-the-breaker-is-come-up-before-them-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_3.sql (Micah 3) -----
-- Chapter: Micah 3 — THE CORRUPT RULERS AND PROPHETS WHO HATE GOOD; "Zion shall be plowed as a
-- field." Micah turns the covenant-lawsuit on the leadership: the heads who *hate the good, and love
-- the evil... eat the flesh of my people* (3:1-3), whose cry goes unheard *he will not hear them*
-- (3:4); the prophets-for-profit who *cry, Peace* when fed and *prepare war* when not (3:5), over whom
-- *the sun shall go down* (3:6); the true prophet who is *full of power by the spirit of Yahuah (LORD)*
-- to *declare unto Jacob his transgression* (3:8); the judges/priests/prophets who all sell judgment,
-- teaching, and divination *for reward... for hire... for money* yet *lean upon Yahuah (LORD)* in false
-- security (3:9-11); and the verdict: *Zion... shall be plowed as a field, and Jerusalem shall become
-- heaps* (3:12) — the exact word the elders QUOTE in Jeremiah 26:18 to spare Jeremiah's life, and the
-- temple-fall Yahusha pronounces in Matthew 24:2 / Luke 19:44. Covenant-lawsuit, conduct-within-the-
-- covenant against corrupt shepherds — victims, not enemies; and judgment (ch3) gives way at once to
-- restoration (ch4:1-2, the mountain of the house EXALTED).
-- Tag: mic03   Temp view: _s333_mic03_lookup
-- Sort band: base 45428, step 3 -> threads at 45428, 45431, 45434, 45437, 45440 (5 threads)
-- Source of EVERY row: 'canon','micah',3,v
-- NOTE: this parse reads "Jacob" (not "Yahaqob (Jacob)") in the source — quoted exactly as returned.
--
-- Micah 3 coverage:
--   ★★ v.1-4 (Hear, O heads of Jacob... Who hate the good, and love the evil... eat the flesh of my
--          people... Then shall they cry unto Yahuah, but he will not hear them)
--        NT:     ★ Romans 12:9 (Abhor that which is evil; cleave to that which is good) — THREAD 1
--        Extras: ★ Sirach 34:24 (When one prayeth, and another curseth, whose voice will Yahuah (God)
--                hear?) considered — placed instead in THREAD 4 (build-with-blood); none forced here
--                (the eat-the-flesh weave is canon-dense, kept 'free')
--        Tanakh: ★★ Isaiah 5:20 (Woe unto them that call evil good, and good evil), ★★ Ezekiel 34:2-3
--                (the shepherds of Yashar'el that feed themselves... eat the fat), ★ Psalm 14:4 (who eat
--                up my people as they eat bread), ★ Proverbs 1:28 (then shall they call... but I will
--                not answer) — THREAD 1
--   ★ v.5-7 (the prophets that make my people err... cry, Peace... Therefore night shall be unto you...
--          the sun shall go down over the prophets)
--        NT:     ★★ 2 Peter 2:1-3 (false prophets... through covetousness... make merchandise of you),
--                ★★ Matthew 7:15 (false prophets... ravening wolves) — THREAD 2
--        Extras: none warranted (the false-prophet weave is canon+NT dense; Sirach used elsewhere)
--        Tanakh: ★★ Jeremiah 6:14 (Peace, peace; when there is no peace), ★★ Ezekiel 13:10 (saying,
--                Peace; and there was no peace), ★ Amos 8:11 (a famine... of hearing the words of
--                Yahuah) — THREAD 2
--   ★★ v.8 (But truly I am full of power by the spirit of Yahuah (LORD)... to declare unto Jacob his
--          transgression, and to Yashar'el his sin)
--        NT:     ★★ Acts 1:8 (ye shall receive power, after that the Ruach HaKodesh is come upon you),
--                ★ 1 Corinthians 2:4 (in demonstration of the Spirit and of power) — THREAD 3
--        Extras: ★ Wisdom 1:5 (the holy spirit of discipline will flee deceit), Wisdom 1:7 (the Spirit
--                of Yahuah (God) filleth the world) — THREAD 3 (the Spirit who fills the true prophet,
--                flees the hireling)
--        Tanakh: woven in prose (Isaiah 11:2 Spirit-resting named in prose); none forced separate
--   ★ v.9-11 (ye heads... that abhor judgment... They build up Zion with blood... judge for reward...
--          teach for hire... divine for money: yet will they lean upon Yahuah)
--        NT:     ★ 1 Thessalonians 5:3 (when they shall say, Peace and safety; then sudden destruction)
--                — THREAD 4
--        Extras: ★ Sirach 34:18 (the gifts of unjust men are not accepted), ★ Sirach 34:22 (he that
--                defraudeth the labourer of his hire is a bloodshedder) — THREAD 4
--        Tanakh: ★★ Jeremiah 7:4 (The temple of Yahuah... are these — false security), ★ Malachi 2:8
--                (ye have caused many to stumble at the law... corrupted the covenant of Levi) — THREAD 4
--   ★★ v.12 (Therefore shall Zion for your sake be plowed as a field, and Jerusalem shall become heaps,
--          and the mountain of the house as the high places of the forest)
--        NT:     ★★ Matthew 24:2 (There shall not be left here one stone upon another), ★★ Luke 19:44
--                (they shall not leave in thee one stone upon another) — THREAD 5
--        Extras: none warranted (the plowed-temple weave is the direct Jeremiah quote + the NT temple-fall)
--        Tanakh: ★★★ Jeremiah 26:18 (Micah the Morasthite... Zion shall be plowed like a field — the
--                elders QUOTE this very verse to spare Jeremiah) — THREAD 5 (load-bearing)
--
-- Threads (slug — target libraries):
--   1. micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people — Tanakh (Isaiah 5, Ezekiel 34, Psalm
--      14, Proverbs 1) + NT (Romans 12) [free]
--      (★★ the leaders who devour the people they should shepherd; their cry unheard)
--   2. micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth — Tanakh (Jeremiah 6, Ezekiel 13,
--      Amos 8) + NT (2 Peter 2, Matthew 7) [free]
--      (★ the prophets-for-profit who cry peace when paid; the coming darkness over them)
--   3. micah-3-full-of-power-by-the-spirit-of-yahuah — NT (Acts 1, 1 Corinthians 2) + Extras (Wisdom 1) [extras]
--      (★★ the Spirit-filled true prophet — opposite the hirelings; the keystone of the chapter)
--   4. micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah — Tanakh (Jeremiah 7, Malachi 2) +
--      NT (1 Thessalonians 5) + Extras (Sirach 34) [extras]
--      (★ corrupt judges/priests/prophets for money; presumptuous false security)
--   5. micah-3-zion-shall-be-plowed-as-a-field — Tanakh (Jeremiah 26) + NT (Matthew 24, Luke 19) [free]
--      (★★ the temple-mount plowed; this verse QUOTED in Jeremiah 26:18; judgment then restoration ch4)
--
-- Framing notes:
--   ★★ WHO HATE THE GOOD (THREAD 1): The leaders are arraigned as cannibals of their own flock —
--      *Who hate the good, and love the evil; who pluck off their skin from off them... Who also eat
--      the flesh of my people* (3:2-3). This is Isaiah's woe exactly: *Woe unto them that call evil
--      good, and good evil* (Isaiah 5:20). It is Ezekiel's shepherds-who-feed-themselves: *Woe be to
--      the shepherds of Yashar'el (Israel) that do feed themselves!... Ye eat the fat* (Ezekiel 34:2-3).
--      It is the psalm's *who eat up my people as they eat bread* (Psalm 14:4). And when judgment
--      falls, *Then shall they cry unto Yahuah (LORD), but he will not hear them* (3:4) — the very fate
--      Wisdom pronounces on those who refused her: *Then shall they call upon me, but I will not
--      answer* (Proverbs 1:28). Romans turns the same scale forward: *Abhor that which is evil; cleave
--      to that which is good* (Romans 12:9) — the inverse of leaders who *hate the good, and love the
--      evil*. Covenant-lawsuit against corrupt shepherds, not against the flock who are their victims.
--   ★ THE PROPHETS WHO CRY PEACE (THREAD 2): *the prophets that make my people err, that bite with
--      their teeth, and cry, Peace; and he that putteth not into their mouths, they even prepare war
--      against him* (3:5) — prophecy sold by the mouthful. This is Jeremiah's indictment word for word:
--      *saying, Peace, peace; when there is no peace* (Jeremiah 6:14); and Ezekiel's: *saying, Peace;
--      and there was no peace* (Ezekiel 13:10). The sentence is silence — *the sun shall go down over
--      the prophets* (3:6), *there is no answer of Elohim (God)* (3:7) — the famine Amos foretold: *a
--      famine... of hearing the words of Yahuah (LORD)* (Amos 8:11). The apostles name the same breed
--      forward: *false prophets... through covetousness shall they with feigned words make merchandise
--      of you* (2 Peter 2:1-3), *false prophets, which come to you in sheep's clothing, but inwardly
--      they are ravening wolves* (Matthew 7:15).
--   ★★ FULL OF POWER BY THE SPIRIT (THREAD 3, KEYSTONE): set against every hireling stands the true
--      prophet — *But truly I am full of power by the spirit of Yahuah (LORD), and of judgment, and of
--      might, to declare unto Jacob his transgression, and to Yashar'el (Israel) his sin* (3:8). The
--      Spirit who fills Micah is the Spirit Yahusha promises: *ye shall receive power, after that the
--      Ruach HaKodesh (Holy Spirit) is come upon you* (Acts 1:8); the power Paul preached in: *in
--      demonstration of the Spirit and of power* (1 Corinthians 2:4). The restored witness frames it:
--      *the holy spirit of discipline will flee deceit* (Wisdom 1:5) — He will not abide the hireling —
--      yet *the Spirit of Yahuah (God) filleth the world* (Wisdom 1:7), and fills the one sent to tell
--      the truth. The contrast is the whole chapter: the bought prophets fall silent; the Spirit-filled
--      one declares the people's sin and is heard.
--   ★ BUILD ZION WITH BLOOD, LEAN ON YAHUAH (THREAD 4): *They build up Zion with blood... The heads
--      thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof
--      divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us?
--      none evil can come upon us* (3:10-11) — corruption top to bottom, crowned with presumptuous
--      false security. This is Jeremiah's temple-slogan: *Trust ye not in lying words, saying, The
--      temple of Yahuah (LORD)... are these* (Jeremiah 7:4); and Malachi's corrupted priesthood: *ye
--      have caused many to stumble at the law; ye have corrupted the covenant of Levi* (Malachi 2:8) —
--      the priests teaching for hire is a breach of Torah, NOT Torah's failure; the law stands, they
--      depart from it. The restored witness weighs the gifts: *the gifts of unjust men are not
--      accepted* (Sirach 34:18); *he that defraudeth the labourer of his hire is a bloodshedder*
--      (Sirach 34:22) — Zion built with blood. And the false peace meets sudden ruin: *when they shall
--      say, Peace and safety; then sudden destruction cometh upon them* (1 Thessalonians 5:3).
--   ★★ ZION SHALL BE PLOWED (THREAD 5): the verdict — *Therefore shall Zion for your sake be plowed as
--      a field, and Jerusalem shall become heaps, and the mountain of the house as the high places of
--      the forest* (3:12). This is the rarest of canon events: a prophet's word QUOTED in another book
--      to decide a man's life. A century later the elders cite it to spare Jeremiah: *Micah the
--      Morasthite prophesied in the days of Hezekiah... Thus saith Yahuah Tseva'ot (LORD of hosts);
--      Zion shall be plowed like a field, and Jerusalem shall become heaps, and the mountain of the
--      house as the high places of a forest* (Jeremiah 26:18) — and Hezekiah did not slay Micah. The
--      temple-fall Yahusha pronounces in the same words: *There shall not be left here one stone upon
--      another, that shall not be thrown down* (Matthew 24:2); *they shall not leave in thee one stone
--      upon another; because thou knewest not the time of thy visitation* (Luke 19:44). And note the
--      next breath (4:1-2): the mountain of the house is EXALTED — judgment, then restoration.
--   VERSES WITH NO SEPARATE ADD: none — every verse-block (3:1-4, 3:5-7, 3:8, 3:9-11, 3:12) carries a
--      thread; all three libraries weighed at each, recorded above.

CREATE TEMP VIEW _s333_mic03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Who hate the good, and eat the flesh of my people
    ('canon','micah',3,2,'canon','isaiah',5,20,'free',
      E'*Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* (Isaiah 5:20). Micah''s heads of Jacob *hate the good, and love the evil* (Micah 3:2) — the very inversion Isaiah pronounces woe upon. The leaders who should *know judgment* (3:1) have turned the moral order upside down; calling evil good is the root of devouring the flock.'),
    ('canon','micah',3,3,'canon','ezekiel',34,2,'free',
      E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). Micah''s rulers *eat the flesh of my people* (Micah 3:3); Ezekiel''s shepherds *feed themselves* and not the flock. The same covenant-lawsuit against leaders who consume the people they were charged to tend.'),
    ('canon','micah',3,3,'canon','ezekiel',34,3,'free',
      E'*Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:3). The cannibal image of Micah 3:3 — *who also eat the flesh of my people... and chop them in pieces, as for the pot* — is Ezekiel''s charge made vivid: shepherds who eat, clothe, and kill from the flock while feeding it nothing. Victims, not enemies: the flock is preyed upon, the shepherds arraigned.'),
    ('canon','micah',3,3,'canon','psalms',14,4,'free',
      E'*Have all the workers of iniquity no knowledge? who eat up my people as they eat bread, and call not upon Yahuah (LORD)* (Psalm 14:4). The psalm names the same atrocity Micah indicts — *eat the flesh of my people* (Micah 3:3) — leaders who devour the covenant people *as they eat bread*. The flock is *my people*; the crime is consuming Yahuah''s own.'),
    ('canon','micah',3,4,'canon','proverbs',1,28,'free',
      E'*Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me* (Proverbs 1:28). Micah pronounces the same shut heaven on the devouring leaders: *Then shall they cry unto Yahuah (LORD), but he will not hear them: he will even hide his face from them at that time* (Micah 3:4). Those who would not hear the cry of the poor find their own cry unanswered in the day of reckoning.'),
    ('canon','micah',3,2,'canon','romans',12,9,'free',
      E'*Let love be without dissimulation. Abhor that which is evil; cleave to that which is good* (Romans 12:9). The apostolic charge is the exact inverse of Micah''s verdict on the heads who *hate the good, and love the evil* (Micah 3:2). Where the corrupt rulers cling to evil and despise the good, the renewed people are to abhor evil and cleave to good — the covenant ethic Micah''s leaders betrayed.'),

    -- THREAD 2 (★): The prophets that cry Peace and bite with their teeth
    ('canon','micah',3,5,'canon','jeremiah',6,14,'free',
      E'*They have healed also the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 6:14). Micah''s hireling prophets *bite with their teeth, and cry, Peace* (Micah 3:5) when they are fed; Jeremiah names the same lie — *Peace, peace; when there is no peace* — the false comfort sold for bread. Prophecy for profit, not the word of Yahuah.'),
    ('canon','micah',3,5,'canon','ezekiel',13,10,'free',
      E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10). The peace-criers of Micah 3:5 are Ezekiel''s wall-daubers: prophets who *seduced my people, saying, Peace; and there was no peace*. Both pronounce judgment on prophets who soothe for pay while the wall is about to fall.'),
    ('canon','micah',3,6,'canon','amos',8,11,'free',
      E'*Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11). Micah''s sentence on the bought prophets is silence — *night shall be unto you, that ye shall not have a vision... the sun shall go down over the prophets* (Micah 3:6) — the very famine of the word Amos foretells. The mouths that sold prophecy are shut; there is *no answer of Elohim (God)* (3:7).'),
    ('canon','micah',3,5,'canon','2-peter',2,1,'free',
      E'*But there were false prophets also among the people, even as there shall be false teachers among you... And through covetousness shall they with feigned words make merchandise of you* (2 Peter 2:1-3). Micah''s prophets *divine for money* and *cry, Peace* for pay (Micah 3:5,11); Peter names the same breed forward — false prophets who, *through covetousness... make merchandise of you*. Prophecy-for-profit runs from Micah''s day to the last days.'),
    ('canon','micah',3,5,'canon','matthew',7,15,'free',
      E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). Yahusha warns of the very figures Micah unmasks — prophets who *make my people err* and *bite with their teeth* (Micah 3:5): wolves in sheep''s clothing. The hireling who cries peace for bread and prepares war when unpaid is the ravening wolf within the fold.'),

    -- THREAD 3 (★★): Full of power by the Spirit of Yahuah (the true prophet)
    ('canon','micah',3,8,'canon','acts',1,8,'extras',
      E'*But ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you: and ye shall be witnesses unto me both in Jerusalem, and in all Judæa, and in Samaria, and unto the uttermost part of the earth* (Acts 1:8). Micah stands against every hireling as the Spirit-filled true prophet: *I am full of power by the spirit of Yahuah (LORD)... to declare unto Jacob his transgression* (Micah 3:8). The same Spirit-given power Yahusha promises the witnesses is the power Micah already bears — to tell the truth the bought prophets would not speak.'),
    ('canon','micah',3,8,'canon','1-corinthians',2,4,'extras',
      E'*And my speech and my preaching was not with enticing words of man''s wisdom, but in demonstration of the Spirit and of power* (1 Corinthians 2:4). Paul preaches in the same register Micah claims — not the hireling''s *enticing words* but *demonstration of the Spirit and of power*, the very *power by the spirit of Yahuah (LORD)* (Micah 3:8) that fills the true prophet. The Spirit, not the fee, is the credential.'),
    ('canon','micah',3,8,'apocrypha','the-wisdom-of-solomon',1,5,'extras',
      E'*For the holy spirit of discipline will flee deceit, and remove from thoughts that are without understanding, and will not abide when unrighteousness comes in* (Wisdom 1:5). The restored witness frames the contrast of Micah 3: the Spirit who fills Micah — *full of power by the spirit of Yahuah (LORD)* (3:8) — *will flee deceit* and *will not abide* the lying prophet for hire. He cannot dwell with the hireling''s falsehood; He fills the one sent to declare the people''s sin.'),
    ('canon','micah',3,8,'apocrypha','the-wisdom-of-solomon',1,7,'extras',
      E'*For the Spirit of Yahuah (God) filleth the world: and that which containeth all things has knowledge of the voice* (Wisdom 1:7). Micah is *full of power by the spirit of Yahuah (LORD)* (3:8); Wisdom declares that same *Spirit of Yahuah (God) filleth the world*. The Spirit who fills all things fills the true prophet with judgment and might to speak — opposite the bought mouths over whom the sun goes down.'),

    -- THREAD 4 (★): They build up Zion with blood and lean upon Yahuah
    ('canon','micah',3,11,'canon','jeremiah',7,4,'free',
      E'*Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (Jeremiah 7:4). Micah''s corrupt heads *lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11) — the same presumptuous false security Jeremiah rebukes. The temple''s presence is no shield for those who sell judgment; the very mount they trust in shall be plowed (3:12).'),
    ('canon','micah',3,11,'canon','malachi',2,8,'free',
      E'*But ye are departed out of the way; ye have caused many to stumble at the law; ye have corrupted the covenant of Levi, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:8). Micah''s *priests... teach for hire* (Micah 3:11); Malachi names the breach — priests who *caused many to stumble at the law* and *corrupted the covenant of Levi*. The Torah stands; it is the priests who departed from it. Teaching for hire is covenant-treachery, never the law''s failure.'),
    ('canon','micah',3,10,'apocrypha','ecclesiasticus',34,18,'extras',
      E'*He that sacrificeth of a thing wrongfully gotten, his offering is ridiculous; and the gifts of unjust men are not accepted* (Sirach 34:18). They *build up Zion with blood, and Jerusalem with iniquity* (Micah 3:10) — and the restored witness weighs such gifts: *the gifts of unjust men are not accepted*. A Zion raised on blood and bribery brings an offering Yahuah will not receive.'),
    ('canon','micah',3,10,'apocrypha','ecclesiasticus',34,22,'extras',
      E'*He that taketh away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder* (Sirach 34:22). To *build up Zion with blood* (Micah 3:10) is precisely this — the bloodshedder who *defraudeth the labourer of his hire*. The judges who *judge for reward* and priests who *teach for hire* (3:11) build a city whose every stone is another man''s stolen life.'),
    ('canon','micah',3,11,'canon','1-thessalonians',5,3,'free',
      E'*For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Micah''s corrupt leaders presume *none evil can come upon us* (Micah 3:11) — the very *Peace and safety* before *sudden destruction*. The false security that leans on Yahuah while selling His judgment meets the ruin it denied; *therefore shall Zion... be plowed* (3:12).'),

    -- THREAD 5 (★★): Zion shall be plowed as a field
    ('canon','micah',3,12,'canon','jeremiah',26,18,'free',
      E'*Micah the Morasthite prophesied in the days of Hezekiah king of Yahudah (Judah)... Thus saith Yahuah Tseva''ot (LORD of hosts); Zion shall be plowed like a field, and Jerusalem shall become heaps, and the mountain of the house as the high places of a forest* (Jeremiah 26:18). This is Micah 3:12 quoted by name a century later — the elders cite Micah''s very word to spare Jeremiah''s life, recalling that Hezekiah feared Yahuah and was spared. A prophet''s word made the precedent that saved another prophet; one Spirit, one word, across the canon.'),
    ('canon','micah',3,12,'canon','matthew',24,2,'free',
      E'*And Yahusha (Jesus) said unto them, See ye not all these things? verily I say unto you, There shall not be left here one stone upon another, that shall not be thrown down* (Matthew 24:2). Micah''s sentence on the temple-mount — *the mountain of the house as the high places of the forest* (Micah 3:12) — is the word Yahusha speaks over the second temple: *not... one stone upon another*. The plowed mountain of Micah is the thrown-down house of Yahusha; the same judgment on a leadership that sold judgment.'),
    ('canon','micah',3,12,'canon','luke',19,44,'free',
      E'*And shall lay thee even with the ground, and thy children within thee; and they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44). Weeping over the city, Yahusha pronounces Micah''s verdict again — *Zion... plowed as a field, and Jerusalem... heaps* (Micah 3:12) — *they shall not leave in thee one stone upon another*. The cause is the same: a people and a leadership that *knewest not the time of thy visitation*. Judgment falls — and yet (Micah 4:1-2) the mountain of the house shall be exalted.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people',
       E'Who hate the good and eat the flesh of my people — the shepherds who devour the flock',
       E'Micah turns the covenant-lawsuit on the leadership: *Hear, I pray you, O heads of Jacob, and ye princes of the house of Yashar''el (Israel); Is it not for you to know judgment? Who hate the good, and love the evil; who pluck off their skin from off them, and their flesh from off their bones; Who also eat the flesh of my people... and chop them in pieces, as for the pot, and as flesh within the caldron* (Micah 3:1-3). The men charged to *know judgment* have become cannibals of their own flock. This is Isaiah''s woe — *Woe unto them that call evil good, and good evil* (Isaiah 5:20) — and Ezekiel''s shepherds who feed themselves: *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves!... Ye eat the fat, and ye clothe you with the wool, ye kill them that are fed: but ye feed not the flock* (Ezekiel 34:2-3). It is the psalm''s atrocity: *who eat up my people as they eat bread* (Psalm 14:4). And when the day turns, *Then shall they cry unto Yahuah (LORD), but he will not hear them: he will even hide his face from them* (Micah 3:4) — the very shut heaven Wisdom pronounces on those who spurned her: *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me* (Proverbs 1:28). The apostolic ethic is the exact inverse of these heads who *hate the good*: *Abhor that which is evil; cleave to that which is good* (Romans 12:9). Covenant-lawsuit against corrupt shepherds — never against the flock, who are their victims.',
       sv.verse_id, ev.verse_id, 'free', 45428
  FROM _s333_mic03_lookup sv, _s333_mic03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth',
       E'The prophets that cry Peace and bite with their teeth — prophecy for hire',
       E'The hireling prophets are arraigned next: *Thus saith Yahuah (LORD) concerning the prophets that make my people err, that bite with their teeth, and cry, Peace; and he that putteth not into their mouths, they even prepare war against him* (Micah 3:5). Peace is sold by the mouthful — comfort to whoever feeds them, war on whoever does not. This is Jeremiah''s indictment word for word — *saying, Peace, peace; when there is no peace* (Jeremiah 6:14) — and Ezekiel''s wall-daubers: *they have seduced my people, saying, Peace; and there was no peace* (Ezekiel 13:10). The sentence is darkness and silence: *Therefore night shall be unto you, that ye shall not have a vision... the sun shall go down over the prophets, and the day shall be dark over them. Then shall the seers be ashamed, and the diviners confounded... for there is no answer of Elohim (God)* (Micah 3:6-7) — the very famine Amos foretold: *a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11). The apostles name the same breed forward: *false prophets... through covetousness shall they with feigned words make merchandise of you* (2 Peter 2:1-3), and Yahusha warns, *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). Prophecy-for-profit runs the length of the canon.',
       sv.verse_id, ev.verse_id, 'free', 45431
  FROM _s333_mic03_lookup sv, _s333_mic03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-3-full-of-power-by-the-spirit-of-yahuah',
       E'Full of power by the Spirit of Yahuah — the true prophet against the hirelings',
       E'Against every bought mouth stands one man filled with the Spirit: *But truly I am full of power by the spirit of Yahuah (LORD), and of judgment, and of might, to declare unto Jacob his transgression, and to Yashar''el (Israel) his sin* (Micah 3:8). Where the hirelings *cry, Peace* for pay and fall silent in the dark, the Spirit-filled prophet has *power... and of judgment, and of might* to tell the people their actual sin. The same Spirit-given power Yahusha promises the witnesses: *ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you: and ye shall be witnesses unto me* (Acts 1:8); the register in which Paul preached — *not with enticing words of man''s wisdom, but in demonstration of the Spirit and of power* (1 Corinthians 2:4). The restored witness draws the very contrast Micah lives: *the holy spirit of discipline will flee deceit... and will not abide when unrighteousness comes in* (Wisdom 1:5) — He will not dwell with the lying prophet — yet *the Spirit of Yahuah (God) filleth the world* (Wisdom 1:7), and fills the one sent to speak the truth. The Spirit, not the fee, is the prophet''s credential; the bought prophets are confounded, and the Spirit-filled one is heard.',
       sv.verse_id, ev.verse_id, 'extras', 45434
  FROM _s333_mic03_lookup sv, _s333_mic03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah',
       E'They build up Zion with blood and lean upon Yahuah — corruption crowned with false security',
       E'Corruption runs top to bottom, then drapes itself in presumption: *They build up Zion with blood, and Jerusalem with iniquity. The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:10-11). Judgment, teaching, and prophecy are all for sale — and the sellers shelter behind the temple. This is Jeremiah''s temple-slogan rebuked: *Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD)... are these* (Jeremiah 7:4); and Malachi''s corrupted priesthood: *ye have caused many to stumble at the law; ye have corrupted the covenant of Levi* (Malachi 2:8) — the priests teaching for hire is a breach of Torah, not Torah''s failure; the law stands while they depart from it. The restored witness weighs such a city''s offerings: *the gifts of unjust men are not accepted* (Sirach 34:18); *he that defraudeth the labourer of his hire is a bloodshedder* (Sirach 34:22) — Zion built with blood, stone by stolen stone. And the false security meets the ruin it denied: *when they shall say, Peace and safety; then sudden destruction cometh upon them... and they shall not escape* (1 Thessalonians 5:3).',
       sv.verse_id, ev.verse_id, 'extras', 45437
  FROM _s333_mic03_lookup sv, _s333_mic03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-3-zion-shall-be-plowed-as-a-field',
       E'Zion shall be plowed as a field — the verdict quoted to spare a prophet, and the temple thrown down',
       E'The verdict falls on the very mount the corrupt leaders leaned upon: *Therefore shall Zion for your sake be plowed as a field, and Jerusalem shall become heaps, and the mountain of the house as the high places of the forest* (Micah 3:12). This is the rarest event in the canon: a prophet''s word quoted by name in another book to decide a man''s life. A century later, when Jeremiah is on trial for his life for prophesying the temple''s fall, the elders rise and cite Micah: *Micah the Morasthite prophesied in the days of Hezekiah king of Yahudah (Judah)... Thus saith Yahuah Tseva''ot (LORD of hosts); Zion shall be plowed like a field, and Jerusalem shall become heaps, and the mountain of the house as the high places of a forest* (Jeremiah 26:18) — and because Hezekiah had feared Yahuah and not slain Micah, Jeremiah is spared. One word, one Spirit, saving across the generations. And Yahusha speaks Micah''s sentence over the second temple: *There shall not be left here one stone upon another, that shall not be thrown down* (Matthew 24:2); weeping over the city, *they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44). The plowed mountain of Micah is the thrown-down house of Yahusha — judgment on a leadership that sold judgment. Yet read the next breath: in Micah 4:1-2 the mountain of the house is EXALTED above the hills, the nations flowing to it. Judgment, then restoration.',
       sv.verse_id, ev.verse_id, 'free', 45440
  FROM _s333_mic03_lookup sv, _s333_mic03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Woe unto them that call evil good, and good evil* (Isaiah 5:20) — the heads of Jacob who *hate the good, and love the evil* (Micah 3:2) have inverted the moral order Isaiah pronounces woe upon.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves!* (Ezekiel 34:2) — Micah''s rulers *eat the flesh of my people* (Micah 3:3); the same lawsuit against shepherds who consume the flock.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye eat the fat... but ye feed not the flock* (Ezekiel 34:3) — the cannibal image of Micah 3:3 (*eat the flesh of my people... chop them in pieces, as for the pot*) made vivid.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *who eat up my people as they eat bread* (Psalm 14:4) — the same atrocity Micah indicts: leaders devouring the covenant people, *the flesh of my people* (Micah 3:3).'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=3
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Then shall they call upon me, but I will not answer* (Proverbs 1:28) — the shut heaven of Micah 3:4 (*they cry unto Yahuah, but he will not hear them*): those who would not hear the poor find their own cry unanswered.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Abhor that which is evil; cleave to that which is good* (Romans 12:9) — the exact inverse of the heads who *hate the good, and love the evil* (Micah 3:2); the covenant ethic they betrayed, carried forward.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-who-hate-the-good-and-eat-the-flesh-of-my-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *saying, Peace, peace; when there is no peace* (Jeremiah 6:14) — Micah''s prophets *cry, Peace* (Micah 3:5) for pay; Jeremiah names the same false comfort sold for bread.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *they have seduced my people, saying, Peace; and there was no peace* (Ezekiel 13:10) — the peace-criers of Micah 3:5 are Ezekiel''s wall-daubers, soothing while the wall is about to fall.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a famine... of hearing the words of Yahuah (LORD)* (Amos 8:11) — Micah''s sentence of silence over the prophets (Micah 3:6-7, *the sun shall go down... no answer of Elohim*) is the famine of the word Amos foretells.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *false prophets... through covetousness... make merchandise of you* (2 Peter 2:1-3) — Micah''s prophets who *divine for money* (Micah 3:11) named forward; prophecy-for-profit to the last days.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *false prophets... in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15) — the hireling who cries peace for bread and prepares war when unpaid (Micah 3:5) is the wolf within the fold.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-the-prophets-that-cry-peace-and-bite-with-their-teeth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *ye shall receive power, after that the Ruach HaKodesh (Holy Spirit) is come upon you* (Acts 1:8) — the same Spirit-given power that fills Micah (*full of power by the spirit of Yahuah*, Micah 3:8) to declare the people''s sin.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-full-of-power-by-the-spirit-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *in demonstration of the Spirit and of power* (1 Corinthians 2:4) — Paul preaches in the same register Micah claims (Micah 3:8): not enticing words but the Spirit''s power. The Spirit, not the fee, is the credential.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-full-of-power-by-the-spirit-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the holy spirit of discipline will flee deceit... and will not abide when unrighteousness comes in* (Wisdom 1:5) — the Spirit who fills Micah (3:8) will not dwell with the lying prophet for hire; the chapter''s very contrast.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-full-of-power-by-the-spirit-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the Spirit of Yahuah (God) filleth the world* (Wisdom 1:7) — the same Spirit that fills the true prophet *full of power* (Micah 3:8) to speak, while the bought mouths fall silent.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-full-of-power-by-the-spirit-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Trust ye not in lying words, saying, The temple of Yahuah (LORD)... are these* (Jeremiah 7:4) — the same false security as Micah''s *lean upon Yahuah... none evil can come upon us* (Micah 3:11); the temple is no shield for those who sell judgment.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *ye have caused many to stumble at the law... corrupted the covenant of Levi* (Malachi 2:8) — Micah''s *priests... teach for hire* (Micah 3:11); the Torah stands while the priests depart from it. Teaching for hire is covenant-treachery, not the law''s failure.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the gifts of unjust men are not accepted* (Sirach 34:18) — a Zion *built with blood, and... iniquity* (Micah 3:10) brings an offering Yahuah will not receive.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *he that defraudeth the labourer of his hire is a bloodshedder* (Sirach 34:22) — to *build up Zion with blood* (Micah 3:10) is exactly this; the city raised on judges for reward and priests for hire is built of stolen lives.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *when they shall say, Peace and safety; then sudden destruction cometh upon them* (1 Thessalonians 5:3) — Micah''s presumption *none evil can come upon us* (Micah 3:11) meets the ruin it denied.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-they-build-up-zion-with-blood-and-lean-upon-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Micah the Morasthite prophesied... Zion shall be plowed like a field* (Jeremiah 26:18) — Micah 3:12 quoted by name a century later; the elders cite it to spare Jeremiah''s life. One word, one Spirit, saving across generations.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-zion-shall-be-plowed-as-a-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *There shall not be left here one stone upon another* (Matthew 24:2) — Micah''s plowed *mountain of the house* (Micah 3:12) is the thrown-down temple Yahusha pronounces; judgment on a leadership that sold judgment.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-zion-shall-be-plowed-as-a-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44) — Micah''s verdict again, wept over the city; judgment, and yet (Micah 4:1-2) the mountain of the house exalted.'
  FROM cross_reference_threads t
  JOIN _s333_mic03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s333_mic03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-3-zion-shall-be-plowed-as-a-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_4.sql (Micah 4) -----
-- Chapter: Micah 4 — ★★ THE MOUNTAIN OF THE HOUSE IN THE LATTER DAYS; THE TORAH GOES FORTH FROM ZION;
-- SWORDS INTO PLOWSHARES; THE REMNANT GATHERED, THE KINGDOM RESTORED. The keystone: *But in the last
-- days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in
-- the top of the mountains... and people shall flow unto it... for the law shall go forth of Zion, and
-- the word of Yahuah (LORD) from Jerusalem* (4:1-2) — near-identical to Isaiah 2:2-4. The nations stream
-- to be TAUGHT the Torah in the Messianic age (Torah-never-abolished — the Torah is the law of the
-- kingdom, the world's instruction; the anti-antinomian hope). The Messianic judge brings universal
-- peace (4:3); each man under his vine and fig tree, the covenant people walking in the Name for ever
-- (4:4-5); the lame/driven-out/afflicted made a remnant, Yahuah reigning in Zion for ever (4:6-7,
-- two-house regathering); the kingdom come to the daughter of Zion (4:8); the travail then deliverance
-- and redemption from Babylon (4:9-10); the nations gathered as sheaves to the floor, Zion given horns
-- of iron to thresh (4:11-13).
-- Tag: mic04   Temp view: _s333_mic04_lookup
-- Sort band: base 45442, step 3 -> threads at 45442, 45445, 45448, 45451, 45454, 45457 (6 threads)
-- Source of EVERY row: 'canon','micah',4,v
--
-- Micah 4 coverage:
--   ★★★ v.1-3 (the mountain of the house established... nations flow... the law shall go forth of Zion...
--          swords into plowshares... neither shall they learn war any more)
--        NT:     ★ Revelation 15:4 (all nations shall come and worship before thee) — THREAD 1
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah (God) with gifts),
--                ★ Tobit 14:6 (all nations shall turn, and fear Yahuah (God) truly) — THREAD 1
--        Tanakh: ★★★ Isaiah 2:2 / 2:3 / 2:4 (near-identical parallel), ★ Isaiah 11:9 (the earth full of
--                the knowledge of Yahuah), ★ Zechariah 8:22 (many people and strong nations shall come to
--                seek Yahuah in Jerusalem), ★ Zechariah 14:16 (every one... shall go up... to worship the
--                King) — THREAD 1
--   ★ v.4-5 (every man under his vine and under his fig tree... we will walk in the name of Yahuah
--          Eloheinu for ever and ever)
--        NT:     ★ John 1:48 (when thou wast under the fig tree, I saw thee) — THREAD 2
--        Extras: none warranted (the vine/fig-tree peace is canon-witnessed; no clean extras add)
--        Tanakh: ★ 1 Kings 4:25 (every man under his vine and under his fig tree... all the days of
--                Solomon), ★ Zechariah 3:10 (shall ye call every man his neighbour under the vine and
--                under the fig tree), ★ Zechariah 10:12 (they shall walk up and down in his name) — THREAD 2
--   ★★ v.6-8 (I will assemble her that halteth... make her that halted a remnant... Yahuah shall reign
--          over them in mount Zion... the first dominion; the kingdom shall come)
--        NT:     ★★ Luke 1:33 (he shall reign over the house of Jacob for ever), ★★ Revelation 11:15
--                (the kingdoms of this world are become the kingdoms of our Lord... he shall reign for
--                ever and ever) — THREAD 3
--        Extras: none warranted (the regathering is densely canon-witnessed)
--        Tanakh: ★ Zephaniah 3:19 (I will save her that halteth, and gather her that was driven out),
--                ★ Ezekiel 34:16 (I will seek that which was lost, and bring again that which was driven
--                away) — THREAD 3
--   ★ v.9-10 (be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail...
--          thou shalt go even to Babylon; there shalt thou be delivered; there Yahuah shall redeem thee)
--        NT:     ★ Romans 8:22 (the whole creation groaneth and travaileth in pain together until now),
--                ★ John 16:21 (a woman when she is in travail hath sorrow... her sorrow turned to joy) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Isaiah 66:7 (before she travailed, she brought forth), ★ Isaiah 48:20 (Go ye forth of
--                Babylon... Yahuah hath redeemed his servant Jacob) — THREAD 4
--   v.11-13 (many nations gathered against thee... he shall gather them as the sheaves into the floor...
--          Arise and thresh, O daughter of Zion: for I will make thine horn iron)
--        NT:     none warranted distinct (the harvest-judgment forward-weave is carried by Revelation in
--                prose; Joel/Daniel are the load-bearing witnesses)
--        Extras: none warranted
--        Tanakh: ★ Joel 3:13 (Put ye in the sickle, for the harvest is ripe... the press is full),
--                ★ Daniel 2:35 (the stone... became a great mountain, and filled the whole earth),
--                ★ Daniel 2:44 (a kingdom which shall never be destroyed... break in pieces and consume
--                all these kingdoms) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. micah-4-the-law-shall-go-forth-of-zion — Tanakh (Isaiah 2, Isaiah 11, Zechariah 8, Zechariah 14)
--      + NT (Revelation 15) + Extras (Tobit 13, Tobit 14) [extras]
--      (★★★ the mountain of the house + the Torah from Zion + swords to plowshares; the nations TAUGHT
--       the Torah in the Messianic age — Torah-never-abolished, the law of the kingdom)
--   2. micah-4-every-man-under-his-vine-and-fig-tree — Tanakh (1 Kings 4, Zechariah 3, Zechariah 10)
--      + NT (John 1) [free]
--      (★ the Messianic peace; the covenant people walking in the Name for ever)
--   3. micah-4-yahuah-shall-reign-over-them-in-mount-zion — Tanakh (Zephaniah 3, Ezekiel 34) + NT
--      (Luke 1, Revelation 11) [free]
--      (★★ the lame gathered as a remnant + the kingdom restored to Zion — two-house regathering)
--   4. micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon — Tanakh (Isaiah 66, Isaiah 48)
--      + NT (Romans 8, John 16) [free]
--      (★ the birth-pangs then deliverance; redemption from Babylon)
--   5. micah-4-arise-and-thresh-o-daughter-of-zion — Tanakh (Joel 3, Daniel 2) [free]
--      (the nations gathered as sheaves to the floor; the kingdom that grinds)
--
-- Framing notes:
--   ★★★ THE TORAH FROM ZION (THREAD 1): Micah's latter-day vision and Isaiah's are one word — *But in
--      the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be
--      established in the top of the mountains... and people shall flow unto it. And many nations shall
--      come, and say, Come, and let us go up to the mountain of Yahuah (LORD)... and he will teach us of
--      his ways, and we will walk in his paths: for the law shall go forth of Zion, and the word of
--      Yahuah (LORD) from Jerusalem* (Micah 4:1-2); Isaiah: *out of Zion shall go forth the law, and the
--      word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). This is THE Torah-never-abolished keystone:
--      in the Messianic age the nations STREAM to be TAUGHT the Torah — it goes FORTH, it is the law of
--      the kingdom, the world's instruction. Not a defunct old covenant superseded by grace; the very
--      thing the nations come to learn. The Messianic judge brings the peace: *they shall beat their
--      swords into plowshares... neither shall they learn war any more* (4:3) — and the knowledge of
--      Yahuah fills the earth (Isaiah 11:9). The nations seeking Yahuah at Jerusalem is the standing
--      prophetic hope (Zechariah 8:22; 14:16; Revelation 15:4), witnessed even in the restored library
--      (Tobit 13:11; 14:6).
--   ★ THE VINE AND FIG TREE (THREAD 2): *But they shall sit every man under his vine and under his fig
--      tree; and none shall make them afraid* (Micah 4:4) — the Solomonic peace renewed (1 Kings 4:25)
--      and the Messianic-age peace promised (Zechariah 3:10). And *we will walk in the name of Yahuah
--      Eloheinu (the LORD our God) for ever and ever* (4:5) — the covenant people walking in the Name
--      (Zechariah 10:12). The fig-tree sign is picked up when Yahusha (Jesus) names Nathanael *under the
--      fig tree* (John 1:48), the true Yashar'el (Israel) in whom is no guile.
--   ★★ YAHUAH SHALL REIGN IN ZION (THREAD 3): *In that day, saith Yahuah (LORD), will I assemble her
--      that halteth, and I will gather her that is driven out, and her that I have afflicted; And I will
--      make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD)
--      shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:6-7). This is the
--      two-house regathering — the lame, the driven-out, the afflicted, the cast-far-off made a remnant
--      and a strong nation. Zephaniah names the same: *I will save her that halteth, and gather her that
--      was driven out* (Zephaniah 3:19); Ezekiel the Shepherd seeking the lost (Ezekiel 34:16). And the
--      reign for ever in Zion is the kingdom of the Davidic King: *he shall reign over the house of
--      Jacob for ever* (Luke 1:33); *the kingdoms of this world are become the kingdoms of our Lord, and
--      of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The first
--      dominion, the kingdom, comes to the daughter of Zion (4:8).
--   ★ THE TRAVAIL THEN REDEMPTION (THREAD 4): *Be in pain, and labour to bring forth, O daughter of
--      Zion, like a woman in travail... and thou shalt go even to Babylon; there shalt thou be
--      delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:10).
--      The exile is the birth-pang before the birth: Isaiah's *before she travailed, she brought forth*
--      (Isaiah 66:7); the call out of captivity *Go ye forth of Babylon... Yahuah (LORD) hath redeemed
--      his servant Jacob* (Isaiah 48:20). The whole creation groans in travail (Romans 8:22); the
--      woman's travail turns to joy (John 16:21).
--   THE THRESHING (THREAD 5): *Now also many nations are gathered against thee... But they know not the
--      thoughts of Yahuah (LORD)... for he shall gather them as the sheaves into the floor. Arise and
--      thresh, O daughter of Zion: for I will make thine horn iron* (Micah 4:11-13). The nations massed
--      against Zion are gathered for judgment like a harvest — Joel's *Put ye in the sickle, for the
--      harvest is ripe* (Joel 3:13) — and the kingdom that grinds all kingdoms to chaff and fills the
--      earth is Daniel's stone become a mountain (Daniel 2:35, 44).
--   VERSES WITH NO SEPARATE ADD: v.9 (Now why dost thou cry out aloud? — the lament-question that opens
--      the travail of THREAD 4, woven with v.10), v.11-12 (the nations gathered / they know not the
--      thoughts of Yahuah — the setup for the threshing of THREAD 5, woven with v.13). All recorded,
--      none silently skipped.

CREATE TEMP VIEW _s333_mic04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): The law shall go forth of Zion — the mountain of the house, the nations taught, swords to plowshares
    ('canon','micah',4,1,'canon','isaiah',2,2,'free',
      E'*And it shall come to pass in the last days, that the mountain of the LORD’S house shall be established in the top of the mountains, and shall be exalted above the hills; and all nations shall flow unto it* (Isaiah 2:2). Micah''s word is Isaiah''s word: *the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it* (Micah 4:1). The two prophets see one latter-day vision — the house of Yahuah exalted above all, and the nations streaming to it.'),
    ('canon','micah',4,2,'canon','isaiah',2,3,'free',
      E'*And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD), to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). This is the keystone, near-identical to Micah''s *for the law shall go forth of Zion, and the word of Yahuah (LORD) from Jerusalem* (Micah 4:2): in the Messianic age the nations come to be TAUGHT the Torah, which goes FORTH from Zion. The Torah is not abolished but is the very instruction the nations seek — the law of the kingdom, the world''s teacher.'),
    ('canon','micah',4,3,'canon','isaiah',2,4,'free',
      E'*And he shall judge among the nations, and shall rebuke many people: and they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up sword against nation, neither shall they learn war any more* (Isaiah 2:4). Word for word Micah''s *they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up a sword against nation, neither shall they learn war any more* (Micah 4:3). The Messianic Judge, having taught the nations the Torah, brings the universal peace — the instruments of war turned to the tools of harvest.'),
    ('canon','micah',4,3,'canon','isaiah',11,9,'free',
      E'*They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). The peace where *nation shall not lift up a sword against nation* (Micah 4:3) is the holy mountain where none hurt nor destroy, because the earth is *full of the knowledge of Yahuah (LORD)* — the very knowledge the nations came up to learn when the Torah went forth from Zion.'),
    ('canon','micah',4,2,'canon','zechariah',8,22,'free',
      E'*Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD)* (Zechariah 8:22). Micah''s *many nations shall come, and say, Come, and let us go up to the mountain of Yahuah (LORD)* (Micah 4:2) is Zechariah''s many people and strong nations seeking Yahuah in Jerusalem — one standing prophetic hope of the in-gathered nations streaming to the house.'),
    ('canon','micah',4,2,'canon','zechariah',14,16,'free',
      E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The nations who *go up to the mountain of Yahuah (LORD)* (Micah 4:2) go up to worship the King and to KEEP the feast of Tabernacles — the appointed times standing in the Messianic age, the nations folded into Yahuah''s own calendar; the Torah not abolished but the law of the kingdom.'),
    ('canon','micah',4,1,'canon','revelation',15,4,'free',
      E'*Who shall not fear thee, O Yahuah (Lord), and glorify thy name? for thou only art holy: for all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4). The *people shall flow unto it* and *many nations shall come* of Micah 4:1-2 reach their consummation here: *all nations shall come and worship before thee* — the streaming of the nations to the mountain fulfilled in the worship of all nations before Yahuah.'),
    ('canon','micah',4,2,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). The restored witness sings the same hope as Micah''s *many nations shall come... let us go up to the mountain of Yahuah (LORD)* (Micah 4:2): the nations coming from far to the Name, to Jerusalem, with gifts — the in-gathering of the peoples to the house of Yahuah.'),
    ('canon','micah',4,2,'apocrypha','tobit',14,6,'extras',
      E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). Micah''s nations who say *he will teach us of his ways, and we will walk in his paths* (Micah 4:2) are Tobit''s all-nations who turn and fear Yahuah truly, casting off their idols — the same Messianic-age conversion of the peoples to walk in Yahuah''s ways.'),

    -- THREAD 2 (★): Every man under his vine and fig tree — and we will walk in the Name for ever
    ('canon','micah',4,4,'canon','1-kings',4,25,'free',
      E'*And Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree, from Dan even to Beer-sheba, all the days of Solomon* (1 Kings 4:25). Micah''s Messianic peace — *they shall sit every man under his vine and under his fig tree; and none shall make them afraid* (Micah 4:4) — is the very security of Solomon''s golden days renewed; the proverb of the kingdom''s peace, both houses dwelling safely.'),
    ('canon','micah',4,4,'canon','zechariah',3,10,'free',
      E'*In that day, saith Yahuah Tseva''ot (LORD of hosts), shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). The same Messianic-age peace as Micah''s *every man under his vine and under his fig tree* (Micah 4:4) — spoken in Zechariah where the BRANCH is brought forth and iniquity removed in one day (3:8-9); the peace of the day when the King reigns.'),
    ('canon','micah',4,5,'canon','zechariah',10,12,'free',
      E'*And I will strengthen them in Yahuah (LORD); and they shall walk up and down in his name, saith Yahuah (LORD)* (Zechariah 10:12). Micah''s covenant pledge *we will walk in the name of Yahuah Eloheinu (the LORD our God) for ever and ever* (Micah 4:5) is Zechariah''s strengthened people who *walk up and down in his name* — the gathered house of Judah and Joseph (10:6) walking in the Name.'),
    ('canon','micah',4,4,'canon','john',1,48,'free',
      E'*Nathanael saith unto him, Whence knowest thou me? Yahusha (Jesus) answered and said unto him, Before that Philip called thee, when thou wast under the fig tree, I saw thee* (John 1:48). The fig-tree sign of the kingdom''s peace — *every man under his... fig tree* (Micah 4:4) — frames Yahusha (Jesus) finding Nathanael *under the fig tree*, *an Israelite indeed, in whom is no guile* (1:47): the true son of Yashar''el (Israel) met at the place of the Messianic-age peace.'),

    -- THREAD 3 (★★): Yahuah shall reign over them in mount Zion — the lame gathered as a remnant, the kingdom restored
    ('canon','micah',4,6,'canon','zephaniah',3,19,'free',
      E'*Behold, at that time I will undo all that afflict thee: and I will save her that halteth, and gather her that was driven out; and I will get them praise and fame in every land where they have been put to shame* (Zephaniah 3:19). The same regathering as Micah''s *I will assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted* (Micah 4:6) — the lame, the driven-out, the afflicted saved and gathered. The two-house remnant brought home from the lands of their shame.'),
    ('canon','micah',4,6,'canon','ezekiel',34,16,'free',
      E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick: but I will destroy the fat and the strong; I will feed them with judgment* (Ezekiel 34:16). Micah''s *I will gather her that is driven out, and her that I have afflicted* (Micah 4:6) is the Shepherd of Ezekiel 34 seeking the lost and bringing again the driven-away, binding the broken — the scattered flock of both houses sought out and gathered.'),
    ('canon','micah',4,7,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). Micah''s *Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7) is the reign Gabriel announces to Mary: the Davidic King who shall *reign over the house of Jacob for ever* — the kingdom restored to the remnant, without end.'),
    ('canon','micah',4,7,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The everlasting reign of Micah 4:7 — *Yahuah (LORD) shall reign over them in mount Zion... even for ever* — is the kingdom come at the last trump: the kingdoms of the world become Yahuah''s and his Messiah''s, *and he shall reign for ever and ever*. The first dominion, the kingdom, come to the daughter of Zion (Micah 4:8).'),

    -- THREAD 4 (★): The daughter of Zion in travail, redeemed from Babylon
    ('canon','micah',4,10,'canon','isaiah',66,7,'free',
      E'*Before she travailed, she brought forth; before her pain came, she was delivered of a man child* (Isaiah 66:7). Micah''s *Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail* (Micah 4:10) is Zion''s birth-pang turned to sudden birth — *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8); the exile-anguish is the labour before the nation is born.'),
    ('canon','micah',4,10,'canon','isaiah',48,20,'free',
      E'*Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing declare ye, tell this, utter it even to the end of the earth; say ye, Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20). Micah''s *thou shalt go even to Babylon; there shalt thou be delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:10) is answered in Isaiah''s call out of Babylon — *Yahuah (LORD) hath redeemed his servant Jacob* — the very place of captivity made the place of redemption.'),
    ('canon','micah',4,10,'canon','romans',8,22,'free',
      E'*For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). The travail of *the daughter of Zion, like a woman in travail* (Micah 4:10) is the pattern of the whole creation groaning toward its deliverance — the pain that precedes the birth, the bondage that gives way to the glorious liberty of the children of Elohim (God) (8:21).'),
    ('canon','micah',4,10,'canon','john',16,21,'free',
      E'*A woman when she is in travail hath sorrow, because her hour is come: but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21). Micah''s daughter of Zion *like a woman in travail* (Micah 4:10), delivered and redeemed, is Yahusha''s (Jesus'') own figure: the travail-sorrow turned to joy at the birth — the anguish forgotten when the deliverance comes.'),

    -- THREAD 5: Arise and thresh, O daughter of Zion — the nations gathered as sheaves, the kingdom that grinds
    ('canon','micah',4,12,'canon','joel',3,13,'free',
      E'*Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great* (Joel 3:13). Micah''s nations *gathered as the sheaves into the floor* (Micah 4:12) are Joel''s ripe harvest gathered for judgment in the valley of decision — the massed nations brought in like a crop to be threshed, the day of Yahuah near (Joel 3:14).'),
    ('canon','micah',4,13,'canon','daniel',2,35,'free',
      E'*Then was the iron, the clay, the brass, the silver, and the gold, broken to pieces together, and became like the chaff of the summer threshingfloors; and the wind carried them away, that no place was found for them: and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35). Micah''s *Arise and thresh, O daughter of Zion: for I will make thine horn iron... and thou shalt beat in pieces many people* (Micah 4:13) is Daniel''s kingdoms beaten to chaff on the threshingfloor, and the stone become the mountain that fills the whole earth — the very mountain of the house exalted (Micah 4:1).'),
    ('canon','micah',4,13,'canon','daniel',2,44,'free',
      E'*And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44). The threshing of Micah 4:13 — *thou shalt beat in pieces many people* — is the everlasting kingdom of Daniel that breaks in pieces and consumes all kingdoms and *shall stand for ever*; the same reign in Zion *even for ever* (Micah 4:7).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-4-the-law-shall-go-forth-of-zion',
       E'The law shall go forth of Zion — the mountain of the house, the nations taught, swords to plowshares',
       E'In the latter days the house of Yahuah is exalted above all and the nations stream to it: *But in the last days it shall come to pass, that the mountain of the house of Yahuah (LORD) shall be established in the top of the mountains, and it shall be exalted above the hills; and people shall flow unto it. And many nations shall come, and say, Come, and let us go up to the mountain of Yahuah (LORD), and to the house of the Elohim (God) of Jacob; and he will teach us of his ways, and we will walk in his paths: for the law shall go forth of Zion, and the word of Yahuah (LORD) from Jerusalem* (Micah 4:1-2). Isaiah sees the same vision in nearly the same words: *out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). This is the keystone of the whole framework: in the Messianic age the nations come up to be TAUGHT the Torah — it goes FORTH, it is the law of the kingdom, the world''s instruction. The Torah is not a defunct old covenant superseded by grace; it is the very thing the nations seek. The Messianic Judge then brings the universal peace: *they shall beat their swords into plowshares, and their spears into pruninghooks: nation shall not lift up a sword against nation, neither shall they learn war any more* (Micah 4:3; cf. Isaiah 2:4 word for word), the holy mountain where *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9). The in-gathering of the nations to seek Yahuah at Jerusalem is the standing prophetic hope — *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22), going up *to worship the King... and to keep the feast of tabernacles* (Zechariah 14:16, the appointed times standing), until *all nations shall come and worship before thee* (Revelation 15:4). The restored library sings the same: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11), and *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6).',
       sv.verse_id, ev.verse_id, 'extras', 45442
  FROM _s333_mic04_lookup sv, _s333_mic04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-4-every-man-under-his-vine-and-fig-tree',
       E'Every man under his vine and fig tree — and we will walk in the Name for ever',
       E'The Messianic peace is the security of the kingdom: *But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). This is the proverb of the golden age renewed — *Yahudah (Judah) and Yashar''el (Israel) dwelt safely, every man under his vine and under his fig tree... all the days of Solomon* (1 Kings 4:25) — and the day Zechariah promises when the BRANCH is brought forth: *In that day... shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10). And against the nations who walk each in the name of his god, the covenant people pledge: *we will walk in the name of Yahuah Eloheinu (the LORD our God) for ever and ever* (Micah 4:5) — the gathered house *strengthened... in Yahuah (LORD)*, who *shall walk up and down in his name* (Zechariah 10:12). The fig-tree sign of the kingdom''s peace is taken up when Yahusha (Jesus) finds Nathanael *under the fig tree* (John 1:48), naming him *an Israelite indeed, in whom is no guile* (1:47) — the true son of Yashar''el (Israel) met at the place of the Messianic-age peace.',
       sv.verse_id, ev.verse_id, 'free', 45445
  FROM _s333_mic04_lookup sv, _s333_mic04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-4-yahuah-shall-reign-over-them-in-mount-zion',
       E'Yahuah shall reign over them in mount Zion — the lame gathered as a remnant, the kingdom restored',
       E'The latter-day reign begins with a regathering of the broken: *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted; And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:6-7). This is the two-house regathering — the lame, the driven-out, the afflicted, the cast-far-off made a remnant and a strong nation. Zephaniah speaks the same word: *I will save her that halteth, and gather her that was driven out; and I will get them praise and fame in every land where they have been put to shame* (Zephaniah 3:19); and the Shepherd of Ezekiel seeks the scattered flock: *I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:16). The everlasting reign in Zion is the kingdom of the Davidic King: *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33), the kingdom come at the last trump — *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). And to the daughter of Zion the dominion returns: *unto thee shall it come, even the first dominion; the kingdom shall come to the daughter of Jerusalem* (Micah 4:8).',
       sv.verse_id, ev.verse_id, 'free', 45448
  FROM _s333_mic04_lookup sv, _s333_mic04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon',
       E'The daughter of Zion in travail — delivered and redeemed from Babylon',
       E'Before the deliverance comes the labour: *Now why dost thou cry out aloud? is there no king in thee?... for pangs have taken thee as a woman in travail. Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail: for now shalt thou go forth out of the city... and thou shalt go even to Babylon; there shalt thou be delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:9-10). The exile is the birth-pang before the birth. Isaiah sees the same sudden delivery: *Before she travailed, she brought forth; before her pain came, she was delivered of a man child* (Isaiah 66:7), *for as soon as Zion travailed, she brought forth her children* (66:8). And the very place of captivity becomes the place of redemption: *Go ye forth of Babylon, flee ye from the Chaldeans, with a voice of singing... say ye, Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20). The pattern reaches forward to the whole creation: *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22), and to Yahusha''s (Jesus'') own figure of sorrow turned to joy — *A woman when she is in travail hath sorrow... but as soon as she is delivered of the child, she remembereth no more the anguish, for joy that a man is born into the world* (John 16:21).',
       sv.verse_id, ev.verse_id, 'free', 45451
  FROM _s333_mic04_lookup sv, _s333_mic04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-4-arise-and-thresh-o-daughter-of-zion',
       E'Arise and thresh, O daughter of Zion — the nations gathered as sheaves, the kingdom that grinds',
       E'The nations mass against Zion, but their gathering is for judgment: *Now also many nations are gathered against thee, that say, Let her be defiled, and let our eye look upon Zion. But they know not the thoughts of Yahuah (LORD), neither understand they his counsel: for he shall gather them as the sheaves into the floor. Arise and thresh, O daughter of Zion: for I will make thine horn iron, and I will make thy hoofs brass: and thou shalt beat in pieces many people* (Micah 4:11-13). The massed nations are brought in like a ripe crop to be threshed — Joel''s harvest in the valley of decision: *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full, the fats overflow; for their wickedness is great* (Joel 3:13). And the beating-in-pieces is Daniel''s stone: the kingdoms *became like the chaff of the summer threshingfloors; and the wind carried them away... and the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35) — the very mountain of the house exalted (Micah 4:1) — the kingdom *which shall never be destroyed... and it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44), the same reign in Zion *even for ever* (Micah 4:7).',
       sv.verse_id, ev.verse_id, 'free', 45454
  FROM _s333_mic04_lookup sv, _s333_mic04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the mountain of the LORD’S house shall be established in the top of the mountains... and all nations shall flow unto it* (Isaiah 2:2) — Micah''s latter-day vision (4:1) is Isaiah''s word for word; the house of Yahuah exalted, the nations streaming.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3) — the keystone, near-identical to Micah 4:2; the nations come to be TAUGHT the Torah, which goes forth — the law of the kingdom, not abolished.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they shall beat their swords into plowshares... neither shall they learn war any more* (Isaiah 2:4) — word for word Micah 4:3; the Judge having taught the nations the Torah brings the universal peace.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the earth shall be full of the knowledge of Yahuah (LORD), as the waters cover the sea* (Isaiah 11:9) — the peace where *nation shall not lift up a sword against nation* (Micah 4:3) is the holy mountain filled with the knowledge the nations came to learn.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22) — Micah''s *many nations shall come... let us go up* (4:2); the standing hope of the in-gathered nations.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *every one that is left of all the nations... shall even go up... to worship the King... and to keep the feast of tabernacles* (Zechariah 14:16) — the nations who go up to the mountain (Micah 4:2) keep the appointed times; the Torah the law of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4) — the consummation of *people shall flow unto it* (Micah 4:1); the streaming of the nations fulfilled in worship.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11) — the restored witness sings Micah''s in-gathering of the nations to the Name (4:2).'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6) — Micah''s nations who say *we will walk in his paths* (4:2); the Messianic-age conversion of the peoples.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-law-shall-go-forth-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *every man under his vine and under his fig tree... all the days of Solomon* (1 Kings 4:25) — Micah''s Messianic peace (4:4) is the golden-age security of both houses renewed.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=4 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-every-man-under-his-vine-and-fig-tree'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *In that day... shall ye call every man his neighbour under the vine and under the fig tree* (Zechariah 3:10) — the same peace as Micah 4:4, spoken where the BRANCH is brought forth and iniquity removed in one day.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-every-man-under-his-vine-and-fig-tree'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they shall walk up and down in his name, saith Yahuah (LORD)* (Zechariah 10:12) — Micah''s pledge *we will walk in the name of Yahuah... for ever and ever* (4:5); the gathered house walking in the Name.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-every-man-under-his-vine-and-fig-tree'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *when thou wast under the fig tree, I saw thee* (John 1:48) — the fig-tree sign of the kingdom''s peace (Micah 4:4) frames Yahusha (Jesus) finding Nathanael, *an Israelite indeed, in whom is no guile*.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-every-man-under-his-vine-and-fig-tree'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will save her that halteth, and gather her that was driven out* (Zephaniah 3:19) — the same regathering as Micah 4:6; the lame and driven-out brought home from the lands of their shame.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will seek that which was lost, and bring again that which was driven away... and will strengthen that which was sick* (Ezekiel 34:16) — the Shepherd seeking the scattered flock; Micah''s *I will gather her that is driven out* (4:6), both houses sought out.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — Micah''s *Yahuah (LORD) shall reign over them in mount Zion... even for ever* (4:7); the Davidic King''s endless reign.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the everlasting reign of Micah 4:7 come at the last trump; the first dominion restored to the daughter of Zion (4:8).'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Before she travailed, she brought forth; before her pain came, she was delivered of a man child* (Isaiah 66:7) — Micah''s *labour to bring forth, O daughter of Zion, like a woman in travail* (4:10); the exile-pang turned to sudden birth.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Go ye forth of Babylon... say ye, Yahuah (LORD) hath redeemed his servant Jacob* (Isaiah 48:20) — Micah''s *thou shalt go even to Babylon; there... Yahuah (LORD) shall redeem thee* (4:10); the place of captivity made the place of redemption.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22) — the travail of the daughter of Zion (Micah 4:10) is the pattern of all creation groaning toward its deliverance.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *A woman when she is in travail hath sorrow... but as soon as she is delivered of the child, she remembereth no more the anguish, for joy* (John 16:21) — Yahusha''s (Jesus'') own figure of the travail (Micah 4:10) turned to joy at the deliverance.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-the-daughter-of-zion-in-travail-redeemed-from-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Put ye in the sickle, for the harvest is ripe... the press is full, the fats overflow* (Joel 3:13) — Micah''s nations *gathered as the sheaves into the floor* (4:12); the massed nations a ripe crop for judgment in the valley of decision.'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-arise-and-thresh-o-daughter-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the stone that smote the image became a great mountain, and filled the whole earth* (Daniel 2:35) — Micah''s *thou shalt beat in pieces many people* (4:13); the kingdoms threshed to chaff, the stone become the very mountain of the house (4:1).'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-arise-and-thresh-o-daughter-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* (Daniel 2:44) — the threshing of Micah 4:13 is Daniel''s everlasting kingdom, the same reign in Zion *even for ever* (4:7).'
  FROM cross_reference_threads t
  JOIN _s333_mic04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s333_mic04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-4-arise-and-thresh-o-daughter-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_5.sql (Micah 5) -----
-- Chapter: Micah 5 — ★★★ BETHLEHEM EPHRATAH, the ruler whose goings forth are from everlasting; the
-- remnant of his brethren return; he shall be the peace; the remnant of Jacob as dew and as a lion;
-- the graven images cut off. *But thou, Beth-lehem Ephratah, though thou be little among the thousands
-- of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar'el
-- (Israel); whose goings forth have been from of old, from everlasting* (5:2) — THE SUPREME
-- Christological keystone of the Twelve: the Messianic ruler born in Bethlehem whose origin is *from of
-- old, from everlasting* (mi-qedem, mi-mei olam). The chief priests quote it to Herod → Matthew 2:6,
-- and the crowd cites it → John 7:42. This is the Formed and the Formless: the ruler who *come forth
-- UNTO ME* (the Father) — the pre-existent Word drawn from the Formless Most High, who HAS a Father;
-- NOT co-equal trinitarian persons, NOT a second unoriginate, NOT Arian. His *goings forth from
-- everlasting* are framed by the restored witness — the Son of Adam whose *name was named... Before the
-- creation of the world* (1 Enoch 48:2-6). He shall *stand and feed in the strength of Yahuah (LORD)*
-- and *this man shall be the peace* (5:4-5) — the Good Shepherd (John 10:11), our peace (Ephesians 2:14),
-- the Prince of Peace (Isaiah 9:6). The remnant returns (5:3, the two-house regathering), the remnant of
-- Jacob is dew and lion among the nations (5:7-8), and every idol, witchcraft, and graven image is cut
-- off (5:10-15) — the cleansing of false trusts from the restored people.
-- Tag: mic05   Temp view: _s333_mic05_lookup
-- Sort band: base 45456, step 3 -> threads at 45456, 45459, 45462, 45465, 45468 (5 threads)
-- Source of EVERY row: 'canon','micah',5,v
--
-- Micah 5 coverage:
--   v.1 (Now gather thyself in troops... they shall smite the judge of Yashar'el with a rod upon the cheek)
--        NT:     none warranted distinct (the smitten-judge is woven in prose into the Bethlehem-ruler
--                contrast; the heaviest forward weave is on 5:2)
--        Extras: none warranted
--        Tanakh: held in prose — the besieged/smitten judge sets up the little-town ruler of 5:2
--   ★★★ v.2 (But thou, Beth-lehem Ephratah... out of thee shall he come forth unto me that is to be ruler
--          in Yashar'el; whose goings forth have been from of old, from everlasting)
--        NT:     ★★★ Matthew 2:6 (And thou Bethlehem... art not the least among the princes of Juda: for
--                out of thee shall come a Governor, that shall rule my people Yashar'el) — THREAD 1
--                (load-bearing, the chief-priests' citation), ★★ John 7:42 (the Messiah cometh... out of
--                the town of Bethlehem, where David was) — THREAD 1
--        Extras: ★★ 1 Enoch 48:2-3 (that Son of Adam was named In the presence of Yahuah of Spirits...
--                before the sun and the signs were created... His name was named), ★★ 1 Enoch 48:6 (for
--                this reason hath he been chosen and hidden before Him, Before the creation of the world
--                and for evermore) — THREAD 1 (the pre-existent Son of Adam = goings forth from everlasting)
--        Tanakh: ★ Genesis 49:10 (the sceptre shall not depart from Yahudah... until Shiloh come), ★
--                Genesis 35:19 (Rachel... buried in the way to Ephrath, which is Beth-lehem), ★ Ruth 4:11
--                (do thou worthily in Ephratah, and be famous in Beth-lehem) — THREAD 1
--   ★ v.3 (Therefore will he give them up, until the time that she which travaileth hath brought forth:
--          then the remnant of his brethren shall return unto the children of Yashar'el)
--        NT:     ★ Romans 11:5 (at this present time also there is a remnant according to the election of
--                grace) — THREAD 2
--        Extras: none warranted (the travail/remnant carried by canon witnesses)
--        Tanakh: ★ Isaiah 66:7-8 (Before she travailed, she brought forth... for as soon as Zion
--                travailed, she brought forth her children), ★ Micah 4:10 (Be in pain, and labour to
--                bring forth, O daughter of Zion, like a woman in travail... there Yahuah shall redeem
--                thee) — THREAD 2
--   ★★ v.4-5 (And he shall stand and feed in the strength of Yahuah... great unto the ends of the earth.
--          And this man shall be the peace)
--        NT:     ★★ John 10:11 (I am the good shepherd: the good shepherd giveth his life for the sheep),
--                ★★ Ephesians 2:14 (For he is our peace, who hath made both one) — THREAD 3
--        Extras: ★ 1 Enoch 48:4 (He shall be a staff to the righteous... and he shall be the light of the
--                Gentiles, And the hope of those who are troubled of heart) — THREAD 3
--        Tanakh: ★ Isaiah 9:6 (his name shall be called... Sar Shalom (The Prince of Peace)), ★ Psalm
--                72:8 (He shall have dominion also from sea to sea... unto the ends of the earth) — THREAD 3
--   v.5b-6 (the Assyrian... seven shepherds, and eight principal men... waste the land of Assyria)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose — the deliverance from Assyria is the historical frame of the peace of 5:5
--   ★★ v.7-8 (the remnant of Jacob shall be in the midst of many people as a dew from Yahuah... as a lion
--          among the beasts of the forest)
--        NT:     none warranted distinct (the remnant-among-nations is carried by the Romans-11 remnant of
--                THREAD 2 and the Tanakh dew/lion witnesses here)
--        Extras: none warranted
--        Tanakh: ★ Hosea 14:5 (I will be as the dew unto Yashar'el), ★ Deuteronomy 32:2 (my speech shall
--                distil as the dew... as the showers upon the grass), ★ Psalm 110:3 (thou hast the dew of
--                thy youth), ★ Genesis 49:9 (Yahudah is a lion's whelp) — THREAD 4
--   v.9 (Thine hand shall be lifted up upon thine adversaries, and all thine enemies shall be cut off)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose — the lifted hand transitions into the cutting-off of idols (5:10-15)
--   ★ v.10-15 (I will cut off thy horses... witchcrafts... thy graven images... thy standing images...
--          thy groves... and I will execute vengeance... upon the heathen)
--        NT:     none warranted distinct (the purging of idolatry is rooted in Torah and Zechariah here)
--        Extras: none warranted
--        Tanakh: ★ Exodus 20:3-4 (Thou shalt have no other gods before me... Thou shalt not make unto thee
--                any graven image), ★ Zechariah 13:2 (I will cut off the names of the idols out of the
--                land... and the unclean spirit to pass out of the land) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting
--        — NT (Matthew 2, John 7) + Extras (1 Enoch 48) + Tanakh (Genesis 49, Genesis 35, Ruth 4) [extras]
--      (★★★ THE keystone: Bethlehem-born ruler whose goings forth are from everlasting = the Formed Son
--       pre-existent yet HAS a Father; come forth UNTO the Father; not co-equal, not Arian)
--   2. micah-5-the-remnant-of-his-brethren-shall-return
--        — NT (Romans 11) + Tanakh (Isaiah 66, Micah 4) [free]
--      (★ the travail that ends the giving-up; the remnant/brethren return — two-house regathering)
--   3. micah-5-and-this-man-shall-be-the-peace
--        — NT (John 10, Ephesians 2) + Extras (1 Enoch 48) + Tanakh (Isaiah 9, Psalm 72) [extras]
--      (★★ the Shepherd-ruler feeding in Yahuah's strength, great to the ends of the earth, HE the peace)
--   4. micah-5-the-remnant-of-jacob-as-dew-from-yahuah
--        — Tanakh (Hosea 14, Deuteronomy 32, Psalm 110, Genesis 49) [free]
--      (★★ the remnant among the nations: life-giving dew yet conquering lion)
--   5. micah-5-i-will-cut-off-thy-graven-images
--        — Tanakh (Exodus 20, Zechariah 13) [free]
--      (★ the cleansing of false trusts and idolatry from the restored people)
--
-- Framing notes:
--   ★★★ BETHLEHEM, THE RULER FROM EVERLASTING (THREAD 1): *But thou, Beth-lehem Ephratah, though thou be
--      little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is
--      to be ruler in Yashar'el (Israel); whose goings forth have been from of old, from everlasting*
--      (5:2). The chief priests read this very verse to Herod: *And thou Bethlehem, in the land of Juda,
--      art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule
--      my people Yashar'el (Israel)* (Matthew 2:6); and the crowd: *Hath not the scripture said, That
--      Messiah (Christ) cometh of the seed of David, and out of the town of Bethlehem, where David was?*
--      (John 7:42). Hold the Formed/Formless frame precisely: the ruler comes *forth UNTO ME* — unto the
--      Father — yet his *goings forth* are *from of old, from everlasting*. He is the pre-existent
--      expressed Word drawn from the Formless Most High, who IS Yahuah and HAS a Father; not a second
--      unoriginate, not a co-equal trinitarian person, not Arian. The restored witness names the same
--      pre-existence: *at that hour that Son of Adam was named In the presence of Yahuah (God) of
--      Spirits... before the sun and the signs were created... His name was named* (1 Enoch 48:2-3), *for
--      this reason hath he been chosen and hidden before Him, Before the creation of the world and for
--      evermore* (48:6). The little town is the appointed cradle of the everlasting Ruler — Ephrath where
--      Rachel was buried (*Rachel died, and was buried in the way to Ephrath, which is Beth-lehem*, Genesis
--      35:19), the place the elders blessed (*do thou worthily in Ephratah, and be famous in Beth-lehem*,
--      Ruth 4:11), the line of the sceptre of Judah (*The sceptre shall not depart from Yahudah... until
--      Shiloh come*, Genesis 49:10).
--   ★ THE REMNANT RETURN (THREAD 2): *Therefore will he give them up, until the time that she which
--      travaileth hath brought forth: then the remnant of his brethren shall return unto the children of
--      Yashar'el (Israel)* (5:3). The birth ends the giving-up. The travail is Zion's: *Before she
--      travailed, she brought forth... for as soon as Zion travailed, she brought forth her children*
--      (Isaiah 66:7-8); *Be in pain, and labour to bring forth, O daughter of Zion, like a woman in
--      travail... there Yahuah (LORD) shall redeem thee* (Micah 4:10). The returning *remnant of his
--      brethren* is the two-house regathering — and Paul confirms the remnant stands: *at this present
--      time also there is a remnant according to the election of grace* (Romans 11:5); never a cast-off
--      people, *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1).
--   ★★ HE SHALL BE THE PEACE (THREAD 3): *And he shall stand and feed in the strength of Yahuah (LORD), in
--      the majesty of the name of Yahuah Elohav (the LORD his God); and they shall abide: for now shall he
--      be great unto the ends of the earth. And this man shall be the peace* (5:4-5). The Shepherd-ruler
--      feeds the flock in Yahuah's strength — *I am the good shepherd: the good shepherd giveth his life
--      for the sheep* (John 10:11) — and HE himself is the peace: *For he is our peace, who hath made both
--      one* (Ephesians 2:14), the Prince of Peace, *his name shall be called... Sar Shalom (The Prince of
--      Peace)* (Isaiah 9:6). Note *the name of Yahuah Elohav (the LORD his God)* — the Formed Son who has a
--      Father. His greatness reaches *unto the ends of the earth*: *He shall have dominion also from sea to
--      sea, and from the river unto the ends of the earth* (Psalm 72:8). The restored witness sings the
--      same staff and hope: *He shall be a staff to the righteous... and he shall be the light of the
--      Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4).
--   ★★ THE REMNANT AS DEW AND AS LION (THREAD 4): *And the remnant of Jacob shall be in the midst of many
--      people as a dew from Yahuah (LORD), as the showers upon the grass... as a lion among the beasts of
--      the forest* (5:7-8). Scattered among the nations, the remnant is both life-giving and conquering.
--      The dew is Yahuah's own gift to Israel: *I will be as the dew unto Yashar'el (Israel)* (Hosea
--      14:5); *my speech shall distil as the dew, as the small rain upon the tender herb, and as the
--      showers upon the grass* (Deuteronomy 32:2); *thou hast the dew of thy youth* (Psalm 110:3). The
--      lion is the strength of Judah: *Yahudah (Judah) is a lion's whelp* (Genesis 49:9). The two-house
--      remnant in the nations carries Yahuah's life and Yahuah's might.
--   ★ THE GRAVEN IMAGES CUT OFF (THREAD 5): *Thy graven images also will I cut off, and thy standing images
--      out of the midst of thee; and thou shalt no more worship the work of thine hands* (5:13), with the
--      witchcrafts, soothsayers, and groves (5:12-14). This is the cleansing of false trusts from the
--      restored people, rooted in the first words from Sinai: *Thou shalt have no other gods before me.
--      Thou shalt not make unto thee any graven image* (Exodus 20:3-4) — the Torah affirmed, not abolished.
--      Zechariah sees the same purging in that day: *I will cut off the names of the idols out of the
--      land... and also I will cause the prophets and the unclean spirit to pass out of the land*
--      (Zechariah 13:2).
--   EXTRAS: 1 Enoch 48 (the pre-existent Son of Adam named before creation, the staff and light) woven on
--      the everlasting-ruler keystone and the peace-Shepherd; clean Similitudes witness, parse verified.
--      No extras forced on the remnant-return, the dew/lion, or the idol-cutting.
--   VERSES WITH NO SEPARATE ADD: v.1 (the besieged/smitten judge — prose preface to the ruler of 5:2),
--      v.5b-6 (the Assyrian, seven shepherds — historical frame of the peace), v.9 (the lifted hand —
--      transition into the idol-cutting of 5:10-15), v.10-11 (horses/chariots/cities — woven into THREAD 5
--      with the graven images). All recorded, none silently skipped.

CREATE TEMP VIEW _s333_mic05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): But thou, Beth-lehem Ephratah — the ruler whose goings forth are from everlasting
    ('canon','micah',5,2,'canon','matthew',2,6,'free',
      E'*And thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6). The chief priests quote Micah''s word to Herod when the wise men seek the new-born King: out of little *Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah)* (Micah 5:2) comes the Governor who shall rule. The least town is named the cradle of the Ruler of Yashar''el.'),
    ('canon','micah',5,2,'canon','john',7,42,'free',
      E'*Hath not the scripture said, That Messiah (Christ) cometh of the seed of David, and out of the town of Bethlehem, where David was?* (John 7:42). The crowd cites the same scripture — Micah''s *out of thee shall he come forth... that is to be ruler in Yashar''el (Israel)* (Micah 5:2) — the Messiah is born where David was born, of David''s seed, out of Bethlehem.'),
    ('canon','micah',5,2,'enoch','1-enoch',48,2,'extras',
      E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). The ruler *whose goings forth have been from of old, from everlasting* (Micah 5:2) is the Son of Adam whose name was named in the presence of Yahuah of Spirits before the Head of Days — the pre-existent One, drawn from the Formless Father, who HAS a Father.'),
    ('canon','micah',5,2,'enoch','1-enoch',48,3,'extras',
      E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). Micah''s *from of old, from everlasting* (Micah 5:2) is this very thing: the ruler''s name named *before the sun and the signs were created*. He is the Formed Son brought forth from the Formless Most High before all worlds — not a second unoriginate, not co-equal persons; he comes *forth unto ME [the Father]*.'),
    ('canon','micah',5,2,'enoch','1-enoch',48,6,'extras',
      E'*And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6). The ruler *whose goings forth have been from of old, from everlasting* (Micah 5:2) is the One chosen and hidden *Before the creation of the world* — the pre-existent Word who is Yahuah and yet stands before the Father, hidden until he came forth in Bethlehem.'),
    ('canon','micah',5,2,'canon','genesis',49,10,'free',
      E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The ruler who comes forth from Bethlehem — *among the thousands of Yahudah (Judah)* (Micah 5:2) — is the Shiloh of Jacob''s blessing: the sceptre that does not depart from Judah, to whom the gathering of the people belongs.'),
    ('canon','micah',5,2,'canon','genesis',35,19,'free',
      E'*And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem* (Genesis 35:19). Bethlehem is named Ephrath from of old — *Beth-lehem Ephratah* (Micah 5:2) — the place where Rachel was buried bearing Benjamin; the little town carries the patriarchal weight long before the Ruler comes forth from it.'),
    ('canon','micah',5,2,'canon','ruth',4,11,'free',
      E'*Yahuah (LORD) make the woman that is come into thine house like Rachel and like Leah, which two did build the house of Yashar''el (Israel): and do thou worthily in Ephratah, and be famous in Beth-lehem* (Ruth 4:11). The elders bless Boaz at the gate with the double name of Micah''s town — *Ephratah... Beth-lehem* (Micah 5:2) — and from that house in Bethlehem comes David, and from David''s line the Ruler whose goings forth are from everlasting.'),

    -- THREAD 2 (★): The remnant of his brethren shall return
    ('canon','micah',5,3,'canon','isaiah',66,7,'free',
      E'*Before she travailed, she brought forth; before her pain came, she was delivered of a man child* (Isaiah 66:7). Micah''s *until the time that she which travaileth hath brought forth: then the remnant of his brethren shall return* (Micah 5:3) is Zion''s travail — the birth that precedes the gathering, the man child delivered before the pain came.'),
    ('canon','micah',5,3,'canon','isaiah',66,8,'free',
      E'*Who hath heard such a thing?... Shall the earth be made to bring forth in one day? or shall a nation be born at once? for as soon as Zion travailed, she brought forth her children* (Isaiah 66:8). The travail of Micah 5:3 brings forth a whole people: *as soon as Zion travailed, she brought forth her children* — the *remnant of his brethren* returning to the children of Yashar''el, the two-house regathering.'),
    ('canon','micah',5,3,'canon','micah',4,10,'free',
      E'*Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail... there shalt thou be delivered; there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:10). The travail Micah named one chapter before is the travail of 5:3 — *she which travaileth hath brought forth* — the labour of Zion that ends in redemption and the return of the remnant.'),
    ('canon','micah',5,3,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *The remnant of his brethren shall return unto the children of Yashar''el (Israel)* (Micah 5:3) — the returning remnant Paul confirms still stands: a remnant by grace, never a cast-off people, *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1).'),

    -- THREAD 3 (★★): And this man shall be the peace
    ('canon','micah',5,4,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). Micah''s ruler *shall stand and feed in the strength of Yahuah (LORD)* (Micah 5:4) — the Shepherd who feeds the flock; Yahusha names himself that very Shepherd, the good shepherd who gives his life for the sheep.'),
    ('canon','micah',5,5,'canon','ephesians',2,14,'free',
      E'*For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14). *And this man shall be the peace* (Micah 5:5) — not merely a peacemaker but the peace himself; Paul names him *our peace*, who makes the two houses one. He IS the peace Micah foretold.'),
    ('canon','micah',5,4,'canon','isaiah',9,6,'free',
      E'*For unto us a child is born, unto us a son is given... and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace)* (Isaiah 9:6). The ruler who *shall be great unto the ends of the earth* and is *the peace* (Micah 5:4-5) is the child of Isaiah''s sign, named *Sar Shalom (The Prince of Peace)* — the same everlasting Ruler born to govern.'),
    ('canon','micah',5,4,'canon','psalms',72,8,'free',
      E'*He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalm 72:8). Micah says of the ruler, *now shall he be great unto the ends of the earth* (Micah 5:4) — the same world-wide dominion of the royal Psalm, *from sea to sea... unto the ends of the earth*.'),
    ('canon','micah',5,4,'enoch','1-enoch',48,4,'extras',
      E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4). The ruler who *shall stand and feed in the strength of Yahuah (LORD)* and be *great unto the ends of the earth* (Micah 5:4) is the staff and the light of the restored witness — *the light of the Gentiles, And the hope of those who are troubled of heart*.'),

    -- THREAD 4 (★★): The remnant of Jacob as dew from Yahuah, as a lion
    ('canon','micah',5,7,'canon','hosea',14,5,'free',
      E'*I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon* (Hosea 14:5). *The remnant of Jacob shall be... as a dew from Yahuah (LORD)* (Micah 5:7) — the very dew Hosea promises: Yahuah himself *as the dew unto Yashar''el*, life poured on the scattered remnant.'),
    ('canon','micah',5,7,'canon','deuteronomy',32,2,'free',
      E'*My doctrine shall drop as the rain, my speech shall distil as the dew, as the small rain upon the tender herb, and as the showers upon the grass* (Deuteronomy 32:2). Micah''s remnant is *as a dew from Yahuah (LORD), as the showers upon the grass* (Micah 5:7) — the Song of Moses already named the dew and the showers upon the grass as Yahuah''s own word and gift to his people.'),
    ('canon','micah',5,7,'canon','psalms',110,3,'free',
      E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth* (Psalm 110:3). The remnant *as a dew from Yahuah (LORD)* (Micah 5:7) echoes the dew of the royal-priestly Psalm — the willing people, *the dew of thy youth*, gathered in the day of the Ruler''s power.'),
    ('canon','micah',5,8,'canon','genesis',49,9,'free',
      E'*Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). *The remnant of Jacob shall be among the Gentiles... as a lion among the beasts of the forest* (Micah 5:8) — the lion-strength of Judah from Jacob''s blessing, the remnant that none can deliver from.'),

    -- THREAD 5 (★): I will cut off thy graven images
    ('canon','micah',5,13,'canon','exodus',20,3,'free',
      E'*Thou shalt have no other gods before me* (Exodus 20:3). *Thy graven images also will I cut off... and thou shalt no more worship the work of thine hands* (Micah 5:13) is the first word from Sinai enforced — Yahuah cutting off from his people the other gods he forbade; the Torah affirmed, not abolished.'),
    ('canon','micah',5,13,'canon','exodus',20,4,'free',
      E'*Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:4). Micah''s *thy graven images also will I cut off, and thy standing images out of the midst of thee* (Micah 5:13) is the cleansing of the very thing Sinai forbade — the graven image purged from the restored people.'),
    ('canon','micah',5,13,'canon','zechariah',13,2,'free',
      E'*And it shall come to pass in that day, saith Yahuah Tseva''ot (LORD of hosts), that I will cut off the names of the idols out of the land, and they shall no more be remembered: and also I will cause the prophets and the unclean spirit to pass out of the land* (Zechariah 13:2). The same in-that-day purging as Micah''s *I will cut off thy... graven images* (Micah 5:13) — idols, witchcraft, and unclean spirit removed from the cleansed people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting',
       E'But thou, Beth-lehem Ephratah — the Ruler whose goings forth are from everlasting',
       E'Out of the least of Judah''s towns comes the everlasting Ruler: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting* (Micah 5:2). The chief priests read this exact word to Herod when the wise men seek the new-born King: *And thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6); and the crowd cites it: *Hath not the scripture said, That Messiah (Christ) cometh of the seed of David, and out of the town of Bethlehem, where David was?* (John 7:42). Here is the Formed and the Formless held exactly: the Ruler comes *forth unto me* — unto the Father — yet his *goings forth* are *from of old, from everlasting*. He is the pre-existent expressed Word drawn from the Formless Most High; he IS Yahuah and he HAS a Father — not a second unoriginate, not co-equal trinitarian persons, not Arian. The restored witness names the same pre-existence: *at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days. Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:2-3), *and for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore* (48:6). The little town is the appointed cradle: Ephrath where Rachel was buried (*Rachel died, and was buried in the way to Ephrath, which is Beth-lehem*, Genesis 35:19), the town the elders blessed (*do thou worthily in Ephratah, and be famous in Beth-lehem*, Ruth 4:11), the line of the unfailing sceptre (*The sceptre shall not depart from Yahudah (Judah)... until Shiloh come; and unto him shall the gathering of the people be*, Genesis 49:10).',
       sv.verse_id, ev.verse_id, 'extras', 45456
  FROM _s333_mic05_lookup sv, _s333_mic05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-5-the-remnant-of-his-brethren-shall-return',
       E'The remnant of his brethren shall return — the travail that ends the giving-up',
       E'The birth ends the giving-up and gathers the scattered: *Therefore will he give them up, until the time that she which travaileth hath brought forth: then the remnant of his brethren shall return unto the children of Yashar''el (Israel)* (Micah 5:3). The travail is Zion''s: *Before she travailed, she brought forth; before her pain came, she was delivered of a man child... for as soon as Zion travailed, she brought forth her children* (Isaiah 66:7-8). Micah named that travail one chapter before: *Be in pain, and labour to bring forth, O daughter of Zion, like a woman in travail... there Yahuah (LORD) shall redeem thee from the hand of thine enemies* (Micah 4:10). The returning *remnant of his brethren* is the two-house regathering — and Paul confirms the remnant stands: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5); never a cast-off people, *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1).',
       sv.verse_id, ev.verse_id, 'free', 45459
  FROM _s333_mic05_lookup sv, _s333_mic05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-5-and-this-man-shall-be-the-peace',
       E'And this man shall be the peace — the Shepherd-Ruler great to the ends of the earth',
       E'The Ruler feeds the flock and is himself the peace: *And he shall stand and feed in the strength of Yahuah (LORD), in the majesty of the name of Yahuah Elohav (the LORD his God); and they shall abide: for now shall he be great unto the ends of the earth. And this man shall be the peace* (Micah 5:4-5). He is the Shepherd: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). And he is not merely a peacemaker but the peace himself: *For he is our peace, who hath made both one, and hath broken down the middle wall of partition between us* (Ephesians 2:14) — the two houses made one. He is the child of Isaiah''s sign: *his name shall be called... Sar Shalom (The Prince of Peace)* (Isaiah 9:6); and his greatness reaches *unto the ends of the earth*: *He shall have dominion also from sea to sea, and from the river unto the ends of the earth* (Psalm 72:8). Note the Formed/Formless frame in Micah''s own words — he feeds *in the majesty of the name of Yahuah Elohav (the LORD his God)*: the Son who has a Father. The restored witness sings the same staff and hope: *He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4).',
       sv.verse_id, ev.verse_id, 'extras', 45462
  FROM _s333_mic05_lookup sv, _s333_mic05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-5-the-remnant-of-jacob-as-dew-from-yahuah',
       E'The remnant of Jacob as dew from Yahuah, as a lion among the nations',
       E'Scattered among the nations, the remnant is both life-giving and conquering: *And the remnant of Jacob shall be in the midst of many people as a dew from Yahuah (LORD), as the showers upon the grass, that tarrieth not for man, nor waiteth for the sons of men* (Micah 5:7); *and the remnant of Jacob shall be among the Gentiles in the midst of many people as a lion among the beasts of the forest, as a young lion among the flocks of sheep* (5:8). The dew is Yahuah''s own gift to Israel: *I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon* (Hosea 14:5); the Song of Moses named it first: *my speech shall distil as the dew, as the small rain upon the tender herb, and as the showers upon the grass* (Deuteronomy 32:2); and the royal Psalm: *thou hast the dew of thy youth* (Psalm 110:3). The lion is the strength of Judah from Jacob''s blessing: *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion* (Genesis 49:9). The two-house remnant in the nations carries Yahuah''s life like dew and Yahuah''s might like a lion, *that none can deliver* from.',
       sv.verse_id, ev.verse_id, 'free', 45465
  FROM _s333_mic05_lookup sv, _s333_mic05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-5-i-will-cut-off-thy-graven-images',
       E'I will cut off thy graven images — the cleansing of false trusts',
       E'In that day Yahuah purges every false trust from his restored people: *And it shall come to pass in that day, saith Yahuah (LORD), that I will cut off thy horses out of the midst of thee, and I will destroy thy chariots* (Micah 5:10); *and I will cut off witchcrafts out of thine hand; and thou shalt have no more soothsayers* (5:12); *thy graven images also will I cut off, and thy standing images out of the midst of thee; and thou shalt no more worship the work of thine hands* (5:13); *and I will pluck up thy groves out of the midst of thee* (5:14). This is the first word from Sinai enforced — the Torah affirmed, never abolished: *Thou shalt have no other gods before me. Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:3-4). Zechariah sees the same in-that-day cleansing: *I will cut off the names of the idols out of the land, and they shall no more be remembered: and also I will cause the prophets and the unclean spirit to pass out of the land* (Zechariah 13:2). The trusted horses and chariots, the witchcrafts and soothsayers, the graven and standing images and groves — all cut off, that the people worship the work of their hands no more.',
       sv.verse_id, ev.verse_id, 'free', 45468
  FROM _s333_mic05_lookup sv, _s333_mic05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *out of thee shall come a Governor, that shall rule my people Yashar''el (Israel)* (Matthew 2:6) — the chief priests quote Micah 5:2 to Herod; little Bethlehem is named the cradle of the Ruler.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *That Messiah (Christ) cometh... out of the town of Bethlehem, where David was* (John 7:42) — the crowd cites Micah 5:2; the Messiah of David''s seed born in Bethlehem.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *that Son of Adam was named In the presence of Yahuah (God) of Spirits... before the Head of Days* (1 Enoch 48:2) — the pre-existent Son of Adam = the *goings forth from everlasting* of Micah 5:2.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3) — *from of old, from everlasting* (Micah 5:2): the Formed Son brought forth before all worlds, who comes forth UNTO the Father.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*chosen and hidden before Him, Before the creation of the world and for evermore* (1 Enoch 48:6) — the everlasting Ruler of Micah 5:2 chosen and hidden before creation, until he came forth in Bethlehem.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *The sceptre shall not depart from Yahudah (Judah)... until Shiloh come* (Genesis 49:10) — the ruler from *the thousands of Yahudah* (Micah 5:2) is Jacob''s Shiloh, the unfailing sceptre.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Rachel died, and was buried in the way to Ephrath, which is Beth-lehem* (Genesis 35:19) — *Beth-lehem Ephratah* (Micah 5:2) carries the patriarchal name from of old.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *do thou worthily in Ephratah, and be famous in Beth-lehem* (Ruth 4:11) — the elders'' blessing on Boaz''s house in the double-named town of Micah 5:2, from which David and the everlasting Ruler come.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-but-thou-bethlehem-ephratah-the-ruler-from-everlasting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Before she travailed, she brought forth... she was delivered of a man child* (Isaiah 66:7) — the travail of Micah 5:3 that brings forth before the pain; the man child delivered.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-his-brethren-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *as soon as Zion travailed, she brought forth her children* (Isaiah 66:8) — the travail of Micah 5:3 births a whole people; the remnant returning to the children of Yashar''el.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-his-brethren-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*labour to bring forth, O daughter of Zion, like a woman in travail... there Yahuah (LORD) shall redeem thee* (Micah 4:10) — Micah''s own prior travail-word; the labour of Zion that ends in redemption (Micah 5:3).'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-his-brethren-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *there is a remnant according to the election of grace* (Romans 11:5) — the *remnant of his brethren* (Micah 5:3) still stands; never a cast-off people (Romans 11:1).'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=3
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-his-brethren-shall-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the Ruler who *shall stand and feed in the strength of Yahuah* (Micah 5:4) is the good Shepherd himself.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-and-this-man-shall-be-the-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *For he is our peace, who hath made both one* (Ephesians 2:14) — *this man shall be the peace* (Micah 5:5): not a peacemaker but the peace himself, making the two houses one.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-and-this-man-shall-be-the-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *his name shall be called... Sar Shalom (The Prince of Peace)* (Isaiah 9:6) — the Ruler great to the ends of the earth and *the peace* (Micah 5:4-5) is Isaiah''s Prince of Peace.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-and-this-man-shall-be-the-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *He shall have dominion also from sea to sea... unto the ends of the earth* (Psalm 72:8) — *now shall he be great unto the ends of the earth* (Micah 5:4): the same world-wide dominion of the royal Psalm.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-and-this-man-shall-be-the-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *He shall be a staff to the righteous... and he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4) — the restored witness to the Shepherd-Ruler of Micah 5:4.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-and-this-man-shall-be-the-peace'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will be as the dew unto Yashar''el (Israel)* (Hosea 14:5) — the remnant *as a dew from Yahuah* (Micah 5:7) is Yahuah himself as dew upon his people.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-jacob-as-dew-from-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *my speech shall distil as the dew... as the showers upon the grass* (Deuteronomy 32:2) — the Song of Moses already named the dew and showers of Micah 5:7 as Yahuah''s word and gift.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-jacob-as-dew-from-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou hast the dew of thy youth* (Psalm 110:3) — the remnant-dew of Micah 5:7 echoes the dew of the royal-priestly Psalm, the willing people in the day of power.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-jacob-as-dew-from-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahudah (Judah) is a lion''s whelp... he couched as a lion* (Genesis 49:9) — the remnant *as a lion among the beasts of the forest* (Micah 5:8) carries the lion-strength of Judah from Jacob''s blessing.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=8
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-the-remnant-of-jacob-as-dew-from-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt have no other gods before me* (Exodus 20:3) — the first word from Sinai enforced as Yahuah cuts off the idols of Micah 5:13; the Torah affirmed, not abolished.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-i-will-cut-off-thy-graven-images'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Thou shalt not make unto thee any graven image* (Exodus 20:4) — Micah''s *thy graven images also will I cut off* (Micah 5:13) is the cleansing of the very thing Sinai forbade.'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-i-will-cut-off-thy-graven-images'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will cut off the names of the idols out of the land... and the unclean spirit to pass out of the land* (Zechariah 13:2) — the same in-that-day purging as Micah''s *I will cut off thy... graven images* (Micah 5:13).'
  FROM cross_reference_threads t
  JOIN _s333_mic05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s333_mic05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-5-i-will-cut-off-thy-graven-images'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_6.sql (Micah 6) -----
-- Chapter: Micah 6 — THE COVENANT CONTROVERSY (the rib/lawsuit) and its keystone. Yahuah pleads:
-- *Hear ye, O mountains, the LORD'S controversy... for Yahuah (LORD) hath a controversy with his
-- people, and he will plead with Yashar'el (Israel)* (6:2); *O my people, what have I done unto thee?
-- and wherein have I wearied thee? testify against me* (6:3) — and recounts his saving acts: the
-- exodus, Moses/Aaron/Miriam, Balaam's blocked curse, the crossing from Shittim unto Gilgal (6:4-5).
-- The false bargain escalates — burnt offerings, thousands of rams, rivers of oil, even the firstborn
-- (6:6-7) — and is answered by THE KEYSTONE: *He hath shewed thee, O man, what is good; and what doth
-- Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy
-- Elohim (God)?* (6:8). This is the Torah DISTILLED to its heart — justice, covenant-mercy (chesed),
-- humble walk — the very "weightier matters of the law" Yahusha names (Matthew 23:23), the two great
-- commandments on which *hang all the law and the prophets* (Matthew 22:40). Then the false weights
-- and violent wealth are judged (6:10-12) with the covenant-futility curses (6:13-15) and the statutes
-- of Omri/Ahab (6:16). NOT a rejection of the sacrificial Torah but the heart it has always required;
-- NOT Torah replaced but Torah summed.
-- Tag: mic06   Temp view: _s333_mic06_lookup   Session prefix: s333
-- Sort band: base 45470, step 3 -> threads at 45470, 45473, 45476, 45479, 45482 (5 threads)
-- Source of EVERY row: 'canon','micah',6,v
--
-- Micah 6 coverage:
--   ★ v.1-5 (Yahuah (LORD) hath a controversy with his people... O my people, what have I done unto
--          thee?... For I brought thee up out of the land of Egypt... I sent before thee Moses, Aaron,
--          and Miriam... remember now what Balak king of Moab consulted, and what Balaam... from
--          Shittim unto Gilgal; that ye may know the righteousness of Yahuah (LORD))
--        NT:     none warranted distinct (the covenant-lawsuit "O my people, what have I done unto
--                thee" stands as the Tanakh's own controversy; woven in prose)
--        Extras: none warranted (Balaam witness kept canonical — Numbers 23 itself)
--        Tanakh: ★ Exodus 20:2 (I am Yahuah... which have brought thee out of the land of Egypt) +
--                Numbers 23:8 (How shall I curse, whom Elohim hath not cursed?) + Deuteronomy 23:5
--                (Yahuah... turned the curse into a blessing) + 1 Samuel 12:7 (the righteous acts of
--                Yahuah) — THREAD 1
--   ★★ v.6-7 (Wherewith shall I come before Yahuah... thousands of rams, or... rivers of oil? shall
--          I give my firstborn for my transgression?)
--        NT:     none warranted distinct (the heart-over-ritual fulfillment is carried by Hosea 6:6 →
--                Matthew 9:13/12:7, which the KEYSTONE thread (v.8) bears forward)
--        Extras: ★ Sirach 35:1-3 (He that keepeth the law brings offerings enough... to depart from
--                wickedness is a thing pleasing to Yahuah) — THREAD 2 (true vs ritual worship, clean)
--        Tanakh: ★★ Psalm 51:16-17 (thou desirest not sacrifice... a broken and a contrite heart) +
--                1 Samuel 15:22 (to obey is better than sacrifice) + Hosea 6:6 (I desired mercy, and
--                not sacrifice) + Jeremiah 7:31 (to burn their sons... which I commanded them not) —
--                THREAD 2
--   ★★★ v.8 (He hath shewed thee, O man, what is good... to do justly, and to love mercy, and to
--          walk humbly with thy Elohim) — THE KEYSTONE
--        NT:     ★★★ Matthew 23:23 (the weightier matters of the law, judgment, mercy, and faith) +
--                ★★ Matthew 22:39-40 (Thou shalt love thy neighbour as thyself... On these two
--                commandments hang all the law and the prophets) + ★ James 1:27 (Pure religion... to
--                visit the fatherless and widows... and to keep himself unspotted) — THREAD 3
--        Extras: woven via Sirach in THREAD 2; none forced separately on v.8
--        Tanakh: ★★ Deuteronomy 10:12-13 (what doth Yahuah require of thee, but to fear... to walk in
--                all his ways... to keep the commandments) + ★ Amos 5:24 (let judgment run down as
--                waters, and righteousness as a mighty stream) — THREAD 3
--   ★ v.10-12 (the scant measure that is abominable... the wicked balances... the bag of deceitful
--          weights... the rich men thereof are full of violence)
--        NT:     none warranted distinct (the false-weights judgment is Torah's own standard; woven)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 19:35-36 (Ye shall do no unrighteousness in... weight... Just balances,
--                just weights) + Deuteronomy 25:13-16 (divers weights... an abomination) +
--                Proverbs 11:1 (A false balance is abomination to Yahuah) — THREAD 4
--   v.13-16 (Thou shalt eat, but not be satisfied... Thou shalt sow, but thou shalt not reap... For
--          the statutes of Omri are kept, and all the works of the house of Ahab)
--        NT:     none warranted distinct (covenant-futility curse; woven)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 28:38-40 (Thou shalt carry much seed... but gather little... plant
--                vineyards... but neither drink of the wine... olive trees... but not anoint thyself)
--                + Haggai 1:6 (Ye have sown much, and bring in little) — THREAD 5
--   v.9 (The LORD'S voice crieth unto the city... hear ye the rod, and who hath appointed it) —
--        no separate add; the herald of the judgment that THREADS 4-5 unfold; woven in prose.
--
-- Threads (slug — target libraries):
--   1. micah-6-yahuah-hath-a-controversy-with-his-people — Tanakh (Exodus 20, Numbers 23, Deut 23,
--      1 Samuel 12) [free] (★ the rib/lawsuit; O my people, what have I done — the saving acts recounted)
--   2. micah-6-wherewith-shall-i-come-not-thousands-of-rams — Tanakh (Psalm 51, 1 Samuel 15, Hosea 6,
--      Jeremiah 7) + Extras (Sirach 35) [extras] (★★ the false sacrifice-bargain; heart over ritual)
--   3. micah-6-do-justly-love-mercy-walk-humbly — NT (Matthew 23, Matthew 22, James 1) + Tanakh
--      (Deuteronomy 10, Amos 5) [free] (★★★ THE KEYSTONE; the Torah distilled, the weightier matters)
--   4. micah-6-the-wicked-balances-and-the-bag-of-deceitful-weights — Tanakh (Leviticus 19,
--      Deuteronomy 25, Proverbs 11) [free] (★ false weights judged by Torah's own standard)
--   5. micah-6-thou-shalt-sow-but-not-reap-the-covenant-futility — Tanakh (Deuteronomy 28, Haggai 1)
--      [free] (the futility-curse of covenant-breaking; the statutes of Omri kept)
--
-- Framing notes:
--   ★ THE CONTROVERSY (THREAD 1): Yahuah does not crush; he REASONS. *O my people, what have I done
--      unto thee? and wherein have I wearied thee? testify against me* (6:3) — the wearied-not God who
--      pleads his own saving record: *I brought thee up out of the land of Egypt* (6:4 / Exodus 20:2),
--      the Balaam-curse he turned to blessing (6:5 / Numbers 23:8, Deuteronomy 23:5), *that ye may know
--      the righteousness of Yahuah (LORD)* (6:5) — the very *righteous acts of Yahuah* Samuel set before
--      the people (1 Samuel 12:7). Covenant-lawsuit, conduct within the covenant — never a cast-off
--      people, never ethnic; the redeemed asked to remember who redeemed them.
--   ★★ NOT THOUSANDS OF RAMS (THREAD 2): the escalating bargain — calves, rams, rivers of oil, even
--      *my firstborn for my transgression* (6:7) — cannot buy what Yahuah wants. *Thou desirest not
--      sacrifice... a broken and a contrite heart* (Psalm 51:16-17); *to obey is better than sacrifice*
--      (1 Samuel 15:22); *I desired mercy, and not sacrifice* (Hosea 6:6); and child-sacrifice Yahuah
--      *commanded... not, neither came it into my heart* (Jeremiah 7:31). NOT a rejection of the
--      sacrificial Torah but of the empty heart behind it — Sirach says it plain: *He that keepeth the
--      law brings offerings enough... to depart from wickedness is a thing pleasing to Yahuah* (Sirach
--      35:1,3). The altar always asked for the heart.
--   ★★★ THE KEYSTONE (THREAD 3): *He hath shewed thee, O man, what is good; and what doth Yahuah
--      (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim
--      (God)?* (6:8). This is the Torah DISTILLED, not Torah dismissed — its very phrasing echoes
--      *what doth Yahuah require of thee, but to fear Yahuah... to walk in all his ways... to keep the
--      commandments* (Deuteronomy 10:12-13). Yahusha names this distillation *the weightier matters of
--      the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other
--      undone* (Matthew 23:23) — the tithe AND the weightier; both kept, the heart restored to the
--      whole. It is the two great commandments on which *hang all the law and the prophets* (Matthew
--      22:39-40), the *Pure religion* of *to visit the fatherless and widows... and to keep himself
--      unspotted* (James 1:27), the justice that must *run down as waters* (Amos 5:24). Frame: 6:8 is
--      the Torah's heart, NOT a replacement for it.
--   ★ THE WICKED BALANCES (THREAD 4): the violence is measurable — *the scant measure that is
--      abominable... the wicked balances... the bag of deceitful weights* (6:10-11). Torah set the
--      standard: *Just balances, just weights... shall ye have* (Leviticus 19:36); *Thou shalt not have
--      in thy bag divers weights... an abomination unto Yahuah* (Deuteronomy 25:13,16); *A false balance
--      is abomination to Yahuah* (Proverbs 11:1). The do-justly of v.8 has a ledger.
--   THE FUTILITY CURSE (THREAD 5): *Thou shalt sow, but thou shalt not reap... and sweet wine, but
--      shalt not drink wine* (6:15) — the Deuteronomy-28 covenant-curse for breaking the covenant:
--      *Thou shalt plant vineyards... but shalt neither drink of the wine* (Deuteronomy 28:39); the
--      same emptiness Haggai names — *Ye have sown much, and bring in little* (Haggai 1:6). The curse
--      is the breaking's wage, never the Torah itself.
--   VERSES WITH NO SEPARATE ADD: v.9 (the LORD'S voice crieth unto the city — herald of the judgment
--      THREADS 4-5 unfold; woven in prose). All recorded; no library silently skipped.

CREATE TEMP VIEW _s333_mic06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Yahuah hath a controversy with his people — the rib/lawsuit, the saving acts recounted
    ('canon','micah',6,4,'canon','exodus',20,2,'free',
      E'*I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2). When Yahuah pleads his case — *For I brought thee up out of the land of Egypt, and redeemed thee out of the house of servants* (Micah 6:4) — he names the same exodus that opens the Ten Words. The covenant-lawsuit recounts the redemption first: he is the God who delivered, asking the delivered to testify against him if he has wearied them (6:3).'),
    ('canon','micah',6,5,'canon','numbers',23,8,'free',
      E'*How shall I curse, whom Elohim (God) hath not cursed? or how shall I defy, whom Yahuah (LORD) hath not defied?* (Numbers 23:8). Yahuah bids them *remember now what Balak king of Moab consulted, and what Balaam the son of Beor answered him* (Micah 6:5) — the curse Yahuah would not allow. Balaam''s own mouth confesses he cannot curse whom Yahuah has blessed: another of the saving acts the controversy recounts, *that ye may know the righteousness of Yahuah (LORD)*.'),
    ('canon','micah',6,5,'canon','deuteronomy',23,5,'free',
      E'*Nevertheless Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee* (Deuteronomy 23:5). This is the Balaam episode Micah summons — *what Balak... consulted, and what Balaam... answered him from Shittim unto Gilgal* (Micah 6:5). Torah names the heart of it: the curse turned to blessing *because... he loved thee*. The controversy is a lover''s plea, not a tyrant''s.'),
    ('canon','micah',6,5,'canon','1-samuel',12,7,'free',
      E'*Now therefore stand still, that I may reason with you before Yahuah (LORD) of all the righteous acts of Yahuah (LORD), which he did to you and to your fathers* (1 Samuel 12:7). Micah''s *that ye may know the righteousness of Yahuah (LORD)* (6:5) is Samuel''s same court-scene — Yahuah reasoning with his people over *all the righteous acts* he wrought for them. The lawsuit is rehearsed mercy, the saving record laid out as the ground of the claim.'),

    -- THREAD 2 (★★): Wherewith shall I come — not thousands of rams; the heart over the ritual
    ('canon','micah',6,7,'canon','psalms',51,16,'extras',
      E'*For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering* (Psalm 51:16). The escalating bargain — *thousands of rams, or... ten thousands of rivers of oil* (Micah 6:7) — founders on the same truth David learned: *thou desirest not sacrifice... thou delightest not in burnt offering*. Quantity cannot buy what was never for sale.'),
    ('canon','micah',6,7,'canon','psalms',51,17,'extras',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). Against *shall I give my firstborn for my transgression?* (Micah 6:7), David names the offering Yahuah accepts: *a broken and a contrite heart*. The altar always asked for the heart behind the gift, not the gift heaped higher.'),
    ('canon','micah',6,6,'canon','1-samuel',15,22,'extras',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). The worshipper''s question — *shall I come before him with burnt offerings, with calves of a year old?* (Micah 6:6) — is answered before it is asked: *to obey is better than sacrifice*. The sacrificial Torah stands; the obedient heart is what it was always for.'),
    ('canon','micah',6,7,'canon','hosea',6,6,'extras',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Hosea, Micah''s contemporary, gives the same verdict on the *thousands of rams* (Micah 6:7): *I desired mercy, and not sacrifice*. This is the mercy (chesed) the keystone will require (6:8) — the sacrifice was never the point apart from the heart it covered.'),
    ('canon','micah',6,7,'canon','jeremiah',7,31,'extras',
      E'*And they have built the high places of Tophet... to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31). The bargain''s darkest reach — *shall I give my firstborn for my transgression, the fruit of my body for the sin of my soul?* (Micah 6:7) — names the abomination Yahuah utterly disowns: child-sacrifice he *commanded... not, neither came it into my heart*. The false worship climbs to the unspeakable, and Yahuah rejects it root and branch.'),
    ('canon','micah',6,8,'apocrypha','ecclesiasticus',35,1,'extras',
      E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1). The restored witness reads Micah''s answer exactly: what Yahuah requires (*to do justly, and to love mercy* — Micah 6:8) is not more rams but the kept commandment — *He that keepeth the law brings offerings enough*. Obedience IS the offering.'),
    ('canon','micah',6,8,'apocrypha','ecclesiasticus',35,3,'extras',
      E'*To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation* (Sirach 35:3). Beside *to do justly, and to love mercy, and to walk humbly* (Micah 6:8), Sirach names the same heart: *To depart from wickedness is a thing pleasing to Yahuah*. The walk Yahuah requires is the true propitiation the heaped sacrifices could never be.'),

    -- THREAD 3 (★★★): Do justly, love mercy, walk humbly — THE KEYSTONE, the Torah distilled
    ('canon','micah',6,8,'canon','matthew',23,23,'free',
      E'*Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). Yahusha names Micah''s threefold answer as *the weightier matters of the law* — *judgment, mercy, and faith* set beside *to do justly, and to love mercy, and to walk humbly* (Micah 6:8). And mark his frame: *these ought ye to have done, and not to leave the other undone* — the weightier AND the tithe; the Torah distilled to its heart, never dismissed.'),
    ('canon','micah',6,8,'canon','matthew',22,39,'free',
      E'*And the second is like unto it, Thou shalt love thy neighbour as thyself* (Matthew 22:39). To *do justly* and *love mercy* (Micah 6:8) toward one''s neighbour is the second great commandment — *Thou shalt love thy neighbour as thyself*. Micah''s summary and Yahusha''s are one: the love of neighbour is justice and mercy made flesh.'),
    ('canon','micah',6,8,'canon','matthew',22,40,'free',
      E'*On these two commandments hang all the law and the prophets* (Matthew 22:40). Micah 6:8 is the prophets'' own distillation — and Yahusha says *all the law and the prophets* hang on love of Yahuah and love of neighbour. To *do justly, and to love mercy, and to walk humbly with thy Elohim (God)* is the whole Torah summed on its hinge, not a lighter law set against it.'),
    ('canon','micah',6,8,'canon','james',1,27,'free',
      E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). James gives Micah 6:8 in apostolic dress: to *do justly* and *love mercy* is *to visit the fatherless and widows*, and to *walk humbly* is *to keep himself unspotted from the world*. The same religion the prophet preached — mercy toward the helpless, a clean and humble walk.'),
    ('canon','micah',6,8,'canon','deuteronomy',10,12,'free',
      E'*And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him, and to serve Yahuah Elohayka (the LORD thy God) with all thy heart and with all thy soul* (Deuteronomy 10:12). Micah''s question — *what doth Yahuah (LORD) require of thee?* (6:8) — quotes Moses word for word, and gives Moses'' answer in summary: to fear, to walk in his ways, to love. Micah 6:8 is not new revelation but the Torah''s own heart restated.'),
    ('canon','micah',6,8,'canon','deuteronomy',10,13,'free',
      E'*To keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good* (Deuteronomy 10:13). Moses ends his "what doth Yahuah require" exactly where Micah''s distillation lives: *to keep the commandments... and his statutes... for thy good*. To *do justly, love mercy, walk humbly* (Micah 6:8) IS to keep the commandments from the heart — the Torah distilled, never abolished.'),
    ('canon','micah',6,8,'canon','amos',5,24,'free',
      E'*But let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24). Amos, another contemporary, presses the same justly-doing against empty feasts: *let judgment run down as waters*. Micah''s *do justly* (6:8) is Amos''s flooding justice — the worship Yahuah wants is righteousness in the streets, not melody in the temple.'),

    -- THREAD 4 (★): The wicked balances and the bag of deceitful weights — false weights judged by Torah
    ('canon','micah',6,11,'canon','leviticus',19,36,'free',
      E'*Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36). The fraud Micah judges — *the wicked balances, and... the bag of deceitful weights* (6:11) — breaks Torah''s plain command: *Just balances, just weights... shall ye have*. The do-justly of 6:8 is weighed on a real scale, and the same God who redeemed from Egypt set the standard.'),
    ('canon','micah',6,10,'canon','deuteronomy',25,13,'free',
      E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13). *The scant measure that is abominable* (Micah 6:10) is the *divers weights* Torah forbids — a great stone to buy with, a small to sell — and Deuteronomy calls those who do so *an abomination unto Yahuah* (25:16). The merchant''s bag betrays the heart that will not do justly.'),
    ('canon','micah',6,11,'canon','proverbs',11,1,'free',
      E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). Wisdom states what Micah enforces: *A false balance is abomination to Yahuah*. Against the *wicked balances, and... the bag of deceitful weights* (Micah 6:11), the just weight is Yahuah''s *delight* — justice measured to the gram.'),

    -- THREAD 5: Thou shalt sow but not reap — the covenant-futility curse for breaking the covenant
    ('canon','micah',6,15,'canon','deuteronomy',28,39,'free',
      E'*Thou shalt plant vineyards, and dress them, but shalt neither drink of the wine, nor gather the grapes; for the worms shall eat them* (Deuteronomy 28:39). Micah''s sentence — *thou shalt tread the olives, but thou shalt not anoint thee with oil; and sweet wine, but shalt not drink wine* (6:15) — is the Deuteronomy-28 covenant-curse falling: *plant vineyards... but neither drink of the wine*. The curse is the wage of covenant-breaking, never the Torah itself.'),
    ('canon','micah',6,15,'canon','deuteronomy',28,38,'free',
      E'*Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38). *Thou shalt sow, but thou shalt not reap* (Micah 6:15) is this very curse — *much seed... but... little in*. The futility Micah pronounces is the covenant''s own warning come due upon a people who kept the statutes of Omri instead (6:16).'),
    ('canon','micah',6,14,'canon','haggai',1,6,'free',
      E'*Ye have sown much, and bring in little; ye eat, but ye have not enough; ye drink, but ye are not filled with drink... and he that earneth wages earneth wages to put it into a bag with holes* (Haggai 1:6). Haggai names the same emptiness Micah foretells — *Thou shalt eat, but not be satisfied* (Micah 6:14). When the heart is wrong with Yahuah, the harvest itself turns to a bag with holes; the futility-curse is one across the prophets.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-6-yahuah-hath-a-controversy-with-his-people',
       E'Yahuah hath a controversy with his people — O my people, what have I done unto thee?',
       E'The chapter opens as a lawsuit (a rib): *Hear ye, O mountains, the LORD''S controversy, and ye strong foundations of the earth: for Yahuah (LORD) hath a controversy with his people, and he will plead with Yashar''el (Israel)* (Micah 6:2). But Yahuah does not crush — he REASONS, and he pleads as one wronged who has only loved: *O my people, what have I done unto thee? and wherein have I wearied thee? testify against me* (6:3). Then he recounts his saving acts. The redemption: *For I brought thee up out of the land of Egypt, and redeemed thee out of the house of servants; and I sent before thee Moses, Aaron, and Miriam* (6:4) — the same deliverance that opens the Ten Words, *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt* (Exodus 20:2). The blocked curse: *remember now what Balak king of Moab consulted, and what Balaam the son of Beor answered him* (6:5) — *How shall I curse, whom Elohim (God) hath not cursed?* (Numbers 23:8), for *Yahuah Elohayka (the LORD thy God)... turned the curse into a blessing unto thee, because... he loved thee* (Deuteronomy 23:5). And the crossing *from Shittim unto Gilgal; that ye may know the righteousness of Yahuah (LORD)* (6:5) — Samuel''s same court-scene of *all the righteous acts of Yahuah (LORD), which he did to you and to your fathers* (1 Samuel 12:7). This is covenant-lawsuit, conduct within the covenant: the wearied-not God laying out his record of mercy as the ground of his plea. Never a cast-off people; the redeemed asked only to remember who redeemed them.',
       sv.verse_id, ev.verse_id, 'free', 45470
  FROM _s333_mic06_lookup sv, _s333_mic06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-6-wherewith-shall-i-come-not-thousands-of-rams',
       E'Wherewith shall I come — not thousands of rams; the heart the altar always asked for',
       E'The accused worshipper answers the controversy with a bargain that escalates into the unspeakable: *Wherewith shall I come before Yahuah (LORD), and bow myself before the high Elohim (God)? shall I come before him with burnt offerings, with calves of a year old? Will Yahuah (LORD) be pleased with thousands of rams, or with ten thousands of rivers of oil? shall I give my firstborn for my transgression, the fruit of my body for the sin of my soul?* (Micah 6:6-7). Heap the offering higher, even to child-sacrifice — and still it cannot buy what Yahuah wants. The Tanakh has said so before and again: *thou desirest not sacrifice... The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart* (Psalm 51:16-17); *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). And the darkest rung — child-sacrifice — Yahuah utterly disowns: *to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31). This is NOT the abolition of the sacrificial Torah but the exposure of the empty heart behind it; the altar always asked for the heart it covered. The restored witness reads Micah''s coming answer exactly: *He that keepeth the law brings offerings enough... To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation* (Sirach 35:1,3). Obedience is the offering; the kept commandment is enough.',
       sv.verse_id, ev.verse_id, 'extras', 45473
  FROM _s333_mic06_lookup sv, _s333_mic06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★) — THE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-6-do-justly-love-mercy-walk-humbly',
       E'Do justly, love mercy, walk humbly — the Torah distilled to its heart',
       E'THE KEYSTONE of the chapter and one of the great summaries of the whole Torah: *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Mark first that this is the Torah DISTILLED, not Torah dismissed — its very words quote Moses: *And now, Yashar''el (Israel), what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear Yahuah Elohayka (the LORD thy God), to walk in all his ways, and to love him... To keep the commandments of Yahuah (LORD), and his statutes... for thy good* (Deuteronomy 10:12-13). Justice, covenant-mercy (chesed), and a humble walk ARE the keeping of the commandments from the heart. Amos, Micah''s contemporary, presses the same justice against empty ritual: *let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24). And Yahusha names this threefold summary by its own weight: *Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23) — the weightier matters ARE Micah 6:8, and his frame is decisive: *these ought ye to have done, and not to leave the other undone*. The tithe AND the weightier; the Torah summed, never set aside. It is the two great commandments on which *hang all the law and the prophets* (Matthew 22:39-40), and it is the *Pure religion and undefiled... To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27) — do justly, love mercy, walk humbly, in apostolic dress. Micah 6:8 is the heart of the Torah laid bare, the standard Yahuah always required and never replaced.',
       sv.verse_id, ev.verse_id, 'free', 45476
  FROM _s333_mic06_lookup sv, _s333_mic06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-6-the-wicked-balances-and-the-bag-of-deceitful-weights',
       E'The wicked balances and the bag of deceitful weights — justice measured to the gram',
       E'The do-justly of the keystone has a ledger. Micah arraigns measurable fraud: *Are there yet the treasures of wickedness in the house of the wicked, and the scant measure that is abominable? Shall I count them pure with the wicked balances, and with the bag of deceitful weights? For the rich men thereof are full of violence* (Micah 6:10-12). This breaks Torah''s plain command, given by the God who redeemed them: *Ye shall do no unrighteousness in judgment, in meteyard, in weight, or in measure. Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:35-36). Deuteronomy names the merchant''s trick and its verdict: *Thou shalt not have in thy bag divers weights, a great and a small... For all that do such things... are an abomination unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 25:13,16). And wisdom states it as a fixed law of Yahuah''s delight: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). To do justly is to keep a true scale; the violence of the rich is weighed in grams, and Yahuah finds it abominable.',
       sv.verse_id, ev.verse_id, 'free', 45479
  FROM _s333_mic06_lookup sv, _s333_mic06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=6 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-6-thou-shalt-sow-but-not-reap-the-covenant-futility',
       E'Thou shalt sow, but thou shalt not reap — the covenant-futility curse come due',
       E'The lawsuit ends in sentence — but the sentence is the covenant''s own warning falling, never the Torah turning against the people: *Therefore also will I make thee sick in smiting thee... Thou shalt eat, but not be satisfied... Thou shalt sow, but thou shalt not reap; thou shalt tread the olives, but thou shalt not anoint thee with oil; and sweet wine, but shalt not drink wine* (Micah 6:13-15). These are the Deuteronomy-28 futility-curses for covenant-breaking, word for word in their shape: *Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it... Thou shalt plant vineyards, and dress them, but shalt neither drink of the wine, nor gather the grapes... Thou shalt have olive trees throughout all thy coasts, but thou shalt not anoint thyself with the oil* (Deuteronomy 28:38-40). Haggai names the same emptiness in his own day: *Ye have sown much, and bring in little; ye eat, but ye have not enough... and he that earneth wages earneth wages to put it into a bag with holes* (Haggai 1:6). And the root cause is named plainly: *For the statutes of Omri are kept, and all the works of the house of Ahab, and ye walk in their counsels* (Micah 6:16) — they kept a counterfeit covenant, so the true covenant''s curse came due. The curse is the wage of the breaking, never the inheritance itself.',
       sv.verse_id, ev.verse_id, 'free', 45482
  FROM _s333_mic06_lookup sv, _s333_mic06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt* (Exodus 20:2) — the redemption Yahuah pleads (*I brought thee up out of the land of Egypt*, Micah 6:4) is the same that opens the Ten Words.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=4
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-yahuah-hath-a-controversy-with-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*How shall I curse, whom Elohim (God) hath not cursed?* (Numbers 23:8) — the Balaam-curse Yahuah would not allow, the saving act Micah summons (*what Balaam... answered him*, Micah 6:5).'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-yahuah-hath-a-controversy-with-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah Elohayka (the LORD thy God)... turned the curse into a blessing unto thee, because... he loved thee* (Deuteronomy 23:5) — the heart of the Balaam episode (Micah 6:5); the controversy is a lover''s plea.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-yahuah-hath-a-controversy-with-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the righteous acts of Yahuah (LORD), which he did to you and to your fathers* (1 Samuel 12:7) — Samuel''s same court-scene; *that ye may know the righteousness of Yahuah* (Micah 6:5) is rehearsed mercy laid out as the ground of the claim.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=5
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-yahuah-hath-a-controversy-with-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — answers *shall I come... with burnt offerings, with calves of a year old?* (Micah 6:6); the sacrificial Torah stands, the obedient heart is its point.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou desirest not sacrifice... thou delightest not in burnt offering* (Psalm 51:16) — quantity cannot buy what was never for sale; against *thousands of rams* (Micah 6:7).'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the offering Yahuah accepts, against *shall I give my firstborn for my transgression?* (Micah 6:7).'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — Micah''s contemporary names the mercy (chesed) the keystone will require (Micah 6:8); the same verdict on the *thousands of rams*.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31) — child-sacrifice utterly disowned; the bargain''s darkest rung (*shall I give my firstborn*, Micah 6:7) was never Yahuah''s will.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *He that keepeth the law brings offerings enough... he that takes heed to the commandment offers a peace offering* (Sirach 35:1) — the restored witness reads Micah''s answer (Micah 6:8) exactly: obedience IS the offering.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation* (Sirach 35:3) — the walk Yahuah requires (*walk humbly*, Micah 6:8) is the true propitiation the heaped sacrifices could never be.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-wherewith-shall-i-come-not-thousands-of-rams'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★) — THE KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23) — Yahusha names Micah 6:8 as the weightier matters; the Torah distilled, never dismissed (the weightier AND the tithe).'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *what doth Yahuah Elohayka (the LORD thy God) require of thee, but to fear... to walk in all his ways, and to love him* (Deuteronomy 10:12) — Micah''s *what doth Yahuah require of thee?* (6:8) quotes Moses word for word; not new revelation but the Torah''s heart restated.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *To keep the commandments of Yahuah (LORD), and his statutes, which I command thee this day for thy good* (Deuteronomy 10:13) — Moses ends his "what doth Yahuah require" exactly where Micah 6:8 lives; to do justly/love mercy/walk humbly IS to keep the commandments from the heart.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *On these two commandments hang all the law and the prophets* (Matthew 22:40) — Micah 6:8 is the prophets'' own distillation; the whole Torah summed on its hinge, never a lighter law set against it.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt love thy neighbour as thyself* (Matthew 22:39) — to do justly and love mercy toward one''s neighbour (Micah 6:8) is the second great commandment made flesh.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Pure religion and undefiled... To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27) — Micah 6:8 in apostolic dress: do justly/love mercy = visit the fatherless and widows; walk humbly = keep unspotted.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *let judgment run down as waters, and righteousness as a mighty stream* (Amos 5:24) — Micah''s *do justly* (6:8) is Amos''s flooding justice; the worship Yahuah wants is righteousness in the streets.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=8
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-do-justly-love-mercy-walk-humbly'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36) — the standard the *wicked balances* (Micah 6:11) break, set by the God who redeemed them.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=11
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-the-wicked-balances-and-the-bag-of-deceitful-weights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt not have in thy bag divers weights, a great and a small* (Deuteronomy 25:13) — *the scant measure that is abominable* (Micah 6:10) is the divers weights Torah forbids as *an abomination unto Yahuah* (25:16).'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=10
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-the-wicked-balances-and-the-bag-of-deceitful-weights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1) — wisdom states what Micah enforces against *the bag of deceitful weights* (6:11); the just weight is Yahuah''s delight.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=11
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-the-wicked-balances-and-the-bag-of-deceitful-weights'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Thou shalt plant vineyards, and dress them, but shalt neither drink of the wine, nor gather the grapes* (Deuteronomy 28:39) — Micah''s *sweet wine, but shalt not drink wine* (6:15) is the Deuteronomy-28 covenant-curse falling; the curse is the wage of breaking, never the Torah.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-thou-shalt-sow-but-not-reap-the-covenant-futility'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt carry much seed out into the field, and shalt gather but little in; for the locust shall consume it* (Deuteronomy 28:38) — *Thou shalt sow, but thou shalt not reap* (Micah 6:15) is this curse exactly; covenant warning come due.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=15
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-thou-shalt-sow-but-not-reap-the-covenant-futility'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye have sown much, and bring in little; ye eat, but ye have not enough... wages... into a bag with holes* (Haggai 1:6) — the same emptiness Micah names (*Thou shalt eat, but not be satisfied*, 6:14); the futility-curse is one across the prophets.'
  FROM cross_reference_threads t
  JOIN _s333_mic06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s333_mic06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-6-thou-shalt-sow-but-not-reap-the-covenant-futility'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_micah_7.sql (Micah 7) -----
-- Chapter: Micah 7 — THE BOOK'S CLOSE. The dearth of the godly (*the good man is perished out of
-- the earth*, 7:2); a man's foes are the men of his own house (7:5-6, quoted by Yahusha, Matthew
-- 10:35-36); the posture of waiting faith — *when I fall, I shall arise; when I sit in darkness,
-- Yahuah shall be a light unto me* (7:8) — and the Advocate who pleads the cause (7:9); the
-- regathering from sea to sea (7:11-17); and the climactic mercy-keystone: *Who is a Elohim (God)
-- like unto thee, that pardoneth iniquity... thou wilt cast all their sins into the depths of the
-- sea. Thou wilt perform the truth to Jacob, and the mercy to Abraham, which thou hast sworn unto
-- our fathers from the days of old* (7:18-20). The Abrahamic oath kept to the two-house remnant —
-- NOT replacement (Romans 11). The prophet's very name, Micah = "Who is like Yah," is the question
-- of 7:18 made into a name.
-- Tag: mic07   Temp view: _s333_mic07_lookup
-- Sort band: base 45484, step 3 -> threads at 45484, 45487, 45490, 45493, 45496, 45499 (6 threads)
-- Source of EVERY row: 'canon','micah',7,v
--
-- Micah 7 coverage:
--   ★ v.1-2 (the good man is perished out of the earth: and there is none upright among men)
--        NT:     ★ Romans 3:10-12 (There is none righteous, no, not one... there is none that doeth good) — THREAD 1
--        Extras: none warranted (the dearth-of-godly is carried by the canon witnesses)
--        Tanakh: ★ Psalm 12:1 (the godly man ceaseth; the faithful fail), ★ Isaiah 57:1 (The righteous perisheth) — THREAD 1
--   v.3-4 (the prince asketh, and the judge asketh for a reward... the day of thy watchmen)
--        NT:     none warranted distinct (the corrupt rulers woven into THREAD 1's collapse prose)
--        Extras: none warranted
--        Tanakh: held in prose (the lawsuit against the bribed judges; the visitation day)
--   ★★ v.5-6 (a man's enemies are the men of his own house)
--        NT:     ★★ Matthew 10:35-36 (I am come to set a man at variance against his father... a man's foes shall be they of his own household), ★★ Luke 12:53 (The father shall be divided against the son) — THREAD 2 (Yahusha quotes 7:6)
--        Extras: none warranted
--        Tanakh: held in prose (Micah is the source text Yahusha quotes)
--   ★★★ v.7-9 (when I fall, I shall arise; when I sit in darkness, Yahuah shall be a light... until he plead my cause)
--        NT:     ★★★ John 8:12 (I am the light of the world... shall have the light of life), ★ 1 John 2:1 (we have an advocate with the Father), ★ Romans 8:34 (who also maketh intercession for us) — THREAD 3
--        Extras: ★ Sirach 2:7 (wait for his mercy; go not aside, lest you fall) — THREAD 3
--        Tanakh: ★ Proverbs 24:16 (a just man falleth seven times, and riseth up again), Psalm 37:24 (Though he fall, he shall not be utterly cast down), ★ Isaiah 9:2 (The people that walked in darkness have seen a great light) — THREAD 3
--   v.10-13 (shame shall cover mine enemy... the day that thy walls are to be built)
--        NT:     none warranted distinct (the enemy shamed / the desolation woven into THREAD 4's regathering prose)
--        Extras: none warranted
--        Tanakh: held in prose with the regathering of THREAD 4
--   ★ v.14-17 (Feed thy people with thy rod... as in the days of old... the nations shall lick the dust)
--        NT:     none warranted distinct (the shepherd-feeding/regathering forward-weave held in prose)
--        Extras: ★ Tobit 13:5 (he will gather us out of all nations, among whom he has scattered us) — THREAD 4
--        Tanakh: ★ Isaiah 9:2 used in THREAD 3; the wonders-as-in-Egypt (7:15) woven in THREAD 4 prose
--   ★★★ v.18-20 (Who is a Elohim (God) like unto thee, that pardoneth iniquity... cast all their sins into the depths of the sea... the truth to Jacob, the mercy to Abraham, which thou hast sworn unto our fathers)
--        NT:     ★★★ Luke 1:72-73 (To perform the mercy promised to our fathers... The oath which he sware to our father Abraham), ★★ Hebrews 8:12 (their sins and their iniquities will I remember no more), ★★ Romans 11:27-29 (this is my covenant... when I shall take away their sins... beloved for the fathers' sakes) — THREAD 5 + THREAD 6
--        Extras: ★ Sirach 2:11 (Yahuah is full of compassion and mercy... and forgiveth sins), ★ Tobit 13:2 (he does scourge, and has mercy) — THREAD 5
--        Tanakh: ★★ Exodus 34:6-7 (merciful and gracious... forgiving iniquity and transgression), ★ Psalm 103:12 (As far as the east is from the west, so far hath he removed our transgressions), ★ Isaiah 43:25 (I... am he that blotteth out thy transgressions), ★ Isaiah 38:17 (thou hast cast all my sins behind thy back) — THREAD 5; ★ Genesis 22:16-18 (By myself have I sworn... in thy seed shall all the nations of the earth be blessed) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. micah-7-the-good-man-is-perished-none-upright — NT (Romans 3) + Tanakh (Psalm 12, Isaiah 57) [free]
--      (★ the dearth of the godly; none righteous, no, not one)
--   2. micah-7-a-mans-foes-are-the-men-of-his-own-house — NT (Matthew 10, Luke 12) [free]
--      (★★ quoted by Yahusha; the division the gospel brings, the cost of following)
--   3. micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness — NT (John 8, 1 John 2, Romans 8) + Extras (Sirach 2) + Tanakh (Proverbs 24, Psalm 37, Isaiah 9) [extras]
--      (★★★ the posture of waiting faith; fall-then-rise; the light in darkness; the Advocate pleading the cause)
--   4. micah-7-feed-thy-people-the-flock-of-thine-heritage-gathered — Extras (Tobit 13) + Tanakh (woven) [extras]
--      (★ the shepherd feeds the flock; the regathering from sea to sea, as in the days of Egypt)
--   5. micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea — NT (Hebrews 8) + Extras (Sirach 2, Tobit 13) + Tanakh (Exodus 34, Psalm 103, Isaiah 43, Isaiah 38) [extras]
--      (★★★ THE KEYSTONE: the incomparable pardoning Elohim who drowns sin in the sea, delights in mercy)
--   6. micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept — NT (Luke 1, Romans 11) + Tanakh (Genesis 22) [free]
--      (★★★ the Abrahamic oath kept to the two-house remnant; NOT replacement — Romans 11)
--
-- Framing notes:
--   ★ THE DEARTH OF THE GODLY (THREAD 1): *The good man is perished out of the earth: and there is
--      none upright among men* (7:2). Paul gathers the same verdict — *There is none righteous, no,
--      not one... there is none that doeth good, no, not one* (Romans 3:10-12) — and the Psalter and
--      Isaiah sing it: *the godly man ceaseth; the faithful fail* (Psalm 12:1); *The righteous
--      perisheth, and no man layeth it to heart* (Isaiah 57:1). Covenant-lawsuit against the collapse,
--      never ethnic; the bribed prince and judge (7:3) are the conduct judged.
--   ★★ A MAN'S FOES (THREAD 2): *a man's enemies are the men of his own house* (7:6). Yahusha quotes
--      this very verse: *I am come to set a man at variance against his father... and a man's foes
--      shall be they of his own household* (Matthew 10:35-36); *The father shall be divided against
--      the son* (Luke 12:53). The division the gospel brings, the cost of following — Micah is the
--      source Yahusha lifts.
--   ★★★ WHEN I FALL, I SHALL ARISE (THREAD 3): *when I fall, I shall arise; when I sit in darkness,
--      Yahuah (LORD) shall be a light unto me* (7:8); *until he plead my cause, and execute judgment
--      for me* (7:9). The fall-and-rise is the just man's own portion — *a just man falleth seven
--      times, and riseth up again* (Proverbs 24:16); *Though he fall, he shall not be utterly cast
--      down* (Psalm 37:24). The light in the darkness is the Formed Son: *I am the light of the
--      world... shall have the light of life* (John 8:12); *The people that walked in darkness have
--      seen a great light* (Isaiah 9:2). And the One who pleads the cause is the Advocate — *we have
--      an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1);
--      *who also maketh intercession for us* (Romans 8:34). Sirach: *wait for his mercy; and go not
--      aside, lest you fall* (Sirach 2:7).
--   ★ THE FLOCK FED AND GATHERED (THREAD 4): *Feed thy people with thy rod, the flock of thine
--      heritage* (7:14); the regathering *from sea to sea* (7:12), the wonders *According to the days
--      of thy coming out of the land of Egypt* (7:15). Tobit names the gathering: *he will gather us
--      out of all nations, among whom he has scattered us* (Tobit 13:5) — the two-house ingathering.
--   ★★★ WHO IS A EL LIKE THEE (THREAD 5, KEYSTONE): *Who is a Elohim (God) like unto thee, that
--      pardoneth iniquity... thou wilt cast all their sins into the depths of the sea* (7:18-19).
--      The incomparable pardoning Elohim is the One of Sinai — *merciful and gracious, longsuffering...
--      forgiving iniquity and transgression and sin* (Exodus 34:6-7); *As far as the east is from
--      the west, so far hath he removed our transgressions* (Psalm 103:12); *I, even I, am he that
--      blotteth out thy transgressions... and will not remember thy sins* (Isaiah 43:25); *thou hast
--      cast all my sins behind thy back* (Isaiah 38:17). The new covenant seals it: *their sins and
--      their iniquities will I remember no more* (Hebrews 8:12). Sirach and Tobit add clean witness.
--   ★★★ THE OATH TO THE FATHERS KEPT (THREAD 6): *Thou wilt perform the truth to Jacob, and the
--      mercy to Abraham, which thou hast sworn unto our fathers from the days of old* (7:20). The
--      Benedictus names that oath fulfilled: *To perform the mercy promised to our fathers... The
--      oath which he sware to our father Abraham* (Luke 1:72-73) — the oath of *By myself have I
--      sworn... in thy seed shall all the nations of the earth be blessed* (Genesis 22:16-18). Paul
--      guards it from replacement: *this is my covenant unto them, when I shall take away their
--      sins... as touching the election, they are beloved for the fathers' sakes* (Romans 11:27-28).
--   VERSES WITH NO SEPARATE ADD: v.3-4 (the bribed rulers — woven into THREAD 1), v.10-13 (the
--      enemy shamed, the walls built, the desolation — woven into THREAD 4's regathering), v.16-17
--      (the nations confounded / lick the dust — woven into THREAD 4 prose). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s333_mic07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the good man is perished — none upright
    ('canon','micah',7,2,'canon','romans',3,10,'free',
      E'*As it is written, There is none righteous, no, not one* (Romans 3:10). Micah''s lament — *The good man is perished out of the earth: and there is none upright among men* (Micah 7:2) — is the very verdict Paul gathers from the prophets: *there is none righteous, no, not one*. The dearth of the godly is not Micah''s pessimism alone but the canon''s honest reckoning of the human collapse.'),
    ('canon','micah',7,2,'canon','romans',3,12,'free',
      E'*They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one* (Romans 3:12). Micah''s *there is none upright among men: they all lie in wait for blood* (Micah 7:2) is echoed exactly: *there is none that doeth good, no, not one*. The moral collapse the prophet weeps over is the universal need Paul names.'),
    ('canon','micah',7,2,'canon','psalms',12,1,'free',
      E'*Help, Yahuah (LORD); for the godly man ceaseth; for the faithful fail from among the children of men* (Psalm 12:1). The Psalter sings Micah''s very grief — *The good man is perished out of the earth* (Micah 7:2) — with the same words: *the godly man ceaseth; the faithful fail*. When the faithful fail, the cry turns upward to Yahuah for help.'),
    ('canon','micah',7,2,'canon','isaiah',57,1,'free',
      E'*The righteous perisheth, and no man layeth it to heart: and merciful men are taken away, none considering that the righteous is taken away from the evil to come* (Isaiah 57:1). Isaiah names the same dearth Micah mourns — *the good man is perished* (Micah 7:2) — *The righteous perisheth, and no man layeth it to heart*. The merciful are taken, and no one even notices; this is the moral collapse the prophets weep over together.'),

    -- THREAD 2 (★★): a man's foes are the men of his own house — quoted by Yahusha
    ('canon','micah',7,6,'canon','matthew',10,35,'free',
      E'*For I am come to set a man at variance against his father, and the daughter against her mother, and the daughter in law against her mother in law* (Matthew 10:35). Yahusha quotes Micah directly — *the son dishonoureth the father, the daughter riseth up against her mother, the daughter in law against her mother in law* (Micah 7:6) — *I am come to set a man at variance against his father*. The breakdown of family trust Micah saw in the collapse becomes the very cost of following the Messiah.'),
    ('canon','micah',7,6,'canon','matthew',10,36,'free',
      E'*And a man''s foes shall be they of his own household* (Matthew 10:36). This is Micah 7:6 made the Messiah''s own word — *a man''s enemies are the men of his own house*. The division the gospel brings is no surprise; the prophet foretold the household torn, and Yahusha names it as the cross-bearing of those who love him more than father or mother.'),
    ('canon','micah',7,6,'canon','luke',12,53,'free',
      E'*The father shall be divided against the son, and the son against the father; the mother against the daughter, and the daughter against the mother; the mother in law against her daughter in law, and the daughter in law against her mother in law* (Luke 12:53). Luke gives the same word fuller — Micah''s *a man''s enemies are the men of his own house* (Micah 7:6) drawn out into every household pairing. *I came not to send peace, but a sword* (Matthew 10:34): the loyalty Messiah demands cuts even through blood.'),

    -- THREAD 3 (★★★): when I fall, I shall arise; Yahuah a light in darkness; the Advocate
    ('canon','micah',7,8,'canon','proverbs',24,16,'free',
      E'*For a just man falleth seven times, and riseth up again: but the wicked shall fall into mischief* (Proverbs 24:16). Micah''s confession — *when I fall, I shall arise* (Micah 7:8) — is the just man''s own portion: *a just man falleth seven times, and riseth up again*. The fall is not the end for the righteous; the rising is as sure as the fall.'),
    ('canon','micah',7,8,'canon','psalms',37,24,'free',
      E'*Though he fall, he shall not be utterly cast down: for Yahuah (LORD) upholdeth him with his hand* (Psalm 37:24). The Psalm names what holds the falling man — *when I fall, I shall arise* (Micah 7:8) — *Though he fall, he shall not be utterly cast down: for Yahuah (LORD) upholdeth him with his hand*. The rising is Yahuah''s own hand beneath the righteous.'),
    ('canon','micah',7,8,'canon','john',8,12,'free',
      E'*Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). Micah''s hope in the dark — *when I sit in darkness, Yahuah (LORD) shall be a light unto me* (Micah 7:8) — finds its face in the Formed Son: *I am the light of the world*. The light that comes to the one sitting in darkness is Yahusha himself, the light of life.'),
    ('canon','micah',7,8,'canon','isaiah',9,2,'free',
      E'*The people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* (Isaiah 9:2). Micah''s *when I sit in darkness, Yahuah (LORD) shall be a light unto me* (Micah 7:8) is Isaiah''s great-light prophecy in miniature — *The people that walked in darkness have seen a great light*. The light dawns precisely where the darkness was deepest.'),
    ('canon','micah',7,9,'canon','1-john',2,1,'free',
      E'*My little children, these things write I unto you, that ye sin not. And if any man sin, we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1). Micah waits for the One who *plead my cause, and execute judgment for me* (Micah 7:9); the Advocate is named — *we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous*. The cause the prophet trusts Yahuah to plead is pleaded by the Formed Son before the Father.'),
    ('canon','micah',7,9,'canon','romans',8,34,'free',
      E'*Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us* (Romans 8:34). The prophet bears the indignation *until he plead my cause* (Micah 7:9); Paul names the pleading: the risen Messiah *who also maketh intercession for us*. None can lay a charge against the one whose cause the Advocate pleads.'),
    ('canon','micah',7,7,'apocrypha','ecclesiasticus',2,7,'extras',
      E'*You that fear Yahuah (God), wait for his mercy; and go not aside, lest you fall* (Sirach 2:7). Micah''s posture — *Therefore I will look unto Yahuah (LORD); I will wait for the Elohim (God) of my salvation* (Micah 7:7) — is the very counsel of Sirach: *wait for his mercy; and go not aside, lest you fall*. The waiting faith that looks up through judgment is the wisdom of the fathers.'),

    -- THREAD 4 (★): feed thy people the flock of thine heritage — the regathering
    ('canon','micah',7,12,'apocrypha','tobit',13,5,'extras',
      E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). Micah sees the coming home *from sea to sea, and from mountain to mountain* (Micah 7:12); Tobit names it: *he will gather us out of all nations, among whom he has scattered us*. The flock fed *as in the days of old* (Micah 7:14) is the scattered two-house people gathered back to the heritage.'),
    ('canon','micah',7,14,'apocrypha','tobit',13,5,'extras',
      E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). *Feed thy people with thy rod, the flock of thine heritage, which dwell solitarily in the wood* (Micah 7:14): the Shepherd feeds the scattered flock, and the gathering Tobit names — *gather us out of all nations* — is that very feeding of the heritage brought home.'),

    -- THREAD 5 (★★★ KEYSTONE): who is a El like thee — cast their sins into the depths of the sea
    ('canon','micah',7,18,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). Micah''s question — *Who is a Elohim (God) like unto thee, that pardoneth iniquity... because he delighteth in mercy* (Micah 7:18) — answers itself with the Name proclaimed at Sinai: *merciful and gracious, longsuffering, and abundant in goodness and truth*. The incomparable pardoning Elohim is the One who passed by before Moses.'),
    ('canon','micah',7,18,'canon','exodus',34,7,'free',
      E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7). Micah asks *who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage* (Micah 7:18) — and Sinai already declared it: *forgiving iniquity and transgression and sin*. The pardon Micah marvels at is the covenant-character of Yahuah from the beginning.'),
    ('canon','micah',7,19,'canon','psalms',103,12,'free',
      E'*As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12). Micah''s *thou wilt cast all their sins into the depths of the sea* (Micah 7:19) and the Psalm''s *as far as the east is from the west, so far hath he removed our transgressions* are one mercy: sin put away beyond all recovering, drowned in the sea, removed past the horizon.'),
    ('canon','micah',7,19,'canon','isaiah',43,25,'free',
      E'*I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25). Micah''s *thou wilt cast all their sins into the depths of the sea* (Micah 7:19) is Isaiah''s blotting-out — *I, even I, am he that blotteth out thy transgressions... and will not remember thy sins*. The sins drowned in the sea are the sins remembered no more.'),
    ('canon','micah',7,19,'canon','isaiah',38,17,'free',
      E'*Behold, for peace I had great bitterness: but thou hast in love to my soul delivered it from the pit of corruption: for thou hast cast all my sins behind thy back* (Isaiah 38:17). Hezekiah''s thanksgiving names the same mercy as Micah''s sea — *thou wilt cast all their sins into the depths of the sea* (Micah 7:19); *thou hast cast all my sins behind thy back*. Sin put where Yahuah will never look upon it again.'),
    ('canon','micah',7,18,'canon','hebrews',8,12,'free',
      E'*For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:12). The new-covenant promise seals Micah''s wonder — *who is a Elohim (God) like unto thee, that pardoneth iniquity* (Micah 7:18) — *their sins and their iniquities will I remember no more*. The pardoning Elohim of Micah is the new-covenant Elohim who forgets the sins he has cast into the sea.'),
    ('canon','micah',7,18,'apocrypha','ecclesiasticus',2,11,'extras',
      E'*For Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins, and saves in time of affliction* (Sirach 2:11). Sirach answers Micah''s *who is a Elohim (God) like unto thee, that pardoneth iniquity* (Micah 7:18) in the same Sinai-words — *full of compassion and mercy, longsuffering... and forgiveth sins*. The fathers knew the incomparable pardoning Elohim.'),
    ('canon','micah',7,19,'apocrypha','tobit',13,2,'extras',
      E'*For he does scourge, and has mercy: he leadeth down to hell, and brings up again: neither is there any that can avoid his hand* (Tobit 13:2). Micah''s turning — *He will turn again, he will have compassion upon us; he will subdue our iniquities* (Micah 7:19) — is Tobit''s *he does scourge, and has mercy*. The same hand that brings down brings up; the same Elohim who corrects has compassion.'),

    -- THREAD 6 (★★★): the truth to Jacob, the mercy to Abraham — the sworn oath kept
    ('canon','micah',7,20,'canon','luke',1,72,'free',
      E'*To perform the mercy promised to our fathers, and to remember his holy covenant* (Luke 1:72). Micah closes with the oath — *Thou wilt perform the truth to Jacob, and the mercy to Abraham, which thou hast sworn unto our fathers from the days of old* (Micah 7:20) — and Zacharias names it fulfilled in the Benedictus: *To perform the mercy promised to our fathers, and to remember his holy covenant*. The sworn mercy is kept, not abolished.'),
    ('canon','micah',7,20,'canon','luke',1,73,'free',
      E'*The oath which he sware to our father Abraham* (Luke 1:73). Micah''s *the mercy to Abraham, which thou hast sworn unto our fathers* (Micah 7:20) is the very oath Luke names — *The oath which he sware to our father Abraham*. The Abrahamic oath is the spine the whole story hangs on; the close of Micah is the dawn of the Benedictus.'),
    ('canon','micah',7,20,'canon','genesis',22,16,'free',
      E'*And said, By myself have I sworn, saith Yahuah (LORD), for because thou hast done this thing, and hast not withheld thy son, thine only son* (Genesis 22:16). Micah names *the mercy to Abraham, which thou hast sworn unto our fathers* (Micah 7:20); here is the swearing itself — *By myself have I sworn, saith Yahuah (LORD)*. The oath Micah trusts Yahuah to perform is the oath sworn on Moriah.'),
    ('canon','micah',7,20,'canon','genesis',22,18,'free',
      E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). The sworn *mercy to Abraham* (Micah 7:20) carries the seed-promise — *in thy seed shall all the nations of the earth be blessed*. The truth to Jacob and the mercy to Abraham are the same covenant-word, the seed that blesses all nations, kept from the days of old.'),
    ('canon','micah',7,20,'canon','romans',11,27,'free',
      E'*For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). Micah''s pardoning Elohim who *wilt cast all their sins into the depths of the sea* and *perform the truth to Jacob* (Micah 7:19-20) is Paul''s covenant kept — *this is my covenant unto them, when I shall take away their sins*. The sin-removal and the oath are one covenant, kept to the same people.'),
    ('canon','micah',7,20,'canon','romans',11,28,'free',
      E'*As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28). Micah''s oath *to Jacob... to Abraham, which thou hast sworn unto our fathers* (Micah 7:20) is Paul''s guard against replacement — *beloved for the fathers'' sakes*. The covenant kept to the fathers is not cancelled; the two-house remnant is *beloved*, and *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s333_mic07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s333_mic07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-the-good-man-is-perished-none-upright',
       E'The good man is perished out of the earth — none righteous, no, not one',
       E'Micah opens the book''s close with a lament over the moral collapse: *Woe is me!... the good man is perished out of the earth: and there is none upright among men: they all lie in wait for blood; they hunt every man his brother with a net* (Micah 7:1-2). The prince and the judge are bought — *the prince asketh, and the judge asketh for a reward* (7:3) — and the best of them is a brier (7:4). This is the canon''s honest verdict on the human heart, and Paul gathers the prophets into it: *As it is written, There is none righteous, no, not one... there is none that doeth good, no, not one* (Romans 3:10-12). The Psalter sings the same grief — *Help, Yahuah (LORD); for the godly man ceaseth; for the faithful fail from among the children of men* (Psalm 12:1) — and Isaiah: *The righteous perisheth, and no man layeth it to heart: and merciful men are taken away* (Isaiah 57:1). It is covenant-lawsuit over conduct, never ethnic hatred; the dearth of the godly is the very darkness against which the chapter''s waiting faith and pardoning mercy will shine.',
       sv.verse_id, ev.verse_id, 'free', 45484
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-a-mans-foes-are-the-men-of-his-own-house',
       E'A man''s foes are the men of his own house — the word Yahusha quotes',
       E'In the collapse even the nearest bonds fail: *Trust ye not in a friend, put ye not confidence in a guide... For the son dishonoureth the father, the daughter riseth up against her mother, the daughter in law against her mother in law; a man''s enemies are the men of his own house* (Micah 7:5-6). Yahusha takes this very verse and makes it the cost of following him: *Think not that I am come to send peace on earth: I came not to send peace, but a sword. For I am come to set a man at variance against his father, and the daughter against her mother, and the daughter in law against her mother in law. And a man''s foes shall be they of his own household* (Matthew 10:34-36). Luke draws it out household by household: *The father shall be divided against the son, and the son against the father; the mother against the daughter... the daughter in law against her mother in law* (Luke 12:53). The division the gospel brings is no new thing — Micah foresaw the torn household — and the loyalty the Messiah demands cuts even through blood, for *He that loveth father or mother more than me is not worthy of me* (Matthew 10:37).',
       sv.verse_id, ev.verse_id, 'free', 45487
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness',
       E'When I fall, I shall arise — Yahuah a light in darkness, the Advocate who pleads',
       E'Against the dearth and the torn household, Micah turns the soul upward in waiting faith: *Therefore I will look unto Yahuah (LORD); I will wait for the Elohim (God) of my salvation: my Elohim (God) will hear me. Rejoice not against me, O mine enemy: when I fall, I shall arise; when I sit in darkness, Yahuah (LORD) shall be a light unto me. I will bear the indignation of Yahuah (LORD), because I have sinned against him, until he plead my cause, and execute judgment for me: he will bring me forth to the light, and I shall behold his righteousness* (Micah 7:7-9). The fall-and-rise is the just man''s own portion: *a just man falleth seven times, and riseth up again* (Proverbs 24:16); *Though he fall, he shall not be utterly cast down: for Yahuah (LORD) upholdeth him with his hand* (Psalm 37:24). The light that comes to the one who sits in darkness is the Formed Son himself: *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12); *The people that walked in darkness have seen a great light* (Isaiah 9:2). And the One trusted to *plead my cause* is the Advocate — *we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1); *It is Messiah (Christ) that died, yea rather, that is risen again... who also maketh intercession for us* (Romans 8:34). The fathers counsel the same posture: *You that fear Yahuah (God), wait for his mercy; and go not aside, lest you fall* (Sirach 2:7). Faith waits through the indignation until vindication, knowing the rising and the light are sure.',
       sv.verse_id, ev.verse_id, 'extras', 45490
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-feed-thy-people-the-flock-of-thine-heritage-gathered',
       E'Feed thy people, the flock of thine heritage — gathered as in the days of old',
       E'The prophet prays for the Shepherd to feed and gather the scattered flock: *Feed thy people with thy rod, the flock of thine heritage, which dwell solitarily in the wood, in the midst of Carmel: let them feed in Bashan and Gilead, as in the days of old. According to the days of thy coming out of the land of Egypt will I shew unto him marvellous things* (Micah 7:14-15). The regathering reaches from every quarter — *In that day also he shall come even to thee from Assyria, and from the fortified cities... and from sea to sea, and from mountain to mountain* (7:12) — the very lands of the northern exile, the two-house people brought home. The restored witness names the same gathering: *he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). The Shepherd who feeds the heritage *as in the days of old*, working wonders *According to the days of thy coming out of the land of Egypt*, is gathering the scattered sheep — and the nations who see it *shall lay their hand upon their mouth* (7:16) and *be afraid of Yahuah Eloheinu (the LORD our God)* (7:17).',
       sv.verse_id, ev.verse_id, 'extras', 45493
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea',
       E'Who is a El like thee — that casteth all their sins into the depths of the sea',
       E'Here is the book''s climactic wonder, and the prophet''s own name made into a question — Micah means *Who is like Yah*: *Who is a Elohim (God) like unto thee, that pardoneth iniquity, and passeth by the transgression of the remnant of his heritage? he retaineth not his anger for ever, because he delighteth in mercy. He will turn again, he will have compassion upon us; he will subdue our iniquities; and thou wilt cast all their sins into the depths of the sea* (Micah 7:18-19). The incomparable pardoning Elohim is the One whose Name was proclaimed at Sinai: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth, Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:6-7). The sin cast into the sea is the sin removed past all recovering: *As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12); *I, even I, am he that blotteth out thy transgressions for mine own sake, and will not remember thy sins* (Isaiah 43:25); *thou hast cast all my sins behind thy back* (Isaiah 38:17). The new covenant seals it: *I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:12). The fathers knew this Elohim too — *Yahuah (God) is full of compassion and mercy, longsuffering, and very pitiful, and forgiveth sins* (Sirach 2:11); *he does scourge, and has mercy: he leadeth down to hell, and brings up again* (Tobit 13:2). There is none like him: he delights in mercy and drowns sin in the depths.',
       sv.verse_id, ev.verse_id, 'extras', 45496
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept',
       E'The truth to Jacob, the mercy to Abraham — the sworn oath kept, not replaced',
       E'The book ends on the sworn covenant-faithfulness to the fathers: *Thou wilt perform the truth to Jacob, and the mercy to Abraham, which thou hast sworn unto our fathers from the days of old* (Micah 7:20). This is the oath of Moriah — *By myself have I sworn, saith Yahuah (LORD)... in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:16,18) — the seed-promise carried by paternal bloodline and covenant-word together. Zacharias names it kept at the dawn of the gospel: *Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people... To perform the mercy promised to our fathers, and to remember his holy covenant; The oath which he sware to our father Abraham* (Luke 1:68,72-73). And Paul guards it from every replacement reading: *For this is my covenant unto them, when I shall take away their sins... As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes* (Romans 11:27-28), *For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). The sin-removal of 7:19 and the sworn oath of 7:20 are one covenant, kept to the same two-house remnant — Yahuah does not cast away his people, but performs to Jacob and Abraham the mercy he swore from the days of old.',
       sv.verse_id, ev.verse_id, 'free', 45499
  FROM _s333_mic07_lookup sv, _s333_mic07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='micah' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *There is none righteous, no, not one* (Romans 3:10) — Paul gathers the prophets into Micah''s verdict that *the good man is perished out of the earth* (Micah 7:2).'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-good-man-is-perished-none-upright'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *there is none that doeth good, no, not one* (Romans 3:12) — echoes *there is none upright among men* (Micah 7:2); the moral collapse is the universal need.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-good-man-is-perished-none-upright'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the godly man ceaseth; the faithful fail from among the children of men* (Psalm 12:1) — the Psalter sings Micah''s grief (Micah 7:2) and turns it into a cry for help.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-good-man-is-perished-none-upright'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The righteous perisheth, and no man layeth it to heart* (Isaiah 57:1) — Isaiah names the same dearth Micah mourns (Micah 7:2); the merciful are taken and no one notices.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-good-man-is-perished-none-upright'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am come to set a man at variance against his father... and the daughter in law against her mother in law* (Matthew 10:35) — Yahusha quotes Micah 7:6 directly; the torn household becomes the cost of following him.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-a-mans-foes-are-the-men-of-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *And a man''s foes shall be they of his own household* (Matthew 10:36) — Micah 7:6 made the Messiah''s own word; the division the gospel brings is no surprise.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-a-mans-foes-are-the-men-of-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The father shall be divided against the son... the daughter in law against her mother in law* (Luke 12:53) — Micah 7:6 drawn out household by household; the loyalty Messiah demands cuts through blood.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=6
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-a-mans-foes-are-the-men-of-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a just man falleth seven times, and riseth up again* (Proverbs 24:16) — the fall-and-rise of *when I fall, I shall arise* (Micah 7:8) is the just man''s own portion.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Though he fall, he shall not be utterly cast down: for Yahuah (LORD) upholdeth him with his hand* (Psalm 37:24) — the rising of Micah 7:8 is Yahuah''s own hand beneath the righteous.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *I am the light of the world... shall have the light of life* (John 8:12) — *when I sit in darkness, Yahuah (LORD) shall be a light unto me* (Micah 7:8) finds its face in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The people that walked in darkness have seen a great light* (Isaiah 9:2) — the light dawns where the darkness was deepest, as in Micah 7:8.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *we have an advocate with the Father, Yahusha HaMashiach (Jesus Christ) the righteous* (1 John 2:1) — the One who *plead my cause* (Micah 7:9) is the Advocate before the Father.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*who also maketh intercession for us* (Romans 8:34) — the risen Messiah pleads the cause Micah 7:9 trusts Yahuah to plead; none can lay a charge.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *wait for his mercy; and go not aside, lest you fall* (Sirach 2:7) — the waiting faith of *I will wait for the Elohim (God) of my salvation* (Micah 7:7) is the wisdom of the fathers.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=7
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-when-i-fall-i-shall-arise-yahuah-a-light-in-darkness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he will gather us out of all nations, among whom he has scattered us* (Tobit 13:5) — the regathering *from sea to sea* (Micah 7:12) is the two-house people brought home.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=12
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-feed-thy-people-the-flock-of-thine-heritage-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*will gather us out of all nations, among whom he has scattered us* (Tobit 13:5) — the Shepherd feeding *the flock of thine heritage* (Micah 7:14) is that gathering of the scattered sheep.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=14
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-feed-thy-people-the-flock-of-thine-heritage-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — Micah''s question *who is a Elohim (God) like unto thee, that pardoneth iniquity* (Micah 7:18) is answered by the Name proclaimed at Sinai.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *forgiving iniquity and transgression and sin* (Exodus 34:7) — the pardon Micah marvels at (Micah 7:18) is Yahuah''s covenant-character from the beginning.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *As far as the east is from the west, so far hath he removed our transgressions from us* (Psalm 103:12) — the sin *cast into the depths of the sea* (Micah 7:19) is sin removed past all recovering.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I, even I, am he that blotteth out thy transgressions... and will not remember thy sins* (Isaiah 43:25) — the sins drowned in the sea (Micah 7:19) are the sins remembered no more.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou hast cast all my sins behind thy back* (Isaiah 38:17) — Hezekiah names the same mercy as Micah''s sea (Micah 7:19): sin put where Yahuah will never look upon it.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *their sins and their iniquities will I remember no more* (Hebrews 8:12) — the new covenant seals Micah''s wonder (Micah 7:18); the pardoning Elohim forgets the sin he has cast into the sea.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Yahuah (God) is full of compassion and mercy, longsuffering... and forgiveth sins* (Sirach 2:11) — the fathers knew the incomparable pardoning Elohim of Micah 7:18 in the same Sinai-words.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*he does scourge, and has mercy: he leadeth down to hell, and brings up again* (Tobit 13:2) — Micah''s turning *he will have compassion upon us; he will subdue our iniquities* (Micah 7:19) is the same hand that corrects and then has compassion.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-who-is-a-el-like-thee-cast-their-sins-into-the-sea'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *To perform the mercy promised to our fathers, and to remember his holy covenant* (Luke 1:72) — Micah''s sworn oath (Micah 7:20) named fulfilled in the Benedictus.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=72
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The oath which he sware to our father Abraham* (Luke 1:73) — Micah''s *the mercy to Abraham, which thou hast sworn* (Micah 7:20) is the very oath Luke names.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=73
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*By myself have I sworn, saith Yahuah (LORD)* (Genesis 22:16) — the oath of Moriah is the swearing Micah 7:20 trusts Yahuah to perform.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*in thy seed shall all the nations of the earth be blessed* (Genesis 22:18) — the sworn mercy to Abraham (Micah 7:20) carries the seed-promise that blesses all nations.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*this is my covenant unto them, when I shall take away their sins* (Romans 11:27) — the sin-removal of Micah 7:19 and the sworn oath of 7:20 are one covenant, kept to the same people.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *beloved for the fathers'' sakes* (Romans 11:28) — Micah''s oath to the fathers (Micah 7:20) is Paul''s guard against replacement; the covenant kept, never cancelled.'
  FROM cross_reference_threads t
  JOIN _s333_mic07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s333_mic07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='micah-7-the-truth-to-jacob-the-mercy-to-abraham-the-oath-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session333 — Micah cross-references complete.'
