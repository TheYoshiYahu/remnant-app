-- =====================================================================
-- Session 316 — Nehemiah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session316_nehemiah_cross_references.sql
-- =====================================================================

\echo 'session316 — Nehemiah cross-references starting...'
BEGIN;

-- ----- fragment: minion_nehemiah_1.sql (Nehemiah 1) -----
-- Book: Nehemiah  Chapter: 1  (Nehemiah hears of the ruin of Jerusalem and prays)
-- Tag: neh01   Session prefix: s316   Temp view: _s316_neh01_lookup
-- Slug prefix: nehemiah-1-...   Sort band: 32100 (+1 per thread; 32100..32103)
-- Source: edition 'canon', book_slug 'nehemiah', chapter 1.
-- MEMBER FORM: STANDARD, explicit literal source verse on every member JOIN. NO compact (VALUES) AS m(...) form.
--
-- Nehemiah 1 coverage:
--   v.1-3 (the broken wall reported)
--        NT:     none warranted (narrative setting)
--        Extras: none warranted
--        Tanakh: woven into thread 1 via the burden for Jerusalem (Ps 137; Ps 102:13-14)
--   v.4 (he sat down and wept, mourned, fasted, prayed before the Elohim of heaven)
--        NT:     none warranted (Daniel 9:3 carries the fasting-prayer parallel better than any NT verse)
--        Extras: none warranted
--        Tanakh: Psalm 137:5-6 (Jerusalem above his chief joy); Psalm 102:13-14 (arise, mercy on Zion, servants take pleasure in her stones); Daniel 9:3 (set face to seek by prayer, fasting) -> THREAD 1
--   v.5-7 (covenant-keeping Elohim who keeps mercy for them that love him and keep his commandments; the confession: we have not kept the commandments)
--        NT:     none warranted here (the framework filter is Torah-love + covenant; held in Tanakh)
--        Extras: none warranted (Dan 9 confession is the cleaner canon witness)
--        Tanakh: Deuteronomy 7:9 (the faithful Elohim that keepeth covenant and mercy with them that love him and keep his commandments); Daniel 9:4 (the parallel confession opening); Leviticus 26:40 (if they shall confess their iniquity) -> THREAD 2
--   v.8-9 (Remember the word to Moses: if ye transgress I will scatter; but if ye turn and keep my commandments I will gather them from the uttermost part of heaven to the place I have chosen for my name)
--        NT:     none warranted (the regathering promise is a Tanakh covenant pleaded back)
--        Extras: none warranted
--        Tanakh: Deuteronomy 30:3-5 (return, gather thee from all nations, from the outmost parts of heaven); Jeremiah 29:14 (I will gather you from all the nations and bring you again); Deuteronomy 4:27-31 (scatter / if thou turn he will not forsake nor forget the covenant) -> THREAD 3
--   v.10-11 (thy servants whom thou hast redeemed by thy strong hand; hear thy servant's prayer, grant mercy before this man)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deuteronomy 7:8 (redeemed out of the house of bondmen by a mighty hand); 1 Kings 8:50 (forgive thy people and give them compassion before them who carried them captive); Leviticus 26:45 (I will remember the covenant of their ancestors) -> THREAD 4
--
-- THREADS (all members canon -> tier 'free'):
--   nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray (32100) | Tanakh: Ps 137:5-6, Ps 102:13-14, Dan 9:3
--   nehemiah-1-the-covenant-keeping-elohim-and-the-confession (32101) | Tanakh: Deut 7:9, Dan 9:4, Lev 26:40
--   nehemiah-1-if-ye-turn-i-will-gather-them-from-thence (32102) | Tanakh: Deut 30:3, Deut 30:4, Jer 29:14, Deut 4:27, Deut 4:31
--   nehemiah-1-redeemed-by-thy-strong-hand-hear-thy-servants-prayer (32103) | Tanakh: Deut 7:8, 1 Kings 8:50, Lev 26:45
--
-- Framework note: thread 3 is the two-house regathering keystone of the chapter — the scattering-and-gathering
-- covenant (Deut 30 / Jer 29 / Deut 4) pleaded back to Yahuah, conditioned on turning and keeping the commandments;
-- the regathering hope the framework treasures. Thread 2 binds covenant-mercy to commandment-keeping (Deut 7:9),
-- the Torah-love-and-covenant-inseparable filter; the confession is Torah-grounded (Dan 9, Lev 26:40), the curse
-- being the Deut 28 exile-judgment, never the Torah itself.

CREATE TEMP VIEW _s316_neh01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the broken-down wall drives him to weep and pray
    ('canon','nehemiah',1,4, 'canon','psalms',137,5, 'free',
     E'*If I forget thee, O Jerusalem, let my right hand forget her cunning.* (Psalm 137:5) The exiles by the rivers of Babylon swore Jerusalem above their chief joy — so when Nehemiah hears *the wall of Jerusalem also is broken down* (Nehemiah 1:3), he *sat down and wept, and mourned certain days, and fasted, and prayed* (Nehemiah 1:4): the burden for the ruined city drives him to his knees, the same undying love for Zion the psalm sings.'),
    ('canon','nehemiah',1,4, 'canon','psalms',137,6, 'free',
     E'*If I do not remember thee, let my tongue cleave to the roof of my mouth; if I prefer not Jerusalem above my chief joy.* (Psalm 137:6) Nehemiah is this oath kept — hearing of the broken wall he *wept, and mourned... and fasted, and prayed before the Elohim (God) of heaven* (Nehemiah 1:4), preferring Jerusalem above his place in Shushan the palace.'),
    ('canon','nehemiah',1,4, 'canon','psalms',102,13, 'free',
     E'*Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* (Psalm 102:13) Nehemiah''s mourning and fasting (Nehemiah 1:4) lays hold of exactly this promised set time — he prays that Yahuah would arise and have mercy on the city whose wall lies broken.'),
    ('canon','nehemiah',1,4, 'canon','psalms',102,14, 'free',
     E'*For thy servants take pleasure in her stones, and favour the dust thereof.* (Psalm 102:14) The very sign the psalm gives that mercy on Zion is near — Nehemiah, hearing the gates *burned with fire* (Nehemiah 1:3), grieves over her ruined stones and *prayed before the Elohim (God) of heaven* (Nehemiah 1:4): the servant who takes pleasure in her stones is the herald of her favour.'),
    ('canon','nehemiah',1,4, 'canon','daniel',9,3, 'free',
     E'*And I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes.* (Daniel 9:3) Daniel''s posture over desolate Jerusalem is Nehemiah''s — when Nehemiah heard the words of the ruin he *fasted, and prayed before the Elohim (God) of heaven* (Nehemiah 1:4): two exiles, the same fasting-prayer for the broken city.'),

    -- THREAD 2: the covenant-keeping Elohim and the confession
    ('canon','nehemiah',1,5, 'canon','deuteronomy',7,9, 'free',
     E'*Know therefore that Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations.* (Deuteronomy 7:9) Nehemiah opens his prayer with the very words of Moses — *the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5): covenant-mercy and commandment-keeping are bound together, Torah-love inseparable from the covenant.'),
    ('canon','nehemiah',1,6, 'canon','daniel',9,4, 'free',
     E'*And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments.* (Daniel 9:4) Daniel''s confession opens word for word as Nehemiah''s does — Nehemiah *confess[es] the sins of the children of Yashar''el (Israel), which we have sinned against thee* (Nehemiah 1:6): one liturgy of repentance for the scattered people, the great Elohim who keeps covenant with them that keep his commandments.'),
    ('canon','nehemiah',1,7, 'canon','leviticus',26,40, 'free',
     E'*If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me, and that also they have walked contrary unto me.* (Leviticus 26:40) The Torah itself prescribes the confession Nehemiah makes — *we have... not kept the commandments, nor the statutes, nor the judgments, which thou commandedst thy servant Moses* (Nehemiah 1:7): the curse is the exile-judgment for covenant-breaking, and the door home is the confession Moses foretold.'),

    -- THREAD 3: if ye turn, I will gather them from thence (the regathering promise pleaded back)
    ('canon','nehemiah',1,9, 'canon','deuteronomy',30,3, 'free',
     E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* (Deuteronomy 30:3) Nehemiah pleads this very word back to Yahuah — *if ye turn unto me, and keep my commandments... yet will I gather them from thence* (Nehemiah 1:9): the scattering-and-regathering covenant, conditioned on turning and keeping the Torah.'),
    ('canon','nehemiah',1,9, 'canon','deuteronomy',30,4, 'free',
     E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee.* (Deuteronomy 30:4) Nehemiah quotes it almost exactly — *though there were of you cast out unto the uttermost part of the heaven, yet will I gather them from thence* (Nehemiah 1:9): no scattering is too far for the gathering of the two-house people who turn to Yahuah.'),
    ('canon','nehemiah',1,9, 'canon','jeremiah',29,14, 'free',
     E'*And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you, saith Yahuah (LORD); and I will bring you again into the place whence I caused you to be carried away captive.* (Jeremiah 29:14) The gathering-from-all-nations promise Nehemiah leans on — *will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:9): the regathering of the scattered who seek Yahuah with all their heart.'),
    ('canon','nehemiah',1,8, 'canon','deuteronomy',4,27, 'free',
     E'*And Yahuah (LORD) shall scatter you among the nations, and ye shall be left few in number among the heathen, whither Yahuah (LORD) shall lead you.* (Deuteronomy 4:27) Nehemiah names the first half of the word to Moses — *If ye transgress, I will scatter you abroad among the nations* (Nehemiah 1:8): the scattering Moses foretold has come, and so Nehemiah pleads the gathering that Moses promised next.'),
    ('canon','nehemiah',1,9, 'canon','deuteronomy',4,31, 'free',
     E'*(For Yahuah Elohayka (the LORD thy God) is a merciful Elohim (God);) he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers which he sware unto them.* (Deuteronomy 4:31) The ground of Nehemiah''s hope that the cast-out will be gathered (Nehemiah 1:9) — Yahuah will not forget the covenant; *if ye turn unto me, and keep my commandments* the merciful Elohim brings the scattered home.'),

    -- THREAD 4: redeemed by thy strong hand; hear thy servants' prayer
    ('canon','nehemiah',1,10, 'canon','deuteronomy',7,8, 'free',
     E'*But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers, hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt.* (Deuteronomy 7:8) Nehemiah reminds Yahuah of his own redeeming deed — *thy servants and thy people, whom thou hast redeemed by thy great power, and by thy strong hand* (Nehemiah 1:10): the same strong hand that broke Egypt is pleaded to gather the captives.'),
    ('canon','nehemiah',1,11, 'canon','1-kings',8,50, 'free',
     E'*And forgive thy people that have sinned against thee, and all their transgressions wherein they have transgressed against thee, and give them compassion before them who carried them captive, that they may have compassion on them.* (1 Kings 8:50) Solomon''s temple-prayer asked exactly what Nehemiah now asks — *grant him mercy in the sight of this man* (Nehemiah 1:11): that Yahuah would forgive his people and turn the heart of their captor toward compassion.'),
    ('canon','nehemiah',1,10, 'canon','leviticus',26,45, 'free',
     E'*But I will for their sakes remember the covenant of their ancestors, whom I brought forth out of the land of Egypt in the sight of the heathen, that I might be their Elohim (God): I am Yahuah (LORD).* (Leviticus 26:45) The covenant-remembrance Nehemiah''s appeal rests on — *thy servants and thy people, whom thou hast redeemed* (Nehemiah 1:10): even in the land of their enemies Yahuah remembers the covenant of the fathers and does not cast his people away.')
  ) AS i(src_edition,src_slug,src_ch,src_v, tgt_edition,tgt_slug,tgt_ch,tgt_v, tier,note)
  JOIN _s316_neh01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray',
       E'The broken-down wall drives him to weep and pray',
       E'Word reaches Nehemiah in Shushan the palace: *the wall of Jerusalem also is broken down, and the gates thereof are burned with fire* (Nehemiah 1:3). He does not shrug it off — *when I heard these words, that I sat down and wept, and mourned certain days, and fasted, and prayed before the Elohim (God) of heaven* (Nehemiah 1:4). This is the oath of the exiles kept: *If I forget thee, O Jerusalem, let my right hand forget her cunning* (Psalm 137:5); *if I prefer not Jerusalem above my chief joy* (Psalm 137:6). The burden for the ruined city lays hold of the very promise the psalmist sang — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come. For thy servants take pleasure in her stones, and favour the dust thereof* (Psalm 102:13-14): the servant who grieves over her stones is the herald of her favour. And the posture is Daniel''s exactly — *I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes* (Daniel 9:3): two captives, one fasting-prayer for the broken city of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 32100
  FROM _s316_neh01_lookup sv, _s316_neh01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-1-the-covenant-keeping-elohim-and-the-confession',
       E'The covenant-keeping Elohim and the confession',
       E'Nehemiah opens his prayer not with his need but with who Yahuah is: *I beseech thee, O Yahuah Elohim (LORD God) of heaven, the great and terrible Elohim (God), that keepeth covenant and mercy for them that love him and observe his commandments* (Nehemiah 1:5). These are Moses'' own words — *Yahuah Elohayka (the LORD thy God)... the faithful Elohim (God), which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9): covenant-mercy and commandment-keeping are one thing, Torah-love inseparable from the covenant. Then comes the confession — *I... confess the sins of the children of Yashar''el (Israel), which we have sinned against thee... we have... not kept the commandments, nor the statutes, nor the judgments, which thou commandedst thy servant Moses* (Nehemiah 1:6-7). Daniel''s confession opens with the same liturgy — *O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments* (Daniel 9:4). And the confession itself is Torah-prescribed: *If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me* (Leviticus 26:40). The curse was the exile-judgment for covenant-breaking — never the Torah; the road home is the very confession Moses foretold.',
       sv.verse_id, ev.verse_id, 'free', 32101
  FROM _s316_neh01_lookup sv, _s316_neh01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-1-if-ye-turn-i-will-gather-them-from-thence',
       E'If ye turn, I will gather them from thence',
       E'Here is the keystone of the chapter — Nehemiah pleads the covenant back to its Author: *Remember, I beseech thee, the word that thou commandedst thy servant Moses, saying, If ye transgress, I will scatter you abroad among the nations: But if ye turn unto me, and keep my commandments, and do them; though there were of you cast out unto the uttermost part of the heaven, yet will I gather them from thence, and will bring them unto the place that I have chosen to set my name there* (Nehemiah 1:8-9). The scattering Moses named has come — *Yahuah (LORD) shall scatter you among the nations, and ye shall be left few in number among the heathen* (Deuteronomy 4:27) — but so was the gathering: *Yahuah Elohayka (the LORD thy God) will... return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee. If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:3-4). Jeremiah seals it — *I will gather you from all the nations, and from all the places whither I have driven you... and I will bring you again into the place whence I caused you to be carried away captive* (Jeremiah 29:14). And the ground of the hope: *he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers which he sware unto them* (Deuteronomy 4:31). This is the two-house regathering the framework treasures — Yahuah gathers the scattered who *turn unto me, and keep my commandments*, the Torah and the homecoming one promise.',
       sv.verse_id, ev.verse_id, 'free', 32102
  FROM _s316_neh01_lookup sv, _s316_neh01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-1-redeemed-by-thy-strong-hand-hear-thy-servants-prayer',
       E'Redeemed by thy strong hand — hear thy servant''s prayer',
       E'Nehemiah closes by laying hold of Yahuah''s own redeeming deed: *Now these are thy servants and thy people, whom thou hast redeemed by thy great power, and by thy strong hand* (Nehemiah 1:10). That is the language of the Exodus — *because Yahuah (LORD) loved you... hath Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen, from the hand of Pharaoh king of Egypt* (Deuteronomy 7:8): the same strong hand that broke Egypt is summoned to gather the captives now. He rests on the covenant-remembrance Moses promised even in exile — *I will for their sakes remember the covenant of their ancestors, whom I brought forth out of the land of Egypt... that I might be their Elohim (God): I am Yahuah (LORD)* (Leviticus 26:45). Then the petition: *let now thine ear be attentive to the prayer of thy servant... and grant him mercy in the sight of this man* (Nehemiah 1:11) — the very prayer Solomon set in the temple, *forgive thy people that have sinned against thee... and give them compassion before them who carried them captive, that they may have compassion on them* (1 Kings 8:50). Nehemiah asks Yahuah to turn the heart of the king toward mercy, and Yahuah will.',
       sv.verse_id, ev.verse_id, 'free', 32103
  FROM _s316_neh01_lookup sv, _s316_neh01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If I forget thee, O Jerusalem, let my right hand forget her cunning* (Psalm 137:5) — the exiles'' oath that Nehemiah''s weeping over the broken wall (Nehemiah 1:3-4) keeps.'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If I prefer not Jerusalem above my chief joy* (Psalm 137:6) — Nehemiah prefers the ruined city above his place in Shushan, and prays (Nehemiah 1:4).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt arise, and have mercy upon Zion: for the time to favour her... is come* (Psalm 102:13) — the set time Nehemiah''s fasting-prayer (Nehemiah 1:4) lays hold of.'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*For thy servants take pleasure in her stones, and favour the dust thereof* (Psalm 102:14) — the sign of coming mercy; Nehemiah grieves her ruined stones (Nehemiah 1:3-4).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I set my face unto Yahuah Elohim (the Lord God), to seek by prayer and supplications, with fasting, and sackcloth, and ashes* (Daniel 9:3) — Daniel''s posture over desolate Jerusalem, Nehemiah''s exactly (Nehemiah 1:4).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-broken-down-wall-drives-him-to-weep-and-pray'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Elohayka (the LORD thy God)... which keepeth covenant and mercy with them that love him and keep his commandments to a thousand generations* (Deuteronomy 7:9) — Moses'' words Nehemiah prays back (Nehemiah 1:5): mercy and commandment-keeping bound as one.'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-the-covenant-keeping-elohim-and-the-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments* (Daniel 9:4) — Daniel''s confession opens as Nehemiah''s does (Nehemiah 1:6).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-the-covenant-keeping-elohim-and-the-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*If they shall confess their iniquity, and the iniquity of their fathers, with their trespass which they trespassed against me* (Leviticus 26:40) — the Torah-prescribed confession Nehemiah makes (Nehemiah 1:7).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-the-covenant-keeping-elohim-and-the-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Elohayka (the LORD thy God) will... return and gather thee from all the nations, whither... hath scattered thee* (Deuteronomy 30:3) — the regathering covenant Nehemiah pleads back (Nehemiah 1:9).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-if-ye-turn-i-will-gather-them-from-thence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* (Deuteronomy 30:4) — Nehemiah quotes it almost word for word (Nehemiah 1:9).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-if-ye-turn-i-will-gather-them-from-thence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will gather you from all the nations, and from all the places whither I have driven you... and I will bring you again* (Jeremiah 29:14) — the gathering-from-all-nations promise Nehemiah leans on (Nehemiah 1:9).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-if-ye-turn-i-will-gather-them-from-thence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) shall scatter you among the nations, and ye shall be left few in number among the heathen* (Deuteronomy 4:27) — the scattering half of the word Nehemiah names (Nehemiah 1:8).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-if-ye-turn-i-will-gather-them-from-thence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he will not forsake thee, neither destroy thee, nor forget the covenant of thy fathers* (Deuteronomy 4:31) — the ground of Nehemiah''s hope that the cast-out will be gathered (Nehemiah 1:9).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-if-ye-turn-i-will-gather-them-from-thence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah (LORD) brought you out with a mighty hand, and redeemed you out of the house of bondmen* (Deuteronomy 7:8) — the strong hand of the Exodus Nehemiah invokes (Nehemiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-redeemed-by-thy-strong-hand-hear-thy-servants-prayer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*forgive thy people that have sinned against thee... and give them compassion before them who carried them captive* (1 Kings 8:50) — Solomon''s temple-prayer Nehemiah echoes (Nehemiah 1:11).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=11
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-redeemed-by-thy-strong-hand-hear-thy-servants-prayer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I will for their sakes remember the covenant of their ancestors... that I might be their Elohim (God): I am Yahuah (LORD)* (Leviticus 26:45) — the covenant-remembrance Nehemiah''s appeal to the redeemed people rests on (Nehemiah 1:10).'
  FROM cross_reference_threads t
  JOIN _s316_neh01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s316_neh01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-1-redeemed-by-thy-strong-hand-hear-thy-servants-prayer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_2.sql (Nehemiah 2) -----
-- Chapter: Nehemiah 2 — Nehemiah sent to rebuild the wall of Jerusalem
-- Tag: neh02 ; session prefix s316 ; temp view _s316_neh02_lookup
-- Slug prefix: nehemiah-2-... ; sort_order band start 32125 (+1 per thread)
-- Source book_slug=nehemiah, edition canon, chapter 2.
-- Member INSERT form: STANDARD with EXPLICIT LITERAL source verse. NO compact AS m(...) form.
--
-- Nehemiah 2 coverage:
--   v.1-8 (arrow-prayer / good hand of Elohim):
--        NT:     Philippians 4:6 (requests made known by prayer), Colossians 4:2-3 (continue in prayer)
--        Extras: none warranted (the prayer-married-to-action / king's-heart theme is canon-rooted; no clean extra-canonical witness adds weight)
--        Tanakh: Proverbs 21:1 (king's heart in Yahuah's hand), Nehemiah 1:11 (grant mercy in sight of this man), Ezra 7:6 / 7:9 (the good hand of Elohim upon him)
--   v.9-16 (the Elohim-given vision, prudent quiet preparation):
--        NT:     Philippians 2:13 (Elohim worketh in you to will and to do)
--        Extras: none warranted
--        Tanakh: Nehemiah 7:5 (my Elohim put into mine heart), Proverbs 16:9 (Yahuah directeth his steps)
--   v.17-20 (let us rise up and build / Yahuah will prosper us / adversaries' part refused):
--        NT:     1 Corinthians 15:58 (your labour is not in vain in Yahuah)
--        Extras: none warranted
--        Tanakh: Psalm 127:1 (except Yahuah build the house), Zechariah 4:6 (not by might but by my spirit), Ezra 5:1-2 (prophets help, they rose up to build), Nehemiah 6:16 (enemies perceived this work was of Elohim)
--
-- Threads (3):
--   nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand   [free]  (Tanakh+NT)
--   nehemiah-2-what-my-elohim-had-put-in-my-heart-to-do-at-jerusalem                 [free]  (Tanakh+NT)
--   nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us         [free]  (Tanakh+NT)
--
-- Framework-load-bearing framing:
--   ★2:4 — the instantaneous arrow-prayer BEFORE Nehemiah answers the king: prayer married to
--     action, not as substitute for it. The king grants the request "according to the good hand
--     of my Elohim upon me" (2:8) because "the king''s heart is in the hand of Yahuah" (Prov 21:1).
--   ★2:12 — the Elohim-given burden ("what my Elohim had put in my heart"); the vision is not
--     Nehemiah''s ambition but Yahuah working in him to will and to do (Phil 2:13; Neh 7:5).
--   ★2:18-20 — "let us rise up and build" + "the Elohim of heaven, he will prosper us": confidence
--     that Yahuah prospers the work (Ps 127:1; Zech 4:6; 1 Cor 15:58). The adversaries'' part is
--     refused ("ye have no portion, nor right, nor memorial, in Jerusalem") — the boundary of the
--     work, discernment of who is and is not building the covenant city, NOT ethnic hatred.

CREATE TEMP VIEW _s316_neh02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: arrow-prayer / king's heart in Yahuah's hand / the good hand of Elohim
    ('canon','nehemiah',2,4,  'canon','proverbs',21,1, 'free',
      E'*The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* (Proverbs 21:1). When the king asks *For what dost thou make request? So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4) — Nehemiah does not lean on his standing as cupbearer; he shoots an instant arrow-prayer heavenward before he opens his mouth, because the heart of Artaxerxes is not his to persuade but Yahuah''s to turn. Prayer married to action: he prays, then he speaks.'),
    ('canon','nehemiah',2,4,  'canon','nehemiah',1,11, 'free',
      E'*O Yahuah (Lord), I beseech thee, let now thine ear be attentive to the prayer of thy servant... and grant him mercy in the sight of this man. For I was the king''s cupbearer.* (Nehemiah 1:11). The arrow-prayer of *So I prayed to the Elohim (God) of heaven* (2:4) is the very petition of chapter one answered in the moment — months of *this day... grant him mercy in the sight of this man* now firing in a single breath before the throne.'),
    ('canon','nehemiah',2,4,  'canon','philippians',4,6, 'free',
      E'*Be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto Elohim (God).* (Philippians 4:6). The apostolic instruction is Nehemiah''s practice: *in every thing* — even the half-second between a king''s question and a servant''s answer — the request is first *made known unto Elohim*. *So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4) is the lived shape of made-known-by-prayer.'),
    ('canon','nehemiah',2,4,  'canon','colossians',4,2, 'free',
      E'*Continue in prayer, and watch in the same with thanksgiving.* (Colossians 4:2). Nehemiah''s instant cry, *So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4), is the fruit of a man who continues in prayer and watches — so that the petition is already on his lips when the moment comes. The watching and the asking are one posture.'),
    ('canon','nehemiah',2,8,  'canon','ezra',7,6, 'free',
      E'*...and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him.* (Ezra 7:6). The same idiom crowns Nehemiah: *And the king granted me, according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8). Ezra the scribe and Nehemiah the cupbearer are two servants moved by the one Hand; the king grants because Yahuah''s hand is upon the man.'),
    ('canon','nehemiah',2,8,  'canon','ezra',7,9, 'free',
      E'*...according to the good hand of his Elohim (God) upon him.* (Ezra 7:9). Word for word the phrase that seals Nehemiah''s petition — *the good hand of my Elohim (God) upon me* (Nehemiah 2:8). The restoration of Jerusalem runs on the good hand of Elohim, never on royal favour alone; the king is only the river that Yahuah turns.'),
    -- THREAD 2: what my Elohim had put in my heart / the Elohim-given vision
    ('canon','nehemiah',2,12, 'canon','nehemiah',7,5, 'free',
      E'*And my Elohim (God) put into mine heart to gather together the nobles, and the rulers, and the people, that they might be reckoned by genealogy...* (Nehemiah 7:5). The same hand that gave the burden gives the next step: *what my Elohim (God) had put in my heart to do at Jerusalem* (Nehemiah 2:12). The vision is not Nehemiah''s ambition but Yahuah''s deposit in his heart, unfolding work by work.'),
    ('canon','nehemiah',2,12, 'canon','philippians',2,13, 'free',
      E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure.* (Philippians 2:13). This is the inner engine of Nehemiah''s secret night-survey: *what my Elohim (God) had put in my heart to do at Jerusalem* (Nehemiah 2:12). The will to rebuild and the doing of it are both Elohim working in him — the man rides out at night carrying a purpose he did not author.'),
    ('canon','nehemiah',2,16, 'canon','proverbs',16,9, 'free',
      E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps.* (Proverbs 16:9). Nehemiah devises prudently — surveying by night, *neither had I as yet told it to the Yahudim (Jews)... nor to the rulers* (Nehemiah 2:16) — yet the devising serves a way Yahuah directs. The quiet preparation is wisdom; the steps are still ordered by Yahuah.'),
    -- THREAD 3: let us rise up and build / the Elohim of heaven will prosper us
    ('canon','nehemiah',2,18, 'canon','psalms',127,1, 'free',
      E'*Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain.* (Psalm 127:1). When the people answer *Let us rise up and build* and *strengthened their hands for this good work* (Nehemiah 2:18), it is on the strength of *the hand of my Elohim (God) which was good upon me* — for unless Yahuah builds the wall, the builders labour in vain. The good hand, not the strong hand of men, raises the city.'),
    ('canon','nehemiah',2,20, 'canon','zechariah',4,6, 'free',
      E'*...Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6). To the mockers Nehemiah answers *The Elohim (God) of heaven, he will prosper us; therefore we his servants will arise and build* (Nehemiah 2:20). The same confidence Zechariah speaks over Zerubbabel''s temple-work: the wall rises not by might nor by power but by the Spirit of Yahuah who prospers his servants'' hands.'),
    ('canon','nehemiah',2,20, 'canon','ezra',5,1, 'free',
      E'*Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* (Ezra 5:1). The wall-work of *we his servants will arise and build* (Nehemiah 2:20) stands in the same restoration as the temple-work — Yahuah raising up his servants to build Jerusalem against every adversary, prophet and governor and cupbearer alike.'),
    ('canon','nehemiah',2,20, 'canon','ezra',5,2, 'free',
      E'*Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* (Ezra 5:2). *Rose up... and began to build* is the very motion of Nehemiah''s *we his servants will arise and build* (Nehemiah 2:20). The covenant city is rebuilt by servants who rise at Yahuah''s word, with Elohim helping them — never by the adversaries who have *no portion, nor right, nor memorial, in Jerusalem*.'),
    ('canon','nehemiah',2,20, 'canon','1-corinthians',15,58, 'free',
      E'*Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord).* (1 Corinthians 15:58). Because *the Elohim (God) of heaven, he will prosper us* (Nehemiah 2:20), the builders'' labour is not in vain — the apostolic word names the same assurance that strengthened the hands at the wall: work that Yahuah prospers can never be wasted work.'),
    ('canon','nehemiah',2,18, 'canon','nehemiah',6,16, 'free',
      E'*...for they perceived that this work was wrought of our Elohim (God).* (Nehemiah 6:16). What the people grasp at the start — *the hand of my Elohim (God) which was good upon me* (Nehemiah 2:18) — the very enemies are forced to confess at the finish. The good work begun in the good hand of Elohim ends with the heathen cast down, perceiving the wall was wrought of Elohim.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand',
       E'So I Prayed to the Elohim of Heaven — the King''s Heart in Yahuah''s Hand',
       E'Standing before Artaxerxes, sad of countenance, Nehemiah is suddenly asked the dangerous question: *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4). Between the question and the answer there is no pause for the eye to see — only an arrow shot heavenward. This is prayer married to action, not prayer instead of it: he prays, then he speaks his bold petition to build Jerusalem. He knows the secret the proverb names — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). The cupbearer cannot persuade an emperor, but Yahuah can turn the emperor''s heart like water in a channel. The petition itself is the answer to a months-old cry: *O Yahuah (Lord), I beseech thee... grant him mercy in the sight of this man. For I was the king''s cupbearer* (Nehemiah 1:11). And the apostolic word is simply Nehemiah''s practice written as command — *in every thing by prayer and supplication with thanksgiving let your requests be made known unto Elohim (God)* (Philippians 4:6), the fruit of one who learned to *Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2). When the request is granted, Nehemiah names the true cause: *And the king granted me, according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8) — the same idiom that carried Ezra, *the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him* (Ezra 7:6), and brought him to Jerusalem *according to the good hand of his Elohim (God) upon him* (Ezra 7:9). The restoration of the city runs on the good hand of Elohim; the king is only the river Yahuah turns.',
       sv.verse_id, ev.verse_id, 'free', 32125
  FROM _s316_neh02_lookup sv, _s316_neh02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-2-what-my-elohim-had-put-in-my-heart-to-do-at-jerusalem',
       E'What My Elohim Had Put in My Heart — the Elohim-Given Vision',
       E'Come to Jerusalem, Nehemiah does not announce a building campaign. He waits, and at night with a few men he rides out alone to survey the broken wall — *neither told I any man what my Elohim (God) had put in my heart to do at Jerusalem* (Nehemiah 2:12). The vision is not his ambition; it is Yahuah''s deposit in his heart, and the prudent man guards it in silence until the time to speak. The same hand gives him the next step in due season: *And my Elohim (God) put into mine heart to gather together the nobles, and the rulers, and the people, that they might be reckoned by genealogy* (Nehemiah 7:5) — the burden unfolds work by work, always *put in my heart* by Elohim. This is the inner engine the apostle names: *For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13). The will to rebuild and the doing of it are both Elohim working in the man who rides the broken streets by moonlight. And the quiet preparation is itself wisdom — *neither had I as yet told it to the Yahudim (Jews)... nor to the rulers* (Nehemiah 2:16) — for *A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9). Nehemiah devises prudently; Yahuah directs the steps. The vision was given, the survey was hidden, and the timing was Yahuah''s.',
       sv.verse_id, ev.verse_id, 'free', 32126
  FROM _s316_neh02_lookup sv, _s316_neh02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us',
       E'Let Us Rise Up and Build — the Elohim of Heaven Will Prosper Us',
       E'Now Nehemiah rallies the people: *come, and let us build up the wall of Jerusalem, that we be no more a reproach. Then I told them of the hand of my Elohim (God) which was good upon me... And they said, Let us rise up and build. So they strengthened their hands for this good work* (Nehemiah 2:17-18). The willing hands are strengthened by one report — the good hand of Elohim — for *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1). When Sanballat, Tobiah, and Geshem laugh them to scorn, Nehemiah answers with confidence and a boundary: *The Elohim (God) of heaven, he will prosper us; therefore we his servants will arise and build: but ye have no portion, nor right, nor memorial, in Jerusalem* (Nehemiah 2:20). The prospering is Yahuah''s, by the same word spoken over Zerubbabel''s temple — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The wall-work stands in the same restoration as the temple-work, where *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God)... with them were the prophets of Elohim (God) helping them* (Ezra 5:1-2): servants who arise at Yahuah''s word, with Elohim helping them. The adversaries'' part is refused — not from hatred, but as the boundary of the covenant work: those who would not build the city have no claim in it. And because Yahuah prospers the work, the labour is sure — *your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58). What the people grasp at the start the enemies confess at the finish: *they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16).',
       sv.verse_id, ev.verse_id, 'free', 32127
  FROM _s316_neh02_lookup sv, _s316_neh02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- thread_members
-- ============================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The king''s heart is in the hand of Yahuah (LORD)... he turneth it whithersoever he will* (Proverbs 21:1) — the secret behind *So I prayed to the Elohim (God) of heaven* (Neh 2:4): the cupbearer cannot persuade the emperor, but Yahuah turns his heart like water.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...grant him mercy in the sight of this man. For I was the king''s cupbearer* (Nehemiah 1:11) — the months-old cry now fired in a single breath as *So I prayed to the Elohim (God) of heaven* (Neh 2:4).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in every thing by prayer and supplication with thanksgiving let your requests be made known unto Elohim (God)* (Philippians 4:6) — the apostolic command is Nehemiah''s practice: the request made known by prayer even in a half-second before a king.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Continue in prayer, and watch in the same with thanksgiving* (Colossians 4:2) — the watching posture that puts the petition already on the lips when the moment comes (*So I prayed*, Neh 2:4).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him* (Ezra 7:6) — the same idiom that crowns Nehemiah''s petition: *according to the good hand of my Elohim (God) upon me* (Neh 2:8).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*according to the good hand of his Elohim (God) upon him* (Ezra 7:9) — word for word the phrase that seals Nehemiah''s grant (Neh 2:8); the restoration runs on the good hand of Elohim.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-so-i-prayed-to-the-elohim-of-heaven-the-kings-heart-in-yahuahs-hand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And my Elohim (God) put into mine heart to gather together the nobles, and the rulers, and the people* (Nehemiah 7:5) — the same hand that gave the burden of *what my Elohim (God) had put in my heart* (Neh 2:12) gives the next step in due season.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=7 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-what-my-elohim-had-put-in-my-heart-to-do-at-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*For it is Elohim (God) which worketh in you both to will and to do of his good pleasure* (Philippians 2:13) — the inner engine of the man who rides the broken streets carrying *what my Elohim (God) had put in my heart to do* (Neh 2:12).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=12
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-what-my-elohim-had-put-in-my-heart-to-do-at-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*A man''s heart deviseth his way: but Yahuah (LORD) directeth his steps* (Proverbs 16:9) — the prudent quiet survey of *neither had I as yet told it to the Yahudim (Jews)... nor to the rulers* (Neh 2:16) is devising; the steps are still ordered by Yahuah.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=16
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-what-my-elohim-had-put-in-my-heart-to-do-at-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Except Yahuah (LORD) build the house, they labour in vain that build it* (Psalm 127:1) — the willing hands of *Let us rise up and build... So they strengthened their hands* (Neh 2:18) rest on the good hand of Elohim, not the strong hand of men.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the same confidence over Zerubbabel''s temple that Nehemiah speaks: *The Elohim (God) of heaven, he will prosper us* (Neh 2:20).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews)...* (Ezra 5:1) — the wall-work of *we his servants will arise and build* (Neh 2:20) stands in the same restoration as the temple-work.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Then rose up Zerubbabel... and began to build the house of Elohim (God)... with them were the prophets of Elohim (God) helping them* (Ezra 5:2) — *rose up... and began to build* is the very motion of *we his servants will arise and build* (Neh 2:20).'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58) — because *the Elohim (God) of heaven, he will prosper us* (Neh 2:20), the work Yahuah prospers can never be wasted work.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=20
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16) — what the people grasp at the start (*the hand of my Elohim... good upon me*, Neh 2:18) the enemies are forced to confess at the finish.'
  FROM cross_reference_threads t
  JOIN _s316_neh02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=2 AND sv.verse_number=18
  JOIN _s316_neh02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-2-let-us-rise-up-and-build-the-elohim-of-heaven-will-prosper-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_3.sql (Nehemiah 3) -----
-- Book: Nehemiah  Chapter: 3  (the builders of the wall, each at his portion)
-- Tag: neh03   Session prefix: s316   Temp view: _s316_neh03_lookup
-- Slug prefix: nehemiah-3-...   Sort band start: 32150 (+1 per thread)
-- Source: edition 'canon', book_slug 'nehemiah', chapter 3
--
-- Nehemiah 3 coverage:
--   v.1  (Eliashib + priests build & SANCTIFY the sheep gate)
--        NT:     John 5:2 (pool by the sheep market), John 10:7/10:9 (I am the door of the sheep) — WARRANTED (thread 1)
--        Extras: none warranted
--        Tanakh: none warranted (lateral self-evident within the register)
--   v.1 (start) .. v.28 (end)  (corporate building: each family repairing "over against his house," fitly joined)
--        NT:     1 Cor 12:12/12:18/12:25 (body, many members each set in place), Eph 4:16 (whole body fitly joined),
--                Eph 2:20/2:21/2:22 (built together for a habitation of Elohim), Rom 12:4/12:5 (many members one body) — WARRANTED (thread 2)
--        Extras: none warranted
--        Tanakh: Neh 4:6 (the people had a mind to work) — WARRANTED, lateral self-link (thread 2)
--   v.5  (the Tekoites' nobles put not their necks to the work of their Lord — the contrast)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Judges 5:23 (curse ye Meroz... they came not to the help of Yahuah) — WARRANTED (thread 3)
--   vv.2-4,6-32 (the register of named builders, gates, towers, portions)
--        NT/Extras/Tanakh: none warranted individually — folded into the corporate-building thread (thread 2)
--                          via the keystone "over against his house" verses (10, 23, 28); names not threaded one-by-one
--
-- Threads:
--   1. nehemiah-3-the-priests-builded-and-sanctified-the-sheep-gate  (free)  -> canon NT: John 5:2, John 10:7, John 10:9
--   2. nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined  (free)
--        -> canon Tanakh: Neh 4:6 ; canon NT: 1Cor 12:12, 12:18, 12:25, Eph 4:16, Eph 2:20, 2:21, 2:22, Rom 12:4, 12:5
--   3. nehemiah-3-their-nobles-put-not-their-necks-to-the-work-of-their-lord  (free)  -> canon Tanakh: Judges 5:23 (Meroz)

CREATE TEMP VIEW _s316_neh03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the priests build and SANCTIFY the sheep gate (3:1)
    ('canon','nehemiah',3,1,'canon','john',5,2,'free',
     E'*Now there is at Jerusalem by the sheep market a pool, which is called in the Hebrew tongue Bethesda, having five porches.* (John 5:2). When Eliashib the high priest and the priests *builded the sheep gate; they sanctified it* (Nehemiah 3:1), they set apart the very gate by which the sheep of the offering entered toward the temple. By that same sheep gate stood the pool where Yahusha (Jesus) healed — the holy place where the flock is gathered and made whole.'),
    ('canon','nehemiah',3,1,'canon','john',10,7,'free',
     E'*Then said Yahusha (Jesus) unto them again, Verily, verily, I say unto you, I am the door of the sheep.* (John 10:7). The priests *set up the doors of it* on the sheep gate they had *sanctified* (Nehemiah 3:1); the Formed Son is himself the Door of the sheep, the consecrated entrance into the fold of Yahuah''s people.'),
    ('canon','nehemiah',3,1,'canon','john',10,9,'free',
     E'*I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* (John 10:9). The sheep gate that Eliashib *sanctified* and whose *doors* he hung (Nehemiah 3:1) is the figure the Shepherd fulfils: the one holy entrance through which the flock goes in and out and finds pasture.'),

    -- Thread 2: corporate building, each over against his house, fitly joined (3:1 start .. 3:28 end)
    ('canon','nehemiah',3,10,'canon','nehemiah',4,6,'free',
     E'*So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* (Nehemiah 4:6). Each man repaired *over against his house* (Nehemiah 3:10), and the result was a wall *joined together* by *the people''s* willing mind — the same corporate labour, each in his place, that builds the people of Yahuah.'),
    ('canon','nehemiah',3,10,'canon','1-corinthians',12,12,'free',
     E'*For as the body is one, and hath many members, and all the members of that one body, being many, are one body: so also is Messiah (Christ).* (1 Corinthians 12:12). The builders repairing each *over against his house* (Nehemiah 3:10) are the living figure: many members, each at his own portion, joined into one body and one wall.'),
    ('canon','nehemiah',3,10,'canon','1-corinthians',12,18,'free',
     E'*But now hath Elohim (God) set the members every one of them in the body, as it hath pleased him.* (1 Corinthians 12:18). As Elohim sets *every one* of the members in its place, so every family was assigned its own section — Jedaiah *over against his house* (Nehemiah 3:10), each builder set where the work needed him.'),
    ('canon','nehemiah',3,10,'canon','1-corinthians',12,25,'free',
     E'*That there should be no schism in the body; but that the members should have the same care one for another.* (1 Corinthians 12:25). The seamless register — *next unto him... next unto them... after him* — repairing each *over against his house* (Nehemiah 3:10) is the wall without schism, every member caring for the portion joined to his own.'),
    ('canon','nehemiah',3,10,'canon','ephesians',4,16,'free',
     E'*From whom the whole body fitly joined together and compacted by that which every joint supplieth, according to the effectual working in the measure of every part, maketh increase of the body unto the edifying of itself in love.* (Ephesians 4:16). The wall built family by family, each *over against his house* (Nehemiah 3:10), is the body *fitly joined together*, every part supplying its measure so the whole increases.'),
    ('canon','nehemiah',3,10,'canon','ephesians',2,20,'free',
     E'*And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone.* (Ephesians 2:20). The builders raising the wall to *the turning of the wall, even unto the corner* (Nehemiah 3:24) and each *over against his house* (Nehemiah 3:10) prefigure the people built upon a foundation, the Messiah himself the chief corner stone.'),
    ('canon','nehemiah',3,10,'canon','ephesians',2,21,'free',
     E'*In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord).* (Ephesians 2:21). The wall *joined together* by every family at its portion (Nehemiah 3:10) is the figure of the building *fitly framed together*, growing into a holy temple in Yahuah.'),
    ('canon','nehemiah',3,10,'canon','ephesians',2,22,'free',
     E'*In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* (Ephesians 2:22). The people who *builded* each *over against his house* (Nehemiah 3:10) are the standing type: a people *builded together* to be the very habitation of Elohim.'),
    ('canon','nehemiah',3,10,'canon','romans',12,4,'free',
     E'*For as we have many members in one body, and all members have not the same office.* (Romans 12:4). Goldsmiths, apothecaries, rulers, priests, and daughters all repaired, each a different office at a different portion *over against his house* (Nehemiah 3:10) — many members, one body, not all the same office.'),
    ('canon','nehemiah',3,10,'canon','romans',12,5,'free',
     E'*So we, being many, are one body in Messiah (Christ), and every one members one of another.* (Romans 12:5). The builders, *being many*, raised one wall, *every one* fastened to the section *next unto him* and *over against his house* (Nehemiah 3:10) — members one of another in one body.'),

    -- Thread 3: the nobles who would not labor (3:5)
    ('canon','nehemiah',3,5,'canon','judges',5,23,'free',
     E'*Curse ye Meroz, said the angel of Yahuah (LORD), curse ye bitterly the inhabitants thereof; because they came not to the help of Yahuah (LORD), to the help of Yahuah (LORD) against the mighty.* (Judges 5:23). While every family bent to the work, the Tekoites'' *nobles put not their necks to the work of their Lord* (Nehemiah 3:5) — the same withholding from the labour of Yahuah that brought the curse of Meroz upon those who came not to his help.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
-- Thread 1: sheep gate sanctified
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-3-the-priests-builded-and-sanctified-the-sheep-gate',
       E'The priests builded and sanctified the sheep gate',
       E'The register of the wall opens with the priesthood: *Then Eliashib the high priest rose up with his brethren the priests, and they builded the sheep gate; they sanctified it, and set up the doors of it* (Nehemiah 3:1). The first gate raised is the sheep gate — the entrance toward the temple by which the flock of the offering passed — and the priests do not merely build it, they **sanctify** it and hang its doors. The Gospel stands on this consecrated ground: *Now there is at Jerusalem by the sheep market a pool, which is called in the Hebrew tongue Bethesda, having five porches* (John 5:2), where the Formed Son healed by that very gate. And he names himself the gate the priests set apart: *I am the door of the sheep* (John 10:7), *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture* (John 10:9). The sheep gate sanctified by Eliashib is the figure of the one holy Door through whom the flock of Yahuah is gathered, kept, and pastured.',
       sv.verse_id, ev.verse_id, 'free', 32150
  FROM _s316_neh03_lookup sv, _s316_neh03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: corporate building, each over against his house
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined',
       E'Every one over against his house: the whole people built together, fitly joined',
       E'Nehemiah 3 is a register of names, and its rhythm is the lesson: *next unto him... next unto them... after him*, family after family, *every one over against his house* (Nehemiah 3:28; see also 3:10, 3:23). Goldsmiths and apothecaries (3:8), rulers of half-districts (3:9,12), a man *and his daughters* (3:12), the Levites (3:17), priests (3:22,28) — each set to the portion beside his own dwelling, each office different, all framed into one wall. The next chapter names the fruit of it: *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work* (Nehemiah 4:6). This is the standing figure of the people of Yahuah as one built body: *For as the body is one, and hath many members, and all the members of that one body, being many, are one body* (1 Corinthians 12:12); *But now hath Elohim (God) set the members every one of them in the body, as it hath pleased him* (1 Corinthians 12:18); *that there should be no schism in the body; but that the members should have the same care one for another* (1 Corinthians 12:25). Paul says it again of the whole structure: *From whom the whole body fitly joined together and compacted by that which every joint supplieth, according to the effectual working in the measure of every part, maketh increase of the body unto the edifying of itself in love* (Ephesians 4:16) — the wall *joined together* (Nehemiah 4:6) is the body *fitly joined together*, each joint supplying its measure. And the building rises into a dwelling-place: *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20); *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21); *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). So too Romans: *For as we have many members in one body, and all members have not the same office* (Romans 12:4); *So we, being many, are one body in Messiah (Christ), and every one members one of another* (Romans 12:5). The wall built each *over against his house* is the people of Yahuah fitly framed together — many members, each doing his part, one habitation of Elohim.',
       sv.verse_id, ev.verse_id, 'free', 32151
  FROM _s316_neh03_lookup sv, _s316_neh03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=3 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: the nobles who would not labor
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-3-their-nobles-put-not-their-necks-to-the-work-of-their-lord',
       E'Their nobles put not their necks to the work of their Lord',
       E'Into the long roll of willing builders falls one sharp note of contrast: *And next unto them the Tekoites repaired; but their nobles put not their necks to the work of their Lord* (Nehemiah 3:5). The common Tekoites bent to the labour — and repaired a second portion later (3:27) — but their great men would not bow their necks to it. The same withholding from the work of Yahuah drew down the curse of Meroz in the song of Deborah: *Curse ye Meroz, said the angel of Yahuah (LORD), curse ye bitterly the inhabitants thereof; because they came not to the help of Yahuah (LORD), to the help of Yahuah (LORD) against the mighty* (Judges 5:23). When Yahuah''s people are summoned to his work — wall or war — to stand aside is not neutrality but offence; the labour is *the work of their Lord*, and the nobles who spared their necks are weighed against Meroz who came not to his help.',
       sv.verse_id, ev.verse_id, 'free', 32152
  FROM _s316_neh03_lookup sv, _s316_neh03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Now there is at Jerusalem by the sheep market a pool* (John 5:2) — the Formed Son healed by the very sheep gate the priests sanctified.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-the-priests-builded-and-sanctified-the-sheep-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the door of the sheep* (John 10:7) — the consecrated gate the priests set up is the Son himself.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-the-priests-builded-and-sanctified-the-sheep-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I am the door: by me if any man enter in, he shall be saved... and find pasture* (John 10:9) — the sheep gate fulfilled as the one holy entrance to the fold.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-the-priests-builded-and-sanctified-the-sheep-gate'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all the wall was joined together... for the people had a mind to work* (Nehemiah 4:6) — the fruit of every family at its portion.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the body is one, and hath many members... so also is Messiah (Christ)* (1 Corinthians 12:12) — many builders, one wall, one body.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*hath Elohim (God) set the members every one of them in the body* (1 Corinthians 12:18) — each builder set where the work needed him.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*no schism in the body; but that the members should have the same care one for another* (1 Corinthians 12:25) — the wall without schism, each caring for the portion next to his.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=12 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the whole body fitly joined together... every part, maketh increase* (Ephesians 4:16) — the wall joined family by family, each joint supplying its measure.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*built upon the foundation... Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20) — the wall to the corner prefigures the people built on the corner stone.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21) — the wall joined together growing into a holy temple.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22) — the people builded together to be the dwelling of Elohim.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*we have many members in one body, and all members have not the same office* (Romans 12:4) — goldsmith, ruler, priest, daughters: different offices, one wall.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*being many, are one body in Messiah (Christ), and every one members one of another* (Romans 12:5) — the many builders fastened each to the section next to him.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-every-one-over-against-his-house-the-whole-people-built-together-fitly-joined'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Curse ye Meroz... because they came not to the help of Yahuah (LORD)* (Judges 5:23) — the nobles who spared their necks weighed against Meroz who came not to the work.'
  FROM cross_reference_threads t
  JOIN _s316_neh03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s316_neh03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-3-their-nobles-put-not-their-necks-to-the-work-of-their-lord'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_4.sql (Nehemiah 4) -----
-- Book: Nehemiah  Chapter: 4  (building the wall amid opposition)
-- Tag: neh04   Session prefix: s316   Temp view: _s316_neh04_lookup
-- Slug prefix: nehemiah-4-...   Sort band start: 32175 (+1 per thread)
-- Source: canon / nehemiah / ch 4. All targets canon (Tanakh + NT) => every thread tier 'free'.
--
-- Nehemiah 4 coverage:
--   v.1-3  (Sanballat/Tobiah mock; "if a fox go up he shall break down their stone wall")
--          NT:     none warranted (mockery folded into the prayer thread v.4-6 context)
--          Extras: none warranted
--          Tanakh: none warranted (reproach answered in prayer thread below)
--   v.4-6  (Nehemiah's prayer against the reproach; "the people had a mind to work" -> wall to half)
--          NT:     Colossians 3:23 (do it heartily as to Yahuah) -- the willing-hearted labor
--          Extras: none warranted
--          Tanakh: Psalm 69:9 (zeal of thine house / reproaches fallen on me); Nehemiah 6:16 (wall finished, enemies see it was wrought of our Elohim)
--   v.7-9  (adversaries conspire; "we made our prayer... and set a watch... day and night")
--          NT:     Matthew 26:41 (watch and pray); Luke 21:36 (watch and pray always)
--          Extras: none warranted
--          Tanakh: Psalm 127:1 (except Yahuah keep the city, the watchman waketh in vain)
--          NT add: 1 Peter 5:8 (be vigilant; adversary as a roaring lion)
--   v.10-13 (rubbish/discouragement; Nehemiah arms the people by families) -> folded into v.7-9 watch context + v.14 courage thread
--          NT/Extras/Tanakh: none warranted standalone
--   v.14   (Be not afraid; "remember Yahuah... and fight for your brethren, your sons and daughters")
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 1:29-30 (dread not, Yahuah goeth before you, he shall fight for you); Deuteronomy 20:3-4 (fear not, Yahuah goeth with you to fight); Psalm 20:7 (some trust in chariots, we remember the name of Yahuah)
--   v.15-21 (every one with one hand wrought, the other held a weapon; "our Elohim shall fight for us")
--          NT:     Ephesians 6:10-17 (whole armour / sword of the Spirit); 2 Corinthians 10:4 (weapons of our warfare mighty through Elohim)
--          Extras: none warranted
--          Tanakh: Exodus 14:13-14 (Yahuah shall fight for you); Zechariah 4:6 (not by might nor power but by my spirit)
--   v.22-23 (lodge within Jerusalem, a guard by night, none put off clothes) -> folded into the labor-and-warfare thread v.16-23
--          NT/Extras/Tanakh: none warranted standalone
--
-- THREADS (4):
--   nehemiah-4-the-people-had-a-mind-to-work          v4-6  free  [Tanakh + NT]
--   nehemiah-4-we-made-our-prayer-and-set-a-watch      v7-9  free  [Tanakh + NT]
--   nehemiah-4-remember-yahuah-and-fight-for-your-brethren  v14  free [Tanakh]
--   nehemiah-4-our-elohim-shall-fight-for-us           v16-23 free [Tanakh + NT]

CREATE TEMP VIEW _s316_neh04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- B. cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: a mind to work (v.4-6)
    ('canon','nehemiah',4,5,'canon','psalms',69,9,'free',
     E'*For the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me* (Psalm 69:9). Nehemiah''s plea — *Hear, O our Elohim (God); for we are despised... for they have provoked thee to anger before the builders* (Nehemiah 4:5) — is the same zeal-for-the-house posture: the reproach hurled at the builders is reproach against Yahuah himself, and the servant lays it before him rather than answering the mockers in kind.'),
    ('canon','nehemiah',4,6,'canon','colossians',3,23,'free',
     E'*And what soever ye do, do it heartily, as to Yahuah (Lord), and not unto men* (Colossians 3:23). The wall rose to half its height *for the people had a mind to work* (Nehemiah 4:6) — the willing, whole-hearted labor done unto Yahuah, the same heart the NT names as the spring of all true work.'),
    ('canon','nehemiah',4,6,'canon','nehemiah',6,16,'free',
     E'*And it came to pass, that when all our enemies heard thereof... they were much cast down in their own eyes: for they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16). The wall begun by a people who *had a mind to work* (Nehemiah 4:6) is finished as a work plainly wrought of Elohim — the willing heart and the divine hand together bring the labor to its end.'),
    -- Thread 2: prayer married to the watch (v.7-9)
    ('canon','nehemiah',4,9,'canon','psalms',127,1,'free',
     E'*Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1). Nehemiah does not choose between trust and toil — *Nevertheless we made our prayer unto our Elohim (God), and set a watch against them day and night* (Nehemiah 4:9). He prays because Yahuah keeps the city, AND he sets the watchman because the keeping is worked through diligence, not instead of it.'),
    ('canon','nehemiah',4,9,'canon','matthew',26,41,'free',
     E'*Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak* (Matthew 26:41). The Master joins the very two acts Nehemiah joined — *we made our prayer unto our Elohim (God), and set a watch* (Nehemiah 4:9): prayer and vigilance are one discipline, never an excuse for passivity.'),
    ('canon','nehemiah',4,9,'canon','luke',21,36,'free',
     E'*Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam* (Luke 21:36). Nehemiah''s wall-builders watching *day and night* while they *made our prayer unto our Elohim (God)* (Nehemiah 4:9) are the pattern of the watching-and-praying servant who stands at the end.'),
    ('canon','nehemiah',4,9,'canon','1-peter',5,8,'free',
     E'*Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). The conspiring adversaries who came to *fight against Jerusalem, and to hinder it* (Nehemiah 4:8) are answered by the same vigilance the apostle commands — *set a watch against them day and night* (Nehemiah 4:9), for the enemy is always prowling.'),
    -- Thread 3: remember Yahuah and fight for your brethren (v.14)
    ('canon','nehemiah',4,14,'canon','deuteronomy',1,30,'free',
     E'*Yahuah Elohaychem (The LORD your God) which goeth before you, he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30). Nehemiah''s charge — *Be not ye afraid of them: remember Yahuah (Lord), which is great and terrible, and fight for your brethren* (Nehemiah 4:14) — rests on the Torah word Moses spoke: courage is not self-confidence but the memory of the Yahuah who goes before and fights for his people.'),
    ('canon','nehemiah',4,14,'canon','deuteronomy',20,4,'free',
     E'*For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4). The priest''s battle charge in Torah is the root of Nehemiah''s — *remember Yahuah (Lord), which is great and terrible, and fight for your brethren, your sons, and your daughters, your wives, and your houses* (Nehemiah 4:14): the people stand for their households precisely because Yahuah stands and fights for them.'),
    ('canon','nehemiah',4,14,'canon','psalms',20,7,'free',
     E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Nehemiah''s remedy for fear is to *remember Yahuah (Lord), which is great and terrible* (Nehemiah 4:14) — the same remembering of the Name the psalm sets against every trust in arms.'),
    -- Thread 4: our Elohim shall fight for us (v.16-23)
    ('canon','nehemiah',4,20,'canon','ephesians',6,17,'free',
     E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The builders who *every one with one of his hands wrought in the work, and with the other hand held a weapon* (Nehemiah 4:17), trusting that *our Elohim (God) shall fight for us* (Nehemiah 4:20), are the type the apostle fills: the people of Yahuah labor and war at once, armed with the whole armour and the sword of the Spirit.'),
    ('canon','nehemiah',4,17,'canon','ephesians',6,11,'free',
     E'*Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11). *Every one with one of his hands wrought in the work, and with the other hand held a weapon* (Nehemiah 4:17) — the wall-builder armed is the living picture of the believer who builds and stands armed against every assault.'),
    ('canon','nehemiah',4,20,'canon','exodus',14,14,'free',
     E'*Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). Nehemiah''s rallying word — *our Elohim (God) shall fight for us* (Nehemiah 4:20) — is the Red Sea promise carried forward: the people take up sword and trowel, yet the victory is Yahuah''s, who fights for them.'),
    ('canon','nehemiah',4,20,'canon','2-corinthians',10,4,'free',
     E'*(For the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds;)* (2 Corinthians 10:4). The sword girded by every builder''s side (Nehemiah 4:18) under the confession *our Elohim (God) shall fight for us* (Nehemiah 4:20) becomes, in the NT, the warfare whose true might is not in the steel but in Elohim.'),
    ('canon','nehemiah',4,20,'canon','zechariah',4,6,'free',
     E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The same post-exilic rebuilding hears the same word: armed though the builders are, their confession *our Elohim (God) shall fight for us* (Nehemiah 4:20) confesses with Zerubbabel that the work stands not by force of arms but by the Spirit of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- C. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-4-the-people-had-a-mind-to-work',
       E'The People Had a Mind to Work — the Prayer and the Willing Heart that Build',
       E'When Sanballat and Tobiah mock the builders — *will they fortify themselves?... if a fox go up, he shall even break down their stone wall* (Nehemiah 4:2-3) — Nehemiah does not return the taunt; he turns it into prayer: *Hear, O our Elohim (God); for we are despised... for they have provoked thee to anger before the builders* (Nehemiah 4:5). The reproach against the builders is reproach against Yahuah, the very zeal the psalmist names: *For the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me* (Psalm 69:9). Then the answer to the mockery is simply the work itself: *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work* (Nehemiah 4:6) — the whole-hearted labor the NT commands, *And what soever ye do, do it heartily, as to Yahuah (Lord), and not unto men* (Colossians 3:23). And the willing heart is brought to its end by the hand of Elohim, for in the same book *when all our enemies heard thereof... they were much cast down in their own eyes: for they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16). The mind to work and the work wrought of Elohim are one.',
       sv.verse_id, ev.verse_id, 'free', 32175
  FROM _s316_neh04_lookup sv, _s316_neh04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-4-we-made-our-prayer-and-set-a-watch',
       E'We Made Our Prayer and Set a Watch — Prayer Married to Vigilance',
       E'When the adversaries *conspired all of them together to come and to fight against Jerusalem, and to hinder it* (Nehemiah 4:8), Nehemiah''s response is not one act but two held together: *Nevertheless we made our prayer unto our Elohim (God), and set a watch against them day and night, because of them* (Nehemiah 4:9). This is the whole posture of faith — never trust without diligence, never diligence without trust. The psalm sets the balance: *Except Yahuah (LORD) build the house, they labour in vain that build it: except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1) — Yahuah keeps the city, and so the watchman watches, for the watch is the very means of his keeping. The Master joins the same two words to his disciples: *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak* (Matthew 26:41); *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam* (Luke 21:36). And the reason the watch never sleeps is the prowling enemy: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8). Prayer and the watch, day and night, are one obedience.',
       sv.verse_id, ev.verse_id, 'free', 32176
  FROM _s316_neh04_lookup sv, _s316_neh04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-4-remember-yahuah-and-fight-for-your-brethren',
       E'Remember Yahuah and Fight for Your Brethren — Courage Rooted in the Yahuah Who Fights',
       E'To a people worn down by rubbish and threat, Nehemiah lifts his charge: *Be not ye afraid of them: remember Yahuah (Lord), which is great and terrible, and fight for your brethren, your sons, and your daughters, your wives, and your houses* (Nehemiah 4:14). The courage he commands is not self-reliance — it is memory. It is the Torah word Moses gave at the border: *Yahuah Elohaychem (The LORD your God) which goeth before you, he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30); and the priest''s charge before battle, *For Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4). The people stand for their households precisely because Yahuah stands for them. So the psalm names the remedy for every fear: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7). Remember Yahuah, and the fear for wife, son, daughter, and house turns into the courage to fight.',
       sv.verse_id, ev.verse_id, 'free', 32177
  FROM _s316_neh04_lookup sv, _s316_neh04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=4 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-4-our-elohim-shall-fight-for-us',
       E'Our Elohim Shall Fight for Us — the Laborer Armed, the Battle the Master''s',
       E'The wall is built by a people who refuse to set down either the trowel or the sword: *They which builded on the wall, and they that bare burdens, with those that laded, every one with one of his hands wrought in the work, and with the other hand held a weapon* (Nehemiah 4:17); *For the builders, every one had his sword girded by his side, and so builded* (Nehemiah 4:18). Yet the strength is not in the steel — it is in the confession Nehemiah gives them: *our Elohim (God) shall fight for us* (Nehemiah 4:20). This is the Red Sea word carried into the rebuilding: *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14), and the same Spirit-word to Zerubbabel''s generation, *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The NT fills the type whole: the believer builds and stands armed at once — *Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11), *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17) — for *the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4). The hand that labors and the hand that wars are both the hand of a people who trust that Yahuah fights for them.',
       sv.verse_id, ev.verse_id, 'free', 32178
  FROM _s316_neh04_lookup sv, _s316_neh04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=4 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- D. thread_members
-- ============================================================
-- Thread 1: a mind to work
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me* (Psalm 69:9) — the reproach against the builders is reproach against Yahuah.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=5
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-the-people-had-a-mind-to-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And what soever ye do, do it heartily, as to Yahuah (Lord), and not unto men* (Colossians 3:23) — the whole-hearted labor that built the wall to half its height.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-the-people-had-a-mind-to-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16) — the willing heart brought to its finish by the hand of Elohim.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-the-people-had-a-mind-to-work'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: prayer and the watch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*except Yahuah (LORD) keep the city, the watchman waketh but in vain* (Psalm 127:1) — Yahuah keeps the city, and so the watch is set.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=127 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-we-made-our-prayer-and-set-a-watch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Watch and pray, that ye enter not into temptation* (Matthew 26:41) — the Master joins the very two acts Nehemiah joined.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-we-made-our-prayer-and-set-a-watch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Watch ye therefore, and pray always... to stand before the Son of Adam* (Luke 21:36) — the watching-and-praying servant who stands at the end.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-we-made-our-prayer-and-set-a-watch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about* (1 Peter 5:8) — why the watch never sleeps.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=9
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-we-made-our-prayer-and-set-a-watch'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: remember Yahuah and fight for your brethren
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he shall fight for you, according to all that he did for you in Egypt before your eyes* (Deuteronomy 1:30) — Moses'' word: courage is the memory of the Yahuah who goes before.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-remember-yahuah-and-fight-for-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah Elohaychem (the LORD your God) is he that goeth with you, to fight for you against your enemies, to save you* (Deuteronomy 20:4) — the priest''s battle charge that roots Nehemiah''s.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-remember-yahuah-and-fight-for-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God)* (Psalm 20:7) — the remembering of the Name set against every trust in arms.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-remember-yahuah-and-fight-for-your-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: our Elohim shall fight for us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Put on the whole armour of Elohim (God), that ye may be able to stand against the wiles of the devil* (Ephesians 6:11) — the builder armed (Nehemiah 4:17) made the picture of the believer who builds and stands armed.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-our-elohim-shall-fight-for-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17) — the type filled whole: labor and warfare at once under *our Elohim shall fight for us*.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-our-elohim-shall-fight-for-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14) — the Red Sea promise carried into the rebuilding.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-our-elohim-shall-fight-for-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the weapons of our warfare are not carnal, but mighty through Elohim (God) to the pulling down of strong holds* (2 Corinthians 10:4) — the might is not in the steel but in Elohim.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-our-elohim-shall-fight-for-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the same post-exilic rebuilding hears: the work stands by the Spirit, not by arms.'
  FROM cross_reference_threads t
  JOIN _s316_neh04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=4 AND sv.verse_number=20
  JOIN _s316_neh04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-4-our-elohim-shall-fight-for-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_5.sql (Nehemiah 5) -----
-- Book: Nehemiah  chapter 5   tag: neh05   session prefix: s316
-- sort_order band start: 32200 (+1 per thread)
-- temp view: _s316_neh05_lookup
--
-- Nehemiah 5 coverage:
--   v.1-5  (the cry of the people; mortgaged lands, children into bondage)
--          NT:     Matthew 18:28-33 (unmerciful servant), James 5:4 (cry of the defrauded)
--          Extras: Ecclesiasticus 34:21-22 (defraud the poor = bloodshed)
--          Tanakh: woven into the usury thread (Exod/Lev/Deut)
--   v.6-13 (Nehemiah rebukes the nobles: ye exact usury of his brother; restore;
--           walk in the fear of our Elohim)
--          NT:     Matthew 18:28-33, James 5:4
--          Extras: Ecclesiasticus 29:1 (he that strengtheneth his hand keepeth the commandments)
--          Tanakh: Exod 22:25, Lev 25:35-37, Deut 23:19-20, Deut 15:7-11, Ezek 18:8,
--                  Ezek 22:12, Ps 15:5, Prov 28:8 (Torah's usury prohibition / the release)
--   v.14-18 (Nehemiah ate not the governor's bread, because of the fear of Elohim;
--            fed many; the bondage heavy on the people)
--          NT:     1 Peter 5:2-3 (not for filthy lucre, not lords), 1 Thess 2:5-9 (no cloke
--                  of covetousness), 1 Cor 9:12-15 (used not this power), Acts 20:33-35
--          Extras: none warranted
--          Tanakh: none warranted (NT servant-leader weave carries it)
--   v.19  (Think upon me, my Elohim, for good)
--          NT:     folded into v.14-18 thread (the appeal to Yahuah who remembers)
--          Extras: none warranted
--          Tanakh: none warranted
--
-- THREADS:
--   1. nehemiah-5-thou-shalt-not-lay-upon-him-usury  (v.7 -> v.13)  [extras]
--      targets: canon Torah/Prophets/Writings (Exod22, Lev25, Deut23, Deut15, Ezek18,
--               Ezek22, Ps15, Prov28) + extras Ecclesiasticus 29:1
--      FRAME: usury on the brethren rebuked = the Torah's standing prohibition; "fear thy
--      Elohim" (Lev 25:36) the ground of the rebuke. Torah affirmed as the standard of
--      justice and mercy to the poor, NOT abolished.
--   2. nehemiah-5-the-cry-of-the-oppressed-brethren  (v.1 -> v.13)  [extras]
--      targets: NT Matthew 18:28-33, James 5:4 + extras Ecclesiasticus 34:21-22
--      FRAME: the cry of the defrauded poor enters the ears of Yahuah; the unmerciful
--      servant who would not release as he was released; defrauding the poor = bloodshed.
--   3. nehemiah-5-not-eaten-the-bread-of-the-governor  (v.14 -> v.19)  [free]
--      targets: NT 1 Peter 5:2-3, 1 Thess 2:5-9, 1 Cor 9:12-15, Acts 20:33-35
--      FRAME: the servant-leader who refuses to exploit his office "because of the fear of
--      Elohim"; the shepherd who feeds the flock not for filthy lucre.

CREATE TEMP VIEW _s316_neh05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: thou shalt not lay upon him usury (the Torah's prohibition)
    ('canon','nehemiah',5,7,'canon','exodus',22,25,'free',
     E'*If thou lend money to any of my people that is poor by thee, thou shalt not be to him as an usurer, neither shalt thou lay upon him usury* (Exodus 22:25). When Nehemiah charges the nobles, *Ye exact usury, every one of his brother* (Nehemiah 5:7), he is not inventing a new ethic but enforcing the standing Torah of Yahuah (the LORD): the brother who is poor is never to be made an instrument of gain.'),
    ('canon','nehemiah',5,9,'canon','leviticus',25,36,'free',
     E'*Take thou no usury of him, or increase: but fear thy Elohim (God); that thy brother may live with thee* (Leviticus 25:36). Nehemiah grounds his rebuke in the very phrase the Torah binds usury to — *ought ye not to walk in the fear of our Elohim (God) because of the reproach of the heathen our enemies?* (Nehemiah 5:9). The fear of Elohim is the ground of mercy to the brother.'),
    ('canon','nehemiah',5,9,'canon','leviticus',25,37,'free',
     E'*Thou shalt not give him thy money upon usury, nor lend him thy victuals for increase* (Leviticus 25:37). The Torah forbids increase on both money and food to the poor brother; Nehemiah''s assembly indicts the nobles for exacting *the hundredth part of the money, and of the corn, the wine, and the oil* (Nehemiah 5:11) — the same victuals Leviticus shields.'),
    ('canon','nehemiah',5,7,'canon','deuteronomy',23,19,'free',
     E'*Thou shalt not lend upon usury to thy brother; usury of money, usury of victuals, usury of any thing that is lent upon usury* (Deuteronomy 23:19). The brother-clause is the hinge: *Unto a stranger thou mayest lend upon usury; but unto thy brother thou shalt not lend upon usury* (Deuteronomy 23:20). Nehemiah''s whole charge — *every one of his brother* (Nehemiah 5:7) — falls under this exact prohibition.'),
    ('canon','nehemiah',5,11,'canon','deuteronomy',15,7,'free',
     E'*If there be among you a poor man of one of thy brethren within any of thy gates... thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). Nehemiah''s command, *Restore, I pray you, to them, even this day, their lands, their vineyards, their oliveyards, and their houses* (Nehemiah 5:11), is the open hand of the release-law made flesh in a famine.'),
    ('canon','nehemiah',5,11,'canon','deuteronomy',15,9,'free',
     E'*Beware that there be not a thought in thy wicked heart... and thine eye be evil against thy poor brother... and he cry unto Yahuah (LORD) against thee, and it be sin unto thee* (Deuteronomy 15:9). The Torah warned that the unrelieved brother''s cry becomes sin laid at the lender''s door — exactly the *great cry of the people* (Nehemiah 5:1) Nehemiah heard and answered.'),
    ('canon','nehemiah',5,9,'canon','ezekiel',18,8,'free',
     E'*He that hath not given forth upon usury, neither hath taken any increase, that hath withdrawn his hand from iniquity, hath executed true judgment between man and man* (Ezekiel 18:8). Ezekiel names the man who refuses usury among the marks of the just; Nehemiah calls the nobles back to that righteousness — *let us leave off this usury* (Nehemiah 5:10).'),
    ('canon','nehemiah',5,9,'canon','ezekiel',22,12,'free',
     E'*thou hast taken usury and increase, and thou hast greedily gained of thy neighbours by extortion, and hast forgotten me, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 22:12). Ezekiel binds usury to forgetting Yahuah; Nehemiah''s remedy is the inverse — to remember and *walk in the fear of our Elohim (God)* (Nehemiah 5:9).'),
    ('canon','nehemiah',5,11,'canon','psalms',15,5,'free',
     E'*He that putteth not out his money to usury, nor taketh reward against the innocent. He that doeth these things shall never be moved* (Psalm 15:5). The psalm of who may dwell in Yahuah''s holy hill ends on the refusal of usury; the restoring nobles of Nehemiah 5:11 are recalled to that dwelling-place righteousness.'),
    ('canon','nehemiah',5,11,'canon','proverbs',28,8,'free',
     E'*He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor* (Proverbs 28:8). The proverb promises the usurer''s hoard is only stored up for the merciful; Nehemiah enforces the turning, commanding the substance restored to the poor brethren (Nehemiah 5:11).'),
    ('canon','nehemiah',5,7,'apocrypha','ecclesiasticus',29,1,'extras',
     E'*He that is merciful will lend to his neighbour; and he that strengtheneth his hand keepeth the commandments* (Ecclesiasticus 29:1). The wisdom of the second-Temple house reads merciful lending as commandment-keeping itself — the very Torah Nehemiah enforces when he indicts those who *exact usury, every one of his brother* (Nehemiah 5:7).'),
    -- THREAD 2: the cry of the oppressed brethren
    ('canon','nehemiah',5,1,'canon','james',5,4,'free',
     E'*Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). The *great cry of the people and of their wives against their brethren* (Nehemiah 5:1) is the same cry of the defrauded that enters the ears of Yahuah; Nehemiah hears on earth what James says Yahuah hears in heaven.'),
    ('canon','nehemiah',5,13,'canon','matthew',18,28,'free',
     E'*the same servant went out, and found one of his fellowservants, which owed him an hundred pence: and he laid hands on him, and took him by the throat, saying, Pay me that thou owest* (Matthew 18:28). The nobles who, themselves redeemed brethren, seized the lands and children of their fellows are the unmerciful servant; Nehemiah''s oath to restore (Nehemiah 5:12-13) is the release they owed.'),
    ('canon','nehemiah',5,13,'canon','matthew',18,33,'free',
     E'*Shouldest not thou also have had compassion on thy fellowservant, even as I had pity on thee?* (Matthew 18:33). This is the heart of Nehemiah''s charge — *We after our ability have redeemed our brethren the Yahudim (Jews)... and will ye even sell your brethren?* (Nehemiah 5:8). Mercy received obligates mercy shown to the brother.'),
    ('canon','nehemiah',5,5,'apocrypha','ecclesiasticus',34,21,'extras',
     E'*The bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Ecclesiasticus 34:21). When the poor confess *we bring into bondage our sons and our daughters to be servants* (Nehemiah 5:5), the wisdom of the house declares that stripping the needy of their living is no small matter but bloodguilt.'),
    ('canon','nehemiah',5,5,'apocrypha','ecclesiasticus',34,22,'extras',
     E'*He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder* (Ecclesiasticus 34:22). The mortgaged fields and enslaved children of Nehemiah 5:5 are precisely the neighbour''s living taken away — the second-Temple house names it bloodshed, as Nehemiah''s anger (Nehemiah 5:6) testifies.'),
    -- THREAD 3: not eaten the bread of the governor (selfless governorship)
    ('canon','nehemiah',5,15,'canon','1-peter',5,2,'free',
     E'*Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind* (1 Peter 5:2). The former governors *were chargeable unto the people*, but Nehemiah refused the allowance *because of the fear of Elohim (God)* (Nehemiah 5:15) — the shepherd who oversees not for filthy lucre.'),
    ('canon','nehemiah',5,15,'canon','1-peter',5,3,'free',
     E'*Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3). Where the former governors'' *servants bare rule over the people* (Nehemiah 5:15), Nehemiah made himself an ensample — labouring on the wall and feeding many at his own table (Nehemiah 5:16-17).'),
    ('canon','nehemiah',5,18,'canon','1-thessalonians',2,5,'free',
     E'*For neither at any time used we flattering words, as ye know, nor a cloke of covetousness; Elohim (God) is witness* (1 Thessalonians 2:5). Paul, like Nehemiah, refused to make the people a means of gain; though he *required not... the bread of the governor, because the bondage was heavy upon this people* (Nehemiah 5:18), each served at his own cost.'),
    ('canon','nehemiah',5,18,'canon','1-thessalonians',2,9,'free',
     E'*ye remember, brethren, our labour and travail: for labouring night and day, because we would not be chargeable unto any of you, we preached unto you the gospel of Elohim (God)* (1 Thessalonians 2:9). Nehemiah''s *I continued in the work of this wall* and refusal to be chargeable (Nehemiah 5:16-18) is the same labouring not-to-burden the people.'),
    ('canon','nehemiah',5,14,'canon','1-corinthians',9,12,'free',
     E'*Nevertheless we have not used this power; but suffer all things, lest we should hinder the gospel of Messiah (Christ)* (1 Corinthians 9:12). Nehemiah *might exact of them money and corn* (Nehemiah 5:10) and was owed the governor''s bread (Nehemiah 5:14), yet like Paul he laid down the right rather than burden the people.'),
    ('canon','nehemiah',5,14,'canon','1-corinthians',9,15,'free',
     E'*But I have used none of these things... for it were better for me to die, than that any man should make my glorying void* (1 Corinthians 9:15). For twelve years Nehemiah *have not eaten the bread of the governor* (Nehemiah 5:14) — the same refusal of a lawful allowance that the right to serve uncharged might stand.'),
    ('canon','nehemiah',5,15,'canon','acts',20,33,'free',
     E'*I have coveted no man''s silver, or gold, or apparel* (Acts 20:33). Paul''s farewell echoes Nehemiah, who took not *forty shekels of silver* as the former governors had, *because of the fear of Elohim (God)* (Nehemiah 5:15).'),
    ('canon','nehemiah',5,16,'canon','acts',20,35,'free',
     E'*I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). Nehemiah''s own hands in the work of the wall, supporting a hundred and fifty at his table (Nehemiah 5:16-17), is the labour that gives rather than takes.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-5-thou-shalt-not-lay-upon-him-usury',
       E'Ye Exact Usury of His Brother — The Torah''s Standard of Mercy',
       E'When the famine drove the poor to mortgage their fields and sell their children, the nobles of the returned remnant turned the crisis into gain — and Nehemiah''s charge is not a new ethic but the standing Torah of Yahuah (the LORD): *Then I consulted with myself, and I rebuked the nobles, and the rulers, and said unto them, Ye exact usury, every one of his brother* (Nehemiah 5:7). The Torah had forbidden it from Sinai: *If thou lend money to any of my people that is poor by thee, thou shalt not be to him as an usurer, neither shalt thou lay upon him usury* (Exodus 22:25). Leviticus binds the prohibition to the very fear that Nehemiah invokes — *Take thou no usury of him, or increase: but fear thy Elohim (God); that thy brother may live with thee* (Leviticus 25:36), *Thou shalt not give him thy money upon usury, nor lend him thy victuals for increase* (Leviticus 25:37). Deuteronomy draws the line at the brother: *Thou shalt not lend upon usury to thy brother; usury of money, usury of victuals, usury of any thing that is lent upon usury* (Deuteronomy 23:19). The release-law had commanded the open hand — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — and warned that the unrelieved brother''s cry *be sin unto thee* (Deuteronomy 15:9). The prophets kept the standard: the just man *hath not given forth upon usury, neither hath taken any increase* (Ezekiel 18:8), while the bloody city *hast taken usury and increase... and hast forgotten me, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 22:12). The psalm of who may dwell in Yahuah''s hill ends here — *He that putteth not out his money to usury... shall never be moved* (Psalm 15:5) — and the proverb promises *He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor* (Proverbs 28:8). The wisdom of the second-Temple house reads it as Nehemiah did: *He that is merciful will lend to his neighbour; and he that strengtheneth his hand keepeth the commandments* (Ecclesiasticus 29:1). So Nehemiah''s plea — *I pray you, let us leave off this usury. Restore, I pray you, to them, even this day, their lands, their vineyards, their oliveyards, and their houses* (Nehemiah 5:10-11) — and the people''s oath, sealed with *Amen, and praised Yahuah (LORD)* (Nehemiah 5:13), is the Torah affirmed as the living standard of justice and mercy, never set aside.',
       sv.verse_id, ev.verse_id, 'extras', 32200
  FROM _s316_neh05_lookup sv, _s316_neh05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-5-the-cry-of-the-oppressed-brethren',
       E'The Cry of the Defrauded Enters the Ears of Yahuah',
       E'The chapter opens on a sound that heaven hears: *And there was a great cry of the people and of their wives against their brethren the Yahudim (Jews)* (Nehemiah 5:1). They had nothing left to give — *we bring into bondage our sons and our daughters to be servants, and some of our daughters are brought unto bondage already: neither is it in our power to redeem them* (Nehemiah 5:5). James names exactly where such a cry goes: *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4). Nehemiah hears on earth what Yahuah hears in heaven, and is *very angry* (Nehemiah 5:6). His charge cuts to the wound of redeemed men re-enslaving their own — *We after our ability have redeemed our brethren the Yahudim (Jews), which were sold unto the heathen; and will ye even sell your brethren?* (Nehemiah 5:8) — which is the very sin of the unmerciful servant, who *found one of his fellowservants... and took him by the throat, saying, Pay me that thou owest* (Matthew 18:28), having himself been forgiven all. *Shouldest not thou also have had compassion on thy fellowservant, even as I had pity on thee?* (Matthew 18:33). The wisdom of the second-Temple house weighs the deed as Nehemiah''s anger does — *The bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Ecclesiasticus 34:21); *He that takes away his neighbour''s living slayeth him; and he that defraudeth the labourer of his hire is a bloodshedder* (Ecclesiasticus 34:22). The mortgaged fields and the children sold are a neighbour''s life taken away. Nehemiah''s remedy is the release the brother owed: the oath sealed before the priests, and the congregation''s *Amen* (Nehemiah 5:12-13).',
       sv.verse_id, ev.verse_id, 'extras', 32201
  FROM _s316_neh05_lookup sv, _s316_neh05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-5-not-eaten-the-bread-of-the-governor',
       E'I Have Not Eaten the Bread of the Governor — The Servant in the Fear of Elohim',
       E'Against the backdrop of nobles enriching themselves on the poor, Nehemiah sets his own twelve years in office as the opposite pattern: *from the time that I was appointed to be their governor in the land of Yahudah (Judah)... twelve years, I and my brethren have not eaten the bread of the governor* (Nehemiah 5:14). The former governors *were chargeable unto the people, and had taken of them bread and wine, beside forty shekels of silver... but so did not I, because of the fear of Elohim (God)* (Nehemiah 5:15). He fed a hundred and fifty at his own table and laboured on the wall, *yet for all this required not I the bread of the governor, because the bondage was heavy upon this people* (Nehemiah 5:18). This is the shepherd Peter commands: *Feed the flock of Elohim (God)... not for filthy lucre, but of a ready mind* (1 Peter 5:2), *Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3). It is Paul among the Thessalonians — *nor a cloke of covetousness; Elohim (God) is witness* (1 Thessalonians 2:5) — *labouring night and day, because we would not be chargeable unto any of you* (1 Thessalonians 2:9); and Paul at Corinth, who though owed support *have not used this power; but suffer all things* (1 Corinthians 9:12), choosing rather to die than have his glorying made void (1 Corinthians 9:15). It is Paul''s farewell at Miletus: *I have coveted no man''s silver, or gold, or apparel* (Acts 20:33), *remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). The servant-leader who refuses to exploit his office holds the whole chapter together — the same fear of Elohim that grounds the rebuke of usury grounds Nehemiah''s own restraint. And so he closes not boasting but appealing to the One who remembers: *Think upon me, my Elohim (God), for good, according to all that I have done for this people* (Nehemiah 5:19).',
       sv.verse_id, ev.verse_id, 'free', 32202
  FROM _s316_neh05_lookup sv, _s316_neh05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If thou lend money to any of my people that is poor by thee, thou shalt not be to him as an usurer, neither shalt thou lay upon him usury* (Exodus 22:25) — the Sinai prohibition Nehemiah enforces.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Take thou no usury of him, or increase: but fear thy Elohim (God)* (Leviticus 25:36) — usury bound to the fear of Elohim, the ground of Nehemiah''s rebuke.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not give him thy money upon usury, nor lend him thy victuals for increase* (Leviticus 25:37) — money and food alike shielded for the poor brother.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not lend upon usury to thy brother* (Deuteronomy 23:19) — the brother-clause Nehemiah''s *every one of his brother* falls under.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7) — the open hand of the release-law Nehemiah commands in the famine.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he cry unto Yahuah (LORD) against thee, and it be sin unto thee* (Deuteronomy 15:9) — the unrelieved brother''s cry becomes the lender''s sin, as the *great cry* of Nehemiah 5:1.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*He that hath not given forth upon usury, neither hath taken any increase* (Ezekiel 18:8) — refusing usury counted among the marks of the just.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*thou hast taken usury and increase... and hast forgotten me, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 22:12) — usury bound to forgetting Yahuah; Nehemiah''s cure is to remember and fear Him.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=9
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*He that putteth not out his money to usury... shall never be moved* (Psalm 15:5) — the refusal of usury marks who may dwell in Yahuah''s holy hill.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*He that by usury and unjust gain increaseth his substance, he shall gather it for him that will pity the poor* (Proverbs 28:8) — the usurer''s hoard stored up for the merciful.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=11
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*He that is merciful will lend to his neighbour; and he that strengtheneth his hand keepeth the commandments* (Ecclesiasticus 29:1) — the second-Temple house reads merciful lending as Torah-keeping itself.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=7
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=29 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-thou-shalt-not-lay-upon-him-usury'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — the cry of the defrauded reaches heaven, as Nehemiah heard it on earth.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-the-cry-of-the-oppressed-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the same servant... took him by the throat, saying, Pay me that thou owest* (Matthew 18:28) — redeemed men re-enslaving their own brethren, the unmerciful servant.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-the-cry-of-the-oppressed-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Shouldest not thou also have had compassion on thy fellowservant, even as I had pity on thee?* (Matthew 18:33) — mercy received obligates mercy to the brother, the heart of Nehemiah''s charge.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-the-cry-of-the-oppressed-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The bread of the needy is their life: he that defraudeth him thereof is a man of blood* (Ecclesiasticus 34:21) — stripping the poor of their living named as bloodguilt.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-the-cry-of-the-oppressed-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He that takes away his neighbour''s living slayeth him... he that defraudeth the labourer of his hire is a bloodshedder* (Ecclesiasticus 34:22) — the mortgaged fields and enslaved children of Nehemiah 5:5.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=34 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-the-cry-of-the-oppressed-brethren'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Feed the flock of Elohim (God)... not for filthy lucre, but of a ready mind* (1 Peter 5:2) — the shepherd who oversees not for gain, as Nehemiah refused the allowance.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Neither as being lords over Elohim''s (God''s) heritage, but being ensamples to the flock* (1 Peter 5:3) — against the former governors whose servants bare rule over the people.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*nor a cloke of covetousness; Elohim (God) is witness* (1 Thessalonians 2:5) — Paul refusing to make the people a means of gain, as Nehemiah did.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*labouring night and day, because we would not be chargeable unto any of you* (1 Thessalonians 2:9) — labour not-to-burden, as Nehemiah continued in the work of the wall.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=18
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*we have not used this power; but suffer all things, lest we should hinder the gospel of Messiah (Christ)* (1 Corinthians 9:12) — the lawful right to support laid down, as Nehemiah laid down the governor''s bread.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I have used none of these things... for it were better for me to die, than that any man should make my glorying void* (1 Corinthians 9:15) — twelve years refusing a lawful allowance, as Nehemiah 5:14.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I have coveted no man''s silver, or gold, or apparel* (Acts 20:33) — Paul''s farewell echoing Nehemiah, who took not the forty shekels of silver.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*so labouring ye ought to support the weak... It is more blessed to give than to receive* (Acts 20:35) — the labour that gives rather than takes, as Nehemiah fed many at his table.'
  FROM cross_reference_threads t
  JOIN _s316_neh05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=5 AND sv.verse_number=16
  JOIN _s316_neh05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-5-not-eaten-the-bread-of-the-governor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_6.sql (Nehemiah 6) -----
-- Book: Nehemiah  Chapter: 6   Tag: neh06   Session prefix: s316
-- Sort band start: 32225 (+1 per thread)
-- Source: canon / nehemiah / ch 6.  All targets canon (NT + Tanakh) => every thread tier 'free'.
-- Member INSERT form: STANDARD with explicit literal source verse (sv.chapter_number=6 AND sv.verse_number=<v>). NO compact AS m(...) form.
--
-- Nehemiah 6 coverage:
--   v.1-4 (Sanballat/Geshem invite to the plain of Ono; "I am doing a great work, so that I cannot come down"):
--        NT:     Luke 9:62 (hand to the plough, looking back), Philippians 3:13-14 (this one thing I do... I press toward the mark), Colossians 3:2 (set your affection on things above) — WOVEN (thread 1)
--        Extras: none warranted (focused-refusal motif carried by canon)
--        Tanakh: Proverbs 4:25 (let thine eyes look right on) — WOVEN (thread 1)
--   v.5-9 (open letter of slander/sedition; "Now therefore, O Elohim, strengthen my hands"):
--        NT:     2 Timothy 4:18 (Yahuah shall deliver me from every evil work) — WOVEN (thread 2)
--        Extras: none warranted
--        Tanakh: Psalm 56:3-4 (what time I am afraid, I will trust in thee), Isaiah 54:17 (no weapon formed against thee shall prosper), Nehemiah 4:4 (turn their reproach upon their own head) — WOVEN (thread 2)
--   v.10-14 (hired false prophet Shemaiah; "I perceived that Elohim had not sent him"):
--        NT:     Matthew 7:15 (beware of false prophets), 1 John 4:1 (try the spirits) — WOVEN (thread 3)
--        Extras: none warranted (the prophet-test is the Torah's own, Deut 13/18)
--        Tanakh: Deuteronomy 13:1, Deuteronomy 18:20, Deuteronomy 18:22 (the prophet-test), Jeremiah 23:16 (a vision of their own heart), Ezekiel 13:6 (Yahuah hath not sent them) — WOVEN (thread 3)
--   v.15-16 (the wall finished in 52 days; enemies "perceived this work was wrought of our Elohim"):
--        NT:     Philippians 1:6 (he which hath begun a good work... will perform it), Acts 5:38-39 (if it be of Elohim, ye cannot overthrow it) — WOVEN (thread 4)
--        Extras: none warranted
--        Tanakh: Zechariah 4:6 (not by might, nor by power, but by my spirit), Zechariah 4:9 (his hands shall also finish it), Psalm 126:2 (Yahuah hath done great things for them) — WOVEN (thread 4)
--   v.17-19 (Tobiah's letters and entanglement with the nobles): supporting narrative, no thread warranted (the intimidation is carried in threads 2 and 3).
--
-- Threads:
--   s316 neh06 nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down (Luke/Phil/Col + Prov) tier free  sort 32225
--   s316 neh06 nehemiah-6-strengthen-my-hands-against-the-slander  (Ps/Isa/Neh + 2Tim) tier free  sort 32226
--   s316 neh06 nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet (Deut/Jer/Ezek + Matt/1John) tier free  sort 32227
--   s316 neh06 nehemiah-6-the-wall-finished-wrought-of-our-elohim (Zech/Ps + Phil/Acts) tier free  sort 32228

CREATE TEMP VIEW _s316_neh06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- cross_references
-- =========================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: 6:3 "I am doing a great work, so that I cannot come down"
    ('canon','nehemiah',6,3,'canon','luke',9,62,'free',
     E'*And Yahusha (Jesus) said unto him, No man, having put his hand to the plough, and looking back, is fit for the kingdom of Elohim (God).* (Luke 9:62). Nehemiah''s fourfold refusal — *I am doing a great work, so that I cannot come down: why should the work cease, whilst I leave it, and come down to you?* (Nehemiah 6:3) — is the very steadiness Yahusha demands: the hand on the plough does not turn back to the men in the plain of Ono.'),
    ('canon','nehemiah',6,3,'canon','philippians',3,13,'free',
     E'*Brethren, I count not myself to have apprehended: but this one thing I do, forgetting those things which are behind, and reaching forth unto those things which are before* (Philippians 3:13). Nehemiah''s *I am doing a great work, so that I cannot come down* (Nehemiah 6:3) is the single-eyed *this one thing I do* — the work undistracted, the gaze forward, not down toward the snare.'),
    ('canon','nehemiah',6,3,'canon','philippians',3,14,'free',
     E'*I press toward the mark for the prize of the high calling of Elohim (God) in HaMashiach Yahusha (Christ Jesus).* (Philippians 3:14). The builder who answered four times *why should the work cease, whilst I leave it, and come down to you?* (Nehemiah 6:3-4) presses toward the mark of the finished wall; the invitation to the plain is a swerve off the course.'),
    ('canon','nehemiah',6,3,'canon','proverbs',4,25,'free',
     E'*Let thine eyes look right on, and let thine eyelids look straight before thee.* (Proverbs 4:25). Nehemiah keeps his eyes right on the work — *I cannot come down* (Nehemiah 6:3) — refusing to turn to the right hand or to the left toward Sanballat and Geshem; the wisdom path and the wall-builder''s path are one.'),
    ('canon','nehemiah',6,3,'canon','colossians',3,2,'free',
     E'*Set your affection on things above, not on things on the earth.* (Colossians 3:2). The repeated summons *come, let us meet together in the plain of Ono* (Nehemiah 6:2) is the pull downward; Nehemiah''s *I cannot come down* (Nehemiah 6:3) is the heart set above, the great work weighed heavier than the enemies'' company.'),

    -- Thread 2: 6:9 "Now therefore, O Elohim, strengthen my hands"
    ('canon','nehemiah',6,9,'canon','psalms',56,3,'free',
     E'*What time I am afraid, I will trust in thee.* (Psalm 56:3). The slanderers'' design was *Their hands shall be weakened from the work* (Nehemiah 6:9); against the fear they aimed to plant, Nehemiah does what the psalmist does — turns the moment of being afraid into a turning to Elohim, *strengthen my hands* (Nehemiah 6:9).'),
    ('canon','nehemiah',6,9,'canon','psalms',56,4,'free',
     E'*In Elohim (God) I will praise his word, in Elohim (God) I have put my trust; I will not fear what flesh can do unto me.* (Psalm 56:4). The open letter was flesh''s weapon to make the builders'' hands fall slack; Nehemiah''s answer, *Now therefore, O Elohim (God), strengthen my hands* (Nehemiah 6:9), is the refusal to fear what flesh can do.'),
    ('canon','nehemiah',6,9,'canon','isaiah',54,17,'free',
     E'*No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn. This is the heritage of the servants of Yahuah (LORD), and their righteousness is of me, saith Yahuah (LORD).* (Isaiah 54:17). The forged letter and the rumour of Gashmu are the tongue rising in judgment against the builder; Nehemiah''s prayer *strengthen my hands* (Nehemiah 6:9) leans on this very heritage — the weapon formed shall not prosper.'),
    ('canon','nehemiah',6,9,'canon','nehemiah',4,4,'free',
     E'*Hear, O our Elohim (God); for we are despised: and turn their reproach upon their own head, and give them for a prey in the land of captivity* (Nehemiah 4:4). The same builder, at the same wall, prayed before against the mockery of Sanballat; *strengthen my hands* (Nehemiah 6:9) is the answer escalated as the slander escalates from mockery to a letter of sedition.'),
    ('canon','nehemiah',6,9,'canon','2-timothy',4,18,'free',
     E'*And Yahuah (Lord) shall deliver me from every evil work, and will preserve me unto his heavenly kingdom: to whom be glory for ever and ever. Amen.* (2 Timothy 4:18). Paul, slandered and forsaken, rests where Nehemiah rests — not in his own hand but in the One who strengthens it; *Now therefore, O Elohim (God), strengthen my hands* (Nehemiah 6:9) is the same confidence under the same kind of evil report.'),

    -- Thread 3: 6:12 "I perceived that Elohim had not sent him" — the hired false prophet
    ('canon','nehemiah',6,12,'canon','deuteronomy',13,1,'free',
     E'*If there arise among you a prophet, or a dreamer of dreams, and giveth thee a sign or a wonder* (Deuteronomy 13:1). Shemaiah came clothed as a prophet, pronouncing a word, but the Torah set the test long before; Nehemiah applies it — *I perceived that Elohim (God) had not sent him* (Nehemiah 6:12) — measuring the message, not the office.'),
    ('canon','nehemiah',6,12,'canon','deuteronomy',18,20,'free',
     E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die.* (Deuteronomy 18:20). The hired Shemaiah presumed a word Yahuah had not commanded; Nehemiah''s discernment, *Elohim (God) had not sent him; but that he pronounced this prophecy against me* (Nehemiah 6:12), names exactly the presumption the Torah condemns.'),
    ('canon','nehemiah',6,12,'canon','deuteronomy',18,22,'free',
     E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him.* (Deuteronomy 18:22). The Torah''s last word on the false prophet is *thou shalt not be afraid of him* — and that is precisely what the hirelings could not produce in Nehemiah, who *perceived that Elohim (God) had not sent him* (Nehemiah 6:12) and would not flee.'),
    ('canon','nehemiah',6,12,'canon','jeremiah',23,16,'free',
     E'*Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).* (Jeremiah 23:16). Shemaiah''s counsel to hide in the temple was a vision of his own heart, hired by Tobiah and Sanballat; Nehemiah hearkened not — *Elohim (God) had not sent him* (Nehemiah 6:12).'),
    ('canon','nehemiah',6,12,'canon','ezekiel',13,6,'free',
     E'*They have seen vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them: and they have made others to hope that they would confirm the word.* (Ezekiel 13:6). The very charge Ezekiel lays — *Yahuah hath not sent them* — is Nehemiah''s discernment of Shemaiah, *I perceived that Elohim (God) had not sent him* (Nehemiah 6:12), the prophet who speaks where Yahuah has not spoken.'),
    ('canon','nehemiah',6,12,'canon','matthew',7,15,'free',
     E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves.* (Matthew 7:15). Shemaiah came in a prophet''s clothing but was a wolf hired to ensnare; Nehemiah''s *I perceived that Elohim (God) had not sent him* (Nehemiah 6:12) is the wariness Yahusha commands made flesh in the wall-builder.'),
    ('canon','nehemiah',6,12,'canon','1-john',4,1,'free',
     E'*Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1). Nehemiah does not believe the spirit that bids him flee; he tries it and finds it false — *I perceived that Elohim (God) had not sent him* (Nehemiah 6:12) — the apostolic command to test, already practised at the wall.'),

    -- Thread 4: 6:16 the wall finished, "wrought of our Elohim"
    ('canon','nehemiah',6,16,'canon','zechariah',4,6,'free',
     E'*Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6). When the enemies *perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16), they confessed Zechariah''s word over the same returned remnant — the wall rose not by might nor by power but by the Spirit of Yahuah.'),
    ('canon','nehemiah',6,16,'canon','zechariah',4,9,'free',
     E'*The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* (Zechariah 4:9). The hand that begins the work also finishes it because Yahuah is in it; *so the wall was finished* (Nehemiah 6:15) and the heathen *perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16) — the same finishing hand at the same restoration.'),
    ('canon','nehemiah',6,16,'canon','psalms',126,2,'free',
     E'*Then was our mouth filled with laughter, and our tongue with singing: then said they among the heathen, Yahuah (LORD) hath done great things for them.* (Psalm 126:2). The psalm of the captivity turned again foretells the very confession of Nehemiah 6:16: the heathen about the city, *cast down in their own eyes*, say what the psalmist sang — *Yahuah hath done great things for them* — for the work was *wrought of our Elohim (God)*.'),
    ('canon','nehemiah',6,16,'canon','philippians',1,6,'free',
     E'*Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Yahusha HaMashiach (Jesus Christ)* (Philippians 1:6). The wall finished in fifty-two days is the visible token of the Finisher; that the enemies *perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16) is the confidence Paul names — the One who begins the good work performs it.'),
    ('canon','nehemiah',6,16,'canon','acts',5,38,'free',
     E'*And now I say unto you, Refrain from these men, and let them alone: for if this counsel or this work be of men, it will come to nought* (Acts 5:38). Gamaliel''s test is Nehemiah''s vindication run forward: a work of men comes to nought, but the wall stood and the enemies were *much cast down in their own eyes* (Nehemiah 6:16), forced to weigh whether it was of Elohim.'),
    ('canon','nehemiah',6,16,'canon','acts',5,39,'free',
     E'*But if it be of Elohim (God), ye can not overthrow it; lest haply ye be found even to fight against Elohim (God).* (Acts 5:39). The enemies who *perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16) perceived exactly what Gamaliel warned — a work of Elohim cannot be overthrown, and to war against it is to be found fighting against Elohim himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- threads
-- =========================================================================
-- Thread 1: 6:3 great work, cannot come down
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down',
       E'I Am Doing a Great Work — I Cannot Come Down',
       E'Four times Sanballat and Geshem send the same lure — *Come, let us meet together in some one of the villages in the plain of Ono. But they thought to do me mischief* (Nehemiah 6:2) — and four times the builder gives the same answer: *I am doing a great work, so that I cannot come down: why should the work cease, whilst I leave it, and come down to you?* (Nehemiah 6:3-4). This is the focused refusal to be pulled off the work. Yahusha (Jesus) names the same steadiness: *No man, having put his hand to the plough, and looking back, is fit for the kingdom of Elohim (God)* (Luke 9:62) — the hand on the plough does not turn back to the men in the plain. Paul lives it: *this one thing I do, forgetting those things which are behind, and reaching forth unto those things which are before* (Philippians 3:13), *I press toward the mark for the prize of the high calling* (Philippians 3:14). The wisdom-father had already drawn the line of the gaze: *Let thine eyes look right on, and let thine eyelids look straight before thee* (Proverbs 4:25), and Colossians sets the heart where the eyes go — *Set your affection on things above, not on things on the earth* (Colossians 3:2). The summons is always downward, to the plain; the great work keeps the builder above it.',
       sv.verse_id, ev.verse_id, 'free', 32225
  FROM _s316_neh06_lookup sv, _s316_neh06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: 6:9 strengthen my hands
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-6-strengthen-my-hands-against-the-slander',
       E'Strengthen My Hands — The Prayer Against the Slander',
       E'When the lure fails, the slander comes: an open letter, *It is reported among the heathen, and Gashmu saith it, that thou and the Yahudim (Jews) think to rebel... that thou mayest be their king* (Nehemiah 6:6) — a forged charge of sedition designed for one effect: *For they all made us afraid, saying, Their hands shall be weakened from the work, that it be not done* (Nehemiah 6:9). The builder''s answer is not counter-propaganda but prayer: *Now therefore, O Elohim (God), strengthen my hands* (Nehemiah 6:9). The psalmist hands him the posture: *What time I am afraid, I will trust in thee* (Psalm 56:3), *In Elohim (God) I have put my trust; I will not fear what flesh can do unto me* (Psalm 56:4). Isaiah hands him the heritage: *No weapon that is formed against thee shall prosper; and every tongue that shall rise against thee in judgment thou shalt condemn... This is the heritage of the servants of Yahuah* (Isaiah 54:17) — the forged letter is a tongue risen in judgment, and it shall not prosper. The same builder prayed it before at the same wall — *turn their reproach upon their own head* (Nehemiah 4:4) — and Paul rests where Nehemiah rests under his own evil report: *And Yahuah (Lord) shall deliver me from every evil work, and will preserve me unto his heavenly kingdom* (2 Timothy 4:18).',
       sv.verse_id, ev.verse_id, 'free', 32226
  FROM _s316_neh06_lookup sv, _s316_neh06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: 6:12 the false prophet not sent
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet',
       E'I Perceived That Elohim Had Not Sent Him — Discerning the Hired Prophet',
       E'The last weapon is a prophet for hire. Shemaiah counsels Nehemiah to flee into the temple and shut the doors — *for they will come to slay thee* (Nehemiah 6:10) — a counsel that, obeyed, would have made a layman trespass the holy place and stamped him a coward. But the builder weighs the message against the Torah''s test and finds it counterfeit: *And, lo, I perceived that Elohim (God) had not sent him; but that he pronounced this prophecy against me: for Tobiah and Sanballat had hired him* (Nehemiah 6:12). The Torah set this test long before — *If there arise among you a prophet* (Deuteronomy 13:1), *the prophet, which shall presume to speak a word in my name, which I have not commanded him... even that prophet shall die* (Deuteronomy 18:20), *if the thing follow not... thou shalt not be afraid of him* (Deuteronomy 18:22). The prophets name the same fraud: *they speak a vision of their own heart, and not out of the mouth of Yahuah* (Jeremiah 23:16); *Yahuah hath not sent them* (Ezekiel 13:6). And Yahusha and the apostle carry it forward unbroken: *Beware of false prophets, which come to you in sheep''s clothing* (Matthew 7:15); *believe not every spirit, but try the spirits whether they are of Elohim* (1 John 4:1). Nehemiah simply did what the whole library commands — he tried the spirit, and would not flee.',
       sv.verse_id, ev.verse_id, 'free', 32227
  FROM _s316_neh06_lookup sv, _s316_neh06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: 6:15-16 the wall finished, wrought of our Elohim
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-6-the-wall-finished-wrought-of-our-elohim',
       E'The Wall Finished — They Perceived It Was Wrought of Our Elohim',
       E'After every lure, slander, and hired prophecy, the verdict is swift and plain: *So the wall was finished in the twenty and fifth day of the month Elul, in fifty and two days* (Nehemiah 6:15). And the enemies are forced to read the hand behind it: *And it came to pass, that when all our enemies heard thereof... they were much cast down in their own eyes: for they perceived that this work was wrought of our Elohim (God)* (Nehemiah 6:16). This is the whole secret Zechariah spoke over the same returned remnant: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot* (Zechariah 4:6), and *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* (Zechariah 4:9) — the finishing hand is Yahuah''s. The psalm of the turned captivity had already put the confession in the mouth of the heathen: *then said they among the heathen, Yahuah (LORD) hath done great things for them* (Psalm 126:2). Paul names the One who guarantees the finish: *he which hath begun a good work in you will perform it* (Philippians 1:6); and Gamaliel states the law of it — *if this counsel or this work be of men, it will come to nought* (Acts 5:38), *But if it be of Elohim, ye can not overthrow it; lest haply ye be found even to fight against Elohim* (Acts 5:39). The wall stood; the work was of Elohim; it could not be overthrown.',
       sv.verse_id, ev.verse_id, 'free', 32228
  FROM _s316_neh06_lookup sv, _s316_neh06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- thread_members
-- =========================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*No man, having put his hand to the plough, and looking back, is fit for the kingdom of Elohim (God)* (Luke 9:62) — the steadiness Nehemiah''s *I cannot come down* (6:3) embodies.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=62
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*this one thing I do, forgetting those things which are behind* (Philippians 3:13) — the single-eyed work that *will not come down*.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I press toward the mark for the prize of the high calling* (Philippians 3:14) — the builder presses toward the finished wall, not the plain.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Let thine eyes look right on... look straight before thee* (Proverbs 4:25) — the gaze kept on the work, turning neither to Sanballat nor Geshem.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Set your affection on things above, not on things on the earth* (Colossians 3:2) — the heart set above outweighs the downward pull to Ono.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=3
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-am-doing-a-great-work-i-cannot-come-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*What time I am afraid, I will trust in thee* (Psalm 56:3) — the fear the slander aimed to plant turned into trust.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=56 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-strengthen-my-hands-against-the-slander'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will not fear what flesh can do unto me* (Psalm 56:4) — the open letter was flesh''s weapon to slacken the builders'' hands.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=56 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-strengthen-my-hands-against-the-slander'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*No weapon that is formed against thee shall prosper... every tongue that shall rise against thee in judgment thou shalt condemn* (Isaiah 54:17) — the forged letter is the tongue that shall not prosper.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-strengthen-my-hands-against-the-slander'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*turn their reproach upon their own head* (Nehemiah 4:4) — the same builder''s prayer at the same wall, escalated as the slander escalates.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-strengthen-my-hands-against-the-slander'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah (Lord) shall deliver me from every evil work* (2 Timothy 4:18) — Paul slandered and forsaken rests where Nehemiah rests.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=9
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-strengthen-my-hands-against-the-slander'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If there arise among you a prophet, or a dreamer of dreams* (Deuteronomy 13:1) — the Torah''s test Nehemiah applies to Shemaiah.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the prophet, which shall presume to speak a word in my name, which I have not commanded him... even that prophet shall die* (Deuteronomy 18:20) — the presumption Shemaiah committed.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou shalt not be afraid of him* (Deuteronomy 18:22) — the Torah''s last word, and the fear the hirelings could not produce.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they speak a vision of their own heart, and not out of the mouth of Yahuah* (Jeremiah 23:16) — Shemaiah''s hired counsel was such a vision.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Yahuah hath not sent them* (Ezekiel 13:6) — the exact charge of Nehemiah''s discernment, *Elohim had not sent him* (6:12).'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Beware of false prophets, which come to you in sheep''s clothing* (Matthew 7:15) — Shemaiah''s clothing was a prophet''s, his work a wolf''s.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*believe not every spirit, but try the spirits whether they are of Elohim* (1 John 4:1) — Nehemiah tried the spirit and found it false.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=12
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-i-perceived-elohim-had-not-sent-him-the-false-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot* (Zechariah 4:6) — the secret of the work the enemies were forced to read.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his hands shall also finish it* (Zechariah 4:9) — the finishing hand at the same restoration; the wall was finished in fifty-two days.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*then said they among the heathen, Yahuah hath done great things for them* (Psalm 126:2) — the heathen''s confession foretold.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=126 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he which hath begun a good work in you will perform it* (Philippians 1:6) — the Finisher behind the wall finished in fifty-two days.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*if this counsel or this work be of men, it will come to nought* (Acts 5:38) — Gamaliel''s test; the work of men fails.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*But if it be of Elohim, ye can not overthrow it* (Acts 5:39) — what the enemies perceived: a work *wrought of our Elohim* cannot be overthrown.'
  FROM cross_reference_threads t
  JOIN _s316_neh06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s316_neh06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-6-the-wall-finished-wrought-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_7.sql (Nehemiah 7) -----
-- Book: Nehemiah  Chapter: 7   Source edition: canon  book_slug=nehemiah
-- Session prefix: s316   Tag: neh07   Temp view: _s316_neh07_lookup
-- Slug prefix: nehemiah-7-...   Sort band start: 32250 (+1 per thread)
-- Member INSERT form: STANDARD with explicit literal source verse (NO compact AS m(...) form).
--   tier BEFORE note in cross_references VALUES.
--
-- THREADS (2):
--   1. nehemiah-7-the-faithful-watch-set-on-the-walls  (sort 32250, tier free)
--        anchor 7:2-7:3 ; targets: Exodus 18:21, Proverbs 28:20, Luke 16:10, 1 Corinthians 4:2,
--        Matthew 25:21 (the faithful Elohim-fearing steward) ; Isaiah 62:6, Ezekiel 33:7,
--        Mark 13:34, Mark 13:37 (the watch set on the walls). ALL canon (free).
--   2. nehemiah-7-the-register-of-the-reckoned-seed  (sort 32251, tier free)
--        anchor 7:5-7:64 ; targets: Ezra 2:1, Ezra 2:2, Ezra 2:62 (the parallel register),
--        Numbers 1:18 (declared pedigrees), Luke 10:20, Philippians 4:3, Revelation 20:12,
--        Revelation 21:27 (the names enrolled / book of life). ALL canon (free).
--
-- Nehemiah 7 coverage:
--   v.1   (porters/singers/Levites appointed) — folded into v.2-3 watch thread (the guard set).
--         NT: none warranted (covered via 7:3 watch weave)
--         Extras: none warranted
--         Tanakh: none warranted
--   v.2   NT:     Luke 16:10 / 1 Corinthians 4:2 / Matthew 25:21 (the faithful steward) — thread 1
--         Extras: none warranted (the faithful-steward weight is canon-served, NT + Torah)
--         Tanakh: Exodus 18:21 (men who fear Elohim) / Proverbs 28:20 (the faithful man) — thread 1
--   v.3   NT:     Mark 13:34 / Mark 13:37 (commanded the porter to watch; Watch) — thread 1
--         Extras: none warranted
--         Tanakh: Isaiah 62:6 (watchmen on thy walls) / Ezekiel 33:7 (the watchman) — thread 1
--   v.4   (city large, people few) — none warranted (narrative bridge to the register)
--   v.5   NT:     Luke 10:20 / Philippians 4:3 / Revelation 20:12 / Revelation 21:27 (names enrolled) — thread 2
--         Extras: none warranted (heavenly-tablets motif is canon-served here; no clean single witness chosen)
--         Tanakh: Ezra 2:1 / Ezra 2:2 (the parallel register) / Numbers 1:18 (pedigrees) — thread 2
--   v.6-7 (children of the province; the leaders) — folded into v.5 register thread via Ezra 2:1-2 parallel
--   v.8-60 (the enumerated families) — none warranted (the genealogical roll; framed in thread 2 summary)
--   v.61-63 (those who could not shew their father's house) — folded into v.64 thread 2 (the unverified seed)
--   v.64  NT:     (book of life weave shared with v.5) — thread 2
--         Extras: none warranted
--         Tanakh: Ezra 2:62 (the parallel: register not found, put from priesthood) — thread 2
--   v.65  (Tirshatha; Urim and Thummim awaited) — folded into v.64 thread 2 (the priestly verification deferred)
--   v.66-69 (the totals; congregation, servants, beasts) — none warranted (census tally)
--   v.70-72 (the freewill gifts to the treasure) — none warranted (offering tally; no framework weight here)
--   v.73  (all Yashar'el dwelt in their cities; the seventh month came) — none warranted
--         (bridge to ch.8 Feast of Trumpets; weighed, left to ch.8)

CREATE TEMP VIEW _s316_neh07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the faithful watch set on the walls (7:2-3)
    ('canon','nehemiah',7,2,'canon','exodus',18,21,'free',
      E'*Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21). The very pattern Jethro gave Moses for stewarding Yashar''el (Israel) is what Nehemiah practises when he commits Jerusalem to Hananiah — *for he was a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2). The trust is given to the one who fears Elohim, not to the highborn or the mighty.'),
    ('canon','nehemiah',7,2,'canon','proverbs',28,20,'free',
      E'*A faithful man shall abound with blessings: but he that maketh haste to be rich shall not be innocent* (Proverbs 28:20). Nehemiah''s charge over Jerusalem falls to *a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2) — wisdom names exactly this man, the faithful one, as the vessel of blessing.'),
    ('canon','nehemiah',7,2,'canon','luke',16,10,'free',
      E'*He that is faithful in that which is least is faithful also in much: and he that is unjust in the least is unjust also in much* (Luke 16:10). Nehemiah entrusts the city to Hananiah because *he was a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2) — the same measure the Formed Son names: faithfulness in the small thing is the proof of fitness for the great trust of guarding the holy city.'),
    ('canon','nehemiah',7,2,'canon','1-corinthians',4,2,'free',
      E'*Moreover it is required in stewards, that a man be found faithful* (1 Corinthians 4:2). The one thing required of the steward is the one thing Nehemiah found in Hananiah — *for he was a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2). The guardian of Jerusalem is a steward of Yahuah''s (the LORD''s) house, and faithfulness is the qualification.'),
    ('canon','nehemiah',7,2,'canon','matthew',25,21,'free',
      E'*His lord said unto him, Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things: enter thou into the joy of thy lord* (Matthew 25:21). The faithful man set over Jerusalem — *for he was a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2) — foreshadows the servant the returning Master rewards with rule, the steward proven trustworthy.'),
    ('canon','nehemiah',7,3,'canon','isaiah',62,6,'free',
      E'*I have set watchmen upon thy walls, O Jerusalem, which shall never hold their peace day nor night: ye that make mention of Yahuah (LORD), keep not silence* (Isaiah 62:6). Nehemiah''s order — *appoint watches of the inhabitants of Jerusalem, every one in his watch, and every one to be over against his house* (Nehemiah 7:3) — enacts in stone and gate what Isaiah promised for Zion: watchmen set upon her walls, the city guarded and never silent.'),
    ('canon','nehemiah',7,3,'canon','ezekiel',33,7,'free',
      E'*So thou, O son of Adam, I have set thee a watchman unto the house of Yashar''el (Israel); therefore thou shalt hear the word at my mouth, and warn them from me* (Ezekiel 33:7). The watch Nehemiah sets on the walls — *appoint watches of the inhabitants of Jerusalem, every one in his watch* (Nehemiah 7:3) — is the outward sign of the watchman Yahuah (the LORD) appoints over His people: the faithful are charged to keep guard and sound the warning.'),
    ('canon','nehemiah',7,3,'canon','mark',13,34,'free',
      E'*For the Son of Adam is as a man taking a far journey, who left his house, and gave authority to his servants, and to every man his work, and commanded the porter to watch* (Mark 13:34). Nehemiah''s charge sets the same picture: the gates barred, the porters appointed, and *appoint watches of the inhabitants of Jerusalem, every one in his watch, and every one to be over against his house* (Nehemiah 7:3) — every man at his post, the porter commanded to watch against the master''s return.'),
    ('canon','nehemiah',7,3,'canon','mark',13,37,'free',
      E'*And what I say unto you I say unto all, Watch* (Mark 13:37). The single word the Formed Son lays on all His people is the very order Nehemiah gives Jerusalem — *appoint watches of the inhabitants of Jerusalem, every one in his watch* (Nehemiah 7:3): the city secured by the faithful who keep the watch.'),
    -- Thread 2: the register of the reckoned seed (7:5-64)
    ('canon','nehemiah',7,5,'canon','ezra',2,1,'free',
      E'*Now these are the children of the province that went up out of the captivity, of those which had been carried away, whom Nebuchadnezzar the king of Babylon had carried away unto Babylon, and came again unto Jerusalem and Yahudah (Judah), every one unto his city* (Ezra 2:1). This is the same register Nehemiah found — *I found a register of the genealogy of them which came up at the first* (Nehemiah 7:5) — the verified roll of the returned remnant, the reckoned seed-line preserved in two witnesses.'),
    ('canon','nehemiah',7,5,'canon','ezra',2,2,'free',
      E'*Which came with Zerubbabel: Jeshua, Nehemiah, Seraiah, Reelaiah, Mordecai, Bilshan, Mispar, Bigvai, Rehum, Baanah. The number of the men of the people of Yashar''el (Israel)* (Ezra 2:2). The leaders heading Nehemiah''s register — *Who came with Zerubbabel, Jeshua, Nehemiah...* (Nehemiah 7:7) — match the parallel roll in Ezra, the same reckoned company of the seed brought up from the captivity.'),
    ('canon','nehemiah',7,5,'canon','numbers',1,18,'free',
      E'*And they assembled all the congregation together on the first day of the second month, and they declared their pedigrees after their families, by the house of their fathers, according to the number of the names, from twenty years old and upward, by their polls* (Numbers 1:18). The reckoning Nehemiah undertakes — *that they might be reckoned by genealogy* (Nehemiah 7:5) — repeats the wilderness pattern: the seed is numbered by pedigree, by the house of the fathers, the covenant line counted and named.'),
    ('canon','nehemiah',7,5,'canon','luke',10,20,'free',
      E'*Notwithstanding in this rejoice not, that the spirits are subject unto you; but rather rejoice, because your names are written in heaven* (Luke 10:20). The earthly register Nehemiah found — *I found a register of the genealogy* (Nehemiah 7:5) — is the shadow of the higher enrolment: the names of the reckoned people written in heaven, the true citizenship that cannot be lost.'),
    ('canon','nehemiah',7,5,'canon','philippians',4,3,'free',
      E'*And I intreat thee also, true yokefellow, help those women which laboured with me in the gospel, with Clement also, and with other my fellowlabourers, whose names are in the book of life* (Philippians 4:3). Nehemiah''s genealogical register — *that they might be reckoned by genealogy. And I found a register* (Nehemiah 7:5) — points beyond itself to the enrolment that matters most, the names written in the book of life.'),
    ('canon','nehemiah',7,5,'canon','revelation',20,12,'free',
      E'*And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). The verified register of the returned seed — *I found a register of the genealogy* (Nehemiah 7:5) — is the foreshadow of the opened books at the last, the final reckoning by name and by works.'),
    ('canon','nehemiah',7,5,'canon','revelation',21,27,'free',
      E'*And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life* (Revelation 21:27). Entry into the New Jerusalem turns on the same thing as entry into the returned remnant — a name found in the register: *I found a register of the genealogy of them which came up at the first* (Nehemiah 7:5), the seed enrolled and verified.'),
    ('canon','nehemiah',7,64,'canon','ezra',2,62,'free',
      E'*These sought their register among those that were reckoned by genealogy, but they were not found: therefore were they, as polluted, put from the priesthood* (Ezra 2:62). The same priests fail the same test in both witnesses — *These sought their register among those that were reckoned by genealogy, but it was not found: therefore were they, as polluted, put from the priesthood* (Nehemiah 7:64): the seed-line must be verified, and the unproven cannot serve at the altar until a priest with Urim and Thummim should stand up to settle it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-7-the-faithful-watch-set-on-the-walls',
       E'The Faithful Watch Set on the Walls',
       E'The wall is built and the gates are hung, and now Nehemiah secures the city by setting a watch and committing it to a trustworthy man: *That I gave my brother Hanani, and Hananiah the ruler of the palace, charge over Jerusalem: for he was a faithful man, and feared Elohim (God) above many* (Nehemiah 7:2). The trust is given for one reason — he feared Elohim above many — the same measure Jethro gave Moses: *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness* (Exodus 18:21), and the same measure wisdom names: *A faithful man shall abound with blessings* (Proverbs 28:20). The Formed Son sets the principle plainly: *He that is faithful in that which is least is faithful also in much* (Luke 16:10), and the apostle echoes it — *it is required in stewards, that a man be found faithful* (1 Corinthians 4:2) — both flowering into the Master''s reward, *Well done, thou good and faithful servant... thou hast been faithful over a few things, I will make thee ruler over many things* (Matthew 25:21). Then comes the watch itself: *let them shut the doors, and bar them: and appoint watches of the inhabitants of Jerusalem, every one in his watch, and every one to be over against his house* (Nehemiah 7:3). This is the very thing Yahuah (the LORD) promised Zion — *I have set watchmen upon thy walls, O Jerusalem, which shall never hold their peace day nor night* (Isaiah 62:6) — and the office He appoints over His people: *I have set thee a watchman unto the house of Yashar''el (Israel)* (Ezekiel 33:7). The Formed Son draws the picture forward to His own return: *the Son of Adam is as a man taking a far journey, who... commanded the porter to watch* (Mark 13:34), and lays the charge on all: *And what I say unto you I say unto all, Watch* (Mark 13:37). The city secured, the faithful watch set, every man at his post against his own house.',
       sv.verse_id, ev.verse_id, 'free', 32250
  FROM _s316_neh07_lookup sv, _s316_neh07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=7 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-7-the-register-of-the-reckoned-seed',
       E'The Register of the Reckoned Seed',
       E'With the city guarded, Nehemiah turns to the people themselves, and the impulse comes from above: *And my Elohim (God) put into mine heart to gather together the nobles, and the rulers, and the people, that they might be reckoned by genealogy. And I found a register of the genealogy of them which came up at the first* (Nehemiah 7:5). The remnant is not an undifferentiated crowd but a verified seed-line, the covenant lineage counted and named — *the children of the province, that went up out of the captivity... every one unto his city* (Nehemiah 7:6). This is the same roll preserved in Ezra: *Now these are the children of the province that went up out of the captivity... and came again unto Jerusalem and Yahudah (Judah), every one unto his city* (Ezra 2:1), *which came with Zerubbabel: Jeshua, Nehemiah, Seraiah, Reelaiah, Mordecai, Bilshan, Mispar, Bigvai, Rehum, Baanah* (Ezra 2:2) — two witnesses to one reckoning. It repeats the wilderness pattern, where the seed was numbered by pedigree: *they declared their pedigrees after their families, by the house of their fathers, according to the number of the names* (Numbers 1:18). The line must be verifiable: those who could not prove it were set aside — *These sought their register among those that were reckoned by genealogy, but it was not found: therefore were they, as polluted, put from the priesthood* (Nehemiah 7:64), the matter held over *till there stood up a priest with Urim and Thummim* (Nehemiah 7:65), exactly as in Ezra 2:62. The enrolled, reckoned people of the earthly register are the shadow of a higher enrolment. The Formed Son redirects the joy of His own to it — *rather rejoice, because your names are written in heaven* (Luke 10:20) — and Paul names his fellow-labourers *whose names are in the book of life* (Philippians 4:3). At the last the books are opened: *another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), and entry into the New Jerusalem turns on it — *they which are written in the Lamb''s book of life* (Revelation 21:27). The verified seed-line of Nehemiah''s register points to the reckoned people whose names the King Himself keeps.',
       sv.verse_id, ev.verse_id, 'free', 32251
  FROM _s316_neh07_lookup sv, _s316_neh07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=7 AND ev.verse_number=64
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*such as fear Elohim (God), men of truth* (Exodus 18:21) — Jethro''s pattern: the trust given to the Elohim-fearing man, as Nehemiah gives Hananiah (7:2).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A faithful man shall abound with blessings* (Proverbs 28:20) — wisdom names the faithful one Nehemiah found (7:2).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He that is faithful in that which is least is faithful also in much* (Luke 16:10) — the Formed Son''s measure of the steward fit for the great trust (7:2).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*it is required in stewards, that a man be found faithful* (1 Corinthians 4:2) — the one qualification of the steward, the one thing Nehemiah found (7:2).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Well done, thou good and faithful servant... I will make thee ruler over many things* (Matthew 25:21) — the reward of the proven faithful steward (7:2).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I have set watchmen upon thy walls, O Jerusalem* (Isaiah 62:6) — Yahuah''s promise enacted by Nehemiah''s watch (7:3).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I have set thee a watchman unto the house of Yashar''el (Israel)* (Ezekiel 33:7) — the watchman''s office Nehemiah''s guard embodies (7:3).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*commanded the porter to watch* (Mark 13:34) — the Son of Adam''s far journey: every man at his post, as Nehemiah set every man in his watch (7:3).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=13 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*And what I say unto you I say unto all, Watch* (Mark 13:37) — the one word laid on all the people, the order Nehemiah gives Jerusalem (7:3).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=13 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-faithful-watch-set-on-the-walls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Now these are the children of the province that went up out of the captivity* (Ezra 2:1) — the parallel register, the same returned remnant Nehemiah found (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Which came with Zerubbabel: Jeshua, Nehemiah...* (Ezra 2:2) — the same leaders heading the reckoned company (Nehemiah 7:7).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they declared their pedigrees after their families, by the house of their fathers* (Numbers 1:18) — the wilderness pattern: the seed numbered by lineage, as Nehemiah reckons by genealogy (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*rejoice, because your names are written in heaven* (Luke 10:20) — the higher enrolment the earthly register shadows (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*whose names are in the book of life* (Philippians 4:3) — the enrolment that outlasts the captivity-roll Nehemiah found (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*another book was opened, which is the book of life... judged... according to their works* (Revelation 20:12) — the final reckoning the verified register foreshadows (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*they which are written in the Lamb''s book of life* (Revelation 21:27) — entry into the New Jerusalem turns on a name in the register, as did entry into the remnant (7:5).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=5
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*These sought their register... but they were not found: therefore were they, as polluted, put from the priesthood* (Ezra 2:62) — the parallel verdict on the unverified seed (Nehemiah 7:64).'
  FROM cross_reference_threads t
  JOIN _s316_neh07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=7 AND sv.verse_number=64
  JOIN _s316_neh07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=62
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-7-the-register-of-the-reckoned-seed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_8.sql (Nehemiah 8) -----
-- Book: Nehemiah  Chapter: 8   Tag: neh08   Session: s316
-- Temp view: _s316_neh08_lookup   Slug prefix: nehemiah-8-   Sort band: 32275+ (one per thread)
-- Source edition/book: canon / nehemiah, chapter 8
--
-- FRAMING — ★★★ THE RECOVERY OF THE WORD: the Torah read, explained, and obeyed.
-- Nehemiah 8 is the keystone of the post-exilic restoration: the whole people gather AS ONE MAN
-- and HUNGER for the book of the law of Moses; Ezra reads it from morning to midday and "the ears
-- of all the people were attentive unto the book of the law" (v.3). The Levites "read in the book
-- in the law of Elohim DISTINCTLY, and GAVE THE SENSE, and caused them to UNDERSTAND the reading"
-- (v.8) — the heart of true teaching, the Word read clearly AND expounded (the come-and-see
-- exposition the framework embodies; Messiah opening the scriptures, Luke 24:27/45; the guide,
-- Acts 8:30-31; rightly dividing, 2 Tim 2:15). The people WEEP under conviction, but are told
-- "mourn not... for the JOY OF YAHUAH IS YOUR STRENGTH" (v.10) — godly sorrow turned to the joy of
-- the forgiven, the Word understood producing joy (Ps 19:8, 2 Cor 7:10, Rom 14:17). They FIND
-- WRITTEN that Israel should dwell in booths and keep the FEAST OF TABERNACLES, and keep it "as it
-- is written" with very great gladness (v.13-18) — the appointed time restored by the rediscovered
-- Word, never abolished (Lev 23, Deut 16, kept by all nations in the kingdom, Zech 14:16). The
-- Torah is the living covenant inheritance recovered, not a defunct old covenant.
--
-- COVERAGE CHECKLIST:
--   v.1-6  (gather as one man, bring the book of the law, attentive, Amen Amen, worship)
--          NT:     Acts 13:15 (after reading of the law and prophets); Col 3:16 (word dwell richly) — USED
--          Extras: none warranted (NT + Deut carry it)
--          Tanakh: Deut 31:11-13 (read the law to all, that they hear/learn/fear); Deut 6:6-7 (these words in heart, teach diligently) — USED
--   v.5-8  (Ezra opened the book in sight of all; eyes; opened understanding)
--          NT:     Luke 4:16-21 (Messiah stood up to read, opened the book, eyes fastened) — USED
--          Extras: none warranted here (placed at v.8)
--          Tanakh: Ps 119:18 (open thou mine eyes, behold wondrous things out of thy law) — USED
--   v.7-8  (Levites caused them to understand; read distinctly, gave the sense)
--          NT:     Luke 24:27 (expounded in all the scriptures); Luke 24:45 (opened their understanding);
--                  Acts 8:30-31 (understandest thou? guide me); 2 Tim 2:15 (rightly dividing);
--                  Matt 13:23 (good ground heareth AND understandeth); 1 Cor 14:9 (words easy to be understood) — USED
--          Extras: 2 Esdras 14:40,47 (Ezra restores the books; spring of understanding) — USED
--          Tanakh: covered by source movement
--   v.9-12 (wept; mourn not; joy of Yahuah your strength; made great mirth because they understood)
--          NT:     2 Cor 7:10 (godly sorrow → repentance); Rom 14:17 (kingdom is joy in the Ruach); Phil 4:4 (rejoice alway) — USED
--          Extras: Sirach 6:37 (meditate in his commandments → establish heart, give wisdom) — USED
--          Tanakh: Ps 19:8 (statutes right, rejoicing the heart); Ps 119:111 (testimonies the rejoicing of my heart);
--                  Neh 12:43 (Elohim made them rejoice); Isa 12:3 (with joy draw water) — USED
--   v.13-18 (found written; dwell in booths; keep feast of tabernacles as it is written; great gladness; day by day)
--          NT:     John 7:2 (the feast of tabernacles was at hand); John 7:37 (last great day Messiah cried) — USED
--          Extras: none warranted (Torah + prophets + Gospel carry it)
--          Tanakh: Lev 23:42-43 (dwell in booths); Lev 23:34 (feast of tabernacles seven days);
--                  Deut 16:13-15 (observe the feast, surely rejoice); Deut 31:10-11 (read the law at tabernacles);
--                  Zech 14:16 (all nations keep tabernacles in the kingdom) — USED
--
-- THREADS (5 — keystone earns upper end):
--   nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law         free   (Tanakh + NT)
--   nehemiah-8-ezra-opened-the-book-open-thou-mine-eyes                           free   (Tanakh + NT)
--   nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand   extras (NT + 2 Esdras)
--   nehemiah-8-the-joy-of-yahuah-is-your-strength                                 extras (Tanakh + NT + Sirach)
--   nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written                free   (Tanakh + NT)

CREATE TEMP VIEW _s316_neh08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== CROSS_REFERENCES ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
  -- THREAD 1: gathered as one man to hear the book of the law (v.1-6)
  ('canon','nehemiah',8,1,'canon','deuteronomy',31,11,'free',
    E'*When all Yashar''el (Israel) is come to appear before Yahuah Elohayka (the LORD thy God) in the place which he shall choose, thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:11). Nehemiah''s assembly does exactly what Moses commanded: *all the people gathered themselves together as one man... to bring the book of the law of Moses* (Nehemiah 8:1) — the Torah read in the hearing of the whole people.'),
  ('canon','nehemiah',8,1,'canon','deuteronomy',31,12,'free',
    E'*Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12). The congregation *both of men and women, and all that could hear with understanding* (Nehemiah 8:2) is the Mosaic command kept — gathered to hear, learn, and do.'),
  ('canon','nehemiah',8,3,'canon','deuteronomy',31,13,'free',
    E'*And that their children, which have not known any thing, may hear, and learn to fear Yahuah Elohaychem (the LORD your God), as long as ye live in the land* (Deuteronomy 31:13). When *the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3), the generation come again out of captivity learns to fear Yahuah from the very Word Moses said must be read.'),
  ('canon','nehemiah',8,3,'canon','deuteronomy',6,6,'free',
    E'*And these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children* (Deuteronomy 6:6-7). The whole people *attentive unto the book of the law* (Nehemiah 8:3) from morning until midday are the words of Yahuah coming back into the heart of the nation, the Shema''s charge kept.'),
  ('canon','nehemiah',8,6,'canon','acts',13,15,'free',
    E'*And after the reading of the law and the prophets the rulers of the synagogue sent unto them, saying, Ye men and brethren, if ye have any word of exhortation for the people, say on* (Acts 13:15). The reading of the law before the assembly, then *Ezra blessed Yahuah (LORD), the great Elohim (God). And all the people answered, Amen, Amen* (Nehemiah 8:6), is the very pattern carried forward into the synagogue Yahusha and the apostles entered.'),
  ('canon','nehemiah',8,1,'canon','colossians',3,16,'free',
    E'*Let the word of Messiah (Christ) dwell in you richly in all wisdom; teaching and admonishing one another... singing with grace in your hearts to Yahuah (Lord)* (Colossians 3:16). The people who *spake unto Ezra the scribe to bring the book of the law* (Nehemiah 8:1) are the same hunger Paul commands — the indwelling Word richly received among the gathered people.'),

  -- THREAD 2: Ezra opened the book / open thou mine eyes (v.5-8)
  ('canon','nehemiah',8,5,'canon','psalms',119,18,'free',
    E'*Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18). When *Ezra opened the book in the sight of all the people... and all the people stood up* (Nehemiah 8:5), the Psalmist''s prayer is answered for a whole nation — the law opened that they may behold its wonders.'),
  ('canon','nehemiah',8,5,'canon','luke',4,16,'free',
    E'*And he came to Nazareth... and, as his custom was, he went into the synagogue on the sabbath day, and stood up for to read* (Luke 4:16). As Ezra *opened the book in the sight of all the people... and all the people stood up* (Nehemiah 8:5), so the Formed Son stands up to read the scroll — the reader of the Word who is himself the Word.'),
  ('canon','nehemiah',8,8,'canon','luke',4,17,'free',
    E'*And there was delivered unto him the book of the prophet Esaias. And when he had opened the book, he found the place where it was written* (Luke 4:17). The Levites who *read in the book in the law of Elohim... and gave the sense* (Nehemiah 8:8) prefigure the Messiah who opens the book and gives its true sense, declaring *This day is this scripture fulfilled in your ears* (Luke 4:21).'),

  -- THREAD 3: read distinctly, gave the sense, caused to understand (v.7-8) — EXTRAS thread
  ('canon','nehemiah',8,7,'canon','luke',24,45,'free',
    E'*Then opened he their understanding, that they might understand the scriptures* (Luke 24:45). The Levites who *caused the people to understand the law* (Nehemiah 8:7) do the work the risen Messiah does for his own — the Word is not merely heard but opened, the understanding unlocked.'),
  ('canon','nehemiah',8,8,'canon','luke',24,27,'free',
    E'*And beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:27). To *read in the book in the law of Elohim distinctly, and give the sense* (Nehemiah 8:8) is exactly what Yahusha did on the road — the Scripture read clearly and EXPOUNDED, the sense given.'),
  ('canon','nehemiah',8,8,'canon','acts',8,30,'free',
    E'*And Philip ran thither to him, and heard him read the prophet Esaias, and said, Understandest thou what thou readest?* (Acts 8:30). The eunuch reads but cannot grasp — the very gap the Levites filled when they *gave the sense, and caused them to understand the reading* (Nehemiah 8:8).'),
  ('canon','nehemiah',8,8,'canon','acts',8,31,'free',
    E'*And he said, How can I, except some man should guide me?* (Acts 8:31). The Word read without a guide leaves the heart in the dark; *they read... distinctly, and gave the sense* (Nehemiah 8:8) is the guide given — the come-and-see exposition the eunuch begged for.'),
  ('canon','nehemiah',8,8,'canon','2-timothy',2,15,'free',
    E'*Study to shew thyself approved unto Elohim (God), a workman that needeth not to be ashamed, rightly dividing the word of truth* (2 Timothy 2:15). The Levites who *gave the sense, and caused them to understand* (Nehemiah 8:8) are Paul''s pattern of the faithful workman — the Word rightly divided so the people understand.'),
  ('canon','nehemiah',8,8,'canon','matthew',13,23,'free',
    E'*But he that received seed into the good ground is he that heareth the word, and understandeth it; which also beareth fruit* (Matthew 13:23). The people who heard the law *distinctly* with *the sense* given are the good ground — hearing AND understanding, the fruit-bearing reception the Sower parable names.'),
  ('canon','nehemiah',8,8,'canon','1-corinthians',14,9,'free',
    E'*So likewise ye, except ye utter by the tongue words easy to be understood, how shall it be known what is spoken? for ye shall speak into the air* (1 Corinthians 14:9). To read *distinctly* and *give the sense* (Nehemiah 8:8) is Paul''s rule of edification — words made plain so the assembly understands, not speech cast into the air.'),
  ('canon','nehemiah',8,8,'apocrypha','2-esdras',14,40,'extras',
    E'*And I took it, and drank: and when I had drunk of it, my heart uttered understanding, and wisdom grew in my breast, for my spirit strengthened my memory* (2 Esdras 14:40). The same Ezra-tradition: the restorer of the Word filled with understanding so the lost Scripture might be recovered — the heart of the Levites'' work to *cause them to understand the reading* (Nehemiah 8:8).'),
  ('canon','nehemiah',8,8,'apocrypha','2-esdras',14,47,'extras',
    E'*For in them is the spring of understanding, the fountain of wisdom, and the stream of knowledge* (2 Esdras 14:47). The recovered books are named the very spring of understanding — what Nehemiah''s assembly drank when the Levites *gave the sense, and caused them to understand the reading* (Nehemiah 8:8).'),

  -- THREAD 4: the joy of Yahuah is your strength (v.9-12) — EXTRAS thread
  ('canon','nehemiah',8,10,'canon','psalms',19,8,'free',
    E'*The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* (Psalm 19:8). The people first wept under the law, but *the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10) — for the statutes themselves rejoice the heart; the Word understood produces joy, not bondage.'),
  ('canon','nehemiah',8,12,'canon','psalms',119,111,'free',
    E'*Thy testimonies have I taken as an heritage for ever: for they are the rejoicing of my heart* (Psalm 119:111). The people *went their way to eat, and to drink... and to make great mirth, because they had understood the words* (Nehemiah 8:12) — the testimonies become the rejoicing of the heart when their sense is grasped.'),
  ('canon','nehemiah',8,12,'canon','nehemiah',12,43,'free',
    E'*Also that day they offered great sacrifices, and rejoiced: for Elohim (God) had made them rejoice with great joy... so that the joy of Jerusalem was heard even afar off* (Nehemiah 12:43). The great mirth of Nehemiah 8:12 — *because they had understood the words* — is the same joy of Yahuah''s recovered people, this time at the dedication of the wall.'),
  ('canon','nehemiah',8,10,'canon','isaiah',12,3,'free',
    E'*Therefore with joy shall ye draw water out of the wells of salvation* (Isaiah 12:3). *The joy of Yahuah (LORD) is your strength* (Nehemiah 8:10) is the same well — for Yahuah *is my strength and my song; he also is become my salvation* (Isaiah 12:2); the joy of the Word and the joy of salvation are one spring.'),
  ('canon','nehemiah',8,9,'canon','2-corinthians',7,10,'free',
    E'*For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). The people *wept, when they heard the words of the law* (Nehemiah 8:9) — godly sorrow under the Word — yet are told to mourn not, for that conviction works repentance and is turned to joy, not regret.'),
  ('canon','nehemiah',8,10,'canon','romans',14,17,'free',
    E'*For the kingdom of Elohim (God) is not meat and drink; but righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17). To *eat the fat, and drink the sweet... for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10) is the kingdom''s own gladness — joy in the Ruach, the strength of the forgiven who have understood the Word.'),
  ('canon','nehemiah',8,10,'apocrypha','ecclesiasticus',6,37,'extras',
    E'*Let your mind be upon the ordinances of Yahuah (God) and meditate continually in his commandments: he shall establish yours heart, and give you wisdom at your owns desire* (Sirach 6:37). The joy that becomes the people''s strength flows from the Word meditated and understood — the heart established and made glad by the commandments, not crushed by them.'),

  -- THREAD 5: they kept the feast of tabernacles as it is written (v.13-18)
  ('canon','nehemiah',8,14,'canon','leviticus',23,42,'free',
    E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42). They *found written in the law... that the children of Yashar''el (Israel) should dwell in booths in the feast of the seventh month* (Nehemiah 8:14) — the appointed time recovered straight from the Torah, kept exactly as commanded.'),
  ('canon','nehemiah',8,14,'canon','leviticus',23,34,'free',
    E'*The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34). The feast Nehemiah''s people *found written in the law* (Nehemiah 8:14) is Yahuah''s own appointed time — never abolished, here rediscovered and obeyed.'),
  ('canon','nehemiah',8,17,'canon','leviticus',23,43,'free',
    E'*That your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (Leviticus 23:43). The returned captivity *made booths, and sat under the booths* (Nehemiah 8:17) — remembering, as Yahuah commanded, the deliverance the booths memorialize.'),
  ('canon','nehemiah',8,17,'canon','deuteronomy',16,15,'free',
    E'*Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God)... therefore thou shalt surely rejoice* (Deuteronomy 16:15). *There was very great gladness* (Nehemiah 8:17) at the feast of booths — the surely-rejoice of Deuteronomy come to pass when the rediscovered Word is kept.'),
  ('canon','nehemiah',8,18,'canon','deuteronomy',31,10,'free',
    E'*At the end of every seven years, in the solemnity of the year of release, in the feast of tabernacles* (Deuteronomy 31:10) Moses commanded the law be read. *Also day by day... he read in the book of the law of Elohim* through the seven days (Nehemiah 8:18) — the Torah read AT Tabernacles, the very command kept at the very feast it appointed.'),
  ('canon','nehemiah',8,17,'canon','zechariah',14,16,'free',
    E'*And it shall come to pass, that every one that is left of all the nations... shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The feast recovered with *very great gladness* (Nehemiah 8:17) is no defunct rite — it is kept by all nations in the coming kingdom, the appointed time that stands forever.'),
  ('canon','nehemiah',8,14,'canon','john',7,2,'free',
    E'*Now the Yahudim''s (Jews'') feast of tabernacles was at hand* (John 7:2). The feast Nehemiah''s people *found written in the law* (Nehemiah 8:14) is still kept centuries later when the Formed Son goes up to it — the appointed time enduring through the generations.'),
  ('canon','nehemiah',8,18,'canon','john',7,37,'free',
    E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). On *the eighth day* solemn assembly of Nehemiah 8:18, the great day of Tabernacles, the Messiah would later stand and offer the living water — the feast''s fulfilment in the One who is its substance.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== THREADS ==============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law',
  E'The people gathered as one man to hear the book of the law',
  E'The whole restored nation gathers *as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1) — a people HUNGRY for the Word. Ezra reads it to *the congregation both of men and women, and all that could hear with understanding* (Nehemiah 8:2), and *the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). This is precisely what Moses commanded: *thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:11), *that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law* (Deuteronomy 31:12), *and that their children... may hear, and learn to fear* (Deuteronomy 31:13). It is the Shema''s own charge: *these words, which I command thee this day, shall be in thine heart: And thou shalt teach them diligently unto thy children* (Deuteronomy 6:6-7). When *Ezra blessed Yahuah (LORD), the great Elohim (God). And all the people answered, Amen, Amen* (Nehemiah 8:6), the pattern is set that the synagogue would carry — *after the reading of the law and the prophets... if ye have any word of exhortation for the people, say on* (Acts 13:15) — and that Paul commands: *Let the word of Messiah (Christ) dwell in you richly in all wisdom* (Colossians 3:16). The recovery of the covenant begins with a whole people attentive to the read Word.',
  sv.verse_id, ev.verse_id, 'free', 32275
  FROM _s316_neh08_lookup sv, _s316_neh08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=8 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-8-ezra-opened-the-book-open-thou-mine-eyes',
  E'Ezra opened the book — open thou mine eyes',
  E'*And Ezra opened the book in the sight of all the people; (for he was above all the people;) and when he opened it, all the people stood up* (Nehemiah 8:5). The opened book before a standing nation is the Psalmist''s prayer answered for the whole people: *Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18). And it foreshadows the Formed Son, who *as his custom was, went into the synagogue on the sabbath day, and stood up for to read* (Luke 4:16); *and when he had opened the book, he found the place where it was written* (Luke 4:17), and declared *This day is this scripture fulfilled in your ears* (Luke 4:21). The reader who opens the law before the people, and the One who is himself the Word made flesh opening the scroll, are bound in one act — the law opened that its wonders may be beheld.',
  sv.verse_id, ev.verse_id, 'free', 32276
  FROM _s316_neh08_lookup sv, _s316_neh08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand',
  E'They read distinctly, and gave the sense, and caused them to understand',
  E'The Levites *caused the people to understand the law* (Nehemiah 8:7), and *so they read in the book in the law of Elohim (God) distinctly, and gave the sense, and caused them to understand the reading* (Nehemiah 8:8). This is the heart of true teaching — the Word read CLEARLY and EXPOUNDED so the people understand, the come-and-see exposition the whole framework embodies. It is what the risen Messiah did: *beginning at Moses and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (Luke 24:27); *then opened he their understanding, that they might understand the scriptures* (Luke 24:45). It is the gap the Ethiopian could not cross alone — *Understandest thou what thou readest?* (Acts 8:30), *How can I, except some man should guide me?* (Acts 8:31) — and the workman''s charge to be *rightly dividing the word of truth* (2 Timothy 2:15), with *words easy to be understood* (1 Corinthians 14:9). The good ground is the one who *heareth the word, and understandeth it; which also beareth fruit* (Matthew 13:23). The Ezra-tradition itself names this recovery of understanding: the restorer drank and *my heart uttered understanding, and wisdom grew in my breast* (2 Esdras 14:40), for in the recovered books *is the spring of understanding, the fountain of wisdom, and the stream of knowledge* (2 Esdras 14:47). The Word is never merely sounded — it is given its sense, and the people understand.',
  sv.verse_id, ev.verse_id, 'extras', 32277
  FROM _s316_neh08_lookup sv, _s316_neh08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-8-the-joy-of-yahuah-is-your-strength',
  E'The joy of Yahuah is your strength',
  E'When the people *wept, when they heard the words of the law* (Nehemiah 8:9), they were not left in mourning: *Go your way, eat the fat, and drink the sweet... neither be ye sorry; for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10). Their godly sorrow is turned to the joy of the forgiven, *for godly sorrow worketh repentance to salvation not to be repented of* (2 Corinthians 7:10). The Word understood does not crush but gladdens, for *the statutes of Yahuah (LORD) are right, rejoicing the heart* (Psalm 19:8), and the testimonies *are the rejoicing of my heart* (Psalm 119:111) — the mind set on the commandments is the heart established and made wise (*meditate continually in his commandments: he shall establish yours heart, and give you wisdom* — Sirach 6:37). So the people *went their way... to make great mirth, because they had understood the words that were declared unto them* (Nehemiah 8:12) — the same joy heard afar off at the dedication, *for Elohim (God) had made them rejoice with great joy* (Nehemiah 12:43); the same well where *with joy shall ye draw water out of the wells of salvation* (Isaiah 12:3); the same kingdom that is *righteousness, and peace, and joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17). The joy of Yahuah is the strength of a people who have heard, understood, and been forgiven by his Word.',
  sv.verse_id, ev.verse_id, 'extras', 32278
  FROM _s316_neh08_lookup sv, _s316_neh08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=8 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written',
  E'They kept the feast of tabernacles as it is written',
  E'Searching the recovered Word, *they found written in the law which Yahuah (LORD) had commanded by Moses, that the children of Yashar''el (Israel) should dwell in booths in the feast of the seventh month* (Nehemiah 8:14), and they kept it *as it is written* (Nehemiah 8:15). The appointed time is recovered straight from the Torah and obeyed: *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42), *the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34), *that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths, when I brought them out of the land of Egypt* (Leviticus 23:43). So they kept it with *very great gladness* (Nehemiah 8:17) — the surely-rejoice of *Seven days shalt thou keep a solemn feast unto Yahuah Elohayka (the LORD thy God)... therefore thou shalt surely rejoice* (Deuteronomy 16:15). And fittingly, Moses had appointed this very feast as the time to read the law: *in the feast of tabernacles... thou shalt read this law* (Deuteronomy 31:10), which Ezra does *day by day, from the first day unto the last day* (Nehemiah 8:18). This appointed time is no defunct rite: *the feast of tabernacles was at hand* (John 7:2) when the Formed Son went up, and on its great last day he stood and cried, *If any man thirst, let him come unto me, and drink* (John 7:37); and it shall yet be kept by all nations, who *shall even go up from year to year to worship the King, Yahuah Tseva''ot (LORD of hosts), and to keep the feast of tabernacles* (Zechariah 14:16). The rediscovered Word restores the appointed time that stands forever.',
  sv.verse_id, ev.verse_id, 'free', 32279
  FROM _s316_neh08_lookup sv, _s316_neh08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ============================== THREAD MEMBERS ==============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt read this law before all Yashar''el (Israel) in their hearing* (Deuteronomy 31:11) — the Mosaic command Ezra''s assembly keeps.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God)* (Deuteronomy 31:12) — gathered men and women to hear, learn, do.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*may hear, and learn to fear Yahuah Elohaychem (the LORD your God)* (Deuteronomy 31:13) — the captivity''s generation learning from the read Word.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*these words... shall be in thine heart: And thou shalt teach them diligently* (Deuteronomy 6:6-7) — the Shema''s charge, the Word back in the nation''s heart.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=3
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*after the reading of the law and the prophets... say on* (Acts 13:15) — the synagogue carries forward the read-law-then-Amen pattern.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=6
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Let the word of Messiah (Christ) dwell in you richly* (Colossians 3:16) — Paul''s command is the same hunger that brought Ezra the book.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=1
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-people-gathered-as-one-man-to-hear-the-book-of-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18) — the prayer answered for a whole standing nation.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-ezra-opened-the-book-open-thou-mine-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as his custom was, he went into the synagogue... and stood up for to read* (Luke 4:16) — the Formed Son stands up to read, as Ezra opened the book and the people stood.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=5
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-ezra-opened-the-book-open-thou-mine-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when he had opened the book, he found the place where it was written* (Luke 4:17) — the Messiah opens the book and gives its true sense, as the Levites gave the sense.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-ezra-opened-the-book-open-thou-mine-eyes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*then opened he their understanding, that they might understand the scriptures* (Luke 24:45) — the risen Messiah does what the Levites did, unlocking understanding.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=7
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*beginning at Moses... he expounded unto them in all the scriptures* (Luke 24:27) — the Scripture read and EXPOUNDED, the sense given.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Understandest thou what thou readest?* (Acts 8:30) — the very gap the Levites filled by giving the sense.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*How can I, except some man should guide me?* (Acts 8:31) — the guide given is the come-and-see exposition.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*rightly dividing the word of truth* (2 Timothy 2:15) — the faithful workman''s pattern, the Levites'' work.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*heareth the word, and understandeth it; which also beareth fruit* (Matthew 13:23) — the good ground hears AND understands.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*words easy to be understood* (1 Corinthians 14:9) — Paul''s rule of edification: read distinctly so the assembly grasps it.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=14 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*my heart uttered understanding, and wisdom grew in my breast* (2 Esdras 14:40) — the Ezra-tradition of the Word recovered with understanding.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*in them is the spring of understanding, the fountain of wisdom* (2 Esdras 14:47) — the recovered books are the spring the people drank when the sense was given.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=8
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=14 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-read-distinctly-and-gave-the-sense-and-caused-to-understand'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the statutes of Yahuah (LORD) are right, rejoicing the heart* (Psalm 19:8) — the Word understood gladdens; it does not crush.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thy testimonies... are the rejoicing of my heart* (Psalm 119:111) — the great mirth of those who understood the words.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=111
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Elohim (God) had made them rejoice with great joy... heard even afar off* (Nehemiah 12:43) — the same recovered-people gladness at the wall''s dedication.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=12 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*with joy shall ye draw water out of the wells of salvation* (Isaiah 12:3) — the joy of Yahuah is the well of salvation itself.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*godly sorrow worketh repentance to salvation not to be repented of* (2 Corinthians 7:10) — the weeping under the law turned to joy, not regret.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=9
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the kingdom of Elohim (God) is... joy in the Ruach HaKodesh (Holy Spirit)* (Romans 14:17) — the kingdom''s own gladness, the strength of the forgiven.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=14 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*meditate continually in his commandments: he shall establish yours heart, and give you wisdom* (Sirach 6:37) — joy flows from the Word meditated, the heart established by the commandments.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=10
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-the-joy-of-yahuah-is-your-strength'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths* (Leviticus 23:42) — the booths found written, kept as commanded.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34) — Yahuah''s own appointed time, never abolished.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths* (Leviticus 23:43) — the memorial of the Exodus the returned captivity keeps.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*therefore thou shalt surely rejoice* (Deuteronomy 16:15) — the very-great-gladness of Nehemiah 8:17 is the surely-rejoice of Deuteronomy.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*in the feast of tabernacles... thou shalt read this law* (Deuteronomy 31:10) — the Torah read AT Tabernacles, as Ezra read day by day through the seven days.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*every one... shall even go up... to keep the feast of tabernacles* (Zechariah 14:16) — the appointed time kept by all nations in the coming kingdom.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=17
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the Yahudim''s (Jews'') feast of tabernacles was at hand* (John 7:2) — the feast still kept centuries later when the Formed Son goes up to it.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=14
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried... let him come unto me, and drink* (John 7:37) — the feast''s fulfilment in the One who is its substance.'
  FROM cross_reference_threads t
  JOIN _s316_neh08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s316_neh08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-8-they-kept-the-feast-of-tabernacles-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_9.sql (Nehemiah 9) -----
-- Book: Nehemiah  chapter 9  (the Levites' great history-confession)
-- tag: neh09   session prefix: s316   temp view: _s316_neh09_lookup
-- sort_order band: 32300 +1 per thread (32300..32304)
-- slug prefix: nehemiah-9-
-- MEMBER FORM: STANDARD with explicit literal source verse (sv.chapter_number=9 AND sv.verse_number=<v>).
--   NO compact (VALUES ...) AS m(...) member form. tier BEFORE note in cross_references VALUES.
--
-- Nehemiah 9 coverage:
--   v.1-3  (gather, fast, confess, read the book of the law, worship)
--          NT:     none warranted (folded into the confession movements below)
--          Extras: none warranted
--          Tanakh: none warranted (the confession itself begins v.5)
--   v.5-6  (Stand up and bless Yahuah... Thou, even thou, art Yahuah alone; thou hast made heaven... and thou preservest them all)
--          NT:     Colossians 1:16, 1:17, Revelation 4:11  -> the Formed Son the agent by whom all things were created and consist; the Creator worshipped
--          Extras: none warranted (canon creation-witnesses carry the weight)
--          Tanakh: Genesis 1:1, Psalm 33:6, Isaiah 44:24  -> the sole Creator, by the word, who stretched the heavens ALONE
--   v.7-8  (chose Abram, found his heart faithful, made the covenant, hast performed thy words; for thou art righteous)
--          NT:     Romans 4:3, Romans 4:13, Galatians 3:8  -> Abraham believed, counted for righteousness; heir of the world; in thee shall all nations be blessed
--          Extras: none warranted
--          Tanakh: Genesis 12:1-3, Genesis 15:6, Genesis 15:18  -> the call, the believing heart, the land-covenant cut
--   v.9-15 (Red Sea, signs, pillar of cloud/fire, Sinai, right judgments and TRUE LAWS, good statutes, thy holy sabbath, bread from heaven, water from the rock)
--   v.13-14/v.20 (true laws, good statutes, thy holy sabbath; thy GOOD SPIRIT to instruct; manna)
--          NT:     Romans 7:12 (law holy/just/good), 1 Corinthians 10:4 (the Rock was Messiah)
--          Extras: Wisdom of Solomon 16:20, 16:26 (angels' food; it is your word which preserves)
--          Tanakh: Exodus 16:4 (manna proving whether they walk in the law), Exodus 20:8 + 20:11 (the sabbath, creation-rooted), Deuteronomy 8:3 (man lives by every word)
--   v.16-31 (rebelled, yet thou art a Elohim READY TO PARDON, gracious and merciful, slow to anger... forsookest them not; for thy great mercies' sake thou didst not utterly consume them)
--          NT:     Romans 2:4 (goodness leads to repentance), 2 Peter 3:9 (longsuffering, not willing any perish)
--          Extras: Ecclesiasticus (Sirach) 18:11, 18:13 (Yahuah patient, pours mercy; mercy upon all flesh, as a shepherd his flock)
--          Tanakh: Exodus 34:6 + 34:7 (the Name proclaimed), Psalm 103:8, Joel 2:13, Lamentations 3:22 + 3:23
--   v.32-38 (thou art JUST in all that is brought upon us; thou hast done right, but we have done wickedly; a sure covenant)
--          NT:     Romans 3:4 (let Elohim be true, but every man a liar; justified when judged)
--          Extras: none warranted
--          Tanakh: Daniel 9:14, Ezra 9:15, Lamentations 1:18, Psalm 51:4
--
-- THREADS (5):
--   nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all   (Tanakh + NT)        [9:5-6]
--   nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words            (Tanakh + NT)        [9:7-8]
--   nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit        (Tanakh + NT + Extras) [9:13-20]
--   nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not  (Tanakh + NT + Extras) [9:16-31]
--   nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us                        (Tanakh + NT)        [9:32-38]
--
-- GUARD NOTES:
--   9:6 SOLE CREATOR + sustainer: Col 1:16-17 keeps the Formed Son the AGENT of creation, all things consist by him,
--       who HAS a Father (not co-equal-persons, not Arian first-creature); Rev 4:11 the Creator worshipped.
--   9:13-14/9:20 the Torah given at Sinai = "true laws, good statutes... thy holy sabbath" + the GOOD SPIRIT to instruct
--       = Rom 7:12 the law holy/just/good; Spirit inseparable from Torah; the sabbath creation-rooted (Exod 20:11), NOT abolished.
--   9:17/9:31 "ready to pardon... forsook them not" = longsuffering covenant mercy through the cycles (Exod 34:6-7 the Name),
--       Rom 2:4 / 2 Pet 3:9 the goodness/longsuffering leading to repentance.
--   9:33 "thou art just in all that is brought upon us" = confession of Yahuah's RIGHTEOUSNESS in the judgment;
--       the curse is the just covenant-judgment for breaking Torah (v.34 "kept not thy law"), NEVER Torah-as-evil. Rom 3:4.

CREATE TEMP VIEW _s316_neh09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: 9:5-6 sole Creator and sustainer
    ('canon','nehemiah',9,6,'canon','genesis',1,1,'free',
      E'*In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1). Nehemiah''s Levites confess the same Maker: *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein* (Nehemiah 9:6). The opening word of the canon is the ground of their blessing.'),
    ('canon','nehemiah',9,6,'canon','psalms',33,6,'free',
      E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). The Levites name the same host: *thou hast made heaven, the heaven of heavens, with all their host... and the host of heaven worshippeth thee* (Nehemiah 9:6) — the spoken word that made the heavens is the word they bless.'),
    ('canon','nehemiah',9,6,'canon','isaiah',44,24,'free',
      E'*Thus saith Yahuah (LORD), thy redeemer, and he that formed thee from the womb, I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself* (Isaiah 44:24). Isaiah''s *alone... by myself* is Nehemiah''s *Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven... the earth* (Nehemiah 9:6) — one sole Creator, no rival.'),
    ('canon','nehemiah',9,6,'canon','colossians',1,16,'free',
      E'*For by him were all things created, that are in heaven, and that are in earth, visible and invisible... all things were created by him, and for him* (Colossians 1:16). The Maker the Levites bless — *thou hast made heaven... the earth, and all things that are therein* (Nehemiah 9:6) — is the Father working through the Formed Son, the agent by whom all things were made; he is Yahuah and has a Father.'),
    ('canon','nehemiah',9,6,'canon','colossians',1,17,'free',
      E'*And he is before all things, and by him all things consist* (Colossians 1:17). Nehemiah 9:6 says the same of the sustaining hand — *and thou preservest them all* — the Formed Son upholding the creation he made for the Father.'),
    ('canon','nehemiah',9,6,'canon','revelation',4,11,'free',
      E'*Thou art worthy, O Yahuah (Lord), to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11). The heavenly host sings the very confession of the Levites — *the host of heaven worshippeth thee* (Nehemiah 9:6) — the Creator worshipped by all he made.'),

    -- THREAD 2: 9:7-8 the covenant with Abraham kept, faithful heart
    ('canon','nehemiah',9,7,'canon','genesis',12,1,'free',
      E'*Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). The Levites recall this very call: *who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham* (Nehemiah 9:7).'),
    ('canon','nehemiah',9,8,'canon','genesis',15,6,'free',
      E'*And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). Nehemiah 9:8 names the same faithful heart: *And foundest his heart faithful before thee, and madest a covenant with him* — the believing trust that bound the covenant.'),
    ('canon','nehemiah',9,8,'canon','genesis',15,18,'free',
      E'*In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). This is the land-covenant the Levites confess kept: *madest a covenant with him to give the land... to his seed, and hast performed thy words; for thou art righteous* (Nehemiah 9:8).'),
    ('canon','nehemiah',9,8,'canon','romans',4,3,'free',
      E'*For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). The apostle reads the very heart Nehemiah names — *foundest his heart faithful before thee* (Nehemiah 9:8) — the faith reckoned to Abraham.'),
    ('canon','nehemiah',9,8,'canon','romans',4,13,'free',
      E'*For the promise, that he should be the heir of the world, was not to Abraham, or to his seed, through the law, but through the righteousness of faith* (Romans 4:13). Nehemiah 9:8 confesses that promise *performed* — *to give it... to his seed, and hast performed thy words; for thou art righteous* — Yahuah keeping faith with the faithful.'),
    ('canon','nehemiah',9,8,'canon','galatians',3,8,'free',
      E'*And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). The covenant Nehemiah confesses *performed* (9:8) carries the blessing of all families through the seed.'),

    -- THREAD 3: 9:13-20 true laws, good statutes, thy holy sabbath, and thy good Spirit
    ('canon','nehemiah',9,13,'canon','romans',7,12,'free',
      E'*Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12). The Levites describe the Sinai gift exactly so: *gavest them right judgments, and true laws, good statutes and commandments* (Nehemiah 9:13) — the Torah given good and true, never the curse.'),
    ('canon','nehemiah',9,14,'canon','exodus',20,8,'free',
      E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). Nehemiah 9:14 confesses the day made known at Sinai: *And madest known unto them thy holy sabbath, and commandedst them precepts, statutes, and laws, by the hand of Moses thy servant.*'),
    ('canon','nehemiah',9,14,'canon','exodus',20,11,'free',
      E'*For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The *holy sabbath* Nehemiah names (9:14) is creation-rooted in the same Maker the Levites just blessed (9:6) — the sign, not abolished.'),
    ('canon','nehemiah',9,15,'canon','exodus',16,4,'free',
      E'*Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you... that I may prove them, whether they will walk in my law, or no* (Exodus 16:4). Nehemiah 9:15 recalls the gift — *And gavest them bread from heaven for their hunger* — and 9:20 the abiding manna; the bread that proved whether they would keep Torah.'),
    ('canon','nehemiah',9,15,'canon','deuteronomy',8,3,'free',
      E'*And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The bread from heaven and water from the rock (Nehemiah 9:15) taught dependence on the word.'),
    ('canon','nehemiah',9,15,'canon','1-corinthians',10,4,'free',
      E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). The water *out of the rock* (Nehemiah 9:15) is read forward to the Formed Son who fed and watered Yashar''el (Israel) in the wilderness.'),
    ('canon','nehemiah',9,20,'canon','deuteronomy',8,2,'free',
      E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). Nehemiah 9:20-21 confesses that same provision — *Thou gavest also thy good spirit to instruct them... forty years didst thou sustain them in the wilderness, so that they lacked nothing.*'),
    ('canon','nehemiah',9,20,'apocrypha','the-wisdom-of-solomon',16,20,'extras',
      E'*Instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste* (Wisdom of Solomon 16:20). The restored witness names the manna the Levites confess — *withheldest not thy manna from their mouth* (Nehemiah 9:20) — as heaven''s own bread.'),
    ('canon','nehemiah',9,20,'apocrypha','the-wisdom-of-solomon',16,26,'extras',
      E'*That your children, O Yahuah (God), whom you lovest, might know, that it is not the growing of fruits that nourishes man: but that it is your word, which preserves them that put their trust in you* (Wisdom of Solomon 16:26). The manna and the *good spirit to instruct them* (Nehemiah 9:20) teach the same lesson Deuteronomy 8:3 taught — man lives by the word.'),

    -- THREAD 4: 9:16-31 a Elohim ready to pardon, gracious and merciful, forsook them not
    ('canon','nehemiah',9,17,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The Levites quote the Name proclaimed at Sinai: *but thou art a Elohim (God) ready to pardon, gracious and merciful, slow to anger, and of great kindness, and forsookest them not* (Nehemiah 9:17).'),
    ('canon','nehemiah',9,17,'canon','exodus',34,7,'free',
      E'*Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7). The pardon Nehemiah 9:17 confesses — *a Elohim (God) ready to pardon* — is the very forgiving of iniquity proclaimed in the Name.'),
    ('canon','nehemiah',9,17,'canon','psalms',103,8,'free',
      E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8). The psalm sings what Nehemiah''s Levites confess of the wilderness cycles — *gracious and merciful, slow to anger, and of great kindness* (Nehemiah 9:17).'),
    ('canon','nehemiah',9,17,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). Joel calls the rebel home on the very ground Nehemiah 9:17 confesses — *gracious and merciful, slow to anger, and of great kindness.*'),
    ('canon','nehemiah',9,31,'canon','lamentations',3,22,'free',
      E'*It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22). Nehemiah 9:31 says it with the same words: *Nevertheless for thy great mercies'' sake thou didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God).*'),
    ('canon','nehemiah',9,31,'canon','lamentations',3,23,'free',
      E'*They are new every morning: great is thy faithfulness* (Lamentations 3:23). The unfailing mercy that did *not utterly consume them* (Nehemiah 9:31) is renewed each morning — the covenant faithfulness through the cycles of rebellion.'),
    ('canon','nehemiah',9,17,'canon','romans',2,4,'free',
      E'*Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). The longsuffering Nehemiah 9:17 confesses — *ready to pardon... slow to anger... forsookest them not* — is the goodness meant to lead the rebel back.'),
    ('canon','nehemiah',9,31,'canon','2-peter',3,9,'free',
      E'*Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The mercy that *did not utterly consume them* (Nehemiah 9:31) is the same longsuffering that withholds judgment for repentance.'),
    ('canon','nehemiah',9,17,'apocrypha','ecclesiasticus',18,11,'extras',
      E'*Therefore is Yahuah (God) patient with them, and poureth forth his mercy upon them* (Ecclesiasticus 18:11). The restored wisdom witnesses the same patience the Levites confess — *gracious and merciful, slow to anger... and forsookest them not* (Nehemiah 9:17).'),
    ('canon','nehemiah',9,31,'apocrypha','ecclesiasticus',18,13,'extras',
      E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* (Ecclesiasticus 18:13). Sirach names the very pattern of Nehemiah 9 — Yahuah reproves yet brings again, *not utterly* consuming (9:31), as a shepherd gathers the strayed.'),

    -- THREAD 5: 9:32-38 thou art just in all that is brought upon us
    ('canon','nehemiah',9,33,'canon','daniel',9,14,'free',
      E'*Therefore hath Yahuah (LORD) watched upon the evil, and brought it upon us: for Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14). Daniel''s confession is twin to Nehemiah''s: *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33) — the judgment is righteous, the sin is theirs.'),
    ('canon','nehemiah',9,33,'canon','ezra',9,15,'free',
      E'*O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses* (Ezra 9:15). Ezra confesses what Nehemiah 9:33 confesses — *thou art just in all that is brought upon us* — Yahuah righteous, the people in the wrong.'),
    ('canon','nehemiah',9,33,'canon','lamentations',1,18,'free',
      E'*Yahuah (LORD) is righteous; for I have rebelled against his commandment* (Lamentations 1:18). The exile-judgment is owned as just — the same confession as *thou hast done right, but we have done wickedly* (Nehemiah 9:33); the curse falls because they *kept not thy law* (9:34), never because the Torah is evil.'),
    ('canon','nehemiah',9,33,'canon','psalms',51,4,'free',
      E'*Against thee, thee only, have I sinned, and done this evil in thy sight: that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4). David''s confession justifies Yahuah in the judgment exactly as Nehemiah 9:33 — *thou art just in all that is brought upon us.*'),
    ('canon','nehemiah',9,33,'canon','romans',3,4,'free',
      E'*let Elohim (God) be true, but every man a liar; as it is written, That thou mightest be justified in thy sayings, and mightest overcome when thou art judged* (Romans 3:4). Paul states the principle Nehemiah''s confession enacts — *thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
-- Thread 1: 9:5-6 sole Creator and sustainer
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all',
       E'Thou, even Thou, art Yahuah alone — Thou hast made, and preservest, them all',
       E'The Levites lift the great blessing and ground it in creation: *Stand up and bless Yahuah Elohaychem (the LORD your God) for ever and ever... Thou, even thou, art Yahuah (LORD) alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein, the seas, and all that is therein, and thou preservest them all; and the host of heaven worshippeth thee* (Nehemiah 9:5-6). This is the opening word of the canon — *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1) — and the song of the heavens — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* (Psalm 33:6). Isaiah presses the *alone*: *I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone; that spreadeth abroad the earth by myself* (Isaiah 44:24). The work was done by the Father through the Formed Son: *For by him were all things created, that are in heaven, and that are in earth... all things were created by him, and for him* (Colossians 1:16), *and he is before all things, and by him all things consist* (Colossians 1:17) — the same hand that *preservest them all.* He is Yahuah and he has a Father; no co-equal persons, no rival maker. And the host of heaven that worshippeth (9:6) sings the consummation: *Thou art worthy, O Yahuah (Lord)... for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11).',
       sv.verse_id, ev.verse_id, 'free', 32300
  FROM _s316_neh09_lookup sv, _s316_neh09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: 9:7-8 the covenant with Abraham kept
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words',
       E'Foundest his heart faithful — and hast performed thy words; for Thou art righteous',
       E'The confession turns to the father of the seed: *Thou art Yahuah (LORD) the Elohim (God), who didst choose Abram, and broughtest him forth out of Ur of the Chaldees, and gavest him the name of Abraham; And foundest his heart faithful before thee, and madest a covenant with him to give the land... to his seed, and hast performed thy words; for thou art righteous* (Nehemiah 9:7-8). This is the call — *Get thee out of thy country... unto a land that I will shew thee* (Genesis 12:1) — and the faithful heart — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6) — and the land-covenant cut: *Unto thy seed have I given this land, from the river of Egypt unto the great river* (Genesis 15:18). The apostle reads the same heart: *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3); the promise that *he should be the heir of the world... through the righteousness of faith* (Romans 4:13). And the blessing of the seed reaches the nations: *In thee shall all nations be blessed* (Galatians 3:8). Yahuah found the heart faithful and *performed* his words — the covenant kept, the Maker righteous.',
       sv.verse_id, ev.verse_id, 'free', 32301
  FROM _s316_neh09_lookup sv, _s316_neh09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: 9:13-20 true laws, good statutes, thy holy sabbath, the good Spirit
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit',
       E'Right judgments and true laws, good statutes... thy holy sabbath — and thy good Spirit to instruct them',
       E'At Sinai the gift is named good and true: *Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments: And madest known unto them thy holy sabbath* (Nehemiah 9:13-14). The Torah is exactly as the apostle confesses it: *Wherefore the law is holy, and the commandment holy, and just, and good* (Romans 7:12) — never the curse. The *holy sabbath* (9:14) is the day commanded — *Remember the sabbath day, to keep it holy* (Exodus 20:8) — and it is creation-rooted in the very Maker just blessed: *For in six days Yahuah (LORD) made heaven and earth... wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11); the sign stands, not abolished. The provision teaches dependence: *bread from heaven... water for them out of the rock* (Nehemiah 9:15), the manna that proved *whether they will walk in my law, or no* (Exodus 16:4), to teach *that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD)* (Deuteronomy 8:3) — and the Rock read forward: *that Rock was Messiah (Christ)* (1 Corinthians 10:4). And the Torah''s Giver is inseparable from his Spirit: *Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth* (Nehemiah 9:20), sustaining forty years (Deuteronomy 8:2). The restored witnesses sing the manna too: *thou feddest thy own people with angels'' food* (Wisdom of Solomon 16:20), *it is your word, which preserves them that put their trust in you* (Wisdom of Solomon 16:26).',
       sv.verse_id, ev.verse_id, 'extras', 32302
  FROM _s316_neh09_lookup sv, _s316_neh09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=9 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: 9:16-31 a Elohim ready to pardon, gracious and merciful
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not',
       E'A Elohim ready to pardon, gracious and merciful — and forsookest them not',
       E'Through every cycle of rebellion the confession returns to mercy: *But thou art a Elohim (God) ready to pardon, gracious and merciful, slow to anger, and of great kindness, and forsookest them not* (Nehemiah 9:17); and at the end, *Nevertheless for thy great mercies'' sake thou didst not utterly consume them, nor forsake them; for thou art a gracious and merciful Elohim (God)* (Nehemiah 9:31). This is the Name proclaimed at Sinai: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6), *Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7) — sung by the psalmist, *merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8), and held out to the rebel by Joel, *for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). Jeremiah weeps it in the ruins: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22); *They are new every morning: great is thy faithfulness* (Lamentations 3:23). And the apostles name the purpose of the long-suffering: *the goodness of Elohim (God) leadeth thee to repentance* (Romans 2:4); *longsuffering to us-ward, not willing that any should perish* (2 Peter 3:9). The restored wisdom adds its witness: *Yahuah (God) is patient with them, and poureth forth his mercy upon them* (Ecclesiasticus 18:11); his mercy *is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* (Ecclesiasticus 18:13) — the very pattern of Nehemiah 9, reproof that does not forsake.',
       sv.verse_id, ev.verse_id, 'extras', 32303
  FROM _s316_neh09_lookup sv, _s316_neh09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=9 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- Thread 5: 9:32-38 thou art just in all that is brought upon us
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us',
       E'Thou art just in all that is brought upon us — Thou hast done right, but we have done wickedly',
       E'The prayer closes by justifying Yahuah in the very judgment: *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33); for *Neither have our kings, our princes, our priests, nor our fathers, kept thy law, nor hearkened unto thy commandments* (9:34). The curse falls because they broke covenant — never because the Torah is evil. Daniel confesses it the same way: *Yahuah Eloheinu (the LORD our God) is righteous in all his works which he doeth: for we obeyed not his voice* (Daniel 9:14); and Ezra: *thou art righteous: for we remain yet escaped... behold, we are before thee in our trespasses* (Ezra 9:15); and Jeremiah in the ruins: *Yahuah (LORD) is righteous; for I have rebelled against his commandment* (Lamentations 1:18). David lays it bare: *Against thee, thee only, have I sinned... that thou mightest be justified when thou speakest, and be clear when thou judgest* (Psalm 51:4) — the principle the apostle states, *let Elohim (God) be true, but every man a liar... That thou mightest be justified in thy sayings, and mightest overcome when thou art judged* (Romans 3:4). So the people *make a sure covenant, and write it* (9:38), turning back to the Torah they had broken.',
       sv.verse_id, ev.verse_id, 'free', 32304
  FROM _s316_neh09_lookup sv, _s316_neh09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=9 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth*: the opening word of the canon is the ground of the blessing.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth*: the spoken word that made the host the Levites bless.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 44:24 — *I am Yahuah (LORD) that maketh all things; that stretcheth forth the heavens alone... by myself*: the *alone* of Nehemiah 9:6.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Colossians 1:16 — *by him were all things created... all things were created by him, and for him*: the Father working through the Formed Son, the agent of creation who has a Father.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Colossians 1:17 — *by him all things consist*: the sustaining hand that *preservest them all* (Nehemiah 9:6).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Revelation 4:11 — *thou hast created all things, and for thy pleasure they are and were created*: the Creator worshipped, as *the host of heaven worshippeth thee* (Nehemiah 9:6).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=6
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-even-thou-art-yahuah-alone-thou-hast-made-and-preservest-all'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Genesis 12:1 — *Get thee out of thy country... unto a land that I will shew thee*: the call the Levites recall (*who didst choose Abram*, Nehemiah 9:7).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness*: the faithful heart Yahuah *found* (Nehemiah 9:8).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Genesis 15:18 — *Unto thy seed have I given this land*: the land-covenant cut, *performed* (Nehemiah 9:8).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 4:3 — *Abraham believed Elohim (God), and it was counted unto him for righteousness*: the apostle reads the same heart (*foundest his heart faithful*, Nehemiah 9:8).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 4:13 — *the heir of the world... through the righteousness of faith*: the promise Nehemiah 9:8 confesses *performed*.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Galatians 3:8 — *In thee shall all nations be blessed*: the blessing of the seed reaching the families of the earth.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-foundest-his-heart-faithful-and-hast-performed-thy-words'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 7:12 — *the law is holy, and the commandment holy, and just, and good*: exactly the Sinai gift (*true laws, good statutes*, Nehemiah 9:13), never the curse.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=13
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 20:8 — *Remember the sabbath day, to keep it holy*: the *holy sabbath* made known at Sinai (Nehemiah 9:14).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 20:11 — *Yahuah (LORD) blessed the sabbath day, and hallowed it*: the sabbath creation-rooted in the Maker just blessed (Nehemiah 9:6,14); the sign stands.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=14
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Exodus 16:4 — *I will rain bread from heaven... that I may prove them, whether they will walk in my law*: the manna of Nehemiah 9:15,20 that tested Torah-keeping.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 8:3 — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD)*: the lesson of the bread from heaven (Nehemiah 9:15).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Corinthians 10:4 — *that Rock was Messiah (Christ)*: the water *out of the rock* (Nehemiah 9:15) read forward to the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=15
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Deuteronomy 8:2 — *led thee these forty years in the wilderness, to humble thee, and to prove thee*: the forty-year sustaining of Nehemiah 9:20-21, the *good spirit to instruct.*'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Wisdom of Solomon 16:20 — *thou feddest thy own people with angels'' food... bread prepared without their labour*: the restored witness names the manna (Nehemiah 9:20).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Wisdom of Solomon 16:26 — *it is your word, which preserves them that put their trust in you*: the manna and the *good spirit to instruct* (Nehemiah 9:20) teach the same word-dependence as Deuteronomy 8:3.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=20
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-true-laws-good-statutes-thy-holy-sabbath-and-thy-good-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 34:6 — *Yahuah (LORD), Yahuah Elohim... merciful and gracious, longsuffering, and abundant in goodness and truth*: the Name the Levites quote (Nehemiah 9:17).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 34:7 — *forgiving iniquity and transgression and sin*: the *ready to pardon* of Nehemiah 9:17.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 103:8 — *merciful and gracious, slow to anger, and plenteous in mercy*: the psalm sings Nehemiah 9:17.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Joel 2:13 — *he is gracious and merciful, slow to anger, and of great kindness*: the call home on Nehemiah 9:17''s ground.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 2:4 — *the goodness of Elohim (God) leadeth thee to repentance*: the purpose of the long-suffering Nehemiah 9:17 confesses.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ecclesiasticus (Sirach) 18:11 — *Yahuah (God) is patient with them, and poureth forth his mercy upon them*: the restored wisdom witnesses Nehemiah 9:17.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=17
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Lamentations 3:22 — *It is of the LORD''S mercies that we are not consumed*: word-for-word the *not utterly consume them* of Nehemiah 9:31.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=31
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Lamentations 3:23 — *They are new every morning: great is thy faithfulness*: the renewed mercy that did not forsake (Nehemiah 9:31).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=31
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'2 Peter 3:9 — *longsuffering to us-ward, not willing that any should perish*: the mercy that *did not utterly consume them* (Nehemiah 9:31).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=31
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'Ecclesiasticus (Sirach) 18:13 — *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock*: the very pattern of Nehemiah 9, reproof that does not forsake (9:31).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=31
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-a-elohim-ready-to-pardon-gracious-and-merciful-forsookest-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Daniel 9:14 — *Yahuah Eloheinu (the LORD our God) is righteous in all his works... for we obeyed not his voice*: Daniel''s twin confession to Nehemiah 9:33.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ezra 9:15 — *thou art righteous... behold, we are before thee in our trespasses*: Ezra confesses what Nehemiah 9:33 confesses.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lamentations 1:18 — *Yahuah (LORD) is righteous; for I have rebelled against his commandment*: the exile-judgment owned as just (Nehemiah 9:33-34) because they kept not the law, never because Torah is evil.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 51:4 — *that thou mightest be justified when thou speakest, and be clear when thou judgest*: David justifies Yahuah in judgment as Nehemiah 9:33.'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Romans 3:4 — *let Elohim (God) be true, but every man a liar... That thou mightest be justified in thy sayings*: the principle Nehemiah''s confession enacts (9:33).'
  FROM cross_reference_threads t
  JOIN _s316_neh09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s316_neh09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-9-thou-art-just-in-all-that-is-brought-upon-us'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_10.sql (Nehemiah 10) -----
-- Chapter: Nehemiah 10 — the sealed covenant to keep the Torah (covenant renewal under Nehemiah)
-- Tag: neh10   Session prefix: s316   Temp view: _s316_neh10_lookup
-- Sort band: 32325 (+1 per thread) -> 32325, 32326, 32327, 32328
-- Source book_slug: nehemiah, chapter 10. All targets canon Tanakh (tier 'free'); no extras warranted.
--
-- Nehemiah 10 coverage:
--   v.1-27 the names of those who SEAL the covenant (priests, Levites, chiefs of the people)
--        NT:     none warranted (a sealing-roster; the binding force is carried in v.28-29 thread)
--        Extras: none warranted
--        Tanakh: none warranted (folded into the v.28-29 oath thread)
--   v.28-29 the whole people entered into a curse and an oath to WALK in Elohim's law given by Moses, to OBSERVE AND DO all the commandments
--        NT:     none added (Jer 31:33 carries the new-covenant-Torah-on-the-heart forward; framed in prose)
--        Extras: none warranted
--        Tanakh: Exod 24:3, Exod 24:7, Deut 29:12, Deut 29:13, Josh 24:24, 2 Kings 23:3, 2 Chron 34:31, Jer 31:33 -> THREAD 1
--   v.30 we would not give our daughters / take their daughters (separation from the idol-nations)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Deut 7:3, Deut 7:4, Josh 24:23 -> THREAD 2 (covenant-fidelity guard: the danger is the heart turned to other gods, NOT race)
--   v.31 no buying on the SABBATH; leave the SEVENTH YEAR and the exaction of every debt
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exod 20:8, Exod 20:11, Isa 58:13, Neh 13:17, Lev 25:4, Exod 23:11, Deut 15:1 -> THREAD 3
--   v.32-39 the temple half-shekel, the wood offering, the FIRSTFRUITS and the TITHES — "we will not forsake the house of our Elohim"
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Exod 30:13, Num 18:21, Num 18:26, Mal 3:10, Lev 27:30, Deut 26:2, Deut 12:6 -> THREAD 4
--
-- THREADS:
--   nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah (free; Tanakh) — v.28-29 covenant renewal, the anti-antinomian oath to DO the Torah
--   nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity (free; Tanakh) — v.30 separation framed as fidelity against the heart-turning idolatry, not race
--   nehemiah-10-the-sabbath-kept-and-the-seventh-year-released (free; Tanakh) — v.31 Sabbath + land-sabbath + the release
--   nehemiah-10-we-will-not-forsake-the-house-of-our-elohim (free; Tanakh) — v.32-39 tithes/firstfruits/temple support
--
-- Framework-load-bearing framing:
--   v.29 "to walk in Elohim's law... to observe and DO all the commandments" = the covenant-renewal binding the
--        whole people by oath to DO the Torah (Exod 24:7 "we will do and be obedient"; the Torah kept, NOT abolished;
--        Jer 31:33 the same Torah written on the heart — the new covenant is the Torah internalized, not replaced).
--   v.30 framed per the covenant-fidelity guard: the peril named in Deut 7:4 is "they will turn away thy son from
--        following me, that they may serve other gods" — the idolatry that turns the heart, NOT bloodline/race.

CREATE TEMP VIEW _s316_neh10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- cross_references
-- ============================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: v.28-29 the oath to walk in and DO the Torah
    ('canon','nehemiah',10,29,'canon','exodus',24,3,'free',
     E'*And Moses came and told the people all the words of Yahuah (LORD), and all the judgments: and all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do.* (Exodus 24:3). When the people of Nehemiah''s day *entered into a curse, and into an oath, to walk in Elohim''s (God''s) law... and to observe and do all the commandments of Yahuah (LORD)* (Nehemiah 10:29), they renewed the very vow first spoken at Sinai with one voice — the covenant to DO the words of Yahuah.'),
    ('canon','nehemiah',10,29,'canon','exodus',24,7,'free',
     E'*And he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient.* (Exodus 24:7). Nehemiah''s generation *clave to their brethren... and entered into a curse, and into an oath, to walk in Elohim''s (God''s) law, which was given by Moses* (Nehemiah 10:29) — the same book of the covenant read again, the same answer given again: *we will do, and be obedient.*'),
    ('canon','nehemiah',10,29,'canon','deuteronomy',29,12,'free',
     E'*That thou shouldest enter into covenant with Yahuah Elohayka (the LORD thy God), and into his oath, which Yahuah Elohayka (the LORD thy God) maketh with thee this day* (Deuteronomy 29:12). The Torah itself frames covenant-keeping as entering *into his oath* — exactly what Nehemiah 10:29 records: the people *entered into a curse, and into an oath, to walk in Elohim''s (God''s) law.*'),
    ('canon','nehemiah',10,29,'canon','deuteronomy',29,13,'free',
     E'*That he may establish thee to day for a people unto himself, and that he may be unto thee a Elohim (God), as he hath said unto thee, and as he hath sworn unto thy fathers, to Abraham, to Isaac, and to Jacob.* (Deuteronomy 29:13). The oath of Nehemiah 10:29 — *to walk in Elohim''s (God''s) law... and to observe and do all the commandments* — re-establishes the people as Yahuah''s own, the same covenant sworn to the fathers, now sealed again by the returned remnant.'),
    ('canon','nehemiah',10,29,'canon','joshua',24,24,'free',
     E'*And the people said unto Joshua, Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey.* (Joshua 24:24). From Joshua at Shechem to Nehemiah at Jerusalem the pattern is one: the gathered people bind themselves by word to obey — *to walk in Elohim''s (God''s) law... and to observe and do all the commandments of Yahuah (LORD) our Lord, and his judgments and his statutes* (Nehemiah 10:29).'),
    ('canon','nehemiah',10,29,'canon','2-kings',23,3,'free',
     E'*And the king stood by a pillar, and made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments and his testimonies and his statutes with all their heart and all their soul, to perform the words of this covenant that were written in this book. And all the people stood to the covenant.* (2 Kings 23:3). Josiah''s covenant-renewal and Nehemiah''s are cast in the same Torah-words — *to walk... to keep his commandments... his judgments and his statutes* (Nehemiah 10:29) — the recurring covenant renewal of Yahuah''s people.'),
    ('canon','nehemiah',10,29,'canon','2-chronicles',34,31,'free',
     E'*And the king stood in his place, and made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments, and his testimonies, and his statutes, with all his heart, and with all his soul, to perform the words of the covenant which are written in this book.* (2 Chronicles 34:31). The chronicler''s wording of Josiah''s vow is the seed-form of Nehemiah 10:29 — *to walk in Elohim''s (God''s) law... and to observe and do all the commandments of Yahuah (LORD) our Lord, and his judgments and his statutes.*'),
    ('canon','nehemiah',10,29,'canon','jeremiah',31,33,'free',
     E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). The oath of Nehemiah 10:29 — *to observe and do all the commandments* — is the outward sign of the inward work Jeremiah promised: the new covenant is the SAME law written on the heart, not the law replaced. The Torah is kept, never abolished.'),

    -- THREAD 2: v.30 no marriage with the idol-nations
    ('canon','nehemiah',10,30,'canon','deuteronomy',7,3,'free',
     E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* (Deuteronomy 7:3). Nehemiah''s covenant — *that we would not give our daughters unto the people of the land, nor take their daughters for our sons* (Nehemiah 10:30) — is the people binding themselves anew to this Torah word.'),
    ('canon','nehemiah',10,30,'canon','deuteronomy',7,4,'free',
     E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* (Deuteronomy 7:4). The Torah names the reason for the separation of Nehemiah 10:30: not bloodline but the heart turned away to *serve other gods.* The danger guarded against is idolatry that captures the household, never race.'),
    ('canon','nehemiah',10,30,'canon','joshua',24,23,'free',
     E'*Now therefore put away, said he, the strange gods which are among you, and incline your heart unto Yahuah Elohim (the LORD God) of Yashar''el (Israel).* (Joshua 24:23). The covenant of Nehemiah 10:30 not to intermarry with *the people of the land* is the practical form of Joshua''s charge — to put away the *strange gods* and keep the heart wholly toward Yahuah.'),

    -- THREAD 3: v.31 the Sabbath kept and the seventh year released
    ('canon','nehemiah',10,31,'canon','exodus',20,8,'free',
     E'*Remember the sabbath day, to keep it holy.* (Exodus 20:8). The covenant of Nehemiah 10:31 — *that we would not buy it of them on the sabbath, or on the holy day* — is the fourth word of the Ten guarded in the marketplace: the Sabbath remembered and kept holy, even against the traders'' wares.'),
    ('canon','nehemiah',10,31,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* (Exodus 20:11). The Sabbath Nehemiah''s people refuse to profane by buying (Nehemiah 10:31) is the creation-rooted, Yahuah-hallowed seventh day — His calendar, not abolished but kept.'),
    ('canon','nehemiah',10,31,'canon','isaiah',58,13,'free',
     E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words* (Isaiah 58:13). To refuse to buy *on the sabbath, or on the holy day* (Nehemiah 10:31) is to *turn away thy foot from the sabbath* and call it *a delight* — the prophet''s own vision of the kept Sabbath, lived out by the returned remnant.'),
    ('canon','nehemiah',10,31,'canon','nehemiah',13,17,'free',
     E'*Then I contended with the nobles of Yahudah (Judah), and said unto them, What evil thing is this that ye do, and profane the sabbath day?* (Nehemiah 13:17). The covenant of Nehemiah 10:31 is the law Nehemiah later enforced when it was broken: the very buying and selling sworn off here is what he shut the gates against — the Sabbath kept, then guarded.'),
    ('canon','nehemiah',10,31,'canon','leviticus',25,4,'free',
     E'*But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* (Leviticus 25:4). The second half of the vow — *that we would leave the seventh year* (Nehemiah 10:31) — keeps the land''s sabbath commanded at Sinai: the seventh year a rest unto Yahuah.'),
    ('canon','nehemiah',10,31,'canon','exodus',23,11,'free',
     E'*But the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat: and what they leave the beasts of the field shall eat. In like manner thou shalt deal with thy vineyard, and with thy oliveyard.* (Exodus 23:11). To *leave the seventh year* (Nehemiah 10:31) is to keep this Torah word — the land let rest so the poor may eat — the sabbatical year honored by the remnant.'),
    ('canon','nehemiah',10,31,'canon','deuteronomy',15,1,'free',
     E'*At the end of every seven years thou shalt make a release.* (Deuteronomy 15:1). The covenant clause *and the exaction of every debt* (Nehemiah 10:31) is the people taking up the release of Deuteronomy 15 — the seventh-year remission of debts kept as part of the land''s sabbath.'),

    -- THREAD 4: v.32-39 we will not forsake the house of our Elohim
    ('canon','nehemiah',10,32,'canon','exodus',30,13,'free',
     E'*This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary: (a shekel is twenty gerahs:) an half shekel shall be the offering of Yahuah (LORD).* (Exodus 30:13). When Nehemiah''s people charge themselves *yearly with the third part of a shekel for the service of the house of our Elohim (God)* (Nehemiah 10:32), they are restoring the sanctuary-offering of Exodus 30 — the people sustaining the worship of Yahuah''s house.'),
    ('canon','nehemiah',10,37,'canon','numbers',18,21,'free',
     E'*And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* (Numbers 18:21). The covenant *the tithes of our ground unto the Levites* (Nehemiah 10:37) renders to the Levites exactly what the Torah assigned them — the tenth for their service at the house of Elohim.'),
    ('canon','nehemiah',10,38,'canon','numbers',18,26,'free',
     E'*Thus speak unto the Levites, and say unto them, When ye take of the children of Yashar''el (Israel) the tithes which I have given you from them for your inheritance, then ye shall offer up an heave offering of it for Yahuah (LORD), even a tenth part of the tithe.* (Numbers 18:26). The clause *the Levites shall bring up the tithe of the tithes* (Nehemiah 10:38) keeps this Torah ordinance precisely — the Levites tithing on their tithe to the priests.'),
    ('canon','nehemiah',10,37,'canon','malachi',3,10,'free',
     E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house, and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it.* (Malachi 3:10). The covenant to bring *the tithes of our ground unto the Levites* into *the treasure house* (Nehemiah 10:37-38) answers the prophet''s call — the storehouse filled so there be meat in Yahuah''s house.'),
    ('canon','nehemiah',10,37,'canon','leviticus',27,30,'free',
     E'*And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* (Leviticus 27:30). The tithe Nehemiah''s people covenant to bring — *the fruit of all manner of trees, of wine and of oil... and the tithes of our ground* (Nehemiah 10:37) — is rendered because, as Leviticus declares, it was never theirs to keep: it is holy unto Yahuah.'),
    ('canon','nehemiah',10,35,'canon','deuteronomy',26,2,'free',
     E'*That thou shalt take of the first of all the fruit of the earth, which thou shalt bring of thy land that Yahuah Elohayka (the LORD thy God) giveth thee, and shalt put it in a basket, and shalt go unto the place which Yahuah Elohayka (the LORD thy God) shall choose to place his name there.* (Deuteronomy 26:2). The vow *to bring the firstfruits of our ground, and the firstfruits of all fruit of all trees, year by year, unto the house of Yahuah (LORD)* (Nehemiah 10:35) keeps the firstfruits law of Deuteronomy 26 — the first of the harvest brought to His house.'),
    ('canon','nehemiah',10,39,'canon','deuteronomy',12,6,'free',
     E'*And thither ye shall bring your burnt offerings, and your sacrifices, and your tithes, and heave offerings of your hand, and your vows, and your freewill offerings, and the firstlings of your herds and of your flocks* (Deuteronomy 12:6). The pledge *we will not forsake the house of our Elohim (God)* (Nehemiah 10:39) is the whole of Deuteronomy 12 kept — the offerings, the tithes, the firstlings, all brought to the place Yahuah chose, His worship wholeheartedly maintained.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- cross_reference_threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah',
       E'They entered into an oath to walk in the Torah — the covenant renewed',
       E'When the wall was finished and the law was read, *the rest of the people, the priests, the Levites... and all they that had separated themselves from the people of the lands unto the law of Elohim (God)* (Nehemiah 10:28) did not merely listen — *they clave to their brethren, their nobles, and entered into a curse, and into an oath, to walk in Elohim''s (God''s) law, which was given by Moses the servant of Elohim (God), and to observe and do all the commandments of Yahuah (LORD) our Lord, and his judgments and his statutes* (Nehemiah 10:29). This is the anti-antinomian covenant: the whole people binding themselves by oath to DO the Torah.\n\nIt is the oath of Sinai taken up again. There *all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3), and again over the book of the covenant: *All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7). It is the covenant Moses described in Moab, when the people were *to enter into covenant with Yahuah Elohayka (the LORD thy God), and into his oath* (Deuteronomy 29:12), *that he may establish thee to day for a people unto himself* (Deuteronomy 29:13). It is the answer the people gave Joshua at Shechem: *Yahuah Eloheinu (The LORD our God) will we serve, and his voice will we obey* (Joshua 24:24). It is the covenant Josiah made, standing by the pillar, *to walk after Yahuah (LORD), and to keep his commandments and his testimonies and his statutes with all their heart and all their soul* (2 Kings 23:3; 2 Chronicles 34:31).\n\nThe Torah is not abolished here; it is sworn. And the inward answer to this outward oath is the very promise Jeremiah spoke: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The new covenant is the SAME law written within — never the law replaced.',
       sv.verse_id, ev.verse_id, 'free', 32325
  FROM _s316_neh10_lookup sv, _s316_neh10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=10 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity',
       E'No marriage with the idol-nations — the heart kept whole, not the bloodline',
       E'The first sworn clause of the covenant is *that we would not give our daughters unto the people of the land, nor take their daughters for our sons* (Nehemiah 10:30). This takes up the Torah word: *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3).\n\nThe Torah itself names the reason, and it is not race — it is the heart. *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you* (Deuteronomy 7:4). The peril is the idolatry that captures the household and turns it to *serve other gods.* It is the very thing Joshua charged against: *put away... the strange gods which are among you, and incline your heart unto Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (Joshua 24:23). The remnant binds itself not against peoples but against the alliances that would draw the covenant heart away — fidelity to Yahuah, kept whole.',
       sv.verse_id, ev.verse_id, 'free', 32326
  FROM _s316_neh10_lookup sv, _s316_neh10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=10 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-10-the-sabbath-kept-and-the-seventh-year-released',
       E'The Sabbath kept and the seventh year released',
       E'The covenant binds the people to Yahuah''s calendar: *if the people of the land bring ware or any victuals on the sabbath day to sell, that we would not buy it of them on the sabbath, or on the holy day: and that we would leave the seventh year, and the exaction of every debt* (Nehemiah 10:31). Two Torah rests are sworn here — the weekly Sabbath and the land''s seventh year.\n\nThe weekly Sabbath is the fourth word: *Remember the sabbath day, to keep it holy* (Exodus 20:8), rooted in creation, *for in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). To refuse the traders'' wares is to live Isaiah''s vision: *if thou turn away thy foot from the sabbath... and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). This is the very law Nehemiah would later have to enforce when it slipped: *What evil thing is this that ye do, and profane the sabbath day?* (Nehemiah 13:17) — the Sabbath kept here, guarded there.\n\nThe second rest is the land''s: *in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD)* (Leviticus 25:4); *the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat* (Exodus 23:11). And with it the release of debts: *At the end of every seven years thou shalt make a release* (Deuteronomy 15:1) — *the exaction of every debt* remitted. The appointed rhythms of Yahuah, not abolished but taken up by the remnant as binding covenant.',
       sv.verse_id, ev.verse_id, 'free', 32327
  FROM _s316_neh10_lookup sv, _s316_neh10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=10 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-10-we-will-not-forsake-the-house-of-our-elohim',
       E'We will not forsake the house of our Elohim — the tithes and the firstfruits',
       E'The covenant ends where worship lives — the support of Yahuah''s house. The people charge themselves *with the third part of a shekel for the service of the house of our Elohim (God)* (Nehemiah 10:32), the restored form of the sanctuary offering: *an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13). They covenant *to bring the firstfruits of our ground, and the firstfruits of all fruit of all trees, year by year, unto the house of Yahuah (LORD)* (Nehemiah 10:35) — the firstfruits law of *the first of all the fruit of the earth... in a basket* (Deuteronomy 26:2).\n\nAnd they render the tithes: *the tithes of our ground unto the Levites* (Nehemiah 10:37), for Yahuah gave Levi *all the tenth in Yashar''el (Israel) for an inheritance* (Numbers 18:21); *the Levites shall bring up the tithe of the tithes* (Nehemiah 10:38), keeping the ordinance that the Levites *offer up an heave offering of it... even a tenth part of the tithe* (Numbers 18:26). The tithe was never theirs to withhold — *all the tithe of the land... is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30) — and the storehouse is to be filled, *that there may be meat in mine house* (Malachi 3:10).\n\nSo the covenant closes: *we will not forsake the house of our Elohim (God)* (Nehemiah 10:39) — the whole of the Torah''s worship, *your tithes... your vows... and the firstlings of your herds and of your flocks* (Deuteronomy 12:6), wholeheartedly maintained at the place Yahuah chose for His name.',
       sv.verse_id, ev.verse_id, 'free', 32328
  FROM _s316_neh10_lookup sv, _s316_neh10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=10 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- cross_reference_thread_members
-- ============================================================
-- THREAD 1: nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3) — the Sinai oath first spoken with one voice.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7) — the same book of the covenant, the same answer renewed.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Enter into covenant with Yahuah Elohayka... and into his oath* (Deuteronomy 29:12) — the Torah''s own word for entering the oath.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*That he may establish thee to day for a people unto himself* (Deuteronomy 29:13) — the covenant re-establishing the remnant as Yahuah''s own.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*his voice will we obey* (Joshua 24:24) — the gathered people at Shechem binding themselves to obey.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*to walk after Yahuah... and to keep his commandments and his testimonies and his statutes* (2 Kings 23:3) — Josiah''s covenant in the same Torah-words.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*to perform the words of the covenant which are written in this book* (2 Chronicles 34:31) — the seed-form of Nehemiah''s vow.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the same Torah internalized, the new covenant''s inward answer to the outward oath.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-people-entered-into-an-oath-to-walk-in-the-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — the Torah word the covenant takes up verbatim.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=30
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — the reason is the heart turned to idolatry, not race.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=30
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*put away... the strange gods... and incline your heart unto Yahuah* (Joshua 24:23) — the separation is fidelity, the heart kept whole.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=30
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-no-marriage-with-the-idol-nations-the-covenant-fidelity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: nehemiah-10-the-sabbath-kept-and-the-seventh-year-released
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Remember the sabbath day, to keep it holy* (Exodus 20:8) — the fourth word, guarded in the marketplace.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Yahuah blessed the sabbath day, and hallowed it* (Exodus 20:11) — the creation-rooted seventh day, His calendar kept.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*call the sabbath a delight, the holy of Yahuah* (Isaiah 58:13) — the prophet''s vision of the kept Sabbath, lived by the remnant.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*What evil thing is this that ye do, and profane the sabbath day?* (Nehemiah 13:17) — the law sworn here, enforced later when it slipped.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=13 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*in the seventh year shall be a sabbath of rest unto the land* (Leviticus 25:4) — the land''s sabbath, the seventh year left.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the seventh year thou shalt let it rest... that the poor of thy people may eat* (Exodus 23:11) — the sabbatical year honored.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*At the end of every seven years thou shalt make a release* (Deuteronomy 15:1) — the release of debts, *the exaction of every debt* remitted.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-the-sabbath-kept-and-the-seventh-year-released'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: nehemiah-10-we-will-not-forsake-the-house-of-our-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*an half shekel shall be the offering of Yahuah* (Exodus 30:13) — the sanctuary offering restored as the temple charge.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have given the children of Levi all the tenth in Yashar''el for an inheritance* (Numbers 18:21) — the tithe to the Levites for their service.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=37
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*ye shall offer up an heave offering of it... even a tenth part of the tithe* (Numbers 18:26) — the Levites'' tithe of the tithe kept precisely.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=38
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house* (Malachi 3:10) — the storehouse filled, the prophet''s call answered.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=37
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*all the tithe of the land... is the LORD''S: it is holy unto Yahuah* (Leviticus 27:30) — the tithe was never theirs to withhold.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=37
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*take of the first of all the fruit of the earth... in a basket* (Deuteronomy 26:2) — the firstfruits law kept, the first of the harvest to His house.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=35
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*thither ye shall bring your... tithes... and the firstlings of your herds and of your flocks* (Deuteronomy 12:6) — the whole worship maintained, the house not forsaken.'
  FROM cross_reference_threads t
  JOIN _s316_neh10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=10 AND sv.verse_number=39
  JOIN _s316_neh10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-10-we-will-not-forsake-the-house-of-our-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_11.sql (Nehemiah 11) -----
-- Book: Nehemiah   Chapter: 11   (those who dwelt in the holy city)
-- Tag: neh11   Session prefix: s316   Sort band: 32350+ (+1 per thread)
-- Source book_slug=nehemiah, chapter 11.  Tier: canon='free' / extras='extras'.
--
-- Nehemiah 11 coverage:
--   v.1-2  (rulers dwelt at Jerusalem; lots to bring one of ten to dwell in the holy city;
--           the people BLESSED all that WILLINGLY OFFERED THEMSELVES to dwell at Jerusalem)
--     NT:     2 Corinthians 8:5 (first gave their own selves), 2 Corinthians 8:12 (a willing mind accepted) — WEAVED
--     Extras: none warranted (no clean willing-offering witness adds beyond canon here)
--     Tanakh: Judges 5:9 (governors that offered themselves willingly), Psalm 110:3 (thy people shall be willing
--             in the day of thy power), 1 Chronicles 29:9 (offered willingly with perfect heart) — WEAVED
--   v.1, 18  ("Jerusalem the holy city" / "the Levites in the holy city")
--     NT:     Matthew 27:53 (went into the holy city), Revelation 21:2 (the holy city, new Jerusalem) — WEAVED
--     Extras: none warranted
--     Tanakh: Isaiah 48:2 (call themselves of the holy city), Isaiah 52:1 (O Jerusalem, the holy city),
--             Daniel 9:24 (thy holy city), Psalm 46:4 (the holy place of the tabernacles of the most High) — WEAVED
--   v.3-36  (the dwellers — Yahudah, Benjamin, priests, Levites, Nethinims, porters, singers
--           "over the business of the house of Elohim"; the ordered habitation, genealogical roster)
--     NT:     none warranted (roster of names/places)
--     Extras: none warranted
--     Tanakh: none warranted (parallel roster 1 Chronicles 9; not threaded — register chapter, 2 threads)
--
-- THREADS:
--   1. nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves   [free]
--      (Judg 5:9, Ps 110:3, 1 Chron 29:9 [Tanakh]; 2 Cor 8:5, 2 Cor 8:12 [NT])
--   2. nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem        [free]
--      (Isa 48:2, Isa 52:1, Ps 46:4, Dan 9:24 [Tanakh]; Matt 27:53, Rev 21:2 [NT])

-- ============================================================ TEMP VIEW
CREATE TEMP VIEW _s316_neh11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ CROSS_REFERENCES
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the willing-hearted who offered themselves to dwell in the holy city
    ('canon','nehemiah',11,2,'canon','judges',5,9,'free',
      E'*My heart is toward the governors of Yashar''el (Israel), that offered themselves willingly among the people. Bless ye Yahuah (LORD)* (Judges 5:9). Deborah''s song blesses the very thing Nehemiah''s people bless: *the people blessed all the men, that willingly offered themselves to dwell at Jerusalem* (Nehemiah 11:2). The free-hearted volunteer to the costly cause is honoured, and the blessing rises to Yahuah (LORD) who moved the heart.'),
    ('canon','nehemiah',11,2,'canon','psalms',110,3,'free',
      E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth* (Psalm 110:3). The Messianic psalm names the willing people of the King; Nehemiah 11 shows the pattern in the holy city — those who *willingly offered themselves to dwell at Jerusalem* (Nehemiah 11:2) are the willing people in miniature, devotion drawn out for the sake of the place where the Name dwells.'),
    ('canon','nehemiah',11,2,'canon','1-chronicles',29,9,'free',
      E'*Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD): and David the king also rejoiced with great joy* (1 Chronicles 29:9). David''s assembly gave willingly with a perfect heart for the house of Yahuah (LORD); Nehemiah''s assembly gives itself willingly for the holy city — and *the people blessed all the men, that willingly offered themselves* (Nehemiah 11:2). The willing, whole-hearted offering is the worship Yahuah (LORD) receives.'),
    ('canon','nehemiah',11,2,'canon','2-corinthians',8,5,'free',
      E'*And this they did, not as we hoped, but first gave their own selves to Yahuah (Lord), and unto us by the will of Elohim (God)* (2 Corinthians 8:5). Paul names the costly Macedonian giving as the gift of *their own selves* first — the same self-offering Nehemiah honours when *the people blessed all the men, that willingly offered themselves to dwell at Jerusalem* (Nehemiah 11:2). The willing devotion that gives the self, not merely a portion, is the offering blessed in both covenants.'),
    ('canon','nehemiah',11,2,'canon','2-corinthians',8,12,'free',
      E'*For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). The willing mind is what is accepted — the very disposition Nehemiah 11 celebrates in those who *willingly offered themselves to dwell at Jerusalem* (Nehemiah 11:2), the costly willingness to settle the holy but vulnerable city honoured and blessed.'),

    -- Thread 2: Jerusalem the holy city, pointing to the new Jerusalem
    ('canon','nehemiah',11,1,'canon','isaiah',48,2,'free',
      E'*For they call themselves of the holy city, and stay themselves upon the Elohim (God) of Yashar''el (Israel); Yahuah Tseva''ot (LORD of hosts) is his name* (Isaiah 48:2). Jerusalem is *the holy city* — the city sanctified for the Name — and Nehemiah''s lots bring one of ten *to dwell in Jerusalem the holy city* (Nehemiah 11:1). Its holiness is not its walls but the Elohim (God) of Yashar''el (Israel) who set his Name there.'),
    ('canon','nehemiah',11,1,'canon','isaiah',52,1,'free',
      E'*Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city: for henceforth there shall no more come into thee the uncircumcised and the unclean* (Isaiah 52:1). Isaiah names her exactly as Nehemiah does — *Jerusalem the holy city* (Nehemiah 11:1) — and the prophet looks past the resettled city to the day she is wholly sanctified, the earthly holy city straining toward its consummation.'),
    ('canon','nehemiah',11,1,'canon','psalms',46,4,'free',
      E'*There is a river, the streams whereof shall make glad the city of Elohim (God), the holy place of the tabernacles of the El Elyon (most High)* (Psalm 46:4). The city of Elohim (God) is the holy place of his tabernacles — the same sanctity that makes Nehemiah call her *Jerusalem the holy city* (Nehemiah 11:1), the dwelling of the Most High among his people.'),
    ('canon','nehemiah',11,1,'canon','daniel',9,24,'free',
      E'*Seventy weeks are determined upon thy people and upon thy holy city, to finish the transgression, and to make an end of sins, and to make reconciliation for iniquity, and to bring in everlasting righteousness, and to seal up the vision and prophecy, and to anoint the most Holy* (Daniel 9:24). Daniel''s prophecy fixes the redemptive timetable upon *thy holy city* — the same Jerusalem Nehemiah is resettling as *the holy city* (Nehemiah 11:1), the chosen city carrying the work of everlasting righteousness.'),
    ('canon','nehemiah',11,1,'canon','matthew',27,53,'free',
      E'*And came out of the graves after his resurrection, and went into the holy city, and appeared unto many* (Matthew 27:53). The Gospel still calls Jerusalem *the holy city* at the resurrection — the title Nehemiah uses in *Jerusalem the holy city* (Nehemiah 11:1) — the same chosen city where the firstfruits of the resurrection are made manifest.'),
    ('canon','nehemiah',11,1,'canon','revelation',21,2,'free',
      E'*And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The earthly holy city Nehemiah resettles — *Jerusalem the holy city* (Nehemiah 11:1) — points forward to *the holy city, new Jerusalem*, the consummation where the sanctified dwelling comes down from Elohim (God) to abide with his people forever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ THREADS
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves',
       E'The people blessed them that willingly offered themselves',
       E'Jerusalem is repopulated by a costly willingness. *The rest of the people also cast lots, to bring one of ten to dwell in Jerusalem the holy city* (Nehemiah 11:1) — the holy city was vulnerable, exposed, and to settle it meant risk — *and the people blessed all the men, that willingly offered themselves to dwell at Jerusalem* (Nehemiah 11:2). The blessing falls on the free-hearted volunteer.\n\nThis is the song of Deborah: *My heart is toward the governors of Yashar''el (Israel), that offered themselves willingly among the people. Bless ye Yahuah (LORD)* (Judges 5:9) — the willing ones blessed, and the blessing turned up to Yahuah (LORD). It is the Messianic people of the psalm: *Thy people shall be willing in the day of thy power, in the beauties of holiness* (Psalm 110:3). It is David''s great assembly: *Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9).\n\nThe New Testament names the same devotion as the offering Yahuah (Lord) receives. Of the Macedonians: *first gave their own selves to Yahuah (Lord), and unto us by the will of Elohim (God)* (2 Corinthians 8:5) — the gift is the self, not merely a portion. And the principle: *For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12). The willing heart that gives itself to the holy cause is honoured and blessed across the whole covenant.',
       sv.verse_id, ev.verse_id, 'free', 32350
  FROM _s316_neh11_lookup sv, _s316_neh11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=11 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem',
       E'Jerusalem the holy city points to the new Jerusalem',
       E'Twice in this chapter Jerusalem bears her title: *to dwell in Jerusalem the holy city* (Nehemiah 11:1), and *all the Levites in the holy city were two hundred fourscore and four* (Nehemiah 11:18). She is holy not by her stones but because Yahuah (LORD) set his Name there and sanctified her.\n\nThe prophets and the psalms know her by this name. *For they call themselves of the holy city, and stay themselves upon the Elohim (God) of Yashar''el (Israel); Yahuah Tseva''ot (LORD of hosts) is his name* (Isaiah 48:2). *Awake, awake; put on thy strength, O Zion; put on thy beautiful garments, O Jerusalem, the holy city* (Isaiah 52:1). *There is a river, the streams whereof shall make glad the city of Elohim (God), the holy place of the tabernacles of the El Elyon (most High)* (Psalm 46:4). And the redemptive clock is set upon her: *Seventy weeks are determined upon thy people and upon thy holy city... to bring in everlasting righteousness* (Daniel 9:24).\n\nThe Gospel still names her so at the resurrection — *and came out of the graves after his resurrection, and went into the holy city, and appeared unto many* (Matthew 27:53). And the whole canon strains toward her consummation: *And I John saw the holy city, new Jerusalem, coming down from Elohim (God) out of heaven, prepared as a bride adorned for her husband* (Revelation 21:2). The earthly holy city Nehemiah resettles is the seed of the everlasting one — the dwelling of Yahuah (LORD) with his people, made whole at the last.',
       sv.verse_id, ev.verse_id, 'free', 32351
  FROM _s316_neh11_lookup sv, _s316_neh11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ THREAD MEMBERS
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*My heart is toward the governors of Yashar''el (Israel), that offered themselves willingly among the people. Bless ye Yahuah (LORD)* (Judges 5:9) — Deborah blesses the willing volunteer, the same blessing Nehemiah''s people pronounce.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning* (Psalm 110:3) — the willing people of the Messianic King, in miniature at the holy city.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Then the people rejoiced, for that they offered willingly, because with perfect heart they offered willingly to Yahuah (LORD)* (1 Chronicles 29:9) — David''s assembly gives willingly with a perfect heart, the offering Yahuah (LORD) receives.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=29 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*first gave their own selves to Yahuah (Lord), and unto us by the will of Elohim (God)* (2 Corinthians 8:5) — the gift is the self, the same self-offering blessed at Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For if there be first a willing mind, it is accepted according to that a man hath, and not according to that he hath not* (2 Corinthians 8:12) — the willing mind is what is accepted, the disposition celebrated in Nehemiah 11.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-the-people-blessed-them-that-willingly-offered-themselves'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For they call themselves of the holy city, and stay themselves upon the Elohim (God) of Yashar''el (Israel)* (Isaiah 48:2) — Jerusalem the holy city, sanctified for the Name.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*put on thy beautiful garments, O Jerusalem, the holy city* (Isaiah 52:1) — the prophet names her exactly as Nehemiah does and looks to her full sanctification.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the holy place of the tabernacles of the El Elyon (most High)* (Psalm 46:4) — the city of Elohim (God) is the holy place of his dwelling.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Seventy weeks are determined upon thy people and upon thy holy city* (Daniel 9:24) — the redemptive timetable fixed upon the holy city Nehemiah resettles.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*and went into the holy city, and appeared unto many* (Matthew 27:53) — the Gospel still names her the holy city at the resurrection.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the holy city, new Jerusalem, coming down from Elohim (God) out of heaven* (Revelation 21:2) — the earthly holy city points to its everlasting consummation.'
  FROM cross_reference_threads t
  JOIN _s316_neh11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s316_neh11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-11-jerusalem-the-holy-city-points-to-the-new-jerusalem'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_12.sql (Nehemiah 12) -----
-- Book: Nehemiah  Chapter: 12  (the priests and Levites, and the joyful dedication of the wall)
-- Tag: neh12   Session prefix: s316   Temp view: _s316_neh12_lookup
-- Sort band start: 32375 (+1 per thread)
-- Source book_slug=nehemiah, edition=canon
--
-- Member INSERT form: STANDARD, EXPLICIT LITERAL source verse (sv.chapter_number=12 AND sv.verse_number=<v>).
-- NO compact (VALUES ...) AS m(...) member form anywhere.  tier BEFORE note in VALUES.
-- All three threads canon-only => tier_required 'free'; all target tiers 'free'.
--
-- Nehemiah 12 coverage:
--   v.1-26 the register of priests/Levites across generations, the singers, the courses; v.8 Mattaniah over the
--          thanksgiving; v.24 to praise and give thanks "according to the commandment of David the man of Elohim,
--          ward over against ward"; v.25 porters keeping the ward at the gates.
--        NT:     none warranted (genealogical register; the worship-ordinance weave is Tanakh-internal)
--        Extras: none warranted
--        Tanakh: 1 Chron 25:1-2 (David separated the singers to prophesy with harps/psalteries/cymbals); 2 Chron 29:25
--                (Hezekiah set the Levites with cymbals "according to the commandment of David"); Ezra 3:10 (foundation
--                laid, priests/Levites praise "after the ordinance of David") => THREAD 1
--   v.27-43 the DEDICATION OF THE WALL with gladness, thanksgivings, singing, cymbals, psalteries, harps; two great
--          companies giving thanks in procession upon the wall, meeting at the house of Elohim; v.43 "Elohim had made
--          them rejoice with great joy... the joy of Jerusalem was heard even afar off".
--        NT:     none warranted (corporate Jerusalem-thanksgiving is sung in the Psalms; no NT member quoted)
--        Extras: none warranted
--        Tanakh: Ps 100:4 (enter into his gates with thanksgiving); Ps 122:1 (I was glad... let us go into the house of
--                Yahuah); Ps 147:12 (Praise Yahuah, O Jerusalem); Ps 48:12 (walk about Zion... tell the towers thereof);
--                Ezra 3:11 (great shout when the foundation was laid); Ezra 3:13 (the noise was heard afar off) => THREAD 2
--   v.44-47 portions for priests/Levites appointed; Yahudah rejoiced for the priests and Levites that waited; v.45 the
--          wards kept "according to the commandment of David, and of Solomon his son"; v.46 David and Asaph of old, chief
--          of the singers, songs of praise; v.47 all Yashar'el gave the portions, sanctified holy things.
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Chron 16:4 (David appointed Levites to thank and praise Yahuah); 1 Chron 16:5-6 (Asaph the chief,
--                psalteries, harps, cymbals, trumpets) => THREAD 3 (the Davidic foundation of the ordered, maintained praise)
--
-- THREADS:
--   T1 nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim  [Tanakh] free  band 32375
--      anchor 12:24 -> 12:36 ; members 1chr25:1, 1chr25:2, 2chr29:25, ezra3:10
--   T2 nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off  [Tanakh] free  band 32376
--      anchor 12:27 -> 12:43 ; members ps100:4, ps122:1, ps147:12, ps48:12, ezra3:11, ezra3:13
--   T3 nehemiah-12-david-and-asaph-of-old-the-songs-of-praise-maintained          [Tanakh] free  band 32377
--      anchor 12:44 -> 12:47 ; members 1chr16:4, 1chr16:5

CREATE TEMP VIEW _s316_neh12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- cross_references
-- =====================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: praise according to the commandment of David the man of Elohim
    ('canon','nehemiah',12,24,'canon','1-chronicles',25,1,'free',
      E'*Moreover David and the captains of the host separated to the service of the sons of Asaph, and of Heman, and of Jeduthun, who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1). When the chief of the Levites are set *to praise and to give thanks, according to the commandment of David the man of Elohim (God), ward over against ward* (Nehemiah 12:24), they are taking up the very office David first ordained — the temple-song is not invented at the wall but received from the Davidic order.'),
    ('canon','nehemiah',12,24,'canon','1-chronicles',25,2,'free',
      E'*Of the sons of Asaph... the sons of Asaph under the hands of Asaph, which prophesied according to the order of the king* (1 Chronicles 25:2). The singers prophesy *according to the order of the king* — so the returned Levites praise *according to the commandment of David the man of Elohim* (Nehemiah 12:24): the same appointed worship, kept intact across the generations of exile and return.'),
    ('canon','nehemiah',12,24,'canon','2-chronicles',29,25,'free',
      E'*And he set the Levites in the house of Yahuah (LORD) with cymbals, with psalteries, and with harps, according to the commandment of David, and of Gad the king''s seer, and Nathan the prophet: for so was the commandment of Yahuah (LORD) by his prophets* (2 Chronicles 29:25). Hezekiah restores the worship by the same rule the returned exiles keep — *according to the commandment of David the man of Elohim* (Nehemiah 12:24) — and the Chronicler names it plainly *the commandment of Yahuah by his prophets*: David''s ordinance is Yahuah''s own command, not human custom.'),
    ('canon','nehemiah',12,36,'canon','ezra',3,10,'free',
      E'*And when the builders laid the foundation of the temple of Yahuah (LORD), they set the priests in their apparel with trumpets, and the Levites the sons of Asaph with cymbals, to praise Yahuah (LORD), after the ordinance of David king of Yashar''el (Israel)* (Ezra 3:10). At the foundation-laying the praise is *after the ordinance of David*; at the wall the procession goes *with the musical instruments of David the man of Elohim (God)* (Nehemiah 12:36) — the same Davidic instruments, the same ordinance, sounding again over the restored city.'),
    -- THREAD 2: the dedication of the wall, the joy of Jerusalem heard afar off
    ('canon','nehemiah',12,27,'canon','psalms',100,4,'free',
      E'*Enter into his gates with thanksgiving, and into his courts with praise: be thankful unto him, and bless his name* (Psalm 100:4). The Levites are sought out *to keep the dedication with gladness, both with thanksgivings, and with singing, with cymbals, psalteries, and with harps* (Nehemiah 12:27) — the dedication of the wall is the Psalm enacted: the gathered people entering the gates with the very thanksgiving the song commands.'),
    ('canon','nehemiah',12,43,'canon','psalms',122,1,'free',
      E'*I was glad when they said unto me, Let us go into the house of Yahuah (LORD)* (Psalm 122:1). The gladness of the pilgrim song is the gladness of the dedication: *Elohim (God) had made them rejoice with great joy: the wives also and the children rejoiced* (Nehemiah 12:43) — the whole household glad to go up to the house of Yahuah, the city of the tribes restored.'),
    ('canon','nehemiah',12,43,'canon','psalms',147,12,'free',
      E'*Praise Yahuah (LORD), O Jerusalem; praise thy Elohim (God), O Zion* (Psalm 147:12). The Psalm that sings *Yahuah (LORD) doth build up Jerusalem: he gathereth together the outcasts of Yashar''el (Israel)* (147:2) is answered at the wall: when *the joy of Jerusalem was heard even afar off* (Nehemiah 12:43), the rebuilt and regathered city is doing exactly what the Psalm calls her to do — praising her Elohim from her own strengthened gates.'),
    ('canon','nehemiah',12,31,'canon','psalms',48,12,'free',
      E'*Walk about Zion, and go round about her: tell the towers thereof. Mark ye well her bulwarks, consider her palaces; that ye may tell it to the generation following* (Psalm 48:12-13). Nehemiah''s *two great companies of them that gave thanks* (Nehemiah 12:31) walking the wall in opposite directions are the Psalm in motion — they walk about Zion and number her towers, the thanksgiving procession that tells her glory to the generation following.'),
    ('canon','nehemiah',12,43,'canon','ezra',3,11,'free',
      E'*And they sang together by course in praising and giving thanks unto Yahuah (LORD)... And all the people shouted with a great shout, when they praised Yahuah (LORD), because the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11). The great shout at the foundation and the great joy at the wall are one and the same restoration-gladness: *Elohim (God) had made them rejoice with great joy* (Nehemiah 12:43) — the people of the return rejoicing as the house and the city rise again.'),
    ('canon','nehemiah',12,43,'canon','ezra',3,13,'free',
      E'*So that the people could not discern the noise of the shout of joy from the noise of the weeping of the people: for the people shouted with a loud shout, and the noise was heard afar off* (Ezra 3:13). The same phrase seals both scenes: at the foundation *the noise was heard afar off*, and at the dedication *the joy of Jerusalem was heard even afar off* (Nehemiah 12:43) — the exuberant corporate thanksgiving of the regathered people carrying out beyond the walls.'),
    -- THREAD 3: David and Asaph of old, the songs of praise maintained
    ('canon','nehemiah',12,46,'canon','1-chronicles',16,4,'free',
      E'*And he appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4). The note that *in the days of David and Asaph of old there were chief of the singers, and songs of praise and thanksgiving unto Elohim (God)* (Nehemiah 12:46) reaches straight back to this appointing — the ministry of thanksgiving Nehemiah maintains was instituted by David before the ark.'),
    ('canon','nehemiah',12,46,'canon','1-chronicles',16,5,'free',
      E'*Asaph the chief, and next to him Zechariah, Jeiel, and Shemiramoth... and Jeiel with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5). Nehemiah names *David and Asaph of old* (Nehemiah 12:46) as the fountainhead of the singers; here Asaph is set as the chief with the psalteries, harps, and cymbals — the very ordinance the returned community keeps and funds, so that *both the singers and the porters kept the ward of their Elohim (God)... according to the commandment of David, and of Solomon his son* (12:45).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim',
       E'Praise According to the Commandment of David the Man of Elohim',
       E'When the returned exiles set the Levites *to praise and to give thanks, according to the commandment of David the man of Elohim (God), ward over against ward* (Nehemiah 12:24), and lead the procession *with the musical instruments of David the man of Elohim (God)* (Nehemiah 12:36), they are not improvising worship — they are taking up an ordinance laid down centuries before. David *separated to the service of the sons of Asaph, and of Heman, and of Jeduthun, who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1), the singers prophesying *according to the order of the king* (25:2). Hezekiah, generations later, *set the Levites in the house of Yahuah (LORD) with cymbals, with psalteries, and with harps, according to the commandment of David... for so was the commandment of Yahuah (LORD) by his prophets* (2 Chronicles 29:25) — the Chronicler naming David''s ordinance as Yahuah''s own command. And when the foundation was laid the priests and Levites praised *after the ordinance of David king of Yashar''el (Israel)* (Ezra 3:10). One appointed worship runs unbroken from David through Hezekiah to the wall — the covenant order kept intact across exile and return.',
       sv.verse_id, ev.verse_id, 'free', 32375
  FROM _s316_neh12_lookup sv, _s316_neh12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=12 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off',
       E'The Dedication of the Wall — the Joy of Jerusalem Heard Afar Off',
       E'At the dedication the Levites are sought out *to keep the dedication with gladness, both with thanksgivings, and with singing, with cymbals, psalteries, and with harps* (Nehemiah 12:27), and Nehemiah appoints *two great companies of them that gave thanks* (12:31) to go in procession upon the wall in opposite directions, meeting at the house of Elohim. The climax: *they offered great sacrifices, and rejoiced: for Elohim (God) had made them rejoice with great joy: the wives also and the children rejoiced: so that the joy of Jerusalem was heard even afar off* (Nehemiah 12:43). This is the Psalter enacted. *Enter into his gates with thanksgiving, and into his courts with praise* (Psalm 100:4) — exactly what the dedication does. *I was glad when they said unto me, Let us go into the house of Yahuah (LORD)* (Psalm 122:1) — the household gladness of 12:43. *Praise Yahuah (LORD), O Jerusalem; praise thy Elohim (God), O Zion* (Psalm 147:12), the city that *gathereth together the outcasts of Yashar''el (Israel)* (147:2). And the two companies *walk about Zion, and go round about her: tell the towers thereof* (Psalm 48:12), telling her glory to the generation following. The same wording sealed the foundation-laying: *all the people shouted with a great shout... because the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11), so that *the noise was heard afar off* (Ezra 3:13). The regathered people of the return rejoice, and their joy carries out beyond the walls.',
       sv.verse_id, ev.verse_id, 'free', 32376
  FROM _s316_neh12_lookup sv, _s316_neh12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=12 AND ev.verse_number=43
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-12-david-and-asaph-of-old-the-songs-of-praise-maintained',
       E'David and Asaph of Old — the Songs of Praise Maintained',
       E'The chapter closes with the ordered, joyful upkeep of the ministry: *Yahudah (Judah) rejoiced for the priests and for the Levites that waited* (Nehemiah 12:44), and *both the singers and the porters kept the ward of their Elohim (God)... according to the commandment of David, and of Solomon his son* (12:45). The reason is named: *For in the days of David and Asaph of old there were chief of the singers, and songs of praise and thanksgiving unto Elohim (God)* (Nehemiah 12:46), and *all Yashar''el (Israel)... gave the portions of the singers and the porters, every day his portion* (12:47). That fountainhead is here: David *appointed certain of the Levites to minister before the ark of Yahuah (LORD), and to record, and to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4), with *Asaph the chief... with psalteries and with harps; but Asaph made a sound with cymbals* (16:5). The worship Nehemiah funds and guards is the same ministry David instituted before the ark — the songs of praise of old maintained, day by day, by all Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 32377
  FROM _s316_neh12_lookup sv, _s316_neh12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=44
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=12 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- thread_members
-- =====================================================================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1) — David first separated the singers to their service; Nehemiah 12:24 keeps that very ordinance.'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=25 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*which prophesied according to the order of the king* (1 Chronicles 25:2) — the singers serve by royal ordinance, just as the returned Levites praise *according to the commandment of David* (Nehemiah 12:24).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=25 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*according to the commandment of David... for so was the commandment of Yahuah (LORD) by his prophets* (2 Chronicles 29:25) — Hezekiah keeps the same rule, and the Chronicler names David''s ordinance as Yahuah''s own command.'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=24
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=29 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*to praise Yahuah (LORD), after the ordinance of David king of Yashar''el (Israel)* (Ezra 3:10) — the same Davidic instruments and ordinance that lead the wall-procession *with the musical instruments of David* (Nehemiah 12:36).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=36
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-praise-according-to-the-commandment-of-david-the-man-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Enter into his gates with thanksgiving, and into his courts with praise* (Psalm 100:4) — the very thanksgiving the dedication enacts at the gates of the rebuilt city (Nehemiah 12:27).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=27
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=100 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I was glad when they said unto me, Let us go into the house of Yahuah (LORD)* (Psalm 122:1) — the household gladness of *the wives also and the children rejoiced* (Nehemiah 12:43).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=43
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=122 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Praise Yahuah (LORD), O Jerusalem; praise thy Elohim (God), O Zion* (Psalm 147:12) — the regathered city doing what the Psalm commands, her joy *heard even afar off* (Nehemiah 12:43).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=43
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Walk about Zion, and go round about her: tell the towers thereof* (Psalm 48:12) — the *two great companies of them that gave thanks* (Nehemiah 12:31) are this Psalm in motion upon the wall.'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=31
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=48 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*all the people shouted with a great shout, when they praised Yahuah (LORD), because the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11) — the same restoration-gladness as the great joy of the dedication (Nehemiah 12:43).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=43
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the people shouted with a loud shout, and the noise was heard afar off* (Ezra 3:13) — the same sealing phrase: at the wall *the joy of Jerusalem was heard even afar off* (Nehemiah 12:43).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=43
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-the-dedication-of-the-wall-the-joy-of-jerusalem-heard-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he appointed certain of the Levites to minister before the ark of Yahuah (LORD)... to thank and praise Yahuah Elohim (the LORD God) of Yashar''el (Israel)* (1 Chronicles 16:4) — the David-and-Asaph fountainhead Nehemiah names (Nehemiah 12:46).'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-david-and-asaph-of-old-the-songs-of-praise-maintained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Asaph the chief... with psalteries and with harps; but Asaph made a sound with cymbals* (1 Chronicles 16:5) — the very ministry of *David and Asaph of old* (Nehemiah 12:46) that the returned community keeps and funds day by day.'
  FROM cross_reference_threads t
  JOIN _s316_neh12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s316_neh12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=16 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-12-david-and-asaph-of-old-the-songs-of-praise-maintained'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_nehemiah_13.sql (Nehemiah 13) -----
-- Book: Nehemiah  chapter 13  (closing chapter — Nehemiah's later reforms: zeal for the covenant)
-- Tag: neh13   session prefix: s316   temp view: _s316_neh13_lookup
-- Sort band: 32400 (+1 per thread)  Source: canon nehemiah ch13
--
-- Nehemiah 13 coverage:
--   v.1-3   (Torah read; Ammonite/Moabite barred; Balaam's hire turned to blessing; separate the mixed multitude)
--           NT:     none warranted (the lateral Torah quote is the weave)
--           Extras: none warranted
--           Tanakh: Deuteronomy 23:3-5 (the very law read aloud), Numbers 24:10 (Balaam blessed not cursed)  -> THREAD 1
--   v.4-9   (Tobiah's stuff cast out of the chamber; chambers cleansed)
--           NT:     John 2:14-16 (Messiah cleanses the temple, drives out the sellers)  -> THREAD 2
--           Extras: none warranted
--           Tanakh: Malachi 3:1-3 (the messenger comes suddenly to his temple, purifies the sons of Levi)  -> THREAD 2
--   v.10-14 (Levites' portions not given; tithes restored; faithful treasurers; "Remember me... wipe not out my good deeds")
--           NT:     1 Corinthians 9:13-14 (they that minister live of the temple)  -> THREAD 3
--           Extras: none warranted
--           Tanakh: Numbers 18:21 (the tenth given the Levites), Malachi 3:8,10 (robbed Elohim in tithes; bring all the tithes), 2 Chronicles 31:4 (Hezekiah's portion for priests/Levites)  -> THREAD 3
--   v.15-22 (THE SABBATH ENFORCED — winepresses/selling on the sabbath; gates shut; merchants warned; Levites sanctify it; "Remember me... according to thy mercy")  ★★ KEYSTONE
--           NT:     none warranted (the Sabbath weave is Torah+prophets)
--           Extras: none warranted
--           Tanakh: Exodus 20:8-11 (remember the sabbath), Jeremiah 17:21-22,27 (bear no burden, the gates), Isaiah 58:13-14 (the sabbath a delight), Ezekiel 20:12 (the sabbath a sign), Nehemiah 10:31 (the covenant they had sworn)  -> THREAD 4
--   v.23-31 (mixed marriages; children cannot speak the Yahudim language; Solomon turned by outlandish women; "cleansed I them from all strangers"; "Remember me... for good")
--           NT:     none warranted
--           Extras: none warranted
--           Tanakh: Deuteronomy 7:3-4 (make no marriages — they turn the heart to other gods), 1 Kings 11:1-4 (Solomon's strange wives turned his heart), Ezra 9:12 (give not your daughters), Psalm 106:4 ("Remember me, O Yahuah... with the favour... unto thy people")  -> THREAD 5
--
-- Threads (all members canon -> tier 'free'):
--   nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude (Tanakh)            band 32400
--   nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim (Tanakh + NT)              band 32401
--   nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld (Tanakh + NT)           band 32402
--   nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden ★★ (Tanakh)                 band 32403
--   nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart (Tanakh)      band 32404
--
-- Framing notes:
--   ★★ 13:15-22 = the zealous keeping of the Sabbath holy (Exod 20, Jer 17, Isa 58, Ezek 20 the sign) — the
--      Sabbath kept, the gates shut against trade, NEVER abolished; the framework's appointed-times affirmation.
--   13:10-14 = the support of the ministry restored (Num 18, Mal 3, 1 Cor 9) — the Levites' portion is Torah-given.
--   13:23-27 framed per the covenant-fidelity guard: the danger is the FOREIGN GODS / lost covenant identity
--      (Deut 7:4, Solomon turned by outlandish women, the children losing the tongue) — NOT race, victims-not-enemies.
--   The recurring "Remember me, O my Elohim, for good" = the servant's appeal to the One who remembers (Ps 106:4).

CREATE TEMP VIEW _s316_neh13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: they read in the book of Moses and separated the mixed multitude (13:1-3)
    ('canon','nehemiah',13,1,'canon','deuteronomy',23,3,'free',
     E'*An Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD); even to their tenth generation shall they not enter into the congregation of Yahuah (LORD) for ever* (Deuteronomy 23:3). This is the very statute they found when *they read in the book of Moses in the audience of the people* (Nehemiah 13:1): the Word read aloud surfaces the buried command, and the people move to obey it.'),
    ('canon','nehemiah',13,2,'canon','deuteronomy',23,4,'free',
     E'*Because they met you not with bread and with water in the way, when ye came forth out of Egypt; and because they hired against thee Balaam the son of Beor of Pethor of Mesopotamia, to curse thee* (Deuteronomy 23:4). Nehemiah''s scribe quotes the Torah''s own reason almost verbatim: *Because they met not the children of Yashar''el (Israel) with bread and with water, but hired Balaam against them, that he should curse them* (Nehemiah 13:2).'),
    ('canon','nehemiah',13,2,'canon','deuteronomy',23,5,'free',
     E'*Nevertheless Yahuah Elohayka (the LORD thy God) would not hearken unto Balaam; but Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee* (Deuteronomy 23:5). This is the line Nehemiah echoes — *howbeit our Elohim (God) turned the curse into a blessing* (Nehemiah 13:2): the hire of cursing fails because Yahuah loves his covenant people.'),
    ('canon','nehemiah',13,2,'canon','numbers',24,10,'free',
     E'*And Balak''s anger was kindled against Balaam, and he smote his hands together: and Balak said unto Balaam, I called thee to curse mine enemies, and, behold, thou hast altogether blessed them these three times* (Numbers 24:10). The event behind Nehemiah''s summary: the hireling prophet, paid to curse, could only bless — *our Elohim (God) turned the curse into a blessing* (Nehemiah 13:2).'),

    -- THREAD 2: Nehemiah cast out Tobiah and cleansed the house of Elohim (13:4-9)
    ('canon','nehemiah',13,8,'canon','john',2,15,'free',
     E'*And when he had made a scourge of small cords, he drove them all out of the temple, and the sheep, and the oxen; and poured out the changers'' money, and overthrew the tables* (John 2:15). Nehemiah''s zeal foreshadows the Messiah''s: *it grieved me sore: therefore I cast forth all the household stuff of Tobiah out of the chamber* (Nehemiah 13:8). The servant clears the intruder''s goods from the holy place; the Formed Son clears the traders from his Father''s house.'),
    ('canon','nehemiah',13,7,'canon','john',2,16,'free',
     E'*And said unto them that sold doves, Take these things hence; make not my Father''s house an house of merchandise* (John 2:16). Nehemiah *understood of the evil that Eliashib did for Tobiah, in preparing him a chamber in the courts of the house of Elohim (God)* (Nehemiah 13:7) — the same offence the Messiah judges: the house of Elohim turned to private and commercial use.'),
    ('canon','nehemiah',13,9,'canon','malachi',3,1,'free',
     E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant... saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 3:1). Nehemiah comes suddenly back to the temple and cleanses it — *they cleansed the chambers: and thither brought I again the vessels of the house of Elohim (God)* (Nehemiah 13:9) — a shadow of the Lord who suddenly comes to his temple to purify it.'),
    ('canon','nehemiah',13,9,'canon','malachi',3,3,'free',
     E'*And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The cleansing of the chambers and the restoring of the vessels (Nehemiah 13:9) is the same work the messenger of the covenant brings to completion: a purified priesthood serving in a purified house.'),

    -- THREAD 3: the tithes restored and the ministry of the Levites upheld (13:10-14)
    ('canon','nehemiah',13,10,'canon','numbers',18,21,'free',
     E'*And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation* (Numbers 18:21). The tithe was never optional charity but the Torah-given inheritance of the ministering tribe — so when *the portions of the Levites had not been given them: for the Levites and the singers, that did the work, were fled every one to his field* (Nehemiah 13:10), the house of Elohim itself was being forsaken.'),
    ('canon','nehemiah',13,12,'canon','malachi',3,10,'free',
     E'*Bring ye all the tithes into the storehouse, that there may be meat in mine house... saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing* (Malachi 3:10). This is exactly the reform Nehemiah enacts: *then brought all Yahudah (Judah) the tithe of the corn and the new wine and the oil unto the treasuries* (Nehemiah 13:12) — the storehouse filled, the ministry sustained.'),
    ('canon','nehemiah',13,11,'canon','malachi',3,8,'free',
     E'*Will a man rob Elohim (God)? Yet ye have robbed me. But ye say, Wherein have we robbed thee? In tithes and offerings* (Malachi 3:8). Withholding the Levites'' portion is robbing Elohim and forsaking his house — *Why is the house of Elohim (God) forsaken?* (Nehemiah 13:11) is Nehemiah''s contention against the very sin Malachi names.'),
    ('canon','nehemiah',13,10,'canon','1-corinthians',9,13,'free',
     E'*Do ye not know that they which minister about holy things live of the things of the temple? and they which wait at the altar are partakers with the altar?* (1 Corinthians 9:13). Paul reaches back to this Torah order: those who do the work of the house are to be sustained by it — the failure Nehemiah corrects when the singers and Levites *that did the work, were fled every one to his field* (Nehemiah 13:10).'),
    ('canon','nehemiah',13,13,'canon','1-corinthians',9,14,'free',
     E'*Even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14). Nehemiah''s appointment of faithful treasurers *to distribute unto their brethren* (Nehemiah 13:13) embodies the same ordinance — the support of the ministry is a divine arrangement, not a human afterthought.'),
    ('canon','nehemiah',13,12,'canon','2-chronicles',31,4,'free',
     E'*Moreover he commanded the people that dwelt in Jerusalem to give the portion of the priests and the Levites, that they might be encouraged in the law of Yahuah (LORD)* (2 Chronicles 31:4). Hezekiah''s reform is the pattern Nehemiah repeats: the king (or governor) commands the people to restore the priests'' portion so the ministers can give themselves to the Torah — *then brought all Yahudah (Judah) the tithe* (Nehemiah 13:12).'),

    -- THREAD 4: ★★ THE SABBATH ENFORCED — the gates shut against the burden (13:15-22)
    ('canon','nehemiah',13,15,'canon','exodus',20,8,'free',
     E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The fourth word is the ground of Nehemiah''s whole campaign: when he *saw I in Yahudah (Judah) some treading wine presses on the sabbath... which they brought into Jerusalem on the sabbath day* (Nehemiah 13:15), he saw the holy day being profaned, and rose to keep it holy.'),
    ('canon','nehemiah',13,18,'canon','exodus',20,11,'free',
     E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The Sabbath is creation-rooted and Yahuah-hallowed; to profane it is to *bring more wrath upon Yashar''el (Israel)* (Nehemiah 13:18). The day is not abolished — it is enforced.'),
    ('canon','nehemiah',13,19,'canon','jeremiah',17,21,'free',
     E'*Thus saith Yahuah (LORD); Take heed to yourselves, and bear no burden on the sabbath day, nor bring it in by the gates of Jerusalem* (Jeremiah 17:21). Nehemiah does precisely what the prophet commanded — *I commanded that the gates should be shut... that there should no burden be brought in on the sabbath day* (Nehemiah 13:19). The gates of Jerusalem shut against the burden is the literal fulfilling of Jeremiah''s charge.'),
    ('canon','nehemiah',13,19,'canon','jeremiah',17,22,'free',
     E'*Neither carry forth a burden out of your houses on the sabbath day, neither do ye any work, but hallow ye the sabbath day, as I commanded your fathers* (Jeremiah 17:22). To hallow the sabbath is to bar the burden; Nehemiah''s shut gates and posted servants (Nehemiah 13:19) are the obedience Jeremiah called for, *as I commanded your fathers.*'),
    ('canon','nehemiah',13,18,'canon','jeremiah',17,27,'free',
     E'*But if ye will not hearken unto me to hallow the sabbath day... then will I kindle a fire in the gates thereof, and it shall devour the palaces of Jerusalem, and it shall not be quenched* (Jeremiah 17:27). This is the wrath Nehemiah warns of — *did not our Elohim (God) bring all this evil upon us, and upon this city? yet ye bring more wrath upon Yashar''el (Israel) by profaning the sabbath* (Nehemiah 13:18): Sabbath-breaking is named as a cause of the exile-judgment.'),
    ('canon','nehemiah',13,22,'canon','isaiah',58,13,'free',
     E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable... not finding thine own pleasure, nor speaking thine own words* (Isaiah 58:13). Nehemiah commands the Levites *to sanctify the sabbath day* (Nehemiah 13:22) — the very turning-away-the-foot from trade and self-pleasure that Isaiah makes the mark of true Sabbath-keeping.'),
    ('canon','nehemiah',13,22,'canon','isaiah',58,14,'free',
     E'*Then shalt thou delight thyself in Yahuah (LORD); and I will cause thee to ride upon the high places of the earth, and feed thee with the heritage of Jacob thy father: for the mouth of Yahuah (LORD) hath spoken it* (Isaiah 58:14). The Sabbath kept holy is the gate to blessing — fitting that Nehemiah''s Sabbath reform closes with *Remember me, O my Elohim (God)... spare me according to the greatness of thy mercy* (Nehemiah 13:22).'),
    ('canon','nehemiah',13,22,'canon','ezekiel',20,12,'free',
     E'*Moreover also I gave them my sabbaths, to be a sign between me and them, that they might know that I am Yahuah (LORD) that sanctify them* (Ezekiel 20:12). The Sabbath is the sign of the covenant identity; to *sanctify the sabbath day* (Nehemiah 13:22) is to keep the sign that marks out the people Yahuah sanctifies.'),
    ('canon','nehemiah',13,15,'canon','nehemiah',10,31,'free',
     E'*And if the people of the land bring ware or any victuals on the sabbath day to sell, that we would not buy it of them on the sabbath, or on the holy day...* (Nehemiah 10:31). This is the sworn covenant the people had signed earlier in the very same book; Nehemiah''s later reform enforces the oath they had taken when he found *men of Tyre... which brought fish... and sold on the sabbath* (Nehemiah 13:16, cf. 13:15).'),

    -- THREAD 5: cleansed from all strangers, lest the outlandish women turn the heart (13:23-31)
    ('canon','nehemiah',13,25,'canon','deuteronomy',7,3,'free',
     E'*Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). Nehemiah binds the people by the very words of the Torah — *Ye shall not give your daughters unto their sons, nor take their daughters unto your sons* (Nehemiah 13:25). The command is quoted because the issue is covenant fidelity, not bloodline.'),
    ('canon','nehemiah',13,26,'canon','deuteronomy',7,4,'free',
     E'*For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly* (Deuteronomy 7:4). The Torah names the real danger — the foreign gods, not the foreign blood — which is exactly Nehemiah''s argument: *even him did outlandish women cause to sin* (Nehemiah 13:26).'),
    ('canon','nehemiah',13,26,'canon','1-kings',11,4,'free',
     E'*For it came to pass, when Solomon was old, that his wives turned away his heart after other gods: and his heart was not perfect with Yahuah Elohav (the LORD his God), as was the heart of David his father* (1 Kings 11:4). This is the case Nehemiah cites as the warning of warnings — *Did not Solomon king of Yashar''el (Israel) sin by these things?... even him did outlandish women cause to sin* (Nehemiah 13:26): the wisest king lost his heart to the strange wives'' gods.'),
    ('canon','nehemiah',13,26,'canon','1-kings',11,1,'free',
     E'*But king Solomon loved many strange women, together with the daughter of Pharaoh, women of the Moabites, Ammonites, Edomites, Zidonians, and Hittites* (1 Kings 11:1). The same nations Nehemiah names — *wives of Ashdod, of Ammon, and of Moab* (Nehemiah 13:23) — are the ones who turned Solomon; the peril is the gods carried in, the covenant identity lost.'),
    ('canon','nehemiah',13,25,'canon','ezra',9,12,'free',
     E'*Now therefore give not your daughters unto their sons, neither take their daughters unto your sons, nor seek their peace or their wealth for ever: that ye may be strong, and eat the good of the land, and leave it for an inheritance to your children for ever* (Ezra 9:12). Ezra had faced the same crisis a generation earlier; Nehemiah''s oath (Nehemiah 13:25) renews Ezra''s charge — the holy seed kept distinct so the covenant inheritance is not lost.'),
    ('canon','nehemiah',13,31,'canon','psalms',106,4,'free',
     E'*Remember me, O Yahuah (LORD), with the favour that thou bearest unto thy people: O visit me with thy salvation* (Psalm 106:4). Nehemiah''s closing prayer — *Remember me, O my Elohim (God), for good* (Nehemiah 13:31) — is the servant''s appeal to the One who remembers his people; the same cry the psalmist prays, that Yahuah would remember him with the favour shown to his covenant people.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s316_neh13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s316_neh13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude',
       E'They Read in the Book of Moses and Separated the Mixed Multitude',
       E'The chapter opens with the Word read aloud bearing fruit in obedience: *On that day they read in the book of Moses in the audience of the people; and therein was found written, that the Ammonite and the Moabite should not come into the congregation of Elohim (God) for ever* (Nehemiah 13:1). The statute they find is Torah verbatim: *An Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD)... for ever: because they met you not with bread and with water in the way... and because they hired against thee Balaam... to curse thee* (Deuteronomy 23:3-4). Nehemiah''s scribe even keeps the Torah''s reason — *because they met not the children of Yashar''el (Israel) with bread and with water, but hired Balaam against them, that he should curse them: howbeit our Elohim (God) turned the curse into a blessing* (Nehemiah 13:2). That last line reaches back to *Yahuah Elohayka (the LORD thy God) turned the curse into a blessing unto thee, because Yahuah Elohayka (the LORD thy God) loved thee* (Deuteronomy 23:5), and behind it the scene itself: *I called thee to curse mine enemies, and, behold, thou hast altogether blessed them these three times* (Numbers 24:10). The hire of cursing fails because Yahuah loves his covenant people. And the reading does its work: *when they had heard the law, that they separated from Yashar''el (Israel) all the mixed multitude* (Nehemiah 13:3) — the Word read leading straight to obedience.',
       sv.verse_id, ev.verse_id, 'free', 32400
  FROM _s316_neh13_lookup sv, _s316_neh13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=13 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim',
       E'Nehemiah Cast Out Tobiah and Cleansed the House of Elohim',
       E'Returning to Jerusalem, Nehemiah finds the temple compromised: the priest Eliashib, *having the oversight of the chamber of the house of our Elohim (God), was allied unto Tobiah* (Nehemiah 13:4), and had given that enemy *a great chamber, where aforetime they laid the meat offerings, the frankincense, and the vessels, and the tithes* (Nehemiah 13:5). Nehemiah understands *the evil that Eliashib did for Tobiah, in preparing him a chamber in the courts of the house of Elohim (God)* (Nehemiah 13:7), and acts with holy zeal: *it grieved me sore: therefore I cast forth all the household stuff of Tobiah out of the chamber* (Nehemiah 13:8); *they cleansed the chambers: and thither brought I again the vessels of the house of Elohim (God)* (Nehemiah 13:9). The intruder''s goods cast out, the holy place restored — a shadow of the Formed Son who would one day come suddenly to his Father''s house: *And when he had made a scourge of small cords, he drove them all out of the temple, and the sheep, and the oxen; and poured out the changers'' money, and overthrew the tables* (John 2:15), *make not my Father''s house an house of merchandise* (John 2:16). It is the work Malachi foretold of the messenger of the covenant: *Yahuah (Lord), whom ye seek, shall suddenly come to his temple* (Malachi 3:1), to *sit as a refiner and purifier of silver: and he shall purify the sons of Levi... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). Nehemiah''s broom is a small picture of that great cleansing.',
       sv.verse_id, ev.verse_id, 'free', 32401
  FROM _s316_neh13_lookup sv, _s316_neh13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld',
       E'The Tithes Restored and the Ministry of the Levites Upheld',
       E'With the temple cleansed, Nehemiah finds the ministry starving: *the portions of the Levites had not been given them: for the Levites and the singers, that did the work, were fled every one to his field* (Nehemiah 13:10). The tithe is no charity but the Torah-given inheritance of the ministering tribe: *I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle* (Numbers 18:21). To withhold it is to forsake the house of Elohim and to rob him — *Why is the house of Elohim (God) forsaken?* (Nehemiah 13:11) answers to Malachi''s charge, *Will a man rob Elohim (God)?... In tithes and offerings* (Malachi 3:8). So Nehemiah restores the order Malachi commands — *Bring ye all the tithes into the storehouse, that there may be meat in mine house... and pour you out a blessing* (Malachi 3:10): *then brought all Yahudah (Judah) the tithe of the corn and the new wine and the oil unto the treasuries* (Nehemiah 13:12), and he sets *treasurers over the treasuries... for they were counted faithful, and their office was to distribute unto their brethren* (Nehemiah 13:13). It is the same pattern as Hezekiah''s reform — *he commanded the people... to give the portion of the priests and the Levites, that they might be encouraged in the law of Yahuah (LORD)* (2 Chronicles 31:4) — and the same ordinance Paul carries forward: *they which minister about holy things live of the things of the temple* (1 Corinthians 9:13), *even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* (1 Corinthians 9:14). The support of the ministry is divine arrangement. Nehemiah seals it with prayer: *Remember me, O my Elohim (God), concerning this, and wipe not out my good deeds that I have done for the house of my Elohim (God)* (Nehemiah 13:14).',
       sv.verse_id, ev.verse_id, 'free', 32402
  FROM _s316_neh13_lookup sv, _s316_neh13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden',
       E'The Sabbath Enforced — the Gates Shut Against the Burden',
       E'The heart of Nehemiah''s closing zeal is the Sabbath. He *saw I in Yahudah (Judah) some treading wine presses on the sabbath, and bringing in sheaves, and lading asses... and all manner of burdens, which they brought into Jerusalem on the sabbath day: and I testified against them* (Nehemiah 13:15), while *men of Tyre... brought fish, and all manner of ware, and sold on the sabbath* (Nehemiah 13:16). The ground of his rebuke is the fourth word: *Remember the sabbath day, to keep it holy* (Exodus 20:8), for *in six days Yahuah (LORD) made heaven and earth... and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). Nehemiah names Sabbath-breaking as a cause of the very exile they had suffered: *did not our Elohim (God) bring all this evil upon us... yet ye bring more wrath upon Yashar''el (Israel) by profaning the sabbath* (Nehemiah 13:18) — the warning of *if ye will not hearken unto me to hallow the sabbath day... then will I kindle a fire in the gates* (Jeremiah 17:27). Then he does precisely what the prophet had commanded: *bear no burden on the sabbath day, nor bring it in by the gates of Jerusalem* (Jeremiah 17:21), *but hallow ye the sabbath day, as I commanded your fathers* (Jeremiah 17:22) — *I commanded that the gates should be shut... that there should no burden be brought in on the sabbath day* (Nehemiah 13:19). The gates of Jerusalem shut against the trade is Jeremiah''s charge fulfilled to the letter, even down to warning the merchants who *lodged without Jerusalem* (Nehemiah 13:20-21). This is Isaiah''s Sabbath kept: *if thou turn away thy foot from the sabbath... and call the sabbath a delight, the holy of Yahuah (LORD)* (Isaiah 58:13), *then shalt thou delight thyself in Yahuah (LORD)* (Isaiah 58:14). And it is the covenant sign guarded: *I gave them my sabbaths, to be a sign between me and them, that they might know that I am Yahuah (LORD) that sanctify them* (Ezekiel 20:12). Nehemiah commands *the Levites that they should cleanse themselves, and... keep the gates, to sanctify the sabbath day* (Nehemiah 13:22). It is the oath the people had already sworn earlier in this same book — *if the people of the land bring ware or any victuals on the sabbath day to sell, that we would not buy it of them* (Nehemiah 10:31) — now enforced. The Sabbath is not abolished; it is hallowed, the gates shut, the day kept holy.',
       sv.verse_id, ev.verse_id, 'free', 32403
  FROM _s316_neh13_lookup sv, _s316_neh13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart',
       E'Cleansed From All Strangers — Lest the Outlandish Women Turn the Heart',
       E'Nehemiah''s last reform confronts the mixed marriages: *I Yahudim (Jews) that had married wives of Ashdod, of Ammon, and of Moab: and their children spake half in the speech of Ashdod, and could not speak in the Yahudim''s (Jews'') language* (Nehemiah 13:23-24). The covenant identity itself — even the tongue of the children — was dissolving. He binds them by oath in the Torah''s own words: *Ye shall not give your daughters unto their sons, nor take their daughters unto your sons* (Nehemiah 13:25), which is Moses verbatim: *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son* (Deuteronomy 7:3). And Moses names the danger plainly — not blood but gods: *for they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). That is exactly Nehemiah''s argument: *Did not Solomon king of Yashar''el (Israel) sin by these things?... even him did outlandish women cause to sin* (Nehemiah 13:26), for *when Solomon was old... his wives turned away his heart after other gods* (1 Kings 11:4); they were *women of the Moabites, Ammonites... and Hittites* (1 Kings 11:1) — the very peoples Nehemiah names. Ezra had fought the same battle a generation before — *give not your daughters unto their sons... that ye may be strong, and... leave it for an inheritance to your children* (Ezra 9:12). The peril is the loss of the covenant, the foreign gods carried in, the holy seed and its tongue erased — not ethnicity. So *thus cleansed I them from all strangers, and appointed the wards of the priests and the Levites* (Nehemiah 13:30), and the book closes on the servant''s appeal: *Remember me, O my Elohim (God), for good* (Nehemiah 13:31) — the prayer of one who labored for the covenant, echoing the psalmist''s *Remember me, O Yahuah (LORD), with the favour that thou bearest unto thy people: O visit me with thy salvation* (Psalm 106:4).',
       sv.verse_id, ev.verse_id, 'free', 32404
  FROM _s316_neh13_lookup sv, _s316_neh13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='nehemiah' AND ev.chapter_number=13 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 23:3 — the very statute they found read aloud: *an Ammonite or Moabite shall not enter into the congregation of Yahuah (LORD)... for ever.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=1
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 23:4 — the Torah''s reason, echoed almost verbatim: *because they met you not with bread and with water... and because they hired against thee Balaam.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 23:5 — the line Nehemiah echoes: *Yahuah Elohayka (the LORD thy God) turned the curse into a blessing... because... loved thee.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Numbers 24:10 — the scene behind it: *I called thee to curse mine enemies, and, behold, thou hast altogether blessed them these three times.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-1-3-they-read-in-the-book-of-moses-and-separated-the-mixed-multitude'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 2:15 — the Messiah''s zeal foreshadowed: *he drove them all out of the temple... and overthrew the tables*, as Nehemiah cast out Tobiah''s stuff.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=8
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'John 2:16 — the same offence judged: *make not my Father''s house an house of merchandise* — the holy place turned to private use.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Malachi 3:1 — *Yahuah (Lord)... shall suddenly come to his temple, even the messenger of the covenant* — the cleansing Nehemiah prefigures.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Malachi 3:3 — *he shall purify the sons of Levi... that they may offer unto Yahuah (LORD) an offering in righteousness* — a purified priesthood in a purified house.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-4-9-nehemiah-cast-out-tobiah-and-cleansed-the-house-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 18:21 — the tithe is the Levites'' Torah-given inheritance: *I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Malachi 3:8 — *Will a man rob Elohim (God)?... In tithes and offerings* — the sin behind the forsaken house Nehemiah confronts.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=11
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Malachi 3:10 — *Bring ye all the tithes into the storehouse... and pour you out a blessing* — exactly the reform Nehemiah enacts.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Chronicles 31:4 — Hezekiah''s pattern: command the people to give the priests'' portion *that they might be encouraged in the law of Yahuah (LORD).*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=12
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=31 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'1 Corinthians 9:13 — *they which minister about holy things live of the things of the temple* — Paul reaches back to this very Torah order.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=10
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'1 Corinthians 9:14 — *even so hath Yahuah (Lord) ordained that they which preach the gospel should live of the gospel* — the support of the ministry is divine ordinance, as Nehemiah''s treasurers embody.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-10-14-the-tithes-restored-and-the-ministry-of-the-levites-upheld'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 (Sabbath)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 20:8 — the fourth word, the ground of it all: *Remember the sabbath day, to keep it holy.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 20:11 — creation-rooted and Yahuah-hallowed: *Yahuah (LORD) blessed the sabbath day, and hallowed it* — to profane it brings wrath.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 17:21 — *bear no burden on the sabbath day, nor bring it in by the gates of Jerusalem* — the prophet''s charge Nehemiah fulfills to the letter.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 17:22 — *hallow ye the sabbath day, as I commanded your fathers* — the shut gates are this obedience.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Jeremiah 17:27 — the wrath Nehemiah warns of: *then will I kindle a fire in the gates thereof, and it shall devour the palaces of Jerusalem* — Sabbath-breaking named a cause of exile.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=18
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 58:13 — *call the sabbath a delight... not finding thine own pleasure, nor speaking thine own words* — the very turning-from-trade Nehemiah commands.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Isaiah 58:14 — *then shalt thou delight thyself in Yahuah (LORD)* — the Sabbath kept holy is the gate to blessing.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Ezekiel 20:12 — *I gave them my sabbaths, to be a sign between me and them... that I am Yahuah (LORD) that sanctify them* — the covenant sign Nehemiah guards.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=20 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Nehemiah 10:31 — the oath they had already sworn in this same book: *we would not buy it of them on the sabbath* — now enforced.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=10 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-15-22-the-sabbath-enforced-the-gates-shut-against-the-burden'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 7:3 — Moses verbatim: *thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* — the words Nehemiah binds them by.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=25
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 7:4 — the real danger named: *they will turn away thy son from following me, that they may serve other gods* — the gods, not the blood.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=26
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 11:1 — the same nations: *women of the Moabites, Ammonites... and Hittites* — the peoples Nehemiah names who turned Solomon.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=26
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 11:4 — the warning of warnings: *when Solomon was old... his wives turned away his heart after other gods* — the case Nehemiah cites.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=26
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezra 9:12 — the same crisis a generation earlier: *give not your daughters unto their sons... that ye may be strong, and... leave it for an inheritance to your children.*'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=25
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 106:4 — the servant''s closing appeal echoed: *Remember me, O Yahuah (LORD), with the favour that thou bearest unto thy people* — the One who remembers his covenant people.'
  FROM cross_reference_threads t
  JOIN _s316_neh13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='nehemiah' AND sv.chapter_number=13 AND sv.verse_number=31
  JOIN _s316_neh13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='nehemiah-13-23-31-cleansed-from-all-strangers-lest-the-outlandish-women-turn-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session316 — Nehemiah cross-references complete.'
