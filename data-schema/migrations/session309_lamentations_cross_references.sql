-- =====================================================================
-- Session 309 — Lamentations FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session309_lamentations_cross_references.sql
-- =====================================================================

\echo 'session309 — Lamentations cross-references starting...'
BEGIN;

-- ----- fragment: minion_lamentations_1.sql (Lamentations 1) -----
-- Chapter: Lamentations 1 — the dirge over fallen Jerusalem. *How doth the city sit solitary, that
-- was full of people! how is she become as a widow!* The bride become a widow; her lovers (her
-- foreign allies) have all dealt treacherously and turned enemies; *among all her lovers she hath
-- none to comfort her*. At the center she holds up her grief before the passers-by: *Is it nothing
-- to you, all ye that pass by? behold, and see if there be any sorrow like unto my sorrow* — the
-- sorrow without compare, reaching forward toward the One reviled by them that passed by. And the
-- just confession: *Yahuah (LORD) is righteous; for I have rebelled against his commandment* — the
-- punishment owned as deserved, Yahuah the righteous Judge confessed. The covenant-lawsuit verdict
-- of Deuteronomy 28 fallen, NEVER the Torah as the curse; the desolate widow yet to be restored
-- (Isaiah 54), the sorrow held up toward the cross, the righteous Judge confessed.
-- Tag: lam01   Temp view: _s309_lam01_lookup   Session: s309
-- Sort band: base 35400, step 3 -> threads at 35400, 35403, 35406 (3 threads)
-- Source of EVERY row: 'canon','lamentations',1,v
--
-- Lamentations 1 coverage:
--   ★★ v.1-2 (How doth the city sit solitary... how is she become as a widow!... she weepeth sore
--          in the night... among all her lovers she hath none to comfort her: all her friends have
--          dealt treacherously with her, they are become her enemies)
--        NT:     ★ Revelation 18:7 (I sit a queen, and am no widow — the INVERSE: Babylon''s boast
--                against the widowed city) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 54:1,4-6 (Sing, O barren... the children of the desolate... thou shalt
--                forget the reproach of thy widowhood... Yahuah hath called thee as a woman forsaken
--                — the forsaken widow yet to be restored), ★ Jeremiah 30:14 (All thy lovers have
--                forgotten thee — lateral), ★ Ezekiel 16:37 (I will gather all thy lovers... against
--                thee — the lovers turned enemies) — THREAD 1
--   v.3-11 (Yahudah is gone into captivity; the ways of Zion mourn, none come to the solemn feasts;
--          Yahuah hath afflicted her for the multitude of her transgressions; Jerusalem hath
--          grievously sinned; the heathen entered into her sanctuary)
--        NT:     none warranted distinct (the desolation of the feasts and sanctuary; the cause
--                =transgression woven in THREAD 1 prose and answered fully in THREAD 3''s confession)
--        Extras: none warranted
--        Tanakh: held in prose — the covenant-curse of Deuteronomy 28 fallen (the cause named in v.5,
--                v.8; the just verdict gathered into THREAD 3, the desolation into THREAD 1)
--   ★★ v.12 (Is it nothing to you, all ye that pass by? behold, and see if there be any sorrow like
--          unto my sorrow... wherewith Yahuah hath afflicted me in the day of his fierce anger)
--        NT:     ★★ Matthew 27:39 (they that passed by reviled him, wagging their heads — the
--                Messiah''s suffering held up before the passers-by) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 53:3-4 (a man of sorrows, and acquainted with grief... we esteemed him
--                not... he hath borne our griefs, and carried our sorrows), ★ Daniel 9:12 (under the
--                whole heaven hath not been done as hath been done upon Jerusalem — the sorrow without
--                compare) — THREAD 2
--   v.13-17 (From above hath he sent fire into my bones; the yoke of my transgressions is bound by
--          his hand; Yahuah hath trodden the virgin... as in a winepress; the comforter is far)
--        NT:     none warranted distinct (the winepress imagery held to Isaiah 63 / Revelation 14,
--                not forced here; the no-comforter motif woven in THREAD 1)
--        Extras: none warranted
--        Tanakh: none separate (the affliction-by-Yahuah''s-hand; the cause =transgression carried
--                into THREAD 3''s confession; the missing comforter into THREAD 1)
--   ★ v.18 (Yahuah is righteous; for I have rebelled against his commandment: hear, I pray you, all
--          people, and behold my sorrow)
--        NT:     none warranted (the righteousness-of-Elohim-in-judgment confession is a Tanakh
--                covenant-prayer motif; no NT add forced — Romans 3:4 held lightly under Psalm 51)
--        Extras: none warranted
--        Tanakh: ★★ Daniel 9:7,14 (righteousness belongeth unto thee, but unto us confusion of
--                faces... Yahuah Eloheinu is righteous in all his works), ★★ Nehemiah 9:33 (thou art
--                just in all that is brought upon us; thou hast done right, but we have done wickedly),
--                ★ Psalm 51:4 (that thou mightest be justified when thou speakest) — THREAD 3
--   v.19-22 (I called for my lovers, but they deceived me; behold, O Yahuah, for I am in distress;
--          for I have grievously rebelled; let all their wickedness come before thee)
--        NT:     none warranted (the imprecation against the gloating enemy held to the Psalms;
--                not forced here)
--        Extras: none warranted
--        Tanakh: held in prose — the lovers'' deceit (v.19) sealed into THREAD 1; the renewed
--                confession *I have grievously rebelled* (v.20) into THREAD 3
--
-- Threads (slug — target libraries):
--   1. lamentations-1-the-city-become-a-widow-her-lovers-have-failed — NT (Revelation 18) + Tanakh
--      (Isaiah 54, Jeremiah 30, Ezekiel 16) [free]
--      (★★ the desolate city, the bride become a widow, her allies/lovers failed and turned enemies —
--       the forsaken widow yet to be restored, against Babylon''s widow-less boast)
--   2. lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by — NT (Matthew 27) + Tanakh (Isaiah 53,
--      Daniel 9) [free]
--      (★★ the unparalleled sorrow held up before the passers-by — the city''s grief reaching forward
--       to the Man of sorrows reviled by them that passed by; the sorrow without compare)
--   3. lamentations-1-yahuah-is-righteous-for-i-have-rebelled — Tanakh (Daniel 9, Nehemiah 9,
--      Psalm 51) [free]
--      (★ the just confession — Yahuah is righteous, the punishment deserved; the covenant-curse of
--       Deuteronomy 28 fallen, the righteous Judge confessed, NEVER the Torah as the curse)
--
-- Framing notes:
--   ★★ THE WIDOWED CITY, HER LOVERS FAILED (THREAD 1): *How doth the city sit solitary, that was full
--      of people! how is she become as a widow!... She weepeth sore in the night, and her tears are on
--      her cheeks: among all her lovers she hath none to comfort her: all her friends have dealt
--      treacherously with her, they are become her enemies* (1:1-2). The bride of Yahuah is become a
--      widow; her "lovers" — the foreign allies she trusted instead of Yahuah — have all failed and
--      turned enemies. Jeremiah names the same betrayal: *All thy lovers have forgotten thee; they
--      seek thee not* (Jeremiah 30:14); Ezekiel makes the lovers her judges: *I will gather all thy
--      lovers, with whom thou hast taken pleasure... against thee* (Ezekiel 16:37). Babylon boasts the
--      INVERSE — *I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7) — and is
--      thrown down for it; the widowed city, who knows her sorrow, is the one Yahuah will yet restore.
--      For the widowhood is not the end: *Fear not... thou shalt forget the shame of thy youth, and
--      shalt not remember the reproach of thy widowhood any more. For thy Maker is thine husband...
--      For Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit* (Isaiah 54:4-6),
--      *for more are the children of the desolate than the children of the married wife* (Isaiah 54:1).
--      The forsaken widow is the wife Yahuah re-gathers — the two-house bride restored.
--   ★★ THE SORROW WITHOUT COMPARE (THREAD 2): *Is it nothing to you, all ye that pass by? behold, and
--      see if there be any sorrow like unto my sorrow, which is done unto me, wherewith Yahuah (LORD)
--      hath afflicted me in the day of his fierce anger* (1:12). The city holds her grief up before
--      the passers-by — a sorrow she says is without compare. Daniel confirms it: *under the whole
--      heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12). And the words reach
--      forward to the One held up before the passers-by at Golgotha: *And they that passed by reviled
--      him, wagging their heads* (Matthew 27:39) — the Man of sorrows of whom Isaiah sang, *He is
--      despised and rejected of men; a man of sorrows, and acquainted with grief... we esteemed him
--      not. Surely he hath borne our griefs, and carried our sorrows* (Isaiah 53:3-4). The city''s
--      unparalleled grief is a type of the sorrow He bore — the passers-by who see no sorrow like it,
--      and the Sufferer they pass by and revile. Held Come-and-See: the grief of Zion reaching toward
--      the cross.
--   ★ THE JUST CONFESSION — YAHUAH IS RIGHTEOUS (THREAD 3): *Yahuah (LORD) is righteous; for I have
--      rebelled against his commandment: hear, I pray you, all people, and behold my sorrow* (1:18).
--      Even in the dirge, the city owns the verdict as just: the punishment is deserved, for she
--      *rebelled against his commandment*. This is the covenant-lawsuit confession — the Deuteronomy
--      28 curse fallen for covenant-breaking, NEVER the Torah itself made the curse. Daniel prays it
--      word for word: *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of
--      faces* (Daniel 9:7), *Yahuah Eloheinu (the LORD our God) is righteous in all his works which he
--      doeth: for we obeyed not his voice* (Daniel 9:14). Nehemiah seals it: *thou art just in all
--      that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33).
--      And the penitent of Psalm 51 names the principle: *that thou mightest be justified when thou
--      speakest, and be clear when thou judgest* (Psalm 51:4). The righteous Judge is confessed — the
--      rebellion owned, the Torah upheld, Yahuah cleared. The verses with no separate add are gathered
--      here or in THREADs 1-2: v.3-11 (the desolation, the cause =transgression — THREADs 1/3),
--      v.13-17 (the affliction by Yahuah''s hand, the winepress held to Isaiah 63 — THREAD 3/1 prose),
--      v.19-22 (the lovers'' deceit — THREAD 1; the renewed confession *I have grievously rebelled*,
--      v.20 — THREAD 3; the imprecation against the gloating enemy held to the Psalms). Every block
--      recorded above; every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_lam01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): the city become a widow — her lovers have failed and turned enemies
    ('canon','lamentations',1,1,'canon','isaiah',54,4,'free',
      E'*Fear not; for thou shalt not be ashamed: neither be thou confounded; for thou shalt not be put to shame: for thou shalt forget the shame of thy youth, and shalt not remember the reproach of thy widowhood any more* (Isaiah 54:4). The city that *is become as a widow* (Lamentations 1:1) is the very widow Yahuah promises to restore: she shall *not remember the reproach of thy widowhood any more*. The widowhood is not the end of the bride; it is the night before her re-gathering.'),
    ('canon','lamentations',1,1,'canon','isaiah',54,1,'free',
      E'*Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD)* (Isaiah 54:1). The city *that was full of people* now *sit[s] solitary* (Lamentations 1:1) — yet to the desolate Yahuah promises MORE children than the married wife. The emptied city is the barren one called to sing, for her ingathering will overflow.'),
    ('canon','lamentations',1,1,'canon','isaiah',54,5,'free',
      E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel); The Elohim (God) of the whole earth shall he be called* (Isaiah 54:5). The widowed city of Lamentations 1:1 has not lost her husband: *thy Maker is thine husband*. The widowhood is the estrangement of the exile, not a final divorce; the Redeemer who is her husband will gather her home.'),
    ('canon','lamentations',1,1,'canon','isaiah',54,6,'free',
      E'*For Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused, saith thy Elohim (God)* (Isaiah 54:6). The forsaken widow of Lamentations 1:1 — *grieved in spirit*, who *weepeth sore in the night* (1:2) — is the *woman forsaken* whom Yahuah CALLS back. The grief is real, but it is the grief of a wife being recalled, not cast off for ever.'),
    ('canon','lamentations',1,2,'canon','jeremiah',30,14,'free',
      E'*All thy lovers have forgotten thee; they seek thee not; for I have wounded thee with the wound of an enemy, with the chastisement of a cruel one, for the multitude of thine iniquity; because thy sins were increased* (Jeremiah 30:14). Jeremiah names the same failed allies: as Lamentations mourns *among all her lovers she hath none to comfort her* (1:2), Jeremiah says *All thy lovers have forgotten thee*. The lovers are the foreign confederacies she trusted instead of Yahuah — and they cannot heal the wound He sent.'),
    ('canon','lamentations',1,2,'canon','ezekiel',16,37,'free',
      E'*Behold, therefore I will gather all thy lovers, with whom thou hast taken pleasure, and all them that thou hast loved, with all them that thou hast hated; I will even gather them round about against thee, and will discover thy nakedness unto them* (Ezekiel 16:37). Ezekiel shows what becomes of the lovers Lamentations mourns: *all her friends have dealt treacherously with her, they are become her enemies* (1:2). The very allies she loved Yahuah gathers AGAINST her — the lovers turned into the besieging enemies.'),
    ('canon','lamentations',1,1,'canon','revelation',18,7,'free',
      E'*How much she hath glorified herself, and lived deliciously, so much torment and sorrow give her: for she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7). Babylon boasts the exact INVERSE of the mourning city: where Jerusalem *is become as a widow* (Lamentations 1:1) and knows her sorrow, Babylon says *I sit a queen, and am no widow, and shall see no sorrow* — and is thrown down for the boast. The city that owns her widowhood is the one Yahuah will restore; the city that denies it is destroyed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 2 (★★): Is it nothing to you, all ye that pass by? — the sorrow without compare
    ('canon','lamentations',1,12,'canon','matthew',27,39,'free',
      E'*And they that passed by reviled him, wagging their heads* (Matthew 27:39). The city''s cry — *Is it nothing to you, all ye that pass by? behold, and see if there be any sorrow like unto my sorrow* (Lamentations 1:12) — reaches forward to the One held up before the passers-by at Golgotha, where *they that passed by reviled him*. The unparalleled sorrow of Zion is a type of the sorrow He bore; the passers-by who see no sorrow like it become the passers-by who revile the Man of sorrows.'),
    ('canon','lamentations',1,12,'canon','isaiah',53,3,'free',
      E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not* (Isaiah 53:3). Lamentations'' *any sorrow like unto my sorrow* (1:12) finds its fullest answer in the *man of sorrows, and acquainted with grief*, whom men passed by and *esteemed... not*. The grief of the city held up before the passers-by foreshadows the grief of the Servant from whom men hid their faces.'),
    ('canon','lamentations',1,12,'canon','isaiah',53,4,'free',
      E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). The city says her sorrow is that *wherewith Yahuah (LORD) hath afflicted me in the day of his fierce anger* (Lamentations 1:12); the Servant is the One who *hath borne our griefs, and carried our sorrows*, esteemed *smitten of Elohim (God), and afflicted*. The affliction Zion bears for her own sin, He bears for the sin of His people.'),
    ('canon','lamentations',1,12,'canon','daniel',9,12,'free',
      E'*And he hath confirmed his words, which he spake against us, and against our judges that judged us, by bringing upon us a great evil: for under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12). Daniel confirms the city''s claim that there is no *sorrow like unto my sorrow* (Lamentations 1:12): *under the whole heaven hath not been done as hath been done upon Jerusalem*. The sorrow without compare is no exaggeration of grief — it is the measured weight of the covenant judgment fallen on the city.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★): Yahuah is righteous; for I have rebelled against his commandment — the just confession
    ('canon','lamentations',1,18,'canon','daniel',9,7,'free',
      E'*O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel)... because of their trespass that they have trespassed against thee* (Daniel 9:7). Daniel prays the very confession of Lamentations: *Yahuah (LORD) is righteous; for I have rebelled against his commandment* (1:18). Righteousness belongs to Yahuah, the shame to the people — the verdict owned as just, the rebellion confessed.'),
    ('canon','lamentations',1,18,'canon','daniel',9,14,'free',
      E'*Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14). This is the same confession as Lamentations 1:18 — *Yahuah (LORD) is righteous; for I have rebelled against his commandment*. Yahuah is *righteous in all his works*, and the judgment fell because *we obeyed not his voice*: the covenant-curse for covenant-breaking, the Torah upheld, never the Torah made the curse.'),
    ('canon','lamentations',1,18,'canon','nehemiah',9,33,'free',
      E'*Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). Nehemiah''s great prayer of confession says exactly what the city says in Lamentations 1:18 — *Yahuah (LORD) is righteous; for I have rebelled against his commandment*. Yahuah is *just in all that is brought upon us*; He *hath done right*, the people *have done wickedly*. The righteous Judge is cleared, the sin owned.'),
    ('canon','lamentations',1,18,'canon','psalms',51,4,'free',
      E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). The penitent names the principle the city confesses in Lamentations 1:18 — *Yahuah (LORD) is righteous; for I have rebelled against his commandment*: the sinner owns his sin precisely *that thou mightest be justified when thou speakest*. Yahuah is cleared in His judgment; the confession of the city is the confession of the contrite heart.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-1-the-city-become-a-widow-her-lovers-have-failed',
       E'How is she become as a widow — her lovers have failed, the forsaken bride yet restored',
       E'The book opens on the bride of Yahuah become a widow: *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* (1:1). Through the night she weeps and there is no comforter — and the bitterest wound is the treachery of those she trusted: *She weepeth sore in the night, and her tears are on her cheeks: among all her lovers she hath none to comfort her: all her friends have dealt treacherously with her, they are become her enemies* (1:2). The "lovers" are the foreign allies and confederacies she leaned on instead of Yahuah; in the day of her fall they all forget her. Jeremiah names the same betrayal — *All thy lovers have forgotten thee; they seek thee not* (Jeremiah 30:14) — and Ezekiel shows their end: *I will gather all thy lovers, with whom thou hast taken pleasure... I will even gather them round about against thee* (Ezekiel 16:37); the very lovers become the besieging enemies. Set this widowed, grieving city against Babylon, who boasts the exact inverse: *I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7) — and is destroyed for the boast. The city that OWNS her widowhood and her sorrow is the one Yahuah will yet restore; the proud city that denies it is thrown down. For the widowhood is not the divorce-for-ever. Isaiah answers the dirge with the promise to this same widow: *Fear not... thou shalt forget the shame of thy youth, and shalt not remember the reproach of thy widowhood any more. For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)... For Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit, and a wife of youth, when thou wast refused* (Isaiah 54:4-6), and *more are the children of the desolate than the children of the married wife* (Isaiah 54:1). The forsaken widow who weeps in the night is the wife Yahuah re-gathers — the desolate city whose ingathering will overflow.',
       sv.verse_id, ev.verse_id, 'free', 35400
  FROM _s309_lam01_lookup sv, _s309_lam01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by',
       E'Is it nothing to you, all ye that pass by — the sorrow without compare',
       E'At the heart of the dirge the city turns to the road and lifts her grief before every traveller: *Is it nothing to you, all ye that pass by? behold, and see if there be any sorrow like unto my sorrow, which is done unto me, wherewith Yahuah (LORD) hath afflicted me in the day of his fierce anger* (1:12). She claims a sorrow without compare — and Daniel confirms the measure: *under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12). This is no overstatement of grief; it is the weight of the covenant judgment fallen upon the city. And the words reach FORWARD. They were heard again at Golgotha, where the One lifted up was held before the passers-by: *And they that passed by reviled him, wagging their heads* (Matthew 27:39). The grief of Zion held up before the road becomes a type of the grief of the Man of sorrows of whom Isaiah sang: *He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not* (Isaiah 53:3). The city is afflicted *in the day of his fierce anger* for her own rebellion; the Servant *hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4) — He bears for His people the sorrow they earned. Held Come-and-See: the unparalleled grief of the fallen city is a figure of the greater sorrow the passers-by would one day pass by and revile. *Is it nothing to you, all ye that pass by?* — the question still stands at the cross.',
       sv.verse_id, ev.verse_id, 'free', 35403
  FROM _s309_lam01_lookup sv, _s309_lam01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=1 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-1-yahuah-is-righteous-for-i-have-rebelled',
       E'Yahuah is righteous; for I have rebelled against his commandment — the just confession',
       E'Even in the depth of the dirge the city does not accuse Yahuah; she clears Him and confesses her own guilt: *Yahuah (LORD) is righteous; for I have rebelled against his commandment: hear, I pray you, all people, and behold my sorrow: my virgins and my young men are gone into captivity* (1:18). The judgment is owned as just — the punishment is deserved, for she *rebelled against his commandment*. This is the covenant-lawsuit confession: the Deuteronomy 28 curse fallen for covenant-breaking, NEVER the Torah itself made into a curse. The sin was the breaking of the commandment, not the keeping of it. Daniel prays the identical confession in his great prayer: *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar''el (Israel)* (Daniel 9:7), and again, *Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14). Nehemiah''s congregation seals it: *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). And the penitent of Psalm 51 names the principle beneath every such confession: *Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). The righteous Judge is confessed; the rebellion is owned; the Torah is upheld and Yahuah is cleared. The sorrow is real, but it does not turn into an accusation against the One who is righteous in all His works.',
       sv.verse_id, ev.verse_id, 'free', 35406
  FROM _s309_lam01_lookup sv, _s309_lam01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt... not remember the reproach of thy widowhood any more* (Isaiah 54:4) — the widow of Lamentations 1:1 is the very widow Yahuah promises to restore; the widowhood is the night before the re-gathering.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *more are the children of the desolate than the children of the married wife* (Isaiah 54:1) — the emptied city that *sit[s] solitary* (Lamentations 1:1) is the barren one called to sing, for her ingathering will overflow.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name* (Isaiah 54:5) — the widowed city has not lost her husband; the widowhood is the estrangement of exile, not a final divorce.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) hath called thee as a woman forsaken and grieved in spirit* (Isaiah 54:6) — the forsaken widow who *weepeth sore in the night* (Lamentations 1:2) is the woman Yahuah CALLS back, a wife recalled, not cast off for ever.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *All thy lovers have forgotten thee; they seek thee not* (Jeremiah 30:14) — Jeremiah names the same failed allies as *among all her lovers she hath none to comfort her* (Lamentations 1:2); the lovers are foreign confederacies that cannot heal Yahuah''s wound.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I will gather all thy lovers... against thee* (Ezekiel 16:37) — the lovers Lamentations mourns (*they are become her enemies*, 1:2) are gathered by Yahuah into the besieging enemies; the allies turned destroyers.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7) — Babylon boasts the exact INVERSE of *how is she become as a widow!* (Lamentations 1:1); the city that owns her widowhood is restored, the proud one that denies it is destroyed.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=1
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-the-city-become-a-widow-her-lovers-have-failed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they that passed by reviled him, wagging their heads* (Matthew 27:39) — *Is it nothing to you, all ye that pass by?* (Lamentations 1:12) reaches forward to the One held up before the passers-by at Golgotha.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *a man of sorrows, and acquainted with grief... we esteemed him not* (Isaiah 53:3) — the city''s *sorrow like unto my sorrow* (Lamentations 1:12) foreshadows the Man of sorrows from whom men hid their faces.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he hath borne our griefs, and carried our sorrows* (Isaiah 53:4) — the affliction Zion bears for her own sin (Lamentations 1:12), the Servant bears for the sin of His people.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *under the whole heaven hath not been done as hath been done upon Jerusalem* (Daniel 9:12) — Daniel confirms the city''s claim of a sorrow without compare (Lamentations 1:12); the measured weight of the covenant judgment.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-is-it-nothing-to-you-all-ye-that-pass-by'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *righteousness belongeth unto thee, but unto us confusion of faces* (Daniel 9:7) — Daniel prays the very confession of *Yahuah (LORD) is righteous; for I have rebelled* (Lamentations 1:18); righteousness to Yahuah, shame to the people.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-yahuah-is-righteous-for-i-have-rebelled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14) — the same verdict as Lamentations 1:18; the covenant-curse for covenant-breaking, the Torah upheld, never made the curse.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-yahuah-is-righteous-for-i-have-rebelled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33) — Nehemiah''s congregation confesses exactly what the city confesses in Lamentations 1:18; the righteous Judge cleared, the sin owned.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-yahuah-is-righteous-for-i-have-rebelled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4) — the penitent names the principle beneath Lamentations 1:18; the sinner owns his sin precisely that Yahuah may be justified in His judgment.'
  FROM cross_reference_threads t
  JOIN _s309_lam01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_lam01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-1-yahuah-is-righteous-for-i-have-rebelled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_lamentations_2.sql (Lamentations 2) -----
-- Chapter: Lamentations 2 — ★★ Yahuah HIMSELF the enemy who afflicted Zion: He hath bent his bow like an
-- enemy; Yahuah (Lord) was as an enemy; he hath swallowed up Yashar''el (Israel); he hath violently taken
-- away his tabernacle; the solemn feasts and sabbaths forgotten in Zion; the altar cast off, the sanctuary
-- abhorred. The covenant-curse turned the Defender into the Adversary — yet by their sin, not by caprice.
-- Then ★ the famine of true vision: the law is no more, her prophets find no vision; the false prophets have
-- seen vain and foolish things and did not discover thine iniquity; Yahuah hath fulfilled his word commanded
-- of old. The prophet''s eyes fail with tears for the daughter of his people.
-- Tag: lam02   Session: s309   Temp view: _s309_lam02_lookup
-- Sort band: base 35425, step 3 -> threads at 35425, 35428 (2 threads)
-- Source of EVERY row: 'canon','lamentations',2,v
--
-- Lamentations 2 coverage:
--   v.1-3 (Yahuah covered the daughter of Zion with a cloud in his anger; swallowed up the habitations of
--          Jacob; cut off the horn of Yashar''el; drawn back his right hand from before the enemy)
--        NT:     none warranted distinct (the wrath against his own people; held with THREAD 1)
--        Extras: none warranted
--        Tanakh: held with THREAD 1 (Yahuah become the adversary; the right hand drawn back = Isaiah 63:10)
--   ★★ v.4-7 (He hath bent his bow like an enemy; he stood with his right hand as an adversary; Yahuah was as
--          an enemy; he hath swallowed up Yashar''el; he hath violently taken away his tabernacle; caused the
--          solemn feasts and sabbaths to be forgotten in Zion; cast off his altar, abhorred his sanctuary)
--        NT:     ★ Matthew 23:38 (your house is left unto you desolate) — THREAD 1
--        Extras: none warranted (clean canon weave; covenant-curse roots in Torah, not in extras)
--        Tanakh: ★★ Isaiah 63:10 (he was turned to be their enemy, and he fought against them), ★★ Deuteronomy
--                28:63 (Yahuah will rejoice over you to destroy you, and to bring you to nought), ★ Jeremiah
--                30:14 (I have wounded thee with the wound of an enemy — lateral) — THREAD 1
--   v.8-10 (Yahuah purposed to destroy the wall of Zion; her gates sunk into the ground; the elders sit upon
--          the ground and keep silence)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: v.9 (the law is no more; her prophets find no vision) carried into THREAD 2
--   ★ v.9,14,17 (her king and princes among the Gentiles: the law is no more; her prophets find no vision from
--          Yahuah || Thy prophets have seen vain and foolish things... have not discovered thine iniquity ||
--          Yahuah hath done that which he had devised; he hath fulfilled his word commanded in the days of old)
--        NT:     none warranted distinct (the word fulfilled / the false vision exposed is a Tanakh-internal
--                weave; the famine-of-the-word fullness is Amos, held there)
--        Extras: none warranted
--        Tanakh: ★★ Amos 8:11-12 (a famine of hearing the words of Yahuah; they shall run to and fro to seek
--                the word of Yahuah, and shall not find it), ★ Jeremiah 23:16 (the prophets... speak a vision
--                of their own heart, and not out of the mouth of Yahuah — lateral), ★ Leviticus 26:14-17 /
--                ★ Deuteronomy 28:15 (the covenant-curse Yahuah fulfilled), ★★ Ezekiel 13:6,9 (they have seen
--                vanity and lying divination... they shall not be in the assembly of my people) — THREAD 2
--   v.11-13 (Mine eyes do fail with tears; my bowels are troubled; the children and sucklings swoon in the
--          streets; thy breach is great like the sea: who can heal thee?)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the prophet''s tears over the destruction; woven into THREAD 1/2 (no separate
--                add; the failing eyes named in THREAD 2 prose)
--   v.15-16 (all that pass by clap their hands; thine enemies have opened their mouth: We have swallowed her up)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the mocking of the fallen city; the enemy''s boast answers v.5''s swallowing;
--                woven into THREAD 1 (no separate add)
--   v.18-22 (let tears run down like a river; arise, cry out in the night; pour out thine heart like water;
--          the priest and the prophet slain in the sanctuary; thou hast slain them in the day of thine anger)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the night-cry and the slaughter in the sanctuary; the day of Yahuah''s anger
--                = the covenant-curse executed; woven into THREAD 1 (no separate add)
--
-- Threads (slug — target libraries):
--   1. lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house — NT (Matthew 23) + Tanakh
--      (Isaiah 63, Deuteronomy 28, Jeremiah 30) [free]
--      (★★ Yahuah himself become the adversary — the covenant-curse: the One who defended now afflicts; the
--      tabernacle taken, the feasts and sabbaths forgotten, the altar cast off — turned adversary BY THEIR SIN)
--   2. lamentations-2-the-law-is-no-more-her-prophets-find-no-vision — Tanakh (Amos 8, Jeremiah 23, Leviticus
--      26, Deuteronomy 28, Ezekiel 13) [free]
--      (★ the famine of true vision; the false prophets exposed; Yahuah fulfilling his long-spoken word — the
--      word fulfilled, the vain vision shown to have no light)
--
-- Framing notes:
--   ★★ YAHUAH WAS AS AN ENEMY (THREAD 1): the most terrible confession in the book — the Defender of Zion has
--      turned against his own house. *He hath bent his bow like an enemy: he stood with his right hand as an
--      adversary, and slew all that were pleasant to the eye in the tabernacle of the daughter of Zion: he
--      poured out his fury like fire* (2:4); *Yahuah (Lord) was as an enemy: he hath swallowed up Yashar''el
--      (Israel)* (2:5); *And he hath violently taken away his tabernacle... Yahuah (LORD) hath caused the
--      solemn feasts and sabbaths to be forgotten in Zion* (2:6); *Yahuah (Lord) hath cast off his altar, he
--      hath abhorred his sanctuary* (2:7). This is NOT caprice and NOT a defeated god — it is the
--      covenant-curse executed: the very thing Moses warned, *as Yahuah (LORD) rejoiced over you to do you
--      good... so Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought* (Deut 28:63).
--      Isaiah names the cause — their sin turned the Defender to Adversary: *But they rebelled, and vexed his
--      holy Spirit: therefore he was turned to be their enemy, and he fought against them* (Isa 63:10).
--      Jeremiah says it laterally: *I have wounded thee with the wound of an enemy... for the multitude of
--      thine iniquity* (Jer 30:14). And the Messiah pronounces the same desolation over the same city: *Behold,
--      your house is left unto you desolate* (Matt 23:38). The enemy-Yahuah is Yahuah turned adversary by their
--      sin — the covenant standing, not failing; the curse the Torah promised, fallen on the covenant-breaker.
--   ★ THE LAW IS NO MORE, HER PROPHETS FIND NO VISION (THREAD 2): *her king and her princes are among the
--      Gentiles: the law is no more; her prophets also find no vision from Yahuah (LORD)* (2:9). The instruction
--      is silenced and true prophecy fails — the famine of the word Amos foretold: *I will send a famine in the
--      land, not a famine of bread... but of hearing the words of Yahuah (LORD)... they shall run to and fro to
--      seek the word of Yahuah (LORD), and shall not find it* (Amos 8:11-12). The false prophets are exposed:
--      *Thy prophets have seen vain and foolish things for thee: and they have not discovered thine iniquity, to
--      turn away thy captivity* (2:14) — exactly the men Jeremiah indicted, *they speak a vision of their own
--      heart, and not out of the mouth of Yahuah (LORD)* (Jer 23:16), and Ezekiel, *They have seen vanity and
--      lying divination... they shall not be in the assembly of my people* (Ezek 13:6,9). Over against the
--      lying vision stands the word that DID come true: *Yahuah (LORD) hath done that which he had devised; he
--      hath fulfilled his word that he had commanded in the days of old* (2:17) — the covenant-curse spoken of
--      old, *if ye will not hearken unto me... I will set my face against you* (Lev 26:14-17), *if thou wilt not
--      hearken unto the voice of Yahuah Elohayka (the LORD thy God)... all these curses shall come upon thee*
--      (Deut 28:15). The true word, long-spoken, is fulfilled; the false vision is shown to have no light. This
--      is the same measuring line that runs the whole framework: what does not speak according to Yahuah''s word
--      has no vision in it.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the cloud of anger, the horn cut off — woven into THREAD 1, the wrath
--      against his own people), v.8,10 (the wall destroyed, the silent elders — the executed judgment, THREAD 1
--      prose), v.11-13 (the prophet''s failing eyes, the swooning children, the breach great as the sea — named
--      in THREAD 2 prose, no separate canon/extras add warranted), v.15-16 (the mocking passers-by, the enemy''s
--      boast We have swallowed her up — answers v.5, THREAD 1 prose), v.18-22 (the night-cry, tears like a
--      river, priest and prophet slain in the sanctuary, the day of Yahuah''s anger — the curse executed,
--      THREAD 1 prose). Every meaningful block recorded; all three libraries weighed for each.

