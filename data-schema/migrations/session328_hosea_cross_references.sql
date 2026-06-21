-- =====================================================================
-- Session 328 — Hosea FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session328_hosea_cross_references.sql
-- =====================================================================

\echo 'session328 — Hosea cross-references starting...'
BEGIN;

-- ----- fragment: minion_hosea_1.sql (Hosea 1) -----
-- Chapter: Hosea 1 — ★★★ THE TWO-HOUSE KEYSTONE. Yahuah weds a wife of whoredoms (the northern
-- house, unfaithful Yashar'el): *Go, take unto thee a wife of whoredoms... for the land hath
-- committed great whoredom, departing from Yahuah (LORD)* (1:2). Three sign-children: Jezreel
-- (1:4), ★ LO-RUHAMAH — *Call her name Lo-ruhamah: for I will no more have mercy upon the house
-- of Yashar'el (Israel)* (1:6) with Yahudah spared (*I will have mercy upon the house of Yahudah
-- (Judah), and will save them by Yahuah (LORD) their Elohim (God)*, 1:7), and ★★★ LO-AMMI —
-- *Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (1:9),
-- the covenant-formula REVERSED. Then ★★★ THE GREAT REVERSAL: *Yet the number of the children of
-- Yashar'el (Israel) shall be as the sand of the sea... and it shall come to pass, that in the
-- place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye
-- are the sons of the living Elohim (God)* (1:10) — the Abrahamic sand-promise (Genesis 22:17/
-- 32:12) RESTORED, quoted by Paul (Romans 9:25-26) and Peter (1 Peter 2:10). And ★★ JUDAH AND
-- ISRAEL ONE HEAD: *Then shall the children of Yahudah (Judah) and the children of Yashar'el
-- (Israel) be gathered together, and appoint themselves one head* (1:11) — Ezekiel 37's two
-- sticks/one king. THE DIVORCED NORTHERN HOUSE RECLAIMED (Lo-ammi -> Ammi), NEVER the church
-- replacing Israel; Romans 11:1-2 guard holds it.
-- Tag: hos01   Temp view: _s328_hos01_lookup
-- Sort band: base 44700, step 3 -> threads at 44700, 44703, 44706, 44709 (4 threads)
-- Source of EVERY row: 'canon','hosea',1,v
--
-- Hosea 1 coverage:
--   v.1 (the word of Yahuah came unto Hosea, in the days of... kings of Yahudah... and Jeroboam... king of Yashar'el)
--        NT/Extras/Tanakh: none warranted — superscription; both-houses framing woven in prose.
--   v.2-3 (Go, take unto thee a wife of whoredoms... for the land hath committed great whoredom, departing from Yahuah)
--        NT:     none warranted distinct (the marriage-figure is unfolded in THREAD 1's prose)
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 3:18 woven (the divorced house) — held in THREAD 3 prose, not forced here
--   v.4-5 (Call his name Jezreel... I will avenge the blood of Jezreel... break the bow of Yashar'el in the valley of Jezreel)
--        NT/Extras/Tanakh: none warranted — the Jezreel judgment is the preface to the reversal "great
--        day of Jezreel" (1:11) and Hosea 2:23 "I will sow her" (Jezreel = Elohim sows); woven in THREAD 1/3 prose.
--   ★ v.6-7 (Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar'el... But I
--          will have mercy upon the house of Yahudah... save them by Yahuah their Elohim, not by bow)
--        NT:     none warranted distinct (the mercy-reversal is taken up at 1:10 -> 1 Peter 2:10 in THREAD 2)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 37:23 (so shall they be my people, and I will be their Elohim) — THREAD 1
--                (the covenant formula, broken here, restored there)
--   ★★★ v.9 (Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim) — the covenant-formula REVERSED
--        NT:     ★★ 1 Peter 2:10 (Which in time past were not a people, but are now the people of Elohim
--                (God): which had not obtained mercy, but now have obtained mercy) — THREAD 2
--        Extras: none warranted distinct on v.9 (witnesses anchor on the v.10 reversal)
--        Tanakh: ★ Ezekiel 37:23 (so shall they be my people) — THREAD 1; ★ Hosea 2:23 (Thou art my people)
--                — woven THREAD 2 prose (the Ammi reversal of Lo-ammi)
--   ★★★ v.10 (the children of Yashar'el shall be as the sand of the sea... in the place where it was said,
--          Ye are not my people, there... Ye are the sons of the living Elohim) — THE GREAT REVERSAL
--        NT:     ★★★ Romans 9:25 (I will call them my people, which were not my people), ★★★ Romans 9:26
--                (in the place where it was said... there shall they be called the children of the living
--                Elohim), ★★ 1 Peter 2:10 (now the people of Elohim... now have obtained mercy) — THREAD 2
--        Extras: ★★ 2 Esdras 13:40 (the ten tribes... carried away prisoners... in the time of Osea the
--                king, whom Salmanasar... led away captive) + 13:46-47 (the latter-time return) — THREAD 2
--                (the divorced northern house named and gathered); ★ Jubilees 14:5 (So shall your seed be)
--                + 14:6 (I shall be Elohim to you and to your seed after you) — THREAD 2 (sand-seed + covenant formula)
--        Tanakh: ★★ Genesis 22:17 (multiply thy seed... as the sand which is upon the sea shore),
--                ★ Genesis 32:12 (make thy seed as the sand of the sea, which cannot be numbered) — THREAD 2
--                (the Abrahamic sand-promise the reversal restores)
--   ★★★ v.10 (cast-away guard) — read with Romans 11
--        NT:     ★★★ Romans 11:1 (Hath Elohim cast away his people? Elohim forbid), Romans 11:2 (Elohim hath
--                not cast away his people which he foreknew) — THREAD 4 (the anti-replacement guard)
--        Extras/Tanakh: none warranted (the guard is Paul's own)
--   ★★ v.11 (children of Yahudah and children of Yashar'el be gathered together, and appoint themselves one
--          head... great shall be the day of Jezreel)
--        NT:     ★★ John 10:16 (other sheep I have... one fold, and one shepherd), ★★ John 11:52 (gather
--                together in one the children of Elohim that were scattered abroad) — THREAD 3
--        Extras: none warranted distinct (the gathered-tribes witness 2 Esdras 13 anchored on v.10 THREAD 2)
--        Tanakh: ★★★ Ezekiel 37:19 (make them one stick... one in mine hand), ★★ Ezekiel 37:22 (one nation...
--                one king... no more two nations), ★ Jeremiah 3:18 (the house of Yahudah shall walk with the
--                house of Yashar'el... come together out of the land of the north) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. hosea-1-lo-ruhamah-and-lo-ammi-the-covenant-formula-reversed — Tanakh (Ezekiel 37) [free]
--      (★ the three sign-children; mercy withdrawn from the north, Yahudah spared; "ye are not my people"
--       is the covenant formula of Ezekiel 37:23 reversed)
--   2. hosea-1-ye-are-the-sons-of-the-living-elohim — NT (Romans 9, 1 Peter 2) + Extras (2 Esdras 13,
--      Jubilees 14) + Tanakh (Genesis 22, 32) [extras]
--      (★★★ THE KEYSTONE — the divorced northern house reclaimed, the Abrahamic sand-promise restored,
--       quoted by Paul and Peter; the gathered ten tribes named in 2 Esdras; NOT replacement)
--   3. hosea-1-judah-and-israel-one-head — NT (John 10, John 11) + Tanakh (Ezekiel 37, Jeremiah 3) [free]
--      (★★ the two houses gathered under ONE head -> Ezekiel's two sticks/one king, the one fold/one shepherd)
--   4. hosea-1-hath-elohim-cast-away-his-people-elohim-forbid — NT (Romans 11) [free]
--      (★★★ the anti-replacement guard — the Lo-ammi reversal is the divorced house reclaimed, never cast off)
--
-- Framing notes:
--   ★ LO-RUHAMAH / LO-AMMI (THREAD 1): The sign-children spell the covenant lawsuit on the northern house:
--      *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar'el (Israel)* (1:6),
--      *Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (1:9) — the
--      covenant formula ("ye shall be my people, and I will be your Elohim") REVERSED. Yet Yahudah is spared
--      (1:7), and the same formula is restored two houses over: *so shall they be my people, and I will be
--      their Elohim (God)* (Ezekiel 37:23). Conduct-within-the-covenant, the divorced wife, NOT a peoples-hatred.
--   ★★★ YE ARE THE SONS OF THE LIVING ELOHIM (THREAD 2 — KEYSTONE): the great reversal of 1:10 restores the
--      Abrahamic sand-promise (Genesis 22:17, 32:12) to the very house called "not my people." Paul quotes it
--      twice (Romans 9:25-26) and Peter once (1 Peter 2:10) — the divorced northern house (Lo-ammi -> Ammi),
--      reclaimed, NOT the church replacing Israel. 2 Esdras names the very tribes — the ten carried away in
--      the days of Osea/Hoshea by Assyria — and their latter-time return; Jubilees carries the sand-seed and
--      the covenant formula Hosea reverses. This is the fullest keystone treatment.
--   ★★ ONE HEAD (THREAD 3): *appoint themselves one head* (1:11) = Ezekiel's *one stick... one king* (37:19,22),
--      Jeremiah's two houses walking together out of the north (3:18), and the Messiah's *one fold, and one
--      shepherd* (John 10:16) who gathers *the children of Elohim that were scattered abroad* (John 11:52).
--   ★★★ THE GUARD (THREAD 4): *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) —
--      Lo-ammi is never the last word; the reversal IS the proof the people were not cast off.
--   VERSES WITH NO SEPARATE ADD: v.1 (superscription), v.2-3 (the marriage figure — THREAD 1/3 prose),
--      v.4-5 + v.8 (Jezreel/weaning — narrative knots of the sign-acts, woven in prose). All recorded.

CREATE TEMP VIEW _s328_hos01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Lo-ruhamah and Lo-ammi — the covenant formula reversed (Tanakh)
    ('canon','hosea',1,9,'canon','ezekiel',37,23,'free',
      E'*Neither shall they defile themselves any more with their idols... but I will save them out of all their dwellingplaces, wherein they have sinned, and will cleanse them: so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The Lo-ammi word *ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9) is the covenant formula REVERSED; Ezekiel speaks the same formula made whole again — *so shall they be my people, and I will be their Elohim (God)*. The breach Hosea names is the very breach Ezekiel heals over the two houses.'),
    ('canon','hosea',1,6,'canon','ezekiel',37,23,'free',
      E'*so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). When mercy is withdrawn from the north — *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6) — it is conduct-within-the-covenant, the divorced wife, not a casting-off; the same Yahuah who withholds mercy here gathers, cleanses, and reclaims them as *my people* there.'),

    -- THREAD 2 (★★★ KEYSTONE): Ye are the sons of the living Elohim (NT + Extras + Tanakh)
    ('canon','hosea',1,10,'canon','romans',9,25,'free',
      E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). Paul names Hosea outright (Osee = Hosea): the reversal of *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Lo-ammi becomes Ammi, Lo-ruhamah becomes Ruhamah — the divorced northern house reclaimed by name, not a new people put in their place.'),
    ('canon','hosea',1,10,'canon','romans',9,26,'free',
      E'*And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). This is Hosea 1:10 nearly word for word — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)*. The same place, the same people, the verdict overturned: the scattered house of Yashar''el (Israel) called home as sons of the living Elohim.'),
    ('canon','hosea',1,10,'canon','1-peter',2,10,'free',
      E'*Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). Peter binds both sign-names of Hosea 1 together — Lo-ammi (*were not a people... now the people of Elohim (God)*) and Lo-ruhamah (*had not obtained mercy... now have obtained mercy*) — fulfilling *Ye are the sons of the living Elohim (God)* (Hosea 1:10). The once-divorced are restored to mercy and to peoplehood.'),
    ('canon','hosea',1,10,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). The restored witness names the very house of Hosea 1: the ten northern tribes, Lo-ammi, carried off by Assyria in the days of Hoshea — *as the sand of the sea, which cannot be measured nor numbered* (Hosea 1:10) — scattered, yet kept for the gathering.'),
    ('canon','hosea',1,10,'apocrypha','2-esdras',13,47,'extras',
      E'*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace* (2 Esdras 13:47). The ten tribes carried over the waters return in the latter time, the stream parted again for their homecoming — the *Ye are the sons of the living Elohim (God)* (Hosea 1:10) reversal enacted as the divorced northern house brought back, not replaced.'),
    ('canon','hosea',1,10,'jubilees','jubilees',14,5,'extras',
      E'*And he looked toward heaven, and beheld the stars. And He said to him: "So shall your seed be."* (Jubilees 14:5). The reversal of Hosea 1:10 restores the Abrahamic seed-promise to the house called not-my-people: *the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered*. The innumerable seed sworn to Abraham is the innumerable house Hosea sees reclaimed.'),
    ('canon','hosea',1,10,'jubilees','jubilees',14,6,'extras',
      E'*And He said to him... I shall be Elohim (God) to you and to your seed after you* (Jubilees 14:6). The covenant formula Lo-ammi reverses — *I will not be your Elohim (God)* (Hosea 1:9) — is the very promise sworn to Abraham''s seed; and 1:10''s *Ye are the sons of the living Elohim (God)* is that promise made whole again to the scattered seed of Yashar''el (Israel).'),
    ('canon','hosea',1,10,'canon','genesis',22,17,'free',
      E'*That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17). Hosea''s reversal reaches all the way back to the oath at Moriah: *the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered* (Hosea 1:10). The house called Lo-ammi is still the sand-of-the-sea seed Yahuah swore to Abraham — the promise cannot fail.'),
    ('canon','hosea',1,10,'canon','genesis',32,12,'free',
      E'*And thou saidst, I will surely do thee good, and make thy seed as the sand of the sea, which cannot be numbered for multitude* (Genesis 32:12). Jacob pleads the very promise Hosea restores: *as the sand of the sea, which cannot be measured nor numbered* (Hosea 1:10). The seed of Jacob/Yashar''el (Israel), divorced and scattered as Lo-ammi, remains the uncountable sand-of-the-sea seed — and so is gathered as *the sons of the living Elohim (God)*.'),

    -- THREAD 3 (★★): Judah and Israel — one head (NT + Tanakh)
    ('canon','hosea',1,11,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). When *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head* (Hosea 1:11), it is Ezekiel''s two sticks joined — Joseph/Ephraim (the north) and Yahudah (the south) made *one stick... one in mine hand*.'),
    ('canon','hosea',1,11,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The *one head* of Hosea 1:11 is Ezekiel''s *one king... over them all* — the two houses no longer two nations, no longer two kingdoms, gathered under the one Davidic head.'),
    ('canon','hosea',1,11,'canon','jeremiah',3,18,'free',
      E'*In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). Hosea''s *children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together... and they shall come up out of the land* (1:11) is Jeremiah''s same two houses walking together home out of the north — the divorced wife brought back.'),
    ('canon','hosea',1,11,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The *one head* Yahudah (Judah) and Yashar''el (Israel) appoint (Hosea 1:11) is the Shepherd who gathers the scattered other sheep — the dispersed northern house — into *one fold, and one shepherd*.'),
    ('canon','hosea',1,11,'canon','john',11,52,'free',
      E'*And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). The gathering of Hosea 1:11 — the two houses made one — is the very purpose of the Messiah''s death: *to gather together in one the children of Elohim (God) that were scattered abroad*, the Lo-ammi house dispersed among the nations brought back into one.'),

    -- THREAD 4 (★★★ GUARD): Hath Elohim cast away his people? Elohim forbid (NT)
    ('canon','hosea',1,10,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The Lo-ammi word *ye are not my people* (Hosea 1:9) is never the last word; the reversal *Ye are the sons of the living Elohim (God)* (Hosea 1:10) is the proof Paul presses — Elohim has NOT cast away his people. This is the guard against every replacement reading.'),
    ('canon','hosea',1,10,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The divorced northern house of Hosea 1 — *Lo-ammi... ye are not my people* (1:9) — is foreknown, not forsaken; *Ye are the sons of the living Elohim (God)* (1:10) is the reclaiming of the very people Elohim foreknew. Lo-ammi is the lost sheep, not the cast-off; the wild branch is still Yashar''el (Israel), reclaimed and graffed home.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-1-lo-ruhamah-and-lo-ammi-the-covenant-formula-reversed',
       E'Lo-ruhamah and Lo-ammi — the covenant formula reversed',
       E'The sign-children spell the covenant lawsuit on the northern house. The second is mercy withdrawn: *And Elohim (God) said unto him, Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6) — yet Yahudah is spared: *But I will have mercy upon the house of Yahudah (Judah), and will save them by Yahuah (LORD) their Elohim (God), and will not save them by bow, nor by sword* (1:7). The third is the heart of it: *Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (1:9) — the covenant formula ("ye shall be my people, and I will be your Elohim") spoken in REVERSE. This is conduct-within-the-covenant, the unfaithful wife divorced, never a peoples-hatred. And the same formula Hosea breaks is the formula Ezekiel restores over the gathered two houses: *I will save them out of all their dwellingplaces, wherein they have sinned, and will cleanse them: so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23). The breach has an end; the reversal of the reversal is already promised.',
       sv.verse_id, ev.verse_id, 'free', 44700
  FROM _s328_hos01_lookup sv, _s328_hos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-1-ye-are-the-sons-of-the-living-elohim',
       E'Ye are the sons of the living Elohim — the divorced house reclaimed',
       E'The great reversal: *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). In the SAME place, to the SAME people, the verdict is overturned: Lo-ammi becomes Ammi, Lo-ruhamah becomes Ruhamah (*I will say to them which were not my people, Thou art my people*, Hosea 2:23). This is the Abrahamic sand-promise restored — *I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17); *make thy seed as the sand of the sea, which cannot be numbered for multitude* (Genesis 32:12) — to the very house divorced and scattered. Paul names Hosea by name and quotes it twice: *I will call them my people, which were not my people* (Romans 9:25); *in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). Peter binds both sign-names: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). The restored witness even names the house: *Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — scattered as the sand, yet kept and brought back, *the Highest shall stay the springs of the stream again, that they may go through* (13:47). And Jubilees carries the same seed-oath and the same covenant formula: *So shall your seed be... I shall be Elohim (God) to you and to your seed after you* (Jubilees 14:5-6). This is the divorced northern house RECLAIMED — Lo-ammi to Ammi — NOT the church replacing Israel, not a new people grafted in by confession. Both olive branches are Yashar''el (Israel); the wild branch is the same scattered seed grown wild in the nations, called home as the sons of the living Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 44703
  FROM _s328_hos01_lookup sv, _s328_hos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-1-judah-and-israel-one-head',
       E'Judah and Israel, one head — the two houses made one',
       E'The reversal ends in reunion: *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The two divided houses — south and north, Yahudah and Yashar''el/Ephraim — gathered under ONE head. This is Ezekiel''s two sticks: *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). It is Jeremiah''s same homecoming out of the north: *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north* (Jeremiah 3:18). And the one head is the Shepherd: *other sheep I have, which are not of this fold: them also I must bring... and there shall be one fold, and one shepherd* (John 10:16) — for he died *that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). One head, one king, one fold, one shepherd: the two houses made one, the divorced wife brought home. ("Jezreel" — Elohim sows — turns from the valley of judgment (1:5) to the great day of ingathering: *I will sow her unto me in the earth*, Hosea 2:23.)',
       sv.verse_id, ev.verse_id, 'free', 44706
  FROM _s328_hos01_lookup sv, _s328_hos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★ GUARD)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-1-hath-elohim-cast-away-his-people-elohim-forbid',
       E'Hath Elohim cast away his people? Elohim forbid — the anti-replacement guard',
       E'Lo-ammi is never the last word, and Paul presses Hosea''s own reversal as the proof. *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The word *ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9) sounds like a casting-off — but the next breath is *Ye are the sons of the living Elohim (God)* (Hosea 1:10). The divorced northern house is foreknown, not forsaken; reclaimed, not replaced. This is the guard against the antichrist replacement reading: the church does not stand in Israel''s place — the wild branch IS Israel, the same scattered seed grown wild among the nations and graffed back into its own olive tree. Lo-ammi is the lost sheep, not the cast-off; victims, not enemies; the grandmother who inherited the lie, brought home.',
       sv.verse_id, ev.verse_id, 'free', 44709
  FROM _s328_hos01_lookup sv, _s328_hos01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=1 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6) — mercy withdrawn from the north is the very formula Ezekiel restores: *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23).'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-lo-ruhamah-and-lo-ammi-the-covenant-formula-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *so shall they be my people, and I will be their Elohim (God)* (Ezekiel 37:23) — the covenant formula Lo-ammi reverses (*ye are not my people, and I will not be your Elohim (God)*, Hosea 1:9) made whole again over the two houses.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-lo-ruhamah-and-lo-ammi-the-covenant-formula-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) — Paul names Hosea: Lo-ammi to Ammi, Lo-ruhamah to Ruhamah, the divorced house reclaimed.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26) — Hosea 1:10 nearly word for word; the same place, the verdict overturned.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10) — Peter binds both sign-names, Lo-ammi and Lo-ruhamah, reversed together.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the restored witness names the Lo-ammi house, scattered *as the sand of the sea* (Hosea 1:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The Highest shall stay the springs of the stream again, that they may go through* (2 Esdras 13:47) — the ten tribes brought back in the latter time, the *Ye are the sons of the living Elohim (God)* (Hosea 1:10) reversal as homecoming, not replacement.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *And He said to him: "So shall your seed be."* (Jubilees 14:5) — the innumerable seed sworn to Abraham is the innumerable house Hosea sees, *as the sand of the sea, which cannot be measured nor numbered* (Hosea 1:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *I shall be Elohim (God) to you and to your seed after you* (Jubilees 14:6) — the covenant formula Lo-ammi reverses (*I will not be your Elohim (God)*, Hosea 1:9), sworn to Abraham''s seed, restored at 1:10.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17) — the oath at Moriah is the sand-of-the-sea promise Hosea 1:10 restores to the house called not-my-people.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *make thy seed as the sand of the sea, which cannot be numbered for multitude* (Genesis 32:12) — Jacob pleads the very promise; the seed of Yashar''el (Israel), divorced as Lo-ammi, remains the uncountable sand (Hosea 1:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=32 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-ye-are-the-sons-of-the-living-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19) — the *one head* of Hosea 1:11 is Ezekiel''s two sticks joined.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-judah-and-israel-one-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more* (Ezekiel 37:22) — the *one head* (Hosea 1:11) is the one king; the two houses no longer two nations.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-judah-and-israel-one-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north* (Jeremiah 3:18) — the same two houses of Hosea 1:11 walking home together.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-judah-and-israel-one-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *other sheep I have, which are not of this fold: them also I must bring... and there shall be one fold, and one shepherd* (John 10:16) — the *one head* (Hosea 1:11) is the Shepherd gathering the scattered northern house.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-judah-and-israel-one-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52) — the gathering of Hosea 1:11 is the very purpose of the Messiah''s death.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-judah-and-israel-one-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★ GUARD)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1) — Lo-ammi (Hosea 1:9) is never the last word; the reversal of 1:10 is the proof.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-hath-elohim-cast-away-his-people-elohim-forbid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the divorced northern house of Hosea 1 is foreknown, not forsaken; reclaimed (*Ye are the sons of the living Elohim (God)*, 1:10), never replaced.'
  FROM cross_reference_threads t
  JOIN _s328_hos01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s328_hos01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-1-hath-elohim-cast-away-his-people-elohim-forbid'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_2.sql (Hosea 2) -----
-- Chapter: Hosea 2 — the covenant-lawsuit against the adulterous northern house (Yashar'el/Ephraim)
-- who went after Baalim, then the great REVERSAL: the wilderness allure, the door of hope, the
-- betrothal forever, and *Thou art my people* (Lo-ammi reversed). This is the two-house heart of
-- Hosea. ★★★ v.23: *I will say to them which were not my people, Thou art my people* — quoted by
-- Romans 9:25-26 and 1 Peter 2:10 of the divorced house reclaimed (NOT a new people; the very
-- *Lo-ammi* of Hosea 1:9 becomes *Ammi*). ★★ v.19-20: *I will betroth thee unto me for ever* —
-- the Bridegroom/bride (Ephesians 5, Revelation 19/21, 2 Corinthians 11:2, Isaiah 54:5). ★ v.14-15:
-- *I will allure her, and bring her into the wilderness... the valley of Achor for a door of hope*
-- — the second wilderness courtship, the new exodus (Jeremiah 2:2, Ezekiel 20:35, Joshua 7:24,
-- Revelation 12:6). v.11 her feasts/new moons/sabbaths made to cease = judgment on CORRUPTED
-- worship (she kept them whoring after Baal), NOT abolition of the appointed times — Leviticus 23
-- and Isaiah 66:23 STAND.
-- NOTE ON VERSIFICATION: this canon parse follows the Hebrew/Masoretic numbering — Hosea 2 opens
-- at v.1 (*Say ye unto your brethren, Ammi*, = KJV 1:10b-11/2:1) and runs to v.23. All source
-- verse_numbers below are this parse's numbers (verified against dump_canon.py hosea 2).
-- Tag: hos02   Temp view: _s328_hos02_lookup
-- Sort band: base 44725, step 3 -> threads at 44725, 44728, 44731, 44734, 44737 (5 threads)
-- Source of EVERY row: 'canon','hosea',2,v
--
-- Hosea 2 coverage:
--   ★★★ v.1 (Say ye unto your brethren, Ammi; and to your sisters, Ru-hamah) + v.23 (I will say to
--          them which were not my people, Thou art my people; and they shall say, Thou art my Elohim)
--        NT:     ★★★ Romans 9:25 (I will call them my people, which were not my people), Romans 9:26
--                (where it was said... Ye are not my people; there shall they be called the children
--                of the living Elohim) — quotes Hosea by name; ★★ 1 Peter 2:10 (which in time past
--                were not a people, but are now the people of Elohim) — THREAD 1
--        Extras: ★ Jubilees 1:17 (they will be My people in truth and righteousness) — THREAD 1
--        Tanakh: ★ Hosea 1:9-10 (Call his name Lo-ammi... yet... Ye are the sons of the living
--                Elohim) the very reversal-source — THREAD 1
--   ★ v.14-15 (I will allure her, and bring her into the wilderness... the valley of Achor for a door
--          of hope... as in the day when she came up out of the land of Egypt)
--        NT:     ★ Revelation 12:6 (the woman fled into the wilderness, where she hath a place
--                prepared of Elohim) — THREAD 2 (the wilderness refuge/courtship)
--        Extras: none warranted (clean new-exodus witness held in canon; no forced extras add)
--        Tanakh: ★ Jeremiah 2:2 (the kindness of thy youth... when thou wentest after me in the
--                wilderness), ★ Ezekiel 20:35 (I will bring you into the wilderness of the people,
--                and there will I plead with you face to face), ★ Joshua 7:24 (the valley of Achor)
--                — THREAD 2
--   ★★ v.19-20 (I will betroth thee unto me for ever... in righteousness, and in judgment, and in
--          lovingkindness... and thou shalt know Yahuah)
--        NT:     ★★ Ephesians 5:25 (love your wives, even as Messiah also loved the church), Ephesians
--                5:27 (a glorious church, not having spot, or wrinkle), ★★ Revelation 19:7 (the
--                marriage of the Lamb is come, and his wife hath made herself ready), Revelation 21:2
--                (a bride adorned for her husband), 2 Corinthians 11:2 (espoused you to one husband)
--                — THREAD 3
--        Extras: none warranted (the betrothal forward-weave is canon-dense)
--        Tanakh: ★ Isaiah 54:5 (thy Maker is thine husband), ★ Jeremiah 31:34 (they shall all know
--                me) — THREAD 3 (the *thou shalt know Yahuah* of v.20)
--   v.11 (I will also cause all her mirth to cease, her feast days, her new moons, and her sabbaths)
--        NT:     none warranted (this is judgment on CORRUPTED worship, not abolition; held in prose)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 23:2 (the feasts of Yahuah... these are my feasts), ★ Isaiah 66:23
--                (from one new moon to another, and from one sabbath to another, shall all flesh come
--                to worship) — THREAD 4 (the appointed times are HIS, and STAND; corruption judged,
--                not the calendar)
--   v.16-17 (thou shalt call me Ishi; and shalt call me no more Baali... I will take away the names
--          of Baalim) + v.23a (I will sow her unto me in the earth; I will have mercy upon her that
--          had not obtained mercy)
--        NT:     none warranted distinct (the renewed-betrothal-name and the mercy on Lo-Ruhamah are
--                woven — the mercy clause shares THREAD 1's Romans/Peter weave; the name-change held
--                in THREAD 5 prose with the everlasting-covenant Tanakh laterals)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 16:60 (I will remember my covenant with thee in the days of thy youth...
--                an everlasting covenant), ★ Isaiah 62:4 (thou shalt no more be termed Forsaken...
--                but thou shalt be called Hephzi-bah... thy land shall be married) — THREAD 5
--   v.2-10, 12-13 (the lawsuit body: whoredoms, lovers, the hedge of thorns, she-knew-not-I-gave,
--          the days of Baalim) — the covenant-lawsuit framing woven into THREADs 1/2/4 prose; no
--          separate add (these set up the reversal; the harlotry is conduct-within-the-covenant,
--          the divorced wife is the lost sheep, victims not enemies)
--   v.18 (a covenant... with the beasts of the field... break the bow and the sword) — the peace-
--          covenant of the restoration; woven into THREAD 3's betrothal prose (the *that day* frame),
--          no separate forced add
--   v.21-22 (I will hear the heavens... and they shall hear Jezreel) — the great agricultural
--          answering that precedes the sowing of v.23; woven into THREAD 1's *I will sow her* prose,
--          no separate add
--
-- Threads (slug — target libraries):
--   1. hosea-2-thou-art-my-people-lo-ammi-reversed — NT (Romans 9, 1 Peter 2) + Extras (Jubilees 1)
--      + Tanakh (Hosea 1) [extras] (★★★ the divorced house reclaimed; NOT replacement; Rom 11:1-2 guard)
--   2. hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope — NT (Revelation 12) + Tanakh
--      (Jeremiah 2, Ezekiel 20, Joshua 7) [free] (★ the second wilderness courtship; Achor a door of hope)
--   3. hosea-2-i-will-betroth-thee-unto-me-for-ever — NT (Ephesians 5, Revelation 19/21, 2 Corinthians
--      11) + Tanakh (Isaiah 54, Jeremiah 31) [free] (★★ the Bridegroom and the bride; thou shalt know Yahuah)
--   4. hosea-2-her-feasts-and-sabbaths-corrupted-worship-judged-not-abolished — Tanakh (Leviticus 23,
--      Isaiah 66) [free] (the appointed times are Yahuah's and STAND; her corrupt keeping judged)
--   5. hosea-2-no-more-baali-the-everlasting-covenant-remembered — Tanakh (Ezekiel 16, Isaiah 62) [free]
--      (★ the renewed name Ishi, the everlasting covenant, Forsaken called married)
--
-- Framing notes:
--   ★★★ LO-AMMI REVERSED (THREAD 1): the chapter opens already reversing the curse-names of ch.1 —
--      *Say ye unto your brethren, Ammi (my people); and to your sisters, Ru-hamah (having obtained
--      mercy)* (2:1) — and closes with the full word: *I will have mercy upon her that had not
--      obtained mercy; and I will say to them which were not my people, Thou art my people; and they
--      shall say, Thou art my Elohim (God)* (2:23). The northern house divorced and named *Lo-ammi,
--      for ye are not my people* (Hosea 1:9) is reclaimed — the SAME people, not a new one. Paul
--      quotes it by name of the called: *As he saith also in Osee, I will call them my people, which
--      were not my people* (Romans 9:25); Peter applies it to the scattered strangers: *which in
--      time past were not a people, but are now the people of Elohim (God)* (1 Peter 2:10). This is
--      the two-house regathering, the divorced house restored — NEVER replacement, NEVER a people
--      grafted in by confession: *Hath Elohim (God) cast away his people? Elohim (God) forbid*
--      (Romans 11:1-2 GUARD). Jubilees sings the same restored bond: *they will be My people in truth
--      and righteousness* (Jubilees 1:17).
--   ★ THE WILDERNESS ALLURE / DOOR OF HOPE (THREAD 2): *Therefore, behold, I will allure her, and
--      bring her into the wilderness, and speak comfortably unto her. And I will give her... the
--      valley of Achor for a door of hope: and she shall sing there... as in the day when she came up
--      out of the land of Egypt* (2:14-15). The second wilderness courtship — the new exodus.
--      Jeremiah remembers the first: *the kindness of thy youth... when thou wentest after me in the
--      wilderness* (Jeremiah 2:2); Ezekiel foretells the second plea: *I will bring you into the
--      wilderness of the people, and there will I plead with you face to face* (Ezekiel 20:35); and
--      the valley of Achor — the valley of TROUBLE where Achan was judged (Joshua 7:24) — is made a
--      DOOR OF HOPE. Revelation's woman flees there for refuge: *the woman fled into the wilderness,
--      where she hath a place prepared of Elohim (God)* (Revelation 12:6).
--   ★★ THE BETROTHAL FOREVER (THREAD 3): *I will betroth thee unto me for ever; yea, I will betroth
--      thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies. I will
--      even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (2:19-20). The
--      Bridegroom takes back the harlot-wife as a pure bride. Forward: *Husbands, love your wives,
--      even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25),
--      *that he might present it to himself a glorious church, not having spot, or wrinkle* (5:27);
--      *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7); *a
--      bride adorned for her husband* (Revelation 21:2); *I have espoused you to one husband, that I
--      may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). The Tanakh
--      already named the Husband: *thy Maker is thine husband; Yahuah Tseva'ot (LORD of hosts) is his
--      name* (Isaiah 54:5); and *thou shalt know Yahuah* (2:20) is the new-covenant promise *they
--      shall all know me* (Jeremiah 31:34).
--   THE FEASTS JUDGED, NOT ABOLISHED (THREAD 4): *I will also cause all her mirth to cease, her feast
--      days, her new moons, and her sabbaths, and all her solemn feasts* (2:11). This is judgment on
--      CORRUPTED worship — she kept the appointed times while burning incense to Baalim (2:13) — NOT
--      abolition of the calendar. The feasts are YAHUAH'S: *Concerning the feasts of Yahuah (LORD)...
--      these are my feasts* (Leviticus 23:2); and in the very restoration they STAND: *from one new
--      moon to another, and from one sabbath to another, shall all flesh come to worship before me*
--      (Isaiah 66:23). He removes her false keeping; He never removes His appointed times.
--   ★ NO MORE BAALI / THE EVERLASTING COVENANT (THREAD 5): *thou shalt call me Ishi (my husband); and
--      shalt call me no more Baali (my lord/Baal)... I will take away the names of Baalim out of her
--      mouth* (2:16-17). The renewed name is the renewed marriage. Ezekiel names the same everlasting
--      bond: *I will remember my covenant with thee in the days of thy youth, and I will establish
--      unto thee an everlasting covenant* (Ezekiel 16:60); and the once-forsaken wife is renamed
--      married: *thou shalt no more be termed Forsaken... but thou shalt be called Hephzi-bah... thy
--      land shall be married* (Isaiah 62:4).
--   VERSES WITH NO SEPARATE ADD: v.2-10 + v.12-13 (the lawsuit body — woven into THREADs 1/2/4 as the
--      harlotry the reversal answers; victims not enemies), v.18 (the peace-covenant — woven into
--      THREAD 3's *that day* betrothal frame), v.21-22 (the heavens-hear-the-earth answering — woven
--      into THREAD 1's *I will sow her unto me in the earth*). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Thou art my people — Lo-ammi reversed (the divorced house reclaimed)
    ('canon','hosea',2,23,'canon','romans',9,25,'free',
      E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). Paul quotes Hosea BY NAME: the *I will say to them which were not my people, Thou art my people* (Hosea 2:23) is the word he reads of those Yahuah has called. The northern house named *Lo-ammi* in Hosea 1:9 is the very people now called *my people* — the divorced reclaimed, never a different nation.'),
    ('canon','hosea',2,23,'canon','romans',9,26,'free',
      E'*And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26). This is Hosea 1:10 joined to 2:23 — *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)*. The same place, the same people, the curse-name overturned into son-name; the two-house restoration, not a replacement people.'),
    ('canon','hosea',2,23,'canon','1-peter',2,10,'free',
      E'*Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10). Peter folds both Hosea names into one line — *not a people... now the people* (Lo-ammi→Ammi) and *had not obtained mercy... now have obtained mercy* (Lo-Ruhamah→Ruhamah) — exactly the *I will have mercy upon her that had not obtained mercy... Thou art my people* of Hosea 2:23, spoken to the scattered strangers being gathered home.'),
    ('canon','hosea',2,23,'jubilees','jubilees',1,17,'extras',
      E'*And I shall build My sanctuary in their midst, and I shall dwell with them, and I shall be their Elohim (God) and they will be My people in truth and righteousness* (Jubilees 1:17). The restored bond Hosea promises — *Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — is sung in the restored witness: *they will be My people... and I shall be their Elohim (God)*. The same reversal of Lo-ammi, the dwelling restored.'),
    ('canon','hosea',2,1,'canon','hosea',1,9,'free',
      E'*Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). This is the curse-name the whole of chapter 2 reverses: where Yahuah said *ye are not my people*, He now commands *Say ye unto your brethren, Ammi (my people)* (Hosea 2:1). The divorced northern house — the same people, the same name made new.'),
    ('canon','hosea',2,1,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The *Say ye... Ammi* of Hosea 2:1 is the fulfilment of this very promise — the *not my people* called *the sons of the living Elohim (God)*, the two houses gathered together under one head (Hosea 1:11).'),

    -- THREAD 2 (★): I will allure her into the wilderness — the door of hope (the second exodus)
    ('canon','hosea',2,14,'canon','jeremiah',2,2,'free',
      E'*Go and cry in the ears of Jerusalem, saying, Thus saith Yahuah (LORD); I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2). Hosea''s *I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14) is the SECOND courtship answering the first: Yahuah remembers *the love of thine espousals, when thou wentest after me in the wilderness*, and woos the bride back to it.'),
    ('canon','hosea',2,14,'canon','ezekiel',20,35,'free',
      E'*And I will bring you into the wilderness of the people, and there will I plead with you face to face* (Ezekiel 20:35). The allure into the wilderness of Hosea 2:14 — *I will allure her, and bring her into the wilderness* — is Ezekiel''s same new-exodus plea: gathered out of the nations (20:34), brought into *the wilderness of the people*, met *face to face*. The place of the first covenant becomes the place of its renewal.'),
    ('canon','hosea',2,15,'canon','joshua',7,24,'free',
      E'*And Joshua, and all Yashar''el (Israel) with him, took Achan the son of Zerah... and brought them unto the valley of Achor* (Joshua 7:24). Achor — the valley of TROUBLE, where Achan was judged and *Yahuah (LORD) shall trouble thee this day* (Joshua 7:25) — is the very place Hosea makes *a door of hope*: *I will give her... the valley of Achor for a door of hope* (Hosea 2:15). The place of judgment is turned into the doorway of restoration.'),
    ('canon','hosea',2,14,'canon','revelation',12,6,'free',
      E'*And the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there a thousand two hundred and threescore days* (Revelation 12:6). The wilderness into which Yahuah *allures her* and speaks comfortably (Hosea 2:14) is the place of refuge and nourishment — the woman *hath a place prepared of Elohim (God)* in the wilderness, kept and fed, as in the days of her youth coming up out of Egypt (Hosea 2:15).'),

    -- THREAD 3 (★★): I will betroth thee unto me for ever — the Bridegroom and the bride
    ('canon','hosea',2,19,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). The betrothal *for ever... in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19) is the marriage Paul names: the Bridegroom who *loved the church, and gave himself for it*. Hosea''s harlot-wife taken back in faithfulness is the bride loved unto death.'),
    ('canon','hosea',2,19,'canon','ephesians',5,27,'free',
      E'*That he might present it to himself a glorious church, not having spot, or wrinkle, or any such thing; but that it should be holy and without blemish* (Ephesians 5:27). The wife who played the harlot (Hosea 2:5) is betrothed anew *in righteousness... in faithfulness* (Hosea 2:19-20) — presented at last *a glorious church, not having spot, or wrinkle*. The defiled bride made clean and holy is the very reversal Hosea''s betrothal promises.'),
    ('canon','hosea',2,19,'canon','revelation',19,7,'free',
      E'*Let us be glad and rejoice, and give honour to him: for the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7). The everlasting betrothal of Hosea 2:19 — *I will betroth thee unto me for ever* — comes to its wedding day: *the marriage of the Lamb is come, and his wife hath made herself ready*. The bride betrothed in faithfulness is the wife adorned for the marriage supper.'),
    ('canon','hosea',2,19,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The betrothal *for ever* (Hosea 2:19) is consummated in the New Jerusalem *prepared as a bride adorned for her husband* — the restored people made the eternal bride of the Formed Son, the marriage that never ends.'),
    ('canon','hosea',2,19,'canon','2-corinthians',11,2,'free',
      E'*For I am jealous over you with godly jealousy: for I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2). The harlot-wife of Hosea, betrothed anew *in faithfulness* (Hosea 2:20), is *espoused... to one husband* — *no more Baali* (Hosea 2:16), one Husband only — to be presented *a chaste virgin to Messiah (Christ)*. The jealous-love lawsuit of Hosea becomes the godly jealousy guarding the bride.'),
    ('canon','hosea',2,19,'canon','isaiah',54,5,'free',
      E'*For thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). Hosea''s betrothal names the Husband the Tanakh already declared: *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name*. The One betrothing *for ever* (Hosea 2:19) is the Maker, Husband, and Redeemer of the forsaken wife restored (Isaiah 54:6-7).'),
    ('canon','hosea',2,20,'canon','jeremiah',31,34,'free',
      E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD)* (Jeremiah 31:34). The seal of the betrothal — *and thou shalt know Yahuah (LORD)* (Hosea 2:20) — is the new-covenant promise: *they shall all know me*. The Torah written on the heart (Jeremiah 31:33) is the knowing the betrothed bride receives.'),

    -- THREAD 4: her feasts and sabbaths — corrupted worship judged, the appointed times STAND
    ('canon','hosea',2,11,'canon','leviticus',23,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). When Yahuah causes *her feast days, her new moons, and her sabbaths* to cease (Hosea 2:11), He removes HER corrupt keeping — for she burned incense to Baalim (Hosea 2:13) — not His appointed times: *these are MY feasts*, the holy convocations of Yahuah, which He never abolishes.'),
    ('canon','hosea',2,11,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The new moons and sabbaths made to cease in judgment (Hosea 2:11) are kept FOREVER in the restoration: *from one new moon to another, and from one sabbath to another, shall all flesh come to worship*. Hosea judges the harlot''s corrupt keeping; the appointed times themselves stand to the end of the age.'),

    -- THREAD 5 (★): no more Baali — the renewed name and the everlasting covenant
    ('canon','hosea',2,16,'canon','ezekiel',16,60,'free',
      E'*Nevertheless I will remember my covenant with thee in the days of thy youth, and I will establish unto thee an everlasting covenant* (Ezekiel 16:60). The renewed name of Hosea — *thou shalt call me Ishi (my husband); and shalt call me no more Baali* (Hosea 2:16) — is the renewed marriage Ezekiel names of the same harlot-wife: the covenant *of thy youth* remembered, *an everlasting covenant* established. The unfaithful bride restored to her first Husband.'),
    ('canon','hosea',2,16,'canon','isaiah',62,4,'free',
      E'*Thou shalt no more be termed Forsaken; neither shall thy land any more be termed Desolate... but thou shalt be called Hephzi-bah, and thy land Beulah: for Yahuah (LORD) delighteth in thee, and thy land shall be married* (Isaiah 62:4). The name-change of Hosea — *call me no more Baali* (Hosea 2:16) — is matched by the bride''s new name: no more *Forsaken*, but *Beulah*, married. The harlot reclaimed becomes the delighted-in wife whose land is married to her Maker.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-2-thou-art-my-people-lo-ammi-reversed',
       E'Thou art my people — Lo-ammi reversed, the divorced house reclaimed',
       E'Hosea 2 opens already overturning the curse-names of chapter 1: *Say ye unto your brethren, Ammi (my people); and to your sisters, Ru-hamah (having obtained mercy)* (Hosea 2:1) — and it closes with the full word of restoration: *And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). This is the reversal of the divorce: the northern house named *Lo-ammi, for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9) is called back — *Ammi*, my people. The SAME people, scattered and divorced, gathered home; never a new nation, never replacement. Hosea 1 already held the promise: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Paul quotes Hosea by name of those Yahuah has called: *As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved. And it shall come to pass, that in the place where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:25-26). Peter folds both children''s names into one: *Which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10) — Lo-ammi to Ammi, Lo-Ruhamah to Ruhamah. This is the two-house regathering, the divorced house of Yashar''el (Israel) restored — and it is NEVER a casting-off of His people: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1-2). The restored witness sings the same bond: *I shall be their Elohim (God) and they will be My people in truth and righteousness* (Jubilees 1:17).',
       sv.verse_id, ev.verse_id, 'extras', 44725
  FROM _s328_hos02_lookup sv, _s328_hos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=2 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope',
       E'I will allure her into the wilderness — the valley of Achor a door of hope',
       E'After the lawsuit comes the wooing: *Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her. And I will give her her vineyards from thence, and the valley of Achor for a door of hope: and she shall sing there, as in the days of her youth, and as in the day when she came up out of the land of Egypt* (Hosea 2:14-15). This is the SECOND wilderness courtship — the new exodus. Yahuah takes the harlot-wife back to the place of first love: Jeremiah remembers it — *I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2); Ezekiel foretells the renewed meeting — *I will bring you into the wilderness of the people, and there will I plead with you face to face* (Ezekiel 20:35), gathered out of the nations (20:34). And the valley of Achor — the valley of TROUBLE, where Achan was judged: *Joshua, and all Yashar''el (Israel) with him, took Achan the son of Zerah... and brought them unto the valley of Achor* (Joshua 7:24), and *Yahuah (LORD) shall trouble thee this day* (Joshua 7:25) — that very place of judgment is made *a door of hope*. The wilderness becomes refuge: *the woman fled into the wilderness, where she hath a place prepared of Elohim (God), that they should feed her there* (Revelation 12:6). The trouble-valley is the doorway home; the desert is where she sings again as in the day she came up out of Egypt.',
       sv.verse_id, ev.verse_id, 'free', 44728
  FROM _s328_hos02_lookup sv, _s328_hos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-2-i-will-betroth-thee-unto-me-for-ever',
       E'I will betroth thee unto me for ever — the Bridegroom and the bride restored',
       E'The covenant-lawsuit ends not in divorce but in a wedding vow repeated threefold: *And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies. I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* (Hosea 2:19-20). The wife who *played the harlot* (Hosea 2:5) is taken back as a pure bride — betrothed in righteousness and faithfulness, in *that day* of peace when Yahuah makes *a covenant... with the beasts of the field* and breaks *the bow and the sword* (Hosea 2:18). The Tanakh already named this Husband: *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5). The New Testament unfolds the marriage: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25), *that he might present it to himself a glorious church, not having spot, or wrinkle... but that it should be holy and without blemish* (Ephesians 5:27); *I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2) — one Husband, *no more Baali* (Hosea 2:16). It comes to its wedding day: *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7), and the bride is the city itself — *new Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2). And the betrothal''s seal — *and thou shalt know Yahuah (LORD)* (Hosea 2:20) — is the new covenant: *they shall all know me, from the least of them unto the greatest of them* (Jeremiah 31:34), the Torah written on the heart (Jeremiah 31:33). This is the Formed Son taking His restored people as His eternal bride.',
       sv.verse_id, ev.verse_id, 'free', 44731
  FROM _s328_hos02_lookup sv, _s328_hos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-2-her-feasts-and-sabbaths-corrupted-worship-judged-not-abolished',
       E'Her feasts and her sabbaths to cease — corrupted worship judged, the appointed times stand',
       E'In the lawsuit Yahuah declares: *I will also cause all her mirth to cease, her feast days, her new moons, and her sabbaths, and all her solemn feasts* (Hosea 2:11). This is judgment on CORRUPTED worship, not abolition of the calendar — for the wife kept the appointed times while whoring after Baal: *I will visit upon her the days of Baalim, wherein she burned incense to them... and she went after her lovers, and forgat me, saith Yahuah (LORD)* (Hosea 2:13). The feasts are not hers to corrupt; they are HIS: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) — the seventh-day sabbath and the appointed times, Yahuah''s own calendar. He removes her false keeping; He never removes the days themselves. The proof is the restoration, where the very new moons and sabbaths are kept FOREVER: *And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The appointed times are not the old-covenant scaffolding cast down; they are the architecture of worship that all flesh keeps in the age to come. Hosea judges the harlotry, not the holy convocations.',
       sv.verse_id, ev.verse_id, 'free', 44734
  FROM _s328_hos02_lookup sv, _s328_hos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-2-no-more-baali-the-everlasting-covenant-remembered',
       E'No more Baali — the renewed name and the everlasting covenant remembered',
       E'The renewed marriage is sealed by a renewed name: *And it shall be at that day, saith Yahuah (LORD), that thou shalt call me Ishi (my husband); and shalt call me no more Baali. For I will take away the names of Baalim out of her mouth, and they shall no more be remembered by their name* (Hosea 2:16-17). She will call Him Husband, not Baal (lord); the false-lover names struck from her mouth forever. Ezekiel names the same everlasting bond restored to the same harlot-wife: *Nevertheless I will remember my covenant with thee in the days of thy youth, and I will establish unto thee an everlasting covenant* (Ezekiel 16:60) — the covenant of her youth remembered, not annulled by her unfaithfulness. And the once-forsaken wife receives a new name to match: *Thou shalt no more be termed Forsaken; neither shall thy land any more be termed Desolate... but thou shalt be called Hephzi-bah, and thy land Beulah: for Yahuah (LORD) delighteth in thee, and thy land shall be married* (Isaiah 62:4). No more Baali, no more Forsaken — the harlot reclaimed becomes the delighted-in bride whose very land is married to her Maker.',
       sv.verse_id, ev.verse_id, 'free', 44737
  FROM _s328_hos02_lookup sv, _s328_hos02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=2 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Then said Elohim (God), Call his name Lo-ammi: for ye are not my people* (Hosea 1:9) — the curse-name the whole chapter reverses into *Say ye unto your brethren, Ammi (my people)* (Hosea 2:1).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10) — the promise *Say ye... Ammi* (Hosea 2:1) fulfils; the two houses gathered as one.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25) — Paul quotes Hosea 2:23 BY NAME of those Yahuah has called; the divorced house reclaimed.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *where it was said unto them, Ye are not my people; there shall they be called the children of the living Elohim (God)* (Romans 9:26) — Hosea 2:23 joined to 1:10; same place, same people, curse-name to son-name.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *which in time past were not a people, but are now the people of Elohim (God): which had not obtained mercy, but now have obtained mercy* (1 Peter 2:10) — both Hosea names folded in one (Lo-ammi→Ammi, Lo-Ruhamah→Ruhamah of Hosea 2:23).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I shall be their Elohim (God) and they will be My people in truth and righteousness* (Jubilees 1:17) — the restored witness sings the same Lo-ammi reversal of Hosea 2:23.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-thou-art-my-people-lo-ammi-reversed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2) — the first wilderness courtship Hosea 2:14 woos the bride back to.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will bring you into the wilderness of the people, and there will I plead with you face to face* (Ezekiel 20:35) — the new-exodus plea matching the allure into the wilderness of Hosea 2:14.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *brought them unto the valley of Achor* (Joshua 7:24) — the valley of TROUBLE where Achan was judged, made *a door of hope* in Hosea 2:15.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the woman fled into the wilderness, where she hath a place prepared of Elohim (God)* (Revelation 12:6) — the wilderness of the allure (Hosea 2:14) as the place of refuge and nourishment.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-allure-her-into-the-wilderness-the-door-of-hope'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the Bridegroom of the betrothal *for ever* (Hosea 2:19).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *present it to himself a glorious church, not having spot, or wrinkle* (Ephesians 5:27) — the harlot-wife (Hosea 2:5) betrothed anew *in righteousness... in faithfulness* (Hosea 2:19-20), made clean.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the marriage of the Lamb is come, and his wife hath made herself ready* (Revelation 19:7) — the everlasting betrothal of Hosea 2:19 come to its wedding day.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*new Jerusalem... prepared as a bride adorned for her husband* (Revelation 21:2) — the betrothal *for ever* (Hosea 2:19) consummated, the restored people the eternal bride.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I have espoused you to one husband, that I may present you as a chaste virgin to Messiah (Christ)* (2 Corinthians 11:2) — one Husband, *no more Baali* (Hosea 2:16); the harlot betrothed *in faithfulness* (Hosea 2:20).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *thy Maker is thine husband; Yahuah Tseva''ot (LORD of hosts) is his name; and thy Redeemer the Holy One of Yashar''el (Israel)* (Isaiah 54:5) — the Tanakh names the Husband of the betrothal (Hosea 2:19).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=19
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *they shall all know me, from the least of them unto the greatest of them* (Jeremiah 31:34) — the seal of the betrothal, *and thou shalt know Yahuah (LORD)* (Hosea 2:20), is the new-covenant knowing.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-i-will-betroth-thee-unto-me-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Concerning the feasts of Yahuah (LORD)... even these are my feasts* (Leviticus 23:2) — the appointed times are HIS, not the harlot''s to corrupt (Hosea 2:11); judgment falls on her keeping, not the calendar.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-her-feasts-and-sabbaths-corrupted-worship-judged-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the very days made to cease (Hosea 2:11) are kept FOREVER in the restoration; the appointed times stand.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-her-feasts-and-sabbaths-corrupted-worship-judged-not-abolished'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will remember my covenant with thee in the days of thy youth, and I will establish unto thee an everlasting covenant* (Ezekiel 16:60) — the renewed marriage behind the renewed name *Ishi... no more Baali* (Hosea 2:16).'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=16 AND tv.verse_number=60
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-no-more-baali-the-everlasting-covenant-remembered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *thou shalt no more be termed Forsaken... but thou shalt be called Hephzi-bah, and thy land Beulah... thy land shall be married* (Isaiah 62:4) — the new name matching *no more Baali* (Hosea 2:16); the harlot reclaimed, delighted-in, married.'
  FROM cross_reference_threads t
  JOIN _s328_hos02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s328_hos02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-2-no-more-baali-the-everlasting-covenant-remembered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_3.sql (Hosea 3) -----
-- Chapter: Hosea 3 (5 verses) — THE REDEEMED WIFE BOUGHT BACK, then the long exile and the
-- latter-day return. Yahuah commands the sign-marriage again: *Go yet, love a woman beloved of
-- her friend, yet an adulteress, according to the love of Yahuah (LORD) toward the children of
-- Yashar'el (Israel)* (3:1) — and the prophet pays the price: *So I bought her to me for fifteen
-- pieces of silver, and for an homer of barley, and an half homer of barley* (3:2). The bought-
-- back adulteress is the unfaithful house Yahuah loves WHILE she is unfaithful and pays a price to
-- redeem — the bride forward (1 Corinthians 6:20/7:23 "bought with a price," Titus 2:14, 1 Peter
-- 1:18-19, Ephesians 5:25; loved-while-unfaithful Romans 5:8). Then the long exile and the return:
-- *the children of Yashar'el (Israel) shall abide many days without a king, and without a prince,
-- and without a sacrifice... Afterward shall the children of Yashar'el (Israel) return, and seek
-- Yahuah (LORD) their Elohim (God), and David their king; and shall fear Yahuah (LORD) and his
-- goodness in the latter days* (3:4-5). The northern house's long exile, then the RETURN seeking
-- Yahuah AND David their king = the Davidic Messiah, the Formed Son who HAS a Father (Ezekiel
-- 34/37, Jeremiah 30:9, Deuteronomy 4:30; forward Luke 1:32-33, Acts 15:16, Romans 11:25-26;
-- out to 2 Esdras 13 the ten tribes returning in the latter time). The two-house regathering,
-- NEVER replacement.
-- Tag: hos03   Temp view: _s328_hos03_lookup
-- Sort band: base 44750, step 3 -> threads at 44750, 44753 (2 threads)
-- Source of EVERY row: 'canon','hosea',3,v
--
-- Hosea 3 coverage:
--   ★ v.1-3 (Go yet, love a woman beloved of her friend, yet an adulteress, according to the love
--          of Yahuah toward the children of Yashar'el... So I bought her to me for fifteen pieces
--          of silver, and for an homer of barley, and an half homer of barley)
--        NT:     ★ 1 Corinthians 6:20 (ye are bought with a price), 1 Corinthians 7:23 (Ye are
--                bought with a price), Titus 2:14 (gave himself for us, that he might redeem us...
--                a peculiar people), 1 Peter 1:18-19 (not redeemed with corruptible things, as
--                silver and gold... but with the precious blood of Messiah), Ephesians 5:25
--                (Messiah also loved the church, and gave himself for it), Romans 5:8 (while we
--                were yet sinners, Messiah died for us) — THREAD 1
--        Extras: none warranted distinct (the redemption-price weave is fully carried by the NT;
--                no clean extras add forced on the bought-back wife)
--        Tanakh: woven in prose (Yahuah's love toward Yashar'el = the covenant marriage of
--                Hosea 1-2); the latter-day restoration of that bride is carried in THREAD 2
--   ★★ v.4-5 (the children of Yashar'el shall abide many days without a king, and without a
--          prince, and without a sacrifice... Afterward shall the children of Yashar'el return,
--          and seek Yahuah their Elohim, and David their king; and shall fear Yahuah and his
--          goodness in the latter days)
--        NT:     ★★ Luke 1:32-33 (Yahuah Elohim shall give unto him the throne of his father
--                David... he shall reign over the house of Jacob for ever), Acts 15:16 (I will
--                return, and will build again the tabernacle of David), ★ Romans 11:25-26
--                (blindness in part... until the fulness of the Gentiles be come in. And so all
--                Yashar'el shall be saved) — THREAD 2
--        Extras: ★ 2 Esdras 13:40 (Those are the ten tribes, which were carried away prisoners),
--                2 Esdras 13:46 (Then dwelt they there until the latter time; and now when they
--                shall begin to come) — THREAD 2 (the northern house's exile + latter-time return)
--        Tanakh: ★★ Ezekiel 34:23-24 (my servant David... he shall be their shepherd... and my
--                servant David a prince among them), ★★ Ezekiel 37:24-25 (David my servant shall
--                be king over them... my servant David shall be their prince for ever), ★ Jeremiah
--                30:9 (they shall serve Yahuah their Elohim, and David their king, whom I will
--                raise up unto them), ★ Deuteronomy 4:30 (in the latter days, if thou turn to
--                Yahuah Elohayka... and shalt be obedient unto his voice) — THREAD 2
--   v.3 (Thou shalt abide for me many days; thou shalt not play the harlot... so will I also be
--          for thee) — woven into THREAD 1 prose (the redeemed wife sequestered) and THREAD 2
--          (the "many days" of waiting answered by the "afterward" return); no separate add.
--   v.4 (without a king... without a sacrifice... without an ephod) — bound into THREAD 2's prose
--          (the long exile that the "afterward" of v.5 reverses); not a separate member-less thread.
--
-- Threads (slug — target libraries):
--   1. hosea-3-i-bought-her-to-me-the-redeemed-wife — NT (1 Corinthians 6/7, Titus 2, 1 Peter 1,
--      Ephesians 5, Romans 5) [free]
--      (★ the adulteress loved while unfaithful, bought back at a price = the redeemed bride)
--   2. hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days — Tanakh (Ezekiel 34, Ezekiel
--      37, Jeremiah 30, Deuteronomy 4) + NT (Luke 1, Acts 15, Romans 11) + Extras (2 Esdras 13) [extras]
--      (★★ many days without a king, then the latter-day return to Yahuah AND David their king =
--      the Davidic Messiah; the two-house regathering, never replacement)
--
-- Framing notes:
--   ★ THE BOUGHT-BACK WIFE (THREAD 1): *Then said Yahuah (LORD) unto me, Go yet, love a woman
--      beloved of her friend, yet an adulteress, according to the love of Yahuah (LORD) toward the
--      children of Yashar'el (Israel)* (3:1) — Yahuah loves her WHILE she is unfaithful, which is
--      the gospel grammar exactly: *while we were yet sinners, Messiah (Christ) died for us*
--      (Romans 5:8). And He pays a price: *So I bought her to me for fifteen pieces of silver, and
--      for an homer of barley, and an half homer of barley* (3:2). The bought-back adulteress is
--      the redeemed bride: *ye are bought with a price* (1 Corinthians 6:20; 7:23), *not redeemed
--      with corruptible things, as silver and gold... but with the precious blood of Messiah*
--      (1 Peter 1:18-19) — the higher price than Hosea's silver-and-barley. *Messiah also loved
--      the church, and gave himself for it* (Ephesians 5:25); *gave himself for us, that he might
--      redeem us from all iniquity, and purify unto himself a peculiar people* (Titus 2:14) —
--      redemption UNTO purity, the very sequestering Hosea imposes: *Thou shalt abide for me many
--      days; thou shalt not play the harlot* (3:3).
--   ★★ THE LATTER-DAY RETURN TO DAVID THEIR KING (THREAD 2): *the children of Yashar'el (Israel)
--      shall abide many days without a king, and without a prince, and without a sacrifice... and
--      without an ephod* (3:4) — the long exile of the northern house, stripped of throne and
--      altar. Then the turn: *Afterward shall the children of Yashar'el (Israel) return, and seek
--      Yahuah (LORD) their Elohim (God), and David their king; and shall fear Yahuah (LORD) and his
--      goodness in the latter days* (3:5). They seek BOTH Yahuah AND David their king — the Davidic
--      Messiah, the Formed Son who HAS a Father (not co-equal grammar): *I will set up one shepherd
--      over them... even my servant David... and my servant David a prince among them* (Ezekiel
--      34:23-24); *David my servant shall be king over them... my servant David shall be their
--      prince for ever* (Ezekiel 37:24-25); *they shall serve Yahuah (LORD) their Elohim (God),
--      and David their king, whom I will raise up unto them* (Jeremiah 30:9). The "latter days"
--      turning is Moses' own promise: *in the latter days, if thou turn to Yahuah Elohayka (the
--      LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30). Forward: the angel
--      names the King — *Yahuah Elohim (the Lord God) shall give unto him the throne of his father
--      David... and he shall reign over the house of Jacob for ever* (Luke 1:32-33); James seals
--      the regathering — *I will return, and will build again the tabernacle of David, which is
--      fallen down* (Acts 15:16); and the mystery — *blindness in part is happened to Yashar'el
--      (Israel), until the fulness of the Gentiles be come in. And so all Yashar'el (Israel) shall
--      be saved* (Romans 11:25-26): the return of the scattered house, NEVER a replacement people.
--      The restored witness shows the very ten tribes: *Those are the ten tribes, which were
--      carried away prisoners* (2 Esdras 13:40), who *dwelt they there until the latter time; and
--      now when they shall begin to come* (2 Esdras 13:46) — the northern house's "many days" of
--      exile and their latter-time return.
--   EXTRAS: 2 Esdras 13 (the ten tribes carried captive, returning in the latter time) — a clean
--      witness on the northern-house exile-and-return; verified parse. No extras forced on the
--      bought-back wife of THREAD 1.
--   VERSES WITH NO SEPARATE ADD: v.3 (the sequestered wife — woven into THREAD 1's redemption-unto-
--      purity prose and THREAD 2's "many days"); v.4 (the stripped exile — bound into THREAD 2's
--      prose as the long absence the "afterward" of v.5 reverses). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): I bought her to me — the redeemed wife (loved while unfaithful, bought at a price)
    ('canon','hosea',3,2,'canon','1-corinthians',6,20,'free',
      E'*For ye are bought with a price: therefore glorify Elohim (God) in your body, and in your spirit, which are Elohim''s (God''s)* (1 Corinthians 6:20). Hosea pays a price for the adulterous wife — *So I bought her to me for fifteen pieces of silver, and for an homer of barley, and an half homer of barley* (Hosea 3:2). The bought-back wife is every redeemed one: *ye are bought with a price*, no longer her own, belonging now to the One who paid for her.'),
    ('canon','hosea',3,2,'canon','1-corinthians',7,23,'free',
      E'*Ye are bought with a price; be not ye the servants of men* (1 Corinthians 7:23). The wife Hosea *bought... to me* (Hosea 3:2) is sequestered to one master — *thou shalt not be for another man: so will I also be for thee* (3:3). The redeemed are *bought with a price* and belong to Yahuah alone, *not... the servants of men*.'),
    ('canon','hosea',3,1,'canon','titus',2,14,'free',
      E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). Yahuah loves the adulteress *according to the love of Yahuah (LORD) toward the children of Yashar''el (Israel)* (Hosea 3:1) and buys her back — to make her His own pure people. The Messiah does the same: *gave himself... that he might redeem us from all iniquity, and purify unto himself a peculiar people* — redemption UNTO purity, the very sequestering of *thou shalt not play the harlot* (3:3).'),
    ('canon','hosea',3,2,'canon','1-peter',1,18,'free',
      E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers* (1 Peter 1:18). Hosea redeems his wife with *fifteen pieces of silver, and... barley* (Hosea 3:2) — corruptible things; the greater redemption is by a higher price, *not... with corruptible things, as silver and gold*. The silver of Hosea is the shadow of the precious blood.'),
    ('canon','hosea',3,2,'canon','1-peter',1,19,'free',
      E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The price Hosea paid — *fifteen pieces of silver, and for an homer of barley, and an half homer of barley* (Hosea 3:2) — is fulfilled in *the precious blood of Messiah (Christ)*, the price that truly buys back the adulterous bride and makes her clean.'),
    ('canon','hosea',3,1,'canon','ephesians',5,25,'free',
      E'*Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25). Hosea is commanded to *love a woman... yet an adulteress, according to the love of Yahuah (LORD) toward the children of Yashar''el (Israel)* (Hosea 3:1) — love that gives itself for the unworthy. *Messiah (Christ) also loved the church, and gave himself for it*: the same redeeming, self-giving love for the bride.'),
    ('canon','hosea',3,1,'canon','romans',5,8,'free',
      E'*But Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). Yahuah commands love for the wife while she is *yet an adulteress* (Hosea 3:1) — He loves her in her unfaithfulness. This is the gospel grammar exactly: *while we were yet sinners, Messiah (Christ) died for us*. Love spent on the unworthy, before any return.'),

    -- THREAD 2 (★★): seek Yahuah and David their king in the latter days (many days, then the return)
    ('canon','hosea',3,5,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The return seeks *David their king* (Hosea 3:5); Ezekiel names that king the one shepherd — *even my servant David... he shall be their shepherd* — the Davidic Messiah set over the gathered flock.'),
    ('canon','hosea',3,5,'canon','ezekiel',34,24,'free',
      E'*And I Yahuah (LORD) will be their Elohim (God), and my servant David a prince among them; I Yahuah (LORD) have spoken it* (Ezekiel 34:24). Hosea''s returning house seeks BOTH *Yahuah (LORD) their Elohim (God), and David their king* (Hosea 3:5) — and Ezekiel says exactly both: *I Yahuah (LORD) will be their Elohim (God), and my servant David a prince among them*. The Father and the Davidic Son together, never collapsed into one.'),
    ('canon','hosea',3,5,'canon','ezekiel',37,24,'free',
      E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24). The latter-day return to *David their king* (Hosea 3:5) is the two-stick regathering: one king over the rejoined houses, who keeps Torah — *they shall also walk in my judgments, and observe my statutes, and do them*. The return seeks the King AND the obedience, never one without the other.'),
    ('canon','hosea',3,5,'canon','ezekiel',37,25,'free',
      E'*And they shall dwell in the land that I have given unto Jacob my servant... and my servant David shall be their prince for ever* (Ezekiel 37:25). The *afterward* return of Hosea 3:5 lands here: the scattered house dwelling again in the land, *my servant David... their prince for ever* — the everlasting Davidic throne the returning ones seek.'),
    ('canon','hosea',3,5,'canon','jeremiah',30,9,'free',
      E'*But they shall serve Yahuah (LORD) their Elohim (God), and David their king, whom I will raise up unto them* (Jeremiah 30:9). Jeremiah echoes Hosea 3:5 nearly word for word: *seek Yahuah (LORD) their Elohim (God), and David their king*. The same two objects of the return — Yahuah and the raised-up David — the Davidic Messiah whom Yahuah *will raise up*.'),
    ('canon','hosea',3,5,'canon','deuteronomy',4,30,'free',
      E'*When thou art in tribulation, and all these things are come upon thee, even in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30). The *latter days* return of Hosea 3:5 is Moses'' own covenant promise: after the exile-tribulation, *in the latter days, if thou turn to Yahuah Elohayka*. The Torah foretold the scattering and the turning home.'),
    ('canon','hosea',3,5,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The *David their king* whom the returning house seeks (Hosea 3:5) is named: the Son of the Highest given *the throne of his father David*. The Formed Son who HAS a Father — *Yahuah Elohim (the Lord God) shall give unto him* the throne.'),
    ('canon','hosea',3,5,'canon','luke',1,33,'free',
      E'*And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The latter-day return to David their king (Hosea 3:5) is fulfilled in the One who *shall reign over the house of Jacob for ever* — the gathered house of Jacob, the everlasting Davidic reign the returning ones come home to.'),
    ('canon','hosea',3,5,'canon','acts',15,16,'free',
      E'*After this I will return, and will build again the tabernacle of David, which is fallen down; and I will build again the ruins thereof, and I will set it up* (Acts 15:16). The house that abode *many days without a king* (Hosea 3:4) and then returns to *David their king* (3:5) is the fallen tabernacle of David rebuilt — James reads the prophets as the regathering: *I will return, and will build again the tabernacle of David, which is fallen down*.'),
    ('canon','hosea',3,5,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery... that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The *many days* without king or sacrifice (Hosea 3:4) is the partial blindness with an appointed end — *until the fulness of the Gentiles be come in*. The exile of the northern house is timed, not final.'),
    ('canon','hosea',3,5,'canon','romans',11,26,'free',
      E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). The *afterward* return of Hosea 3:5 IS this: *all Yashar''el (Israel) shall be saved* — the scattered house gathered and turned home by the Deliverer out of Sion. The two-house regathering, NEVER a replacement people.'),
    ('canon','hosea',3,4,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). Hosea''s *many days without a king, and without a prince, and without a sacrifice* (Hosea 3:4) is the exile of these very ten tribes — *carried away prisoners out of their own land* by Assyria, the northern house stripped of throne and altar.'),
    ('canon','hosea',3,5,'apocrypha','2-esdras',13,46,'extras',
      E'*Then dwelt they there until the latter time; and now when they shall begin to come* (2 Esdras 13:46). The *afterward... in the latter days* return of Hosea 3:5 is the latter-time coming of the scattered ten tribes — *until the latter time; and now when they shall begin to come*. The restored witness sees the northern house begin its homeward return.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-3-i-bought-her-to-me-the-redeemed-wife',
       E'I bought her to me — the adulterous wife loved while unfaithful and bought back at a price',
       E'Yahuah commands the sign-marriage a second time, and the command is the gospel before the gospel: *Then said Yahuah (LORD) unto me, Go yet, love a woman beloved of her friend, yet an adulteress, according to the love of Yahuah (LORD) toward the children of Yashar''el (Israel), who look to other gods, and love flagons of wine* (Hosea 3:1). She is loved WHILE she is *yet an adulteress* — which is exactly how Yahuah loves: *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). And the love costs: *So I bought her to me for fifteen pieces of silver, and for an homer of barley, and an half homer of barley* (Hosea 3:2). The bought-back adulteress is the redeemed bride: *ye are bought with a price* (1 Corinthians 6:20); *Ye are bought with a price; be not ye the servants of men* (1 Corinthians 7:23). Hosea''s silver-and-barley is the shadow of a higher price — *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:18-19). It is the husband''s own self spent for the unworthy bride: *Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25); *Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14) — redemption UNTO purity, the very sequestering Hosea then imposes: *Thou shalt abide for me many days; thou shalt not play the harlot, and thou shalt not be for another man: so will I also be for thee* (3:3). She is bought to be made faithful, not left in her harlotry.',
       sv.verse_id, ev.verse_id, 'free', 44750
  FROM _s328_hos03_lookup sv, _s328_hos03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days',
       E'Seek Yahuah and David their king in the latter days — the long exile and the two-house return',
       E'The sign-marriage opens into prophecy of the northern house: *For the children of Yashar''el (Israel) shall abide many days without a king, and without a prince, and without a sacrifice, and without an image, and without an ephod, and without teraphim* (Hosea 3:4) — the long exile, stripped of throne and altar alike, the bride sequestered *many days* (3:3). Then the turn: *Afterward shall the children of Yashar''el (Israel) return, and seek Yahuah (LORD) their Elohim (God), and David their king; and shall fear Yahuah (LORD) and his goodness in the latter days* (3:5). They seek TWO together — Yahuah their Elohim AND David their king — the Father and the Davidic Son, the Formed One who has a Father, never collapsed into one. The prophets name that king plainly: *I will set up one shepherd over them... even my servant David... and my servant David a prince among them; I Yahuah (LORD) have spoken it* (Ezekiel 34:23-24); *And David my servant shall be king over them... they shall also walk in my judgments, and observe my statutes, and do them... and my servant David shall be their prince for ever* (Ezekiel 37:24-25) — the return seeks the King AND the Torah-obedience together; *they shall serve Yahuah (LORD) their Elohim (God), and David their king, whom I will raise up unto them* (Jeremiah 30:9). The *latter days* turning is Moses'' own covenant word: *in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30). Forward, the King is named: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever* (Luke 1:32-33); and James reads the regathering — *I will return, and will build again the tabernacle of David, which is fallen down* (Acts 15:16). The exile is timed, not final, and ends in salvation for the whole scattered house: *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26) — the two-house regathering, NEVER a replacement people. The restored witness sees the very tribes: *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40), who *dwelt they there until the latter time; and now when they shall begin to come* (2 Esdras 13:46) — Hosea''s *many days* of exile and the latter-time homeward return of the northern house.',
       sv.verse_id, ev.verse_id, 'extras', 44753
  FROM _s328_hos03_lookup sv, _s328_hos03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *ye are bought with a price* (1 Corinthians 6:20) — the wife Hosea *bought... to me* (Hosea 3:2) is every redeemed one, no longer her own.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Ye are bought with a price; be not ye the servants of men* (1 Corinthians 7:23) — the bought-back wife is sequestered to one master, *thou shalt not be for another man* (Hosea 3:3).'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people* (Titus 2:14) — Yahuah loves the adulteress (Hosea 3:1) to redeem her UNTO purity, the sequestering of *thou shalt not play the harlot* (3:3).'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye were not redeemed with corruptible things, as silver and gold* (1 Peter 1:18) — Hosea''s *fifteen pieces of silver, and... barley* (Hosea 3:2) is the corruptible shadow of the greater price.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19) — the true price that buys back the bride Hosea purchased with silver (Hosea 3:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25) — the same self-giving love Hosea is commanded for the *adulteress* (Hosea 3:1).'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8) — the gospel grammar of loving the wife *yet an adulteress* (Hosea 3:1), love spent before any return.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-i-bought-her-to-me-the-redeemed-wife'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *even my servant David... he shall be their shepherd* (Ezekiel 34:23) — the *David their king* the returning house seeks (Hosea 3:5), the one shepherd over the flock.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I Yahuah (LORD) will be their Elohim (God), and my servant David a prince among them* (Ezekiel 34:24) — the exact two of Hosea 3:5, *Yahuah their Elohim, and David their king*: Father and Davidic Son together.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *David my servant shall be king over them... they shall also walk in my judgments, and observe my statutes, and do them* (Ezekiel 37:24) — the two-stick regathering: one king, and the Torah kept; the return of Hosea 3:5 seeks both.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they shall dwell in the land... and my servant David shall be their prince for ever* (Ezekiel 37:25) — the *afterward* return (Hosea 3:5) lands in the land under the everlasting Davidic throne.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *they shall serve Yahuah (LORD) their Elohim (God), and David their king, whom I will raise up unto them* (Jeremiah 30:9) — Hosea 3:5 nearly word for word: Yahuah and the raised-up David sought together.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=30 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30) — Moses'' covenant promise of the *latter days* turning home that Hosea 3:5 announces.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — *David their king* (Hosea 3:5) named: the Formed Son who HAS a Father, given the Davidic throne.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33) — the gathered house of Jacob under the everlasting reign the returning ones come home to (Hosea 3:5).'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*I will return, and will build again the tabernacle of David, which is fallen down* (Acts 15:16) — the house that abode *many days without a king* (Hosea 3:4) is the fallen tabernacle of David rebuilt; James reads the prophets as the regathering.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — the *many days* without king or sacrifice (Hosea 3:4) is the partial blindness with an appointed end, the exile timed, not final.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'★ *And so all Yashar''el (Israel) shall be saved... There shall come out of Sion the Deliverer* (Romans 11:26) — the *afterward* return of Hosea 3:5: the scattered house gathered by the Deliverer, the two-house regathering, NEVER replacement.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'★ *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the *many days without a king, and without a prince, and without a sacrifice* (Hosea 3:4) is the exile of these very ten tribes of the northern house.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 13, E'★ *Then dwelt they there until the latter time; and now when they shall begin to come* (2 Esdras 13:46) — the *afterward... in the latter days* return (Hosea 3:5): the northern house''s latter-time homeward coming.'
  FROM cross_reference_threads t
  JOIN _s328_hos03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s328_hos03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-3-seek-yahuah-and-david-their-king-in-the-latter-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_4.sql (Hosea 4) -----
-- Chapter: Hosea 4 — THE COVENANT-LAWSUIT and the anti-antinomian keystone. *Yahuah (LORD)
-- hath a controversy with the inhabitants of the land, because there is no truth, nor mercy,
-- nor knowledge of Elohim (God) in the land. By swearing, and lying, and killing, and stealing,
-- and committing adultery, they break out, and blood toucheth blood* (4:1-2) — the listed sins
-- are the broken Ten Words (Exodus 20), the formal indictment for breaking the Torah, the Torah
-- AFFIRMED as the binding standard. ★★★ The keystone: *My people are destroyed for lack of
-- knowledge: because thou hast rejected knowledge... seeing thou hast forgotten the law of thy
-- Elohim (God), I will also forget thy children* (4:6) — the ruin comes from REJECTING knowledge
-- and FORGETTING the Torah; the anti-antinomian verse the whole framework is built to defend
-- (1 John 2:3-4: knowing Him IS keeping His commandments). The priests feed on the people's sin
-- (4:7-9); the spirit of whoredoms drives high-place worship (4:10-14); and Yahudah is warned not
-- to follow harlot Yashar'el (4:15-17) — the two-house distinction.
-- Tag: hos04   Temp view: _s328_hos04_lookup
-- Sort band: base 44775, step 3 -> threads at 44775, 44778, 44781, 44784, 44787 (5 threads)
-- Source of EVERY row: 'canon','hosea',4,v
--
-- Hosea 4 coverage:
--   ★★ v.1-2 (Yahuah hath a controversy... no truth, nor mercy, nor knowledge... By swearing, and
--          lying, and killing, and stealing, and committing adultery, they break out)
--        NT:     ★ Romans 13:9 (Thou shalt not commit adultery, Thou shalt not kill, Thou shalt
--                not steal... briefly comprehended in... love thy neighbour) — THREAD 1 (the same
--                Decalogue still binding, fulfilled in love)
--        Extras: none warranted (the Decalogue indictment is canon-internal; Torah witnesses go on 4:6)
--        Tanakh: ★★ Exodus 20:13-16 (Thou shalt not kill / commit adultery / steal / bear false
--                witness) — THREAD 1 (the broken Ten Words being named); ★ Jeremiah 7:9 (Will ye
--                steal, murder, and commit adultery, and swear falsely... and walk after other gods)
--                — THREAD 1 (Jeremiah's twin lawsuit, same broken commandments)
--   ★★★ v.6 (My people are destroyed for lack of knowledge... thou hast forgotten the law of thy
--          Elohim) — THE KEYSTONE
--        NT:     ★★★ 1 John 2:3-4 (hereby we do know that we know him, if we keep his commandments;
--                He that saith, I know him, and keepeth not his commandments, is a liar) — THREAD 2
--                (the master filter: knowledge of Him = Torah-keeping)
--        Extras: ★★ Baruch 4:1 (the book of the commandments... the law that endureth for ever:
--                all they that keep it shall come to life; but such as leave it shall die) + 4:2
--                (Turn you, O Jacob, and take hold of it) — THREAD 2; ★ Sirach/Ecclesiasticus 15:1
--                (he that has the knowledge of the law shall obtain her) — THREAD 2
--        Tanakh: ★★ Malachi 2:7 (the priest's lips should keep knowledge, and they should seek the
--                law at his mouth) — THREAD 2 (the priest's failed charge, why no-priest-to-me);
--                ★ Isaiah 5:13 (my people are gone into captivity, because they have no knowledge)
--                — THREAD 2 (the same ruin for the same lack); ★ Proverbs 1:7 (The fear of Yahuah
--                is the beginning of knowledge: but fools despise wisdom and instruction) — THREAD 2
--   v.4-5,7-9 (the strife with the priest; like people, like priest; they eat up the sin of my
--          people) — the priestly indictment
--        NT:     ★ Matthew 15:6-9 (made the commandment of Elohim of none effect by your tradition...
--                in vain they do worship me, teaching for doctrines the commandments of men) —
--                THREAD 3 (priests/teachers nullifying the Torah by their own corruption)
--        Extras: none warranted
--        Tanakh: held in THREAD 2/3 prose (the rejected-knowledge priest of v.6 IS the corrupt
--                priest of v.4-9); Malachi 2:7-8 also frames the failed priest (THREAD 2)
--   ★ v.12-14 (the spirit of whoredoms... sacrifice upon the tops of the mountains, and burn
--          incense upon the hills, under oaks and poplars) — high-place harlotry
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 12:2 (destroy all the places... upon the high mountains, and upon
--                the hills, and under every green tree) — THREAD 4 (the very rites Torah forbade);
--                ★ Jeremiah 3:6 (backsliding Yashar'el... gone up upon every high mountain and
--                under every green tree, and there hath played the harlot) — THREAD 4
--   ★ v.15-17 (Though thou, Yashar'el, play the harlot, yet let not Yahudah offend... Ephraim is
--          joined to idols: let him alone) — the two-house distinction
--        NT:     none warranted distinct (the regathering forward-weave held in prose)
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 3:8 (backsliding Yashar'el... I had put her away, and given her a bill
--                of divorce; yet her treacherous sister Yahudah feared not, but... played the harlot
--                also) — THREAD 5 (the two sisters, the divorced north); ★★ Ezekiel 37:19 (I will
--                take the stick of Joseph... and the stick of Yahudah, and make them one stick) —
--                THREAD 5 (the two made one — the regathering guard); ★ Hosea 1:10 (in the place
--                where it was said unto them, Ye are not my people, there it shall be said... Ye are
--                the sons of the living Elohim) — THREAD 5 (Lo-Ammi reversed, never cast off)
--
-- Threads (slug — target libraries):
--   1. hosea-4-yahuah-hath-a-controversy-the-broken-ten-words — Tanakh (Exodus 20, Jeremiah 7) +
--      NT (Romans 13) [free]  (★★ the covenant-lawsuit = the broken Decalogue; Torah-affirmed)
--   2. hosea-4-my-people-are-destroyed-for-lack-of-knowledge — Tanakh (Malachi 2, Isaiah 5,
--      Proverbs 1) + NT (1 John 2) + Extras (Baruch 4, Ecclesiasticus 15) [extras]
--      (★★★ THE KEYSTONE: forgotten the Torah; knowing Him = keeping His commandments)
--   3. hosea-4-like-people-like-priest-the-commandment-made-void — NT (Matthew 15) [free]
--      (the corrupt priests/teachers nullify the Torah; commandments of men for doctrine)
--   4. hosea-4-they-sacrifice-upon-the-tops-of-the-mountains — Tanakh (Deuteronomy 12, Jeremiah 3)
--      [free]  (★ high-place harlotry = the very rites the Torah forbade)
--   5. hosea-4-let-not-yahudah-offend-the-two-house-distinction — Tanakh (Jeremiah 3, Ezekiel 37,
--      Hosea 1) [free]  (★ the two houses: harlot Yashar'el / let not Yahudah follow; made one again)
--
-- Framing notes:
--   ★★ THE COVENANT-LAWSUIT (THREAD 1): *Yahuah (LORD) hath a controversy with the inhabitants of
--      the land... By swearing, and lying, and killing, and stealing, and committing adultery, they
--      break out, and blood toucheth blood* (4:1-2). The bill of indictment is the broken Ten Words:
--      *Thou shalt not kill... Thou shalt not commit adultery... Thou shalt not steal... Thou shalt
--      not bear false witness* (Exodus 20:13-16). This is the Torah AFFIRMED — the prophet sues the
--      land FOR breaking it, never against it. Jeremiah brings the identical lawsuit (Jeremiah 7:9),
--      and Paul names the same commandments still binding, fulfilled in love (Romans 13:9).
--   ★★★ THE KEYSTONE (THREAD 2): *My people are destroyed for lack of knowledge: because thou hast
--      rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou
--      hast forgotten the law of thy Elohim (God), I will also forget thy children* (4:6). The ruin
--      is rejecting knowledge and FORGETTING the Torah — the anti-antinomian verse. The priest's own
--      charge was to KEEP it: *the priest's lips should keep knowledge, and they should seek the law
--      at his mouth* (Malachi 2:7). 1 John seals it as the master filter — *hereby we do know that
--      we know him, if we keep his commandments* (1 John 2:3-4). Baruch is the superb clean witness:
--      *the law that endureth for ever: all they that keep it shall come to life; but such as leave
--      it shall die* (Baruch 4:1). Isaiah 5:13 (captivity for no knowledge), Proverbs 1:7 (fear of
--      Yahuah the beginning of knowledge), Sirach 15:1 (knowledge of the law) complete the weave.
--   THE CORRUPT PRIEST (THREAD 3): *there shall be, like people, like priest... They eat up the sin
--      of my people* (4:8-9). Yahusha names the same crime in Israel's teachers: *Thus have ye made
--      the commandment of Elohim (God) of none effect by your tradition... in vain they do worship
--      me, teaching for doctrines the commandments of men* (Matthew 15:6,9) — the priest who should
--      have fed the people knowledge instead voids the Torah; conduct-within-the-covenant, not the
--      Torah at fault.
--   HIGH-PLACE HARLOTRY (THREAD 4): *They sacrifice upon the tops of the mountains, and burn incense
--      upon the hills, under oaks and poplars and elms* (4:13) — the precise rites the Torah commanded
--      be destroyed: *destroy all the places... upon the high mountains, and upon the hills, and under
--      every green tree* (Deuteronomy 12:2); Jeremiah sees the same harlotry (Jeremiah 3:6).
--   ★ THE TWO HOUSES (THREAD 5): *Though thou, Yashar'el (Israel), play the harlot, yet let not
--      Yahudah (Judah) offend... Ephraim is joined to idols: let him alone* (4:15,17). This is the
--      two-house distinction: the divorced northern house (Jeremiah 3:8, the bill of divorce) and the
--      warned southern sister. But never cast off — Lo-Ammi is reversed (*Ye are the sons of the
--      living Elohim*, Hosea 1:10), and the two sticks become one (Ezekiel 37:19). Victims and lost
--      sheep, gathered home; not enemies, not replaced.
--   VERSES WITH NO SEPARATE ADD: v.3 (the land mourns — the lawsuit's sentence, woven into THREAD 1),
--      v.5 (thou shalt fall... I will destroy thy mother — the verdict, THREAD 2/3 prose), v.7 (their
--      glory into shame — THREAD 3 prose), v.10-11 (whoredom and wine take away the heart — preface to
--      THREAD 4), v.16 (Yashar'el slideth back as a backsliding heifer — THREAD 5 prose), v.18-19
--      (their drink is sour... the wind hath bound her up — the closing judgment, THREAD 4/5 prose).
--      All weighed, none silently skipped.

CREATE TEMP VIEW _s328_hos04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Yahuah hath a controversy — the broken Ten Words (Torah-affirmed lawsuit)
    ('canon','hosea',4,2,'canon','exodus',20,13,'free',
      E'*Thou shalt not kill* (Exodus 20:13). When Yahuah''s controversy lists *killing* among the sins by which *they break out, and blood toucheth blood* (Hosea 4:2), it is reading the charge straight off the Ten Words. The covenant-lawsuit indicts the land FOR breaking the Torah — the Torah affirmed as the binding standard, never the thing at fault.'),
    ('canon','hosea',4,2,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). The *committing adultery* of Hosea 4:2 is the seventh word broken; and the same harlotry runs the whole chapter (4:13-14). The prophet sues the people by the very commandments Yahuah gave at Sinai — the indictment proves the Torah stands.'),
    ('canon','hosea',4,2,'canon','exodus',20,15,'free',
      E'*Thou shalt not steal* (Exodus 20:15). The *stealing* of Hosea 4:2 is the eighth word. *There is no truth, nor mercy, nor knowledge of Elohim (God) in the land* (4:1) because the Ten Words have been thrown off; the lawsuit measures the land against the Torah, not against the Torah''s absence.'),
    ('canon','hosea',4,2,'canon','exodus',20,16,'free',
      E'*Thou shalt not bear false witness against thy neighbour* (Exodus 20:16). The *swearing, and lying* of Hosea 4:2 is the broken ninth word. *No truth* in the land (4:1) is the Torah forsaken; the controversy is Yahuah holding His people to the covenant He gave them.'),
    ('canon','hosea',4,2,'canon','jeremiah',7,9,'free',
      E'*Will ye steal, murder, and commit adultery, and swear falsely, and burn incense unto Baal, and walk after other gods whom ye know not* (Jeremiah 7:9). Jeremiah brings the identical lawsuit: the same broken commandments Hosea lists — *swearing, and lying, and killing, and stealing, and committing adultery* (Hosea 4:2) — set against the same false worship. Two prophets, one indictment, one Torah being broken.'),
    ('canon','hosea',4,2,'canon','romans',13,9,'free',
      E'*For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). The very commandments Hosea''s lawsuit names broken — *killing, and stealing, and committing adultery* (Hosea 4:2) — Paul names still binding, fulfilled (not abolished) in love. The Torah Hosea sues by is the Torah Paul says love keeps.'),

    -- THREAD 2 (★★★): My people are destroyed for lack of knowledge — forgotten the Torah (KEYSTONE)
    ('canon','hosea',4,6,'canon','malachi',2,7,'free',
      E'*For the priest’s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7). This is why *thou shalt be no priest to me* (Hosea 4:6) — the priest''s whole charge was to KEEP knowledge and the Torah; having *rejected knowledge* and *forgotten the law*, he forfeits the office. The priest who will not seek the law at his mouth is no priest.'),
    ('canon','hosea',4,6,'canon','isaiah',5,13,'free',
      E'*Therefore my people are gone into captivity, because they have no knowledge: and their honourable men are famished* (Isaiah 5:13). The same ruin for the same lack: Hosea''s *My people are destroyed for lack of knowledge* (4:6) is Isaiah''s *my people are gone into captivity, because they have no knowledge*. Forgetting the Torah is not a private failing — it is the road to exile.'),
    ('canon','hosea',4,6,'canon','proverbs',1,7,'free',
      E'*The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7). The knowledge whose lack destroys the people (Hosea 4:6) begins in the fear of Yahuah and is despised by fools; to *reject knowledge* and *forget the law* is to despise the very instruction that gives life. The wisdom Proverbs commends is the Torah Hosea mourns forgotten.'),
    ('canon','hosea',4,6,'canon','1-john',2,3,'free',
      E'*And hereby we do know that we know him, if we keep his commandments* (1 John 2:3). The master filter answers Hosea''s charge directly: the *knowledge* whose lack destroys the people (4:6) is the knowledge OF Him — and to know Him IS to keep His commandments. To forget the Torah is to lose the very knowledge of Yahuah.'),
    ('canon','hosea',4,6,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). The land had *no truth* (Hosea 4:1) and had *forgotten the law* (4:6) — exactly the man John describes: claiming to know Him while keeping not His commandments, *and the truth is not in him*. The anti-antinomian seal: there is no knowing Yahuah apart from keeping His Torah.'),
    ('canon','hosea',4,6,'apocrypha','baruch-with-the-letter-of-jeremiah',4,1,'extras',
      E'*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). The restored witness states Hosea''s warning as plain law: the Torah *endureth for ever*, and those who leave it die — which is exactly the people *destroyed* because they *forgotten the law of thy Elohim (God)* (Hosea 4:6). Keep it and live; leave it and perish.'),
    ('canon','hosea',4,6,'apocrypha','baruch-with-the-letter-of-jeremiah',4,2,'extras',
      E'*Turn you, O Jacob, and take hold of it: walk in the presence of the light thereof, that you may be illuminated* (Baruch 4:2). The cure for a people *destroyed for lack of knowledge* (Hosea 4:6) is to TURN and *take hold* of the very Torah they let slip — to walk in its light. The forgotten law is not gone; Jacob is called back to grasp it.'),
    ('canon','hosea',4,6,'apocrypha','ecclesiasticus',15,1,'extras',
      E'*He that fears Yahuah (God) will do good, and he that has the knowledge of the law shall obtain her* (Sirach 15:1). The knowledge whose lack destroys the people (Hosea 4:6) is named here for what it is — *the knowledge of the law*; to have it is to lay hold of wisdom, to lack it is the ruin Hosea mourns. Knowledge of Yahuah and knowledge of His Torah are one knowledge.'),

    -- THREAD 3: Like people, like priest — the commandment made void (the corrupt teacher)
    ('canon','hosea',4,9,'canon','matthew',15,6,'free',
      E'*Thus have ye made the commandment of Elohim (God) of none effect by your tradition* (Matthew 15:6). Hosea''s *like people, like priest* (4:9) — priests who *eat up the sin of my people* (4:8) — is the same crime Yahusha names in Israel''s teachers: they who should guard the Torah instead *made the commandment of Elohim of none effect*. The shepherds corrupt the flock; the fault is the priest''s, not the Torah''s.'),
    ('canon','hosea',4,9,'canon','matthew',15,9,'free',
      E'*But in vain they do worship me, teaching for doctrines the commandments of men* (Matthew 15:9). The priests who lead the people into high-place worship (Hosea 4:12-13) while *like people, like priest* (4:9) are the very pattern Yahusha condemns — worship made vain by *teaching for doctrines the commandments of men* in place of the forgotten Torah (4:6). Man''s tradition swapped for Yahuah''s law is the whoredom Hosea sues.'),

    -- THREAD 4 (★): They sacrifice upon the tops of the mountains — high-place harlotry
    ('canon','hosea',4,13,'canon','deuteronomy',12,2,'free',
      E'*Ye shall utterly destroy all the places, wherein the nations which ye shall possess served their gods, upon the high mountains, and upon the hills, and under every green tree* (Deuteronomy 12:2). Hosea''s charge is exact: *They sacrifice upon the tops of the mountains, and burn incense upon the hills, under oaks and poplars* (4:13) — the people are doing the very thing the Torah commanded them to DESTROY. The high-place worship is forgotten-Torah (4:6) made visible.'),
    ('canon','hosea',4,13,'canon','jeremiah',3,6,'free',
      E'*Hast thou seen that which backsliding Yashar''el (Israel) hath done? she is gone up upon every high mountain and under every green tree, and there hath played the harlot* (Jeremiah 3:6). Jeremiah sees what Hosea sees: Yashar''el *upon every high mountain and under every green tree* playing the harlot — the same hilltop incense and adultery of Hosea 4:13. The *spirit of whoredoms* (4:12) drives both prophecies'' indictment.'),

    -- THREAD 5 (★): Let not Yahudah offend — the two-house distinction (never cast off)
    ('canon','hosea',4,15,'canon','jeremiah',3,8,'free',
      E'*And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not, but went and played the harlot also* (Jeremiah 3:8). Hosea''s warning — *Though thou, Yashar''el (Israel), play the harlot, yet let not Yahudah (Judah) offend* (4:15) — is the two-house distinction Jeremiah draws plainly: the divorced northern house and her sister the southern house, warned not to follow into the same harlotry.'),
    ('canon','hosea',4,15,'canon','ezekiel',37,19,'free',
      E'*Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows... and the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The two houses Hosea keeps apart in judgment — *let not Yahudah (Judah) offend... Ephraim is joined to idols* (4:15,17) — are the two sticks Yahuah makes ONE again. The harlotry divides; the regathering joins; the cast-off Ephraim is gathered home, never replaced.'),
    ('canon','hosea',4,15,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Even as Ephraim is *joined to idols: let him alone* (4:17), Hosea''s own book holds the reversal: Lo-Ammi, *not my people*, becomes *the sons of the living Elohim*. The judged northern house is not abandoned but destined to be reclaimed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-4-yahuah-hath-a-controversy-the-broken-ten-words',
       E'Yahuah hath a controversy — the lawsuit is the broken Ten Words',
       E'The chapter opens as a formal indictment: *Hear the word of Yahuah (LORD), ye children of Yashar''el (Israel): for Yahuah (LORD) hath a controversy with the inhabitants of the land, because there is no truth, nor mercy, nor knowledge of Elohim (God) in the land. By swearing, and lying, and killing, and stealing, and committing adultery, they break out, and blood toucheth blood* (Hosea 4:1-2). The bill of charges is read straight off the Ten Words: *Thou shalt not kill... Thou shalt not commit adultery... Thou shalt not steal... Thou shalt not bear false witness against thy neighbour* (Exodus 20:13-16). This is the Torah AFFIRMED, not abolished — the prophet sues the land precisely FOR breaking the covenant Yahuah gave at Sinai. Jeremiah brings the identical lawsuit a century later: *Will ye steal, murder, and commit adultery, and swear falsely, and burn incense unto Baal, and walk after other gods whom ye know not* (Jeremiah 7:9) — the same broken commandments, the same false worship. And the New Testament names those very words still binding, fulfilled in love rather than cancelled: *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet... it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). The controversy proves the standard stands: where there is *no truth, nor mercy, nor knowledge of Elohim*, it is the Torah that has been thrown off — and the Torah by which the land is judged.',
       sv.verse_id, ev.verse_id, 'free', 44775
  FROM _s328_hos04_lookup sv, _s328_hos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★) — THE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-4-my-people-are-destroyed-for-lack-of-knowledge',
       E'My people are destroyed for lack of knowledge — thou hast forgotten the Torah',
       E'This is the verse the whole framework is built to defend: *My people are destroyed for lack of knowledge: because thou hast rejected knowledge, I will also reject thee, that thou shalt be no priest to me: seeing thou hast forgotten the law of thy Elohim (God), I will also forget thy children* (Hosea 4:6). The destruction is not arbitrary judgment but the direct fruit of REJECTING knowledge and FORGETTING the Torah — the anti-antinomian keystone. The priest is unmade because he abandoned his one charge: *the priest’s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)* (Malachi 2:7). The same ruin falls for the same cause across the prophets: *my people are gone into captivity, because they have no knowledge* (Isaiah 5:13). And the wisdom books name what that knowledge is and where it begins: *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7); *he that has the knowledge of the law shall obtain her* (Sirach 15:1). The restored witness states it as plain covenant-law: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1) — and calls the people back: *Turn you, O Jacob, and take hold of it* (Baruch 4:2). The New Testament seals it as the master filter for knowing Yahuah at all: *hereby we do know that we know him, if we keep his commandments. He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:3-4). The people had *no truth* (4:1) because they had *forgotten the law* (4:6) — and there is no knowledge of Yahuah apart from His Torah kept.',
       sv.verse_id, ev.verse_id, 'extras', 44778
  FROM _s328_hos04_lookup sv, _s328_hos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-4-like-people-like-priest-the-commandment-made-void',
       E'Like people, like priest — the commandment made of none effect',
       E'The priests do not guard the people; they feed on their ruin: *They eat up the sin of my people, and they set their heart on their iniquity. And there shall be, like people, like priest: and I will punish them for their ways* (Hosea 4:8-9). The shepherds who should have taught the forgotten Torah (4:6) instead lead the flock into high-place whoredom (4:12-13). Yahusha names the identical crime in Israel''s teachers: *Thus have ye made the commandment of Elohim (God) of none effect by your tradition* (Matthew 15:6) — *But in vain they do worship me, teaching for doctrines the commandments of men* (Matthew 15:9). Man''s tradition swapped for Yahuah''s law is the very whoredom Hosea sues; worship is made *vain* not because the Torah failed but because its keepers voided it. The fault is the priest''s and the teacher''s — conduct-within-the-covenant, never the commandment itself.',
       sv.verse_id, ev.verse_id, 'free', 44781
  FROM _s328_hos04_lookup sv, _s328_hos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-4-they-sacrifice-upon-the-tops-of-the-mountains',
       E'They sacrifice upon the tops of the mountains — the rites the Torah forbade',
       E'The spirit driving the apostasy is named, and so are its altars: *for the spirit of whoredoms hath caused them to err, and they have gone a whoring from under their Elohim (God). They sacrifice upon the tops of the mountains, and burn incense upon the hills, under oaks and poplars and elms, because the shadow thereof is good* (Hosea 4:12-13). This is forgotten-Torah (4:6) made visible — the people performing the exact rites the Torah commanded them to wipe out: *Ye shall utterly destroy all the places, wherein the nations which ye shall possess served their gods, upon the high mountains, and upon the hills, and under every green tree* (Deuteronomy 12:2). Jeremiah sees the same harlotry on the same hills: *backsliding Yashar''el (Israel)... is gone up upon every high mountain and under every green tree, and there hath played the harlot* (Jeremiah 3:6). The high places are the covenant broken in stone and smoke — the Torah forsaken turned into an altar.',
       sv.verse_id, ev.verse_id, 'free', 44784
  FROM _s328_hos04_lookup sv, _s328_hos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-4-let-not-yahudah-offend-the-two-house-distinction',
       E'Let not Yahudah offend — the two-house distinction, never cast off',
       E'In the midst of the indictment Hosea draws the line between the two houses: *Though thou, Yashar''el (Israel), play the harlot, yet let not Yahudah (Judah) offend; and come not ye unto Gilgal, neither go ye up to Beth-aven... For Yashar''el (Israel) slideth back as a backsliding heifer... Ephraim is joined to idols: let him alone* (Hosea 4:15-17). The northern house — Yashar''el, Ephraim, Joseph — is the harlot sliding back; the southern house, Yahudah, is warned not to follow into the same sin. Jeremiah names the distinction in covenant-divorce terms: *backsliding Yashar''el (Israel)... I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not, but went and played the harlot also* (Jeremiah 3:8). Yet *let him alone* and *not my people* are never the final word. Hosea''s own opening holds the reversal: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). And the two divided houses are made one again in Yahuah''s hand: *I will take the stick of Joseph, which is in the hand of Ephraim... and the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The harlotry divides; the regathering joins. Ephraim joined to idols is still the lost sheep, gathered home — never replaced, never finally cast off.',
       sv.verse_id, ev.verse_id, 'free', 44787
  FROM _s328_hos04_lookup sv, _s328_hos04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thou shalt not kill* (Exodus 20:13) — the *killing* of Hosea 4:2 is the sixth word broken; the lawsuit reads the charge off the Ten Words.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Thou shalt not commit adultery* (Exodus 20:14) — the *committing adultery* of Hosea 4:2, the seventh word, running the whole chapter''s harlotry.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Thou shalt not steal* (Exodus 20:15) — the *stealing* of Hosea 4:2, the eighth word; the land measured against the Torah it threw off.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Thou shalt not bear false witness against thy neighbour* (Exodus 20:16) — the *swearing, and lying* of Hosea 4:2, the broken ninth word; *no truth* in the land.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Will ye steal, murder, and commit adultery, and swear falsely... and walk after other gods* (Jeremiah 7:9) — Jeremiah''s twin lawsuit, the same broken commandments as Hosea 4:2.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal... comprehended in... Thou shalt love thy neighbour as thyself* (Romans 13:9) — the same Decalogue still binding, fulfilled in love, not abolished.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-yahuah-hath-a-controversy-the-broken-ten-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the priest’s lips should keep knowledge, and they should seek the law at his mouth* (Malachi 2:7) — the priest''s whole charge; abandoned, he is *no priest to me* (Hosea 4:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *my people are gone into captivity, because they have no knowledge* (Isaiah 5:13) — the same ruin for the same lack; forgetting the Torah is the road to exile.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The fear of Yahuah (LORD) is the beginning of knowledge: but fools despise wisdom and instruction* (Proverbs 1:7) — the knowledge whose lack destroys (Hosea 4:6), despised by fools.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★★ *hereby we do know that we know him, if we keep his commandments* (1 John 2:3) — the master filter: the knowledge whose lack destroys (Hosea 4:6) is knowing Him, which IS keeping His Torah.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★★ *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4) — the people had *no truth* (4:1) and *forgotten the law* (4:6): no knowing Yahuah apart from His Torah kept.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1) — the restored witness: keep the Torah and live, leave it (Hosea 4:6) and perish.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Turn you, O Jacob, and take hold of it: walk in the presence of the light thereof* (Baruch 4:2) — the cure for forgotten knowledge (Hosea 4:6): turn and grasp the very Torah let slip.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *he that has the knowledge of the law shall obtain her* (Sirach 15:1) — the knowledge whose lack destroys (Hosea 4:6) named for what it is: knowledge of the law.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-my-people-are-destroyed-for-lack-of-knowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thus have ye made the commandment of Elohim (God) of none effect by your tradition* (Matthew 15:6) — Hosea''s *like people, like priest* (4:9): the shepherds void the Torah they should guard.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-like-people-like-priest-the-commandment-made-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*in vain they do worship me, teaching for doctrines the commandments of men* (Matthew 15:9) — man''s tradition swapped for the forgotten Torah (Hosea 4:6) makes worship vain.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-like-people-like-priest-the-commandment-made-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *destroy all the places... upon the high mountains, and upon the hills, and under every green tree* (Deuteronomy 12:2) — the very rites Hosea 4:13 names being practiced; forgotten-Torah made an altar.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-they-sacrifice-upon-the-tops-of-the-mountains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *backsliding Yashar''el (Israel)... gone up upon every high mountain and under every green tree, and there hath played the harlot* (Jeremiah 3:6) — the same hilltop harlotry the *spirit of whoredoms* (Hosea 4:12-13) drives.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=13
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-they-sacrifice-upon-the-tops-of-the-mountains'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *backsliding Yashar''el... I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah)... played the harlot also* (Jeremiah 3:8) — the two sisters; Hosea''s *let not Yahudah offend* (4:15) drawn plain.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-let-not-yahudah-offend-the-two-house-distinction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will take the stick of Joseph... and the stick of Yahudah (Judah), and make them one stick* (Ezekiel 37:19) — the two houses Hosea keeps apart (4:15,17) made ONE again; Ephraim gathered, never replaced.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-let-not-yahudah-offend-the-two-house-distinction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *where it was said unto them, Ye are not my people, there it shall be said... Ye are the sons of the living Elohim (God)* (Hosea 1:10) — even *Ephraim joined to idols: let him alone* (4:17) is not the final word; Lo-Ammi reversed.'
  FROM cross_reference_threads t
  JOIN _s328_hos04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=4 AND sv.verse_number=15
  JOIN _s328_hos04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-4-let-not-yahudah-offend-the-two-house-distinction'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_5.sql (Hosea 5) -----
-- Chapter: Hosea 5 — JUDGMENT ON EPHRAIM AND YAHUDAH, the two houses, and the withdrawn Presence.
-- The lawsuit is leveled at priests, the house of Yashar'el (Israel), and the house of the king alike (5:1).
-- ★ The spirit of whoredoms binds the will: *They will not frame their doings to turn unto their Elohim (God):
-- for the spirit of whoredoms is in the midst of them, and they have not known Yahuah (LORD)* (5:4) — the bondage
-- of sin (John 8:34). They seek Yahuah with flocks and herds but cannot find him — *he hath withdrawn himself
-- from them* (5:6) — for he desires mercy, not sacrifice (Hosea 6:6; Isaiah 1:11-15; Proverbs 1:28). BOTH HOUSES
-- decay inwardly: *I will be unto Ephraim as a moth, and to the house of Yahudah (Judah) as rottenness* (5:12) —
-- the two-house judgment with the Romans 11 guard (a hardening in part, not a cast-off people). ★★ THE WRONG
-- PHYSICIAN: *When Ephraim saw his sickness... then went Ephraim to the Assyrian... yet could he not heal you*
-- (5:13) — turning to the nations instead of to Yahuah Rapha the Healer (Exodus 15:26; Jeremiah 8:22; Matthew
-- 9:12; clean extras witness Sirach 38). ★★ THE HINGE: *I will go and return to my place, till they acknowledge
-- their offence, and seek my face: in their affliction they will seek me early* (5:15) — leading DIRECTLY into
-- 6:1-2 (*let us return... in the third day he will raise us up*); the withdrawn Presence until they turn
-- (Deuteronomy 4:29-30; Leviticus 26:40-42).
-- Tag: hos05   Temp view: _s328_hos05_lookup
-- Sort band: base 44800, step 3 -> threads at 44800, 44803, 44806, 44809, 44812 (5 threads)
-- Source of EVERY row: 'canon','hosea',5,v
--
-- Hosea 5 coverage:
--   v.1-3 (Hear ye this, O priests... ye house of Yashar'el... house of the king; for judgment is toward you;
--          I know Ephraim... thou committest whoredom, and Yashar'el is defiled)
--        NT:     none warranted distinct (the all-houses lawsuit is woven into THREADS 1 & 3)
--        Extras: none warranted
--        Tanakh: held in prose (the priest/Israel/king summons = preface to the will-bondage of v.4)
--   ★ v.4 (They will not frame their doings to turn unto their Elohim... the spirit of whoredoms is in the
--          midst of them, and they have not known Yahuah)
--        NT:     ★ John 8:34 (Whosoever committeth sin is the servant of sin) — THREAD 1 (the bondage of the will)
--        Extras: none warranted (kept clean; bondage-of-will is the NT's own naming)
--        Tanakh: woven in prose (the spirit-of-whoredoms = the unframed heart)
--   v.5 (the pride of Yashar'el doth testify to his face... Yahudah also shall fall with them)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose (both-houses fall — folded into THREAD 3)
--   ★ v.6 (They shall go with their flocks and with their herds to seek Yahuah; but they shall not find him; he
--          hath withdrawn himself from them)
--        NT:     none warranted distinct (mercy-not-sacrifice is quoted by Yahusha at Matthew 9:13, but that is
--                bound on the Physician thread; here the weave is the withdrawn Presence)
--        Extras: none warranted
--        Tanakh: ★ Hosea 6:6 (I desired mercy, and not sacrifice), ★ Isaiah 1:11-15 (To what purpose is the
--                multitude of your sacrifices... I will hide mine eyes from you), ★ Proverbs 1:28 (they shall
--                seek me early, but they shall not find me) — THREAD 2
--   v.7-8 (begotten strange children... Blow ye the cornet in Gibeah)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose (treachery + alarm = the war-judgment context of the two houses)
--   ★ v.9-12 (Ephraim shall be desolate... princes of Yahudah... I will be unto Ephraim as a moth, and to the
--          house of Yahudah as rottenness)
--        NT:     ★★ Romans 11:25 (blindness in part is happened to Yashar'el, until the fulness of the Gentiles
--                be come in), ★★ Romans 11:26 (And so all Yashar'el shall be saved) — THREAD 3 (two-house guard)
--        Extras: none warranted
--        Tanakh: woven in prose (moth + rottenness = the slow inward decay of BOTH houses)
--   ★★ v.13 (When Ephraim saw his sickness, and Yahudah saw his wound, then went Ephraim to the Assyrian, and
--          sent to king Jareb: yet could he not heal you, nor cure you of your wound)
--        NT:     ★★ Matthew 9:12 (They that be whole need not a physician, but they that are sick) — THREAD 4
--        Extras: ★ Sirach 38:9 (in your sickness... pray to Yahuah, and he will make you whole),
--                ★ Sirach 38:15 (He that sinneth before his Maker, let him fall into the hand of the physician)
--                — THREAD 4 (clean witness: the true Physician)
--        Tanakh: ★★ Exodus 15:26 (I am Yahuah Rapha (the LORD that healeth thee)), ★ Jeremiah 8:22 (Is there no
--                balm in Gilead; is there no physician there?) — THREAD 4
--   v.14 (I will be unto Ephraim as a lion... I, even I, will tear and go away)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: held in prose (the lion that tears = the withdrawing Healer; bridge to v.15, THREAD 5)
--   ★★ v.15 (I will go and return to my place, till they acknowledge their offence, and seek my face: in their
--          affliction they will seek me early)
--        NT:     none warranted distinct (the return-and-raise is the Hosea 6:1-2 hinge, quoted as Tanakh)
--        Extras: none warranted (kept clean; canon carries the turning)
--        Tanakh: ★★ Hosea 6:1 (Come, and let us return unto Yahuah: for he hath torn, and he will heal us),
--                ★ Deuteronomy 4:29-30 (if from thence thou shalt seek Yahuah... thou shalt find him),
--                ★ Leviticus 26:40-42 (If they shall confess their iniquity... then will I remember my covenant)
--                — THREAD 5 (the withdrawn Presence until they turn; the hinge into 6:1-2)
--
-- Threads (slug — target libraries):
--   1. hosea-5-the-spirit-of-whoredoms-they-have-not-known-yahuah — NT (John 8) [free]
--      (★ the spirit of whoredoms binds the will; the bondage of sin)
--   2. hosea-5-they-shall-seek-yahuah-but-not-find-him — Tanakh (Hosea 6, Isaiah 1, Proverbs 1) [free]
--      (★ flocks and herds but no finding; mercy not sacrifice; the withdrawn Presence)
--   3. hosea-5-ephraim-a-moth-and-yahudah-as-rottenness — NT (Romans 11) [free]
--      (★★ both houses decay; the two-house judgment with the Romans 11 hardening-in-part guard)
--   4. hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian — Tanakh (Exodus 15, Jeremiah 8) + NT (Matthew 9) + Extras (Sirach 38) [extras]
--      (★★ turning to Assyria instead of to Yahuah Rapha the Healer; the true Physician)
--   5. hosea-5-i-will-return-to-my-place-till-they-acknowledge — Tanakh (Hosea 6, Deuteronomy 4, Leviticus 26) [free]
--      (★★ the withdrawn Presence until they acknowledge; the hinge into 6:1-2's "third day he will raise us up")
--
-- Framing notes:
--   ★ THE SPIRIT OF WHOREDOMS (THREAD 1): *They will not frame their doings to turn unto their Elohim (God): for
--      the spirit of whoredoms is in the midst of them, and they have not known Yahuah (LORD)* (5:4). The will is
--      bound — they CANNOT frame their doings to turn. Yahusha names the bondage: *Whosoever committeth sin is
--      the servant of sin* (John 8:34) — and only the Son frees: *If the Son therefore shall make you free, ye
--      shall be free indeed* (John 8:36). The spirit of whoredoms in the midst is the servitude sin works; turning
--      requires deliverance, not mere resolve.
--   ★ THEY SHALL NOT FIND HIM (THREAD 2): *They shall go with their flocks and with their herds to seek Yahuah
--      (LORD); but they shall not find him; he hath withdrawn himself from them* (5:6). Sacrifice without the heart
--      cannot reach him — *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than
--      burnt offerings* (Hosea 6:6). Isaiah voices the same withdrawal: *To what purpose is the multitude of your
--      sacrifices unto me?... when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah
--      1:11,15). And Wisdom warns of the too-late seeking: *they shall seek me early, but they shall not find me*
--      (Proverbs 1:28). Flocks and herds are no substitute for a turned heart.
--   ★★ MOTH AND ROTTENNESS — THE TWO HOUSES (THREAD 3): *Therefore will I be unto Ephraim as a moth, and to the
--      house of Yahudah (Judah) as rottenness* (5:12). BOTH houses — the northern Ephraim/Yashar'el AND the
--      southern Yahudah — suffer the same slow inward decay (cf. 5:5,9-10). This is the two-house judgment, and
--      it carries the Romans 11 GUARD against any cast-off reading: *blindness in part is happened to Yashar'el
--      (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — *And so all Yashar'el (Israel)
--      shall be saved* (Romans 11:26). The decay is real and the judgment is severe, but it is a hardening IN
--      PART with an appointed end, never an abandonment; both houses are to be healed and gathered.
--   ★★ THE WRONG PHYSICIAN (THREAD 4): *When Ephraim saw his sickness, and Yahudah (Judah) saw his wound, then
--      went Ephraim to the Assyrian, and sent to king Jareb: yet could he not heal you, nor cure you of your
--      wound* (5:13). The sickness is real; the physician is wrong. Yahuah alone is the Healer — *I am Yahuah
--      Rapha (the LORD that healeth thee)* (Exodus 15:26) — and Jeremiah grieves the unsought cure: *Is there no
--      balm in Gilead; is there no physician there? why then is not the health of the daughter of my people
--      recovered?* (Jeremiah 8:22). Yahusha came as that very Physician: *They that be whole need not a physician,
--      but they that are sick* (Matthew 9:12), and at the same table named Hosea's own word — *I will have mercy,
--      and not sacrifice* (Matthew 9:13, quoting Hosea 6:6). The clean restored witness counsels the right resort:
--      *in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole* (Sirach 38:9);
--      *He that sinneth before his Maker, let him fall into the hand of the physician* (Sirach 38:15). Ephraim ran
--      to Assyria; the wound only Yahuah Rapha can close.
--   ★★ I WILL RETURN TO MY PLACE (THREAD 5): *I will go and return to my place, till they acknowledge their
--      offence, and seek my face: in their affliction they will seek me early* (5:15). This is the hinge of the
--      whole prophecy — the withdrawn Presence is not abandonment but a waiting, *till they acknowledge*. It runs
--      straight into 6:1-2: *Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us;
--      he hath smitten, and he will bind us up... in the third day he will raise us up, and we shall live in his
--      sight* (Hosea 6:1-2). The condition of the return is the Torah's own promise: *if from thence thou shalt
--      seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart... if
--      thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy
--      4:29-30), and *If they shall confess their iniquity, and the iniquity of their fathers... then will I
--      remember my covenant with Jacob* (Leviticus 26:40,42). The withdrawn Presence is the appointed pressure
--      that drives the two houses home.
--   EXTRAS: only Sirach 38 (the physician) is woven — a clean witness on THREAD 4. No extras forced on the
--      will-bondage, the unfound seeking, the two-house decay, or the hinge of return (canon carries those).
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the priest/Israel/king summons — preface to THREAD 1), v.5 (both fall —
--      folded into THREAD 3), v.7-8 (treachery + war-alarm — the judgment context), v.10-11 (princes of Yahudah,
--      Ephraim oppressed — woven into THREAD 3's both-houses decay), v.14 (the lion that tears and goes away —
--      the withdrawing Healer, bridge into THREAD 5's v.15). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The spirit of whoredoms — they have not known Yahuah (the bondage of the will)
    ('canon','hosea',5,4,'canon','john',8,34,'free',
      E'*Yahusha (Jesus) answered them, Verily, verily, I say unto you, Whosoever committeth sin is the servant of sin* (John 8:34). Hosea says the will is bound — *They will not frame their doings to turn unto their Elohim (God): for the spirit of whoredoms is in the midst of them, and they have not known Yahuah (LORD)* (Hosea 5:4). They cannot turn because sin has made them its servant; the spirit of whoredoms in the midst is the very bondage Yahusha names. Deliverance, not resolve, breaks it.'),
    ('canon','hosea',5,4,'canon','john',8,36,'free',
      E'*If the Son therefore shall make you free, ye shall be free indeed* (John 8:36). The people who *will not frame their doings to turn* (Hosea 5:4) are held by a bondage only the Son can loose. The spirit of whoredoms cannot be willed away; the Formed Son alone makes free indeed, and only then can the heart turn unto their Elohim (God).'),

    -- THREAD 2 (★): They shall seek Yahuah but not find him (flocks and herds; mercy not sacrifice; withdrawn)
    ('canon','hosea',5,6,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). They bring *flocks* and *herds to seek Yahuah (LORD); but they shall not find him* (Hosea 5:6) — because the offering without the heart cannot reach him. Yahuah desires mercy and the knowledge of him, not the multiplied beasts; the withdrawn Presence answers a sacrifice that is not a turning.'),
    ('canon','hosea',5,6,'canon','isaiah',1,11,'free',
      E'*To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats* (Isaiah 1:11). The flocks and herds of Hosea 5:6 are the very *multitude of your sacrifices* Isaiah hears Yahuah refuse. Sacrifice offered by an unturned heart does not find him; it wearies him.'),
    ('canon','hosea',5,6,'canon','isaiah',1,15,'free',
      E'*And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15). *He hath withdrawn himself from them* (Hosea 5:6) is Isaiah''s *I will hide mine eyes from you* — the same withdrawn face answering worship without repentance. They seek with flocks and prayers, but the hidden Presence will not be found while the hands are full of blood.'),
    ('canon','hosea',5,6,'canon','proverbs',1,28,'free',
      E'*Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me* (Proverbs 1:28). Hosea''s *they shall not find him* (Hosea 5:6) is Wisdom''s sentence on the seeking that comes too late and without the heart — *they shall seek me early, but they shall not find me*. The flocks and herds arrive, but the Presence has withdrawn from those who would not turn.'),

    -- THREAD 3 (★★): Ephraim a moth and Yahudah as rottenness (the two houses; Romans 11 guard)
    ('canon','hosea',5,12,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The moth and the rottenness — *I will be unto Ephraim as a moth, and to the house of Yahudah (Judah) as rottenness* (Hosea 5:12) — fall on BOTH houses, yet Paul names the limit: the hardening is *in part*, and it lasts only *until the fulness of the Gentiles be come in*. The decay is real, the casting-off is not; this is a hardening with an appointed end.'),
    ('canon','hosea',5,12,'canon','romans',11,26,'free',
      E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). Ephraim eaten as by a moth and Yahudah rotting (Hosea 5:12) are not abandoned to the decay: *all Yashar''el (Israel) shall be saved*. Both houses that waste under the lawsuit are the same two houses the Deliverer turns from ungodliness and gathers home; the judgment serves the restoration.'),

    -- THREAD 4 (★★): The wrong physician — went Ephraim to the Assyrian (Yahuah Rapha the true Healer)
    ('canon','hosea',5,13,'canon','exodus',15,26,'free',
      E'*And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God)... I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). Ephraim *went... to the Assyrian* with his sickness (Hosea 5:13) — to the wrong physician — when the true Healer had already named himself at the bitter waters: *I am Yahuah Rapha (the LORD that healeth thee)*. The wound only the covenant Healer can close, Ephraim carried to the nations.'),
    ('canon','hosea',5,13,'canon','jeremiah',8,22,'free',
      E'*Is there no balm in Gilead; is there no physician there? why then is not the health of the daughter of my people recovered?* (Jeremiah 8:22). Ephraim *saw his sickness... and sent to king Jareb: yet could he not heal you* (Hosea 5:13). Jeremiah grieves the same unhealed wound: the balm and the Physician are present, yet *the health of the daughter of my people* is not recovered — because they sought the cure where it is not.'),
    ('canon','hosea',5,13,'canon','matthew',9,12,'free',
      E'*But when Yahusha (Jesus) heard that, he said unto them, They that be whole need not a physician, but they that are sick* (Matthew 9:12). Ephraim *saw his sickness* and ran to the Assyrian (Hosea 5:13); Yahusha comes as the Physician for that very sickness — and at the same table quotes Hosea''s own word, *I will have mercy, and not sacrifice* (Matthew 9:13; Hosea 6:6). The wound Assyria could not cure is healed by the One who came to the sick.'),
    ('canon','hosea',5,13,'apocrypha','ecclesiasticus',38,9,'extras',
      E'*My son, in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole* (Sirach 38:9). Ephraim was not negligent of his sickness — he *saw* it (Hosea 5:13) — but he turned to the Assyrian rather than to Yahuah, who *will make you whole*. The restored witness names the right resort the very moment Ephraim chose the wrong one.'),
    ('canon','hosea',5,13,'apocrypha','ecclesiasticus',38,15,'extras',
      E'*He that sinneth before his Maker, let him fall into the hand of the physician* (Sirach 38:15). Hosea''s wounded Ephraim *went... to the Assyrian* (Hosea 5:13) — fell into the hand of the wrong healer. The clean witness frames the indictment: the sin-sick should fall into the hand of THE Physician, Yahuah Rapha, not into the hand of king Jareb who *could he not heal you*.'),

    -- THREAD 5 (★★): I will return to my place till they acknowledge (the hinge into 6:1-2)
    ('canon','hosea',5,15,'canon','hosea',6,1,'free',
      E'*Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us; he hath smitten, and he will bind us up* (Hosea 6:1). The withdrawn Presence of *I will go and return to my place, till they acknowledge their offence* (Hosea 5:15) bears its fruit in the very next breath: the acknowledging turns into *let us return unto Yahuah (LORD)*. The One who tore as a lion (5:14) is the One who heals; the affliction drives them to seek him early.'),
    ('canon','hosea',5,15,'canon','hosea',6,2,'free',
      E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). The seeking *in their affliction* of Hosea 5:15 ends not in death but in resurrection: *in the third day he will raise us up, and we shall live in his sight*. The withdrawn Presence returns to revive the two houses; the lion''s tearing is the prelude to being raised up to live before his face.'),
    ('canon','hosea',5,15,'canon','deuteronomy',4,29,'free',
      E'*But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29). The promise of Hosea 5:15 — *till they acknowledge their offence, and seek my face* — is the Torah''s own covenant word: *from thence* (out of the scattering) the whole-hearted seeker *shalt find him*. The withdrawn face is found again by the heart that turns.'),
    ('canon','hosea',5,15,'canon','deuteronomy',4,30,'free',
      E'*When thou art in tribulation, and all these things are come upon thee, even in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30). *In their affliction they will seek me early* (Hosea 5:15) is Moses'' *when thou art in tribulation... if thou turn to Yahuah Elohayka (the LORD thy God)*. The latter-day affliction is the appointed pressure that turns the two houses back, in obedience, to the voice they would not hear.'),
    ('canon','hosea',5,15,'canon','leviticus',26,40,'free',
      E'*If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me, and that also they have walked contrary unto me* (Leviticus 26:40). *Till they acknowledge their offence* (Hosea 5:15) is the very confession of the covenant: *if they shall confess their iniquity, and the iniquity of their fathers*. The withdrawn Presence waits for exactly this acknowledging before the remembering of the covenant begins.'),
    ('canon','hosea',5,15,'canon','leviticus',26,42,'free',
      E'*Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:42). When they *acknowledge their offence, and seek my face* (Hosea 5:15), Yahuah does not stay in his place: *then will I remember my covenant with Jacob*. The acknowledging unlocks the patriarchal promise; the seed-line covenant is remembered and the two houses are brought home.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-5-the-spirit-of-whoredoms-they-have-not-known-yahuah',
       E'The spirit of whoredoms — they will not frame their doings to turn',
       E'The lawsuit reaches the heart of the matter: the people cannot turn. *They will not frame their doings to turn unto their Elohim (God): for the spirit of whoredoms is in the midst of them, and they have not known Yahuah (LORD)* (Hosea 5:4). It is not merely that they refuse — the spirit of whoredoms in the midst has bound the will itself. Yahusha names this exact bondage: *Verily, verily, I say unto you, Whosoever committeth sin is the servant of sin* (John 8:34). The servant of sin cannot simply resolve to turn; he is held. And the answer is not stronger resolve but the Son: *If the Son therefore shall make you free, ye shall be free indeed* (John 8:36). The spirit of whoredoms is broken by the Formed Son who frees; only the freed heart can frame its doings to turn unto its Elohim (God) and come to know Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 44800
  FROM _s328_hos05_lookup sv, _s328_hos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-5-they-shall-seek-yahuah-but-not-find-him',
       E'They shall seek Yahuah with flocks and herds, but not find him',
       E'They bring their offerings and go looking, but the Presence has gone: *They shall go with their flocks and with their herds to seek Yahuah (LORD); but they shall not find him; he hath withdrawn himself from them* (Hosea 5:6). The reason is the burden of the whole prophecy — sacrifice without a turned heart cannot reach him: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Isaiah hears the same refusal of the unrepentant offering: *To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams... And when ye spread forth your hands, I will hide mine eyes from you: yea, when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:11,15). And Wisdom seals the sentence on the too-late seeking: *Then shall they call upon me, but I will not answer; they shall seek me early, but they shall not find me* (Proverbs 1:28). The flocks and herds are no substitute for the heart; the withdrawn face is found only by repentance, not by the multiplied beast.',
       sv.verse_id, ev.verse_id, 'free', 44803
  FROM _s328_hos05_lookup sv, _s328_hos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=5 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-5-ephraim-a-moth-and-yahudah-as-rottenness',
       E'Ephraim a moth and Yahudah as rottenness — both houses judged, not cast off',
       E'The judgment falls on BOTH houses, and it is a slow inward decay: *Ephraim shall be desolate in the day of rebuke* (Hosea 5:9); *The princes of Yahudah (Judah) were like them that remove the bound: therefore I will pour out my wrath upon them like water* (5:10); and the verdict that holds them together — *Therefore will I be unto Ephraim as a moth, and to the house of Yahudah (Judah) as rottenness* (5:12). The northern house (Ephraim/Yashar''el) eaten as by a moth, the southern house (Yahudah) rotting from within: this is the two-house judgment. But the decay is not the end. Paul names the limit and the guard against any cast-off reading: *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). The hardening is *in part*, with an appointed end; the same two houses that waste under the lawsuit are the two houses the Deliverer gathers and saves. Judgment serves restoration, never abandonment.',
       sv.verse_id, ev.verse_id, 'free', 44806
  FROM _s328_hos05_lookup sv, _s328_hos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian',
       E'The wrong physician — Ephraim went to the Assyrian, not to Yahuah Rapha',
       E'The sickness is real; the physician is wrong: *When Ephraim saw his sickness, and Yahudah (Judah) saw his wound, then went Ephraim to the Assyrian, and sent to king Jareb: yet could he not heal you, nor cure you of your wound* (Hosea 5:13). Both houses felt the wound — and both turned to the nations instead of to the One who had already named himself the Healer: *for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). Jeremiah grieves the same misplaced cure: *Is there no balm in Gilead; is there no physician there? why then is not the health of the daughter of my people recovered?* (Jeremiah 8:22). And the Formed Son came as that very Physician — *They that be whole need not a physician, but they that are sick* (Matthew 9:12) — quoting at the same table Hosea''s own word, *I will have mercy, and not sacrifice* (Matthew 9:13; Hosea 6:6). The restored witness names the right resort that Ephraim refused: *in your sickness be not negligent: but pray to Yahuah (God), and he will make you whole* (Sirach 38:9); *He that sinneth before his Maker, let him fall into the hand of the physician* (Sirach 38:15). The wound that Assyria could not close, Yahuah Rapha alone heals.',
       sv.verse_id, ev.verse_id, 'extras', 44809
  FROM _s328_hos05_lookup sv, _s328_hos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-5-i-will-return-to-my-place-till-they-acknowledge',
       E'I will return to my place, till they acknowledge — the hinge into the third day',
       E'The chapter ends not in abandonment but in a waiting: *I will go and return to my place, till they acknowledge their offence, and seek my face: in their affliction they will seek me early* (Hosea 5:15). The withdrawn Presence is purposeful — *till they acknowledge*. And the very next breath shows the acknowledging arriving: *Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us; he hath smitten, and he will bind us up. After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:1-2). The lion who tore (5:14) is the One who heals and raises up. The condition of the return is the Torah''s own covenant promise: *But if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him, if thou seek him with all thy heart and with all thy soul* (Deuteronomy 4:29); *When thou art in tribulation... even in the latter days, if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30). And the acknowledging is the covenant''s own confession: *If they shall confess their iniquity, and the iniquity of their fathers... Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land* (Leviticus 26:40,42). The affliction is the appointed pressure that turns the two houses home; the acknowledging unlocks the seed-line covenant, and the withdrawn face is sought early and found.',
       sv.verse_id, ev.verse_id, 'free', 44812
  FROM _s328_hos05_lookup sv, _s328_hos05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=5 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Whosoever committeth sin is the servant of sin* (John 8:34) — the *spirit of whoredoms* that keeps them from framing their doings to turn (Hosea 5:4) is the bondage of sin.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-spirit-of-whoredoms-they-have-not-known-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If the Son therefore shall make you free, ye shall be free indeed* (John 8:36) — the bound will of Hosea 5:4 is loosed not by resolve but by the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=4
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-spirit-of-whoredoms-they-have-not-known-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — the *flocks* and *herds* of Hosea 5:6 cannot find him, for he wants the heart.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-they-shall-seek-yahuah-but-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *To what purpose is the multitude of your sacrifices unto me?* (Isaiah 1:11) — the unrepentant offering of Hosea 5:6 is the very multitude Yahuah refuses.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-they-shall-seek-yahuah-but-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when ye make many prayers, I will not hear: your hands are full of blood* (Isaiah 1:15) — *he hath withdrawn himself from them* (Hosea 5:6) is Yahuah hiding his eyes from worship without repentance.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-they-shall-seek-yahuah-but-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they shall seek me early, but they shall not find me* (Proverbs 1:28) — Wisdom''s sentence on the too-late seeking, exactly Hosea''s *they shall not find him* (Hosea 5:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=6
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-they-shall-seek-yahuah-but-not-find-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — the moth-and-rottenness decay of both houses (Hosea 5:12) is a hardening IN PART, with an appointed end.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-ephraim-a-moth-and-yahudah-as-rottenness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *And so all Yashar''el (Israel) shall be saved... There shall come out of Sion the Deliverer* (Romans 11:26) — both houses that waste under the lawsuit (Hosea 5:12) are gathered and saved, never cast off.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=12
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-ephraim-a-moth-and-yahudah-as-rottenness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26) — Ephraim ran to the Assyrian (Hosea 5:13) past the One who had already named himself the Healer.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Is there no balm in Gilead; is there no physician there?* (Jeremiah 8:22) — the wound Assyria could not cure (Hosea 5:13) is the unrecovered health of the daughter of his people.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *They that be whole need not a physician, but they that are sick* (Matthew 9:12) — the Formed Son comes as the Physician for Ephraim''s sickness (Hosea 5:13), and quotes Hosea''s own mercy-not-sacrifice (9:13).'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *in your sickness... pray to Yahuah (God), and he will make you whole* (Sirach 38:9) — the clean witness names the right resort Ephraim refused when he sent to king Jareb (Hosea 5:13).'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *He that sinneth before his Maker, let him fall into the hand of the physician* (Sirach 38:15) — Ephraim fell instead into the hand of the wrong healer who *could he not heal you* (Hosea 5:13).'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=38 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-the-wrong-physician-went-ephraim-to-the-assyrian'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us* (Hosea 6:1) — the acknowledging of Hosea 5:15 turns straight into the return; the lion who tore is the One who heals.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2) — the seeking *in their affliction* (Hosea 5:15) ends in resurrection, not death.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *if from thence thou shalt seek Yahuah Elohayka (the LORD thy God), thou shalt find him* (Deuteronomy 4:29) — the *seek my face* of Hosea 5:15 is the Torah''s own promise to the whole-hearted seeker.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *When thou art in tribulation... if thou turn to Yahuah Elohayka (the LORD thy God), and shalt be obedient unto his voice* (Deuteronomy 4:30) — *in their affliction they will seek me early* (Hosea 5:15) is the latter-day turning Moses foretold.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*If they shall confess their iniquity, and the iniquity of their fathers* (Leviticus 26:40) — *till they acknowledge their offence* (Hosea 5:15) is the covenant''s own confession.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Then will I remember my covenant with Jacob... Isaac... Abraham* (Leviticus 26:42) — the acknowledging of Hosea 5:15 unlocks the seed-line covenant and the gathering of the two houses.'
  FROM cross_reference_threads t
  JOIN _s328_hos05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s328_hos05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-5-i-will-return-to-my-place-till-they-acknowledge'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_6.sql (Hosea 6) -----
-- Chapter: Hosea 6 — THE THIRD-DAY RAISING and MERCY-NOT-SACRIFICE. Answering the close of ch.5
-- (*I will go and return to my place, till they acknowledge their offence, and seek my face*), the
-- people resolve to return: *Come, and let us return unto Yahuah (LORD): for he hath torn, and he
-- will heal us... After two days will he revive us: in the third day he will raise us up, and we
-- shall live in his sight* (6:1-2). ★★★ This is the third-day raising — fulfilled in the Messiah
-- raised *the third day according to the scriptures* (1 Corinthians 15:4; Luke 24:46), prefigured at
-- Moriah (Genesis 22:4) and in the fish (Jonah 1:17 -> Matthew 12:40), AND the corporate raising of
-- the two-house people (Ezekiel 37 dry bones; Romans 11:15 *life from the dead*). The going-forth
-- *prepared as the morning... as the latter and former rain* (6:3) is the dayspring and the outpoured
-- rain (Luke 1:78; Joel 2:23; James 5:7; the all-shall-know of Jeremiah 31:34). ★★★ *For I desired
-- mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (6:6) —
-- quoted TWICE by Yahusha (Matthew 9:13, Matthew 12:7); NOT the abolition of the sacrificial Torah
-- but its prophetic heart (1 Samuel 15:22; Micah 6:8; Psalm 51:16-17; Proverbs 21:3; Sirach 35).
-- *But they like men [Adam] have transgressed the covenant* (6:7 -> Romans 5:14, Adam the figure).
-- Tag: hos06   Temp view: _s328_hos06_lookup
-- Sort band: base 44825, step 3 -> threads at 44825, 44828, 44831, 44834, 44837 (5 threads)
-- Source of EVERY row: 'canon','hosea',6,v
--
-- Hosea 6 coverage:
--   ★★★ v.1-2 (he hath torn, and he will heal us... After two days will he revive us: in the third
--          day he will raise us up, and we shall live in his sight)
--        NT:     ★★★ 1 Corinthians 15:4 (he rose again the third day according to the scriptures),
--                ★★★ Luke 24:46 (it behoved Messiah to suffer, and to rise from the dead the third
--                day), ★★ Matthew 12:40 (so shall the Son of Adam be three days... in the heart of
--                the earth) — THREAD 1
--        Extras: none warranted (2 Esdras raising-material in this parse not vetted clean; the NT +
--                Tanakh witness carries the third day fully)
--        Tanakh: ★ Genesis 22:4 (Then on the third day Abraham lifted up his eyes), ★ Jonah 1:17
--                (Jonah was in the belly of the fish three days and three nights) — THREAD 1
--   ★★ v.2 read corporately (he will raise us up, and we shall live)
--        NT:     ★★ Romans 11:15 (what shall the receiving of them be, but life from the dead) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:11-12 (these bones are the whole house of Yashar'el... I will open
--                your graves... bring you into the land of Yashar'el) — THREAD 2 (the two-house raising)
--   ★ v.3 (his going forth is prepared as the morning; and he shall come unto us as the rain, as the
--          latter and former rain unto the earth / follow on to know Yahuah)
--        NT:     ★ Luke 1:78 (the dayspring from on high hath visited us), ★ James 5:7 (the husbandman
--                waiteth... until he receive the early and latter rain) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Joel 2:23 (he will cause to come down for you the rain, the former rain, and the
--                latter rain), ★ Jeremiah 31:34 (they shall all know me, from the least... unto the
--                greatest) — THREAD 3
--   v.4-5 (your goodness is as a morning cloud... I have slain them by the words of my mouth)
--        NT:     none warranted distinct (the words-of-his-mouth slaying woven in prose; Hebrews 4:12
--                and Isaiah 11:4 carried in THREAD 3 prose, not forced to members)
--        Extras: none warranted
--        Tanakh: held in prose (the fickle dew/morning-cloud is the foil to the steadfast rain of v.3)
--   ★★★ v.6 (For I desired mercy, and not sacrifice; and the knowledge of Elohim more than burnt offerings)
--        NT:     ★★★ Matthew 9:13 (I will have mercy, and not sacrifice: for I am not come to call
--                the righteous), ★★★ Matthew 12:7 (if ye had known what this meaneth, I will have
--                mercy, and not sacrifice, ye would not have condemned the guiltless) — THREAD 4
--        Extras: ★ Ecclesiasticus (Sirach) 35:3 (To depart from wickedness is a thing pleasing to
--                Yahuah; and to forsake unrighteousness is a propitiation) — THREAD 4 (Torah-keeping
--                IS the offering; obedience the heart of sacrifice — clean witness)
--        Tanakh: ★★ 1 Samuel 15:22 (to obey is better than sacrifice), ★★ Micah 6:8 (what doth Yahuah
--                require... but to do justly, and to love mercy), ★ Psalm 51:16-17 (thou desirest not
--                sacrifice... a broken and a contrite heart), ★ Proverbs 21:3 (to do justice and
--                judgment is more acceptable to Yahuah than sacrifice) — THREAD 4
--   ★ v.7 (But they like men [Adam] have transgressed the covenant: there have they dealt treacherously)
--        NT:     ★ Romans 5:14 (death reigned from Adam to Moses... Adam, who is the figure of him
--                that was to come) — THREAD 5
--        Extras: none warranted
--        Tanakh: held in prose (Genesis 3 the covenant broken in the garden — named, anchored to Adam)
--   v.8-11 (Gilead a city of iniquity... the company of priests murder... I returned the captivity of
--          my people)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted distinct (the bloody-priest lawsuit closes the chapter; v.11's
--                *returned the captivity of my people* = the same two-house gathering of THREAD 2, held
--                in prose; the harvest set for Yahudah looks to the ingathering)
--
-- Threads (slug — target libraries):
--   1. hosea-6-in-the-third-day-he-will-raise-us-up — NT (1 Corinthians 15, Luke 24, Matthew 12) +
--      Tanakh (Genesis 22, Jonah 1) [free]
--      (★★★ the third-day raising of the Messiah, prefigured at Moriah and in the fish)
--   2. hosea-6-i-will-open-your-graves-life-from-the-dead — NT (Romans 11) + Tanakh (Ezekiel 37) [free]
--      (★★ the corporate raising — the two-house people, dry bones, life from the dead)
--   3. hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning — NT (Luke 1, James 5) +
--      Tanakh (Joel 2, Jeremiah 31) [free]
--      (★ the dayspring; the outpoured former and latter rain; follow on to know Yahuah)
--   4. hosea-6-i-desired-mercy-and-not-sacrifice — NT (Matthew 9, Matthew 12) + Tanakh (1 Samuel 15,
--      Micah 6, Psalm 51, Proverbs 21) + Extras (Sirach 35) [extras]
--      (★★★ mercy and knowledge above ritual — the prophetic heart of the sacrificial Torah, NOT its abolition)
--   5. hosea-6-like-adam-they-have-transgressed-the-covenant — NT (Romans 5) [free]
--      (★ the covenant broken as Adam broke it; Adam the figure of him that was to come)
--
-- Framing notes:
--   ★★★ THE THIRD-DAY RAISING (THREAD 1): *Come, and let us return unto Yahuah (LORD): for he hath
--      torn, and he will heal us; he hath smitten, and he will bind us up. After two days will he
--      revive us: in the third day he will raise us up, and we shall live in his sight* (6:1-2). The
--      Messiah's resurrection answers it word for word: *he rose again the third day according to the
--      scriptures* (1 Corinthians 15:4) — and Yahusha names which scriptures: *thus it behoved Messiah
--      (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). The third-day pattern
--      runs the canon: Moriah (*Then on the third day Abraham lifted up his eyes*, Genesis 22:4) and
--      the fish (Jonah 1:17 -> *so shall the Son of Adam be three days and three nights in the heart of
--      the earth*, Matthew 12:40).
--   ★★ LIFE FROM THE DEAD (THREAD 2): *he will raise us up, and we shall live in his sight* (6:2) is
--      also the corporate raising of the scattered people — Ezekiel's dry bones: *these bones are the
--      whole house of Yashar'el (Israel)... I will open your graves... and bring you into the land of
--      Yashar'el (Israel)* (Ezekiel 37:11-12), and Paul's *life from the dead* (Romans 11:15). The
--      two-house regathering; NOT a cast-off people but a people raised. v.11's *returned the captivity
--      of my people* is the same gathering.
--   ★ THE LATTER AND FORMER RAIN (THREAD 3): *his going forth is prepared as the morning; and he shall
--      come unto us as the rain, as the latter and former rain unto the earth* (6:3). The dayspring
--      (Luke 1:78), the outpoured rain (Joel 2:23; James 5:7), the all-shall-know (Jeremiah 31:34).
--      Against the fickle *morning cloud* and *early dew* of v.4 — His coming is the steadfast rain.
--      Hebrews 4:12 / Isaiah 11:4 (the slaying *by the words of my mouth*, 6:5) woven in prose only.
--   ★★★ MERCY AND NOT SACRIFICE (THREAD 4): *For I desired mercy, and not sacrifice; and the knowledge
--      of Elohim (God) more than burnt offerings* (6:6). Quoted TWICE by Yahusha — at Matthew's call
--      (Matthew 9:13) and in the Sabbath grainfield (Matthew 12:7). This is NOT the abolition of the
--      sacrificial Torah; it is its prophetic priority — mercy and the knowledge of Elohim are what the
--      offerings were FOR. The whole canon says so: *to obey is better than sacrifice* (1 Samuel 15:22),
--      *to do justly, and to love mercy* (Micah 6:8), *a broken and a contrite heart* (Psalm 51:17),
--      *to do justice and judgment is more acceptable to Yahuah than sacrifice* (Proverbs 21:3). And the
--      restored witness affirms the same — the sacrifice that pleases is the obedient walk: *To depart
--      from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a
--      propitiation* (Sirach 35:3). The altar stands; mercy and knowledge are its heart.
--   ★ LIKE ADAM (THREAD 5): *But they like men have transgressed the covenant* (6:7) — like Adam in
--      the garden, who broke covenant and brought death; *death reigned from Adam to Moses... Adam,
--      who is the figure of him that was to come* (Romans 5:14). The broken covenant and the second
--      Adam who keeps it.
--   EXTRAS: Sirach 35:3 only (clean witness, parse verified) — Torah-keeping AS the offering, obedience
--      the heart of sacrifice; binds to 6:6. No extras forced on the third day, the rain, or Adam.
--   VERSES WITH NO SEPARATE ADD: v.4-5 (the morning-cloud goodness, the slaying by his words — woven
--      into THREAD 3 as the foil to the steadfast rain), v.8-11 (the bloody-priest covenant-lawsuit —
--      Gilead, the murdering priests; v.11's harvest/returned-captivity carried in THREAD 2's gathering
--      prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): In the third day he will raise us up — the Messiah's resurrection, prefigured
    ('canon','hosea',6,2,'canon','1-corinthians',15,4,'free',
      E'*And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4). Hosea''s *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2) is among *the scriptures* Paul names: the Messiah *rose again the third day*. The returning people''s hope of being raised on the third day is answered in the One raised the third day.'),
    ('canon','hosea',6,2,'canon','luke',24,46,'free',
      E'*And said unto them, Thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). The risen Yahusha (Jesus) opens the scriptures and names the very pattern of Hosea 6:2 — *in the third day he will raise us up, and we shall live in his sight*: *thus it is written... to rise from the dead the third day*. The prophet''s third-day raising is *written* of him.'),
    ('canon','hosea',6,2,'canon','matthew',12,40,'free',
      E'*For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). The three-day, third-day raising of Hosea 6:2 is the sign Yahusha gives — *three days and three nights in the heart of the earth*, then raised. The Son of Adam swallowed by death and brought up the third day.'),
    ('canon','hosea',6,2,'canon','genesis',22,4,'free',
      E'*Then on the third day Abraham lifted up his eyes, and saw the place afar off* (Genesis 22:4). At Moriah the son given up for the offering is, in figure, received back *on the third day* — Abraham accounting that Elohim could raise him (Hebrews 11:19). The third-day motif of Hosea 6:2 reaches back to the binding: *in the third day he will raise us up*.'),
    ('canon','hosea',6,2,'canon','jonah',1,17,'free',
      E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). The prophet swallowed and brought up alive is the sign Yahusha claims (Matthew 12:40) — and the same shape as Hosea''s *After two days will he revive us: in the third day he will raise us up* (Hosea 6:2). Down into death''s belly, then raised.'),

    -- THREAD 2 (★★): Life from the dead — the corporate two-house raising (dry bones)
    ('canon','hosea',6,2,'canon','ezekiel',37,11,'free',
      E'*Then he said unto me, Son of Adam, these bones are the whole house of Yashar''el (Israel): behold, they say, Our bones are dried, and our hope is lost: we are cut off for our parts* (Ezekiel 37:11). The *we shall live in his sight* of Hosea 6:2 is the raising of the scattered people — *the whole house of Yashar''el (Israel)* whose hope was lost, raised from the grave of exile. The torn and smitten people (6:1) are the dry bones made to live.'),
    ('canon','hosea',6,2,'canon','ezekiel',37,12,'free',
      E'*Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). Hosea''s *in the third day he will raise us up* (Hosea 6:2) is sung corporately here: *I will open your graves... and bring you into the land*. The two-house people raised and gathered home — not a cast-off people but a people raised.'),
    ('canon','hosea',6,2,'canon','romans',11,15,'free',
      E'*For if the casting away of them be the reconciling of the world, what shall the receiving of them be, but life from the dead?* (Romans 11:15). The receiving back of Yashar''el (Israel) is *life from the dead* — the very raising Hosea names: *he will raise us up, and we shall live in his sight* (Hosea 6:2). Paul guards the people: not cast off, but to be received — resurrection for the nation.'),

    -- THREAD 3 (★): The latter and former rain — his going forth as the morning; follow on to know Yahuah
    ('canon','hosea',6,3,'canon','joel',2,23,'free',
      E'*Be glad then, ye children of Zion, and rejoice in Yahuah Elohaychem (the LORD your God): for he hath given you the former rain moderately, and he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23). Hosea''s *he shall come unto us as the rain, as the latter and former rain unto the earth* (Hosea 6:3) is Joel''s outpoured rain — the prophet-pair name the same coming refreshing, the rain that revives the returning land.'),
    ('canon','hosea',6,3,'canon','james',5,7,'free',
      E'*Be patient therefore, brethren, unto the coming of the Lord. Behold, the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain* (James 5:7). The *latter and former rain* by which He comes (Hosea 6:3) is the husbandman''s hope *unto the coming of the Lord* — the early and latter rain awaited before the harvest. His going-forth *prepared as the morning* is the coming James bids us wait for.'),
    ('canon','hosea',6,3,'canon','luke',1,78,'free',
      E'*Through the tender mercy of our Elohim (God); whereby the dayspring from on high hath visited us* (Luke 1:78). *His going forth is prepared as the morning* (Hosea 6:3) is the dayspring that has visited — the morning light of the One who comes. The promised morning of Hosea is the dawn Zacharias blesses.'),
    ('canon','hosea',6,3,'canon','jeremiah',31,34,'free',
      E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34). Hosea''s *Then shall we know, if we follow on to know Yahuah (LORD)* (Hosea 6:3) is the new-covenant promise: *they shall all know me*. The knowledge pursued in Hosea is the knowledge written on the heart in Jeremiah — Torah within, not Torah replaced.'),

    -- THREAD 4 (★★★): I desired mercy, and not sacrifice — the prophetic heart of the Torah, NOT abolition
    ('canon','hosea',6,6,'canon','matthew',9,13,'free',
      E'*But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13). Yahusha quotes Hosea 6:6 at Matthew''s call — *I desired mercy, and not sacrifice* — against those who scorned eating with sinners. Mercy is the heart the offerings were always for; He came to call sinners, the very thing the prophets cried.'),
    ('canon','hosea',6,6,'canon','matthew',12,7,'free',
      E'*But if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). In the Sabbath grainfield Yahusha quotes Hosea 6:6 a second time — *I desired mercy, and not sacrifice* — to defend the hungry disciples. Not a setting-aside of Sabbath or Torah, but its heart: mercy and the knowledge of Elohim above ritual condemnation.'),
    ('canon','hosea',6,6,'canon','1-samuel',15,22,'free',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Saul''s spared spoil and Hosea''s *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) say one thing: *to obey is better than sacrifice*. The offering without the obedient heart is empty.'),
    ('canon','hosea',6,6,'canon','micah',6,8,'free',
      E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Micah answers the question of the burnt offerings (6:6-7) exactly as Hosea does: not rams and oil but *to love mercy*. *I desired mercy, and not sacrifice* (Hosea 6:6) — the requirement is the merciful, humble, just walk the sacrifices pointed to.'),
    ('canon','hosea',6,6,'canon','psalms',51,16,'free',
      E'*For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering* (Psalm 51:16). David''s penitence and Hosea''s word agree — *I desired mercy, and not sacrifice... more than burnt offerings* (Hosea 6:6); *thou desirest not sacrifice... thou delightest not in burnt offering*. The offering Yahuah will not despise is the contrite heart (51:17).'),
    ('canon','hosea',6,6,'canon','psalms',51,17,'free',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). The *knowledge of Elohim (God) more than burnt offerings* of Hosea 6:6 is this broken and contrite heart — the true *sacrifices of Elohim (God)*. Not the abolition of the altar but the heart it was made to carry.'),
    ('canon','hosea',6,6,'canon','proverbs',21,3,'free',
      E'*To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). Wisdom states the priority Hosea proclaims — *I desired mercy, and not sacrifice* (Hosea 6:6): justice and judgment *more acceptable... than sacrifice*. The whole canon ranks the merciful, righteous walk above the ritual it was meant to express.'),
    ('canon','hosea',6,6,'apocrypha','ecclesiasticus',35,3,'extras',
      E'*To depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation* (Sirach 35:3). The restored witness affirms Hosea 6:6: the offering that pleases is the obedient, righteous walk — *to depart from wickedness... a propitiation*. Sirach holds the altar standing (35:1, *He that keepeth the law brings offerings enough*) yet names its heart, exactly as *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6).'),

    -- THREAD 5 (★): Like Adam they have transgressed the covenant
    ('canon','hosea',6,7,'canon','romans',5,14,'free',
      E'*Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). Hosea''s *But they like men have transgressed the covenant* (Hosea 6:7) reads the breach as Adam''s — covenant broken in the garden, death entering. Paul names Adam *the figure of him that was to come*: the first Adam broke the covenant; the second keeps and restores it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-6-in-the-third-day-he-will-raise-us-up',
       E'In the third day he will raise us up — the resurrection of the Messiah',
       E'The returning people speak the chapter''s great hope: *Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us; he hath smitten, and he will bind us up. After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:1-2). This is the third-day raising. Paul names it among *the scriptures*: *that he rose again the third day according to the scriptures* (1 Corinthians 15:4); and the risen Yahusha (Jesus) himself opens it: *thus it is written, and thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46). The pattern is woven through the canon from the beginning — at Moriah the son is, in figure, received back *on the third day* (*Then on the third day Abraham lifted up his eyes, and saw the place afar off*, Genesis 22:4) — and in the deep: *Jonah was in the belly of the fish three days and three nights* (Jonah 1:17), the sign Yahusha claims: *so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). Hosea''s torn-and-healed, smitten-and-bound, slain-and-raised is the shape of the Messiah, and of all who are raised in him.',
       sv.verse_id, ev.verse_id, 'free', 44825
  FROM _s328_hos06_lookup sv, _s328_hos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-6-i-will-open-your-graves-life-from-the-dead',
       E'We shall live in his sight — the two-house people raised, life from the dead',
       E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2) is also the raising of the whole scattered people. Ezekiel sees it in the valley of dry bones: *these bones are the whole house of Yashar''el (Israel): behold, they say, Our bones are dried, and our hope is lost: we are cut off for our parts* (Ezekiel 37:11) — and the answer: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). The torn and smitten people of Hosea 6:1 are the dry bones made to live and gathered home — the two-house regathering, not a cast-off nation. Paul guards it: *what shall the receiving of them be, but life from the dead?* (Romans 11:15). The chapter itself closes on the same gathering: *O Yahudah (Judah), he hath set an harvest for thee, when I returned the captivity of my people* (Hosea 6:11). Raised, received, brought home.',
       sv.verse_id, ev.verse_id, 'free', 44828
  FROM _s328_hos06_lookup sv, _s328_hos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning',
       E'His going forth as the morning, as the latter and former rain — follow on to know Yahuah',
       E'After the raising comes the knowing and the coming: *Then shall we know, if we follow on to know Yahuah (LORD): his going forth is prepared as the morning; and he shall come unto us as the rain, as the latter and former rain unto the earth* (Hosea 6:3). His going-forth is the dayspring — *the dayspring from on high hath visited us* (Luke 1:78) — and the outpoured rain the prophets promise: *he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23), the rain the husbandman waits for *unto the coming of the Lord* (*the husbandman waiteth for the precious fruit of the earth, and hath long patience for it, until he receive the early and latter rain*, James 5:7). And the knowledge Hosea bids us *follow on to know* is the new-covenant promise: *they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD)* (Jeremiah 31:34) — the Torah written within, not replaced. This steadfast coming stands against the people''s fickle goodness, *as a morning cloud, and as the early dew it goeth away* (Hosea 6:4) — and against it Yahuah hews by the prophets and slays *by the words of my mouth* (6:5), the sword that is His word.',
       sv.verse_id, ev.verse_id, 'free', 44831
  FROM _s328_hos06_lookup sv, _s328_hos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-6-i-desired-mercy-and-not-sacrifice',
       E'I desired mercy, and not sacrifice — the heart of the Torah, not its abolition',
       E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Yahusha (Jesus) loved this verse and quoted it TWICE: at Matthew''s call, against those who scorned his eating with sinners — *go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13); and in the Sabbath grainfield, defending the hungry disciples — *if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). This is NOT the cancelling of the sacrificial Torah — it is its prophetic heart. Mercy and the knowledge of Elohim are what the offerings were always FOR. The whole canon ranks them so: *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22); *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8); *thou desirest not sacrifice... The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:16-17); *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3). The restored witness keeps both together — the altar standing AND its heart: *He that keepeth the law brings offerings enough* (Sirach 35:1), yet *to depart from wickedness is a thing pleasing to Yahuah (God); and to forsake unrighteousness is a propitiation* (Sirach 35:3). The sacrifice without mercy and knowledge is the empty shell; the obedient, merciful walk is the offering Yahuah desired.',
       sv.verse_id, ev.verse_id, 'extras', 44834
  FROM _s328_hos06_lookup sv, _s328_hos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=6 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-6-like-adam-they-have-transgressed-the-covenant',
       E'Like Adam they have transgressed the covenant — Adam the figure of him to come',
       E'*But they like men have transgressed the covenant: there have they dealt treacherously against me* (Hosea 6:7). The breach is read as Adam''s — the covenant broken in the garden, the treachery against Yahuah that brought death into the world. Paul names that first transgression and the One who answers it: *death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression, who is the figure of him that was to come* (Romans 5:14). Adam is the figure of the Messiah — the first man broke covenant and brought death, the last brings the third-day raising of Hosea 6:2 and keeps the covenant the people *like men* transgressed. The chapter''s closing lawsuit (the iniquity of Gilead, the priests who *murder in the way by consent*, the defilement of Ephraim, 6:8-10) is the treachery of the broken covenant — yet even there the harvest is set and the captivity returned (6:11).',
       sv.verse_id, ev.verse_id, 'free', 44837
  FROM _s328_hos06_lookup sv, _s328_hos06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *he rose again the third day according to the scriptures* (1 Corinthians 15:4) — Hosea 6:2''s *in the third day he will raise us up* is among the scriptures Paul names.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-in-the-third-day-he-will-raise-us-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *thus it behoved Messiah (Christ) to suffer, and to rise from the dead the third day* (Luke 24:46) — the risen Yahusha names the very pattern of Hosea 6:2 as written.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-in-the-third-day-he-will-raise-us-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40) — the three-day raising of Hosea 6:2 is the sign Yahusha gives.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-in-the-third-day-he-will-raise-us-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Then on the third day Abraham lifted up his eyes* (Genesis 22:4) — the son received back in figure on the third day; the binding prefigures Hosea 6:2''s raising.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-in-the-third-day-he-will-raise-us-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Jonah was in the belly of the fish three days and three nights* (Jonah 1:17) — swallowed by death and brought up, the same shape as *in the third day he will raise us up* (Hosea 6:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-in-the-third-day-he-will-raise-us-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *these bones are the whole house of Yashar''el (Israel): behold, they say... our hope is lost* (Ezekiel 37:11) — the torn people of Hosea 6:1 are the dry bones; *we shall live in his sight* (6:2) is their raising.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-will-open-your-graves-life-from-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will open your graves... and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12) — the corporate raising and gathering of *in the third day he will raise us up* (Hosea 6:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-will-open-your-graves-life-from-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *what shall the receiving of them be, but life from the dead?* (Romans 11:15) — Yashar''el received back IS the raising of Hosea 6:2; not cast off, but raised.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=2
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-will-open-your-graves-life-from-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he will cause to come down for you the rain, the former rain, and the latter rain* (Joel 2:23) — the outpoured rain by which He comes (Hosea 6:3).'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the husbandman waiteth... until he receive the early and latter rain* (James 5:7) — the latter and former rain of Hosea 6:3 awaited unto the coming of the Lord.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the dayspring from on high hath visited us* (Luke 1:78) — *his going forth is prepared as the morning* (Hosea 6:3) is the dayspring that has come.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=78
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *they shall all know me, from the least of them unto the greatest* (Jeremiah 31:34) — the knowledge Hosea bids us *follow on to know* (6:3), the Torah written within.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-the-latter-and-former-rain-his-going-forth-as-the-morning'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners* (Matthew 9:13) — Yahusha quotes Hosea 6:6 at Matthew''s call.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7) — Hosea 6:6 quoted a second time, in the Sabbath grainfield.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — the same priority Hosea proclaims (6:6): obedience the heart of the offering.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy* (Micah 6:8) — Micah answers the burnt-offering question as Hosea 6:6 does.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *thou desirest not sacrifice... thou delightest not in burnt offering* (Psalm 51:16) — David''s penitence agrees with *mercy, and not sacrifice* (Hosea 6:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the *knowledge of Elohim more than burnt offerings* (Hosea 6:6) is the contrite heart.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *To do justice and judgment is more acceptable to Yahuah (LORD) than sacrifice* (Proverbs 21:3) — wisdom states the priority of Hosea 6:6.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *to depart from wickedness is a thing pleasing to Yahuah (God)... a propitiation* (Sirach 35:3) — the restored witness keeps the altar AND its heart, as Hosea 6:6 (extras).'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-i-desired-mercy-and-not-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *death reigned from Adam to Moses... Adam, who is the figure of him that was to come* (Romans 5:14) — Hosea 6:7''s *like men [Adam] have transgressed the covenant* read through the first Adam and the last.'
  FROM cross_reference_threads t
  JOIN _s328_hos06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=6 AND sv.verse_number=7
  JOIN _s328_hos06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-6-like-adam-they-have-transgressed-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_7.sql (Hosea 7) -----
-- Chapter: Hosea 7 — Ephraim a cake not turned; mixed among the nations; they return, but not to
-- the Most High. The healing-word is refused (7:1); the adulterous court forgets that Yahuah
-- remembers ALL their wickedness (7:2); the oven of lust, the drunken king, the fallen kings who
-- call not on Yahuah (7:3-7). ★★ The load-bearing frame: *Ephraim, he hath mixed himself among
-- the people; Ephraim is a cake not turned. Strangers have devoured his strength, and he knoweth
-- it not* (7:8-9) — the northern house assimilating into the goyim, losing its identity, to be
-- regathered (the two-house scattering; Ezekiel 37, Romans 11, NEVER replacement). ★ Ephraim a
-- silly dove flitting to Egypt and Assyria for help instead of to Yahuah (7:11-12); ★ the
-- half-hearted false return — *they return, but not to the most High: they are like a deceitful
-- bow* (7:16) — over against the true return of 6:1/14:1-2.
-- Tag: hos07   Temp view: _s328_hos07_lookup
-- Sort band: base 44850, step 3 -> threads at 44850, 44853, 44856, 44859 (4 threads)
-- Source of EVERY row: 'canon','hosea',7,v
--
-- Hosea 7 coverage:
--   v.1 (When I would have healed Yashar'el, then the iniquity of Ephraim was discovered)
--        NT/Extras/Tanakh: none warranted distinct — the refused healing-word is the preface to
--        the remembered-wickedness of v.2 (THREAD 1); woven in prose.
--   ★ v.2 (they consider not in their hearts that I remember all their wickedness... they are
--          before my face)
--        NT:     ★ Hebrews 4:13 (all things are naked and opened unto the eyes of him) — THREAD 1
--        Extras: ★ Sirach 23:18-20 (the adulterer: Who seeth me?... the eyes of Yahuah are ten
--                thousand times brighter than the sun) — THREAD 1 (clean witness, parse verified)
--        Tanakh: ★ Numbers 32:23 (be sure your sin will find you out), Psalm 90:8 (Thou hast set
--                our iniquities before thee) — THREAD 1
--   v.3-7 (the king made glad with wickedness; the oven of lust; the drunken king; all their
--          kings are fallen: there is none among them that calleth unto me)
--        NT/Extras: none warranted distinct (the burning oven / fallen kings are the inner court
--        of the same apostasy; woven into THREAD 1 prose as the conduct Yahuah remembers).
--        Tanakh: held in prose with v.2.
--   ★★ v.8-9 (Ephraim, he hath mixed himself among the people; Ephraim is a cake not turned.
--          Strangers have devoured his strength, and he knoweth it not)
--        NT:     ★★ Romans 11:25 (blindness in part is happened to Yashar'el, until the fulness
--                of the Gentiles be come in), Romans 11:1 GUARD (Hath Elohim cast away his
--                people? Elohim forbid) — THREAD 2
--        Extras: none warranted (no clean assimilation witness; Baruch parses not pulled clean)
--        Tanakh: ★★ Hosea 8:8 (Yashar'el is swallowed up... among the Gentiles as a vessel
--                wherein is no pleasure), Ezekiel 20:32 (We will be as the heathen) + 20:34 (I
--                will gather you out of the countries), ★★ Ezekiel 37:22 (I will make them one
--                nation... no more two nations) — THREAD 2 (the load-bearing two-house weave)
--   v.10 (the pride of Yashar'el testifieth to his face: and they do not return to Yahuah)
--        NT/Extras/Tanakh: none warranted distinct — the unreturning pride is the hinge into the
--        silly-dove flight of v.11 (THREAD 3) and the false return of v.16 (THREAD 4); woven.
--   ★ v.11-12 (Ephraim also is like a silly dove without heart: they call to Egypt, they go to
--          Assyria... I will spread my net upon them)
--        NT:     none warranted distinct (the flight-to-the-nations-for-help is a Tanakh-internal
--        covenant-lawsuit motif; carried in prose + the deceitful-bow forward weave of THREAD 4)
--        Extras: none warranted
--        Tanakh: ★ Hosea 8:8 (swallowed up among the Gentiles) shared frame; ★ the seeking-Egypt
--                /Assyria flight is bound with THREAD 3's own source verses (the net of v.12).
--   ★ v.13-16 (they have fled from me... they return, but not to the most High: they are like a
--          deceitful bow)
--        NT:     ★ James 4:8 (Draw nigh to Elohim, and he will draw nigh to you... purify your
--                hearts, ye double minded) — THREAD 4 (the true return vs. the half-hearted)
--        Extras: none warranted
--        Tanakh: ★ Psalm 78:57 (turned aside like a deceitful bow) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. hosea-7-i-remember-all-their-wickedness — NT (Hebrews 4) + Extras (Sirach 23) + Tanakh
--      (Numbers 32, Psalm 90) [extras]
--      (★ the all-seeing Yahuah who remembers all; they are before his face)
--   2. hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations — NT (Romans 11) + Tanakh
--      (Hosea 8, Ezekiel 20, Ezekiel 37) [free]
--      (★★ the two-house assimilation/scattering of the northern house, to be regathered — the
--      load-bearing frame; Romans 11:1 guard, NEVER replacement)
--   3. hosea-7-a-silly-dove-they-call-to-egypt-they-go-to-assyria — Tanakh (Hosea 8) [free]
--      (★ Ephraim flitting to the nations for help instead of to Yahuah; the net of judgment)
--   4. hosea-7-they-return-but-not-to-the-most-high — NT (James 4) + Tanakh (Psalm 78) [free]
--      (★ the half-hearted false return = the deceitful bow, over against the true return)
--
-- Framing notes:
--   ★ I REMEMBER ALL THEIR WICKEDNESS (THREAD 1): *And they consider not in their hearts that I
--      remember all their wickedness: now their own doings have beset them about; they are before
--      my face* (7:2). Hebrews names the same all-seeing gaze: *Neither is there any creature that
--      is not manifest in his sight: but all things are naked and opened unto the eyes of him with
--      whom we have to do* (Hebrews 4:13). The restored witness draws the very portrait of Ephraim's
--      adulterous court (7:4): *A man that breaks wedlock, saying thus in his heart, Who seeth me?...
--      the Most High will not remember my sins... the eyes of Yahuah (God) are ten thousand times
--      brighter than the sun, beholding all the ways of men* (Sirach 23:18-19). Torah's warning
--      stands (Numbers 32:23) and the psalm sings it (Psalm 90:8). Sin is never forgotten; it is
--      before his face.
--   ★★ EPHRAIM A CAKE NOT TURNED (THREAD 2): *Ephraim, he hath mixed himself among the people;
--      Ephraim is a cake not turned* (7:8) — the northern house assimilating into the goyim,
--      half-baked, losing its identity: *Strangers have devoured his strength, and he knoweth it
--      not* (7:9). This is the two-house scattering. Hosea says it plainly: *Yashar'el (Israel) is
--      swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure*
--      (8:8). Ezekiel records the very mind of the assimilating house — *We will be as the heathen*
--      (20:32) — and the gathering answer — *I will gather you out of the countries wherein ye are
--      scattered* (20:34) — until the two sticks are one: *I will make them one nation... and they
--      shall be no more two nations* (37:22). Paul holds the mystery: *blindness in part is happened
--      to Yashar'el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — and the
--      GUARD: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The cake
--      not turned is Ephraim lost among the nations to be REGATHERED — never replaced.
--   ★ A SILLY DOVE (THREAD 3): *Ephraim also is like a silly dove without heart: they call to
--      Egypt, they go to Assyria* (7:11) — flitting to the nations for rescue instead of to Yahuah,
--      so the net falls: *I will spread my net upon them; I will bring them down as the fowls of the
--      heaven* (7:12). The same swallowing-up among the Gentiles (Hosea 8:8) is the end of trusting
--      the nations rather than Yahuah.
--   ★ THEY RETURN, BUT NOT TO THE MOST HIGH (THREAD 4): *They return, but not to the most High:
--      they are like a deceitful bow* (7:16) — the half-hearted false return, the bow that springs
--      back and betrays the archer: *they were turned aside like a deceitful bow* (Psalm 78:57). The
--      true return is whole-hearted: *Draw nigh to Elohim (God), and he will draw nigh to you...
--      purify your hearts, ye double minded* (James 4:8) — the cure for the double-minded dove who
--      *cried not unto me with their heart* (7:14). Set against Hosea's own true-return word: *Come,
--      and let us return unto Yahuah (LORD)* (6:1); *Take with you words, and turn to Yahuah*
--      (14:2).
--   EXTRAS: Sirach 23:18-20 (the wedlock-breaker who thinks no eye sees) — clean witness, parse
--      verified, the perfect mirror of the adulterous self-deception of 7:2,4. No extras forced on
--      the assimilation, the dove, or the false return.
--   VERSES WITH NO SEPARATE ADD: v.1 (the refused healing — preface to THREAD 1), v.3-7 (the oven,
--      the drunken king, the fallen kings — the conduct Yahuah remembers, woven into THREAD 1),
--      v.10 (the unreturning pride — hinge into THREADS 3-4), v.13-15 (fled, transgressed, howled
--      not with the heart — woven into THREAD 4's whole-hearted-return frame). All recorded.

CREATE TEMP VIEW _s328_hos07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): I remember all their wickedness — they are before my face
    ('canon','hosea',7,2,'canon','hebrews',4,13,'free',
      E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). Ephraim''s court forgets the very thing Hebrews proclaims: *they consider not in their hearts that I remember all their wickedness... they are before my face* (Hosea 7:2). Nothing is hidden; all things are *naked and opened* to his eyes, and Ephraim''s own doings are spread before his face.'),
    ('canon','hosea',7,2,'apocrypha','ecclesiasticus',23,18,'extras',
      E'*A man that breaks wedlock, saying thus in his heart, Who seeth me? I am compassed about with darkness, the walls cover me, and no body seeth me; what need I to fear? the Most High will not remember my sins* (Sirach 23:18). This is the exact self-deception of Ephraim''s adulterous court — *they are all adulterers* (Hosea 7:4) who *consider not in their hearts that I remember all their wickedness* (7:2). The wedlock-breaker imagines *the Most High will not remember my sins*; Yahuah answers, *I remember ALL their wickedness*.'),
    ('canon','hosea',7,2,'apocrypha','ecclesiasticus',23,19,'extras',
      E'*Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19). The court that thinks itself unseen — *they consider not... that I remember all their wickedness* (Hosea 7:2) — stands before eyes *ten thousand times brighter than the sun, beholding all the ways of men*. They *are before my face* (7:2); the most secret parts are considered.'),
    ('canon','hosea',7,2,'canon','numbers',32,23,'free',
      E'*But if ye will not do so, behold, ye have sinned against Yahuah (LORD): and be sure your sin will find you out* (Numbers 32:23). Torah''s warning is the verdict of Hosea 7:2 — *their own doings have beset them about; they are before my face*. Ephraim''s sin has found him out; what Yahuah *remember[s]* hems them in on every side.'),
    ('canon','hosea',7,2,'canon','psalms',90,8,'free',
      E'*Thou hast set our iniquities before thee, our secret sins in the light of thy countenance* (Psalm 90:8). The psalm sings what Ephraim denies: their iniquities are *before thee*, their secret sins in *the light of thy countenance* — the very *I remember all their wickedness... they are before my face* of Hosea 7:2. No darkness covers what stands in the light of his countenance.'),

    -- THREAD 2 (★★): Ephraim a cake not turned — mixed among the nations (the two-house scattering, to be regathered)
    ('canon','hosea',7,8,'canon','hosea',8,8,'free',
      E'*Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8). The next breath names what *Ephraim, he hath mixed himself among the people; Ephraim is a cake not turned* (7:8) means: the northern house *swallowed up... among the Gentiles*, absorbed and unrecognizable. The cake half-baked is the house dissolved into the nations — to be regathered, not lost forever.'),
    ('canon','hosea',7,8,'canon','ezekiel',20,32,'free',
      E'*And that which cometh into your mind shall not be at all, that ye say, We will be as the heathen, as the families of the countries, to serve wood and stone* (Ezekiel 20:32). Ephraim *mixed himself among the people* (Hosea 7:8) is the very mind Ezekiel exposes — *We will be as the heathen*. The cake not turned is the house that chose to blend into the families of the countries; Yahuah declares that purpose *shall not be at all*.'),
    ('canon','hosea',7,9,'canon','ezekiel',20,34,'free',
      E'*And I will bring you out from the people, and will gather you out of the countries wherein ye are scattered, with a mighty hand, and with a stretched out arm, and with fury poured out* (Ezekiel 20:34). To the house that *knoweth it not* — *Strangers have devoured his strength, and he knoweth it not* (Hosea 7:9) — comes the answer: *I will gather you out of the countries wherein ye are scattered*. The assimilated, unknowing house is sought out and brought home.'),
    ('canon','hosea',7,8,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The end of *Ephraim is a cake not turned... mixed himself among the people* (Hosea 7:8) is not extinction but reunion: the stick of Joseph and the stick of Judah made *one nation*, *no more two nations*. The scattered northern house is regathered and joined to Yahudah.'),
    ('canon','hosea',7,8,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). Ephraim *mixed himself among the people* (Hosea 7:8), blinded and not knowing it (7:9) — *blindness in part is happened to Yashar''el*. But it is *in part*, and it has a term, *until the fulness of the Gentiles be come in*; the cake not turned is the mystery of an Israel scattered among the nations to be brought back.'),
    ('canon','hosea',7,9,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The strangers devouring Ephraim''s strength while he *knoweth it not* (Hosea 7:9) is judgment, NEVER a casting-off: *Hath Elohim (God) cast away his people? Elohim (God) forbid*. The cake not turned is chastened and assimilated, but his people are not cast away — they are to be regathered, never replaced.'),

    -- THREAD 3 (★): A silly dove — they call to Egypt, they go to Assyria
    ('canon','hosea',7,11,'canon','hosea',8,8,'free',
      E'*Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8). The *silly dove without heart* that *call[s] to Egypt* and *go[es] to Assyria* (Hosea 7:11) ends *swallowed up... among the Gentiles* — the very nations she fled to for help become her undoing. The dove who trusts Egypt and Assyria instead of Yahuah is devoured by them.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4 source-rows (separate INSERT to keep VALUES tidy)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 4 (★): They return, but not to the most High — the deceitful bow
    ('canon','hosea',7,16,'canon','psalms',78,57,'free',
      E'*But turned back, and dealt unfaithfully like their fathers: they were turned aside like a deceitful bow* (Psalm 78:57). Hosea takes up the same figure for Ephraim: *they return, but not to the most High: they are like a deceitful bow* (Hosea 7:16). The bow that springs back and betrays the archer is the half-hearted house that turns, but not to Yahuah — turned aside *like their fathers*.'),
    ('canon','hosea',7,16,'canon','james',4,8,'free',
      E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). Against the false return of *they return, but not to the most High* (Hosea 7:16) — the dove who *cried not unto me with their heart* (7:14) — James names the true return: *Draw nigh to Elohim (God)... purify your hearts, ye double minded*. The deceitful bow is the double-minded heart; the cure is to return whole, and he draws nigh.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-7-i-remember-all-their-wickedness',
       E'I remember all their wickedness — they are before my face',
       E'Ephraim''s court imagines its sin unseen: *And they consider not in their hearts that I remember all their wickedness: now their own doings have beset them about; they are before my face* (Hosea 7:2). They *make the king glad with their wickedness* (7:3), *they are all adulterers, as an oven heated by the baker* (7:4), the drunken king and the fallen princes — *all their kings are fallen: there is none among them that calleth unto me* (7:7). Yet nothing is hidden. Hebrews proclaims the same all-seeing gaze: *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The restored witness draws the very portrait of the wedlock-breaking court: *A man that breaks wedlock, saying thus in his heart, Who seeth me?... the Most High will not remember my sins. Such a man only fears the eyes of men, and knoweth not that the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:18-19). Torah said it long before: *be sure your sin will find you out* (Numbers 32:23); and the psalm sings it: *Thou hast set our iniquities before thee, our secret sins in the light of thy countenance* (Psalm 90:8). Ephraim''s doings have beset them about — sin is never forgotten; it stands before his face.',
       sv.verse_id, ev.verse_id, 'extras', 44850
  FROM _s328_hos07_lookup sv, _s328_hos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations',
       E'Ephraim a cake not turned — mixed among the nations, to be regathered',
       E'Here is the load-bearing word of the chapter: *Ephraim, he hath mixed himself among the people; Ephraim is a cake not turned. Strangers have devoured his strength, and he knoweth it not: yea, gray hairs are here and there upon him, yet he knoweth not* (Hosea 7:8-9). The northern house — Ephraim, Yosef, the ten tribes — assimilating into the goyim, half-baked, losing its very identity, aging and dissolving among the nations without even knowing it. This is the two-house scattering. The next chapter names it plainly: *Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8). Ezekiel records the mind of the assimilating house — *We will be as the heathen, as the families of the countries* (Ezekiel 20:32) — and the gathering answer: *I will bring you out from the people, and will gather you out of the countries wherein ye are scattered* (20:34) — until the two sticks are one: *I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations* (37:22). Paul holds the mystery without replacing the people: *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — and the GUARD stands firm: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The cake not turned is Ephraim lost among the nations to be REGATHERED — the wild branches grown wild from the same root, gathered home and joined to Yahudah. Never a new people grafted in by confession; never replacement. Both branches are Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 44853
  FROM _s328_hos07_lookup sv, _s328_hos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-7-a-silly-dove-they-call-to-egypt-they-go-to-assyria',
       E'A silly dove — they call to Egypt, they go to Assyria',
       E'Having mixed himself among the nations, Ephraim now runs to them for rescue: *Ephraim also is like a silly dove without heart: they call to Egypt, they go to Assyria* (Hosea 7:11) — flitting from one power to the next, never to Yahuah. So the net falls: *When they shall go, I will spread my net upon them; I will bring them down as the fowls of the heaven; I will chastise them, as their congregation hath heard* (7:12). The pride of Yashar''el testifies to his face, *and they do not return to Yahuah (LORD) their Elohim (God), nor seek him for all this* (7:10). The end of trusting Egypt and Assyria instead of Yahuah is to be devoured by the very nations sought: *Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8). The silly dove without heart finds no help in the powers of the earth — only the net of the One she would not seek.',
       sv.verse_id, ev.verse_id, 'free', 44856
  FROM _s328_hos07_lookup sv, _s328_hos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-7-they-return-but-not-to-the-most-high',
       E'They return, but not to the most High — the deceitful bow',
       E'The chapter closes on a false, half-hearted turning: *They return, but not to the most High: they are like a deceitful bow* (Hosea 7:16). They had *fled from me* (7:13); *they have not cried unto me with their heart, when they howled upon their beds: they assemble themselves for corn and wine, and they rebel against me* (7:14). The deceitful bow is the figure of the unfaithful house — the psalm uses it of the fathers: *But turned back, and dealt unfaithfully like their fathers: they were turned aside like a deceitful bow* (Psalm 78:57) — a bow that springs back and betrays the archer''s aim. Over against this half-return stands the true return Hosea himself calls for: *Come, and let us return unto Yahuah (LORD)* (6:1); *Take with you words, and turn to Yahuah (LORD)* (14:2). And the apostle names the cure for the double-minded dove: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). The deceitful bow is the divided heart; the true return is whole — and to the one who draws nigh, he draws nigh.',
       sv.verse_id, ev.verse_id, 'free', 44859
  FROM _s328_hos07_lookup sv, _s328_hos07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13) — the all-seeing gaze Ephraim forgets: *they consider not... that I remember all their wickedness* (Hosea 7:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-i-remember-all-their-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *A man that breaks wedlock, saying... Who seeth me?... the Most High will not remember my sins* (Sirach 23:18) — the exact self-deception of the adulterous court (Hosea 7:4) who *consider not... that I remember all their wickedness* (7:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-i-remember-all-their-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the eyes of Yahuah (God) are ten thousand times brighter than the sun, beholding all the ways of men, and considering the most secret parts* (Sirach 23:19) — the court that thinks itself unseen stands *before my face* (Hosea 7:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-i-remember-all-their-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *be sure your sin will find you out* (Numbers 32:23) — Torah''s verdict: Ephraim''s *own doings have beset them about* (Hosea 7:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=32 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-i-remember-all-their-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou hast set our iniquities before thee, our secret sins in the light of thy countenance* (Psalm 90:8) — the psalm sings what Ephraim denies: their sins *are before my face* (Hosea 7:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-i-remember-all-their-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8) — the cake not turned (Hosea 7:8) is the northern house *swallowed up... among the Gentiles*.'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *We will be as the heathen, as the families of the countries, to serve wood and stone* (Ezekiel 20:32) — the very mind of the house that *mixed himself among the people* (Hosea 7:8).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will... gather you out of the countries wherein ye are scattered* (Ezekiel 20:34) — the gathering answer to the house that *knoweth it not* (Hosea 7:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will make them one nation... and they shall be no more two nations* (Ezekiel 37:22) — the end of the cake not turned (Hosea 7:8) is reunion: Joseph and Judah made one.'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — the mystery of Ephraim mixed among the nations (Hosea 7:8), blinded and not knowing it (7:9), in PART and for a term.'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ GUARD: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — strangers devour Ephraim''s strength (Hosea 7:9), but his people are NOT cast off; chastened, assimilated, to be regathered, never replaced.'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-ephraim-a-cake-not-turned-mixed-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure* (Hosea 8:8) — the silly dove who *call[s] to Egypt* and *go[es] to Assyria* (Hosea 7:11) is devoured by the very nations she fled to.'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-a-silly-dove-they-call-to-egypt-they-go-to-assyria'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *they were turned aside like a deceitful bow* (Psalm 78:57) — the same figure for the unfaithful house: *they return, but not to the most High: they are like a deceitful bow* (Hosea 7:16).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=57
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-they-return-but-not-to-the-most-high'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Draw nigh to Elohim (God), and he will draw nigh to you... purify your hearts, ye double minded* (James 4:8) — the cure for the double-minded dove who *cried not unto me with their heart* (Hosea 7:14); the TRUE return against the false (7:16).'
  FROM cross_reference_threads t
  JOIN _s328_hos07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s328_hos07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-7-they-return-but-not-to-the-most-high'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_8.sql (Hosea 8) -----
-- Chapter: Hosea 8 — THE TORAH-AFFIRMATION CHAPTER of the covenant lawsuit. Judgment falls on the
-- northern house BECAUSE they broke the covenant and the Torah: *He shall come as an eagle against
-- the house of Yahuah (LORD), because they have transgressed my covenant, and trespassed against my
-- law* (8:1) — the Torah is AFFIRMED, the standard they are tried by, never the curse. They profess
-- *My Elohim (God), we know thee* (8:2) while casting off the good — the empty profession 1 John 2:4
-- exposes. They set up kings *but not by me* (8:4); they melt silver and gold into the calf of
-- Samaria — *the workman made it; therefore it is not Elohim (God)* (8:6), the made-thing that is no
-- god (Exodus 32, Acts 7:41, Wisdom of Solomon). They *have sown the wind, and they shall reap the
-- whirlwind* (8:7 — Galatians 6:7). Yashar'el is *swallowed up... among the Gentiles* (8:8), the
-- scattered northern house to be gathered (Ezekiel 37; Romans 11). And the keystone of the
-- anti-antinomian rebuke: *I have written to him the great things of my law, but they were counted
-- as a strange thing* (8:12) — the WRITTEN Torah despised as foreign — for *Yashar'el (Israel) hath
-- forgotten his Maker* (8:14; Deuteronomy 32:18; Romans 1).
-- Tag: hos08   Temp view: _s328_hos08_lookup
-- Sort band: base 44875, step 3 -> threads at 44875, 44878, 44881, 44884, 44887, 44890 (6 threads)
-- Source of EVERY row: 'canon','hosea',8,v
--
-- Hosea 8 coverage:
--   ★★ v.1-3 (He shall come as an eagle against the house of Yahuah... because they have transgressed
--          my covenant, and trespassed against my law... we know thee... Yashar'el hath cast off the
--          thing that is good)
--        NT:     ★ 1 John 2:4 (He that saith, I know him, and keepeth not his commandments, is a liar)
--                — THREAD 1 (the empty profession of v.2-3)
--        Extras: none warranted (Torah-affirmation carried by Tanakh witnesses)
--        Tanakh: ★★ Deuteronomy 28:49 (a nation against thee... as swift as the eagle flieth — the
--                covenant-curse eagle-nation), ★★ Daniel 9:11 (all Yashar'el have transgressed thy law)
--                — THREAD 1 (Torah AFFIRMED; the eagle = covenant judgment for Torah-breaking)
--   ★ v.4 (They have set up kings, but not by me... made them idols)
--        NT:     none warranted distinct (idol-making folds to the calf thread)
--        Extras: none warranted
--        Tanakh: ★ 1 Samuel 8:5,7 (make us a king... they have rejected me, that I should not reign
--                over them) — THREAD 2 (kings not by Yahuah)
--   ★★ v.5-6 (Thy calf, O Samaria... the workman made it; therefore it is not Elohim: but the calf of
--          Samaria shall be broken in pieces)
--        NT:     ★★ Acts 7:41 (they made a calf... and rejoiced in the works of their own hands) — THREAD 3
--        Extras: ★ Wisdom of Solomon 13:10 (in dead things is their hope, who call them gods, which are
--                the works of men's hands), ★ Wisdom of Solomon 14:8 (that which is made with hands is
--                cursed... being corruptible, it was called god) — THREAD 3 (the made-thing is no god)
--        Tanakh: ★★ Exodus 32:4 (he... made it a molten calf... These be thy gods, O Yashar'el),
--                Exodus 32:8, ★ Psalm 106:19-20 (made a calf in Horeb... changed their glory into the
--                similitude of an ox) — THREAD 3 (Formed/Formless: Yahuah is not men's handiwork)
--   ★★ v.7 (they have sown the wind, and they shall reap the whirlwind)
--        NT:     ★★ Galatians 6:7 (God is not mocked: for whatsoever a man soweth, that shall he also
--                reap), Galatians 6:8 (he that soweth to his flesh shall of the flesh reap corruption)
--                — THREAD 4
--        Extras: none warranted (the sowing-reaping proverb is well-witnessed in canon)
--        Tanakh: ★ Job 4:8 (they that plow iniquity, and sow wickedness, reap the same), ★ Proverbs
--                22:8 (He that soweth iniquity shall reap vanity) — THREAD 4
--   ★ v.8-9 (Yashar'el is swallowed up: now shall they be among the Gentiles... gone up to Assyria...
--          Ephraim hath hired lovers)
--        NT:     ★ Romans 11:1-2 (Hath Elohim cast away his people? Elohim forbid), ★ Romans 11:25-26
--                (blindness in part... until the fulness of the Gentiles... so all Yashar'el shall be
--                saved) — THREAD 5 (the GUARD: scattered, not cast off)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 37:19 (I will take the stick of Joseph... and make them one stick),
--                Ezekiel 37:22 (one nation... no more two nations) — THREAD 5 (Ephraim swallowed up =
--                the divorced northern house, to be gathered)
--   ★★ v.10-14 (now will I gather them... I have written to him the great things of my law, but they
--          were counted as a strange thing... For Yashar'el hath forgotten his Maker)
--        NT:     ★★ Romans 1:21 (they glorified him not as Elohim... their foolish heart was
--                darkened), Romans 1:25 (changed the truth of Elohim into a lie, and worshipped... the
--                creature more than the Creator) — THREAD 6 (forgot the Maker / Creator)
--        Extras: ★★ Baruch 4:1 (the book of the commandments of Yahuah, and the law that endureth for
--                ever: all they that keep it shall come to life), ★ Ecclesiasticus 24:23 (the law which
--                Moses commanded for an heritage to the congregations of Jacob) — THREAD 6 (the WRITTEN
--                Torah, the enduring heritage — counted a strange thing)
--        Tanakh: ★★ Deuteronomy 32:18 (the Rock that begat thee thou art unmindful, and hast forgotten
--                Elohim that formed thee) — THREAD 6 (forgotten his Maker)
--
-- Threads (slug — target libraries):
--   1. hosea-8-trespassed-against-my-torah-the-eagle-comes — Tanakh (Deuteronomy 28, Daniel 9) + NT (1 John 2) [free]
--      (★★ Torah AFFIRMED — judgment BECAUSE they trespassed the Torah; the eagle-nation curse; the empty "we know thee")
--   2. hosea-8-they-set-up-kings-but-not-by-me — Tanakh (1 Samuel 8) [free]
--      (★ kings raised without Yahuah = the same rejection of his reign)
--   3. hosea-8-the-calf-of-samaria-it-is-not-elohim — Tanakh (Exodus 32, Psalm 106) + NT (Acts 7) + Extras (Wisdom of Solomon 13-14) [extras]
--      (★★ the man-made calf is no god — Formed/Formless: Yahuah is not the work of men's hands)
--   4. hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind — NT (Galatians 6) + Tanakh (Job 4, Proverbs 22) [free]
--      (★★ sow the wind, reap the whirlwind = whatsoever a man soweth, that shall he reap)
--   5. hosea-8-yasharel-swallowed-up-among-the-nations — Tanakh (Ezekiel 37) + NT (Romans 11) [free]
--      (★ Ephraim scattered among the Gentiles = the divorced northern house, to be gathered into one stick; Romans 11 guard — not cast off)
--   6. hosea-8-the-great-things-of-my-torah-counted-a-strange-thing — Tanakh (Deuteronomy 32) + NT (Romans 1) + Extras (Baruch 4, Ecclesiasticus 24) [extras]
--      (★★ the WRITTEN Torah despised as foreign + forgotten his Maker — the anti-antinomian keystone)
--
-- Framing notes:
--   ★★ TRESPASSED AGAINST MY TORAH (THREAD 1): *He shall come as an eagle against the house of Yahuah
--      (LORD), because they have transgressed my covenant, and trespassed against my law* (8:1). The
--      Torah is the STANDARD they are judged by — affirmed, never the curse. The eagle is the
--      Deuteronomy 28 covenant-curse nation: *Yahuah (LORD) shall bring a nation against thee from far...
--      as swift as the eagle flieth* (Deuteronomy 28:49). Daniel makes the confession explicit: *all
--      Yashar'el (Israel) have transgressed thy law... therefore the curse is poured upon us* (Daniel
--      9:11) — the CURSE is the exile-judgment for breaking Torah, NOT the Torah itself. Against their
--      profession *My Elohim (God), we know thee* (8:2) while they *cast off the thing that is good*
--      (8:3) stands the filter: *He that saith, I know him, and keepeth not his commandments, is a
--      liar, and the truth is not in him* (1 John 2:4).
--   ★ KINGS NOT BY ME (THREAD 2): *They have set up kings, but not by me* (8:4). This is the old wound
--      from *make us a king to judge us like all the nations* (1 Samuel 8:5) — and Yahuah's verdict
--      then was the same: *they have not rejected thee, but they have rejected me, that I should not
--      reign over them* (1 Samuel 8:7).
--   ★★ THE CALF OF SAMARIA (THREAD 3): *Thy calf, O Samaria, hath cast thee off... the workman made
--      it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces*
--      (8:5-6). Jeroboam's golden calf repeats Horeb: *he... made it a molten calf: and they said,
--      These be thy gods, O Yashar'el (Israel)* (Exodus 32:4); *They made a calf in Horeb... changed
--      their glory into the similitude of an ox that eateth grass* (Psalm 106:19-20). Stephen names it
--      the works of their own hands: *they made a calf... and rejoiced in the works of their own
--      hands* (Acts 7:41). The made-thing is no god — *in dead things is their hope, who call them
--      gods, which are the works of men's hands* (Wisdom of Solomon 13:10); *that which is made with
--      hands is cursed... being corruptible, it was called god* (Wisdom of Solomon 14:8). This is the
--      Formed/Formless line: Yahuah is the Source who is not fashioned; the calf the workman made *is
--      not Elohim*.
--   ★★ SOW THE WIND, REAP THE WHIRLWIND (THREAD 4): *they have sown the wind, and they shall reap the
--      whirlwind* (8:7). Paul speaks the same harvest-law: *God is not mocked: for whatsoever a man
--      soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap
--      corruption* (Galatians 6:7-8). The wisdom tradition saw it: *they that plow iniquity, and sow
--      wickedness, reap the same* (Job 4:8); *He that soweth iniquity shall reap vanity* (Proverbs
--      22:8).
--   ★ SWALLOWED UP AMONG THE NATIONS (THREAD 5): *Yashar'el (Israel) is swallowed up: now shall they
--      be among the Gentiles* (8:8); *they are gone up to Assyria... Ephraim hath hired lovers* (8:9).
--      This is the divorced northern house, scattered — but the same word adds *now will I gather them*
--      (8:10). Ezekiel names the regathering: *I will take the stick of Joseph, which is in the hand of
--      Ephraim... and make them one stick* (Ezekiel 37:19); *they shall be no more two nations*
--      (Ezekiel 37:22). And Paul guards it against any cast-off reading: *Hath Elohim (God) cast away
--      his people? Elohim (God) forbid* (Romans 11:1); *blindness in part is happened to Yashar'el
--      (Israel), until the fulness of the Gentiles be come in. And so all Yashar'el (Israel) shall be
--      saved* (Romans 11:25-26). Victims scattered, not enemies cast off.
--   ★★ THE TORAH A STRANGE THING / FORGOTTEN HIS MAKER (THREAD 6): *I have written to him the great
--      things of my law, but they were counted as a strange thing* (8:12) — the WRITTEN Torah despised
--      as foreign; the anti-antinomian rebuke at its sharpest. For *Yashar'el (Israel) hath forgotten
--      his Maker* (8:14) — *the Rock that begat thee thou art unmindful, and hast forgotten Elohim
--      (God) that formed thee* (Deuteronomy 32:18); they *worshipped and served the creature more than
--      the Creator* (Romans 1:25). Yet the Torah they counted strange is the enduring inheritance: *the
--      book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep
--      it shall come to life* (Baruch 4:1); *the law which Moses commanded for an heritage to the
--      congregations of Jacob* (Ecclesiasticus 24:23).
--   VERSES WITH NO SEPARATE ADD: v.10 (now will I gather them — the gathering hinge, woven into THREAD
--      5's summary), v.11 (Ephraim's many altars to sin — the idolatry continuum, woven into THREADs 3
--      and 6 prose), v.13 (they shall return to Egypt — the reversal-of-the-exodus judgment, woven
--      into THREAD 6 prose as the fruit of forgetting the Maker). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Trespassed against my Torah — the eagle comes (Torah AFFIRMED)
    ('canon','hosea',8,1,'canon','deuteronomy',28,49,'free',
      E'*Yahuah (LORD) shall bring a nation against thee from far, from the end of the earth, as swift as the eagle flieth; a nation whose tongue thou shalt not understand* (Deuteronomy 28:49). The eagle of *He shall come as an eagle against the house of Yahuah (LORD), because they have transgressed my covenant, and trespassed against my law* (Hosea 8:1) is the very covenant-curse nation Moses foretold — *a nation... as swift as the eagle flieth*. The judgment falls BECAUSE the Torah was trespassed; the Torah is the standard, the curse the exile-penalty for breaking it.'),
    ('canon','hosea',8,1,'canon','daniel',9,11,'free',
      E'*Yea, all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11). Daniel''s confession is Hosea''s charge made plain: they *transgressed my covenant, and trespassed against my law* (Hosea 8:1). The Torah is affirmed and binding — *all Yashar''el have transgressed thy law* — and the curse poured out is the written penalty for breaking it, never the Torah itself.'),
    ('canon','hosea',8,2,'canon','1-john',2,4,'free',
      E'*He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). Yashar''el cries *My Elohim (God), we know thee* (Hosea 8:2) while it *hath cast off the thing that is good* (8:3) — the exact empty profession John exposes: *He that saith, I know him, and keepeth not his commandments, is a liar*. To know Yahuah and trespass his Torah is the lie this chapter is built to break.'),

    -- THREAD 2 (★): They set up kings, but not by me
    ('canon','hosea',8,4,'canon','1-samuel',8,5,'free',
      E'*And said unto him, Behold, thou art old, and thy sons walk not in thy ways: now make us a king to judge us like all the nations* (1 Samuel 8:5). *They have set up kings, but not by me* (Hosea 8:4) reaches back to this first demand — *make us a king... like all the nations* — the people choosing a throne Yahuah did not raise.'),
    ('canon','hosea',8,4,'canon','1-samuel',8,7,'free',
      E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). When Hosea charges *They have set up kings, but not by me* (Hosea 8:4), it is the same rejection Yahuah named at the first: *they have rejected me, that I should not reign over them*. Kings raised without him are the throne set against his reign.'),

    -- THREAD 3 (★★): The calf of Samaria — it is not Elohim
    ('canon','hosea',8,5,'canon','exodus',32,4,'extras',
      E'*And he received them at their hand, and fashioned it with a graving tool, after he had made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4). *Thy calf, O Samaria* (Hosea 8:5) is Horeb repeated — the *molten calf* the workman fashioned, hailed as *thy gods*. Samaria''s calf is the ancient idol set up again in the northern house.'),
    ('canon','hosea',8,6,'canon','psalms',106,19,'extras',
      E'*They made a calf in Horeb, and worshipped the molten image* (Psalm 106:19). The Psalm sings the very sin Hosea names: *the workman made it; therefore it is not Elohim (God)* (Hosea 8:6) — *They made a calf in Horeb, and worshipped the molten image*. The made-thing, fashioned by hands, was never Elohim.'),
    ('canon','hosea',8,6,'canon','psalms',106,20,'extras',
      E'*Thus they changed their glory into the similitude of an ox that eateth grass* (Psalm 106:20). *The calf of Samaria shall be broken in pieces* (Hosea 8:6) because it is exactly this exchange — *they changed their glory into the similitude of an ox that eateth grass*. They traded the living Glory for a grass-eating image; *therefore it is not Elohim (God)*.'),
    ('canon','hosea',8,6,'canon','acts',7,41,'extras',
      E'*And they made a calf in those days, and offered sacrifice unto the idol, and rejoiced in the works of their own hands* (Acts 7:41). Stephen names the calf for what Hosea names it — *the workman made it; therefore it is not Elohim (God)* (Hosea 8:6) — *they made a calf... and rejoiced in the works of their own hands*. The hand that made it cannot have made a god.'),
    ('canon','hosea',8,6,'apocrypha','the-wisdom-of-solomon',13,10,'extras',
      E'*But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand* (Wisdom of Solomon 13:10). The restored witness states Hosea''s verdict outright: *the workman made it; therefore it is not Elohim (God)* (Hosea 8:6) — those *who call them gods, which are the works of men''s hands*. The calf of silver and gold, a *resemblance of beasts*, is dead hope.'),
    ('canon','hosea',8,6,'apocrypha','the-wisdom-of-solomon',14,8,'extras',
      E'*But that which is made with hands is cursed, as well it, as he that made it: he, because he made it; and it, because, being corruptible, it was called god* (Wisdom of Solomon 14:8). This is *the workman made it; therefore it is not Elohim (God)* (Hosea 8:6) carried to its judgment — *that which is made with hands is cursed... being corruptible, it was called god*. The Formless Source is not fashioned; the corruptible calf the workman made is no Elohim and *shall be broken in pieces*.'),

    -- THREAD 4 (★★): Sown the wind, reap the whirlwind
    ('canon','hosea',8,7,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Hosea''s harvest-law — *they have sown the wind, and they shall reap the whirlwind* (Hosea 8:7) — is the law Paul restates whole: *whatsoever a man soweth, that shall he also reap*. Wind sown returns as whirlwind; the seed and the harvest answer each other.'),
    ('canon','hosea',8,7,'canon','galatians',6,8,'free',
      E'*For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8). *They have sown the wind, and they shall reap the whirlwind: it hath no stalk; the bud shall yield no meal* (Hosea 8:7) is sowing to the flesh — the barren harvest of corruption: *he that soweth to his flesh shall of the flesh reap corruption*.'),
    ('canon','hosea',8,7,'canon','job',4,8,'free',
      E'*Even as I have seen, they that plow iniquity, and sow wickedness, reap the same* (Job 4:8). The same measure runs through the wisdom of Job: *they have sown the wind, and they shall reap the whirlwind* (Hosea 8:7) — *they that plow iniquity, and sow wickedness, reap the same*.'),
    ('canon','hosea',8,7,'canon','proverbs',22,8,'free',
      E'*He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). Proverbs frames Hosea''s whirlwind exactly: *they have sown the wind, and they shall reap the whirlwind* (Hosea 8:7) — *He that soweth iniquity shall reap vanity*. The empty harvest, *the bud shall yield no meal*, is iniquity''s own wage.'),

    -- THREAD 5 (★): Yashar'el swallowed up among the nations (scattered, not cast off)
    ('canon','hosea',8,8,'canon','ezekiel',37,19,'free',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). *Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles* (Hosea 8:8) is the scattering of the northern house — Joseph/Ephraim — that Ezekiel promises to gather: *the stick of Joseph, which is in the hand of Ephraim... make them one stick*. Swallowed up to be regathered, not lost.'),
    ('canon','hosea',8,8,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The Ephraim *swallowed up... among the Gentiles* (Hosea 8:8) is the divorced northern kingdom — made whole again with Yahudah: *they shall be no more two nations*. The two houses become one.'),
    ('canon','hosea',8,9,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Though *Ephraim hath hired lovers* (Hosea 8:9) and is swallowed among the nations, Paul guards the verdict: *Hath Elohim (God) cast away his people? Elohim (God) forbid*. Scattered for sin, never cast off.'),
    ('canon','hosea',8,9,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The Ephraim *gone up to Assyria* and *among the Gentiles* (Hosea 8:8-9) is the *blindness in part* with a set end — *until the fulness of the Gentiles be come in*. The dispersion among the nations is the very field of the regathering.'),

    -- THREAD 6 (★★): The great things of my Torah counted a strange thing — forgotten his Maker
    ('canon','hosea',8,14,'canon','deuteronomy',32,18,'free',
      E'*Of the Rock that begat thee thou art unmindful, and hast forgotten Elohim (God) that formed thee* (Deuteronomy 32:18). *Yashar''el (Israel) hath forgotten his Maker* (Hosea 8:14) is the Song of Moses come true — *the Rock that begat thee thou art unmindful, and hast forgotten Elohim (God) that formed thee*. To count the Torah *a strange thing* (8:12) is to forget the One who formed them.'),
    ('canon','hosea',8,14,'canon','romans',1,21,'free',
      E'*Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened* (Romans 1:21). *Yashar''el (Israel) hath forgotten his Maker* (Hosea 8:14) is the darkening Paul traces: *when they knew Elohim (God), they glorified him not... their foolish heart was darkened*. Forgetting the Maker and counting his Torah strange are one fall.'),
    ('canon','hosea',8,14,'canon','romans',1,25,'free',
      E'*Who changed the truth of Elohim (God) into a lie, and worshipped and served the creature more than the Creator, who is blessed for ever. Amen* (Romans 1:25). They *forgotten his Maker* (Hosea 8:14) and built temples to the made-thing — the exchange Paul names: *worshipped and served the creature more than the Creator*. The calf and the forgotten Torah meet here: the Creator traded for the creature.'),
    ('canon','hosea',8,12,'apocrypha','baruch-with-the-letter-of-jeremiah',4,1,'extras',
      E'*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). The Torah Yashar''el *counted as a strange thing* (Hosea 8:12) is *the book of the commandments of Yahuah (God), and the law that endureth for ever* — life to those who keep it, death to those who leave it. The despised written word is the enduring covenant itself.'),
    ('canon','hosea',8,12,'apocrypha','ecclesiasticus',24,23,'extras',
      E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23). *I have written to him the great things of my law, but they were counted as a strange thing* (Hosea 8:12) — yet that written law is *the book of the covenant of the most high Yahuah (God)... an heritage to the congregations of Jacob*. They counted their own inheritance foreign.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-trespassed-against-my-torah-the-eagle-comes',
       E'Trespassed against my Torah — the eagle comes, the Torah affirmed',
       E'The chapter opens with the trumpet and the judgment, and names its cause without flinching: *Set the trumpet to thy mouth. He shall come as an eagle against the house of Yahuah (LORD), because they have transgressed my covenant, and trespassed against my law* (Hosea 8:1). The Torah is not the curse here — it is the STANDARD they are tried by, and the eagle is the covenant-curse nation Moses long foretold: *Yahuah (LORD) shall bring a nation against thee from far, from the end of the earth, as swift as the eagle flieth; a nation whose tongue thou shalt not understand* (Deuteronomy 28:49). Daniel makes the same confession plain centuries later: *all Yashar''el (Israel) have transgressed thy law, even by departing, that they might not obey thy voice; therefore the curse is poured upon us, and the oath that is written in the law of Moses the servant of Elohim (God), because we have sinned against him* (Daniel 9:11) — the curse is the written penalty for breaking the Torah, NEVER the Torah itself. And against the hollow cry *Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee* (8:2) while *Yashar''el (Israel) hath cast off the thing that is good* (8:3) stands the unbreakable filter: *He that saith, I know him, and keepeth not his commandments, is a liar, and the truth is not in him* (1 John 2:4). To claim to know Yahuah while trespassing his Torah is the lie this whole lawsuit is brought to expose.',
       sv.verse_id, ev.verse_id, 'free', 44875
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-they-set-up-kings-but-not-by-me',
       E'They have set up kings, but not by me — the old rejection',
       E'*They have set up kings, but not by me: they have made princes, and I knew it not* (Hosea 8:4). The northern house enthrones men Yahuah did not raise — the same wound opened at the first demand for a monarchy: *make us a king to judge us like all the nations* (1 Samuel 8:5). Yahuah''s verdict then was the verdict now: *Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). A throne *set up... but not by me* is a throne set against his reign — and from the same self-will *of their silver and their gold have they made them idols* (8:4), the road that runs straight to the calf of Samaria.',
       sv.verse_id, ev.verse_id, 'free', 44878
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-the-calf-of-samaria-it-is-not-elohim',
       E'The calf of Samaria — the workman made it, therefore it is not Elohim',
       E'*Thy calf, O Samaria, hath cast thee off; mine anger is kindled against them... For from Yashar''el (Israel) was it also: the workman made it; therefore it is not Elohim (God): but the calf of Samaria shall be broken in pieces* (Hosea 8:5-6). Jeroboam''s golden calf is Horeb set up again: *he... fashioned it with a graving tool, after he had made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel)* (Exodus 32:4); *They made a calf in Horeb, and worshipped the molten image. Thus they changed their glory into the similitude of an ox that eateth grass* (Psalm 106:19-20). Stephen names it the same: *they made a calf in those days, and offered sacrifice unto the idol, and rejoiced in the works of their own hands* (Acts 7:41). And the restored wisdom-witness states Hosea''s verdict outright: *in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver... and resemblances of beasts* (Wisdom of Solomon 13:10); *that which is made with hands is cursed... being corruptible, it was called god* (Wisdom of Solomon 14:8). This is the Formed and the Formless: Yahuah is the Source, not a thing fashioned by hands. The hand that graved the calf cannot have graved a god — *the workman made it; therefore it is not Elohim (God)* — and what man made, man''s judgment breaks: *the calf of Samaria shall be broken in pieces*.',
       sv.verse_id, ev.verse_id, 'extras', 44881
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind',
       E'They have sown the wind, and they shall reap the whirlwind',
       E'*For they have sown the wind, and they shall reap the whirlwind: it hath no stalk; the bud shall yield no meal: if so be it yield, the strangers shall swallow it up* (Hosea 8:7). The harvest answers the seed — wind sown returns as whirlwind, and the crop is barren. Paul states the same law whole: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap. For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:7-8) — Samaria sowed to the flesh, and reaped corruption with no meal in the bud. The wisdom tradition saw it long before: *they that plow iniquity, and sow wickedness, reap the same* (Job 4:8); *He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). What is sown is always what is reaped, pressed down and returned.',
       sv.verse_id, ev.verse_id, 'free', 44884
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-yasharel-swallowed-up-among-the-nations',
       E'Yashar''el swallowed up among the nations — scattered, not cast off',
       E'*Yashar''el (Israel) is swallowed up: now shall they be among the Gentiles as a vessel wherein is no pleasure. For they are gone up to Assyria, a wild ass alone by himself: Ephraim hath hired lovers* (Hosea 8:8-9). This is the divorced northern house — Joseph, Ephraim — scattered into the nations through Assyria. But the very next word turns toward home: *now will I gather them* (8:10). Ezekiel names the gathering by name: *I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows... and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19); *they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the two houses made one. And Paul stands guard against every cast-off reading: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26). Ephraim swallowed *among the Gentiles* is not lost in them — the dispersion is the very field of the regathering. Victims scattered for covenant-breaking, never enemies cast away.',
       sv.verse_id, ev.verse_id, 'free', 44887
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-8-the-great-things-of-my-torah-counted-a-strange-thing',
       E'The great things of my Torah counted a strange thing — forgotten his Maker',
       E'Here is the anti-antinomian keystone of the chapter: *I have written to him the great things of my law, but they were counted as a strange thing* (Hosea 8:12). The WRITTEN Torah — Yahuah''s own hand to his people — despised as foreign, treated as something alien. And the root of that contempt is named: *For Yashar''el (Israel) hath forgotten his Maker* (8:14). The Song of Moses had warned of this exact forgetting: *Of the Rock that begat thee thou art unmindful, and hast forgotten Elohim (God) that formed thee* (Deuteronomy 32:18). Paul traces the same darkening: *when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened* (Romans 1:21), and *worshipped and served the creature more than the Creator* (Romans 1:25) — the calf and the forgotten Torah are one fall, the Creator traded for the made-thing. Yet the Torah they counted strange is no foreign thing at all — it is their own inheritance and their life: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1); *the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23). They counted their birthright a stranger — and so *they shall return to Egypt* (8:13), the exodus run backward, the fruit of forgetting the One who formed them.',
       sv.verse_id, ev.verse_id, 'extras', 44890
  FROM _s328_hos08_lookup sv, _s328_hos08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=8 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) shall bring a nation against thee from far... as swift as the eagle flieth* (Deuteronomy 28:49) — the eagle of Hosea 8:1 is Moses'' covenant-curse nation; judgment BECAUSE the Torah was trespassed.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=49
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-trespassed-against-my-torah-the-eagle-comes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *all Yashar''el (Israel) have transgressed thy law... therefore the curse is poured upon us* (Daniel 9:11) — Hosea''s charge made plain; the Torah affirmed, the curse the penalty for breaking it, not the Torah itself.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-trespassed-against-my-torah-the-eagle-comes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He that saith, I know him, and keepeth not his commandments, is a liar* (1 John 2:4) — the empty *we know thee* of Hosea 8:2 while casting off the good; the filter that exposes profession without obedience.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=2
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-trespassed-against-my-torah-the-eagle-comes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *make us a king to judge us like all the nations* (1 Samuel 8:5) — the first demand for a throne Yahuah did not raise; the wound Hosea 8:4''s *kings, but not by me* reopens.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=4
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-set-up-kings-but-not-by-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — kings set up *but not by me* (Hosea 8:4) are a throne against Yahuah''s reign.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=4
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-set-up-kings-but-not-by-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he... made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel)* (Exodus 32:4) — Samaria''s calf (Hosea 8:5) is Horeb set up again, the molten calf the workman fashioned.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*They made a calf in Horeb, and worshipped the molten image* (Psalm 106:19) — the made image was never Elohim; *the workman made it; therefore it is not Elohim (God)* (Hosea 8:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they changed their glory into the similitude of an ox that eateth grass* (Psalm 106:20) — the living Glory traded for a grass-eating image; *therefore it is not Elohim (God)* (Hosea 8:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *they made a calf... and rejoiced in the works of their own hands* (Acts 7:41) — Stephen names the calf for what it is; the hand that made it cannot have made a god (Hosea 8:6).'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *in dead things is their hope, who call them gods, which are the works of men''s hands* (Wisdom of Solomon 13:10) — the restored witness states Hosea 8:6 outright: the calf of silver and gold is dead hope.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *that which is made with hands is cursed... being corruptible, it was called god* (Wisdom of Solomon 14:8) — Hosea 8:6 to its judgment; the corruptible calf is no Elohim and shall be broken in pieces.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-calf-of-samaria-it-is-not-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the harvest-law of Hosea 8:7; wind sown returns as whirlwind.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he that soweth to his flesh shall of the flesh reap corruption* (Galatians 6:8) — the barren bud that yields no meal (Hosea 8:7) is the harvest of sowing to the flesh.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they that plow iniquity, and sow wickedness, reap the same* (Job 4:8) — the same measure as Hosea 8:7''s sown wind and reaped whirlwind.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He that soweth iniquity shall reap vanity* (Proverbs 22:8) — the empty harvest of Hosea 8:7, iniquity''s own wage.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-they-have-sown-the-wind-and-shall-reap-the-whirlwind'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will take the stick of Joseph, which is in the hand of Ephraim... and make them one stick* (Ezekiel 37:19) — the Ephraim swallowed up (Hosea 8:8) is the northern house to be regathered into one.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-yasharel-swallowed-up-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22) — the divorced northern kingdom (Hosea 8:8) made one again with Yahudah.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-yasharel-swallowed-up-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — though Ephraim hired lovers (Hosea 8:9), scattered for sin is never cast off.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=9
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-yasharel-swallowed-up-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — Ephraim among the Gentiles (Hosea 8:8-9) is the very field of the regathering, not lost in them.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=9
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-yasharel-swallowed-up-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the Rock that begat thee thou art unmindful, and hast forgotten Elohim (God) that formed thee* (Deuteronomy 32:18) — *Yashar''el hath forgotten his Maker* (Hosea 8:14); the Song of Moses come true.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-great-things-of-my-torah-counted-a-strange-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they glorified him not as Elohim (God)... their foolish heart was darkened* (Romans 1:21) — forgetting the Maker (Hosea 8:14) and counting his Torah strange (8:12) are one darkening.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-great-things-of-my-torah-counted-a-strange-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *worshipped and served the creature more than the Creator* (Romans 1:25) — the calf and the forgotten Torah (Hosea 8:14) meet here: the Creator traded for the made-thing.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-great-things-of-my-torah-counted-a-strange-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life* (Baruch 4:1) — the Torah counted a strange thing (Hosea 8:12) is the enduring covenant, life to those who keep it.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-great-things-of-my-torah-counted-a-strange-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the law which Moses commanded for an heritage to the congregations of Jacob* (Ecclesiasticus 24:23) — the written Torah of Hosea 8:12 is their own inheritance, counted foreign.'
  FROM cross_reference_threads t
  JOIN _s328_hos08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s328_hos08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-8-the-great-things-of-my-torah-counted-a-strange-thing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_9.sql (Hosea 9) -----
-- Chapter: Hosea 9 — THE DAYS OF VISITATION; the despised prophet; Ephraim's glory fly away; cast
-- away because they did not hearken. The covenant-lawsuit on the northern house Ephraim, on the eve
-- of the Assyrian exile. *Rejoice not, O Yashar'el (Israel)... for thou hast gone a whoring from thy
-- Elohim (God)* (9:1); exile strips the land and clean worship — *Ephraim shall return to Egypt, and
-- they shall eat unclean things in Assyria* (9:3) — so that *What will ye do in the solemn day, and
-- in the day of the feast of Yahuah (LORD)?* (9:5) — the feasts are not abolished but unkeepable in
-- exile. ★★ *The days of visitation are come, the days of recompence are come* (9:7) reaches forward
-- to *the time of thy visitation* (Luke 19:44) and *the day of visitation* (1 Peter 2:12). ★★ *I found
-- Yashar'el (Israel) like grapes in the wilderness... but they went to Baal-peor... and their
-- abominations were according as they loved* (9:10) — the firstfruits delight turned to the shame of
-- Numbers 25; you become what you worship (Psalm 115:8). ★ *their glory shall fly away like a bird...
-- their root is dried up, they shall bear no fruit* (9:11,16) — the fruitless tree (Matthew 3:10),
-- Ichabod (1 Samuel 4:21). ★★ *My Elohim (God) will cast them away... and they shall be wanderers
-- among the nations* (9:17) — the two-house dispersion, UNDER THE ROMANS 11:1-2 GUARD: a season, not
-- a final rejection, reversed by the regathering of Hosea 1:10-11 / Romans 11:25-26.
-- Tag: hos09   Temp view: _s328_hos09_lookup
-- Sort band: base 44900, step 3 -> threads at 44900, 44903, 44906, 44909, 44912 (5 threads)
-- Source of EVERY row: 'canon','hosea',9,v
--
-- Hosea 9 coverage:
--   v.1 (Rejoice not, O Yashar'el... thou hast gone a whoring from thy Elohim)
--        NT:     none warranted (the whoredom/lawsuit frame carried in prose; cf. THREAD 3 Baal-peor)
--        Extras: none warranted
--        Tanakh: woven into THREAD 3 (the whoring after other gods; Jeremiah 2 espousals reversed)
--   v.2-3 (the floor shall not feed them... Ephraim shall return to Egypt, eat unclean things in Assyria)
--        NT:     none warranted (loss-of-land judgment; preface to feast-loss THREAD 1 and dispersion THREAD 5)
--        Extras: none warranted
--        Tanakh: held in prose — the unclean food of exile sets up THREAD 1 (worship cut off) + THREAD 5
--   ★ v.4-5 (their bread... shall not come into the house of Yahuah... What will ye do in the solemn
--          day, and in the day of the feast of Yahuah?)
--        NT:     none warranted (the feasts STAND; the loss is exile's, not abolition's)
--        Extras: none warranted
--        Tanakh: ★ Leviticus 23:2, 23:4 (the feasts of Yahuah... holy convocations), ★ Deuteronomy
--                16:16 (three times in a year... the feast of unleavened bread, weeks, tabernacles) — THREAD 1
--   ★★ v.7 (The days of visitation are come, the days of recompence are come; Yashar'el shall know it:
--          the prophet is a fool, the spiritual man is mad)
--        NT:     ★★ Luke 19:44 (because thou knewest not the time of thy visitation), ★★ 1 Peter 2:12
--                (glorify Elohim in the day of visitation) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 10:3 (what will ye do in the day of visitation... where will ye leave your
--                glory?) — THREAD 2 (the same visitation-question, the glory left behind)
--   v.8-9 (the watchman of Ephraim... they have deeply corrupted themselves, as in the days of Gibeah)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: the Gibeah corruption (Judges 19-20) named in prose; held with v.7 / v.9 visit-clause
--   ★★ v.10 (I found Yashar'el like grapes in the wilderness... but they went to Baal-peor, and
--          separated themselves unto that shame; and their abominations were according as they loved)
--        NT:     none warranted distinct (the become-what-you-love principle weaves forward in prose)
--        Extras: none warranted as MEMBER (1 Macc 2:54 Phinehas-zeal is the COUNTER-witness; named in
--                prose, but the clean MEMBER witnesses are canon Numbers 25 / Psalm 106)
--        Tanakh: ★★ Numbers 25:1-3 (Yashar'el joined himself unto Baal-peor), ★ Psalm 106:28 (they
--                joined themselves also unto Baal-peor, and ate the sacrifices of the dead), ★ Jeremiah
--                2:2-3 (the firstfruits of his increase; the love of thine espousals), ★ Deuteronomy
--                32:10 (he found him in a desert land... kept him as the apple of his eye), ★ Psalm
--                115:8 (they that make them are like unto them) — THREAD 3
--   ★ v.11-16 (their glory shall fly away like a bird... Ephraim is smitten, their root is dried up,
--          they shall bear no fruit)
--        NT:     ★ Matthew 3:10 (every tree which bringeth not forth good fruit is hewn down), ★ Matthew
--                7:19 (every tree that bringeth not forth good fruit), ★ John 15:2 (every branch... that
--                beareth not fruit he taketh away), ★ John 15:6 (cast forth as a branch, and is
--                withered) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ 1 Samuel 4:21 (the glory is departed from Yashar'el — Ichabod) — THREAD 4 (the
--                glory flown away)
--   ★★ v.17 (My Elohim will cast them away, because they did not hearken unto him: and they shall be
--          wanderers among the nations)
--        NT:     ★★ Romans 11:1 (Hath Elohim cast away his people? Elohim forbid), ★★ Romans 11:25 (so
--                all Yashar'el shall be saved) — THREAD 5 (THE ROMANS 11 GUARD — temporary, not final)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 28:64 (Yahuah shall scatter thee among all people), ★ Amos 9:9 (I will
--                sift the house of Yashar'el among all nations... yet shall not the least grain fall),
--                ★★ Hosea 1:10 (in the place where it was said... Ye are not my people, there it shall
--                be said... Ye are the sons of the living Elohim) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. hosea-9-what-will-ye-do-in-the-feast-of-yahuah — Tanakh (Leviticus 23, Deuteronomy 16) [free]
--      (★ the feasts named — lost through EXILE, not abolished; Leviticus 23 / Deuteronomy 16 stand)
--   2. hosea-9-the-days-of-visitation-the-despised-prophet — NT (Luke 19, 1 Peter 2) + Tanakh (Isaiah 10) [free]
--      (★★ the days of visitation/recompence; the time of thy visitation; the day of visitation)
--   3. hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor — Tanakh (Numbers 25, Psalm 106,
--      Jeremiah 2, Deuteronomy 32, Psalm 115) [free]
--      (★★ the firstfruits delight turned to Baal-peor's shame; you become what you love/worship)
--   4. hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit — NT (Matthew 3, Matthew 7, John 15)
--      + Tanakh (1 Samuel 4) [free]
--      (★ the fruitless tree hewn down / branch that beareth not fruit; Ichabod, the glory departed)
--   5. hosea-9-cast-away-wanderers-among-the-nations — NT (Romans 11) + Tanakh (Deuteronomy 28, Amos 9,
--      Hosea 1) [free]
--      (★★ the two-house dispersion UNDER THE ROMANS 11:1-2 GUARD — a season, reversed by the regathering)
--
-- Framing notes:
--   ★ THE FEAST QUESTION (THREAD 1): *What will ye do in the solemn day, and in the day of the feast of
--      Yahuah (LORD)?* (9:5). In exile, with *their bread for their soul shall not come into the house
--      of Yahuah (LORD)* (9:4), Ephraim cannot keep the appointed times rightly. This is LOSS THROUGH
--      EXILE, NOT abolition — the feasts of Yahuah still stand: *Concerning the feasts of Yahuah (LORD),
--      which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2);
--      *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God)... in
--      the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles*
--      (Deuteronomy 16:16). The grief of Hosea 9:5 is that the people have CUT THEMSELVES OFF from the
--      calendar that is still Yahuah's — never that the calendar was ended.
--   ★★ THE DAYS OF VISITATION (THREAD 2): *The days of visitation are come, the days of recompence are
--      come; Yashar'el (Israel) shall know it: the prophet is a fool, the spiritual man is mad* (9:7).
--      Isaiah asks the same question Hosea asks: *And what will ye do in the day of visitation, and in
--      the desolation which shall come from far?... where will ye leave your glory?* (Isaiah 10:3) — the
--      glory left behind is Hosea's glory that flies away (9:11). Yahusha weeps the same word over the
--      city: *thou knewest not the time of thy visitation* (Luke 19:44). And Peter turns it toward hope:
--      *they may by your good works, which they shall behold, glorify Elohim (God) in the day of
--      visitation* (1 Peter 2:12). The despised-prophet line (the prophet counted a fool) is the
--      covenant-lawsuit verdict on a people who would not hear the watchman.
--   ★★ GRAPES IN THE WILDERNESS / BAAL-PEOR (THREAD 3): *I found Yashar'el (Israel) like grapes in the
--      wilderness... but they went to Baal-peor, and separated themselves unto that shame; and their
--      abominations were according as they loved* (9:10). The wilderness delight is the espousal Jeremiah
--      remembers: *the love of thine espousals, when thou wentest after me in the wilderness... Yashar'el
--      (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (Jeremiah 2:2-3);
--      Yahuah *kept him as the apple of his eye* (Deuteronomy 32:10). But at Baal-peor the firstfruits
--      defiled themselves: *Yashar'el (Israel) joined himself unto Baal-peor* (Numbers 25:3); *they
--      joined themselves also unto Baal-peor, and ate the sacrifices of the dead* (Psalm 106:28). And
--      the law of worship is exact — *their abominations were according as they loved* — you become what
--      you bow to: *They that make them are like unto them; so is every one that trusteth in them* (Psalm
--      115:8). (The clean counter-witness is Phinehas, whose zeal turned the plague — *Phinees our father
--      in being zealous and fervent obtained the covenant of an everlasting priesthood*, 1 Maccabees
--      2:54 — named here, not threaded, the canon Numbers 25 / Psalm 106 carrying the member weight.)
--   ★ THE GLORY FLOWN AWAY / NO FRUIT (THREAD 4): *As for Ephraim, their glory shall fly away like a
--      bird* (9:11); *Ephraim is smitten, their root is dried up, they shall bear no fruit* (9:16). The
--      dried root that bears no fruit is the tree the Messiah's herald warns of: *the axe is laid unto
--      the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down*
--      (Matthew 3:10); *Every tree that bringeth not forth good fruit is hewn down, and cast into the
--      fire* (Matthew 7:19). Yahusha makes it the vine and the branch: *Every branch in me that beareth
--      not fruit he taketh away* (John 15:2); *If a man abide not in me, he is cast forth as a branch,
--      and is withered* (John 15:6). And the glory that flies away is Ichabod: *The glory is departed
--      from Yashar'el (Israel): because the ark of Elohim (God) was taken* (1 Samuel 4:21).
--   ★★ CAST AWAY — THE ROMANS 11 GUARD (THREAD 5): *My Elohim (God) will cast them away, because they
--      did not hearken unto him: and they shall be wanderers among the nations* (9:17). This is the
--      Deuteronomy 28 scattering — *Yahuah (LORD) shall scatter thee among all people, from the one end
--      of the earth even unto the other* (Deuteronomy 28:64) — the two-house dispersion of the northern
--      kingdom. BUT IT IS A SEASON, NOT A FINAL REJECTION. Amos puts the limit on it: *I will sift the
--      house of Yashar'el (Israel) among all nations... yet shall not the least grain fall upon the
--      earth* (Amos 9:9) — sifted, scattered, but not one grain lost. And Hosea himself reverses it:
--      *in the place where it was said unto them, Ye are not my people, there it shall be said unto them,
--      Ye are the sons of the living Elohim (God)* (Hosea 1:10). Paul seals the guard: *Hath Elohim (God)
--      cast away his people? Elohim (God) forbid* (Romans 11:1); *blindness in part is happened to
--      Yashar'el (Israel), until the fulness of the Gentiles be come in. And so all Yashar'el (Israel)
--      shall be saved* (Romans 11:25-26). The wanderers are the lost sheep to be gathered, NEVER the
--      cast-off; victims of the lawsuit, not enemies.
--   VERSES WITH NO SEPARATE ADD: v.1 (the whoring — woven into THREAD 3's Jeremiah-2 espousals reversed),
--      v.2-3 (the unclean food of exile — preface to THREADS 1 and 5), v.6 (Egypt/Memphis bury them —
--      held with the dispersion of THREAD 5), v.8-9 (the watchman, the days of Gibeah — Judges 19-20
--      named in prose, the corruption-verdict held with v.7's visitation), v.12-15 (the bereaving womb,
--      Gilgal's wickedness, driven out of mine house — the lawsuit-judgment woven into THREAD 4's
--      no-fruit and THREAD 5's casting-away). All recorded; none silently skipped.

CREATE TEMP VIEW _s328_hos09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): What will ye do in the feast of Yahuah — the feasts lost through EXILE, not abolished
    ('canon','hosea',9,5,'canon','leviticus',23,2,'free',
      E'*Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). When Hosea grieves *What will ye do in the solemn day, and in the day of the feast of Yahuah (LORD)?* (Hosea 9:5), the lament is that exile has cut Ephraim off from a calendar that still stands. The feasts are not ended — they are *my feasts*, the holy convocations of Yahuah; the loss is the people''s, never the calendar''s.'),
    ('canon','hosea',9,5,'canon','leviticus',23,4,'free',
      E'*These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons* (Leviticus 23:4). The *day of the feast of Yahuah (LORD)* Hosea names (9:5) is one of these appointed seasons — proclaimed forever in their times. In exile, eating *unclean things in Assyria* (9:3), Ephraim cannot keep them rightly; the appointed times abide, the keeping is what is broken.'),
    ('canon','hosea',9,5,'canon','deuteronomy',16,16,'free',
      E'*Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles: and they shall not appear before Yahuah (LORD) empty* (Deuteronomy 16:16). This is the pilgrimage Hosea''s exiles can no longer make — *What will ye do in the solemn day* (9:5)? Driven from *the LORD''S land* (9:3), they cannot appear before Yahuah in the place He chose. The command stands; the scattered cannot reach it.'),

    -- THREAD 2 (★★): The days of visitation — the despised prophet
    ('canon','hosea',9,7,'canon','isaiah',10,3,'free',
      E'*And what will ye do in the day of visitation, and in the desolation which shall come from far? to whom will ye flee for help? and where will ye leave your glory?* (Isaiah 10:3). Isaiah asks the very question Hosea answers — *The days of visitation are come, the days of recompence are come* (Hosea 9:7). And the glory Isaiah says they must leave is the glory Hosea says *shall fly away like a bird* (9:11): the day of visitation strips the unfaithful of the very glory they would not steward.'),
    ('canon','hosea',9,7,'canon','luke',19,44,'free',
      E'*And shall lay thee even with the ground, and thy children within thee; and they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44). Yahusha weeps over the city with Hosea''s own word — *the days of visitation are come... Yashar''el (Israel) shall know it* (Hosea 9:7). The visitation that fell on Ephraim falls again on a people who *knewest not the time*; the despised prophet wept where he was not received.'),
    ('canon','hosea',9,7,'canon','1-peter',2,12,'free',
      E'*Having your conversation honest among the Gentiles: that, whereas they speak against you as evildoers, they may by your good works, which they shall behold, glorify Elohim (God) in the day of visitation* (1 Peter 2:12). Peter takes Hosea''s *days of visitation* (9:7) and turns its other face toward hope: the same visitation that is recompence to the unfaithful is the day the watching nations *glorify Elohim (God)* in those who walk uprightly. The day comes for all; what it brings is according to the heart it finds.'),

    -- THREAD 3 (★★): Grapes in the wilderness — but they went to Baal-peor (become what you love)
    ('canon','hosea',9,10,'canon','numbers',25,1,'free',
      E'*And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1). This is the Baal-peor Hosea names — *they went to Baal-peor, and separated themselves unto that shame* (Hosea 9:10). The wilderness delight Yahuah found *like grapes* (9:10) gave itself to whoredom at the very threshold of the land; the firstfruits defiled themselves before the harvest.'),
    ('canon','hosea',9,10,'canon','numbers',25,3,'free',
      E'*And Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled against Yashar''el (Israel)* (Numbers 25:3). Hosea points straight back: *they went to Baal-peor, and separated themselves unto that shame; and their abominations were according as they loved* (9:10). The joining of Numbers 25 IS the shame of Hosea 9 — and what they loved, they became.'),
    ('canon','hosea',9,10,'canon','psalms',106,28,'free',
      E'*They joined themselves also unto Baal-peor, and ate the sacrifices of the dead* (Psalm 106:28). The Psalm sings the history Hosea preaches — *they went to Baal-peor, and separated themselves unto that shame* (9:10). To eat *the sacrifices of the dead* is the abomination *according as they loved*; the bread of idols, not the bread of the house of Yahuah (9:4).'),
    ('canon','hosea',9,10,'canon','jeremiah',2,3,'free',
      E'*Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase: all that devour him shall offend; evil shall come upon them, saith Yahuah (LORD)* (Jeremiah 2:3). Hosea''s *grapes in the wilderness... the firstripe in the fig tree at her first time* (9:10) is Jeremiah''s *firstfruits of his increase* — the wilderness espousal, *the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2). The delight was real; the betrayal at Baal-peor is the more bitter for it.'),
    ('canon','hosea',9,10,'canon','deuteronomy',32,10,'free',
      E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). The Song of Moses tells the same finding Hosea tells — *I found Yashar''el (Israel) like grapes in the wilderness* (9:10). Yahuah found him in the waste and *kept him as the apple of his eye*; the going to Baal-peor is the spurning of that keeping.'),
    ('canon','hosea',9,10,'canon','psalms',115,8,'free',
      E'*They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Hosea states the law of worship — *their abominations were according as they loved* (9:10) — and the Psalm states its mechanism: you become like what you bow to. They loved Baal-peor''s shame, and were made into its likeness; what a people worships, it is conformed to.'),

    -- THREAD 4 (★): Their glory shall fly away — they shall bear no fruit (the fruitless tree, Ichabod)
    ('canon','hosea',9,16,'canon','matthew',3,10,'free',
      E'*And now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10). Hosea''s *Ephraim is smitten, their root is dried up, they shall bear no fruit* (9:16) is the very tree the Messiah''s herald warns of: the axe at the root, the fruitless tree hewn down. The dried root and the laid axe are one judgment across the testimony.'),
    ('canon','hosea',9,16,'canon','matthew',7,19,'free',
      E'*Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 7:19). The fruitlessness Hosea pronounces on Ephraim — *they shall bear no fruit* (9:16) — is the test Yahusha sets for every tree. The standard does not change: a root dried up, a tree that bears no fruit, comes to the fire.'),
    ('canon','hosea',9,16,'canon','john',15,2,'free',
      E'*Every branch in me that beareth not fruit he taketh away: and every branch that beareth fruit, he purgeth it, that it may bring forth more fruit* (John 15:2). Ephraim''s glory that *shall fly away like a bird* and the root *dried up* that *shall bear no fruit* (9:11,16) is the branch *that beareth not fruit* the Husbandman *taketh away*. The vine''s law and the prophet''s lawsuit are the same: no fruit, no abiding.'),
    ('canon','hosea',9,11,'canon','1-samuel',4,21,'free',
      E'*And she named the child I-chabod, saying, The glory is departed from Yashar''el (Israel): because the ark of Elohim (God) was taken* (1 Samuel 4:21). Hosea''s *their glory shall fly away like a bird* (9:11) is Ichabod spoken over Ephraim — *the glory is departed from Yashar''el (Israel)*. When the people forsook Him, the glory took wing; the name Ichabod is written over the whole northern house.'),

    -- THREAD 5 (★★): Cast away — wanderers among the nations (THE ROMANS 11 GUARD)
    ('canon','hosea',9,17,'canon','deuteronomy',28,64,'free',
      E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone* (Deuteronomy 28:64). Hosea''s *they shall be wanderers among the nations* (9:17) is this Deuteronomy scattering come to pass — the covenant-curse for not hearkening, *scattered... among all people*. The wandering of the northern house is the exile Moses foretold.'),
    ('canon','hosea',9,17,'canon','amos',9,9,'free',
      E'*For, lo, I will command, and I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth* (Amos 9:9). Amos sets the GUARD on Hosea''s casting-away — *they shall be wanderers among the nations* (9:17) — they are sifted *among all nations*, BUT *not the least grain* is lost. The dispersion is a sieve, not a grave; every grain is kept for the gathering.'),
    ('canon','hosea',9,17,'canon','hosea',1,10,'free',
      E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Hosea himself reverses the casting-away of 9:17: the very *Lo-Ammi* — *not my people* — becomes *the sons of the living Elohim (God)*. The wanderers among the nations are the multitude to be gathered, *the children of Yahudah (Judah) and the children of Yashar''el (Israel)... gathered together* under one head (1:11).'),
    ('canon','hosea',9,17,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Paul sets the seal on Hosea''s hardest word — *My Elohim (God) will cast them away* (9:17): the casting-away is not final. *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The lawsuit-casting of the northern house is a season, not a verdict of rejection.'),
    ('canon','hosea',9,17,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery... that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26). The *wanderers among the nations* (9:17) are under a blindness that is *in part* and *until* — bounded, not final. The casting-away ends in *all Yashar''el (Israel) shall be saved*; the two-house dispersion is the road home, never the dead end.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-9-what-will-ye-do-in-the-feast-of-yahuah',
       E'What will ye do in the feast of Yahuah — the appointed times lost through exile, not abolished',
       E'Exile strips Ephraim of land and of clean worship at once: *They shall not dwell in the LORD''S land; but Ephraim shall return to Egypt, and they shall eat unclean things in Assyria* (Hosea 9:3); *their bread for their soul shall not come into the house of Yahuah (LORD)* (9:4). Then the grief: *What will ye do in the solemn day, and in the day of the feast of Yahuah (LORD)?* (9:5). The lament is NOT that the feasts have ended — it is that a scattered, defiled people can no longer keep them. The calendar still stands and is still His: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2); *These are the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons* (Leviticus 23:4). And the pilgrimage they can no longer make remains commanded: *Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose; in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles* (Deuteronomy 16:16). The solemn day did not pass away; the people cut themselves off from it. Loss through exile, never abolition.',
       sv.verse_id, ev.verse_id, 'free', 44900
  FROM _s328_hos09_lookup sv, _s328_hos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-9-the-days-of-visitation-the-despised-prophet',
       E'The days of visitation are come — the despised prophet, the day of recompence',
       E'The judgment arrives as a day with a name: *The days of visitation are come, the days of recompence are come; Yashar''el (Israel) shall know it: the prophet is a fool, the spiritual man is mad, for the multitude of thine iniquity, and the great hatred* (Hosea 9:7) — the watchman counted a madman by the very people he warns. Isaiah asks the same searching question with the same word: *And what will ye do in the day of visitation, and in the desolation which shall come from far? to whom will ye flee for help? and where will ye leave your glory?* (Isaiah 10:3) — and the glory they must leave is the glory Hosea says *shall fly away like a bird* (9:11). Yahusha weeps it over the city: *they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (Luke 19:44) — the despised prophet weeping where he was not received. And Peter turns the day''s other face toward hope: *they may by your good works, which they shall behold, glorify Elohim (God) in the day of visitation* (1 Peter 2:12). The visitation comes for all; recompence to the unfaithful, glory in the faithful — according to the heart it finds.',
       sv.verse_id, ev.verse_id, 'free', 44903
  FROM _s328_hos09_lookup sv, _s328_hos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor',
       E'Grapes in the wilderness — but they went to Baal-peor; their abominations according as they loved',
       E'Yahuah remembers the delight of the beginning: *I found Yashar''el (Israel) like grapes in the wilderness; I saw your fathers as the firstripe in the fig tree at her first time* (Hosea 9:10). It is the wilderness espousal Jeremiah remembers — *I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness* — when *Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (Jeremiah 2:2-3), and Yahuah *kept him as the apple of his eye* (Deuteronomy 32:10). But the firstfruits defiled themselves at the threshold of the land: *but they went to Baal-peor, and separated themselves unto that shame; and their abominations were according as they loved* (9:10). The history is exact: *And Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1); *And Yashar''el (Israel) joined himself unto Baal-peor* (Numbers 25:3); *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead* (Psalm 106:28). And Hosea names the law of worship — *their abominations were according as they loved* — which the Psalm states plainly: *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). You become what you bow to; the delight Yahuah found turned into the likeness of its shame.',
       sv.verse_id, ev.verse_id, 'free', 44906
  FROM _s328_hos09_lookup sv, _s328_hos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit',
       E'Their glory shall fly away — the dried root that bears no fruit; Ichabod over Ephraim',
       E'The judgment on the northern house is barrenness: *As for Ephraim, their glory shall fly away like a bird, from the birth, and from the womb, and from the conception* (Hosea 9:11); *Ephraim is smitten, their root is dried up, they shall bear no fruit* (9:16). The dried root that bears no fruit is the tree the Messiah''s herald warns of: *And now also the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 3:10); *Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 7:19). Yahusha makes it the vine: *Every branch in me that beareth not fruit he taketh away* (John 15:2); *If a man abide not in me, he is cast forth as a branch, and is withered; and men gather them, and cast them into the fire* (John 15:6). And the glory that *shall fly away like a bird* is Ichabod spoken over the whole house: *And she named the child I-chabod, saying, The glory is departed from Yashar''el (Israel): because the ark of Elohim (God) was taken* (1 Samuel 4:21). When the people forsake Him, the glory takes wing and the root withers; no abiding, no fruit.',
       sv.verse_id, ev.verse_id, 'free', 44909
  FROM _s328_hos09_lookup sv, _s328_hos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-9-cast-away-wanderers-among-the-nations',
       E'Cast away, wanderers among the nations — but a season, not a final rejection (the Romans 11 guard)',
       E'The chapter ends in the hardest word: *My Elohim (God) will cast them away, because they did not hearken unto him: and they shall be wanderers among the nations* (Hosea 9:17). This is the Deuteronomy 28 covenant-curse come to pass — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — the two-house dispersion of the northern kingdom into Assyria and beyond. But the casting-away is bounded, never final. Amos sets the guard on it: *I will sift the house of Yashar''el (Israel) among all nations, like as corn is sifted in a sieve, yet shall not the least grain fall upon the earth* (Amos 9:9) — sifted, scattered, but not one grain lost. And Hosea himself has already promised the reversal: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), *the children of Yahudah (Judah) and the children of Yashar''el (Israel) gathered together* under one head (1:11). Paul seals it against every replacement reading: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2); *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26). The wanderers among the nations are the lost sheep on the road home — victims of the lawsuit, never the cast-off; the scattering is the seed of the regathering.',
       sv.verse_id, ev.verse_id, 'free', 44912
  FROM _s328_hos09_lookup sv, _s328_hos09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=9 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2) — the *day of the feast of Yahuah (LORD)* (Hosea 9:5) is His own appointed time, not ended but unkeepable in exile.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-what-will-ye-do-in-the-feast-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*These are the feasts of Yahuah (LORD)... which ye shall proclaim in their seasons* (Leviticus 23:4) — proclaimed forever in their times; the loss of Hosea 9:5 is the people''s scattering, not the calendar''s end.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-what-will-ye-do-in-the-feast-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Three times in a year shall all thy males appear before Yahuah Elohayka (the LORD thy God)... in the feast of unleavened bread, and in the feast of weeks, and in the feast of tabernacles* (Deuteronomy 16:16) — the pilgrimage Hosea''s exiles, driven from the land (9:3), can no longer make.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=5
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-what-will-ye-do-in-the-feast-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *what will ye do in the day of visitation... where will ye leave your glory?* (Isaiah 10:3) — Isaiah''s question matches Hosea''s answer (9:7); the glory they leave is the glory that *shall fly away like a bird* (9:11).'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-the-days-of-visitation-the-despised-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *thou knewest not the time of thy visitation* (Luke 19:44) — Yahusha weeps Hosea''s word (9:7) over the city, the despised prophet where he was not received.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=19 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-the-days-of-visitation-the-despised-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*glorify Elohim (God) in the day of visitation* (1 Peter 2:12) — the day of Hosea 9:7 has another face: recompence to the unfaithful, glory in those who walk uprightly.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-the-days-of-visitation-the-despised-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yashar''el (Israel) abode in Shittim, and the people began to commit whoredom with the daughters of Moab* (Numbers 25:1) — the Baal-peor Hosea names (9:10), the firstfruits defiled at the threshold of the land.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yashar''el (Israel) joined himself unto Baal-peor: and the anger of Yahuah (LORD) was kindled* (Numbers 25:3) — the joining IS the shame *they separated themselves unto* (Hosea 9:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*They joined themselves also unto Baal-peor, and ate the sacrifices of the dead* (Psalm 106:28) — the Psalm sings the history Hosea preaches (9:10); the abomination *according as they loved*.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (Jeremiah 2:3) — Hosea''s *grapes in the wilderness... the firstripe in the fig tree* (9:10) is the wilderness espousal Jeremiah remembers.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He found him in a desert land... he kept him as the apple of his eye* (Deuteronomy 32:10) — the Song of Moses tells the same finding (Hosea 9:10); the going to Baal-peor spurns that keeping.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8) — the law of worship behind *their abominations were according as they loved* (Hosea 9:10): you become what you bow to.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-grapes-in-the-wilderness-but-they-went-to-baal-peor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the axe is laid unto the root of the trees: therefore every tree which bringeth not forth good fruit is hewn down* (Matthew 3:10) — Hosea''s *root is dried up, they shall bear no fruit* (9:16) is the very tree the herald warns of.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Every tree that bringeth not forth good fruit is hewn down, and cast into the fire* (Matthew 7:19) — the same test: *they shall bear no fruit* (Hosea 9:16) comes to the fire.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Every branch in me that beareth not fruit he taketh away* (John 15:2) — Ephraim''s dried root that *shall bear no fruit* (9:16) is the fruitless branch the Husbandman takes away.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=16
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *The glory is departed from Yashar''el (Israel): because the ark of Elohim (God) was taken* (1 Samuel 4:21) — Ichabod over Ephraim; Hosea''s *glory shall fly away like a bird* (9:11) is the glory departed.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=11
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-their-glory-shall-fly-away-they-shall-bear-no-fruit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — Hosea''s *wanderers among the nations* (9:17) is the Deuteronomy scattering come to pass.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-cast-away-wanderers-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will sift the house of Yashar''el (Israel) among all nations... yet shall not the least grain fall upon the earth* (Amos 9:9) — the GUARD on the casting-away (Hosea 9:17): sifted, scattered, but not one grain lost.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-cast-away-wanderers-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *in the place where it was said... Ye are not my people, there it shall be said... Ye are the sons of the living Elohim (God)* (Hosea 1:10) — Hosea himself reverses the casting-away of 9:17; Lo-Ammi becomes the sons of the living Elohim.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-cast-away-wanderers-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1) — Paul''s seal on Hosea 9:17: the casting-away is not a final verdict.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-cast-away-wanderers-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26) — the wanderers (9:17) are under a blindness that is *in part* and *until*; the casting-away ends in salvation.'
  FROM cross_reference_threads t
  JOIN _s328_hos09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s328_hos09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-9-cast-away-wanderers-among-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_10.sql (Hosea 10) -----
-- Chapter: Hosea 10 — THE EMPTY VINE, A DIVIDED HEART, AND THE CALL TO BREAK UP THE FALLOW GROUND.
-- *Yashar'el (Israel) is an empty vine, he bringeth forth fruit unto himself... Their heart is divided;
-- now shall they be found faulty* (10:1-2) — the northern house, swollen with altars and goodly images,
-- yet barren before Yahuah; the true Vine is the Formed Son in whom alone fruit abides (John 15:1-6), and
-- the divided heart is healed only by the undivided/new heart (Psalm 86:11, Ezekiel 11:19, Deuteronomy
-- 10:16). The calf of Beth-aven is carried to Assyria (10:5-8); under judgment they cry *to the mountains,
-- Cover us; and to the hills, Fall on us* (10:8) — words Yahusha (Jesus) puts in the mouths of the daughters
-- of Jerusalem (Luke 23:30) and the Revelation quotes at the day of wrath (Revelation 6:16). Sin from the
-- days of Gibeah (10:9-10); Ephraim the trained heifer, Yahudah set to plow (10:11). Then the keystone:
-- *Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek
-- Yahuah (LORD), till he come and rain righteousness upon you* (10:12) — Jeremiah's same fallow-ground call
-- (Jeremiah 4:3), the law of sowing the NT carries forward (Matthew 13 the sower, Galatians 6:7, 2
-- Corinthians 9:6), the broken heart-ground = repentance unto the new heart (Ezekiel 36:26), and the rain
-- of righteousness = the latter rain poured out (Joel 2:23, Isaiah 45:8). Against it: *Ye have plowed
-- wickedness, ye have reaped iniquity; ye have eaten the fruit of lies* (10:13) — the same harvest-law in
-- reverse (Galatians 6:8, Proverbs 22:8), the trust in mighty men that fails (Psalm 20:7).
-- Tag: hos10   Temp view: _s328_hos10_lookup
-- Sort band: base 44925, step 3 -> threads at 44925, 44928, 44931, 44934, 44937 (5 threads)
-- Source of EVERY row: 'canon','hosea',10,v
--
-- Hosea 10 coverage:
--   ★ v.1-2 (Yashar'el (Israel) is an empty vine, he bringeth forth fruit unto himself... Their heart is
--          divided; now shall they be found faulty)
--        NT:     ★★ John 15:1 (I am the true vine, and my Father is the husbandman) + 15:5 (I am the vine,
--                ye are the branches... without me ye can do nothing) — THREAD 1 (the empty self-serving
--                vine vs. the true Vine)
--        Extras: none warranted (the vine/heart weave carried in canon)
--        Tanakh: ★ Psalm 86:11 (unite my heart to fear thy name), ★★ Ezekiel 11:19 (I will give them one
--                heart... and will give them an heart of flesh), ★ Deuteronomy 10:16 (Circumcise therefore
--                the foreskin of your heart) — THREAD 1 (the divided heart vs. the undivided/new heart)
--   v.3-4 (We have no king... swearing falsely in making a covenant) — woven in prose; no separate add
--        NT/Extras/Tanakh: none warranted (kingless, false-oath lawsuit; held in chapter prose)
--   v.5-7 (the calves of Beth-aven... carried unto Assyria... her king is cut off as the foam) — prose
--        NT/Extras/Tanakh: none warranted (the calf-idolatry/exile; held in prose, feeds THREAD 2)
--   ★ v.8 (they shall say to the mountains, Cover us; and to the hills, Fall on us)
--        NT:     ★★★ Luke 23:30 (Then shall they begin to say to the mountains, Fall on us; and to the
--                hills, Cover us) — Yahusha quotes it; ★★★ Revelation 6:16 (said to the mountains and
--                rocks, Fall on us, and hide us... from the wrath of the Lamb) — THREAD 2
--        Extras: none warranted
--        Tanakh: woven in prose (the day-of-wrath cry); the NT quotations are the load
--   v.9-11 (thou hast sinned from the days of Gibeah... Ephraim is as an heifer... Yahudah shall plow) —
--        NT/Extras/Tanakh: none warranted separately (Gibeah = Judges 19-20, named in prose; the plowing
--                imagery is the preface to the keystone THREAD 3/THREAD 5)
--   ★★★ v.12a (Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is
--          time to seek Yahuah (LORD)) — THE KEYSTONE
--        NT:     ★★ Matthew 13:3 (a sower went forth to sow) + 13:23 (received seed into the good
--                ground... beareth fruit), ★★ Galatians 6:7 (whatsoever a man soweth, that shall he also
--                reap), ★ 2 Corinthians 9:6 (he which soweth bountifully shall reap also bountifully) — THREAD 3
--        Extras: ★ Sirach 6:19 / Ecclesiasticus (Come to her as one that ploweth and sows, and wait for
--                her good fruits) — THREAD 3 (wisdom sought as sowing-ground)
--        Tanakh: ★★ Jeremiah 4:3 (Break up your fallow ground, and sow not among thorns) — THREAD 3
--   ★★ v.12b (till he come and rain righteousness upon you)
--        NT:     none warranted distinct (the outpouring forward-weave carried in the Joel/latter-rain line)
--        Extras: none warranted
--        Tanakh: ★ Joel 2:23 (the former rain, and the latter rain in the first month), ★ Isaiah 45:8
--                (let the skies pour down righteousness... let righteousness spring up), ★★ Ezekiel 36:26
--                (A new heart also will I give you... an heart of flesh) — THREAD 4 (the rain of
--                righteousness on the broken ground = repentance unto the new heart)
--   ★ v.13 (Ye have plowed wickedness, ye have reaped iniquity; ye have eaten the fruit of lies: because
--          thou didst trust in thy way, in the multitude of thy mighty men)
--        NT:     ★ Galatians 6:8 (he that soweth to his flesh shall of the flesh reap corruption) — THREAD 5
--        Extras: ★ 2 Esdras 4:28 (the evil is sown, but the destruction thereof is not yet come) — THREAD 5
--        Tanakh: ★ Proverbs 22:8 (He that soweth iniquity shall reap vanity), ★ Psalm 20:7 (Some trust in
--                chariots... but we will remember the name of Yahuah) — THREAD 5
--   v.14-15 (a tumult... as Shalman spoiled Beth-arbel... the king of Yashar'el utterly be cut off) — prose
--        NT/Extras/Tanakh: none warranted (the war-judgment close; held in chapter prose)
--
-- Threads (slug — target libraries):
--   1. hosea-10-an-empty-vine-their-heart-is-divided — NT (John 15) + Tanakh (Psalm 86, Ezekiel 11,
--      Deuteronomy 10) [free]
--      (★ the empty self-serving vine vs. the true Vine; the divided heart vs. the undivided/new heart)
--   2. hosea-10-to-the-mountains-cover-us-and-to-the-hills-fall-on-us — NT (Luke 23, Revelation 6) [free]
--      (★ the day-of-wrath cry Yahusha and the Revelation quote directly)
--   3. hosea-10-sow-in-righteousness-break-up-your-fallow-ground — NT (Matthew 13, Galatians 6,
--      2 Corinthians 9) + Extras (Sirach 6) + Tanakh (Jeremiah 4) [extras]
--      (★★★ THE KEYSTONE — sow to righteousness, break up the fallow ground, seek Yahuah; the law of sowing)
--   4. hosea-10-till-he-rain-righteousness-upon-you — Tanakh (Joel 2, Isaiah 45, Ezekiel 36) [free]
--      (★★ the latter rain of righteousness on the broken ground = repentance unto the new heart)
--   5. hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity — NT (Galatians 6) + Extras (2 Esdras 4)
--      + Tanakh (Proverbs 22, Psalm 20) [extras]
--      (★ the harvest-law in reverse; trust in mighty men that fails)
--
-- Framing notes:
--   ★ THE EMPTY VINE AND THE DIVIDED HEART (THREAD 1): *Yashar'el (Israel) is an empty vine, he bringeth
--      forth fruit unto himself... Their heart is divided; now shall they be found faulty* (10:1-2). The
--      northern house produced abundance, but all of it *unto himself* — fruit for the altars and goodly
--      images, none for Yahuah; a vine full of leaves and empty of true fruit. Against it stands the Formed
--      Son: *I am the true vine, and my Father is the husbandman* (John 15:1), *I am the vine, ye are the
--      branches... for without me ye can do nothing* (John 15:5). The empty vine bears fruit unto itself;
--      the true Vine bears fruit unto the Father. And the divided heart — the half-hearted worship split
--      between Yahuah and the calf — is exactly what the new covenant heals: *unite my heart to fear thy
--      name* (Psalm 86:11); *I will give them one heart, and I will put a new spirit within you; and I will
--      take the stony heart out of their flesh* (Ezekiel 11:19); *Circumcise therefore the foreskin of your
--      heart, and be no more stiffnecked* (Deuteronomy 10:16). Torah already commanded the heart-cutting;
--      the new covenant performs it — never Torah abolished, but Torah written on an undivided heart.
--   ★ TO THE MOUNTAINS, COVER US (THREAD 2): *and they shall say to the mountains, Cover us; and to the
--      hills, Fall on us* (10:8). Hosea's word for a people overtaken by the terror of judgment is taken up
--      twice in the NT, word for word reversed and intact. Yahusha (Jesus) puts it in the mouths of the
--      daughters of Jerusalem on the way to the cross: *Then shall they begin to say to the mountains, Fall
--      on us; and to the hills, Cover us* (Luke 23:30). And the Revelation sounds it at the opening of the
--      sixth seal: *And said to the mountains and rocks, Fall on us, and hide us from the face of him that
--      sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:16). One cry of a people who
--      will not break their hearts in repentance and so are broken by the day of wrath.
--   ★★★ SOW IN RIGHTEOUSNESS — BREAK UP YOUR FALLOW GROUND (THREAD 3, KEYSTONE): *Sow to yourselves in
--      righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD)*
--      (10:12). The fallow ground is the hard, unplowed heart; to break it up is to repent before the seed
--      can take. Jeremiah preaches the identical word to the southern house: *Break up your fallow ground,
--      and sow not among thorns* (Jeremiah 4:3). Yahusha makes it the whole parable of the sower — *a sower
--      went forth to sow* (Matthew 13:3), and the seed that *received seed into the good ground... beareth
--      fruit, and bringeth forth, some an hundredfold* (Matthew 13:23): the prepared ground IS the broken
--      fallow heart. Paul states the law plainly: *whatsoever a man soweth, that shall he also reap*
--      (Galatians 6:7); *he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6).
--      The restored wisdom-witness sets the same plow to the soul: *Come to her as one that ploweth and
--      sows, and wait for her good fruits* (Sirach 6:19). Sow righteousness, reap mercy — and it is TIME to
--      seek Yahuah.
--   ★★ TILL HE RAIN RIGHTEOUSNESS (THREAD 4): *till he come and rain righteousness upon you* (10:12). The
--      broken ground waits on rain it cannot make. That rain is the promised outpouring: *he hath given you
--      the former rain moderately, and he will cause to come down for you the rain, the former rain, and
--      the latter rain* (Joel 2:23); *let the skies pour down righteousness: let the earth open, and let
--      them bring forth salvation, and let righteousness spring up together* (Isaiah 45:8). And the rain on
--      the fallow heart is the new heart itself: *A new heart also will I give you, and a new spirit will I
--      put within you: and I will take away the stony heart out of your flesh, and I will give you an heart
--      of flesh* (Ezekiel 36:26). Man breaks the ground in repentance; Yahuah rains the righteousness and
--      gives the heart.
--   ★ YE HAVE PLOWED WICKEDNESS (THREAD 5): *Ye have plowed wickedness, ye have reaped iniquity; ye have
--      eaten the fruit of lies: because thou didst trust in thy way, in the multitude of thy mighty men*
--      (10:13). The harvest-law of 10:12 runs in reverse for those who plow the wrong seed: *he that soweth
--      to his flesh shall of the flesh reap corruption* (Galatians 6:8); *He that soweth iniquity shall reap
--      vanity* (Proverbs 22:8). The restored witness names the bitter crop: *the evil is sown, but the
--      destruction thereof is not yet come* (2 Esdras 4:28). And the root sin is misplaced trust — *thou
--      didst trust in thy way, in the multitude of thy mighty men* — answered by *Some trust in chariots,
--      and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7).
--   VERSES WITH NO SEPARATE ADD: v.3-4 (kingless, false-oath lawsuit), v.5-7 (the calf of Beth-aven carried
--      to Assyria, the king cut off), v.9-11 (the days of Gibeah, the trained heifer Ephraim, Yahudah set
--      to plow), v.14-15 (the war-tumult, Beth-arbel, the king cut off) — all recorded, woven in chapter
--      prose, none silently skipped.

CREATE TEMP VIEW _s328_hos10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): An empty vine, their heart is divided — the true Vine vs. the undivided/new heart
    ('canon','hosea',10,1,'canon','john',15,1,'free',
      E'*I am the true vine, and my Father is the husbandman* (John 15:1). Hosea names the false vine: *Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself* (Hosea 10:1) — abundance grown for its own altars, barren before Yahuah. The Formed Son is the answer: *the true vine*, whose fruit is borne unto *my Father... the husbandman*. The empty vine fruits unto itself; the true Vine fruits unto the Father.'),
    ('canon','hosea',10,1,'canon','john',15,5,'free',
      E'*I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). The *empty vine* that *bringeth forth fruit unto himself* (Hosea 10:1) is the branch that will not abide — and so bears nothing true. Only in the Formed Son does the branch *bring forth much fruit*; severed from him, *ye can do nothing*. Hosea''s empty vine is the picture of fruit attempted apart from the Vine.'),
    ('canon','hosea',10,2,'canon','psalms',86,11,'free',
      E'*Teach me thy way, O Yahuah (LORD); I will walk in thy truth: unite my heart to fear thy name* (Psalm 86:11). Against Hosea''s verdict — *Their heart is divided; now shall they be found faulty* (Hosea 10:2) — the psalmist prays for the cure: *unite my heart to fear thy name*. The divided heart, split between Yahuah and the calf, is found faulty; the united heart fears his name alone.'),
    ('canon','hosea',10,2,'canon','ezekiel',11,19,'free',
      E'*And I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19). *Their heart is divided* (Hosea 10:2) is healed only by the new-covenant gift: *one heart... a new spirit... an heart of flesh*. What the divided heart cannot do, Yahuah does — making it one, that they may *walk in my statutes, and keep mine ordinances* (Ezekiel 11:20). Never the Torah abolished, but the Torah given a single, fleshly heart to keep it.'),
    ('canon','hosea',10,2,'canon','deuteronomy',10,16,'free',
      E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). The divided heart found faulty (Hosea 10:2) is the uncircumcised heart Torah already commanded be cut: *Circumcise therefore the foreskin of your heart*. The remedy for the divided heart is Torah''s own — the inward circumcision that the new covenant performs (Ezekiel 11:19; Deuteronomy 30:6).'),

    -- THREAD 2 (★): To the mountains, Cover us — the day-of-wrath cry Yahusha and the Revelation quote
    ('canon','hosea',10,8,'canon','luke',23,30,'free',
      E'*Then shall they begin to say to the mountains, Fall on us; and to the hills, Cover us* (Luke 23:30). Yahusha (Jesus), turning to the daughters of Jerusalem on the way to the cross, takes Hosea''s very words: *they shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8). The cry of the northern house under judgment becomes the warning of judgment coming on Jerusalem — *weep not for me, but weep for yourselves* (Luke 23:28).'),
    ('canon','hosea',10,8,'canon','revelation',6,16,'free',
      E'*And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:16). The same cry of Hosea 10:8 — *to the mountains, Cover us; and to the hills, Fall on us* — sounds at the sixth seal, the day of wrath. A people who would not break their hearts to seek Yahuah call on the rocks to break over them instead, hiding *from the wrath of the Lamb*.'),

    -- THREAD 3 (★★★, KEYSTONE): Sow in righteousness, break up your fallow ground, seek Yahuah
    ('canon','hosea',10,12,'canon','jeremiah',4,3,'free',
      E'*For thus saith Yahuah (LORD) to the men of Yahudah (Judah) and Jerusalem, Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). The keystone call — *break up your fallow ground: for it is time to seek Yahuah (LORD)* (Hosea 10:12) — is preached word for word to the southern house: *Break up your fallow ground, and sow not among thorns*. The hard, unplowed heart must be broken in repentance before righteous seed can take. One call to both houses.'),
    ('canon','hosea',10,12,'canon','matthew',13,3,'free',
      E'*And he spake many things unto them in parables, saying, Behold, a sower went forth to sow* (Matthew 13:3). Hosea''s *Sow to yourselves in righteousness... break up your fallow ground* (Hosea 10:12) becomes Yahusha''s whole parable of the kingdom: *a sower went forth to sow*. The seed is the word; the ground is the heart; the harvest answers to the condition of the soil — exactly Hosea''s plowing-and-sowing of the soul.'),
    ('canon','hosea',10,12,'canon','matthew',13,23,'free',
      E'*But he that received seed into the good ground is he that heareth the word, and understandeth it; which also beareth fruit, and bringeth forth, some an hundredfold, some sixty, some thirty* (Matthew 13:23). The *good ground* is Hosea''s broken-up fallow ground — *break up your fallow ground* (Hosea 10:12). Where the hard heart is plowed in repentance and the word received, righteousness sown reaps mercy: it *beareth fruit... some an hundredfold*. The prepared ground is the prepared heart.'),
    ('canon','hosea',10,12,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Hosea states the law as promise — *Sow to yourselves in righteousness, reap in mercy* (Hosea 10:12); Paul states it as warning and law together: *whatsoever a man soweth, that shall he also reap*. The harvest answers exactly to the seed. Sow righteousness, reap mercy.'),
    ('canon','hosea',10,12,'canon','2-corinthians',9,6,'free',
      E'*But this I say, He which soweth sparingly shall reap also sparingly; and he which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). The measure of the reaping follows the measure of the sowing — the very law of Hosea 10:12, *Sow to yourselves in righteousness, reap in mercy*. To sow bountifully in righteousness is to reap bountifully in mercy; the prepared, generous ground brings the fuller harvest.'),
    ('canon','hosea',10,12,'apocrypha','ecclesiasticus',6,19,'extras',
      E'*Come to her as one that ploweth and sows, and wait for her good fruits: for you shall not toil much in labouring about her, but you shall eat of her fruits right soon* (Sirach 6:19). The restored wisdom-witness sets the same plow to the soul that Hosea sets to the heart — *break up your fallow ground... sow to yourselves in righteousness* (Hosea 10:12). Wisdom is gained as a field is worked: plow, sow, *wait for her good fruits*, and *eat of her fruits*. Righteousness sought as sowing-ground yields its harvest.'),

    -- THREAD 4 (★★): Till he rain righteousness — the latter rain unto the new heart
    ('canon','hosea',10,12,'canon','joel',2,23,'free',
      E'*Be glad then, ye children of Zion, and rejoice in Yahuah Elohaychem (the LORD your God): for he hath given you the former rain moderately, and he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23). Hosea''s broken ground waits on rain it cannot make — *till he come and rain righteousness upon you* (Hosea 10:12). Joel names the rain: *the former rain, and the latter rain*, the promised outpouring on the repentant land. Man plows; Yahuah sends the rain.'),
    ('canon','hosea',10,12,'canon','isaiah',45,8,'free',
      E'*Drop down, ye heavens, from above, and let the skies pour down righteousness: let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8). The rain Hosea waits for — *till he come and rain righteousness upon you* (Hosea 10:12) — is the heavens raining righteousness on opened ground: *let the skies pour down righteousness... let righteousness spring up together*. The broken-open earth receives the poured righteousness and brings forth salvation.'),
    ('canon','hosea',10,12,'canon','ezekiel',36,26,'free',
      E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The rain of righteousness on the broken fallow ground (Hosea 10:12) IS the new heart given: the stony heart, like the hard unplowed ground, is taken away, and a *heart of flesh* given in its place. Repentance breaks the ground; Yahuah rains the righteousness and gives the new heart that bears it.'),

    -- THREAD 5 (★): Ye have plowed wickedness and reaped iniquity — the harvest-law in reverse
    ('canon','hosea',10,13,'canon','galatians',6,8,'free',
      E'*For he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8). Hosea''s reverse harvest — *Ye have plowed wickedness, ye have reaped iniquity; ye have eaten the fruit of lies* (Hosea 10:13) — is Paul''s sowing to the flesh: *he that soweth to his flesh shall of the flesh reap corruption*. The same law that promises mercy to righteousness (10:12) returns corruption to wickedness.'),
    ('canon','hosea',10,13,'canon','proverbs',22,8,'free',
      E'*He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). Hosea''s verdict — *Ye have plowed wickedness, ye have reaped iniquity* (Hosea 10:13) — is wisdom''s plain proverb: *He that soweth iniquity shall reap vanity*. The crop is sure; wickedness plowed in yields only emptiness and the failing rod of wrath.'),
    ('canon','hosea',10,13,'canon','psalms',20,7,'free',
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Hosea names the root sin under the bad harvest — *because thou didst trust in thy way, in the multitude of thy mighty men* (Hosea 10:13). The psalm sets the contrast: not *chariots... horses* nor mighty men, *but we will remember the name of Yahuah*. Misplaced trust reaps iniquity; trust in the Name reaps deliverance.'),
    ('canon','hosea',10,13,'apocrypha','2-esdras',4,28,'extras',
      E'*But as concerning the things of which you ask me, I will tell you; for the evil is sown, but the destruction thereof is not yet come* (2 Esdras 4:28). Hosea''s harvest of lies — *Ye have plowed wickedness, ye have reaped iniquity; ye have eaten the fruit of lies* (Hosea 10:13) — is the restored witness''s evil-seed sown into the world, whose bitter crop ripens toward *the time of threshing* (2 Esdras 4:30). What is sown in wickedness must be reaped; the destruction is sure though *not yet come*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

-- THREAD 1 (★): hosea-10-an-empty-vine-their-heart-is-divided [free]
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-10-an-empty-vine-their-heart-is-divided',
       E'An empty vine, their heart is divided — the true Vine and the undivided heart',
       E'*Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself... Their heart is divided; now shall they be found faulty* (Hosea 10:1-2). The northern house bore abundance, but all of it *unto himself* — fruit for the altars and goodly images, none for Yahuah; a vine swollen with leaves and empty of true fruit. The Formed Son stands against it: *I am the true vine, and my Father is the husbandman* (John 15:1); *I am the vine, ye are the branches... for without me ye can do nothing* (John 15:5). The empty vine fruits unto itself; the true Vine fruits unto the Father, and the branch that will not abide bears nothing true. And the divided heart — worship split between Yahuah and the calf — is exactly what the new covenant heals. The psalmist prays the cure: *unite my heart to fear thy name* (Psalm 86:11). Yahuah promises it: *I will give them one heart, and I will put a new spirit within you; and I will take the stony heart out of their flesh, and will give them an heart of flesh* (Ezekiel 11:19) — given *that they may walk in my statutes, and keep mine ordinances* (Ezekiel 11:20). And Torah had already commanded the cutting: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). Never the Torah abolished — the Torah given an undivided, fleshly heart to keep it.',
       sv.verse_id, ev.verse_id, 'free', 44925
  FROM _s328_hos10_lookup sv, _s328_hos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=10 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★): hosea-10-to-the-mountains-cover-us-and-to-the-hills-fall-on-us [free]
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-10-to-the-mountains-cover-us-and-to-the-hills-fall-on-us',
       E'To the mountains, Cover us — the day-of-wrath cry Yahusha and the Revelation quote',
       E'*The high places also of Aven, the sin of Yashar''el (Israel), shall be destroyed... and they shall say to the mountains, Cover us; and to the hills, Fall on us* (Hosea 10:8). Hosea''s word for a people overtaken by the terror of judgment is taken up twice in the New Testament, intact. Yahusha (Jesus), turning to the daughters of Jerusalem on the way to the cross, speaks it over a coming judgment: *Then shall they begin to say to the mountains, Fall on us; and to the hills, Cover us* (Luke 23:30) — *weep not for me, but weep for yourselves* (Luke 23:28). And the Revelation sounds it at the opening of the sixth seal, the day of wrath: *And said to the mountains and rocks, Fall on us, and hide us from the face of him that sitteth on the throne, and from the wrath of the Lamb* (Revelation 6:16). It is the cry of a people who would not break their hearts to seek Yahuah, and so call on the rocks to break over them instead — the opposite of the broken fallow ground of 10:12. Break the heart in repentance, or be broken by the day of wrath.',
       sv.verse_id, ev.verse_id, 'free', 44928
  FROM _s328_hos10_lookup sv, _s328_hos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★, KEYSTONE): hosea-10-sow-in-righteousness-break-up-your-fallow-ground [extras]
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-10-sow-in-righteousness-break-up-your-fallow-ground',
       E'Sow to yourselves in righteousness, break up your fallow ground — it is time to seek Yahuah',
       E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12) — the heart of the chapter. The fallow ground is the hard, unplowed heart; to break it up is to repent before righteous seed can take root. Jeremiah preaches the identical word to the southern house: *Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3) — one call to both houses. Yahusha makes it the whole parable of the kingdom: *a sower went forth to sow* (Matthew 13:3), and the seed that *received seed into the good ground... beareth fruit, and bringeth forth, some an hundredfold, some sixty, some thirty* (Matthew 13:23) — the prepared good ground IS the broken fallow heart. Paul states the law as warning: *whatsoever a man soweth, that shall he also reap* (Galatians 6:7); *He which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6). And the restored wisdom-witness sets the same plow to the soul: *Come to her as one that ploweth and sows, and wait for her good fruits* (Sirach 6:19). Sow righteousness, reap mercy — break the hard ground — *for it is time to seek Yahuah*.',
       sv.verse_id, ev.verse_id, 'extras', 44931
  FROM _s328_hos10_lookup sv, _s328_hos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★): hosea-10-till-he-rain-righteousness-upon-you [free]
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-10-till-he-rain-righteousness-upon-you',
       E'Till he rain righteousness upon you — the latter rain unto the new heart',
       E'*...for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). The broken ground waits on rain it cannot make. That rain is the promised outpouring. Joel names it: *Be glad then, ye children of Zion... for he hath given you the former rain moderately, and he will cause to come down for you the rain, the former rain, and the latter rain in the first month* (Joel 2:23). Isaiah sings the heavens raining righteousness on the opened earth: *Drop down, ye heavens, from above, and let the skies pour down righteousness: let the earth open, and let them bring forth salvation, and let righteousness spring up together* (Isaiah 45:8). And the rain on the fallow heart is the new heart itself: *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). Man breaks the ground in repentance; Yahuah rains the righteousness and gives the heart of flesh that bears it.',
       sv.verse_id, ev.verse_id, 'free', 44934
  FROM _s328_hos10_lookup sv, _s328_hos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★): hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity [extras]
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity',
       E'Ye have plowed wickedness and reaped iniquity — the harvest-law in reverse',
       E'*Ye have plowed wickedness, ye have reaped iniquity; ye have eaten the fruit of lies: because thou didst trust in thy way, in the multitude of thy mighty men* (Hosea 10:13). The harvest-law that promises mercy to righteousness (10:12) runs in reverse for those who plow the wrong seed. Paul states it: *he that soweth to his flesh shall of the flesh reap corruption; but he that soweth to the Spirit shall of the Spirit reap life everlasting* (Galatians 6:8). Wisdom states it plainly: *He that soweth iniquity shall reap vanity: and the rod of his anger shall fail* (Proverbs 22:8). And the restored witness names the bitter crop ripening toward threshing: *the evil is sown, but the destruction thereof is not yet come* (2 Esdras 4:28). The root sin is misplaced trust — *thou didst trust in thy way, in the multitude of thy mighty men* — answered by the psalm: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). What is sown is reaped; trust in flesh reaps corruption, trust in the Name reaps deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 44937
  FROM _s328_hos10_lookup sv, _s328_hos10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am the true vine, and my Father is the husbandman* (John 15:1) — the empty vine that fruits unto itself answered by the true Vine that fruits unto the Father.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-an-empty-vine-their-heart-is-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the vine, ye are the branches... without me ye can do nothing* (John 15:5) — fruit attempted apart from the Vine is the empty vine of Hosea 10:1.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=1
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-an-empty-vine-their-heart-is-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*unite my heart to fear thy name* (Psalm 86:11) — the prayed cure for the divided heart of Hosea 10:2.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-an-empty-vine-their-heart-is-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I will give them one heart... an heart of flesh* (Ezekiel 11:19) — the divided heart healed by the new-covenant gift, that they may keep his statutes.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-an-empty-vine-their-heart-is-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Circumcise therefore the foreskin of your heart* (Deuteronomy 10:16) — Torah''s own command for the cure of the divided/uncircumcised heart.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=2
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-an-empty-vine-their-heart-is-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then shall they begin to say to the mountains, Fall on us; and to the hills, Cover us* (Luke 23:30) — Yahusha puts Hosea 10:8 in the mouths of the daughters of Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-to-the-mountains-cover-us-and-to-the-hills-fall-on-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Fall on us, and hide us... from the wrath of the Lamb* (Revelation 6:16) — Hosea 10:8 sounded at the sixth seal, the day of wrath.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=8
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-to-the-mountains-cover-us-and-to-the-hills-fall-on-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3) — the identical call preached to the southern house; one word to both houses.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a sower went forth to sow* (Matthew 13:3) — Hosea''s sow-and-break-up-the-ground becomes Yahusha''s whole parable of the kingdom.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*received seed into the good ground... beareth fruit... an hundredfold* (Matthew 13:23) — the good ground IS the broken fallow heart of Hosea 10:12.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the law of Hosea 10:12 stated as warning: the harvest answers exactly to the seed.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He which soweth bountifully shall reap also bountifully* (2 Corinthians 9:6) — sow righteousness bountifully, reap mercy bountifully (Hosea 10:12).'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Come to her as one that ploweth and sows, and wait for her good fruits* (Sirach 6:19) — the restored wisdom-witness sets the same plow to the soul.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-sow-in-righteousness-break-up-your-fallow-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the former rain, and the latter rain in the first month* (Joel 2:23) — the rain Hosea waits for, the promised outpouring on the repentant land.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-till-he-rain-righteousness-upon-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*let the skies pour down righteousness... let righteousness spring up together* (Isaiah 45:8) — the heavens raining righteousness on opened ground, as Hosea 10:12.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-till-he-rain-righteousness-upon-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A new heart also will I give you... an heart of flesh* (Ezekiel 36:26) — the rain on the fallow heart is the new heart itself.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=12
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-till-he-rain-righteousness-upon-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he that soweth to his flesh shall of the flesh reap corruption* (Galatians 6:8) — Hosea''s reverse harvest of wickedness stated by Paul.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He that soweth iniquity shall reap vanity* (Proverbs 22:8) — wisdom''s plain proverb of Hosea''s reaped iniquity.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Some trust in chariots... but we will remember the name of Yahuah* (Psalm 20:7) — the answer to trusting in the multitude of mighty men (Hosea 10:13).'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the evil is sown, but the destruction thereof is not yet come* (2 Esdras 4:28) — the restored witness''s bitter crop ripening toward threshing.'
  FROM cross_reference_threads t
  JOIN _s328_hos10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=10 AND sv.verse_number=13
  JOIN _s328_hos10_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-10-ye-have-plowed-wickedness-and-reaped-iniquity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_11.sql (Hosea 11) -----
-- Chapter: Hosea 11 — ★★★ THE FATHER'S LOVE THAT WILL NOT GIVE EPHRAIM UP. *When Yashar'el
-- (Israel) was a child, then I loved him, and called my son out of Egypt* (11:1) — Yashar'el is
-- Yahuah's firstborn son brought up out of Egypt (Exodus 4:22), and Matthew reads the verse of the
-- Messiah-child carried up from Egypt: *Out of Egypt have I called my son* (Matthew 2:15). The Formed
-- Son recapitulates and embodies the calling of the corporate son Yashar'el — the two-house/firstborn
-- frame, NOT replacement. The tender Father who *taught Ephraim also to go, taking them by their arms*
-- (11:3) drawing *with cords of a man, with bands of love* (11:4); then the heart of the chapter:
-- *How shall I give thee up, Ephraim?... mine heart is turned within me... for I am Elohim (God), and
-- not man; the Holy One in the midst of thee* (11:8-9) — the divine compassion that overrules wrath,
-- with the Romans 11 anti-replacement guard (the gifts and calling are without repentance). It closes
-- with the regathering of the scattered northern house, trembling home from Egypt and Assyria at the
-- lion's roar, placed back in their houses (11:10-11) — the two-house ingathering.
-- Tag: hos11   Temp view: _s328_hos11_lookup
-- Sort band: base 44950, step 3 -> threads at 44950, 44953, 44956, 44959 (4 threads)
-- Source of EVERY row: 'canon','hosea',11,v
--
-- Hosea 11 coverage:
--   ★★★ v.1 (When Yashar'el (Israel) was a child, then I loved him, and called my son out of Egypt)
--        NT:     ★★★ Matthew 2:15 (Out of Egypt have I called my son) — THREAD 1 (the Son recapitulates the son)
--        Extras: none warranted (the firstborn-son weave carried by canon Exodus 4:22 + Matthew 2:15)
--        Tanakh: ★★ Exodus 4:22 (Yashar'el is my son, even my firstborn) — THREAD 1
--   v.2 (they sacrificed unto Baalim, and burned incense to graven images)
--        NT/Extras/Tanakh: none warranted distinct — the apostasy is the foil to the Father's love; woven in prose
--   ★ v.3-4 (I taught Ephraim also to go, taking them by their arms... I drew them with cords of a man, with bands of love)
--        NT:     none warranted distinct (the fatherly love is forward-fulfilled in the adoption/sonship carried in THREAD 3 Romans guard)
--        Extras: ★ Jubilees 1:24-25 (I shall be their Father and they will be My children... I am their Father... and I love them) — THREAD 2
--        Tanakh: ★ Deuteronomy 1:31 (Yahuah thy God bare thee, as a man doth bear his son), ★ Deuteronomy 32:10-12 (he kept him as the apple of his eye), ★ Jeremiah 31:3 (I have loved thee with an everlasting love), Exodus 15:26 (I am Yahuah Rapha that healeth thee = "they knew not that I healed them") — THREAD 2
--   v.5-7 (He shall not return into the land of Egypt, but the Assyrian shall be his king... my people are bent to backsliding)
--        NT/Extras/Tanakh: none warranted distinct — the exile-judgment for refusing to return; the foil that v.8-9 mercy overrules; woven in prose
--   ★★ v.8-9 (How shall I give thee up, Ephraim?... mine heart is turned within me... for I am Elohim (God), and not man; the Holy One in the midst of thee)
--        NT:     ★★ Romans 11:1-2 (Hath Elohim cast away his people? Elohim forbid... hath not cast away his people which he foreknew), ★★ Romans 11:28-29 (beloved for the fathers' sakes... the gifts and calling of Elohim are without repentance), ★ James 2:13 (mercy rejoiceth against judgment) — THREAD 3
--        Extras: ★ Wisdom of Solomon 11:23-24 (you have mercy upon all... you lovest all the things that are) — THREAD 3
--        Tanakh: ★★ Numbers 23:19 (Elohim is not a man, that he should lie; neither the son of Adam, that he should repent), ★ Isaiah 54:7-8 (For a small moment have I forsaken thee; but with great mercies will I gather thee), ★ Lamentations 3:31-32 (Yahuah will not cast off for ever... yet will he have compassion) — THREAD 3
--   ★ v.10-11 (he shall roar like a lion... they shall tremble as a bird out of Egypt, and as a dove out of the land of Assyria: and I will place them in their houses)
--        NT:     none warranted distinct (the ingathering is forward-fulfilled across the two-house weave; held in prose)
--        Extras: ★ 2 Esdras 13:39-40 (he gathered another peaceable multitude... those are the ten tribes, carried away... in the time of Osea the king... by Salmanasar the king of Assyria), ★ Jubilees 1:15 (I shall gather them from amongst all the nations) — THREAD 4
--        Tanakh: ★★ Isaiah 11:11 (recover the remnant of his people... from Assyria, and from Egypt), ★ Zechariah 10:10 (I will bring them again out of Egypt, and gather them out of Assyria), ★★ Ezekiel 37:21-22 (gather them... make them one nation... no more two nations), ★ Amos 1:2 / Joel 3:16 (Yahuah will roar from Zion) — THREAD 4
--   v.12 (Ephraim compasseth me about with lies... but Yahudah (Judah) yet ruleth with Elohim)
--        NT/Extras/Tanakh: none warranted distinct — the two-house contrast (Ephraim's deceit vs Yahudah's faithfulness); woven in THREAD 4's two-house frame in prose
--
-- Threads (slug — target libraries):
--   1. hosea-11-out-of-egypt-have-i-called-my-son — NT (Matthew 2) + Tanakh (Exodus 4) [free]
--      (★★★ the Formed Son recapitulates the corporate son Yashar'el; firstborn-son frame, NOT replacement)
--   2. hosea-11-i-taught-ephraim-to-go-with-bands-of-love — Tanakh (Deuteronomy 1, Deuteronomy 32, Jeremiah 31, Exodus 15) + Extras (Jubilees 1) [extras]
--      (★ the tender Father teaching the child to walk, drawing with cords of love, healing)
--   3. hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man — Tanakh (Numbers 23, Isaiah 54, Lamentations 3) + NT (Romans 11, James 2) + Extras (Wisdom of Solomon 11) [extras]
--      (★★ the compassion that overrules wrath; Romans 11 anti-replacement guard — gifts and calling without repentance)
--   4. hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses — Tanakh (Isaiah 11, Zechariah 10, Ezekiel 37, Amos 1) + Extras (2 Esdras 13, Jubilees 1) [extras]
--      (★ the regathering of the scattered northern house at the lion's roar; the two-house ingathering)
--
-- Framing notes:
--   ★★★ OUT OF EGYPT I CALLED MY SON (THREAD 1): *When Yashar'el (Israel) was a child, then I loved him,
--      and called my son out of Egypt* (11:1). The corporate son is named at the Exodus: *Thus saith
--      Yahuah (LORD), Yashar'el (Israel) is my son, even my firstborn* (Exodus 4:22). Matthew quotes 11:1
--      of the Messiah-child carried up from Egypt — *Out of Egypt have I called my son* (Matthew 2:15) —
--      the Formed Son embodying and fulfilling the calling of the son Yashar'el. The firstborn-son / two-house
--      frame, NEVER a replacement of Israel by another people.
--   ★★ HOW SHALL I GIVE THEE UP (THREAD 3): *for I am Elohim (God), and not man* (11:9) is the same word
--      as *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent*
--      (Numbers 23:19) — the unchanging mercy. Romans 11 is the explicit anti-replacement guard: *Hath
--      Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *the gifts and calling of
--      Elohim (God) are without repentance* (Romans 11:29). The mercy that triumphs: *mercy rejoiceth
--      against judgment* (James 2:13).
--   VERSES WITH NO SEPARATE ADD: v.2 (Baalim/idols — the apostasy foil, woven in prose), v.5-7 (the
--      exile-judgment that v.8-9 mercy overrules, woven in prose), v.12 (Ephraim's deceit vs Yahudah's
--      faithfulness — the two-house contrast, woven into THREAD 4's frame). All weighed, none silently skipped.

CREATE TEMP VIEW _s328_hos11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Out of Egypt have I called my son — the Formed Son recapitulates the son Yashar'el
    ('canon','hosea',11,1,'canon','matthew',2,15,'free',
      E'*And was there until the death of Herod: that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet, saying, Out of Egypt have I called my son* (Matthew 2:15). Matthew reads *called my son out of Egypt* (Hosea 11:1) of the Messiah-child carried up from Egypt — the Formed Son embodying and fulfilling the calling of the corporate son. The Son recapitulates the son Yashar''el (Israel): the firstborn-son frame, not a replacement of Israel by another people.'),
    ('canon','hosea',11,1,'canon','exodus',4,22,'free',
      E'*And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). Hosea''s *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (11:1) sings back the word spoken at the Exodus itself — Yashar''el is Yahuah''s firstborn son, loved as a child and brought up out of Egypt. The corporate son here is the same son the Messiah recapitulates (Matthew 2:15).'),

    -- THREAD 2 (★): I taught Ephraim to go, with bands of love — the tender fatherly love
    ('canon','hosea',11,3,'canon','deuteronomy',1,31,'free',
      E'*And in the wilderness, where thou hast seen how that Yahuah Elohayka (the LORD thy God) bare thee, as a man doth bear his son, in all the way that ye went, until ye came into this place* (Deuteronomy 1:31). The Father who *taught Ephraim also to go, taking them by their arms* (Hosea 11:3) is the One who *bare thee, as a man doth bear his son* through the wilderness — the same paternal tenderness, carrying the child every step of the way.'),
    ('canon','hosea',11,3,'canon','deuteronomy',32,10,'free',
      E'*He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). The teaching, arm-holding love of *I taught Ephraim also to go* (Hosea 11:3) is the Song of Moses'' own picture — *he led him about, he instructed him, he kept him as the apple of his eye* — the Father guarding the child he is teaching to walk.'),
    ('canon','hosea',11,4,'canon','jeremiah',31,3,'free',
      E'*Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). Hosea''s *I drew them with cords of a man, with bands of love* (11:4) is the same drawing — *with lovingkindness have I drawn thee* in an *everlasting love*. The cords are not chains but the bands of a Father''s unbreaking affection.'),
    ('canon','hosea',11,3,'canon','exodus',15,26,'free',
      E'*If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God)... for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). When Hosea laments *they knew not that I healed them* (11:3), the healing is the Father''s own Name revealed at the bitter waters — *I am Yahuah Rapha (the LORD that healeth thee)*. The child being taught to walk was being healed all the while, and knew it not.'),
    ('canon','hosea',11,4,'jubilees','jubilees',1,24,'extras',
      E'*And their souls will cleave to Me and to all My commandments, and they will fulfil My commandments, and I shall be their Father and they will be My children* (Jubilees 1:24). The *bands of love* by which the Father drew Ephraim (Hosea 11:4) are the bands of the covenant Father-and-children bond — *I shall be their Father and they will be My children* — the love that draws the heart to cleave to Him and to His commandments (Torah kept, never abolished).'),
    ('canon','hosea',11,4,'jubilees','jubilees',1,25,'extras',
      E'*And they will all be called children of the living Elohim (God)... and that I am their Father in uprightness and righteousness, and that I love them* (Jubilees 1:25). The fatherly love of *with bands of love... and I laid meat unto them* (Hosea 11:4) is the very love the restored witness names — *I am their Father... and that I love them* — the children of the living Elohim drawn by a Father who feeds and loves them.'),

    -- THREAD 3 (★★): How shall I give thee up — I am Elohim, and not man (mercy overrules wrath; Romans 11 guard)
    ('canon','hosea',11,9,'canon','numbers',23,19,'free',
      E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). Hosea''s *for I am Elohim (God), and not man; the Holy One in the midst of thee* (11:9) is the same unchanging faithfulness — *Elohim (God) is not a man, that he should lie*. Because He is not man, His repentings of mercy (11:8) hold; His love does not fail as a man''s would.'),
    ('canon','hosea',11,8,'canon','isaiah',54,7,'free',
      E'*For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7). The turning heart of *How shall I give thee up, Ephraim?... mine heart is turned within me, my repentings are kindled together* (Hosea 11:8) is Isaiah''s *with great mercies will I gather thee* — the wrath is *a small moment*, the mercy is the gathering home.'),
    ('canon','hosea',11,9,'canon','isaiah',54,8,'free',
      E'*In a little wrath I hid my face from thee for a moment; but with everlasting kindness will I have mercy on thee, saith Yahuah (LORD) thy Redeemer* (Isaiah 54:8). *I will not execute the fierceness of mine anger, I will not return to destroy Ephraim* (Hosea 11:9) is the very heart of Isaiah''s word — *in a little wrath... but with everlasting kindness will I have mercy on thee*. The mercy overrules the wrath because the Holy One is in the midst.'),
    ('canon','hosea',11,8,'canon','lamentations',3,31,'free',
      E'*For Yahuah (Lord) will not cast off for ever* (Lamentations 3:31). *How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)?* (Hosea 11:8) is answered in Lamentations: *Yahuah (Lord) will not cast off for ever*. The Father cannot bring Himself to give the son up; the casting-off is never final.'),
    ('canon','hosea',11,9,'canon','lamentations',3,32,'free',
      E'*But though he cause grief, yet will he have compassion according to the multitude of his mercies* (Lamentations 3:32). *I will not execute the fierceness of mine anger... for I am Elohim (God), and not man* (Hosea 11:9) is the same compassion — *yet will he have compassion according to the multitude of his mercies*. The grief is real, but the mercies are the multitude that has the last word.'),
    ('canon','hosea',11,9,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Hosea''s *I will not return to destroy Ephraim: for I am Elohim (God), and not man* (11:9) is Paul''s anti-replacement guard made plain — *Hath Elohim (God) cast away his people? Elohim (God) forbid*. The Father did not give Ephraim up; Israel is not cast off, and the apostle is himself an Israelite.'),
    ('canon','hosea',11,9,'canon','romans',11,2,'free',
      E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The mercy that will *not return to destroy Ephraim* (Hosea 11:9) is Paul''s plain word: *Elohim (God) hath not cast away his people which he foreknew*. The foreknown people — the two houses — are kept, never replaced.'),
    ('canon','hosea',11,8,'canon','romans',11,28,'free',
      E'*As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28). The turned heart of *mine heart is turned within me, my repentings are kindled together* (Hosea 11:8) is the love Paul names — *as touching the election, they are beloved for the fathers'' sakes*. Even in the lawsuit, Ephraim remains beloved.'),
    ('canon','hosea',11,9,'canon','romans',11,29,'free',
      E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). *I am Elohim (God), and not man* (Hosea 11:9) is exactly why *the gifts and calling of Elohim (God) are without repentance* — the unchanging One does not revoke the election. The firstborn son called out of Egypt (11:1) is not un-called.'),
    ('canon','hosea',11,8,'canon','james',2,13,'free',
      E'*For he shall have judgment without mercy, that hath shewed no mercy; and mercy rejoiceth against judgment* (James 2:13). The repentings kindled together in the Father''s heart — *mine heart is turned within me* (Hosea 11:8) — are mercy rejoicing against judgment: *mercy rejoiceth against judgment*. The wrath is overruled by the compassion of the Holy One in the midst.'),
    ('canon','hosea',11,9,'apocrypha','the-wisdom-of-solomon',11,23,'extras',
      E'*But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend* (Wisdom of Solomon 11:23). *I will not execute the fierceness of mine anger... for I am Elohim (God), and not man* (Hosea 11:9) is the mercy the restored witness sings — *you have mercy upon all... because they should amend*. The wrath is stayed that the son may turn and live.'),
    ('canon','hosea',11,9,'apocrypha','the-wisdom-of-solomon',11,24,'extras',
      E'*For you lovest all the things that are, and abhorrest nothing which you have made: for never wouldest you have made any thing, if you had hated it* (Wisdom of Solomon 11:24). The Father who cannot give Ephraim up — *how shall I give thee up, Ephraim?* (Hosea 11:8) — *lovest all the things that are, and abhorrest nothing which you have made*. The love that formed the son will not destroy the son.'),

    -- THREAD 4 (★): They shall tremble from Egypt and Assyria, and I will place them in their houses — the regathering
    ('canon','hosea',11,11,'canon','isaiah',11,11,'free',
      E'*And it shall come to pass in that day, that Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt, and from Pathros, and from Cush, and from Elam, and from Shinar, and from Hamath, and from the islands of the sea* (Isaiah 11:11). Hosea''s *they shall tremble as a bird out of Egypt, and as a dove out of the land of Assyria: and I will place them in their houses* (11:11) is the same second-recovery — *the remnant of his people... from Assyria, and from Egypt* — the scattered northern house gathered home.'),
    ('canon','hosea',11,11,'canon','zechariah',10,10,'free',
      E'*I will bring them again also out of the land of Egypt, and gather them out of Assyria; and I will bring them into the land of Gilead and Lebanon; and place shall not be found for them* (Zechariah 10:10). The dove brought *out of Egypt... and out of the land of Assyria* and *place(d)... in their houses* (Hosea 11:11) is Zechariah''s ingathering word for word — *out of the land of Egypt, and gather them out of Assyria* — Ephraim brought home so full the land cannot hold them.'),
    ('canon','hosea',11,11,'canon','ezekiel',37,21,'free',
      E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). *I will place them in their houses, saith Yahuah (LORD)* (Hosea 11:11) is the two-house ingathering of the dry-bones vision — *gather them on every side, and bring them into their own land* — the scattered taken from among the nations and set in their own place.'),
    ('canon','hosea',11,11,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The Ephraim placed back in their houses (Hosea 11:11) while *Yahudah (Judah) yet ruleth with Elohim (God)* (11:12) are the two houses made one — *one nation... no more two nations*. The northern dove and southern house joined into one kingdom under one King.'),
    ('canon','hosea',11,10,'canon','amos',1,2,'free',
      E'*Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem; and the habitations of the shepherds shall mourn, and the top of Carmel shall wither* (Amos 1:2). When Hosea says *he shall roar like a lion: when he shall roar, then the children shall tremble from the west* (11:10), it is the same lion-voice from Zion — *Yahuah (LORD) will roar from Zion* — the roar that summons the scattered children home in trembling.'),
    ('canon','hosea',11,10,'canon','joel',3,16,'free',
      E'*Yahuah (LORD) also shall roar out of Zion, and utter his voice from Jerusalem; and the heavens and the earth shall shake: but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:16). The lion''s roar of *he shall roar like a lion... then the children shall tremble* (Hosea 11:10) is Joel''s roar that gathers — *Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)*. The roar that shakes heaven and earth is the same roar that calls the trembling children to their refuge.'),
    ('canon','hosea',11,11,'apocrypha','2-esdras',13,40,'extras',
      E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land* (2 Esdras 13:40). Hosea''s dove brought *out of the land of Assyria... place(d)... in their houses* (11:11) is the very northern house the restored witness tracks — *the ten tribes, which were carried away... by Salmanasar the king of Assyria* — the scattered Ephraim whose homecoming Hosea foretells.'),
    ('canon','hosea',11,11,'jubilees','jubilees',1,15,'extras',
      E'*And after this they will turn to Me from amongst the nations with all their heart and with all their soul and with all their strength, and I shall gather them from amongst all the nations* (Jubilees 1:15). The trembling return *out of Egypt... and out of the land of Assyria* (Hosea 11:11) is the gathering the restored witness promises — *I shall gather them from amongst all the nations* — the same regathering of the people scattered, placed back in their own houses.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-11-out-of-egypt-have-i-called-my-son',
       E'Out of Egypt have I called my son — the Son recapitulates the son Yashar''el',
       E'The chapter opens on the Father''s first love for the child: *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). This is no new title — it sings back the word Yahuah spoke at the Exodus itself: *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). Yashar''el is the firstborn son, loved as a child, brought up out of Egypt. And Matthew takes this very verse and reads it of the Messiah-child carried up from Egypt: *And was there until the death of Herod: that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet, saying, Out of Egypt have I called my son* (Matthew 2:15). The Formed Son embodies and fulfils the calling of the corporate son — the Son recapitulates the son. This is the firstborn-son, two-house frame: the Messiah does not replace Yashar''el but gathers up Israel''s whole story in himself, the One in whom the firstborn son is brought home.',
       sv.verse_id, ev.verse_id, 'free', 44950
  FROM _s328_hos11_lookup sv, _s328_hos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-11-i-taught-ephraim-to-go-with-bands-of-love',
       E'I taught Ephraim to go, with bands of love — the Father teaching the child to walk',
       E'After the love of v.1 comes the tenderest picture of fatherhood in the prophets: *I taught Ephraim also to go, taking them by their arms; but they knew not that I healed them. I drew them with cords of a man, with bands of love: and I was to them as they that take off the yoke on their jaws, and I laid meat unto them* (Hosea 11:3-4). This is the Father teaching the toddler to walk, holding him by the arms, drawing him not with chains but with the bands of love, lifting the yoke and feeding him. Torah remembers the same carrying: *Yahuah Elohayka (the LORD thy God) bare thee, as a man doth bear his son, in all the way that ye went* (Deuteronomy 1:31); *he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10). The drawing is everlasting: *Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). And the healing the child knew not — *they knew not that I healed them* (11:3) — is the Father''s own Name from the bitter waters: *for I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26). The restored witness names the bond exactly: *they will fulfil My commandments, and I shall be their Father and they will be My children* (Jubilees 1:24), *and that I am their Father in uprightness and righteousness, and that I love them* (Jubilees 1:25) — the bands of love that draw the heart to cleave to Him and to His commandments.',
       sv.verse_id, ev.verse_id, 'extras', 44953
  FROM _s328_hos11_lookup sv, _s328_hos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man',
       E'How shall I give thee up — I am Elohim, and not man (the mercy that overrules wrath)',
       E'Here is the burning heart of the chapter, the Father at war with His own justice: *How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)? how shall I make thee as Admah? how shall I set thee as Zeboim? mine heart is turned within me, my repentings are kindled together. I will not execute the fierceness of mine anger, I will not return to destroy Ephraim: for I am Elohim (God), and not man; the Holy One in the midst of thee* (Hosea 11:8-9). *I am Elohim (God), and not man* is the same unchanging faithfulness Balaam was forced to speak: *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19) — because He is not man, His mercy holds where a man''s would fail. Isaiah sings the same overruling: *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7); *in a little wrath I hid my face from thee for a moment; but with everlasting kindness will I have mercy on thee* (54:8). Lamentations answers the cry: *For Yahuah (Lord) will not cast off for ever* (3:31); *but though he cause grief, yet will he have compassion according to the multitude of his mercies* (3:32). And Paul makes this the great anti-replacement guard — the Father did NOT give Ephraim up: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (11:2); *as touching the election, they are beloved for the fathers'' sakes* (11:28); *for the gifts and calling of Elohim (God) are without repentance* (11:29). Israel is never replaced; the firstborn called out of Egypt is never un-called. *Mercy rejoiceth against judgment* (James 2:13) — and the restored witness sings the same lover of souls: *you have mercy upon all... because they should amend* (Wisdom of Solomon 11:23); *you lovest all the things that are, and abhorrest nothing which you have made* (11:24). The love that formed the son will not destroy the son.',
       sv.verse_id, ev.verse_id, 'extras', 44956
  FROM _s328_hos11_lookup sv, _s328_hos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=11 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses',
       E'They shall tremble from Egypt and Assyria — and I will place them in their houses',
       E'The mercy of v.8-9 becomes a homecoming. The Father roars not to scatter but to gather: *They shall walk after Yahuah (LORD): he shall roar like a lion: when he shall roar, then the children shall tremble from the west. They shall tremble as a bird out of Egypt, and as a dove out of the land of Assyria: and I will place them in their houses, saith Yahuah (LORD)* (Hosea 11:10-11). The lion-roar is the voice from Zion that summons the exiles: *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2); *Yahuah (LORD) also shall roar out of Zion... but Yahuah (LORD) will be the hope of his people, and the strength of the children of Yashar''el (Israel)* (Joel 3:16). And the place He gathers them from is named again and again — out of Egypt and out of Assyria, the lands of the northern dispersion: *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left, from Assyria, and from Egypt* (Isaiah 11:11); *I will bring them again also out of the land of Egypt, and gather them out of Assyria... place shall not be found for them* (Zechariah 10:10). This is the two-house ingathering: *Behold, I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21), *and I will make them one nation... and they shall be no more two nations* (37:22) — Ephraim the dove placed back in their houses, joined to Yahudah (Judah) who *yet ruleth with Elohim (God)* (Hosea 11:12), the two made one. The restored witness tracks the very same scattered house: *Those are the ten tribes, which were carried away prisoners out of their own land... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40), whom the Father will *gather... from amongst all the nations* (Jubilees 1:15). The roar that once drove them out is the roar that calls them home.',
       sv.verse_id, ev.verse_id, 'extras', 44959
  FROM _s328_hos11_lookup sv, _s328_hos11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Out of Egypt have I called my son* (Matthew 2:15) — Matthew reads Hosea 11:1 of the Messiah-child carried up from Egypt; the Formed Son recapitulates the corporate son Yashar''el (Israel), the firstborn-son frame, NOT replacement.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-out-of-egypt-have-i-called-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22) — the word at the Exodus that Hosea 11:1 sings back; the corporate son the Messiah recapitulates.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-out-of-egypt-have-i-called-my-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah thy God bare thee, as a man doth bear his son* (Deuteronomy 1:31) — the same paternal carrying as *I taught Ephraim also to go, taking them by their arms* (Hosea 11:3).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *he led him about, he instructed him, he kept him as the apple of his eye* (Deuteronomy 32:10) — the Song of Moses'' picture of the teaching, guarding love of Hosea 11:3.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3) — the same drawing as *I drew them with cords of a man, with bands of love* (Hosea 11:4).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26) — the healing the child knew not: *they knew not that I healed them* (Hosea 11:3).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I shall be their Father and they will be My children* (Jubilees 1:24) — the *bands of love* (Hosea 11:4) are the covenant Father-and-children bond, drawing the heart to His commandments.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I am their Father in uprightness and righteousness, and that I love them* (Jubilees 1:25) — the fatherly love of *with bands of love... and I laid meat unto them* (Hosea 11:4).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=4
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-i-taught-ephraim-to-go-with-bands-of-love'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent* (Numbers 23:19) — the same unchanging faithfulness as *for I am Elohim (God), and not man* (Hosea 11:9); His mercy holds where man''s fails.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7) — the turned heart of *mine heart is turned within me* (Hosea 11:8); the wrath a moment, the mercy the gathering.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *in a little wrath I hid my face... but with everlasting kindness will I have mercy on thee* (Isaiah 54:8) — the heart of *I will not execute the fierceness of mine anger* (Hosea 11:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (Lord) will not cast off for ever* (Lamentations 3:31) — the answer to *how shall I give thee up, Ephraim?* (Hosea 11:8); the casting-off is never final.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*yet will he have compassion according to the multitude of his mercies* (Lamentations 3:32) — the compassion of *I am Elohim (God), and not man* (Hosea 11:9); the mercies have the last word.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the anti-replacement guard; the Father did NOT give Ephraim up (Hosea 11:9), and Paul is himself an Israelite.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the foreknown two-house people kept, never replaced; the mercy that will not return to destroy Ephraim (Hosea 11:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28) — even in the lawsuit, Ephraim remains beloved; the turned heart of Hosea 11:8.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29) — because *I am Elohim (God), and not man* (Hosea 11:9), the election is not revoked; the son called out of Egypt is not un-called.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'★ *mercy rejoiceth against judgment* (James 2:13) — the repentings kindled in the Father''s heart (Hosea 11:8) are mercy overruling wrath.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=8
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'★ *you have mercy upon all... because they should amend* (Wisdom of Solomon 11:23) — the wrath stayed that the son may turn, as *I will not execute the fierceness of mine anger* (Hosea 11:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'★ *you lovest all the things that are, and abhorrest nothing which you have made* (Wisdom of Solomon 11:24) — the love that formed the son will not destroy the son: *how shall I give thee up, Ephraim?* (Hosea 11:8).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=9
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-how-shall-i-give-thee-up-i-am-elohim-and-not-man'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *recover the remnant of his people... from Assyria, and from Egypt* (Isaiah 11:11) — the same second-recovery as *they shall tremble as a bird out of Egypt, and as a dove out of the land of Assyria* (Hosea 11:11).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will bring them again also out of the land of Egypt, and gather them out of Assyria* (Zechariah 10:10) — the same homecoming as *I will place them in their houses* (Hosea 11:11), so full place is not found.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21) — the two-house ingathering of *I will place them in their houses* (Hosea 11:11).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will make them one nation... and they shall be no more two nations* (Ezekiel 37:22) — Ephraim placed in their houses joined to Yahudah (Hosea 11:11-12); the two houses made one.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yahuah (LORD) will roar from Zion, and utter his voice from Jerusalem* (Amos 1:2) — the same lion-voice as *he shall roar like a lion... then the children shall tremble* (Hosea 11:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Yahuah (LORD) also shall roar out of Zion... but Yahuah (LORD) will be the hope of his people* (Joel 3:16) — the roar that gathers; the children tremble home to their refuge (Hosea 11:10).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=10
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *those are the ten tribes, which were carried away prisoners... whom Salmanasar the king of Assyria led away captive* (2 Esdras 13:40) — the restored witness names the very northern house whose homecoming Hosea 11:11 foretells.'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=13 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *I shall gather them from amongst all the nations* (Jubilees 1:15) — the same regathering as the dove brought home and placed in their houses (Hosea 11:11).'
  FROM cross_reference_threads t
  JOIN _s328_hos11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=11 AND sv.verse_number=11
  JOIN _s328_hos11_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-11-they-shall-tremble-from-egypt-and-i-will-place-them-in-their-houses'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_12.sql (Hosea 12) -----
-- Chapter: Hosea 12 — JACOB WHO WRESTLED WITH THE ANGEL/ELOHIM, and the call to return. Ephraim feeds
-- on wind and trusts Assyria and Egypt (12:1); Yahuah has a controversy and will punish Jacob according
-- to his ways (12:2). Then the prophet reaches back to the patriarch himself: *He took his brother by the
-- heel in the womb, and by his strength he had power with Elohim (God): Yea, he had power over the angel,
-- and prevailed: he wept, and made supplication unto him: he found him in Beth-el, and there he spake with
-- us; Even Yahuah Elohim (the LORD God) of hosts; Yahuah (LORD) is his memorial* (12:3-5) — Peniel
-- (Genesis 32) and Bethel (Genesis 28/35) recalled, and the One Jacob wrestled named BOTH *Elohim (God)*
-- AND *the angel*: the Angel of Yahuah who bears the Name = the Formed Son, the visible One who appeared,
-- who is Yahuah and HAS a Father (the Formed and the Formless; NOT trinitarian co-equal persons, NOT
-- modalism). *Yahuah is his memorial* = Exodus 3:15. The call: *turn thou to thy Elohim (God): keep
-- mercy and judgment, and wait on thy Elohim (God) continually* (12:6 — the weightier matters of the
-- Torah, return TO covenant-keeping). Ephraim the deceitful merchant with *balances of deceit* (12:7-8 —
-- Torah's commercial honesty). Yahuah *will yet make thee to dwell in tabernacles* (12:9 — Sukkot
-- restored, NOT abolished). *By a prophet Yahuah brought Yashar'el out of Egypt* (12:13 — Moses, the
-- Prophet to come). Two-house weave: Ephraim/Jacob = the northern house under lawsuit, the lost sheep
-- gathered, victims-not-enemies.
-- Tag: hos12   Temp view: _s328_hos12_lookup
-- Sort band: base 44975, step 3 -> threads at 44975, 44978, 44981, 44984, 44987 (5 threads)
-- Source of EVERY row: 'canon','hosea',12,v
--
-- Hosea 12 coverage:
--   v.1 (Ephraim feedeth on wind... covenant with the Assyrians, and oil is carried into Egypt)
--        NT: none warranted   Extras: none warranted
--        Tanakh: the wind-trust/foreign-alliance held in prose (the lawsuit preface); no separate add
--   v.2 (Yahuah hath also a controversy with Yahudah, and will punish Jacob according to his ways)
--        NT: none warranted   Extras: none warranted
--        Tanakh: the controversy = preface to the Jacob-recital of v.3-5; woven into THREAD 1 prose
--   ★★★ v.3-5 (he had power with Elohim... he had power over the angel, and prevailed... he found him in
--          Beth-el... Yahuah Elohim of hosts; Yahuah is his memorial)
--        NT:     none forced (the Formed-Son weave is the Tanakh's own theophany; held Christologically)
--        Extras: ★ Jubilees 32:1-9 (Jacob at Bethel, the vow, the tithe) — THREAD 1 (clean Bethel witness)
--        Tanakh: ★★★ Genesis 32:24,28,30 (there wrestled a man... as a prince hast thou power with Elohim
--                and with men... Peniel: for I have seen Elohim face to face), ★★ Genesis 28:12-13,19
--                (the ladder, Yahuah stood above it, Beth-el), ★ Genesis 35:9-10,15 (Elohim appeared
--                again... Yashar'el shall be thy name... Beth-el), ★ Exodus 3:15 (this is my memorial) — THREAD 1
--   ★ v.6 (Therefore turn thou to thy Elohim: keep mercy and judgment, and wait on thy Elohim continually)
--        NT:     ★★ Matthew 23:23 (omitted the weightier matters of the law, judgment, mercy, and faith) — THREAD 2
--        Extras: none warranted (the weightier-matters weave is canon-dense; no extras forced)
--        Tanakh: ★★ Micah 6:8 (to do justly, and to love mercy, and to walk humbly with thy Elohim),
--                ★ Hosea 6:6 (I desired mercy, and not sacrifice), ★ Zechariah 7:9 (Execute true
--                judgment, and shew mercy and compassions) — THREAD 2
--   ★ v.7-8 (He is a merchant, the balances of deceit are in his hand... I am become rich... none iniquity)
--        NT:     none warranted distinct (the just-balance is Torah's own commandment; held in Tanakh weave)
--        Extras: ★ Ecclesiasticus 27:1 (Many have sinned for a small matter; and he that seeks for
--                abundance will turn his eyes away) — THREAD 3 (clean merchant/riches-and-sin witness)
--        Tanakh: ★★ Proverbs 11:1 (A false balance is abomination to Yahuah), ★★ Leviticus 19:36 (Just
--                balances, just weights... shall ye have), ★ Amos 8:5 (making the ephah small... falsifying
--                the balances by deceit) — THREAD 3
--   ★★ v.9 (I that am Yahuah Elohayka from the land of Egypt will yet make thee to dwell in tabernacles,
--          as in the days of the solemn feast)
--        NT:     none warranted distinct (the feast restored is the Tanakh's own appointed-time promise)
--        Extras: none warranted (clean canon witnesses suffice)
--        Tanakh: ★★ Leviticus 23:42 (Ye shall dwell in booths seven days), ★★ Zechariah 14:16 (every one
--                that is left of all the nations... to keep the feast of tabernacles) — THREAD 4
--   v.10 (I have also spoken by the prophets... and used similitudes, by the ministry of the prophets)
--        NT: none warranted   Extras: none warranted
--        Tanakh: the prophetic-word preface to v.13; woven into THREAD 5 prose; no separate add
--   v.11 (Is there iniquity in Gilead?... they sacrifice bullocks in Gilgal)
--        NT: none warranted   Extras: none warranted
--        Tanakh: the Gilgal-altar indictment held in prose; no separate add
--   v.12 (Jacob fled into the country of Syria, and Yashar'el served for a wife, and... kept sheep)
--        NT: none warranted   Extras: none warranted
--        Tanakh: Genesis 29 (Jacob/Laban) — woven into THREAD 1's Jacob-recital prose; no separate add
--   ★ v.13 (And by a prophet Yahuah brought Yashar'el out of Egypt, and by a prophet was he preserved)
--        NT:     ★★ Acts 3:22 (A prophet shall Yahuah Elohaychem raise up unto you... like unto me) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 18:15 (Yahuah Elohayka will raise up unto thee a Prophet... like unto me),
--                ★ Deuteronomy 18:18 (I will raise them up a Prophet from among their brethren) — THREAD 5
--   v.14 (Ephraim provoked him to anger most bitterly... his reproach shall his Lord return unto him)
--        NT: none warranted   Extras: none warranted
--        Tanakh: the lawsuit-verdict close held in prose; no separate add
--
-- Threads (slug — target libraries):
--   1. hosea-12-he-had-power-over-the-angel-the-formed-son — Tanakh (Genesis 32/28/35, Exodus 3) + Extras (Jubilees 32) [extras]
--      (★★★ the One Jacob wrestled, named Elohim AND the angel = the Formed Son; the Formed-and-Formless keystone)
--   2. hosea-12-turn-thou-and-keep-mercy-and-judgment — NT (Matthew 23) + Tanakh (Micah 6, Hosea 6, Zechariah 7) [free]
--      (★ the call to return and KEEP the weightier matters — judgment and mercy; Torah-affirmed)
--   3. hosea-12-the-balances-of-deceit-are-in-his-hand — Tanakh (Proverbs 11, Leviticus 19, Amos 8) + Extras (Sirach 27) [extras]
--      (★ the false-balance merchant; Torah's commercial honesty against self-justifying gain)
--   4. hosea-12-i-will-yet-make-thee-to-dwell-in-tabernacles — Tanakh (Leviticus 23, Zechariah 14) [free]
--      (★★ Sukkot restored — the appointed-time dwelling, kept by the nations; NOT abolished)
--   5. hosea-12-by-a-prophet-yahuah-brought-yashar-el-out — NT (Acts 3) + Tanakh (Deuteronomy 18) [free]
--      (★ Moses the prophet of the deliverance = the type of the Prophet like Moses to come)
--
-- Framing notes:
--   ★★★ HE HAD POWER OVER THE ANGEL (THREAD 1): Hosea sends the lawsuit straight back to the patriarch:
--      *by his strength he had power with Elohim (God): Yea, he had power over the angel, and prevailed:
--      he wept, and made supplication unto him: he found him in Beth-el* (Hosea 12:3-4). The same One is
--      named *Elohim (God)* AND *the angel* — and Genesis records the wrestler as *a man* whom Jacob then
--      names Elohim: *there wrestled a man with him until the breaking of the day* (Genesis 32:24); *as a
--      prince hast thou power with Elohim (God) and with men, and hast prevailed* (Genesis 32:28); *I have
--      seen Elohim (God) face to face, and my life is preserved* (Genesis 32:30). The Angel who bears the
--      Name, the visible One who wrestled, blessed, and renamed Jacob, is the Formed Son — Yahuah seen
--      face to face, who is Yahuah and HAS a Father; NOT co-equal trinitarian persons, NOT modalism. The
--      Bethel where *there he spake with us* is the Bethel of the ladder (*behold a ladder... and behold
--      the angels of Elohim (God) ascending and descending... Yahuah (LORD) stood above it*, Genesis
--      28:12-13; *he called the name of that place Beth-el*, 28:19) and of the second appearing (*Elohim
--      (God) appeared unto Jacob again... Yashar'el (Israel) shall be thy name*, Genesis 35:9-10). And
--      *Yahuah (LORD) is his memorial* (Hosea 12:5) is the Name given at the bush: *this is my name for
--      ever, and this is my memorial unto all generations* (Exodus 3:15). Jubilees keeps the Bethel
--      scene: *Jacob rose early in the morning... and he gave a tithe of all that came with him* (Jubilees
--      32:2) — the vow of Bethel paid. (Hosea 12:12 — *Jacob fled into the country of Syria... and for a
--      wife he kept sheep* — recalls Genesis 29, woven here.)
--   ★ TURN AND KEEP MERCY AND JUDGMENT (THREAD 2): *Therefore turn thou to thy Elohim (God): keep mercy
--      and judgment, and wait on thy Elohim (God) continually* (Hosea 12:6). The return is TO
--      covenant-keeping — the weightier matters of the Torah. Micah names the same pair: *what doth Yahuah
--      (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim
--      (God)?* (Micah 6:8). Hosea has already said it: *I desired mercy, and not sacrifice* (Hosea 6:6).
--      Zechariah commands it: *Execute true judgment, and shew mercy and compassions every man to his
--      brother* (Zechariah 7:9). And Yahusha (Jesus) calls them by name as Torah's heart, NOT its
--      abolition: *ye... have omitted the weightier matters of the law, judgment, mercy, and faith: these
--      ought ye to have done, and not to leave the other undone* (Matthew 23:23) — the Torah kept whole,
--      its weight restored.
--   ★ THE BALANCES OF DECEIT (THREAD 3): *He is a merchant, the balances of deceit are in his hand: he
--      loveth to oppress... Yet I am become rich, I have found me out substance* (Hosea 12:7-8). The
--      false balance is named abomination by the Torah and its wisdom: *A false balance is abomination to
--      Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1); *Just balances, just weights, a
--      just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God)* (Leviticus
--      19:36); *making the ephah small, and the shekel great, and falsifying the balances by deceit*
--      (Amos 8:5). Sirach knows the merchant's snare: *Many have sinned for a small matter; and he that
--      seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1). Ephraim's self-justifying
--      wealth — *they shall find none iniquity in me* — is the lie the Torah's just weight exposes.
--   ★★ DWELL IN TABERNACLES (THREAD 4): *And I that am Yahuah Elohayka (the LORD thy God) from the land of
--      Egypt will yet make thee to dwell in tabernacles, as in the days of the solemn feast* (Hosea 12:9).
--      The appointed-time dwelling is the Torah's own command, restored not abolished: *Ye shall dwell in
--      booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42). And the
--      restoration reaches the nations: *every one that is left of all the nations which came against
--      Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva'ot (LORD of hosts),
--      and to keep the feast of tabernacles* (Zechariah 14:16). The feast Yahuah keeps from Egypt he will
--      yet make his scattered people dwell in again.
--   ★ BY A PROPHET (THREAD 5): *And by a prophet Yahuah (LORD) brought Yashar'el (Israel) out of Egypt,
--      and by a prophet was he preserved* (Hosea 12:13) — Moses, the prophetic deliverer. Moses himself
--      foretold the Prophet of whom he was the type: *Yahuah Elohayka (The LORD thy God) will raise up
--      unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall
--      hearken* (Deuteronomy 18:15); *I will raise them up a Prophet from among their brethren, like unto
--      thee, and will put my words in his mouth* (Deuteronomy 18:18). And the apostles name him fulfilled:
--      *A prophet shall Yahuah Elohaychem (the Lord your God) raise up unto you of your brethren, like
--      unto me; him shall ye hear in all things whatsoever he shall say unto you* (Acts 3:22). The
--      prophet-led exodus is the pattern of the greater Prophet's deliverance.
--   EXTRAS: Jubilees 32 (Jacob's Bethel vow and tithe — THREAD 1) and Ecclesiasticus/Sirach 27:1 (the
--      merchant's snare — THREAD 3); clean witnesses, parses verified. No extras forced on the
--      weightier-matters call, the feast, or the prophet.
--   VERSES WITH NO SEPARATE ADD: v.1 (the wind/Assyria/Egypt — lawsuit preface, prose), v.2 (the
--      controversy — preface to the Jacob-recital, woven into THREAD 1), v.10 (the prophets/similitudes —
--      preface to v.13, THREAD 5 prose), v.11 (Gilead/Gilgal altars — prose), v.12 (Jacob in Syria —
--      Genesis 29, woven into THREAD 1 prose), v.14 (the verdict-close — prose). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s328_hos12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): He had power over the angel — the One Jacob wrestled = the Formed Son
    ('canon','hosea',12,3,'canon','genesis',32,24,'free',
      E'*And Jacob was left alone; and there wrestled a man with him until the breaking of the day* (Genesis 32:24). Hosea''s *by his strength he had power with Elohim (God)* (Hosea 12:3) reaches back to this night at Jabbok: the wrestler appears as *a man*, yet Jacob will name him Elohim (God). The visible One who grappled with Jacob in the flesh of a man is the Formed Son, Yahuah seen, who has a Father.'),
    ('canon','hosea',12,4,'canon','genesis',32,28,'free',
      E'*And he said, Thy name shall be called no more Jacob, but Yashar''el (Israel): for as a prince hast thou power with Elohim (God) and with men, and hast prevailed* (Genesis 32:28). Hosea''s *he had power over the angel, and prevailed* (Hosea 12:4) is this very renaming — and the wrestler himself calls it power *with Elohim (God) and with men*. The Angel who renames Jacob is Elohim; the Formed Son bears the Name and the authority to give the new name.'),
    ('canon','hosea',12,4,'canon','genesis',32,30,'free',
      E'*And Jacob called the name of the place Peniel: for I have seen Elohim (God) face to face, and my life is preserved* (Genesis 32:30). Hosea''s *he wept, and made supplication unto him* (Hosea 12:4) is Jacob clinging at Peniel — *I have seen Elohim (God) face to face*. The One wrestled is named *Elohim (God)* outright: the visible Glory none may see and live, yet who appears as the Formed Son, who is Yahuah and has a Father.'),
    ('canon','hosea',12,4,'canon','genesis',28,12,'free',
      E'*And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it* (Genesis 28:12). Hosea''s *he found him in Beth-el, and there he spake with us* (Hosea 12:4) is the Bethel of the ladder: the gate of heaven where the angels ascend and descend and Yahuah stands above. The place where Jacob met the Formed One is the same Bethel Hosea recalls.'),
    ('canon','hosea',12,4,'canon','genesis',28,13,'free',
      E'*And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). At Bethel — *there he spake with us* (Hosea 12:4) — it is Yahuah himself who stands and speaks the seed-promise. The One who *spake* with Jacob at Bethel is the visible Yahuah, the Formed Son carrying the covenant-word of the Father.'),
    ('canon','hosea',12,4,'canon','genesis',28,19,'free',
      E'*And he called the name of that place Beth-el: but the name of that city was called Luz at the first* (Genesis 28:19). Hosea names the very place — *he found him in Beth-el* (Hosea 12:4) — the house of Elohim where Jacob met the visible One. The memorial-place of the meeting is sealed in the name Beth-el, the house of El.'),
    ('canon','hosea',12,4,'canon','genesis',35,9,'free',
      E'*And Elohim (God) appeared unto Jacob again, when he came out of Padan-aram, and blessed him* (Genesis 35:9). Hosea''s *he found him in Beth-el* (Hosea 12:4) gathers both Bethel meetings: here Elohim *appeared* a second time and blessed Jacob. The Formed Son who is seen and appears — *Elohim appeared* — is the One who met Jacob there.'),
    ('canon','hosea',12,4,'canon','genesis',35,10,'free',
      E'*And Elohim (God) said unto him, Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel)* (Genesis 35:10). Hosea''s *he had power over the angel, and prevailed* (Hosea 12:4) is sealed at Bethel in the renaming repeated: it is Elohim who speaks and names. The Angel of Peniel and the Elohim of Bethel are one — the Formed Son who gives Yashar''el (Israel) his name.'),
    ('canon','hosea',12,5,'canon','exodus',3,15,'free',
      E'*And Elohim (God) said moreover unto Moses... Yahuah Elohim (The LORD God) of your fathers... hath sent me unto you: this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). Hosea''s *Even Yahuah Elohim (the LORD God) of hosts; Yahuah (LORD) is his memorial* (Hosea 12:5) names the Bethel-wrestler by the very Name given at the bush — *this is my memorial unto all generations*. The One Jacob wrestled and the One who spoke from the bush bear the one Name, the one memorial.'),
    ('canon','hosea',12,4,'jubilees','jubilees',32,2,'extras',
      E'*And Jacob rose early in the morning, on the fourteenth of this month, and he gave a tithe of all that came with him, both of men and cattle, both of gold and every vessel and garment, yea, he gave tithes of all* (Jubilees 32:2). Hosea''s *he found him in Beth-el, and there he spake with us* (Hosea 12:4) is the Bethel where Jacob paid the vow he had vowed at the ladder. The restored witness keeps the scene: the tithe rendered at Bethel, the meeting-place with the Formed One honoured.'),

    -- THREAD 2 (★): Turn thou and keep mercy and judgment — the weightier matters; Torah-affirmed
    ('canon','hosea',12,6,'canon','micah',6,8,'free',
      E'*He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Hosea''s *keep mercy and judgment, and wait on thy Elohim (God) continually* (Hosea 12:6) is Micah''s very pair — *to do justly, and to love mercy* — the weight of the Torah, what Yahuah requires. The return is TO covenant-keeping, the law''s own heart.'),
    ('canon','hosea',12,6,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Hosea has already set the order: mercy above ritual. So *keep mercy and judgment* (Hosea 12:6) is no new word but the prophet''s settled call — *I desired mercy* — the inward keeping the Torah always meant, not its replacement.'),
    ('canon','hosea',12,6,'canon','zechariah',7,9,'free',
      E'*Thus speaketh Yahuah Tseva''ot (LORD of hosts), saying, Execute true judgment, and shew mercy and compassions every man to his brother* (Zechariah 7:9). Hosea''s *keep mercy and judgment* (Hosea 12:6) is Zechariah''s same charge — *Execute true judgment, and shew mercy* — the weightier matters Yahuah cried by the prophets. One word across the prophets: keep mercy and judgment.'),
    ('canon','hosea',12,6,'canon','matthew',23,23,'free',
      E'*Woe unto you, scribes and Pharisees, hypocrites! for ye pay tithe of mint and anise and cummin, and have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). Yahusha (Jesus) names Hosea''s pair as the Torah''s weight — *judgment, mercy* — and commands BOTH kept: *these ought ye to have done, and not to leave the other undone*. Hosea''s *keep mercy and judgment* (Hosea 12:6) is the Torah whole, never abolished, its weightier matters restored.'),

    -- THREAD 3 (★): The balances of deceit — the false merchant; Torah's commercial honesty
    ('canon','hosea',12,7,'canon','proverbs',11,1,'free',
      E'*A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1). Hosea''s *the balances of deceit are in his hand* (Hosea 12:7) is exactly what the Torah''s wisdom calls abomination — *a false balance is abomination to Yahuah (LORD)*. Ephraim the merchant carries the very thing Yahuah hates.'),
    ('canon','hosea',12,7,'canon','leviticus',19,36,'free',
      E'*Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36). Against Hosea''s *balances of deceit* (Hosea 12:7) stands the Torah''s plain command — *just balances, just weights... shall ye have* — sealed by the same self-naming Yahuah who *brought you out of the land of Egypt* (compare Hosea 12:9). The merchant''s deceit breaks a commandment of the covenant.'),
    ('canon','hosea',12,7,'canon','amos',8,5,'free',
      E'*Saying, When will the new moon be gone, that we may sell corn? and the sabbath, that we may set forth wheat, making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5). Amos paints Hosea''s merchant exactly — *falsifying the balances by deceit* — the greedy heart that resents the new moon and the sabbath for interrupting gain. Hosea''s *balances of deceit are in his hand* (Hosea 12:7) is the same sin the northern kingdom''s prophet exposes.'),
    ('canon','hosea',12,8,'apocrypha','ecclesiasticus',27,1,'extras',
      E'*Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1). Ephraim''s boast — *Yet I am become rich, I have found me out substance: in all my labours they shall find none iniquity in me* (Hosea 12:8) — is the very self-blinding Sirach names: *he that seeks for abundance will turn his eyes away*. The pursuit of gain hides the sin from the sinner''s own sight.'),

    -- THREAD 4 (★★): I will yet make thee to dwell in tabernacles — Sukkot restored, NOT abolished
    ('canon','hosea',12,9,'canon','leviticus',23,42,'free',
      E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42). Hosea''s *I... will yet make thee to dwell in tabernacles, as in the days of the solemn feast* (Hosea 12:9) is the Torah''s own appointed time held out as the promise of restoration — *ye shall dwell in booths*. The feast is not abolished but waiting to be dwelt in again.'),
    ('canon','hosea',12,9,'canon','zechariah',14,16,'free',
      E'*And it shall come to pass, that every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). Hosea''s promise to *dwell in tabernacles, as in the days of the solemn feast* (Hosea 12:9) reaches its end in Zechariah: the very nations come up *to keep the feast of tabernacles*. The booth-dwelling Yahuah restores to his scattered people becomes the worship of all the earth.'),

    -- THREAD 5 (★): By a prophet — Moses the deliverer = the type of the Prophet like Moses
    ('canon','hosea',12,13,'canon','deuteronomy',18,15,'free',
      E'*Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15). Hosea''s *by a prophet Yahuah (LORD) brought Yashar''el (Israel) out of Egypt* (Hosea 12:13) names Moses the prophetic deliverer — and Moses himself foretold the greater Prophet *like unto me*. The exodus-prophet is the pattern of the One to come.'),
    ('canon','hosea',12,13,'canon','deuteronomy',18,18,'free',
      E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). Hosea''s *by a prophet was he preserved* (Hosea 12:13) recalls the prophet whose mouth carried Yahuah''s word — and Yahuah promises another *like unto thee* with the words in his mouth. The deliverance by the prophetic word foreshadows the Prophet of the final exodus.'),
    ('canon','hosea',12,13,'canon','acts',3,22,'free',
      E'*For Moses truly said unto the fathers, A prophet shall Yahuah Elohaychem (the Lord your God) raise up unto you of your brethren, like unto me; him shall ye hear in all things whatsoever he shall say unto you* (Acts 3:22). The apostles name the Prophet fulfilled — the One greater than the Moses by whom *Yahuah (LORD) brought Yashar''el (Israel) out of Egypt* (Hosea 12:13). The prophet-led deliverance Hosea recalls finds its consummation in the Prophet whom *ye hear in all things*.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-12-he-had-power-over-the-angel-the-formed-son',
       E'He Had Power Over the Angel — the One Jacob Wrestled Is the Formed Son',
       E'Hosea sends his lawsuit straight back to the patriarch Jacob, and in doing so names a mystery: *He took his brother by the heel in the womb, and by his strength he had power with Elohim (God): Yea, he had power over the angel, and prevailed: he wept, and made supplication unto him: he found him in Beth-el, and there he spake with us; Even Yahuah Elohim (the LORD God) of hosts; Yahuah (LORD) is his memorial* (Hosea 12:3-5). The One Jacob wrestled is named BOTH *Elohim (God)* AND *the angel*. Genesis records the wrestler first as *a man*: *And Jacob was left alone; and there wrestled a man with him until the breaking of the day* (Genesis 32:24). Yet that man renames Jacob with divine authority — *Thy name shall be called no more Jacob, but Yashar''el (Israel): for as a prince hast thou power with Elohim (God) and with men, and hast prevailed* (Genesis 32:28) — and Jacob names the place by what he saw: *Peniel: for I have seen Elohim (God) face to face, and my life is preserved* (Genesis 32:30). The visible One who appears as a man, who is named the angel and yet is Elohim, who bears the Name and gives the new name, is the Formed Son — Yahuah seen face to face, who is Yahuah and HAS a Father (the Formed and the Formless; not co-equal trinitarian persons, not modalism). The Bethel where *there he spake with us* is the Bethel of the ladder: *behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it* (Genesis 28:12), where *Yahuah (LORD) stood above it* and spoke the seed-promise (Genesis 28:13), the place Jacob called *Beth-el* (Genesis 28:19); and the Bethel of the second appearing: *And Elohim (God) appeared unto Jacob again... and blessed him* (Genesis 35:9), repeating the new name — *Yashar''el (Israel) shall be thy name* (Genesis 35:10). And the Name Hosea gives this One — *Yahuah (LORD) is his memorial* (Hosea 12:5) — is the Name given at the bush: *this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). The restored witness keeps the meeting-place: *Jacob rose early in the morning... and he gave a tithe of all that came with him* (Jubilees 32:2), the Bethel vow honoured. The lawsuit against Ephraim is rooted in mercy: the very people under judgment are the seed of the man who clung to the Formed One and prevailed.',
       sv.verse_id, ev.verse_id, 'extras', 44975
  FROM _s328_hos12_lookup sv, _s328_hos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-12-turn-thou-and-keep-mercy-and-judgment',
       E'Turn Thou and Keep Mercy and Judgment — the Weightier Matters',
       E'In the midst of the lawsuit comes the call to return: *Therefore turn thou to thy Elohim (God): keep mercy and judgment, and wait on thy Elohim (God) continually* (Hosea 12:6). The return is not away from the covenant but INTO it — to KEEP *mercy and judgment*, the weightier matters of the Torah. Micah names the same pair as the sum of what Yahuah requires: *He hath shewed thee, O man, what is good; and what doth Yahuah (LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohim (God)?* (Micah 6:8). Hosea has already taught the order — *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Zechariah cries the same charge by the former prophets: *Execute true judgment, and shew mercy and compassions every man to his brother* (Zechariah 7:9). And Yahusha (Jesus) names this very pair as the weight of the law — and commands BOTH parts kept: *ye... have omitted the weightier matters of the law, judgment, mercy, and faith: these ought ye to have done, and not to leave the other undone* (Matthew 23:23). The weightier matters are not a substitute for the Torah but its inward heart; the return Hosea calls for is the Torah kept whole, never abolished.',
       sv.verse_id, ev.verse_id, 'free', 44978
  FROM _s328_hos12_lookup sv, _s328_hos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-12-the-balances-of-deceit-are-in-his-hand',
       E'The Balances of Deceit — the False Merchant and the Just Weight',
       E'Ephraim is arraigned as a crooked trader: *He is a merchant, the balances of deceit are in his hand: he loveth to oppress. And Ephraim said, Yet I am become rich, I have found me out substance: in all my labours they shall find none iniquity in me that were sin* (Hosea 12:7-8). The false balance is precisely what the Torah and its wisdom call abomination: *A false balance is abomination to Yahuah (LORD): but a just weight is his delight* (Proverbs 11:1); *Just balances, just weights, a just ephah, and a just hin, shall ye have: I am Yahuah Elohaychem (the LORD your God), which brought you out of the land of Egypt* (Leviticus 19:36). Amos, prophet to the same northern kingdom, paints the merchant exactly: *making the ephah small, and the shekel great, and falsifying the balances by deceit* (Amos 8:5). And the restored wisdom of Sirach names the self-blinding of greed: *Many have sinned for a small matter; and he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1). Ephraim''s boast — *they shall find none iniquity in me* — is the very lie the just weight exposes: the pursuit of gain hides the sin from the sinner''s own eyes. The covenant''s commercial honesty is not optional piety; it is a commandment, and its breach is sin.',
       sv.verse_id, ev.verse_id, 'extras', 44981
  FROM _s328_hos12_lookup sv, _s328_hos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-12-i-will-yet-make-thee-to-dwell-in-tabernacles',
       E'I Will Yet Make Thee to Dwell in Tabernacles — Sukkot Restored',
       E'Against the merchant''s self-made wealth, Yahuah sets his own claim and his own feast: *And I that am Yahuah Elohayka (the LORD thy God) from the land of Egypt will yet make thee to dwell in tabernacles, as in the days of the solemn feast* (Hosea 12:9). The booth-dwelling is the Torah''s appointed time, the feast of Tabernacles: *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42). Far from abolished, it is held out as the very shape of restoration — Yahuah will *yet* make his scattered people dwell in booths again, *as in the days of the solemn feast*. And the feast reaches its consummation when the nations themselves come up to keep it: *every one that is left of all the nations which came against Jerusalem shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The appointed time Yahuah has kept with his people from Egypt becomes, in the end, the worship of all the earth.',
       sv.verse_id, ev.verse_id, 'free', 44984
  FROM _s328_hos12_lookup sv, _s328_hos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-12-by-a-prophet-yahuah-brought-yashar-el-out',
       E'By a Prophet Yahuah Brought Yashar''el Out — the Prophet Like Moses',
       E'Hosea grounds the deliverance not in might but in the prophetic word: *And by a prophet Yahuah (LORD) brought Yashar''el (Israel) out of Egypt, and by a prophet was he preserved* (Hosea 12:13). The prophet is Moses, the one through whose mouth Yahuah led and kept his people. And Moses himself foretold the greater Prophet of whom he was the type: *Yahuah Elohayka (The LORD thy God) will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken* (Deuteronomy 18:15); *I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The apostles name this Prophet fulfilled in Yahusha (Jesus): *A prophet shall Yahuah Elohaychem (the Lord your God) raise up unto you of your brethren, like unto me; him shall ye hear in all things whatsoever he shall say unto you* (Acts 3:22). The prophet-led exodus Hosea recalls is the pattern of the final deliverance by the Prophet whose word must be heard in all things.',
       sv.verse_id, ev.verse_id, 'free', 44987
  FROM _s328_hos12_lookup sv, _s328_hos12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (12,3,'canon','genesis',32,24,1,E'*there wrestled a man with him until the breaking of the day* (Genesis 32:24) — the wrestler appears as a man; Jacob will name him Elohim.'),
    (12,4,'canon','genesis',32,28,2,E'*as a prince hast thou power with Elohim (God) and with men, and hast prevailed* (Genesis 32:28) — the wrestler renames Jacob with divine authority.'),
    (12,4,'canon','genesis',32,30,3,E'*Peniel: for I have seen Elohim (God) face to face* (Genesis 32:30) — the One wrestled is named Elohim outright.'),
    (12,4,'canon','genesis',28,12,4,E'*a ladder... the angels of Elohim (God) ascending and descending* (Genesis 28:12) — the Bethel where Jacob met the Formed One.'),
    (12,4,'canon','genesis',28,13,5,E'*Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God)* (Genesis 28:13) — Yahuah himself speaks the seed-promise at Bethel.'),
    (12,4,'canon','genesis',28,19,6,E'*he called the name of that place Beth-el* (Genesis 28:19) — the place Hosea names, the house of El.'),
    (12,4,'canon','genesis',35,9,7,E'*Elohim (God) appeared unto Jacob again... and blessed him* (Genesis 35:9) — the visible One appears a second time at Bethel.'),
    (12,4,'canon','genesis',35,10,8,E'*Yashar''el (Israel) shall be thy name* (Genesis 35:10) — Elohim repeats the new name at Bethel.'),
    (12,5,'canon','exodus',3,15,9,E'*this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15) — the Name Hosea gives the wrestler is the Name from the bush.'),
    (12,4,'jubilees','jubilees',32,2,10,E'*Jacob... gave a tithe of all that came with him* (Jubilees 32:2) — the restored witness keeps the Bethel vow paid. [extras]')
  ) AS m(_chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='hosea-12-he-had-power-over-the-angel-the-formed-son'
  JOIN _s328_hos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (12,6,'canon','micah',6,8,1,E'*to do justly, and to love mercy, and to walk humbly with thy Elohim (God)* (Micah 6:8) — the weightier matters as the sum of what Yahuah requires.'),
    (12,6,'canon','hosea',6,6,2,E'*I desired mercy, and not sacrifice* (Hosea 6:6) — mercy above ritual, the prophet''s settled call.'),
    (12,6,'canon','zechariah',7,9,3,E'*Execute true judgment, and shew mercy and compassions* (Zechariah 7:9) — the same charge cried by the prophets.'),
    (12,6,'canon','matthew',23,23,4,E'*the weightier matters of the law, judgment, mercy, and faith... not to leave the other undone* (Matthew 23:23) — Yahusha keeps the Torah whole.')
  ) AS m(_chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='hosea-12-turn-thou-and-keep-mercy-and-judgment'
  JOIN _s328_hos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (12,7,'canon','proverbs',11,1,1,E'*A false balance is abomination to Yahuah (LORD)* (Proverbs 11:1) — the deceitful balance the merchant carries.'),
    (12,7,'canon','leviticus',19,36,2,E'*Just balances, just weights... shall ye have* (Leviticus 19:36) — the Torah''s plain command against the merchant''s deceit.'),
    (12,7,'canon','amos',8,5,3,E'*falsifying the balances by deceit* (Amos 8:5) — Amos paints the same northern merchant exactly.'),
    (12,8,'apocrypha','ecclesiasticus',27,1,4,E'*he that seeks for abundance will turn his eyes away* (Ecclesiasticus 27:1) — the self-blinding of Ephraim''s boast. [extras]')
  ) AS m(_chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='hosea-12-the-balances-of-deceit-are-in-his-hand'
  JOIN _s328_hos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (12,9,'canon','leviticus',23,42,1,E'*Ye shall dwell in booths seven days* (Leviticus 23:42) — the Torah''s feast held out as restoration.'),
    (12,9,'canon','zechariah',14,16,2,E'*the nations... to keep the feast of tabernacles* (Zechariah 14:16) — the booth-dwelling becomes the worship of all the earth.')
  ) AS m(_chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='hosea-12-i-will-yet-make-thee-to-dwell-in-tabernacles'
  JOIN _s328_hos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (12,13,'canon','deuteronomy',18,15,1,E'*will raise up unto thee a Prophet... like unto me* (Deuteronomy 18:15) — Moses foretells the greater Prophet.'),
    (12,13,'canon','deuteronomy',18,18,2,E'*will put my words in his mouth* (Deuteronomy 18:18) — the Prophet who carries Yahuah''s word.'),
    (12,13,'canon','acts',3,22,3,E'*A prophet shall Yahuah Elohaychem raise up... him shall ye hear in all things* (Acts 3:22) — the Prophet fulfilled in Yahusha.')
  ) AS m(_chap,src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='hosea-12-by-a-prophet-yahuah-brought-yashar-el-out'
  JOIN _s328_hos12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=12 AND sv.verse_number=m.src_v
  JOIN _s328_hos12_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_13.sql (Hosea 13) -----
-- Chapter: Hosea 13 — EPHRAIM'S DEATH AND THE CONQUEST OF DEATH. The chapter turns on two keystones:
-- the sole-Saviour declaration *Yet I am Yahuah Elohayka (the LORD thy God) from the land of Egypt,
-- and thou shalt know no god but me: for there is no saviour beside me* (13:4), and the ransom from
-- Sheol *I will ransom them from the power of the grave; I will redeem them from death: O death, I
-- will be thy plagues; O grave, I will be thy destruction* (13:14) — which Paul quotes outright at
-- the resurrection (1 Corinthians 15:54-55). Ephraim exalted himself, then died through Baal (13:1);
-- the calf again, the molten images (13:2 -> Exodus 32); the wicked are the morning cloud, the chaff,
-- the smoke (13:3 -> Psalm 1, Psalm 68); Yahuah knew them in the wilderness then they were filled and
-- forgot him (13:5-6 -> Deuteronomy 8); *O Yashar'el (Israel), thou hast destroyed thyself; but in me
-- is thine help* (13:9); the king given in anger (13:10-11 -> 1 Samuel 8). The Formed/Formless lens:
-- Yahuah the only Saviour, the salvation worked in the Formed Son who has the keys of death (Rev 1:18,
-- 2 Tim 1:10). Two-house lens: Ephraim is the northern house, the lost sheep helped by Yahuah alone.
-- Tag: hos13   Temp view: _s328_hos13_lookup   Session prefix: s328
-- Sort band: base 45000, step 3 -> threads at 45000, 45003, 45006, 45009, 45012, 45015, 45018 (7 threads)
-- Source of EVERY row: 'canon','hosea',13,v
--
-- Hosea 13 coverage:
--   v.1 (when he offended in Baal, he died)
--        NT: none warranted (woven into the death/help prose)  Extras: none  Tanakh: held in prose w/ 13:9
--   ★ v.2 (molten images... Let the men that sacrifice kiss the calves)
--        NT: none warranted   Extras: none warranted
--        Tanakh: ★ Exodus 32:4 (made a molten calf... These be thy gods, O Yashar'el) — THREAD 4
--   ★ v.3 (as the morning cloud... the chaff that is driven with the whirlwind... the smoke out of the chimney)
--        NT: none warranted distinct
--        Extras: none warranted
--        Tanakh: ★ Psalm 1:4 (the chaff which the wind driveth away), ★ Psalm 68:2 (As smoke is driven
--                away... so let the wicked perish) — THREAD 5
--   ★★ v.4 (I am Yahuah Elohayka... thou shalt know no god but me: for there is no saviour beside me) KEYSTONE
--        NT: ★★ Acts 4:12 (neither is there salvation in any other) — THREAD 1
--        Extras: none warranted (the canon sole-Saviour weave is its own fullest witness)
--        Tanakh: ★★ Isaiah 43:11 (beside me there is no saviour), ★★ Isaiah 45:21 (a Saviour; there is
--                none beside me), ★ Exodus 20:2-3 (I am Yahuah... no other gods) — THREAD 1
--   v.5-6 (I did know thee in the wilderness... they were filled, and their heart was exalted; therefore
--          have they forgotten me)
--        NT: none warranted
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 8:11 (forget not Yahuah... in not keeping his commandments), ★ Deuteronomy
--                8:14 (thine heart be lifted up, and thou forget Yahuah) — THREAD 6
--   v.7-8 (a lion... a leopard... a bear that is bereaved) — held in prose (the lawsuit-judgment)
--   ★ v.9 (O Yashar'el, thou hast destroyed thyself; but in me is thine help)
--        NT: none warranted distinct   Extras: none warranted
--        Tanakh: woven w/ v.10-11 in THREAD 7 (self-wrought ruin, help only in Yahuah)
--   v.10-11 (where is now thy king?... I gave thee a king in mine anger)
--        NT: none warranted
--        Extras: none warranted
--        Tanakh: ★ 1 Samuel 8:7 (they have not rejected thee, but they have rejected me) — THREAD 7
--   v.12-13 (the iniquity bound up... the sorrows of a travailing woman) — held in prose
--   ★★★ v.14 (I will ransom them from the power of the grave... O death, I will be thy plagues; O grave,
--          I will be thy destruction) KEYSTONE — quoted in 1 Corinthians 15
--        NT: ★★★ 1 Corinthians 15:54 (Death is swallowed up in victory), ★★★ 1 Corinthians 15:55 (O death,
--                where is thy sting? O grave, where is thy victory?), ★★ Revelation 1:18 (have the keys of
--                hell and of death), ★★ 2 Timothy 1:10 (who hath abolished death) — THREAD 2
--        Extras: ★★ 1 Enoch 51:1 (Sheol also shall give back that which it has received), ★ Wisdom of
--                Solomon 3:1 (the souls of the righteous are in the hand of Yahuah), Wisdom 3:4 (their
--                hope full of immortality) — THREAD 3
--        Tanakh: ★★ Isaiah 25:8 (He will swallow up death in victory) — THREAD 2
--   v.15-16 (the east wind... Samaria shall become desolate) — held in prose (the spoiling judgment)
--
-- Threads (slug — target libraries):
--   1. hosea-13-there-is-no-saviour-beside-me — NT (Acts 4) + Tanakh (Isaiah 43, Isaiah 45, Exodus 20) [free]
--      (★★ the exclusive sole Saviour; the first commandment; salvation in no other — Formed/Formless)
--   2. hosea-13-o-death-i-will-be-thy-plagues — NT (1 Corinthians 15, Revelation 1, 2 Timothy 1) + Tanakh (Isaiah 25) [free]
--      (★★★ the ransom from Sheol, the conquest of death — quoted by Paul at the resurrection)
--   3. hosea-13-sheol-shall-give-back-the-ransom-from-the-grave — Extras (1 Enoch 51, Wisdom of Solomon 3) [extras]
--      (★★ the restored witness on the grave giving back its dead; the hope full of immortality)
--   4. hosea-13-let-the-men-that-sacrifice-kiss-the-calves — Tanakh (Exodus 32) [free]
--      (★ the molten calf again; the craftsmen's idol the people kiss)
--   5. hosea-13-as-the-chaff-and-the-smoke-the-fleeting-wicked — Tanakh (Psalm 1, Psalm 68) [free]
--      (★ the morning cloud, the chaff, the smoke — the wicked driven away)
--   6. hosea-13-they-were-filled-and-forgot-me — Tanakh (Deuteronomy 8) [free]
--      (★ the danger of fullness; filled, exalted, and forgetting Yahuah)
--   7. hosea-13-thou-hast-destroyed-thyself-but-in-me-is-thine-help — Tanakh (1 Samuel 8) [free]
--      (★ self-wrought ruin, help only in Yahuah; the king demanded in rejection of Yahuah's reign)
--
-- Framing notes:
--   ★★ NO SAVIOUR BESIDE ME (THREAD 1): *Yet I am Yahuah Elohayka (the LORD thy God) from the land of
--      Egypt, and thou shalt know no god but me: for there is no saviour beside me* (13:4). This is the
--      first commandment restated as a lawsuit (Exodus 20:2-3) and Isaiah's own refrain: *I, even I, am
--      Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11); *a just Elohim (God) and a
--      Saviour; there is none beside me* (Isaiah 45:21). The apostles name where that one salvation is
--      worked: *Neither is there salvation in any other* (Acts 4:12) — the salvation of the only Saviour
--      Yahuah, accomplished in the Formed Son. NOT two saviours; one Saviour, the Formed expression of
--      the Formless Father.
--   ★★★ O DEATH, I WILL BE THY PLAGUES (THREAD 2): *I will ransom them from the power of the grave; I
--      will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction*
--      (13:14). Paul quotes it verbatim at the resurrection: *Death is swallowed up in victory. O death,
--      where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:54-55) — fused with Isaiah's
--      *He will swallow up death in victory* (Isaiah 25:8). The Formed Son holds the keys: *I am alive
--      for evermore... and have the keys of hell and of death* (Revelation 1:18); *who hath abolished
--      death, and hath brought life and immortality to light* (2 Timothy 1:10). The ransom from Sheol is
--      the resurrection hope itself.
--   ★★ SHEOL GIVES BACK (THREAD 3, extras): the restored witness sings the same redemption from the
--      grave — *Sheol also shall give back that which it has received* (1 Enoch 51:1); *the souls of the
--      righteous are in the hand of Yahuah (God)... their hope full of immortality* (Wisdom of Solomon
--      3:1,4). Clean parses, woven on the ransom-from-the-grave keystone.
--   ★ THE CALF AGAIN (THREAD 4): *Let the men that sacrifice kiss the calves* (13:2) reaches back to
--      Sinai's molten calf — *he... made a molten calf: and they said, These be thy gods, O Yashar'el
--      (Israel)* (Exodus 32:4). The same craftsman's idol, the same Egypt-redemption attributed to a
--      calf; Ephraim's exaltation-and-death is Sinai's sin perpetuated.
--   ★ THE FLEETING WICKED (THREAD 5): *as the chaff that is driven with the whirlwind... and as the
--      smoke out of the chimney* (13:3) — *the chaff which the wind driveth away* (Psalm 1:4); *As smoke
--      is driven away... so let the wicked perish* (Psalm 68:2). The wicked have no standing.
--   ★ FILLED AND FORGOT (THREAD 6): *they were filled, and their heart was exalted; therefore have they
--      forgotten me* (13:6) is the Deuteronomy 8 warning realized — *Beware that thou forget not Yahuah
--      Elohayka (the LORD thy God), in not keeping his commandments* (Deut 8:11); *thine heart be lifted
--      up, and thou forget Yahuah* (Deut 8:14). Torah-affirmed: forgetting is failing to keep the
--      commandments.
--   ★ DESTROYED THYSELF (THREAD 7): *O Yashar'el (Israel), thou hast destroyed thyself; but in me is
--      thine help* (13:9) — self-wrought ruin, help in Yahuah alone. The king demanded *in mine anger*
--      (13:11) is 1 Samuel 8: *they have not rejected thee, but they have rejected me, that I should not
--      reign over them* (1 Samuel 8:7). The two-house lost sheep, victim of its own sin, helped by Yahuah.
--   VERSES WITH NO SEPARATE ADD: v.1 (woven w/ death/help prose), v.5 (preface to v.6, THREAD 6),
--      v.7-8 (the lion/leopard/bear lawsuit-judgment — held in prose), v.10-11 partial (v.10 woven into
--      THREAD 7 w/ 1 Sam 8), v.12-13 (iniquity bound, travail — held in prose), v.15-16 (the east wind,
--      Samaria's fall — the spoiling judgment, held in prose). All weighed, none silently skipped.

CREATE TEMP VIEW _s328_hos13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): there is no saviour beside me — the exclusive sole Saviour
    ('canon','hosea',13,4,'canon','isaiah',43,11,'free',
      E'*I, even I, am Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11). Hosea''s *thou shalt know no god but me: for there is no saviour beside me* (Hosea 13:4) is Isaiah''s very refrain — one Saviour, and no other. The God who redeemed Yashar''el (Israel) from Egypt is the only one who saves; every Baal and calf is a god that cannot save.'),
    ('canon','hosea',13,4,'canon','isaiah',45,21,'free',
      E'*who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21). The sole-Saviour word of *there is no saviour beside me* (Hosea 13:4) is Isaiah''s declaration over all the ends of the earth — *a just Elohim (God) and a Saviour; there is none beside me*. One Saviour over Yahudah (Judah) and the scattered house alike.'),
    ('canon','hosea',13,4,'canon','exodus',20,2,'free',
      E'*I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2). Hosea quotes the Sinai preface word for word — *I am Yahuah Elohayka (the LORD thy God) from the land of Egypt* (Hosea 13:4). The first commandment is the lawsuit: the God of the Exodus is the only God, and *thou shalt know no god but me*.'),
    ('canon','hosea',13,4,'canon','exodus',20,3,'free',
      E'*Thou shalt have no other gods before me* (Exodus 20:3). *Thou shalt know no god but me: for there is no saviour beside me* (Hosea 13:4) is the first commandment turned against Ephraim''s Baal-worship; to take another god is to take a saviour that is no saviour, and the Torah''s first word stands.'),
    ('canon','hosea',13,4,'canon','acts',4,12,'free',
      E'*Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The sole-Saviour confession *there is no saviour beside me* (Hosea 13:4) is where the apostles plant the one salvation — *neither is there salvation in any other*. The Formed Son does not add a second Saviour; he IS the salvation of the one Saviour Yahuah, the Name under heaven by which we are saved.'),

    -- THREAD 2 (★★★): O death, I will be thy plagues — the ransom from the grave, conquest of death
    ('canon','hosea',13,14,'canon','1-corinthians',15,55,'free',
      E'*O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55). Paul takes up Hosea''s own taunt — *O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14) — and turns it into the resurrection''s triumph cry. The promise to ransom from the power of the grave is answered when death is undone; its sting and its victory are gone.'),
    ('canon','hosea',13,14,'canon','1-corinthians',15,54,'free',
      E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). *I will ransom them from the power of the grave; I will redeem them from death* (Hosea 13:14) is *the saying that is written* fulfilled — death not merely escaped but swallowed up. The redemption from Sheol is the resurrection itself.'),
    ('canon','hosea',13,14,'canon','isaiah',25,8,'free',
      E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). Hosea''s *O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14) is the same conquest Isaiah sees — *He will swallow up death in victory*. The two prophets and Paul (1 Corinthians 15:54) speak one death-swallowing word; the grave is destroyed, not appeased.'),
    ('canon','hosea',13,14,'canon','revelation',1,18,'free',
      E'*I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death* (Revelation 1:18). The One who said *O grave, I will be thy destruction* (Hosea 13:14) now *liveth* and *hath the keys of hell and of death* — the Formed Son who tasted death and rose holds the power over Sheol that Hosea promised. The ransom from the grave is in his hand.'),
    ('canon','hosea',13,14,'canon','2-timothy',1,10,'free',
      E'*But is now made manifest by the appearing of our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). *I will redeem them from death: O death, I will be thy plagues* (Hosea 13:14) is made manifest in the Saviour who *hath abolished death* — and note the title: *our Saviour*, the one Saviour of Hosea 13:4 working the conquest of death promised in 13:14.'),

    -- THREAD 3 (★★, extras): Sheol shall give back — the ransom from the grave in the restored witness
    ('canon','hosea',13,14,'enoch','1-enoch',51,1,'extras',
      E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes* (1 Enoch 51:1). Hosea''s *I will ransom them from the power of the grave* (Hosea 13:14) is the restored witness''s resurrection morning — *Sheol also shall give back that which it has received*. The grave does not keep what Yahuah has ransomed; it gives back its dead.'),
    ('canon','hosea',13,14,'apocrypha','the-wisdom-of-solomon',3,1,'extras',
      E'*But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1). Those redeemed *from the power of the grave* (Hosea 13:14) are *in the hand of Yahuah (God)* — death has no hold where Yahuah has reached to ransom. The grave''s destruction is the righteous kept in his hand.'),
    ('canon','hosea',13,14,'apocrypha','the-wisdom-of-solomon',3,4,'extras',
      E'*For though they be punished in the sight of men, yet is their hope full of immortality* (Wisdom of Solomon 3:4). *I will redeem them from death* (Hosea 13:14) is the very *hope full of immortality* — what looks like death in the sight of men is, for those Yahuah redeems, the threshold of immortality. The ransom from Sheol is their certain hope.'),

    -- THREAD 4 (★): the calf again — Let the men that sacrifice kiss the calves
    ('canon','hosea',13,2,'canon','exodus',32,4,'free',
      E'*And he received them at their hand, and fashioned it with a graving tool, after he had made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4). Hosea''s *molten images... Let the men that sacrifice kiss the calves* (Hosea 13:2) is Sinai''s calf perpetuated — the same craftsman''s work, the same calf credited with the Egypt-redemption that belongs to Yahuah alone. Ephraim never left the foot of the mountain.'),

    -- THREAD 5 (★): the fleeting wicked — the chaff and the smoke
    ('canon','hosea',13,3,'canon','psalms',1,4,'free',
      E'*The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4). Hosea''s wicked are *as the chaff that is driven with the whirlwind out of the floor* (Hosea 13:3) — the very figure of Psalm 1: *the chaff which the wind driveth away*. The wicked have no root and no standing; the wind carries them off.'),
    ('canon','hosea',13,3,'canon','psalms',68,2,'free',
      E'*As smoke is driven away, so drive them away: as wax melteth before the fire, so let the wicked perish at the presence of Elohim (God)* (Psalm 68:2). Hosea''s *the smoke out of the chimney* (Hosea 13:3) is the psalm''s *As smoke is driven away* — the wicked vanish before Yahuah like smoke and morning cloud, here one moment and gone.'),

    -- THREAD 6 (★): filled and forgot me — the danger of fullness (Deuteronomy 8)
    ('canon','hosea',13,6,'canon','deuteronomy',8,11,'free',
      E'*Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes, which I command thee this day* (Deuteronomy 8:11). Hosea''s *they were filled, and their heart was exalted; therefore have they forgotten me* (Hosea 13:6) is exactly the danger Moses warned of — and the Torah names what forgetting IS: *not keeping his commandments, and his judgments, and his statutes*. To forget Yahuah is to abandon the commandments.'),
    ('canon','hosea',13,6,'canon','deuteronomy',8,14,'free',
      E'*Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 8:14). Hosea''s *their heart was exalted; therefore have they forgotten me* (Hosea 13:6) is Moses'' warning come to pass word for word — the heart *lifted up*, Yahuah *forgotten*. Fullness without remembrance is the road to Baal.'),

    -- THREAD 7 (★): thou hast destroyed thyself — self-wrought ruin, the king in rejection of Yahuah
    ('canon','hosea',13,10,'canon','1-samuel',8,7,'free',
      E'*And Yahuah (LORD) said unto Samuel, Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). Hosea''s taunt *where is now thy king?... Give me a king and princes?* (Hosea 13:10) reaches back to the day the king was demanded — and Yahuah named it as rejection of his own reign: *they have rejected me, that I should not reign over them*. The king *given in mine anger* (13:11) was the answer to that rejection. *O Yashar''el (Israel), thou hast destroyed thyself; but in me is thine help* (13:9) — the ruin is self-wrought, the help is Yahuah alone.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-there-is-no-saviour-beside-me',
       E'There is no saviour beside me — the exclusive sole Saviour',
       E'In the midst of Ephraim''s idolatry Yahuah restates the first commandment as a lawsuit: *Yet I am Yahuah Elohayka (the LORD thy God) from the land of Egypt, and thou shalt know no god but me: for there is no saviour beside me* (Hosea 13:4). This is Sinai word for word — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2), *Thou shalt have no other gods before me* (Exodus 20:3). It is Isaiah''s refrain — *I, even I, am Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11); *a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21). And it is where the apostles plant the one salvation: *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The Formed Son is not a second Saviour beside Yahuah; he is the salvation of the one Saviour — the expressed Word of the Formless Father, the Name under heaven by which the one Saviour saves. Every Baal, every calf, is *a god that cannot save* (Isaiah 45:20).',
       sv.verse_id, ev.verse_id, 'free', 45000
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-o-death-i-will-be-thy-plagues',
       E'O death, I will be thy plagues — the ransom from the grave, the conquest of death',
       E'From the heart of a judgment chapter rises the canon''s great resurrection word: *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes* (Hosea 13:14). Paul takes the taunt up by name at the resurrection of the dead: *So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory. O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:54-55) — fused with Isaiah''s *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). The grave is not pacified but DESTROYED. And the One who works it is the Formed Son who tasted death and rose: *I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death* (Revelation 1:18); *our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death, and hath brought life and immortality to light through the gospel* (2 Timothy 1:10). Hosea 13:4 named the only Saviour; Hosea 13:14 shows him conquering death — one Saviour, the ransom from Sheol.',
       sv.verse_id, ev.verse_id, 'free', 45003
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-sheol-shall-give-back-the-ransom-from-the-grave',
       E'Sheol shall give back — the ransom from the grave in the restored witness',
       E'The promise *I will ransom them from the power of the grave; I will redeem them from death* (Hosea 13:14) is sung in the restored library as the certain resurrection. The Similitudes of Enoch see the morning the grave gives back its dead: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes* (1 Enoch 51:1). The grave keeps nothing Yahuah has ransomed. And the Wisdom of Solomon holds the redeemed safe past death: *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1); *For though they be punished in the sight of men, yet is their hope full of immortality* (Wisdom of Solomon 3:4). What looks like death to the world is, for those Yahuah has redeemed *from death*, the threshold of an immortality already secured — the ransom from Sheol made the hope of the righteous.',
       sv.verse_id, ev.verse_id, 'extras', 45006
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-let-the-men-that-sacrifice-kiss-the-calves',
       E'Let the men that sacrifice kiss the calves — the molten calf again',
       E'Ephraim''s idolatry is Sinai''s sin perpetuated: *And now they sin more and more, and have made them molten images of their silver, and idols according to their own understanding, all of it the work of the craftsmen: they say of them, Let the men that sacrifice kiss the calves* (Hosea 13:2). The calf is no new thing — it is the molten calf of the mountain: *he received them at their hand, and fashioned it with a graving tool, after he had made it a molten calf: and they said, These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4). The same craftsman''s work, the same calf falsely credited with the Egypt-redemption that belongs to Yahuah alone — the very redemption Hosea 13:4 reclaims: *I am Yahuah Elohayka (the LORD thy God) from the land of Egypt*. Ephraim never left the foot of Sinai; the calf they kiss is the calf they were forgiven, taken up again.',
       sv.verse_id, ev.verse_id, 'free', 45009
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-as-the-chaff-and-the-smoke-the-fleeting-wicked',
       E'As the chaff and the smoke — the fleeting wicked driven away',
       E'The end of the idolaters is to vanish without a trace: *Therefore they shall be as the morning cloud, and as the early dew that passeth away, as the chaff that is driven with the whirlwind out of the floor, and as the smoke out of the chimney* (Hosea 13:3). These are the psalms'' own figures for the wicked. *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4) — rootless, no standing in the judgment. *As smoke is driven away, so drive them away: as wax melteth before the fire, so let the wicked perish at the presence of Elohim (God)* (Psalm 68:2). Cloud, dew, chaff, smoke — every image is of a thing here one moment and gone the next. Ephraim, who *exalted himself* (13:1), comes to nothing before Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 45012
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-they-were-filled-and-forgot-me',
       E'They were filled and forgot me — the danger of fullness',
       E'Yahuah knew Ephraim in the wilderness, but the gift became the snare: *According to their pasture, so were they filled; they were filled, and their heart was exalted; therefore have they forgotten me* (Hosea 13:6). This is the Deuteronomy 8 warning realized to the letter — Moses foresaw exactly this danger of the full heart: *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes, which I command thee this day* (Deuteronomy 8:11); *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God), which brought thee forth out of the land of Egypt, from the house of bondage* (Deuteronomy 8:14). Note what the Torah says forgetting IS: *not keeping his commandments, and his judgments, and his statutes*. To forget Yahuah is not a feeling — it is to abandon his commandments. Fullness without remembrance is the road that ends at the calf and Baal.',
       sv.verse_id, ev.verse_id, 'free', 45015
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-13-thou-hast-destroyed-thyself-but-in-me-is-thine-help',
       E'Thou hast destroyed thyself, but in me is thine help — the king in rejection of Yahuah',
       E'The verdict on Ephraim is also the offer of mercy: *O Yashar''el (Israel), thou hast destroyed thyself; but in me is thine help* (Hosea 13:9). The ruin is self-wrought — Ephraim is no victim of Yahuah but of its own sin — yet the help is Yahuah alone, the one Saviour of 13:4. The taunt that follows reaches back to the founding rejection: *I will be thy king: where is any other that may save thee in all thy cities?... Give me a king and princes? I gave thee a king in mine anger, and took him away in my wrath* (Hosea 13:10-11). That king was demanded on the day Yahuah named it rejection of his own reign: *Hearken unto the voice of the people in all that they say unto thee: for they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7). They asked for a king *like all the nations* and got one in Yahuah''s anger; the only true King and the only help was the One they refused. Yet even here — *in me is thine help* — the door stands open to the lost sheep of the northern house, the two-house people Yahuah will gather still.',
       sv.verse_id, ev.verse_id, 'free', 45018
  FROM _s328_hos13_lookup sv, _s328_hos13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I, even I, am Yahuah (LORD); and beside me there is no saviour* (Isaiah 43:11) — Isaiah''s refrain is Hosea''s very word *there is no saviour beside me* (Hosea 13:4); one Saviour, no other.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-there-is-no-saviour-beside-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *a just Elohim (God) and a Saviour; there is none beside me* (Isaiah 45:21) — the sole-Saviour word of Hosea 13:4 declared over all the ends of the earth.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-there-is-no-saviour-beside-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt* (Exodus 20:2) — Hosea 13:4 quotes the Sinai preface word for word; the first commandment as lawsuit.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-there-is-no-saviour-beside-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Thou shalt have no other gods before me* (Exodus 20:3) — *thou shalt know no god but me* (Hosea 13:4) is the first commandment turned against Ephraim''s Baal.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-there-is-no-saviour-beside-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Neither is there salvation in any other... none other name under heaven... whereby we must be saved* (Acts 4:12) — the one salvation of Hosea 13:4 worked in the Formed Son; not a second Saviour but the salvation of the one Saviour.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-there-is-no-saviour-beside-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *O death, where is thy sting? O grave, where is thy victory?* (1 Corinthians 15:55) — Paul quotes Hosea 13:14''s taunt at the resurrection; the ransom from the grave answered, death''s sting gone.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-o-death-i-will-be-thy-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54) — *I will redeem them from death* (Hosea 13:14) is the written saying fulfilled; death swallowed up.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-o-death-i-will-be-thy-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *He will swallow up death in victory* (Isaiah 25:8) — the same death-swallowing conquest as Hosea 13:14''s *O grave, I will be thy destruction*; one word across the prophets and Paul.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-o-death-i-will-be-thy-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I am alive for evermore... and have the keys of hell and of death* (Revelation 1:18) — the Formed Son who rose holds the power over Sheol that Hosea 13:14 promised.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-o-death-i-will-be-thy-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *our Saviour Yahusha HaMashiach (Jesus Christ), who hath abolished death* (2 Timothy 1:10) — Hosea 13:14 made manifest in the one Saviour (13:4) who abolished death and brought immortality to light.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-o-death-i-will-be-thy-plagues'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★, extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Sheol also shall give back that which it has received, And hell shall give back that which it owes* (1 Enoch 51:1) — Hosea 13:14''s ransom *from the power of the grave* is the morning the grave gives back its dead.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-sheol-shall-give-back-the-ransom-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1) — those redeemed *from the power of the grave* (Hosea 13:14) are kept in Yahuah''s hand; death has no hold.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-sheol-shall-give-back-the-ransom-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*though they be punished in the sight of men, yet is their hope full of immortality* (Wisdom of Solomon 3:4) — *I will redeem them from death* (Hosea 13:14) is the very hope full of immortality; what looks like death is the threshold of life.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-sheol-shall-give-back-the-ransom-from-the-grave'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *he... made a molten calf: and they said, These be thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (Exodus 32:4) — Hosea 13:2''s calves are Sinai''s calf perpetuated; the same craftsman''s idol falsely credited with the Egypt-redemption.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-let-the-men-that-sacrifice-kiss-the-calves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4) — Hosea 13:3''s *chaff that is driven with the whirlwind*; the wicked rootless, no standing.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-as-the-chaff-and-the-smoke-the-fleeting-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *As smoke is driven away, so drive them away... so let the wicked perish at the presence of Elohim (God)* (Psalm 68:2) — Hosea 13:3''s *smoke out of the chimney*; the wicked vanish before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-as-the-chaff-and-the-smoke-the-fleeting-wicked'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments, and his judgments, and his statutes* (Deuteronomy 8:11) — Hosea 13:6''s *therefore have they forgotten me*; the Torah names forgetting as not keeping the commandments.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-they-were-filled-and-forgot-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Then thine heart be lifted up, and thou forget Yahuah Elohayka (the LORD thy God)* (Deuteronomy 8:14) — Hosea 13:6''s *their heart was exalted; therefore have they forgotten me* is Moses'' warning come to pass word for word.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-they-were-filled-and-forgot-me'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *they have not rejected thee, but they have rejected me, that I should not reign over them* (1 Samuel 8:7) — the king of Hosea 13:10-11, demanded *like all the nations*, was rejection of Yahuah''s own reign; *in me is thine help* (13:9), the one true King refused.'
  FROM cross_reference_threads t
  JOIN _s328_hos13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s328_hos13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-13-thou-hast-destroyed-thyself-but-in-me-is-thine-help'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_hosea_14.sql (Hosea 14) -----
-- Chapter: Hosea 14 — THE BOOK'S CLOSE: the true return. *O Yashar'el (Israel), return unto Yahuah
-- Elohayka (the LORD thy God)... Take with you words, and turn to Yahuah (LORD)... so will we render
-- the calves of our lips* (14:1-2) — repentance in words and a confessing heart, not sacrifice-bulls;
-- the renouncing of the nations and idols, *for in thee the fatherless findeth mercy* (14:3); the free
-- healing love, *I will heal their backsliding, I will love them freely... I will be as the dew unto
-- Yashar'el (Israel)* (14:4-5); the restored fruitfulness, *From me is thy fruit found* (14:8); and the
-- closing wisdom-seal, *Who is wise... for the ways of Yahuah (LORD) are right, and the just shall walk
-- in them: but the transgressors shall fall therein* (14:9) — the book ends affirming Torah, the two
-- ways, the just WALKING in the right ways. Christology: the true Vine in whom alone fruit is found
-- (John 15) is the Formed Son. Two-house: Ephraim/Yashar'el the northern house healed of its backsliding
-- and gathered home; the grace is freely given UNTO restoration, never instead of the covenant. Torah
-- never abolished — the closing verse makes the just-who-walk the ones who stand.
-- Tag: hos14   Temp view: _s328_hos14_lookup
-- Sort band: base 45025, step 3 -> threads at 45025, 45028, 45031, 45034, 45037, 45040 (6 threads)
-- Source of EVERY row: 'canon','hosea',14,v
--
-- Hosea 14 coverage:
--   ★★ v.1-2 (return unto Yahuah... Take with you words, and turn to Yahuah... so will we render the
--          calves of our lips)
--        NT:     ★★ Hebrews 13:15 (the sacrifice of praise to Elohim (God) continually, that is, the fruit
--                of our lips giving thanks to his name) — THREAD 1; ★ Romans 10:9-10 (confess with thy
--                mouth... with the mouth confession is made unto salvation) — THREAD 1
--        Extras: ★ Ecclesiasticus 17:25 (Return to Yahuah (God), and forsake your sins) + Baruch 4:28
--                (being returned, seek him ten times more) — THREAD 1 (clean return-witnesses)
--        Tanakh: ★ Psalm 51:15-17 (open thou my lips... The sacrifices of Elohim are a broken spirit) — THREAD 1
--   ★ v.3 (Asshur shall not save us; we will not ride upon horses... for in thee the fatherless findeth mercy)
--        NT:     ★ James 1:27 (Pure religion... To visit the fatherless and widows in their affliction) — THREAD 2
--        Extras: none warranted (the renouncing-of-strength weave is carried by the Psalms)
--        Tanakh: ★ Psalm 20:7 (Some trust in chariots, and some in horses: but we will remember the name
--                of Yahuah) + Psalm 68:5 (A father of the fatherless... is Elohim) — THREAD 2
--   ★★★ v.4 (I will heal their backsliding, I will love them freely: for mine anger is turned away from him)
--        NT:     ★★ Romans 5:8 (while we were yet sinners, Messiah died for us) + Ephesians 2:4-5 (rich in
--                mercy... when we were dead in sins, hath quickened us) — THREAD 3 (loved freely)
--        Extras: none warranted (the free-love weave is carried canon-forward)
--        Tanakh: ★★ Jeremiah 3:22 (Return, ye backsliding children, and I will heal your backslidings) +
--                Jeremiah 31:18 (Ephraim bemoaning... turn thou me, and I shall be turned) — THREAD 3
--   ★ v.5-7 (I will be as the dew unto Yashar'el... he shall grow as the lily... revive as the corn)
--        NT:     none warranted distinct (the restored-fruit forward-weave is gathered in THREAD 5 with v.8)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 32:2 (My doctrine shall drop as the rain... distil as the dew) + Micah 5:7
--                (the remnant of Jacob... as a dew from Yahuah) + Isaiah 26:19 (thy dew is as the dew of
--                herbs, and the earth shall cast out the dead) — THREAD 4
--   ★ v.8 (Ephraim shall say, What have I to do any more with idols?... From me is thy fruit found)
--        NT:     ★★ John 15:4-5 (Abide in me... He that abideth in me... bringeth forth much fruit: for
--                without me ye can do nothing) — THREAD 5 (the true Vine; from me is thy fruit found)
--        Extras: none warranted
--        Tanakh: held in prose (Ephraim renouncing idols echoes 14:3, the two-house turning)
--   ★★ v.9 (Who is wise... for the ways of Yahuah are right, and the just shall walk in them: but the
--          transgressors shall fall therein)
--        NT:     ★ 1 Peter 2:7-8 (the stone which the builders disallowed... a stone of stumbling, and a
--                rock of offence... to them which stumble at the word) — THREAD 6 (the transgressors fall)
--        Extras: ★ Ecclesiasticus 17:26 (Turn again to the Most High... he will lead you out of darkness
--                into the light) — THREAD 6 (the wise who turn and walk)
--        Tanakh: ★★ Psalm 1:6 (Yahuah knoweth the way of the righteous: but the way of the ungodly shall
--                perish) + Deuteronomy 30:19 (I have set before you life and death... choose life) +
--                Proverbs 10:29 (The way of Yahuah is strength to the upright) + Jeremiah 6:16 (ask for
--                the old paths, where is the good way, and walk therein) — THREAD 6
--
-- Threads (slug — target libraries):
--   1. hosea-14-take-with-you-words-the-calves-of-our-lips — NT (Hebrews 13, Romans 10) + Tanakh (Psalm 51)
--      + Extras (Ecclesiasticus 17, Baruch 4) [extras] (★★ the true return; praise/confession not bulls)
--   2. hosea-14-asshur-shall-not-save-us-the-fatherless-findeth-mercy — Tanakh (Psalm 20, Psalm 68) +
--      NT (James 1) [free] (★ renouncing the nations/idols/self-strength; the fatherless finds mercy)
--   3. hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely — Tanakh (Jeremiah 3, Jeremiah 31)
--      + NT (Romans 5, Ephesians 2) [free] (★★★ the free healing love; the two-house backsliding healed)
--   4. hosea-14-i-will-be-as-the-dew-unto-yashael — Tanakh (Deuteronomy 32, Micah 5, Isaiah 26) [free]
--      (★ Yahuah as the dew; the restored fruitfulness, the remnant of Jacob as dew, resurrection-dew)
--   5. hosea-14-from-me-is-thy-fruit-found-the-true-vine — NT (John 15) [free] (★ from me is thy fruit
--      found = the true Vine, the Formed Son in whom alone fruit abides; Ephraim renouncing idols)
--   6. hosea-14-who-is-wise-the-ways-of-yahuah-are-right — Tanakh (Psalm 1, Deuteronomy 30, Proverbs 10,
--      Jeremiah 6) + NT (1 Peter 2) + Extras (Ecclesiasticus 17) [extras] (★★ the wisdom-seal; the two
--      ways, the just walk in Torah's right ways, the transgressors stumble — the anti-antinomian close)
--
-- Framing notes:
--   ★★ THE CALVES OF OUR LIPS (THREAD 1): *Take with you words, and turn to Yahuah (LORD): say unto him,
--      Take away all iniquity, and receive us graciously: so will we render the calves of our lips*
--      (14:2). The true return is repentance in words and a confessing heart — not bulls on the altar but
--      *the calves of our lips*. Hebrews names it: *By him therefore let us offer the sacrifice of praise
--      to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews
--      13:15); and Paul: *with the mouth confession is made unto salvation* (Romans 10:10). David already
--      sang it: *O Yahuah (Lord), open thou my lips; and my mouth shall shew forth thy praise. For thou
--      desirest not sacrifice... The sacrifices of Elohim (God) are a broken spirit* (Psalm 51:15-17).
--      The restored witnesses echo the call to return: *Return to Yahuah (God), and forsake your sins*
--      (Ecclesiasticus 17:25); *being returned, seek him ten times more* (Baruch 4:28).
--   ★★★ I WILL LOVE THEM FREELY (THREAD 3): *I will heal their backsliding, I will love them freely: for
--      mine anger is turned away from him* (14:4). The grace is freely given UNTO restoration — not
--      instead of the covenant. Jeremiah twins it: *Return, ye backsliding children, and I will heal your
--      backslidings* (Jeremiah 3:22); *Ephraim bemoaning himself... turn thou me, and I shall be turned*
--      (Jeremiah 31:18). Paul: *while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8);
--      *Elohim (God), who is rich in mercy... when we were dead in sins, hath quickened us* (Ephesians
--      2:4-5). Ephraim is the northern house healed and gathered — two-house, not replacement.
--   ★ THE TRUE VINE (THREAD 5): *From me is thy fruit found* (14:8). Ephraim renounces idols — *What
--      have I to do any more with idols?* — and confesses that all fruitfulness is from Yahuah. The
--      Formed Son fills it: *I am the true vine... He that abideth in me, and I in him, the same bringeth
--      forth much fruit: for without me ye can do nothing* (John 15:1,5). From him alone is the fruit found.
--   ★★ THE WISDOM-SEAL (THREAD 6): *Who is wise, and he shall understand these things?... for the ways of
--      Yahuah (LORD) are right, and the just shall walk in them: but the transgressors shall fall therein*
--      (14:9). The book closes affirming Torah — the two ways, the just WALKING in the right ways (Psalm
--      1:6; Deuteronomy 30:19 *choose life*; Proverbs 10:29; Jeremiah 6:16 *ask for the old paths... the
--      good way, and walk therein*). The very same right ways are the stone of stumbling for those who
--      refuse: *a stone of stumbling, and a rock of offence, even to them which stumble at the word, being
--      disobedient* (1 Peter 2:8). The anti-antinomian seal: the just walk in Yahuah's ways; the
--      transgressors fall therein.
--   VERSES WITH NO SEPARATE ADD: v.1 (return... thou hast fallen by thine iniquity — the call that opens
--      THREAD 1), v.6-7 (the branches, the olive, the corn, the vine — the dew's restored fruit, woven
--      into THREAD 4 with v.5). All recorded, none silently skipped.

CREATE TEMP VIEW _s328_hos14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Take with you words — the calves of our lips (the true return)
    ('canon','hosea',14,2,'canon','hebrews',13,15,'free',
      E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). Hosea''s *so will we render the calves of our lips* (Hosea 14:2) is the very thing Hebrews names — the sacrifice not of bulls but of praise, *the fruit of our lips*. The true return brings words and a thankful heart to the altar, the offering Yahuah desires.'),
    ('canon','hosea',14,2,'canon','romans',10,9,'free',
      E'*That if thou shalt confess with thy mouth the Lord Yahusha (Lord Jesus), and shalt believe in thine heart that Elohim (God) hath raised him from the dead, thou shalt be saved* (Romans 10:9). The *words* taken in the return — *Take with you words, and turn to Yahuah (LORD)* (Hosea 14:2) — are the mouth''s confession joined to the believing heart; the lips and the heart together turn home.'),
    ('canon','hosea',14,2,'canon','romans',10,10,'free',
      E'*For with the heart man believeth unto righteousness; and with the mouth confession is made unto salvation* (Romans 10:10). The *calves of our lips* (Hosea 14:2) are precisely this confession of the mouth — the offering of words that turns the heart back to Yahuah. Repentance is spoken as well as believed.'),
    ('canon','hosea',14,2,'canon','psalms',51,15,'free',
      E'*O Yahuah (Lord), open thou my lips; and my mouth shall shew forth thy praise* (Psalm 51:15). David''s opened lips are the *calves of our lips* (Hosea 14:2) — the offering of praise that returns to Yahuah. The mouth that confesses iniquity is the same mouth that renders the sacrifice of thanks.'),
    ('canon','hosea',14,2,'canon','psalms',51,17,'free',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). Hosea''s return — *Take away all iniquity, and receive us graciously: so will we render the calves of our lips* (Hosea 14:2) — is the broken and contrite heart, the sacrifice Yahuah does not despise; words and a humbled spirit, not burnt bulls.'),
    ('canon','hosea',14,1,'apocrypha','ecclesiasticus',17,25,'extras',
      E'*Return to Yahuah (God), and forsake your sins, make your prayer before his face, and offend less* (Ecclesiasticus 17:25). The restored witness sounds Hosea''s opening call — *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God)* (Hosea 14:1) — the turning that forsakes sin and brings prayer before his face.'),
    ('canon','hosea',14,1,'apocrypha','baruch-with-the-letter-of-jeremiah',4,28,'extras',
      E'*For as it was your mind to go astray from Yahuah (God): so, being returned, seek him ten times more* (Baruch 4:28). The same return Hosea pleads — *return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1) — is Baruch''s: those who went astray, being returned, seek him the more.'),

    -- THREAD 2 (★): Asshur shall not save us — the fatherless findeth mercy
    ('canon','hosea',14,3,'canon','psalms',20,7,'free',
      E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Hosea''s renunciation — *Asshur shall not save us; we will not ride upon horses* (Hosea 14:3) — is the same turning from the strength of the nations to the Name; not chariots and horses but Yahuah remembered.'),
    ('canon','hosea',14,3,'canon','psalms',68,5,'free',
      E'*A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation* (Psalm 68:5). *For in thee the fatherless findeth mercy* (Hosea 14:3) names what Psalm 68 sings: Yahuah is the father of the fatherless. The northern house, having forsaken idols and the nations, finds in him the mercy no work of their hands could give.'),
    ('canon','hosea',14,3,'canon','james',1,27,'free',
      E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). The mercy *the fatherless findeth* in Yahuah (Hosea 14:3) is the mercy his people are to carry — pure religion visits the fatherless, reflecting the Father who is their mercy.'),

    -- THREAD 3 (★★★): I will heal their backsliding, I will love them freely
    ('canon','hosea',14,4,'canon','jeremiah',3,22,'free',
      E'*Return, ye backsliding children, and I will heal your backslidings. Behold, we come unto thee; for thou art Yahuah Eloheinu (the LORD our God)* (Jeremiah 3:22). Hosea''s promise — *I will heal their backsliding, I will love them freely* (Hosea 14:4) — is Jeremiah''s word twin: the backsliding children called to return, and Yahuah healing the very backsliding he calls them out of.'),
    ('canon','hosea',14,4,'canon','jeremiah',31,18,'free',
      E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18). The healed backsliding of *I will heal their backsliding... mine anger is turned away from him* (Hosea 14:4) is Ephraim turned — the northern house bemoaning itself, crying *turn thou me, and I shall be turned*; the two-house son healed and gathered home.'),
    ('canon','hosea',14,4,'canon','romans',5,8,'free',
      E'*But Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8). *I will love them freely* (Hosea 14:4) is this free love made flesh — love poured out *while we were yet sinners*, not earned, the anger turned away because the love came first.'),
    ('canon','hosea',14,4,'canon','ephesians',2,4,'free',
      E'*But Elohim (God), who is rich in mercy, for his great love wherewith he loved us, Even when we were dead in sins, hath quickened us together with Messiah (Christ)* (Ephesians 2:4-5). The freely-given love of *I will love them freely: for mine anger is turned away from him* (Hosea 14:4) is the rich mercy of Ephesians — love that quickens the dead, freely, unto a restored walk (the good works *ordained that we should walk in them*, Ephesians 2:10), never instead of the covenant.'),

    -- THREAD 4 (★): I will be as the dew unto Yashar'el
    ('canon','hosea',14,5,'canon','deuteronomy',32,2,'free',
      E'*My doctrine shall drop as the rain, my speech shall distil as the dew, as the small rain upon the tender herb, and as the showers upon the grass* (Deuteronomy 32:2). *I will be as the dew unto Yashar''el (Israel): he shall grow as the lily* (Hosea 14:5) draws on Moses'' song: Yahuah''s word and blessing falling as the dew that revives the tender herb. The restored Yashar''el grows under the dew of his teaching.'),
    ('canon','hosea',14,5,'canon','micah',5,7,'free',
      E'*And the remnant of Jacob shall be in the midst of many people as a dew from Yahuah (LORD), as the showers upon the grass, that tarrieth not for man, nor waiteth for the sons of men* (Micah 5:7). The dew Yahuah is *unto Yashar''el (Israel)* (Hosea 14:5) becomes what the remnant of Jacob is among the nations — *as a dew from Yahuah*; the healed house, watered, becomes itself a watering blessing.'),
    ('canon','hosea',14,5,'canon','isaiah',26,19,'free',
      E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). The reviving dew of *I will be as the dew unto Yashar''el (Israel)* (Hosea 14:5) reaches its furthest end in Isaiah — *thy dew is as the dew of herbs* that raises the dead; the dew that revives the lily revives the sleepers in dust.'),

    -- THREAD 5 (★): From me is thy fruit found — the true Vine
    ('canon','hosea',14,8,'canon','john',15,4,'free',
      E'*Abide in me, and I in you. As the branch cannot bear fruit of itself, except it abide in the vine; no more can ye, except ye abide in me* (John 15:4). *From me is thy fruit found* (Hosea 14:8) is the truth the Vine makes plain: the branch bears no fruit of itself; all fruitfulness is from him. Ephraim, renouncing idols, confesses that the fruit was never the work of his own hands.'),
    ('canon','hosea',14,8,'canon','john',15,5,'free',
      E'*I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). The Formed Son names himself the source of *From me is thy fruit found* (Hosea 14:8) — *without me ye can do nothing*. Ephraim''s *What have I to do any more with idols?* finds its answer in the true Vine: fruit is found in him alone.'),

    -- THREAD 6 (★★): Who is wise — the ways of Yahuah are right
    ('canon','hosea',14,9,'canon','psalms',1,6,'free',
      E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Hosea''s closing seal — *the ways of Yahuah (LORD) are right, and the just shall walk in them: but the transgressors shall fall therein* (Hosea 14:9) — is the two ways of Psalm 1: the righteous who walk and the ungodly whose way perishes. The just walk; the transgressors fall.'),
    ('canon','hosea',14,9,'canon','deuteronomy',30,19,'free',
      E'*I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The wise who *understand these things* (Hosea 14:9) choose the right ways Moses set before Yashar''el — *choose life*; to walk in Yahuah''s ways is to live, to fall therein is to perish.'),
    ('canon','hosea',14,9,'canon','proverbs',10,29,'free',
      E'*The way of Yahuah (LORD) is strength to the upright: but destruction shall be to the workers of iniquity* (Proverbs 10:29). The same ways that are *right* and in which *the just shall walk* (Hosea 14:9) are strength to the upright and destruction to the worker of iniquity — one road, life to the one who walks it, ruin to the one who stumbles.'),
    ('canon','hosea',14,9,'canon','jeremiah',6,16,'free',
      E'*Thus saith Yahuah (LORD), Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls* (Jeremiah 6:16). The *ways of Yahuah (LORD)* in which *the just shall walk* (Hosea 14:9) are the old paths, the good way; the wise ask for them and walk therein, the transgressors say *We will not walk therein* and fall.'),
    ('canon','hosea',14,9,'canon','1-peter',2,8,'free',
      E'*And a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient: whereunto also they were appointed* (1 Peter 2:8). The very right ways in which the just walk become the stone over which the disobedient fall — *the transgressors shall fall therein* (Hosea 14:9). The same word is life to the one who walks and a stumbling to the one who refuses.'),
    ('canon','hosea',14,9,'apocrypha','ecclesiasticus',17,26,'extras',
      E'*Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light of health, and hate you abomination vehemently* (Ecclesiasticus 17:26). The wise who *know* Yahuah''s ways and *walk in them* (Hosea 14:9) are those who turn again to the Most High and away from iniquity; he leads them out of darkness into light, while the transgressors fall.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s328_hos14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s328_hos14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-take-with-you-words-the-calves-of-our-lips',
       E'Take with you words — the calves of our lips, the true return',
       E'The book closes with the call home: *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity. Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips* (Hosea 14:1-2). The true return is not bulls on the altar but words and a confessing heart — *the calves of our lips*. Hebrews names the very offering: *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). Paul makes the lips and the heart turn together: *with the heart man believeth unto righteousness; and with the mouth confession is made unto salvation* (Romans 10:10). David already knew this sacrifice: *O Yahuah (Lord), open thou my lips; and my mouth shall shew forth thy praise* — for *The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:15,17). And the restored witnesses sound the same return: *Return to Yahuah (God), and forsake your sins, make your prayer before his face* (Ecclesiasticus 17:25); *being returned, seek him ten times more* (Baruch 4:28). Words, a broken heart, the calves of the lips — this is the return that brings the fallen house home.',
       sv.verse_id, ev.verse_id, 'extras', 45025
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-asshur-shall-not-save-us-the-fatherless-findeth-mercy',
       E'Asshur shall not save us — in thee the fatherless findeth mercy',
       E'The return renounces every false rescue: *Asshur shall not save us; we will not ride upon horses: neither will we say any more to the work of our hands, Ye are our gods: for in thee the fatherless findeth mercy* (Hosea 14:3). The nations, the war-horses, the idols — all forsaken; mercy is found only in Yahuah. David sang the same turning: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). And the mercy the fatherless find is the Father he is: *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation* (Psalm 68:5). The mercy received becomes the mercy carried — *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). The house that forsakes Asshur and the work of its own hands finds in Yahuah the mercy no idol could give, and learns to be merciful as he is.',
       sv.verse_id, ev.verse_id, 'free', 45028
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely',
       E'I will heal their backsliding, I will love them freely',
       E'To the returning house Yahuah answers with free love: *I will heal their backsliding, I will love them freely: for mine anger is turned away from him* (Hosea 14:4). The healing is of the very backsliding they are called out of — Jeremiah''s word twin: *Return, ye backsliding children, and I will heal your backslidings. Behold, we come unto thee; for thou art Yahuah Eloheinu (the LORD our God)* (Jeremiah 3:22). And it is Ephraim, the northern house, healed and gathered: *I have surely heard Ephraim bemoaning himself thus... turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18) — the two-house son turned home, not replaced. *I will love them freely* is the free love made flesh: *Elohim (God) commendeth his love toward us, in that, while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8); *Elohim (God), who is rich in mercy, for his great love wherewith he loved us, Even when we were dead in sins, hath quickened us together with Messiah (Christ)* (Ephesians 2:4-5). The love comes first and freely — UNTO restoration and a renewed walk, never instead of the covenant; the anger turned away because the love was poured out while they were yet far off.',
       sv.verse_id, ev.verse_id, 'free', 45031
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-i-will-be-as-the-dew-unto-yashael',
       E'I will be as the dew unto Yashar''el — the restored fruitfulness',
       E'The healed house is watered and made to grow: *I will be as the dew unto Yashar''el (Israel): he shall grow as the lily, and cast forth his roots as Lebanon. His branches shall spread, and his beauty shall be as the olive tree... They that dwell under his shadow shall return; they shall revive as the corn, and grow as the vine* (Hosea 14:5-7). The dew is Yahuah''s own life and teaching falling on the parched house — as Moses sang, *My doctrine shall drop as the rain, my speech shall distil as the dew, as the small rain upon the tender herb* (Deuteronomy 32:2). The watered house becomes itself a watering blessing among the nations: *And the remnant of Jacob shall be in the midst of many people as a dew from Yahuah (LORD), as the showers upon the grass* (Micah 5:7). And the reviving dew reaches its furthest end in resurrection: *Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). The dew that raises the lily raises the sleepers in dust — the dead house revived, rooted as Lebanon.',
       sv.verse_id, ev.verse_id, 'free', 45034
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-from-me-is-thy-fruit-found-the-true-vine',
       E'From me is thy fruit found — the true Vine',
       E'Ephraim renounces the last idol and confesses where fruit comes from: *Ephraim shall say, What have I to do any more with idols? I have heard him, and observed him: I am like a green fir tree. From me is thy fruit found* (Hosea 14:8). The fruit was never the work of his own hands — it is *from me*. The Formed Son fills it as the true Vine: *Abide in me, and I in you. As the branch cannot bear fruit of itself, except it abide in the vine; no more can ye, except ye abide in me* (John 15:4); *I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* (John 15:5). The house that grows as the vine (14:7) finds that all its fruit hangs on abiding in him. *What have I to do any more with idols?* is answered in the Vine: fruit is found in Yahuah alone, never in the work of human hands.',
       sv.verse_id, ev.verse_id, 'free', 45037
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hosea-14-who-is-wise-the-ways-of-yahuah-are-right',
       E'Who is wise — the ways of Yahuah are right, and the just shall walk in them',
       E'Hosea seals the book with a wisdom-call: *Who is wise, and he shall understand these things? prudent, and he shall know them? for the ways of Yahuah (LORD) are right, and the just shall walk in them: but the transgressors shall fall therein* (Hosea 14:9). The closing word affirms Torah — the two ways, the just WALKING in the right ways. It is the two ways of Psalm 1: *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6); the choice Moses set before Yashar''el: *I have set before you life and death, blessing and cursing: therefore choose life* (Deuteronomy 30:19); the road that is *strength to the upright: but destruction... to the workers of iniquity* (Proverbs 10:29); and the old paths to be walked: *ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls* (Jeremiah 6:16). The very same right ways become a stumbling to those who refuse — *a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient* (1 Peter 2:8). The restored witness joins the call to turn and walk: *Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light* (Ecclesiasticus 17:26). The anti-antinomian seal of the prophet: Yahuah''s ways are right; the just walk in them, the transgressors fall therein.',
       sv.verse_id, ev.verse_id, 'extras', 45040
  FROM _s328_hos14_lookup sv, _s328_hos14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='hosea' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15) — Hosea''s *calves of our lips* (14:2) named: praise, not bulls.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *if thou shalt confess with thy mouth the Lord Yahusha (Lord Jesus)... thou shalt be saved* (Romans 10:9) — the *words* of the return (14:2) confessed with the mouth.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *with the mouth confession is made unto salvation* (Romans 10:10) — the *calves of our lips* (14:2) are the mouth''s confession joined to the believing heart.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*open thou my lips; and my mouth shall shew forth thy praise* (Psalm 51:15) — David''s opened lips are the *calves of our lips* (14:2).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart... thou wilt not despise* (Psalm 51:17) — the return of 14:2 is the contrite heart, not burnt bulls.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=2
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Return to Yahuah (God), and forsake your sins, make your prayer before his face* (Ecclesiasticus 17:25) — the restored witness sounds Hosea''s *return unto Yahuah* (14:1).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=1
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*being returned, seek him ten times more* (Baruch 4:28) — those who went astray, returning, the same turning Hosea pleads (14:1).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=1
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-take-with-you-words-the-calves-of-our-lips'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7) — Hosea''s *we will not ride upon horses* (14:3), the same turning from the nations'' strength to the Name.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-asshur-shall-not-save-us-the-fatherless-findeth-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *A father of the fatherless, and a judge of the widows, is Elohim (God) in his holy habitation* (Psalm 68:5) — *in thee the fatherless findeth mercy* (14:3) named: Yahuah the Father of the fatherless.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=68 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-asshur-shall-not-save-us-the-fatherless-findeth-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Pure religion... To visit the fatherless and widows in their affliction* (James 1:27) — the mercy the fatherless find in Yahuah (14:3) becomes the mercy his people carry.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=3
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-asshur-shall-not-save-us-the-fatherless-findeth-mercy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Return, ye backsliding children, and I will heal your backslidings* (Jeremiah 3:22) — the word twin of *I will heal their backsliding* (14:4).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Ephraim bemoaning himself... turn thou me, and I shall be turned* (Jeremiah 31:18) — the northern house healed and turned home; the two-house son of 14:4.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *while we were yet sinners, Messiah (Christ) died for us* (Romans 5:8) — *I will love them freely* (14:4) made flesh; love poured out unearned.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *rich in mercy, for his great love... when we were dead in sins, hath quickened us* (Ephesians 2:4-5) — the free love of 14:4 that quickens the dead, unto a restored walk, never instead of the covenant.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=4
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-heal-their-backsliding-i-will-love-them-freely'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *My doctrine shall drop as the rain, my speech shall distil as the dew* (Deuteronomy 32:2) — Yahuah''s word as the dew, the source of *I will be as the dew unto Yashar''el* (14:5).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-be-as-the-dew-unto-yashael'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the remnant of Jacob shall be... as a dew from Yahuah (LORD)* (Micah 5:7) — the house watered as dew (14:5) becomes a watering blessing among the nations.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-be-as-the-dew-unto-yashael'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19) — the reviving dew of 14:5 reaching resurrection; the dew that raises the lily raises the sleepers.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=5
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-i-will-be-as-the-dew-unto-yashael'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the branch cannot bear fruit of itself, except it abide in the vine* (John 15:4) — *From me is thy fruit found* (14:8): no fruit of the branch''s own.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-from-me-is-thy-fruit-found-the-true-vine'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I am the vine, ye are the branches... without me ye can do nothing* (John 15:5) — the Formed Son names himself the source of *From me is thy fruit found* (14:8).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=8
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-from-me-is-thy-fruit-found-the-true-vine'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — the two ways of *the just shall walk in them: but the transgressors shall fall therein* (14:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I have set before you life and death, blessing and cursing: therefore choose life* (Deuteronomy 30:19) — the wise choose the right ways Moses set before Yashar''el (14:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The way of Yahuah (LORD) is strength to the upright: but destruction shall be to the workers of iniquity* (Proverbs 10:29) — one road, life to the upright who walk, ruin to the transgressor (14:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ask for the old paths, where is the good way, and walk therein, and ye shall find rest* (Jeremiah 6:16) — the right ways of 14:9 are the old paths the wise walk; the transgressors say *We will not walk therein*.'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *a stone of stumbling, and a rock of offence, even to them which stumble at the word, being disobedient* (1 Peter 2:8) — the same right ways become a stumbling to the disobedient; *the transgressors shall fall therein* (14:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light* (Ecclesiasticus 17:26) — the restored witness''s call to turn and walk; the wise who know Yahuah''s ways (14:9).'
  FROM cross_reference_threads t
  JOIN _s328_hos14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='hosea' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s328_hos14_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='hosea-14-who-is-wise-the-ways-of-yahuah-are-right'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session328 — Hosea cross-references complete.'
