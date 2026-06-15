-- ----- fragment: minion_psalms_137.sql (Psalm 137) -----
-- Chapter: Psalm 137 ("By the rivers of Babylon" — the exile lament; ★ KEYSTONE)
-- Tag: ps137   Session prefix: s302   Sort band base: 25400 (25400, 25403, 25406)
-- Temp view: _s302_ps137_lookup   Output: minion_psalms_137.sql
-- Slug rule: thread slugs SINGULAR 'psalm-137-...'; verse-lookup book_slug PLURAL 'psalms'.
--
-- Psalm 137 coverage:
--   v.1-2  (rivers of Babylon, wept, hanged our harps)
--          NT:     none warranted standalone (the Babylon-fall fulfillment weaves at vv.7-9, Rev 18)
--          Extras: Baruch 1:2-4 (Baruch writes from Babylon "by the river Sud" the same captivity setting) — bound in thread 1
--          Tanakh: Lamentations 1:3,16 (Yahudah gone into captivity, the comfortless weeping); Jeremiah 50:33 (BOTH houses oppressed together) — bound in thread 1
--   v.3-4  (they required of us a song / how sing Yahuah's song in a strange land)
--          NT:     none warranted (silenced-song motif has no direct NT quote; left to prose)
--          Extras: Baruch 4:31-35 reserved for the judgment thread (oppressor's mockery answered)
--          Tanakh: Lamentations 2:6 (solemn feasts and sabbaths made forgotten in Zion — the silenced worship) — bound in thread 1
--   v.5-6  (if I forget thee O Jerusalem; Jerusalem above my chief joy)
--          NT:     Hebrews 12:22 (ye are come unto the heavenly Jerusalem) — forward fulfillment, bound in thread 2
--          Extras: none warranted (the love-of-Zion motif carried by canon Ps 122 + Heb 12)
--          Tanakh: Psalm 122:6 (pray for the peace of Jerusalem) — bound in thread 2
--   v.7    (Remember the children of Edom in the day of Jerusalem; Rase it)
--          NT:     none warranted (Edom-judgment is Tanakh + extras; Babylon side carries NT at v.8-9)
--          Extras: Baruch 4:31-35 (the oppressor grieved / inhabited of devils) — bound in thread 3
--          Tanakh: Obadiah 1:10-15 (Edom's violence against brother Jacob, day of distress, reward returns on own head) — bound in thread 3
--   v.8-9  (O daughter of Babylon to be destroyed; happy he that rewardeth thee as thou hast served us)
--          NT:     Revelation 18:6 (Reward her even as she rewarded you, and double unto her double) — measure-for-measure fulfillment, bound in thread 3
--          Extras: Baruch 4:31-35 (as she rejoiced at your fall, so shall she be grieved) — bound in thread 3
--          Tanakh: Jeremiah 51:24 (I will render unto Babylon all their evil done in Zion) — bound in thread 3
--
-- Threads:
--   1. psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion       [EXTRAS] -> Lam 1:3, Lam 1:16, Lam 2:6, Jer 50:33 (Tanakh) + Baruch 1:2-4 (extras)
--   2. psalm-137-if-i-forget-thee-o-jerusalem-zion-above-my-chief-joy     [FREE]   -> Psalm 122:6 (Tanakh) + Hebrews 12:22 (NT)
--   3. psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double  [EXTRAS] -> Obadiah 1:10, Obad 1:15, Jer 51:24 (Tanakh) + Rev 18:6 (NT) + Baruch 4:33 (extras)
--
-- Framework notes (VICTIMS-NOT-ENEMIES, do not soften — FRAME):
--   * vv.1-4 = the captive two-house people: Yahudah carried to Babylon, and Jer 50:33 names
--     "children of Yashar'el (Israel) AND the children of Yahudah (Judah) oppressed together" —
--     the silenced song of Zion (Lam 2:6 feasts/sabbaths forgotten), the appointed-times worship cut off.
--   * vv.5-6 = Zion fixed above chief joy; weaves FORWARD to Hebrews 12:22 heavenly Jerusalem —
--     the city the exile longs for is the city Messiah's people come unto.
--   * vv.7-9 = the covenant-LAWSUIT cry, NOT ethnic hate. Edom (Obadiah: violence against brother
--     Jacob, gloating in the day of distress) and Babylon (the razing system) face the SAME
--     measure-for-measure Yahuah Himself renders: Jer 51:24 / Rev 18:6 "double unto her double... in
--     the cup which she hath filled" / Baruch 4:33 "as she rejoiced at your ruin, so shall she be grieved."
--     The dashing of the little ones is the talionic reversal of what Babylon did to Zion's children
--     (Lam 2:11,19-21 sucklings swooning, virgins slain) — the just judgment on the oppressor-system.
--   * The live Revelation-18 thread (revelation-18-reward-her-double-...-psalm-137) already cross-refs
--     Ps 137 from the NT side; this is the Tanakh-anchored complement (greenfield for psalm-137-* slugs).

CREATE TEMP VIEW _s302_ps137_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: by the rivers of Babylon — the silenced song of Zion (vv.1-4)
    ('canon','psalms',137,1,'canon','lamentations',1,3,'free',
     E'*Yahudah (Judah) is gone into captivity because of affliction, and because of great servitude: she dwelleth among the heathen, she findeth no rest: all her persecutors overtook her between the straits.* (Lamentations 1:3) The Psalm''s *By the rivers of Babylon, there we sat down, yea, we wept* is this captivity wept out by the water — the same exile, the heathen-land, the no-rest of the carried-away people.'),
    ('canon','psalms',137,1,'canon','lamentations',1,16,'free',
     E'*For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* (Lamentations 1:16) Zion''s *we wept, when we remembered Zion* is Lamentations'' comfortless weeping — the same tears, the same far-off comforter, by the rivers of the conqueror.'),
    ('canon','psalms',137,3,'canon','lamentations',2,6,'free',
     E'*And he hath violently taken away his tabernacle, as if it were of a garden: he hath destroyed his places of the assembly: Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion, and hath despised in the indignation of his anger the king and the priest.* (Lamentations 2:6) When the captors *required of us a song... Sing us one of the songs of Zion*, the appointed-times worship had already been silenced — the feasts and sabbaths forgotten, the Temple song mocked by the very hand that razed it.'),
    ('canon','psalms',137,1,'canon','jeremiah',50,33,'free',
     E'*Thus saith Yahuah Tseva''ot (LORD of hosts); The children of Yashar''el (Israel) and the children of Yahudah (Judah) were oppressed together: and all that took them captives held them fast; they refused to let them go.* (Jeremiah 50:33) The weepers by Babylon''s rivers are BOTH houses — Yashar''el (Israel) and Yahudah (Judah) *oppressed together*, the scattered covenant people held fast by the captor that would not let them go.'),
    ('canon','psalms',137,1,'apocrypha','baruch-with-the-letter-of-jeremiah',1,4,'extras',
     E'*And in the hearing of the nobles, and of the king''s sons, and in the hearing of the elders, and of all the people, from the lowest to the highest, even of all them that dwelt at Babylon by the river Sud.* (Baruch 1:4) Baruch the scribe writes from inside the very exile the Psalm sings — the captive people *that dwelt at Babylon by the river*, the rivers of Babylon where they sat down and wept.'),

    -- THREAD 2: if I forget thee O Jerusalem — Zion above my chief joy (vv.5-6)
    ('canon','psalms',137,6,'canon','psalms',122,6,'free',
     E'*Pray for the peace of Jerusalem: they shall prosper that love thee.* (Psalm 122:6) The exile''s vow *if I prefer not Jerusalem above my chief joy* is the love of the pilgrim Psalm — the city set above every joy, prayed for and longed for even from a strange land.'),
    ('canon','psalms',137,5,'canon','hebrews',12,22,'free',
     E'*But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels,* (Hebrews 12:22) The Jerusalem the captive will not forget — placing his very right hand and tongue under oath for her — weaves FORWARD to the heavenly Jerusalem the gathered come unto: the same Zion, fixed above his chief joy, the city that cannot finally fall.'),

    -- THREAD 3: remember Edom and Babylon — the covenant-lawsuit, reward her double (vv.7-9)
    ('canon','psalms',137,7,'canon','obadiah',1,10,'free',
     E'*For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever.* (Obadiah 1:10) The cry *Remember, O Yahuah (LORD), the children of Edom in the day of Jerusalem* is Obadiah''s lawsuit against Edom — the brother who gloated and shared in the razing, whose *violence against thy brother Jacob* brings the verdict down on his own head.'),
    ('canon','psalms',137,7,'canon','obadiah',1,15,'free',
     E'*For the day of Yahuah (LORD) is near upon all the heathen: as thou hast done, it shall be done unto thee: thy reward shall return upon thine own head.* (Obadiah 1:15) Edom said *Rase it, rase it, even to the foundation thereof*; the answer is not ethnic hate but the measure-for-measure justice of the day of Yahuah — *as thou hast done, it shall be done unto thee*.'),
    ('canon','psalms',137,8,'canon','jeremiah',51,24,'free',
     E'*And I will render unto Babylon and to all the inhabitants of Chaldea all their evil that they have done in Zion in your sight, saith Yahuah (LORD).* (Jeremiah 51:24) *O daughter of Babylon, who art to be destroyed* — the destruction is Yahuah''s own rendering, repaying the system *all their evil... done in Zion*, the covenant-lawsuit against the oppressor He Himself prosecutes.'),
    ('canon','psalms',137,8,'canon','revelation',18,6,'free',
     E'*Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double.* (Revelation 18:6) *Happy shall he be, that rewardeth thee as thou hast served us* is fulfilled in Babylon-fallen — the same measure-for-measure cry, the cup she filled poured back, the just judgment on the oppressor-system, not on a people.'),
    ('canon','psalms',137,8,'apocrypha','baruch-with-the-letter-of-jeremiah',4,33,'extras',
     E'*For as she rejoiced at your ruin, and was glad of your fall: so shall she be grieved for her own desolation.* (Baruch 4:33) The imprecation against Babylon is the talionic reversal Baruch names from within the exile — the city that *rejoiced at your fall* shall herself be grieved and made desolate: the oppressor served as she served Zion.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps137_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps137_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion',
       E'By the Rivers of Babylon — the Silenced Song of Zion',
       E'*By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion. We hanged our harps upon the willows in the midst thereof.* (Psalm 137:1-2) This is the exile wept out by the water — the captive covenant people, and not Yahudah (Judah) alone: *The children of Yashar''el (Israel) and the children of Yahudah (Judah) were oppressed together: and all that took them captives held them fast; they refused to let them go* (Jeremiah 50:33). Both houses sit by the rivers of the conqueror. The grief is Lamentations'' own — *Yahudah (Judah) is gone into captivity because of affliction... she dwelleth among the heathen, she findeth no rest* (Lamentations 1:3); *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me* (Lamentations 1:16). When the captors taunt, *they that carried us away captive required of us a song... Sing us one of the songs of Zion* (Psalm 137:3), the appointed-times worship has already been silenced — *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (Lamentations 2:6). And the scribe of the exile writes from inside the very scene the Psalm sings: *all them that dwelt at Babylon by the river Sud* (Baruch 1:4). *How shall we sing the LORD''S song in a strange land?* (Psalm 137:4) is the dispersion''s unanswerable grief — the harps hung up, the song of Zion stopped in the land of those who razed her.',
       sv.verse_id, ev.verse_id, 'extras', 25400
  FROM _s302_ps137_lookup sv, _s302_ps137_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=137 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-137-if-i-forget-thee-o-jerusalem-zion-above-my-chief-joy',
       E'If I Forget Thee, O Jerusalem — Zion Above My Chief Joy',
       E'*If I forget thee, O Jerusalem, let my right hand forget her cunning. If I do not remember thee, let my tongue cleave to the roof of my mouth; if I prefer not Jerusalem above my chief joy.* (Psalm 137:5-6) The exile binds his own hand and tongue under oath to the city — Zion fixed above every joy, even from a strange land. This is the love of the pilgrim song: *Pray for the peace of Jerusalem: they shall prosper that love thee* (Psalm 122:6). And the longing weaves FORWARD: the Jerusalem the captive will not forget is the city the gathered finally come unto — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels* (Hebrews 12:22). The same Zion, set above his chief joy, the city that cannot in the end fall — remembered by the rivers of Babylon, entered at the last by Messiah''s gathered people.',
       sv.verse_id, ev.verse_id, 'free', 25403
  FROM _s302_ps137_lookup sv, _s302_ps137_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=137 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double',
       E'Remember Edom and Babylon — the Covenant-Lawsuit, Reward Her Double',
       E'*Remember, O Yahuah (LORD), the children of Edom in the day of Jerusalem; who said, Rase it, rase it, even to the foundation thereof. O daughter of Babylon, who art to be destroyed; happy shall he be, that rewardeth thee as thou hast served us. Happy shall he be, that taketh and dasheth thy little ones against the stones.* (Psalm 137:7-9) Do not soften this; frame it. It is the covenant-LAWSUIT cry — a plea for Yahuah''s just judgment on the systems that razed Zion, never ethnic hatred. Against Edom, the gloating brother: *For thy violence against thy brother Jacob shame shall cover thee, and thou shalt be cut off for ever* (Obadiah 1:10), and the verdict is exact measure — *as thou hast done, it shall be done unto thee; thy reward shall return upon thine own head* (Obadiah 1:15). Against Babylon, the razing power: *I will render unto Babylon and to all the inhabitants of Chaldea all their evil that they have done in Zion* (Jeremiah 51:24). The cry *that rewardeth thee as thou hast served us* is Yahuah''s own talionic justice — fulfilled when Babylon falls: *Reward her even as she rewarded you, and double unto her double according to her works: in the cup which she hath filled fill to her double* (Revelation 18:6); and named from inside the exile, *as she rejoiced at your ruin, and was glad of your fall: so shall she be grieved for her own desolation* (Baruch 4:33). The dashing of the little ones is the reversal of what Babylon did to Zion''s own children, swooning and slain in her streets — the just measure on the oppressor-system, never a war on a people.',
       sv.verse_id, ev.verse_id, 'extras', 25406
  FROM _s302_ps137_lookup sv, _s302_ps137_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=137 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Lamentations 1:3 — *Yahudah (Judah) is gone into captivity... she dwelleth among the heathen, she findeth no rest*: the same exile the rivers of Babylon weep out.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=1
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Lamentations 1:16 — *mine eye runneth down with water, because the comforter that should relieve my soul is far from me*: Zion''s comfortless weeping by the conqueror''s rivers.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=1
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Lamentations 2:6 — *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion*: the appointed-times song the captors mockingly demand was already silenced.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=3
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 50:33 — *The children of Yashar''el (Israel) and the children of Yahudah (Judah) were oppressed together*: BOTH houses are the weepers by Babylon''s rivers.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=1
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=50 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Baruch 1:4 (extras) — *all them that dwelt at Babylon by the river Sud*: the scribe of the exile writes from inside the Psalm''s very scene, by the river in Babylon.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=1
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-by-the-rivers-of-babylon-the-silenced-song-of-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 122:6 — *Pray for the peace of Jerusalem: they shall prosper that love thee*: the pilgrim''s love that places Jerusalem above his chief joy.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=6
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=122 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-if-i-forget-thee-o-jerusalem-zion-above-my-chief-joy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 12:22 — *ye are come unto... the heavenly Jerusalem*: the city the exile will not forget is the Zion the gathered come unto at the last.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=5
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-if-i-forget-thee-o-jerusalem-zion-above-my-chief-joy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Obadiah 1:10 — *For thy violence against thy brother Jacob shame shall cover thee*: Edom''s gloating share in the razing brings the lawsuit verdict on its own head.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=7
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Obadiah 1:15 — *as thou hast done, it shall be done unto thee; thy reward shall return upon thine own head*: the measure-for-measure answer to Edom''s "Rase it, rase it."'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=7
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='obadiah' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 51:24 — *I will render unto Babylon... all their evil that they have done in Zion*: the destruction of the daughter of Babylon is Yahuah''s own rendering.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=8
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 18:6 — *double unto her double according to her works: in the cup which she hath filled fill to her double*: the *rewardeth thee as thou hast served us* fulfilled in Babylon-fallen.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=8
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Baruch 4:33 (extras) — *as she rejoiced at your ruin... so shall she be grieved for her own desolation*: the talionic reversal named from inside the exile.'
  FROM cross_reference_threads t
  JOIN _s302_ps137_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=137 AND sv.verse_number=8
  JOIN _s302_ps137_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-137-remember-edom-and-babylon-the-covenant-lawsuit-reward-her-double'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