CREATE TEMP VIEW _s309_lam02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Yahuah was as an enemy — the adversary against his own house, the covenant-curse executed
    ('canon','lamentations',2,5,'canon','isaiah',63,10,'free',
      E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them* (Isaiah 63:10). Isaiah names the cause of the dreadful confession *Yahuah (Lord) was as an enemy: he hath swallowed up Yashar''el (Israel)* (Lamentations 2:5): it was their rebellion that *turned* the Defender *to be their enemy*. Yahuah did not change toward his covenant; their sin turned the One who fought FOR them into the One who fought against them.'),
    ('canon','lamentations',2,4,'canon','isaiah',63,10,'free',
      E'*But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them* (Isaiah 63:10). When *He hath bent his bow like an enemy: he stood with his right hand as an adversary* (Lamentations 2:4), it is the very turning Isaiah describes — the holy Spirit vexed, the Defender become Adversary. The bent bow is not a stranger''s; it is Yahuah''s own hand, turned by the people''s rebellion.'),
    ('canon','lamentations',2,6,'canon','deuteronomy',28,63,'free',
      E'*And it shall come to pass, that as Yahuah (LORD) rejoiced over you to do you good, and to multiply you; so Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought; and ye shall be plucked from off the land whither thou goest to possess it* (Deuteronomy 28:63). The forgotten feasts and sabbaths and the violently-taken tabernacle of *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (Lamentations 2:6) are the covenant-curse Moses foretold falling in full. The destruction is no surprise nor failure: it is the very word Yahuah swore over the covenant-breaker.'),
    ('canon','lamentations',2,5,'canon','deuteronomy',28,63,'free',
      E'*So Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought; and ye shall be plucked from off the land whither thou goest to possess it* (Deuteronomy 28:63). The swallowing-up of *Yahuah (Lord) was as an enemy: he hath swallowed up Yashar''el (Israel), he hath swallowed up all her palaces* (Lamentations 2:5) is exactly this curse: the same Yahuah who once rejoiced to do them good now brings them to nought. The Torah named this judgment centuries before Zion fell; the lament records its execution.'),
    ('canon','lamentations',2,4,'canon','jeremiah',30,14,'free',
      E'*All thy lovers have forgotten thee; they seek thee not; for I have wounded thee with the wound of an enemy, with the chastisement of a cruel one, for the multitude of thine iniquity; because thy sins were increased* (Jeremiah 30:14). Jeremiah voices the same paradox the lament weeps — the wound is dealt by Yahuah himself *with the wound of an enemy*, just as *He hath bent his bow like an enemy: he stood with his right hand as an adversary* (Lamentations 2:4). And he names the why: *for the multitude of thine iniquity*. The enemy-stroke is the chastisement of a Father, fallen for their sin, not the blow of a god who has abandoned them.'),
    ('canon','lamentations',2,7,'canon','matthew',23,38,'free',
      E'*Behold, your house is left unto you desolate* (Matthew 23:38). When Yahusha (Jesus) pronounces the same desolation over the same city, he echoes the lament''s *Yahuah (Lord) hath cast off his altar, he hath abhorred his sanctuary... they have made a noise in the house of Yahuah (LORD)* (Lamentations 2:7). The house abandoned by its Defender is desolate in both mouths — the temple cast off in Jeremiah''s day, the house left desolate in the Messiah''s. Yet his word does not end in desolation, but in *Blessed is he that cometh in the name of Yahuah (Lord)* (Matt 23:39): the abandonment is for a time, the covenant standing.'),

    -- THREAD 2 (★): the law is no more, her prophets find no vision — the famine of the word, the false vision exposed
    ('canon','lamentations',2,9,'canon','amos',8,11,'free',
      E'*Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11). The silence of *the law is no more; her prophets also find no vision from Yahuah (LORD)* (Lamentations 2:9) is the famine Amos foretold come to pass: not bread withheld but the word withheld. When the instruction is gone and no true vision comes, the deepest famine has fallen on the land.'),
    ('canon','lamentations',2,9,'canon','amos',8,12,'free',
      E'*And they shall wander from sea to sea, and from the north even to the east, they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12). The vanished vision of *her prophets also find no vision from Yahuah (LORD)* (Lamentations 2:9) is the seeking-and-not-finding Amos described — the people run to and fro for a word that does not come. The law is no more, and the search for vision returns empty: the famine of the word in its fullness.'),
    ('canon','lamentations',2,14,'canon','jeremiah',23,16,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16). The lament''s indictment — *Thy prophets have seen vain and foolish things for thee: and they have not discovered thine iniquity, to turn away thy captivity* (Lamentations 2:14) — names the very men Jeremiah indicted: prophets who *speak a vision of their own heart*, who never exposed the people''s sin and so never turned them from the captivity. The false vision flatters; it does not save.'),
    ('canon','lamentations',2,14,'canon','ezekiel',13,6,'free',
      E'*They have seen vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them: and they have made others to hope that they would confirm the word* (Ezekiel 13:6). Ezekiel describes exactly what the lament weeps — *Thy prophets have seen vain and foolish things for thee* (Lamentations 2:14): prophets who *have seen vanity and lying divination*, speaking in Yahuah''s name though he never sent them. They gave a false hope that hid the iniquity instead of discovering it.'),
    ('canon','lamentations',2,14,'canon','ezekiel',13,9,'free',
      E'*And mine hand shall be upon the prophets that see vanity, and that divine lies: they shall not be in the assembly of my people, neither shall they be written in the writing of the house of Yashar''el (Israel)* (Ezekiel 13:9). The vain-seeing prophets of *Thy prophets have seen vain and foolish things for thee* (Lamentations 2:14) meet Yahuah''s hand against them: cut off from the assembly, blotted from the register of the house of Yashar''el (Israel). The false vision that did not discover the people''s sin brings down judgment on the seers themselves.'),
    ('canon','lamentations',2,17,'canon','leviticus',26,16,'free',
      E'*I also will do this unto you; I will even appoint over you terror, consumption, and the burning ague, that shall consume the eyes, and cause sorrow of heart: and ye shall sow your seed in vain, for your enemies shall eat it* (Leviticus 26:16). When the lament confesses *Yahuah (LORD) hath done that which he had devised; he hath fulfilled his word that he had commanded in the days of old* (Lamentations 2:17), the word commanded of old is the Torah''s own warning — *But if ye will not hearken unto me... I also will do this unto you* (Lev 26:14,16). The word fulfilled in the rubble is the covenant-curse Yahuah spoke at Sinai; he has done that which he devised.'),
    ('canon','lamentations',2,17,'canon','deuteronomy',28,15,'free',
      E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes which I command thee this day; that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). The fulfilled word of *he hath fulfilled his word that he had commanded in the days of old* (Lamentations 2:17) is this very sentence: the curses sworn for disobedience, overtaking the covenant-breaker. The vision the false prophets never gave was this true word, long-spoken and now performed — the law was not silent before; it was unheeded.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house',
       E'Yahuah was as an enemy — the Defender turned adversary against his own house',
       E'Here is the most terrible confession in the book of mourning: the One who had always defended Zion has turned against his own house. *He hath bent his bow like an enemy: he stood with his right hand as an adversary, and slew all that were pleasant to the eye in the tabernacle of the daughter of Zion: he poured out his fury like fire* (2:4); *Yahuah (Lord) was as an enemy: he hath swallowed up Yashar''el (Israel), he hath swallowed up all her palaces* (2:5). The very right hand that once fought for them is now drawn back and raised against them (2:3-4). And it strikes at the holy things themselves: *And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (2:6); *Yahuah (Lord) hath cast off his altar, he hath abhorred his sanctuary* (2:7). The feasts and sabbaths silenced, the altar cast off, the sanctuary abhorred — the whole worship undone by the hand that ordained it. But mark well what this is and is not. It is NOT a defeated god, and it is NOT caprice; it is the covenant-curse executed exactly as the Torah swore it: *as Yahuah (LORD) rejoiced over you to do you good, and to multiply you; so Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought; and ye shall be plucked from off the land* (Deuteronomy 28:63). Isaiah names the cause that turned the Defender to Adversary: *But they rebelled, and vexed his holy Spirit: therefore he was turned to be their enemy, and he fought against them* (Isaiah 63:10) — the rebellion turned the One who fought for them into the One who fought against them. Jeremiah weeps the same paradox: *I have wounded thee with the wound of an enemy, with the chastisement of a cruel one, for the multitude of thine iniquity; because thy sins were increased* (Jeremiah 30:14) — the enemy-stroke is the chastisement of a Father, dealt for their sin. And the Messiah pronounces the same desolation over the same city: *Behold, your house is left unto you desolate* (Matthew 23:38) — yet not for ever, for he adds, *Ye shall not see me henceforth, till ye shall say, Blessed is he that cometh in the name of Yahuah (Lord)* (Matt 23:39). The enemy-Yahuah is Yahuah turned adversary by their sin: the covenant standing, never failing; the curse the Torah promised, fallen on the covenant-breaker; the house abandoned for a season, to be sought and gathered again.',
       sv.verse_id, ev.verse_id, 'free', 35425
  FROM _s309_lam02_lookup sv, _s309_lam02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-2-the-law-is-no-more-her-prophets-find-no-vision',
       E'The law is no more, her prophets find no vision — the famine of the word, the false vision exposed',
       E'With the city fallen, the deepest loss is named: *her king and her princes are among the Gentiles: the law is no more; her prophets also find no vision from Yahuah (LORD)* (2:9). The instruction silenced, true prophecy failed — the famine Amos had foretold come to pass: *Behold, the days come, saith Adonai Yahuah (the Lord GOD), that I will send a famine in the land, not a famine of bread, nor a thirst for water, but of hearing the words of Yahuah (LORD)* (Amos 8:11), *and they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12). And the lament knows why the true vision is gone: the prophets who SHOULD have spoken were liars. *Thy prophets have seen vain and foolish things for thee: and they have not discovered thine iniquity, to turn away thy captivity; but have seen for thee false burdens and causes of banishment* (2:14). These are the very men Jeremiah indicted — *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16) — and Ezekiel — *They have seen vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them* (Ezekiel 13:6), upon whom Yahuah''s hand falls: *they shall not be in the assembly of my people, neither shall they be written in the writing of the house of Yashar''el (Israel)* (Ezekiel 13:9). The false vision flattered and hid the iniquity; it never turned the people from the captivity. But over against the lying vision stands the word that DID come true: *Yahuah (LORD) hath done that which he had devised; he hath fulfilled his word that he had commanded in the days of old* (2:17). The word commanded of old is the Torah''s own warning: *But if ye will not hearken unto me... I also will do this unto you; I will even appoint over you terror, consumption... that shall consume the eyes* (Leviticus 26:14,16); *if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God)... all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). The true word, long-spoken, is fulfilled to the letter; the false vision is shown to have no light in it. The law was not silent before the fall — it was unheeded; and the prophet''s eyes fail with tears (2:11) for a people who would not hear the word that would have saved them.',
       sv.verse_id, ev.verse_id, 'free', 35428
  FROM _s309_lam02_lookup sv, _s309_lam02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he was turned to be their enemy, and he fought against them* (Isaiah 63:10) — Isaiah names the cause of *Yahuah (Lord) was as an enemy* (Lam 2:5): their rebellion turned the Defender to Adversary.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he was turned to be their enemy, and he fought against them* (Isaiah 63:10) — the bent bow and adversary''s right hand of Lam 2:4 are Yahuah''s own hand, turned by the people''s rebellion.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *so Yahuah (LORD) will rejoice over you to destroy you, and to bring you to nought* (Deuteronomy 28:63) — the forgotten feasts and taken tabernacle of Lam 2:6 are the covenant-curse Moses foretold falling in full.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *so Yahuah (LORD) will rejoice over you to destroy you... and ye shall be plucked from off the land* (Deuteronomy 28:63) — the swallowing-up of Lam 2:5 is this curse: the Yahuah who rejoiced to do good now brings to nought.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=63
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I have wounded thee with the wound of an enemy... for the multitude of thine iniquity* (Jeremiah 30:14) — lateral: the enemy-stroke of Lam 2:4 is a Father''s chastisement, dealt for their sin.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Behold, your house is left unto you desolate* (Matthew 23:38) — the Messiah pronounces the same desolation over the same city whose altar Yahuah cast off (Lam 2:7); abandoned for a season, the covenant standing.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-yahuah-was-as-an-enemy-the-adversary-against-his-own-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *a famine in the land, not a famine of bread... but of hearing the words of Yahuah (LORD)* (Amos 8:11) — the silenced law and lost vision of Lam 2:9 are the famine of the word Amos foretold.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall run to and fro to seek the word of Yahuah (LORD), and shall not find it* (Amos 8:12) — *her prophets find no vision* (Lam 2:9) is the seeking-and-not-finding of the famine of the word in its fullness.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16) — lateral: the vain-seeing prophets of Lam 2:14 are the men Jeremiah indicted, who never discovered the people''s iniquity.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *They have seen vanity and lying divination... and Yahuah (LORD) hath not sent them* (Ezekiel 13:6) — Ezekiel describes the vain-seeing prophets of Lam 2:14, who gave false hope and hid the iniquity.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *they shall not be in the assembly of my people, neither shall they be written in the writing of the house of Yashar''el (Israel)* (Ezekiel 13:9) — Yahuah''s hand against the vain-seeing prophets of Lam 2:14: cut off, blotted from the register.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *But if ye will not hearken unto me... I also will do this unto you* (Leviticus 26:16) — the word *commanded in the days of old* and now fulfilled (Lam 2:17) is the Torah''s own covenant-curse spoken at Sinai.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15) — *he hath fulfilled his word that he had commanded in the days of old* (Lam 2:17): the curses sworn for disobedience, now performed; the law was unheeded, not silent.'
  FROM cross_reference_threads t
  JOIN _s309_lam02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=2 AND sv.verse_number=17
  JOIN _s309_lam02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-2-the-law-is-no-more-her-prophets-find-no-vision'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_lamentations_3.sql (Lamentations 3) -----
-- Chapter: Lamentations 3 — ★★★ THE KEYSTONE of the book. Out of the deepest affliction (I am the man
-- that hath seen affliction by the rod of his wrath) the heart turns to recall and to hope: *It is of the
-- LORD'S mercies that we are not consumed, because his compassions fail not. They are new every morning:
-- great is thy faithfulness. Yahuah (LORD) is my portion* (3:22-24). Around this centre: the goodness of
-- hoping and quietly waiting for the salvation of Yahuah and of bearing the yoke in youth (3:25-27); the
-- suffering-servant posture — he giveth his cheek to him that smiteth him, and Yahuah doth not afflict
-- willingly (3:30-33); the sovereign hand owned over weal and woe, the living man not to complain of the
-- wages of his sins (3:37-39); and the call to search, try, and turn again, the cry heard from the low
-- dungeon, Yahuah the Redeemer of the soul (3:40-41,55-58).
-- Tag: lam03   Temp view: _s309_lam03_lookup   Session: s309
-- Sort band: base 35450, step 3 -> 35450, 35453, 35456, 35459, 35462, 35465 (6 threads)
-- Source of EVERY row: 'canon','lamentations',3,v
--
-- Lamentations 3 coverage:
--   v.1-20 (I am the man that hath seen affliction by the rod of his wrath... the wormwood and the gall;
--          my soul... is humbled in me) — the lament from the depths
--        NT:     none warranted (the suffering preface; the turn comes at v.21; held in prose of THREAD 1)
--        Extras: none warranted
--        Tanakh: held in prose — the affliction that the recalled mercy of v.21-24 answers
--   ★★★ v.21-24 (This I recall to my mind, therefore have I hope. It is of the LORD'S mercies that we are
--          not consumed, because his compassions fail not. They are new every morning: great is thy
--          faithfulness. Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him)
--        NT:     ★ 1 Corinthians 1:9 (Elohim (God) is faithful), ★ Romans 11:32 (concluded them all in
--                unbelief, that he might have mercy upon all) — THREAD 1
--        Extras: none warranted (clean canon weave; the covenant-mercy spine carried in-canon)
--        Tanakh: ★★ Malachi 3:6 (I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not
--                consumed), ★ Psalm 30:5 (weeping may endure for a night, but joy cometh in the morning),
--                ★★ Psalm 73:26 (Elohim (God) is the strength of my heart, and my portion for ever), ★ Psalm
--                16:5 (Yahuah (LORD) is the portion of mine inheritance) — THREAD 1
--   ★★ v.25-27 (Yahuah (LORD) is good unto them that wait for him, to the soul that seeketh him... that a
--          man should both hope and quietly wait for the salvation of Yahuah... bear the yoke in his youth)
--        NT:     ★ Romans 8:25 (if we hope for that we see not, then do we with patience wait for it),
--                ★ Matthew 11:29 (take my yoke upon you... ye shall find rest) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 30:18 (blessed are all they that wait for him), ★ Psalm 27:14 (wait on Yahuah
--                (LORD)... wait, I say, on Yahuah (LORD)), ★★ Isaiah 40:31 (they that wait upon Yahuah
--                (LORD) shall renew their strength) — THREAD 2
--   v.28-29 (He sitteth alone and keepeth silence... He putteth his mouth in the dust; if so be there may
--          be hope) — the silent, dust-laid waiting
--        NT:     none warranted distinct (the posture of quiet waiting; woven into THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: none separate (the silence and the dust; bound to the wait-quietly of v.25-26, THREAD 2)
--   ★★ v.30-33 (He giveth his cheek to him that smiteth him: he is filled full with reproach... the Lord
--          will not cast off for ever... he doth not afflict willingly nor grieve the children of men)
--        NT:     ★★★ Matthew 5:39 (whosoever shall smite thee on thy right cheek, turn to him the other),
--                ★★ Matthew 26:67 (then did they spit in his face... and smote him), ★ Matthew 27:30 (they
--                spit upon him... and smote him on the head), ★★ 1 Peter 2:23 (when he was reviled, reviled
--                not again) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★★ Isaiah 50:6 (I gave my back to the smiters, and my cheeks to them that plucked off the
--                hair) — THREAD 3
--   ★ v.34-36 (To crush under his feet all the prisoners of the earth, To turn aside the right of a man...
--          Yahuah (Lord) approveth not) — the injustices Yahuah does not approve
--        NT:     none warranted (woven into THREAD 4 prose — Yahuah does not approve the perverting of
--                judgment, the prelude to the sovereignty word of v.37-39)
--        Extras: none warranted     Tanakh: none separate (bound to v.37-39, THREAD 4)
--   ★ v.37-39 (Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not? Out of
--          the mouth of the El Elyon (most High) proceedeth not evil and good? Wherefore doth a living man
--          complain, a man for the punishment of his sins?)
--        NT:     none warranted distinct (the sovereignty over weal/woe answered in-canon; held in THREAD 4)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 45:7 (I make peace, and create evil: I Yahuah (LORD) do all these things),
--                ★ Amos 3:6 (shall there be evil in a city, and Yahuah (LORD) hath not done it?), ★ Job
--                2:10 (shall we receive good at the hand of Elohim (God), and shall we not receive evil?),
--                ★ Micah 7:9 (I will bear the indignation of Yahuah (LORD), because I have sinned) — THREAD 4
--   ★★ v.40-41 (Let us search and try our ways, and turn again to Yahuah (LORD). Let us lift up our heart
--          with our hands unto Elohim (God) in the heavens)
--        NT:     none warranted distinct (the return/repentance answered laterally; held in THREAD 5)
--        Extras: none warranted
--        Tanakh: ★★ Hosea 14:1-2 (O Yashar'el (Israel), return unto Yahuah... turn to Yahuah (LORD)), ★★
--                Joel 2:12-13 (turn ye even to me with all your heart... rend your heart) — THREAD 5
--   v.42-54 (We have transgressed and have rebelled... Mine eye runneth down with rivers of water... They
--          have cut off my life in the dungeon... Waters flowed over mine head; then I said, I am cut off)
--        NT:     none warranted (the confession and the descent into the dungeon; the cry that is heard
--                follows at v.55-58; woven into THREAD 5 prose)
--        Extras: none warranted
--        Tanakh: held in prose — the depths from which the redeemed cry of v.55-58 rises
--   ★★ v.55-58 (I called upon thy name, O Yahuah (LORD), out of the low dungeon. Thou hast heard my voice...
--          Thou drewest near... thou saidst, Fear not. O Yahuah (Lord), thou hast pleaded the causes of my
--          soul; thou hast redeemed my life)
--        NT:     none warranted distinct (the cry-heard-from-the-depths answered in-canon; held in THREAD 5)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 130:1 (Out of the depths have I cried unto thee, O Yahuah (LORD)), ★ Jonah 2:2
--                (out of the belly of hell cried I, and thou heardest my voice), ★ Psalm 103:4 (who
--                redeemeth thy life from destruction) — THREAD 5
--   v.59-66 (O Yahuah (LORD), thou hast seen my wrong: judge thou my cause... Render unto them a recompence...
--          Persecute and destroy them in anger) — the appeal for vindication and the imprecation
--        NT:     none warranted (the cry for vindication; vengeance belongs to Yahuah; not forced here)
--        Extras: none warranted     Tanakh: none separate (the closing appeal; woven in prose of THREAD 5)
--
-- Threads (slug — target libraries):
--   1. lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning — NT (1 Corinthians 1, Romans 11) + Tanakh (Malachi 3, Psalm 30, Psalm 73, Psalm 16) [free]
--      (★★★ THE central thread: the covenant mercy/chesed that never fails, new every morning; Yahuah the portion and the hope)
--   2. lamentations-3-yahuah-is-good-unto-them-that-wait-for-him — NT (Romans 8, Matthew 11) + Tanakh (Isaiah 30, Psalm 27, Isaiah 40) [free]
--      (★★ the goodness of hoping and quietly waiting for the salvation of Yahuah; bearing the yoke; the rest of the meek)
--   3. lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him — NT (Matthew 5, Matthew 26, Matthew 27, 1 Peter 2) + Tanakh (Isaiah 50) [free]
--      (★★ the smitten cheek — the suffering-servant posture, woven forward to the Messiah's passion; the unwilling affliction)
--   4. lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good — Tanakh (Isaiah 45, Amos 3, Job 2, Micah 7) [free]
--      (★ Yahuah's sovereignty over weal and woe; the living man not to complain of the wages of his own sins; the hand owned)
--   5. lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah — Tanakh (Hosea 14, Joel 2, Psalm 130, Jonah 2, Psalm 103) [free]
--      (★★ the call to return and the cry heard from the low dungeon; Yahuah the Redeemer of the soul)
--
-- Framing notes:
--   ★★★ THE MERCY THAT NEVER FAILS (THREAD 1, the keystone): out of the man who *hath seen affliction by
--      the rod of his wrath* (3:1) the heart turns to recall, and recalling, to hope — *This I recall to my
--      mind, therefore have I hope. It is of the LORD'S mercies that we are not consumed, because his
--      compassions fail not. They are new every morning: great is thy faithfulness. Yahuah (LORD) is my
--      portion, saith my soul; therefore will I hope in him* (3:21-24). The chesed — the covenant mercy —
--      is the ground: it does not fail, it is renewed every dawn, and it is why the people are *not
--      consumed*. Malachi sings the same: *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob
--      are not consumed* (Mal 3:6) — the unchanging One whose mercy preserves them. The morning-mercy
--      answers the night of weeping: *weeping may endure for a night, but joy cometh in the morning* (Ps
--      30:5). And Yahuah the PORTION is the psalmist's confession too: *Elohim (God) is the strength of my
--      heart, and my portion for ever* (Ps 73:26); *Yahuah (LORD) is the portion of mine inheritance and of
--      my cup* (Ps 16:5). The NT seals the faithfulness — *Elohim (God) is faithful* (1 Cor 1:9) — and the
--      mercy-for-all — *concluded them all in unbelief, that he might have mercy upon all* (Rom 11:32).
--   ★★ THE GOOD OF WAITING (THREAD 2): *Yahuah (LORD) is good unto them that wait for him, to the soul that
--      seeketh him. It is good that a man should both hope and quietly wait for the salvation of Yahuah
--      (LORD). It is good for a man that he bear the yoke in his youth* (3:25-27). Isaiah: *blessed are all
--      they that wait for him* (Isa 30:18); *they that wait upon Yahuah (LORD) shall renew their strength*
--      (Isa 40:31). The psalm: *Wait on Yahuah (LORD)... wait, I say, on Yahuah (LORD)* (Ps 27:14). Paul:
--      *if we hope for that we see not, then do we with patience wait for it* (Rom 8:25). And the yoke borne
--      becomes the easy yoke of the meek One: *Take my yoke upon you... and ye shall find rest unto your
--      souls* (Matt 11:29).
--   ★★ THE SMITTEN CHEEK (THREAD 3): *He giveth his cheek to him that smiteth him: he is filled full with
--      reproach. For the Lord will not cast off for ever: But though he cause grief, yet will he have
--      compassion according to the multitude of his mercies. For he doth not afflict willingly nor grieve
--      the children of men* (3:30-33). The cheek given to the smiter is the suffering-servant posture —
--      *I gave my back to the smiters, and my cheeks to them that plucked off the hair* (Isa 50:6) — and it
--      is fulfilled in the Messiah's passion: *Then did they spit in his face, and buffeted him; and others
--      smote him with the palms of their hands* (Matt 26:67); *they spit upon him... and smote him on the
--      head* (Matt 27:30); *when he was reviled, reviled not again* (1 Pet 2:23). And it is the very posture
--      he taught: *whosoever shall smite thee on thy right cheek, turn to him the other also* (Matt 5:39).
--      Yet Yahuah *doth not afflict willingly* — the grief is not his delight; his compassion is the
--      multitude of his mercies.
--   ★ THE SOVEREIGN HAND OWNED (THREAD 4): *Who is he that saith, and it cometh to pass, when Yahuah (Lord)
--      commandeth it not? Out of the mouth of the El Elyon (most High) proceedeth not evil and good?
--      Wherefore doth a living man complain, a man for the punishment of his sins?* (3:37-39). Nothing comes
--      to pass but by Yahuah's word — weal and woe alike: *I make peace, and create evil: I Yahuah (LORD)
--      do all these things* (Isa 45:7); *shall there be evil in a city, and Yahuah (LORD) hath not done it?*
--      (Amos 3:6); *shall we receive good at the hand of Elohim (God), and shall we not receive evil?* (Job
--      2:10). The living man owns the hand and bears the chastening: *I will bear the indignation of Yahuah
--      (LORD), because I have sinned against him* (Micah 7:9). (The "evil" is calamity/judgment, not moral
--      wickedness — the sovereign affliction owned, not blamed.)
--   ★★ THE RETURN AND THE REDEEMED CRY (THREAD 5): *Let us search and try our ways, and turn again to
--      Yahuah (LORD). Let us lift up our heart with our hands unto Elohim (God) in the heavens* (3:40-41) —
--      the turning Hosea and Joel call for: *O Yashar'el (Israel), return unto Yahuah Elohayka (the LORD thy
--      God)* (Hos 14:1); *turn ye even to me with all your heart... and rend your heart, and not your
--      garments* (Joel 2:12-13). And from the very bottom the cry is heard: *I called upon thy name, O
--      Yahuah (LORD), out of the low dungeon. Thou hast heard my voice... O Yahuah (Lord), thou hast
--      pleaded the causes of my soul; thou hast redeemed my life* (3:55,56,58). So the psalmist and the
--      prophet cried: *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Ps 130:1); *out of the
--      belly of hell cried I, and thou heardest my voice* (Jonah 2:2); and Yahuah is the Redeemer of the
--      soul — *who redeemeth thy life from destruction* (Ps 103:4).
--   VERSES WITH NO SEPARATE ADD: v.1-20 (the lament from the depths — the affliction the recalled mercy of
--      v.21-24 answers, woven into THREAD 1), v.28-29 (the silent, dust-laid waiting — bound to THREAD 2),
--      v.34-36 (the injustices Yahuah does not approve — prelude to the sovereignty word, THREAD 4), v.42-54
--      (the confession and the descent into the dungeon — the depths from which the cry of THREAD 5 rises),
--      v.59-66 (the appeal for vindication and the imprecation — woven into THREAD 5 prose). All blocks
--      recorded; every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_lam03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): it is of Yahuah's mercies that we are not consumed — new every morning, my portion
    ('canon','lamentations',3,22,'canon','malachi',3,6,'free',
      E'*For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6). Lamentations and Malachi speak one mercy: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22). The people are not consumed because Yahuah does not change — his covenant mercy is as unfailing as he is unchanging; the sons of Jacob endure on the constancy of the One who loves them.'),
    ('canon','lamentations',3,23,'canon','psalms',30,5,'free',
      E'*For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5). The mercies that *are new every morning* (Lamentations 3:23) answer the night of weeping: the morning brings the renewed compassion as surely as it brings the joy. The dawn that ends the night of tears is the dawn of mercy made new — great is his faithfulness.'),
    ('canon','lamentations',3,24,'canon','psalms',73,26,'free',
      E'*My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26). Asaph confesses what Lamentations confesses — *Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). When flesh and heart fail, the soul that has Yahuah for its portion has not lost its inheritance; he is the strength of the heart and the portion for ever, and so the ground of hope stands.'),
    ('canon','lamentations',3,24,'canon','psalms',16,5,'free',
      E'*Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). David names Yahuah his portion as Lamentations does — *Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (Lamentations 3:24). The one whose inheritance is Yahuah himself cannot be impoverished by the loss of all else; the portion is the Giver, and *the lines are fallen unto me in pleasant places* (Ps 16:6).'),
    ('canon','lamentations',3,23,'canon','1-corinthians',1,9,'free',
      E'*Elohim (God) is faithful, by whom ye were called unto the fellowship of his Son Yahusha HaMashiach (Jesus Christ) our Lord* (1 Corinthians 1:9). The cry *great is thy faithfulness* (Lamentations 3:23) is the apostolic confession too — *Elohim (God) is faithful*. The faithfulness new every morning in the lament is the faithfulness that keeps the called unto the end; the One whose compassions fail not does not fail his own.'),
    ('canon','lamentations',3,22,'canon','romans',11,32,'free',
      E'*For Elohim (God) hath concluded them all in unbelief, that he might have mercy upon all* (Romans 11:32). The mercy by which *we are not consumed* (Lamentations 3:22) is the mercy Paul names the end of Yahuah''s whole dealing — even the shutting-up in unbelief serves *that he might have mercy upon all*. The compassions that fail not are the compassions that will yet gather the unconsumed people home.'),

    -- THREAD 2 (★★): Yahuah is good unto them that wait for him — hope and quietly wait
    ('canon','lamentations',3,25,'canon','isaiah',30,18,'free',
      E'*And therefore will Yahuah (LORD) wait, that he may be gracious unto you... for Yahuah (LORD) is a Elohim (God) of judgment: blessed are all they that wait for him* (Isaiah 30:18). Isaiah pronounces the very blessing Lamentations rests in — *Yahuah (LORD) is good unto them that wait for him, to the soul that seeketh him* (Lamentations 3:25). The waiting is not wasted: the One who waits to be gracious blesses all who wait for him.'),
    ('canon','lamentations',3,26,'canon','psalms',27,14,'free',
      E'*Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD)* (Psalm 27:14). The psalm doubles the command that Lamentations counsels — *It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD)* (Lamentations 3:26). The quiet waiting is courage, not despair; the heart is strengthened in the waiting, and the salvation comes to those who wait.'),
    ('canon','lamentations',3,26,'canon','isaiah',40,31,'free',
      E'*But they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint* (Isaiah 40:31). The good of quietly waiting *for the salvation of Yahuah (LORD)* (Lamentations 3:26) is the strength renewed in Isaiah: the waiting ones do not faint but mount up. The salvation waited for renews the very strength of those who wait.'),
    ('canon','lamentations',3,26,'canon','romans',8,25,'free',
      E'*But if we hope for that we see not, then do we with patience wait for it* (Romans 8:25). Paul names the same patient hope Lamentations commends — *that a man should both hope and quietly wait for the salvation of Yahuah (LORD)* (Lamentations 3:26). To hope is to wait with patience for the unseen; the quiet waiting is faith holding fast to a salvation not yet in sight.'),
    ('canon','lamentations',3,27,'canon','matthew',11,29,'free',
      E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). The yoke borne in youth — *It is good for a man that he bear the yoke in his youth* (Lamentations 3:27) — finds its rest in the yoke of the meek One. The discipline that humbles the soul early is the schooling that learns of him and finds rest; the yoke is good, and his yoke is easy.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★★): he giveth his cheek to him that smiteth him — the suffering-servant posture
    ('canon','lamentations',3,30,'canon','isaiah',50,6,'free',
      E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). Isaiah''s Servant takes the very posture Lamentations describes — *He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). The cheek given to the smiter, the face filled full with reproach, is the suffering-servant who does not turn away from shame and spitting; the lament''s humbled sufferer foreshadows him.'),
    ('canon','lamentations',3,30,'canon','matthew',26,67,'free',
      E'*Then did they spit in his face, and buffeted him; and others smote him with the palms of their hands* (Matthew 26:67). The cheek *given to him that smiteth him* (Lamentations 3:30) is given by the Messiah in his passion: spat upon, buffeted, smitten. The reproach the lament''s sufferer was *filled full with* is the reproach the Servant bore in the judgment hall, *filled full* with the smiting of men.'),
    ('canon','lamentations',3,30,'canon','matthew',27,30,'free',
      E'*And they spit upon him, and took the reed, and smote him on the head* (Matthew 27:30). The smitten cheek of Lamentations — *He giveth his cheek to him that smiteth him* (Lamentations 3:30) — is the smitten head of the Messiah before the cross. He gives himself to the smiter, *filled full with reproach*; the soldiers'' spitting and smiting fulfil the silent sufferer''s posture.'),
    ('canon','lamentations',3,30,'canon','1-peter',2,23,'free',
      E'*Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). Peter names the silent endurance Lamentations pictures — *He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). The One who gives his cheek does not revile in return but commits himself to the righteous Judge; the lament''s posture is the Messiah''s when reviled.'),
    ('canon','lamentations',3,30,'canon','matthew',5,39,'free',
      E'*But I say unto you, That ye resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39). The cheek given to the smiter in Lamentations — *He giveth his cheek to him that smiteth him* (Lamentations 3:30) — is the very thing the Messiah commands and himself fulfils: *turn to him the other also*. The suffering-servant posture of the lament becomes the disciple''s walk, learned from the One who gave his cheek first.'),
    ('canon','lamentations',3,33,'canon','micah',7,9,'free',
      E'*I will bear the indignation of Yahuah (LORD), because I have sinned against him, until he plead my cause, and execute judgment for me: he will bring me forth to the light* (Micah 7:9). Lamentations holds the same truth Micah owns — *though he cause grief, yet will he have compassion... For he doth not afflict willingly nor grieve the children of men* (Lamentations 3:32-33). The grief is borne because the sin is owned, yet Yahuah does not afflict for affliction''s sake; he pleads the cause and brings forth to the light.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 4 (★): out of the mouth of the most High proceedeth not evil and good — the sovereign hand owned
    ('canon','lamentations',3,38,'canon','isaiah',45,7,'free',
      E'*I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7). Lamentations asks what Isaiah declares — *Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:38). Both weal and woe proceed from the one sovereign hand: Yahuah forms the light and creates the calamity; nothing comes to pass that he has not spoken.'),
    ('canon','lamentations',3,37,'canon','amos',3,6,'free',
      E'*Shall a trumpet be blown in the city, and the people not be afraid? shall there be evil in a city, and Yahuah (LORD) hath not done it?* (Amos 3:6). Amos voices the same sovereignty Lamentations confesses — *Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not?* (Lamentations 3:37). No calamity falls on a city but by Yahuah''s doing; what comes to pass comes by his command, and the affliction is owned as from his hand.'),
    ('canon','lamentations',3,38,'canon','job',2,10,'free',
      E'*What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips* (Job 2:10). Job owns the truth Lamentations states — *Out of the mouth of the El Elyon (most High) proceedeth not evil and good?* (Lamentations 3:38). The hand that gives good gives also the affliction, and the upright receive both without charging Yahuah foolishly; the sovereign hand is owned, not accused.'),
    ('canon','lamentations',3,39,'canon','micah',7,9,'free',
      E'*I will bear the indignation of Yahuah (LORD), because I have sinned against him* (Micah 7:9). Lamentations rebukes the complaint Micah refuses — *Wherefore doth a living man complain, a man for the punishment of his sins?* (Lamentations 3:39). The living man, spared the death his sins deserve, has no ground to murmur; like Micah he bears the indignation he has earned, owning the chastening and waiting to be brought to the light.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 5 (★★): let us search and try our ways, and turn again — the cry heard from the low dungeon
    ('canon','lamentations',3,40,'canon','hosea',14,1,'free',
      E'*O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1). Hosea sounds the call Lamentations raises — *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). The fall by iniquity is the very reason to return; the searching of the ways leads to the turning, and the turning is the way back to the merciful One.'),
    ('canon','lamentations',3,40,'canon','hosea',14,2,'free',
      E'*Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips* (Hosea 14:2). Lamentations and Hosea move together from searching to returning — *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). The turning is not empty: words of confession are brought, iniquity is laid down, and the heart is lifted up with the hands (Lamentations 3:41).'),
    ('canon','lamentations',3,40,'canon','joel',2,12,'free',
      E'*Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). Joel calls for the whole-hearted turning Lamentations urges — *Let us search and try our ways, and turn again to Yahuah (LORD)* (Lamentations 3:40). The trying of the ways is the turning with all the heart; the searching that ends in repentance is the searching Joel demands, not garments rent but hearts.'),
    ('canon','lamentations',3,41,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). To *lift up our heart with our hands unto Elohim (God) in the heavens* (Lamentations 3:41) is to rend the heart, not the garment. The turning Lamentations counsels is the inward turning Joel commands, and the One turned to is gracious and merciful, of great kindness.'),
    ('canon','lamentations',3,55,'canon','psalms',130,1,'free',
      E'*Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1). The psalm cries from the depths as Lamentations cries from the dungeon — *I called upon thy name, O Yahuah (LORD), out of the low dungeon* (Lamentations 3:55). There is no pit too deep for the cry to rise from, nor for Yahuah to hear; the low dungeon and the depths are alike the place from which the redeemed call is heard.'),
    ('canon','lamentations',3,55,'canon','jonah',2,2,'free',
      E'*And said, I cried by reason of mine affliction unto Yahuah (LORD), and he heard me; out of the belly of hell cried I, and thou heardest my voice* (Jonah 2:2). Jonah''s cry from the belly of hell answers Lamentations'' cry from the dungeon — *I called upon thy name, O Yahuah (LORD), out of the low dungeon. Thou hast heard my voice* (Lamentations 3:55-56). From the lowest place the voice is heard and answered: *Thou drewest near in the day that I called upon thee: thou saidst, Fear not* (Lamentations 3:57).'),
    ('canon','lamentations',3,58,'canon','psalms',103,4,'free',
      E'*Who redeemeth thy life from destruction; who crowneth thee with lovingkindness and tender mercies* (Psalm 103:4). The psalm names what Lamentations confesses Yahuah has done — *O Yahuah (Lord), thou hast pleaded the causes of my soul; thou hast redeemed my life* (Lamentations 3:58). The One who pleads the cause of the soul redeems the life from destruction; the redeemed life is crowned with the same lovingkindness whose compassions, in this chapter, fail not.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning',
       E'It is of Yahuah''s mercies that we are not consumed — new every morning, great is thy faithfulness',
       E'This is the heart of the whole book — and one of the brightest words in all the Tanakh — rising out of the deepest darkness. The man who opened the chapter saying *I am the man that hath seen affliction by the rod of his wrath* (3:1), who was *led... into darkness, but not into light* (3:2), who said *My strength and my hope is perished from Yahuah (LORD)* (3:18), now turns the corner by an act of recollection: *This I recall to my mind, therefore have I hope* (3:21). And what he recalls is the covenant mercy that does not fail: *It is of the LORD’S mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness. Yahuah (LORD) is my portion, saith my soul; therefore will I hope in him* (3:22-24). The chesed — the steadfast covenant love — is the reason the people are *not consumed*; it is renewed with every dawn; and Yahuah himself is the *portion*, the inheritance that cannot be taken away. Malachi grounds the very word *not consumed* in the unchanging God: *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — the mercy endures because the One who shows it does not change. The morning-mercy answers the night of weeping: *weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5). And the confession *Yahuah (LORD) is my portion* is the psalmist''s own: *My flesh and my heart faileth: but Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26); *Yahuah (LORD) is the portion of mine inheritance and of my cup: thou maintainest my lot* (Psalm 16:5). The apostolic word seals the faithfulness — *Elohim (God) is faithful, by whom ye were called unto the fellowship of his Son* (1 Corinthians 1:9) — and names mercy the end of all Yahuah''s dealing, even with the unbelieving: *For Elohim (God) hath concluded them all in unbelief, that he might have mercy upon all* (Romans 11:32). The compassions that fail not are the compassions that preserve the unconsumed people and will yet gather them home.',
       sv.verse_id, ev.verse_id, 'free', 35450
  FROM _s309_lam03_lookup sv, _s309_lam03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-3-yahuah-is-good-unto-them-that-wait-for-him',
       E'Yahuah is good unto them that wait for him — hope and quietly wait for his salvation',
       E'Out of the recalled mercy comes a settled counsel: the good of waiting. *Yahuah (LORD) is good unto them that wait for him, to the soul that seeketh him. It is good that a man should both hope and quietly wait for the salvation of Yahuah (LORD). It is good for a man that he bear the yoke in his youth* (3:25-27). Three times *good* — the goodness of Yahuah toward the waiting soul, the goodness of quiet hope, the goodness of the early yoke. The waiting is not idle resignation but trust that the salvation will come: *He sitteth alone and keepeth silence... He putteth his mouth in the dust; if so be there may be hope* (3:28-29). Isaiah pronounces the blessing on exactly this: *therefore will Yahuah (LORD) wait, that he may be gracious unto you... blessed are all they that wait for him* (Isaiah 30:18); and promises the strength renewed in the waiting: *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles... and they shall walk, and not faint* (Isaiah 40:31). The psalm makes the waiting a command of courage: *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD)* (Psalm 27:14). Paul names it the very shape of hope: *if we hope for that we see not, then do we with patience wait for it* (Romans 8:25). And the yoke borne in youth finds its rest in the yoke of the meek One: *Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). The discipline that humbles the soul early is the schooling that learns of him; the yoke is good, and his yoke is easy.',
       sv.verse_id, ev.verse_id, 'free', 35453
  FROM _s309_lam03_lookup sv, _s309_lam03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=3 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him',
       E'He giveth his cheek to him that smiteth him — the smitten cheek, the unwilling affliction',
       E'The chapter turns to the posture of the silent sufferer, and the posture is the suffering-servant''s: *He sitteth alone and keepeth silence... He giveth his cheek to him that smiteth him: he is filled full with reproach* (3:28,30). The cheek given to the smiter, the face filled full with reproach — this is the very picture Isaiah draws of the Servant: *I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). And it is fulfilled in the Messiah''s passion, where the cheek is given indeed: *Then did they spit in his face, and buffeted him; and others smote him with the palms of their hands* (Matthew 26:67); *they spit upon him... and smote him on the head* (Matthew 27:30). He bore it as the lament''s sufferer bore it — without retaliation: *Who, when he was reviled, reviled not again; when he suffered, he threatened not; but committed himself to him that judgeth righteously* (1 Peter 2:23). And it is the very walk he taught his own: *whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39). Yet the lament does not leave the sufferer to despair, for Yahuah''s heart is not in the affliction: *For the Lord will not cast off for ever: But though he cause grief, yet will he have compassion according to the multitude of his mercies. For he doth not afflict willingly nor grieve the children of men* (3:31-33). The grief is real, and owned — *I will bear the indignation of Yahuah (LORD), because I have sinned against him* (Micah 7:9) — but Yahuah does not afflict for affliction''s sake; his compassion is the multitude of his mercies, and he will not cast off for ever.',
       sv.verse_id, ev.verse_id, 'free', 35456
  FROM _s309_lam03_lookup sv, _s309_lam03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=3 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good',
       E'Out of the mouth of the most High proceedeth not evil and good — the sovereign hand owned',
       E'The sufferer turns from his pain to the sovereignty over it. Nothing falls upon him that Yahuah has not spoken: *Who is he that saith, and it cometh to pass, when Yahuah (Lord) commandeth it not? Out of the mouth of the El Elyon (most High) proceedeth not evil and good? Wherefore doth a living man complain, a man for the punishment of his sins?* (3:37-39). Both weal and woe proceed from the one hand — and the "evil" is calamity and judgment, not moral wickedness, for Yahuah *approveth not* the perverting of justice he has just named (3:34-36). Isaiah declares it plainly: *I form the light, and create darkness: I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7). Amos asks it as Lamentations asks: *shall there be evil in a city, and Yahuah (LORD) hath not done it?* (Amos 3:6). Job owns it from the ash-heap: *What? shall we receive good at the hand of Elohim (God), and shall we not receive evil? In all this did not Job sin with his lips* (Job 2:10). And the right response to the sovereign hand is not the murmuring of a *living man* — spared the death his sins deserve — but the bearing of the just indignation: *I will bear the indignation of Yahuah (LORD), because I have sinned against him, until he plead my cause, and execute judgment for me: he will bring me forth to the light* (Micah 7:9). The hand is owned, the chastening borne, and the light awaited.',
       sv.verse_id, ev.verse_id, 'free', 35459
  FROM _s309_lam03_lookup sv, _s309_lam03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=37
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=3 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah',
       E'Let us search and try our ways, and turn again to Yahuah — the cry heard from the low dungeon',
       E'The owned chastening becomes a summons to repentance: *Let us search and try our ways, and turn again to Yahuah (LORD). Let us lift up our heart with our hands unto Elohim (God) in the heavens* (3:40-41). The searching is not self-justification but confession — *We have transgressed and have rebelled: thou hast not pardoned* (3:42). This is the turning Hosea and Joel command: *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1); *Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity* (Hosea 14:2); *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12); *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful* (Joel 2:13) — the inward turning, the heart rent and lifted, not the garment. And the turning is met by the One who hears from the very bottom. Sunk in the dungeon, the waters over his head, the sufferer cries — and is answered: *I called upon thy name, O Yahuah (LORD), out of the low dungeon. Thou hast heard my voice: hide not thine ear at my breathing, at my cry. Thou drewest near in the day that I called upon thee: thou saidst, Fear not. O Yahuah (Lord), thou hast pleaded the causes of my soul; thou hast redeemed my life* (3:55-58). So the psalmist cried from the depths — *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1) — and Jonah from the belly of hell — *out of the belly of hell cried I, and thou heardest my voice* (Jonah 2:2). There is no pit too deep for the cry to rise from nor for Yahuah to hear; and the One who hears is the Redeemer of the soul: *who redeemeth thy life from destruction; who crowneth thee with lovingkindness and tender mercies* (Psalm 103:4). The same lovingkindness whose compassions, in this chapter, fail not.',
       sv.verse_id, ev.verse_id, 'free', 35462
  FROM _s309_lam03_lookup sv, _s309_lam03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=40
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=3 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — the people are not consumed (Lamentations 3:22) because the One who shows mercy does not change.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5) — the mercies new every morning (Lamentations 3:23) answer the night of weeping with the dawn.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=23
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Elohim (God) is the strength of my heart, and my portion for ever* (Psalm 73:26) — when flesh and heart fail, the soul whose portion is Yahuah (Lamentations 3:24) has not lost its inheritance.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah (LORD) is the portion of mine inheritance and of my cup* (Psalm 16:5) — David names Yahuah his portion as the lament does (Lamentations 3:24); the portion is the Giver himself.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Elohim (God) is faithful, by whom ye were called* (1 Corinthians 1:9) — the cry *great is thy faithfulness* (Lamentations 3:23) is the apostolic confession; he does not fail his own.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=23
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *concluded them all in unbelief, that he might have mercy upon all* (Romans 11:32) — the mercy by which we are not consumed (Lamentations 3:22) is the end of all Yahuah''s dealing.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-it-is-of-yahuahs-mercies-that-we-are-not-consumed-new-every-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *blessed are all they that wait for him* (Isaiah 30:18) — Isaiah pronounces the blessing the lament rests in (Lamentations 3:25); the One who waits to be gracious blesses the waiting.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=25
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-yahuah-is-good-unto-them-that-wait-for-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Wait on Yahuah (LORD)... wait, I say, on Yahuah (LORD)* (Psalm 27:14) — the psalm doubles the command the lament counsels (Lamentations 3:26); the quiet waiting is courage, and the heart is strengthened.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=26
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-yahuah-is-good-unto-them-that-wait-for-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they that wait upon Yahuah (LORD) shall renew their strength* (Isaiah 40:31) — the good of quietly waiting (Lamentations 3:26) is the strength renewed; the waiting ones mount up and do not faint.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=26
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-yahuah-is-good-unto-them-that-wait-for-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *if we hope for that we see not, then do we with patience wait for it* (Romans 8:25) — Paul names the patient hope the lament commends (Lamentations 3:26); to hope is to wait with patience.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=26
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-yahuah-is-good-unto-them-that-wait-for-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Take my yoke upon you... ye shall find rest unto your souls* (Matthew 11:29) — the yoke borne in youth (Lamentations 3:27) finds its rest in the yoke of the meek One.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-yahuah-is-good-unto-them-that-wait-for-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I gave my back to the smiters, and my cheeks to them that plucked off the hair* (Isaiah 50:6) — Isaiah''s Servant takes the very posture of the lament (Lamentations 3:30); the cheek given, the face not hidden from shame.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Then did they spit in his face, and buffeted him; and others smote him* (Matthew 26:67) — the cheek given to the smiter (Lamentations 3:30) is given by the Messiah in his passion, filled full with reproach.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=67
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *And they spit upon him... and smote him on the head* (Matthew 27:30) — the smitten cheek of the lament (Lamentations 3:30) is the smitten head of the Messiah before the cross.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *when he was reviled, reviled not again* (1 Peter 2:23) — the One who gives his cheek (Lamentations 3:30) does not revile in return but commits himself to the righteous Judge.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39) — the cheek given in the lament (Lamentations 3:30) is the walk the Messiah commands and himself fulfils.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=30
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I will bear the indignation of Yahuah (LORD), because I have sinned against him* (Micah 7:9) — Yahuah doth not afflict willingly (Lamentations 3:33); the grief is borne because the sin is owned, the compassion sure.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=33
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-he-giveth-his-cheek-to-him-that-smiteth-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I make peace, and create evil: I Yahuah (LORD) do all these things* (Isaiah 45:7) — Lamentations asks what Isaiah declares (Lamentations 3:38); both weal and woe proceed from the one sovereign hand.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=38
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *shall there be evil in a city, and Yahuah (LORD) hath not done it?* (Amos 3:6) — Amos asks as the lament asks (Lamentations 3:37); no calamity falls but by Yahuah''s doing.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=37
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *shall we receive good at the hand of Elohim (God), and shall we not receive evil?* (Job 2:10) — Job owns from the ash-heap the truth the lament states (Lamentations 3:38); the hand that gives good gives also the affliction.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=38
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will bear the indignation of Yahuah (LORD), because I have sinned against him* (Micah 7:9) — the living man (Lamentations 3:39) has no ground to murmur but bears the indignation he has earned, waiting for the light.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=39
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-out-of-the-mouth-of-the-most-high-proceedeth-not-evil-and-good'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God)* (Hosea 14:1) — Hosea sounds the call the lament raises (Lamentations 3:40); the fall by iniquity is the reason to return.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=40
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity* (Hosea 14:2) — the turning of the lament (Lamentations 3:40) is not empty but brings words of confession.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=40
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *turn ye even to me with all your heart* (Joel 2:12) — Joel calls for the whole-hearted turning the lament urges (Lamentations 3:40); the trying of the ways is the turning with all the heart.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=40
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *And rend your heart, and not your garments... for he is gracious and merciful* (Joel 2:13) — to lift up the heart unto Elohim (Lamentations 3:41) is to rend the heart, not the garment.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=41
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1) — the psalm cries from the depths as the lament cries from the dungeon (Lamentations 3:55); no pit too deep for the cry.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=55
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *out of the belly of hell cried I, and thou heardest my voice* (Jonah 2:2) — Jonah''s cry from the belly of hell answers the lament''s cry from the dungeon (Lamentations 3:55); the voice is heard and answered, Fear not.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=55
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *who redeemeth thy life from destruction* (Psalm 103:4) — the One who pleads the cause of the soul redeems the life (Lamentations 3:58); the redeemed life is crowned with the lovingkindness whose compassions fail not.'
  FROM cross_reference_threads t
  JOIN _s309_lam03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=3 AND sv.verse_number=58
  JOIN _s309_lam03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-3-let-us-search-and-try-our-ways-and-turn-again-to-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_lamentations_4.sql (Lamentations 4) -----
-- Chapter: Lamentations 4 — the horror of the siege of Jerusalem: the precious sons of Zion esteemed
-- as earthen pitchers; the daughter of my people become cruel; the punishment of her iniquity GREATER
-- than the punishment of the sin of Sodom; the pitiful women have sodden their own children (the
-- covenant-curse of Deuteronomy 28 / Leviticus 26 fulfilled to its uttermost depth); and the anointed
-- of Yahuah — the breath of our nostrils — taken in their pits. POSTURE: these are VICTIMS of the
-- covenant-lawsuit judgment, not enemies; the curse is the Deuteronomy 28 exile-judgment for
-- covenant-breaking, never the Torah itself. The failed earthly anointed (Zedekiah) points beyond
-- himself to the true Anointed.
-- Tag: lam04   Temp view: _s309_lam04_lookup
-- Sort band: base 35475, step 3 -> threads at 35475, 35478 (2 threads)
-- Source of EVERY row: 'canon','lamentations',4,v
--
-- Lamentations 4 coverage:
--   v.1-5 (the gold dimmed; the precious sons of Zion as earthen pitchers; the daughter of my people
--          become cruel like the ostriches; the sucking child's tongue cleaveth for thirst; they that
--          fed delicately are desolate)
--        NT:     none warranted (the reversal of glory; the famine's first horrors — preface to v.6,10)
--        Extras: none warranted
--        Tanakh: none separate (woven in prose of THREAD 1 — the cruelty of v.3 leads to v.10)
--   ★★ v.6,10 (the punishment of the iniquity of the daughter of my people is GREATER than the punishment
--          of the sin of Sodom... The hands of the pitiful women have sodden their own children: they were
--          their meat in the destruction of the daughter of my people)
--        NT:     ★★ Matthew 11:23-24 (if the mighty works done in thee had been done in Sodom, it would
--                have remained until this day... more tolerable for the land of Sodom in the day of
--                judgment than for thee — greater light, greater guilt) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 28:53,56-57 (thou shalt eat the fruit of thine own body... in the siege —
--                the covenant-curse foretold), ★★ Leviticus 26:29 (ye shall eat the flesh of your sons),
--                ★ Jeremiah 19:9 (I will cause them to eat the flesh of their sons — lateral) — THREAD 1
--   v.7-9 (her Nazarites purer than snow, now blacker than a coal; they that be slain with the sword are
--          better than they that be slain with hunger)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the wasting of the famine; woven into THREAD 1 prose — the slow death)
--   v.11-19 (Yahuah hath accomplished his fury, kindled a fire in Zion; the sins of her prophets and
--          priests; the adversary entered the gates; our end is come; our persecutors swifter than eagles)
--        NT:     none warranted distinct
--        Extras: none warranted
--        Tanakh: held in prose — the fury accomplished (v.11) and the swift pursuit (v.19, eagle-imagery
--                of Deut 28:49) bound to THREADs 1/2; the prophets'/priests' guilt (v.13) the cause
--   ★ v.20 (The breath of our nostrils, the anointed of Yahuah (LORD), was taken in their pits, of whom
--          we said, Under his shadow we shall live among the heathen)
--        NT:     ★ Luke 23:1-2 (they led him unto Pilate... saying that he himself is Messiah a King),
--                ★ Acts 4:26-27 (the kings of the earth... against thy holy child Yahusha whom thou hast
--                anointed) — THREAD 2 (the type fulfilled in the true Anointed)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 89:38-39,49 (thou hast cast off and abhorred, thou hast been wroth with thine
--                anointed... where are thy former lovingkindnesses?), ★ Psalm 2:2 (the rulers take counsel
--                together against Yahuah, and against his anointed), ★ Jeremiah 52:8-9 (they overtook
--                Zedekiah... carried him up unto the king of Babylon — lateral, the historical capture) — THREAD 2
--   v.21-22 (Rejoice, O daughter of Edom... the cup shall pass through unto thee; the punishment of thine
--          iniquity is accomplished, O daughter of Zion)
--        NT:     none warranted (the cup passed to Edom; the hope that the punishment is accomplished —
--                Obadiah's Edom-oracle held there, not forced here)
--        Extras: none warranted
--        Tanakh: none separate (woven in prose — the turn of the cup and the end of the captivity)
--
-- Threads (slug — target libraries):
--   1. lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled — NT (Matthew 11) + Tanakh (Deuteronomy 28, Leviticus 26, Jeremiah 19) [free]
--      (★★ the siege-horror; the women boil their own children; the punishment exceeding Sodom; the
--       Deuteronomy 28 / Leviticus 26 covenant-curse fulfilled to its depth; greater light, greater guilt)
--   2. lamentations-4-the-anointed-of-yahuah-taken-in-their-pits — NT (Luke 23, Acts 4) + Tanakh (Psalm 89, Psalm 2, Jeremiah 52) [free]
--      (★ the anointed king captured — the breath of our nostrils; the failed earthly anointed pointing
--       beyond himself to the true Anointed seized at the cross)
--
-- Framing notes:
--   ★★ GREATER THAN SODOM / THE CURSE OF THE SIEGE (THREAD 1): *For the punishment of the iniquity of the
--      daughter of my people is greater than the punishment of the sin of Sodom, that was overthrown as
--      in a moment, and no hands stayed on her* (4:6); *The hands of the pitiful women have sodden their
--      own children: they were their meat in the destruction of the daughter of my people* (4:10). This
--      unspeakable horror — mothers boiling their own children — is no random barbarity but the
--      covenant-curse foretold to the letter. Moses warned it: *And thou shalt eat the fruit of thine own
--      body, the flesh of thy sons and of thy daughters... in the siege, and in the straitness* (Deut
--      28:53), and named the very *tender and delicate woman* who would eat *her young one that cometh out
--      from between her feet* (Deut 28:56-57). Leviticus warned it: *And ye shall eat the flesh of your
--      sons, and the flesh of your daughters shall ye eat* (Lev 26:29). Jeremiah foretold it of this very
--      siege: *I will cause them to eat the flesh of their sons and the flesh of their daughters* (Jer
--      19:9). The curse is the Deuteronomy 28 exile-judgment for covenant-breaking — NEVER the Torah
--      itself; the Torah foretold its own grief. And the *greater than Sodom* measure runs forward: where
--      Sodom perished *in a moment*, Zion is wasted slowly, for hers was the greater light and so the
--      greater guilt — the Messiah says the same of the cities that saw his works: *if the mighty works,
--      which have been done in thee, had been done in Sodom, it would have remained until this day... it
--      shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matt
--      11:23-24). The people are VICTIMS of the judgment they brought on themselves, not enemies to be
--      reviled — the prophet weeps over them.
--   ★ THE ANOINTED TAKEN IN THEIR PITS (THREAD 2): *The breath of our nostrils, the anointed of Yahuah
--      (LORD), was taken in their pits, of whom we said, Under his shadow we shall live among the heathen*
--      (4:20). The anointed king — Zedekiah, the last Davidic anointed on the throne — is captured: *they
--      overtook Zedekiah in the plains of Jericho... Then they took the king, and carried him up unto the
--      king of Babylon* (Jer 52:8-9). The hope of living under his shadow among the nations collapses. The
--      psalmist sings the same dereliction: *But thou hast cast off and abhorred, thou hast been wroth
--      with thine anointed... where are thy former lovingkindnesses, which thou swarest unto David?* (Ps
--      89:38,49). Yet the failed earthly anointed points BEYOND himself — the office outlives the man.
--      Psalm 2 names the rulers gathering *against Yahuah (LORD), and against his anointed* (Ps 2:2), and
--      the apostles read it of the TRUE Anointed seized: *the kings of the earth stood up, and the rulers
--      were gathered together against Yahuah (Lord), and against his Messiah (Christ). For of a truth
--      against thy holy child Yahusha (Jesus), whom thou hast anointed... were gathered together* (Acts
--      4:26-27) — the One led to Pilate, accused *that he himself is Messiah (Christ) a King* (Luke 23:2).
--      The anointed taken in their pits is the type; the true Anointed taken at the cross is the
--      antitype — and HE rises, the breath of our nostrils under whose shadow we truly live among the
--      heathen.
--   VERSES WITH NO SEPARATE ADD: v.1-5 (the dimmed gold, the precious sons as earthen pitchers, the cruel
--      daughter — the famine's onset, woven into THREAD 1 prose); v.7-9 (the wasted Nazarites, slain by
--      hunger — the slow death, THREAD 1 prose); v.11-19 (the fury accomplished, the guilt of prophets
--      and priests, the swift pursuit — the eagle-imagery of Deut 28:49 bound to THREADs 1/2 in prose);
--      v.21-22 (the cup passed to Edom, the punishment of Zion accomplished — Obadiah's Edom-oracle held
--      there, not forced; the hope of the ended captivity woven in prose). All blocks recorded; every
--      meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_lam04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): greater than the sin of Sodom — the curse of the siege fulfilled
    ('canon','lamentations',4,10,'canon','deuteronomy',28,53,'free',
      E'*And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). The unspeakable horror of *The hands of the pitiful women have sodden their own children: they were their meat in the destruction of the daughter of my people* (Lamentations 4:10) is no random barbarity — it is the covenant-curse foretold to the letter. The siege-cannibalism is the Deuteronomy 28 exile-judgment for covenant-breaking, never the Torah itself; the Torah foretold its own grief.'),
    ('canon','lamentations',4,10,'canon','deuteronomy',28,56,'free',
      E'*The tender and delicate woman among you, which would not adventure to set the sole of her foot upon the ground for delicateness and tenderness, her eye shall be evil toward the husband of her bosom, and toward her son, and toward her daughter* (Deuteronomy 28:56). Moses named the very *pitiful women* of Lamentations 4:10 — the tender and delicate, driven by the siege to turn upon their own. *The hands of the pitiful women have sodden their own children* fulfils the curse spoken centuries before: the daintiest mother made cruel by the straitness.'),
    ('canon','lamentations',4,10,'canon','deuteronomy',28,57,'free',
      E'*And toward her young one that cometh out from between her feet, and toward her children which she shall bear: for she shall eat them for want of all things secretly in the siege and straitness, wherewith thine enemy shall distress thee in thy gates* (Deuteronomy 28:57). The curse names the act exactly — *she shall eat them... in the siege* — and Lamentations records its fulfilment: *they were their meat in the destruction of the daughter of my people* (Lamentations 4:10). The Torah''s own foretold judgment, accomplished in Zion''s siege.'),
    ('canon','lamentations',4,10,'canon','leviticus',26,29,'free',
      E'*And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). The siege-curse stands also in Leviticus, in the covenant-warnings of the chastisement *seven times for your sins* (Lev 26:28). What Lamentations weeps over — *The hands of the pitiful women have sodden their own children: they were their meat* (Lamentations 4:10) — is this very word come to pass. The Torah foretold the depth of the judgment that covenant-breaking would bring.'),
    ('canon','lamentations',4,10,'canon','jeremiah',19,9,'free',
      E'*And I will cause them to eat the flesh of their sons and the flesh of their daughters, and they shall eat every one the flesh of his friend in the siege and straitness, wherewith their enemies, and they that seek their lives, shall straiten them* (Jeremiah 19:9). Jeremiah foretold of THIS very siege the horror Lamentations records: *The hands of the pitiful women have sodden their own children* (Lamentations 4:10). The weeping prophet had warned it; now he laments its coming to pass — the Deuteronomy 28 curse fulfilled in the destruction of Jerusalem.'),
    ('canon','lamentations',4,6,'canon','matthew',11,23,'free',
      E'*And thou, Capernaum, which art exalted unto heaven, shalt be brought down to hell: for if the mighty works, which have been done in thee, had been done in Sodom, it would have remained until this day* (Matthew 11:23). Lamentations measures Zion''s judgment against Sodom''s — *the punishment of the iniquity of the daughter of my people is greater than the punishment of the sin of Sodom, that was overthrown as in a moment* (Lamentations 4:6) — and the Messiah uses the same scale: greater light brings greater guilt. Where Sodom perished in a moment, the city that knew Yahuah''s presence is wasted the more.'),
    ('canon','lamentations',4,6,'canon','matthew',11,24,'free',
      E'*But I say unto you, That it shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:24). This is the very logic of Lamentations 4:6 — *the punishment of the iniquity of the daughter of my people is greater than the punishment of the sin of Sodom*. The daughter of Zion, who had the covenant, the Torah, and the presence of Yahuah, bore the heavier reckoning; so the cities that saw the Messiah''s works face a judgment greater than Sodom''s. Greater light, greater guilt.'),

    -- THREAD 2 (★): the anointed of Yahuah taken in their pits
    ('canon','lamentations',4,20,'canon','jeremiah',52,8,'free',
      E'*But the army of the Chaldeans pursued after the king, and overtook Zedekiah in the plains of Jericho; and all his army was scattered from him* (Jeremiah 52:8). This is the capture Lamentations mourns: *The breath of our nostrils, the anointed of Yahuah (LORD), was taken in their pits* (Lamentations 4:20). Zedekiah, the last Davidic anointed on the throne, is run down and seized; the hope of living under his shadow among the nations collapses in the plains of Jericho.'),
    ('canon','lamentations',4,20,'canon','jeremiah',52,9,'free',
      E'*Then they took the king, and carried him up unto the king of Babylon to Riblah in the land of Hamath; where he gave judgment upon him* (Jeremiah 52:9). The anointed *taken in their pits* (Lamentations 4:20) is carried captive to Babylon — the breath of the people''s nostrils led away. The Davidic king under whose shadow they hoped to live is delivered to the heathen, and judgment is given upon him; the earthly anointed fails.'),
    ('canon','lamentations',4,20,'canon','psalms',89,38,'free',
      E'*But thou hast cast off and abhorred, thou hast been wroth with thine anointed* (Psalm 89:38). The psalm sings the same dereliction Lamentations laments: *the anointed of Yahuah (LORD), was taken in their pits* (Lamentations 4:20). Yahuah seemed to cast off his anointed and profane the crown to the ground (Ps 89:39); the Davidic hope is brought low. Yet the psalm cries on toward the sworn covenant — *where are thy former lovingkindnesses, which thou swarest unto David?* (Ps 89:49) — the office outliving the fallen man.'),
    ('canon','lamentations',4,20,'canon','psalms',89,49,'free',
      E'*Yahuah (Lord), where are thy former lovingkindnesses, which thou swarest unto David in thy truth?* (Psalm 89:49). The capture of the anointed — *the breath of our nostrils, the anointed of Yahuah (LORD), was taken in their pits* (Lamentations 4:20) — drives the same cry as the psalm: the covenant sworn to David seems undone. Yet the question presses toward its answer: the lovingkindness is not failed but deferred to the true Anointed in whom the Davidic oath is kept.'),
    ('canon','lamentations',4,20,'canon','psalms',2,2,'free',
      E'*The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2). The anointed of Lamentations 4:20, *taken in their pits*, is the failed forerunner of the Anointed of Psalm 2, against whom the kings and rulers conspire. The seizing of Zedekiah by Babylon foreshadows the gathering of the rulers against the true Messiah — the office of the anointed pointing past the fallen king to the One who will not fall.'),
    ('canon','lamentations',4,20,'canon','luke',23,2,'free',
      E'*And they began to accuse him, saying, We found this fellow perverting the nation, and forbidding to give tribute to Cæsar, saying that he himself is Messiah (Christ) a King* (Luke 23:2). The anointed *taken in their pits* (Lamentations 4:20) is the type; the true Anointed led to Pilate is the antitype — accused as a king, seized as Zedekiah was seized. The breath of our nostrils, the anointed of Yahuah, is taken again — but this Anointed rises, and under his shadow we truly live among the heathen.'),
    ('canon','lamentations',4,20,'canon','acts',4,27,'free',
      E'*For of a truth against thy holy child Yahusha (Jesus), whom thou hast anointed, both Herod, and Pontius Pilate, with the Gentiles, and the people of Yashar''el (Israel), were gathered together* (Acts 4:27). The apostles read Psalm 2 of the TRUE Anointed seized — *the kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ)* (Acts 4:26). The anointed of Yahuah *taken in their pits* (Lamentations 4:20) finds its depth here: the holy child Yahusha, anointed by the Father, taken — the office fulfilled in the One who cannot fail.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled',
       E'Greater than the sin of Sodom — the curse of the siege fulfilled',
       E'The fourth lament walks through the famine of the besieged city, from the dimming of her glory — *The precious sons of Zion, comparable to fine gold, how are they esteemed as earthen pitchers, the work of the hands of the potter!* (4:2) — to the unthinkable. First the cruelty: *the daughter of my people is become cruel, like the ostriches in the wilderness* (4:3); *The tongue of the sucking child cleaveth to the roof of his mouth for thirst* (4:4). Then the verdict that measures this judgment against the most byword-ed sin in Scripture: *For the punishment of the iniquity of the daughter of my people is greater than the punishment of the sin of Sodom, that was overthrown as in a moment, and no hands stayed on her* (4:6). Where Sodom perished in a moment, Zion is wasted slowly — for hers was the greater light, and so the greater guilt. And the depth of it is named: *The hands of the pitiful women have sodden their own children: they were their meat in the destruction of the daughter of my people* (4:10). This is no random barbarity. It is the covenant-curse foretold to the letter. Moses warned it: *And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters, which Yahuah Elohayka (the LORD thy God) hath given thee, in the siege, and in the straitness* (Deuteronomy 28:53), and named the very tender and delicate woman whose eye would be evil *toward her young one that cometh out from between her feet... for she shall eat them for want of all things secretly in the siege* (Deuteronomy 28:56-57). Leviticus warned it: *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). And Jeremiah foretold it of this very siege: *I will cause them to eat the flesh of their sons and the flesh of their daughters... in the siege and straitness* (Jeremiah 19:9). The curse is the Deuteronomy 28 exile-judgment for covenant-breaking — NEVER the Torah itself; the Torah foretold its own grief and wept to see it come. And the *greater than Sodom* measure runs forward into the words of the Messiah, who laid the same scale on the cities that saw his works: *if the mighty works, which have been done in thee, had been done in Sodom, it would have remained until this day... it shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:23-24). Greater light, greater guilt. And mark the prophet''s posture: he weeps. These are VICTIMS of the judgment their own covenant-breaking brought down, not enemies to be reviled — the daughter of my people, mourned even in her horror.',
       sv.verse_id, ev.verse_id, 'free', 35475
  FROM _s309_lam04_lookup sv, _s309_lam04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=4 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-4-the-anointed-of-yahuah-taken-in-their-pits',
       E'The breath of our nostrils, the anointed of Yahuah, taken in their pits',
       E'Near the lament''s end comes the grief that strikes at the very hope of the nation: *The breath of our nostrils, the anointed of Yahuah (LORD), was taken in their pits, of whom we said, Under his shadow we shall live among the heathen* (4:20). The anointed king — Zedekiah, the last Davidic anointed to sit on the throne — is run down and captured: *the army of the Chaldeans pursued after the king, and overtook Zedekiah in the plains of Jericho... Then they took the king, and carried him up unto the king of Babylon* (Jeremiah 52:8-9). The breath of the people''s very life is led away to the heathen; the hope of living under his shadow collapses. The eighty-ninth psalm sings the same dereliction: *But thou hast cast off and abhorred, thou hast been wroth with thine anointed* (Psalm 89:38), *Yahuah (Lord), where are thy former lovingkindnesses, which thou swarest unto David in thy truth?* (Psalm 89:49). The Davidic covenant seems undone, the crown cast to the ground. Yet the failed earthly anointed points BEYOND himself — the office outlives the man. Psalm 2 names the rulers gathering *against Yahuah (LORD), and against his anointed* (Psalm 2:2), and the apostles read it of the TRUE Anointed seized: *the kings of the earth stood up, and the rulers were gathered together against Yahuah (Lord), and against his Messiah (Christ). For of a truth against thy holy child Yahusha (Jesus), whom thou hast anointed... were gathered together* (Acts 4:26-27) — the One led to Pilate, accused *that he himself is Messiah (Christ) a King* (Luke 23:2). The anointed taken in their pits is the type; the true Anointed taken at the cross is the antitype — but THIS Anointed does not stay in the pit. He rises, the breath of our nostrils under whose shadow we truly live among the heathen, the Davidic oath kept at last in the One who cannot fail.',
       sv.verse_id, ev.verse_id, 'free', 35478
  FROM _s309_lam04_lookup sv, _s309_lam04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=4 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters... in the siege* (Deuteronomy 28:53) — the covenant-curse foretold to the letter; Lamentations 4:10 is its fulfilment, the Torah''s own grief, never the Torah as curse.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The tender and delicate woman among you... her eye shall be evil toward... her son, and toward her daughter* (Deuteronomy 28:56) — Moses named the very *pitiful women* of Lamentations 4:10, the daintiest mothers made cruel by the siege.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *she shall eat them for want of all things secretly in the siege and straitness* (Deuteronomy 28:57) — the curse names the act exactly; *they were their meat* (Lamentations 4:10) is the word come to pass.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=57
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29) — the same siege-curse in the Leviticus chastisement; Lamentations 4:10 weeps over its fulfilment.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will cause them to eat the flesh of their sons and the flesh of their daughters... in the siege* (Jeremiah 19:9) — the weeping prophet foretold of THIS siege the horror he now laments (Lamentations 4:10).'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *if the mighty works, which have been done in thee, had been done in Sodom, it would have remained until this day* (Matthew 11:23) — the same scale as Lamentations 4:6: greater light, greater guilt.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *it shall be more tolerable for the land of Sodom in the day of judgment, than for thee* (Matthew 11:24) — the very logic of *greater than the punishment of the sin of Sodom* (Lamentations 4:6); the covenant-people bore the heavier reckoning.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-greater-than-the-sin-of-sodom-the-curse-of-the-siege-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the army of the Chaldeans pursued after the king, and overtook Zedekiah in the plains of Jericho* (Jeremiah 52:8) — the historical capture Lamentations 4:20 mourns; the last Davidic anointed run down.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Then they took the king, and carried him up unto the king of Babylon* (Jeremiah 52:9) — the anointed *taken in their pits* (Lamentations 4:20) led captive to the heathen; the earthly anointed fails.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *thou hast cast off and abhorred, thou hast been wroth with thine anointed* (Psalm 89:38) — the same dereliction; the Davidic crown cast to the ground (Ps 89:39), the covenant seeming undone.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *where are thy former lovingkindnesses, which thou swarest unto David in thy truth?* (Psalm 89:49) — the cry the captured anointed drives; the covenant deferred to the true Anointed, not failed.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:2) — the seized Zedekiah foreshadows the rulers gathered against the true Messiah; the office points past the fallen king.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *saying that he himself is Messiah (Christ) a King* (Luke 23:2) — the true Anointed led to Pilate, accused as a king; the type of Lamentations 4:20 fulfilled, yet THIS Anointed rises.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *against thy holy child Yahusha (Jesus), whom thou hast anointed... were gathered together* (Acts 4:27) — the apostles read it of the TRUE Anointed seized; the anointed taken in their pits finds its depth at the cross.'
  FROM cross_reference_threads t
  JOIN _s309_lam04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s309_lam04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-4-the-anointed-of-yahuah-taken-in-their-pits'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_lamentations_5.sql (Lamentations 5) -----
-- Chapter: Lamentations 5 — the closing prayer of the book. *Remember, O Yahuah (LORD), what is come
-- upon us: consider, and behold our reproach* (5:1) — the orphaned, enslaved, dishonoured remnant pours out
-- its grief: the inheritance turned to strangers, princes hanged, elders unhonoured, the joy ceased and the
-- ★ CROWN FALLEN by sin (vv.15-16). Yet the prayer rises to the one fixed point — ★★★ *Thou, O Yahuah
-- (LORD), remainest for ever; thy throne from generation to generation* (5:19) — and on that everlasting
-- throne it casts its whole hope: ★★★ *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned;
-- renew our days as of old* (5:21) — the turning that only Yahuah can work. The book ends not in despair but
-- in a plea for the God-wrought return.
-- Tag: lam05   Temp view: _s309_lam05_lookup
-- Sort band: base 35500, step 3 -> threads at 35500, 35503 (2 threads)
-- Source of EVERY row: 'canon','lamentations',5,v
--
-- Lamentations 5 coverage:
--   v.1-14 (Remember, O Yahuah, what is come upon us; inheritance to strangers; orphans and fatherless;
--          servants ruled over us; the women ravished in Zion; princes hanged; elders ceased from the gate)
--        NT:     none warranted (the catalogue of exile-misery; the covenant-curse of Deut 28 enacted —
--                woven in prose; the appeal *Remember* held to the closing prayer of THREAD 2)
--        Extras: none warranted
--        Tanakh: none separate (the recital of the desolation; bound to the fallen-crown of vv.15-16 and the
--                throne-plea of vv.19-21)
--   ★ v.15-16 (The joy of our heart is ceased; our dance is turned into mourning. The crown is fallen from
--          our head: woe unto us, that we have sinned!)
--        NT:     ★ James 4:9 (let your laughter be turned to mourning, and your joy to heaviness) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 13:18 (your principalities shall come down, even the crown of your glory — lateral),
--                ★ Job 19:9 (he hath stripped me of my glory, and taken the crown from my head),
--                ★ Isaiah 24:7-8,11 (the merryhearted do sigh... the mirth of the land is gone),
--                ★ Proverbs 14:13 (the end of that mirth is heaviness) — THREAD 1
--   v.17-18 (For this our heart is faint; for these things our eyes are dim. Because of the mountain of Zion,
--          which is desolate, the foxes walk upon it)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the faint heart over desolate Zion; woven into the fallen-crown prose, leading
--                into the everlasting-throne turn of v.19)
--   ★★★ v.19-21 (Thou, O Yahuah, remainest for ever; thy throne from generation to generation. Wherefore dost
--          thou forget us for ever, and forsake us so long time? Turn thou us unto thee, O Yahuah, and we
--          shall be turned; renew our days as of old)
--        NT:     ★★★ Hebrews 1:11 (they shall perish; but thou remainest), ★★ Hebrews 1:12 (thou art the same,
--                and thy years shall not fail — Psalm 102 applied to the Formed Son), ★★ Philippians 2:13
--                (it is Elohim which worketh in you both to will and to do — the turning Yahuah works),
--                ★ Acts 3:21 (the times of restitution of all things) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★★ Psalm 102:12 (thou, O Yahuah, shalt endure for ever), ★★ Psalm 102:27 (thou art the same,
--                and thy years shall have no end — the everlasting One), ★★★ Psalm 80:3,7,19 (Turn us again, O
--                God... cause thy face to shine; and we shall be saved — the same refrain of return),
--                ★★ Jeremiah 31:18 (turn thou me, and I shall be turned — lateral, the new-covenant turning),
--                ★★ Ezekiel 36:26-27 (a new heart... and cause you to walk in my statutes — the turning Yahuah
--                works in the heart) — THREAD 2
--   v.22 (But thou hast utterly rejected us; thou art very wroth against us)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the book closes on the unresolved wrath, casting the whole weight back on the
--                plea of v.21; woven into THREAD 2 prose)
--
-- Threads (slug — target libraries):
--   1. lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning — NT (James 4) + Tanakh (Jeremiah 13,
--      Job 19, Isaiah 24, Proverbs 14) [free]
--      (★ the joy turned to mourning, the crown fallen by sin; the prophets'' and wisdom''s witness to mirth
--      turned to heaviness)
--   2. lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned — NT (Hebrews 1,
--      Philippians 2, Acts 3) + Tanakh (Psalm 102, Psalm 80, Jeremiah 31, Ezekiel 36) [free]
--      (★★★ the everlasting throne and the God-wrought return — the one fixed point on which the book casts
--      its whole hope; the turning only Yahuah can work)
--
-- Framing notes:
--   ★ THE FALLEN CROWN (THREAD 1): *The joy of our heart is ceased; our dance is turned into mourning. The
--      crown is fallen from our head: woe unto us, that we have sinned!* (5:15-16). The crown of glory is gone,
--      and the cause is named plainly — *woe unto us, that we have sinned!*; this is no blind misfortune but
--      the covenant-curse enacted, the mirth turned to mourning by Yashar''el''s (Israel''s) own breaking of
--      the covenant. Jeremiah foretold the very fall of the crown: *your principalities shall come down, even
--      the crown of your glory* (Jeremiah 13:18). Job knew the stripping: *He hath stripped me of my glory,
--      and taken the crown from my head* (Job 19:9). Isaiah sang the wide silence of joy: *all the merryhearted
--      do sigh. The mirth of tabrets ceaseth... the mirth of the land is gone* (Isaiah 24:7-8,11). And wisdom
--      named the law of it long before — *Even in laughter the heart is sorrowful; and the end of that mirth is
--      heaviness* (Proverbs 14:13). James gives the godly answer to the fallen crown, the call to true mourning
--      over sin: *Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to
--      heaviness* (James 4:9) — the very turn Lamentations laments is the turn the penitent must choose, that
--      Yahuah may *lift you up* (James 4:10).
--   ★★★ THE EVERLASTING THRONE AND THE GOD-WROUGHT RETURN (THREAD 2): out of the wreckage the prayer finds
--      the one thing that does not fall — *Thou, O Yahuah (LORD), remainest for ever; thy throne from
--      generation to generation* (5:19). The crown of Yashar''el (Israel) is fallen, but the throne of Yahuah
--      stands. So the psalmist sang in the same key: *But thou, O Yahuah (LORD), shalt endure for ever; and thy
--      remembrance unto all generations* (Psalm 102:12), *But thou art the same, and thy years shall have no
--      end* (Psalm 102:27). Hebrews lifts that Psalm-102 word and lays it on the FORMED Son — *They shall
--      perish; but thou remainest* (Hebrews 1:11), *thou art the same, and thy years shall not fail* (Hebrews
--      1:12): the unchanging One on the everlasting throne is Yahusha (Jesus), the Formed, who is Yahuah and has
--      a Father. On that throne the prayer casts its whole hope, and the hope is not in its own strength but in
--      a turning Yahuah alone can work: *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew
--      our days as of old* (5:21). This is the very refrain of Psalm 80 — *Turn us again, O Elohim (God)... and
--      cause thy face to shine; and we shall be saved* (Psalm 80:3,7,19) — and the new-covenant turning of
--      Jeremiah: *turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah
--      31:18). Ezekiel names HOW Yahuah turns his people — by remaking the heart: *A new heart also will I give
--      you... and I will give you an heart of flesh* (Ezekiel 36:26), *And I will put my spirit within you, and
--      cause you to walk in my statutes* (Ezekiel 36:27). Paul confirms the same in the believer: *it is Elohim
--      (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). And the plea
--      *renew our days as of old* reaches forward to the great restoration: *the times of restitution of all
--      things, which Elohim (God) hath spoken by the mouth of all his holy prophets* (Acts 3:21). The book ends
--      on the everlasting throne and the God-wrought return — the turning is His to give.
--   VERSES WITH NO SEPARATE ADD: v.1-14 (the catalogue of exile-misery — the *Remember, O Yahuah* appeal and
--      the covenant-curse enacted; woven into the closing-prayer prose, not forced to separate targets), v.17-18
--      (the faint heart over desolate Zion; bound to the fallen-crown of vv.15-16, leading into the throne-turn
--      of v.19), v.22 (the unresolved closing wrath — the book deliberately ends on it, casting the whole
--      weight back on the plea of v.21; woven into THREAD 2 prose). All blocks recorded; every meaningful
--      section carries or is bound to a thread.

CREATE TEMP VIEW _s309_lam05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the joy ceased, the crown fallen by sin — the mirth turned to mourning
    ('canon','lamentations',5,16,'canon','jeremiah',13,18,'free',
      E'*Say unto the king and to the queen, Humble yourselves, sit down: for your principalities shall come down, even the crown of your glory* (Jeremiah 13:18). Jeremiah foretold the very fall the Lament now mourns — *The crown is fallen from our head: woe unto us, that we have sinned!* (Lamentations 5:16). The crown of glory comes down because the covenant was broken; the lament is the prophet''s warning come to pass.'),
    ('canon','lamentations',5,16,'canon','job',19,9,'free',
      E'*He hath stripped me of my glory, and taken the crown from my head* (Job 19:9). Job knew the same stripping the remnant now bewails — *The crown is fallen from our head* (Lamentations 5:16). The glory removed, the crown taken: where Job suffers it as a righteous man tried, Yashar''el (Israel) confesses it as the wage of sin — *woe unto us, that we have sinned!*'),
    ('canon','lamentations',5,15,'canon','isaiah',24,7,'free',
      E'*The new wine mourneth, the vine languisheth, all the merryhearted do sigh* (Isaiah 24:7). Isaiah sang the wide silence of joy under judgment that Lamentations now lives — *The joy of our heart is ceased; our dance is turned into mourning* (Lamentations 5:15). The merryhearted sigh, the dance becomes mourning; the gladness of the land is swallowed up by the curse devouring the earth.'),
    ('canon','lamentations',5,15,'canon','isaiah',24,8,'free',
      E'*The mirth of tabrets ceaseth, the noise of them that rejoice endeth, the joy of the harp ceaseth* (Isaiah 24:8). The ceasing music of Isaiah''s judgment is the ceasing joy of the Lament — *The joy of our heart is ceased; our dance is turned into mourning* (Lamentations 5:15). The harp and the tabret fall silent; *The elders have ceased from the gate, the young men from their musick* (Lamentations 5:14). The festivity of a whole people is hushed.'),
    ('canon','lamentations',5,15,'canon','isaiah',24,11,'free',
      E'*There is a crying for wine in the streets; all joy is darkened, the mirth of the land is gone* (Isaiah 24:11). *All joy is darkened* answers *The joy of our heart is ceased* (Lamentations 5:15): the mirth of the land gone, the dance turned to mourning. Isaiah''s portrait of a darkened, joyless land is the very desolation Lamentations weeps over fallen Zion.'),
    ('canon','lamentations',5,16,'canon','proverbs',14,13,'free',
      E'*Even in laughter the heart is sorrowful; and the end of that mirth is heaviness* (Proverbs 14:13). Wisdom named the law of it long before the crown fell — *The joy of our heart is ceased; our dance is turned into mourning. The crown is fallen from our head: woe unto us, that we have sinned!* (Lamentations 5:15-16). The end of mirth pursued apart from Yahuah is heaviness; the laughter of Zion came to the very sorrow Proverbs foresaw.'),
    ('canon','lamentations',5,15,'canon','james',4,9,'free',
      E'*Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to heaviness* (James 4:9). The turn Lamentations laments — *our dance is turned into mourning* (Lamentations 5:15) — James commands as the godly path of the penitent: laughter turned to mourning over sin. What fell upon Zion as judgment, the humble take up willingly, *that he may lift you up* (James 4:10). The mourning that confesses *we have sinned!* (Lamentations 5:16) is the mourning that finds mercy.'),

    -- THREAD 2 (★★★): Thou, O Yahuah, remainest for ever — turn thou us, and we shall be turned
    ('canon','lamentations',5,19,'canon','psalms',102,12,'free',
      E'*But thou, O Yahuah (LORD), shalt endure for ever; and thy remembrance unto all generations* (Psalm 102:12). The psalm sings the very fixed point the Lament finds amid the ruin — *Thou, O Yahuah (LORD), remainest for ever; thy throne from generation to generation* (Lamentations 5:19). The crown of Yashar''el (Israel) is fallen, but the One enthroned endures for ever, his remembrance unto all generations: the throne that does not fall.'),
    ('canon','lamentations',5,19,'canon','psalms',102,27,'free',
      E'*But thou art the same, and thy years shall have no end* (Psalm 102:27). Against the perishing of all things, the psalm names the unchanging One — and Lamentations rests there: *Thou, O Yahuah (LORD), remainest for ever; thy throne from generation to generation* (Lamentations 5:19). Heaven and earth wax old as a garment, but Yahuah is the same; his throne stands when every crown of men is fallen.'),
    ('canon','lamentations',5,19,'canon','hebrews',1,11,'free',
      E'*They shall perish; but thou remainest; and they all shall wax old as doth a garment* (Hebrews 1:11). Hebrews takes the Psalm-102 word — *thou remainest* — and lays it on the Son: the One who *remainest for ever* (Lamentations 5:19) is the FORMED Son, Yahusha (Jesus), Yahuah who has a Father. The heavens perish and wax old, but he remains; the everlasting throne the Lament clings to is his.'),
    ('canon','lamentations',5,19,'canon','hebrews',1,12,'free',
      E'*And as a vesture shalt thou fold them up, and they shall be changed: but thou art the same, and thy years shall not fail* (Hebrews 1:12). *Thou art the same, and thy years shall not fail* is Hebrews'' word over the Formed Son — the unchanging One whose *throne from generation to generation* (Lamentations 5:19) outlasts the folding-up of the heavens. The crowns of men fall and the heavens are changed; he is the same.'),
    ('canon','lamentations',5,21,'canon','psalms',80,3,'free',
      E'*Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3). The threefold refrain of Psalm 80 is the very prayer the book closes upon — *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned* (Lamentations 5:21). The turning is Yahuah''s to give; when his face shines upon his people, then *we shall be saved*. The remnant cannot turn itself; it pleads to be turned.'),
    ('canon','lamentations',5,21,'canon','psalms',80,7,'free',
      E'*Turn us again, O Elohim (God) of hosts, and cause thy face to shine; and we shall be saved* (Psalm 80:7). The same plea rises again in Asaph''s psalm of the wasted vine, the cry of the scattered northern house — and it is the cry of Lamentations 5:21: *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned*. The return is wrought by Yahuah''s shining face, not by the strength of the fallen.'),
    ('canon','lamentations',5,21,'canon','psalms',80,19,'free',
      E'*Turn us again, O Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19). The psalm''s closing refrain seals what Lamentations prays — *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (Lamentations 5:21). To Yahuah Elohim of hosts the prayer is made, for only he can turn his people back and renew their days.'),
    ('canon','lamentations',5,21,'canon','jeremiah',31,18,'free',
      E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18). Ephraim''s new-covenant prayer is word for word the Lament''s — *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned* (Lamentations 5:21). The chastened people cannot turn of itself; it asks to be turned, and the everlasting Father turns the scattered son home.'),
    ('canon','lamentations',5,21,'canon','ezekiel',36,26,'free',
      E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). Ezekiel names HOW Yahuah works the turning the Lament begs for — *Turn thou us unto thee... and we shall be turned* (Lamentations 5:21): by giving a new heart in place of the stony one. The turning is wrought from within, the heart remade so that it can return.'),
    ('canon','lamentations',5,21,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The renewed heart of the turning — *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (Lamentations 5:21) — is the heart Yahuah''s Spirit causes to walk in his statutes. The return is not back to autonomy but back to obedience: the days renewed *as of old* are days of keeping his judgments, the Torah loved and done.'),
    ('canon','lamentations',5,21,'canon','philippians',2,13,'free',
      E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). Paul confirms the ground of the Lament''s plea — *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned* (Lamentations 5:21): even the willing and the doing are Yahuah''s working in his people. The turning is His to give; we are turned because he works it within.'),
    ('canon','lamentations',5,21,'canon','acts',3,21,'free',
      E'*Whom the heaven must receive until the times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets since the world began* (Acts 3:21). The plea *renew our days as of old* (Lamentations 5:21) reaches forward to the great restoration the prophets foretold — *the times of restitution of all things*. The renewing the remnant asks for is the restitution Yahuah has promised by all his holy prophets; the everlasting throne guarantees it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_lam05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_lam05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning',
       E'The crown is fallen from our head — our dance is turned into mourning, that we have sinned',
       E'The closing prayer recites the desolation of a whole people — the inheritance turned to strangers, the orphaned and fatherless, the elders unhonoured and the young men set to grind — and then names the death of its gladness: *The elders have ceased from the gate, the young men from their musick. The joy of our heart is ceased; our dance is turned into mourning. The crown is fallen from our head: woe unto us, that we have sinned!* (5:14-16). Mark the confession in it: the crown did not merely slip, it fell — *woe unto us, that we have sinned!* This is no blind misfortune but the covenant-curse enacted, the glory stripped because the covenant was broken. Jeremiah had foretold the very fall: *Say unto the king and to the queen, Humble yourselves, sit down: for your principalities shall come down, even the crown of your glory* (Jeremiah 13:18). Job knew the stripping in his own flesh: *He hath stripped me of my glory, and taken the crown from my head* (Job 19:9). Isaiah sang the wide hush of joy under judgment: *all the merryhearted do sigh. The mirth of tabrets ceaseth, the noise of them that rejoice endeth, the joy of the harp ceaseth... all joy is darkened, the mirth of the land is gone* (Isaiah 24:7-8,11). And wisdom had named the law of it long before any crown fell: *Even in laughter the heart is sorrowful; and the end of that mirth is heaviness* (Proverbs 14:13). The Lament does not flee this mourning but enters it — and James gives the godly answer, the very turn taken up willingly by the penitent: *Be afflicted, and mourn, and weep: let your laughter be turned to mourning, and your joy to heaviness* (James 4:9), *Humble yourselves in the sight of Yahuah (the Lord), and he shall lift you up* (James 4:10). The dance turned to mourning is the sorrow that confesses the sin — and the sorrow that confesses is the sorrow that finds mercy.',
       sv.verse_id, ev.verse_id, 'free', 35500
  FROM _s309_lam05_lookup sv, _s309_lam05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned',
       E'Thou, O Yahuah, remainest for ever — turn thou us unto thee, and we shall be turned',
       E'Out of the wreckage of the whole book, the prayer finds the one thing that does not fall: *Thou, O Yahuah (LORD), remainest for ever; thy throne from generation to generation* (5:19). The crown of Yashar''el (Israel) is fallen (5:16), Zion is desolate and the foxes walk upon it (5:18) — but the throne of Yahuah stands. The psalmist sang in the same key amid his own affliction: *But thou, O Yahuah (LORD), shalt endure for ever; and thy remembrance unto all generations* (Psalm 102:12); *They shall perish, but thou shalt endure... But thou art the same, and thy years shall have no end* (Psalm 102:26-27). And Hebrews lifts that very Psalm-102 word and lays it upon the FORMED Son: *They shall perish; but thou remainest; and they all shall wax old as doth a garment... thou art the same, and thy years shall not fail* (Hebrews 1:11-12) — the unchanging One on the everlasting throne is Yahusha (Jesus), the Formed, who is Yahuah and yet has a Father. On that throne, and on no strength of its own, the prayer casts its whole hope. First it dares to ask the hard question — *Wherefore dost thou forget us for ever, and forsake us so long time?* (5:20) — and then it makes the great petition: *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (5:21). The turning is Yahuah''s to give; the people cannot turn themselves. This is the threefold refrain of Asaph''s psalm of the wasted vine: *Turn us again, O Elohim (God)... cause thy face to shine; and we shall be saved* (Psalm 80:3,7,19). It is Ephraim''s new-covenant prayer: *turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18). And Ezekiel names HOW Yahuah works it — by remaking the heart: *A new heart also will I give you... and I will give you an heart of flesh* (Ezekiel 36:26), *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); the days *renewed... as of old* are days of the Torah loved and kept. Paul confirms the same in the believer: *it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). And the plea *renew our days as of old* reaches forward to the great consummation — *the times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets since the world began* (Acts 3:21). The book ends without a tidy resolution — *But thou hast utterly rejected us; thou art very wroth against us* (5:22) — yet it ends with the weight cast back upon the only throne that remains, and upon the only One who can work the return. The turning is His to give.',
       sv.verse_id, ev.verse_id, 'free', 35503
  FROM _s309_lam05_lookup sv, _s309_lam05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='lamentations' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *your principalities shall come down, even the crown of your glory* (Jeremiah 13:18) — Jeremiah foretold the very fall of the crown the Lament now mourns; the crown comes down for the broken covenant.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=13 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He hath stripped me of my glory, and taken the crown from my head* (Job 19:9) — Job knew the same stripping; where he suffers it as a righteous man tried, Yashar''el (Israel) confesses it as the wage of sin.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=19 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *all the merryhearted do sigh* (Isaiah 24:7) — Isaiah''s judgment-portrait: the merryhearted sigh, the gladness of the land swallowed up, as *the joy of our heart is ceased* (Lamentations 5:15).'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the joy of the harp ceaseth* (Isaiah 24:8) — the ceasing music of Isaiah''s judgment matches *The elders have ceased from the gate, the young men from their musick* (Lamentations 5:14); the festivity hushed.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *all joy is darkened, the mirth of the land is gone* (Isaiah 24:11) — answers *The joy of our heart is ceased; our dance is turned into mourning* (Lamentations 5:15); the darkened, joyless land of fallen Zion.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the end of that mirth is heaviness* (Proverbs 14:13) — wisdom named the law of it before the crown fell; the laughter of Zion came to the very sorrow Proverbs foresaw.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *let your laughter be turned to mourning, and your joy to heaviness* (James 4:9) — the godly answer: the turn the Lament suffers, the penitent takes up willingly, that Yahuah may lift them up.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-the-crown-is-fallen-our-dance-turned-into-mourning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *thou, O Yahuah (LORD), shalt endure for ever; and thy remembrance unto all generations* (Psalm 102:12) — the same fixed point: *Thou, O Yahuah (LORD), remainest for ever; thy throne from generation to generation* (Lamentations 5:19).'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *thou art the same, and thy years shall have no end* (Psalm 102:27) — the unchanging One; heaven and earth wax old, but his throne stands when every crown of men is fallen.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *They shall perish; but thou remainest* (Hebrews 1:11) — Hebrews lays the Psalm-102 *thou remainest* on the FORMED Son; the everlasting throne the Lament clings to is his.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *thou art the same, and thy years shall not fail* (Hebrews 1:12) — the unchanging Formed Son whose throne *from generation to generation* (Lamentations 5:19) outlasts the folding-up of the heavens.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=19
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3) — the same refrain of return; the turning is Yahuah''s to give, as in *Turn thou us... and we shall be turned* (Lamentations 5:21).'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Turn us again, O Elohim (God) of hosts... and we shall be saved* (Psalm 80:7) — the cry of the wasted vine, the scattered northern house; the return wrought by Yahuah''s shining face, not the strength of the fallen.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Turn us again, O Yahuah Elohim (LORD God) of hosts... and we shall be saved* (Psalm 80:19) — the psalm''s closing refrain seals what Lamentations prays; only Yahuah can turn his people and renew their days.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18) — Ephraim''s new-covenant prayer word for word; the chastened son cannot turn himself, but asks to be turned.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *A new heart also will I give you... and I will give you an heart of flesh* (Ezekiel 36:26) — Yahuah works the turning by remaking the heart; the stony heart taken away so it can return.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the days *renewed as of old* (Lamentations 5:21) are days of the Torah loved and kept; the return is back to obedience, not autonomy.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'★★ *it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13) — Paul confirms the ground of the plea: even the willing and the doing are Yahuah''s working; we are turned because he works it within.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'★ *the times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets* (Acts 3:21) — *renew our days as of old* (Lamentations 5:21) reaches forward to the great restoration the everlasting throne guarantees.'
  FROM cross_reference_threads t
  JOIN _s309_lam05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='lamentations' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_lam05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=3 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='lamentations-5-thou-o-yahuah-remainest-for-ever-turn-thou-us-and-we-shall-be-turned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session309 — Lamentations cross-references complete.'
