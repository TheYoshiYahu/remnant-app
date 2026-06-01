-- =====================================================================
-- Session 185 migration — luke-anchored cross-reference threads + member-additions
-- =====================================================================
-- 35 NEW threads anchored in Luke (sort_order 1216-1250). Total derived
-- from drafter proposals (A=5, B=8, C=12, D=9), verifier conversions
-- (B NEW 8 yochanan-greater → ATTACH on existing yochanan-as-eliyahu-pattern-prophet;
-- D NEW 3 twelve-thrones → ATTACH on existing
-- the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii),
-- verifier splits (D NEW 6 father-forgive-them-and-into-thy-hands split into NEW 30 +
-- NEW 31 per Red Line collision on the "trinity" word), verifier rename (A NEW 5
-- slug locked as luke-3-political-and-priestly-backdrop-as-the-prophetic-clock), and
-- a verifier-added NEW 35 (storm-stilled-by-the-formed-ones-rebuke-as-creation-authority,
-- anchor Luke 8:22-25).
--
-- Member-row totals: ~257 input rows expanded across the 35 NEW-thread inserts
-- plus the bulk ATTACH WITH-VALUES section (~210 input rows for member-additions
-- to existing threads). All threads tier='free'.
--
-- Extras-edition references (1 Enoch, Jubilees, Sirach, Tobit, Wisdom of
-- Solomon, 2 Esdras, 2 Baruch, Ascension of Isaiah, etc.) are quoted
-- verbatim inside summary_md but NOT inserted as member rows here,
-- because `_s185_luke_lookup` is canon-edition scoped. Per S181 / S183
-- precedent (mark/john/romans/galatians/revelation migrations carry no
-- extras target rows even where the framework reading references extras).
-- Verifier-confirmed extras-row drops: NEW 21 (rich-man-and-Lazaros) drops
-- the proposed 1 Enoch 22:9-11 member row; NEW 22 (unjust-steward) drops
-- the proposed Tobit 4:9-10 member row. Both extras references remain
-- quoted in summary_md.
--
-- Yoshi's S185 resolutions (S185, 2026-05-31 — "1-6 yes and push it") are
-- baked into the prose: (1) Luke 23:43 paradise post-ascension relocation
-- per Ephesians 4:8 added to NEW 29 Luke 23:43 → Ephesians 4:8 member-row;
-- (2) Luke 10:21 vocative-Lord-to-Father preserved as *Lord* (per-verse
-- override registry — not landed in this migration); (3) Luke 23:34a
-- RETAINED as canonical-framework per S183 Mark longer-ending precedent;
-- (4) Luke 19:38 renders *Yahuah (the Lord)* per S182 NT-Lord-in-OT-quotation
-- rule (Tehillim 118:26 Hebrew is YHWH); (5) Luke 22:30 *krinontes* renders
-- as Tanakh-sense ruling/administering (Shoftim-pattern) in the twelve-thrones
-- ATTACH member-row; (6) Luke 13:34 dual-attach to scattered-seed-gathering
-- AND the-blood-of-hevel-crying-and-the-mother-hen-gathering CONFIRMED.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session185_luke_xref_members_and_threads.sql
-- =====================================================================

\echo 'Session 185 luke migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction (canon edition only).
CREATE TEMP VIEW _s185_luke_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel (A.1, sort 1216)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel',
    E'The Magnificat as Hannah-pattern — the daughter-of-Yashar''el''s gathering-song',
    E'Miriam (Mary)''s Magnificat is the Hannah-pattern song (1 Samuel 2:1-10) walked into the moment the Formed-one is conceived. The reversal-architecture — *he hath put down the mighty from their seats, and exalted them of low degree; he hath filled the hungry with good things; and the rich he hath sent empty away* — is the same post-harvest-sifting reversal Hannah sang, and the same vindication-of-the-righteous Wisdom of Solomon 3 and 5 name. The Magnificat closes on the Avraham-seed-promise — *as he spake to our fathers, to Avraham (Abraham), and to his seed for ever* — naming the gathering as the keeping of the oath, not the establishment of a metaphorical-Yashar''el. FRAMEWORK-MAJOR. The song is the framework''s covenant-architecture in the mouth of the mother who carries the Formed-Son.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1216
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 46
   AND ev.book_slug = 'luke' AND ev.chapter_number = 1 AND ev.verse_number = 55
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 1, 46, '1-samuel', 2, 1, 1, E'*And Miriam (Mary) said, My soul doth magnify Yahuah (the Lord), and my spirit hath rejoiced in Elohim (God) my Saviour.* Miriam''s opening words echo Channah (Hannah)''s *My heart rejoiceth in Yahuah (the LORD), mine horn is exalted in Yahuah (the LORD)* — the same daughter-of-Yashar''el (Israel)''s exultation in the answering of the barren-womb prayer, here applied to the womb that carries the Formed-Son.'),
  ('luke', 1, 48, '1-samuel', 1, 11, 2, E'*For he hath regarded the low estate of his handmaiden.* The *low estate* echoes Channah (Hannah)''s vow at 1 Samuel 1:11 — *if thou wilt indeed look on the affliction of thine handmaid.* The same Father who looked on Channah looks on Miriam; the same handmaiden-substance carries forward.'),
  ('luke', 1, 49, 'psalms', 111, 9, 3, E'*For he that is mighty hath done to me great things; and holy is his name.* Miriam names the same holy-Name-of-Yahuah Tehillim (Psalm) 111:9 names — *holy and reverend is his name.* The third-commandment weight of the Name is honored in the moment the Name''s own son is conceived.'),
  ('luke', 1, 50, 'psalms', 103, 17, 4, E'*And his mercy is on them that fear him from generation to generation.* The Tehillim (Psalm) 103:17 — *the mercy of Yahuah (the LORD) is from everlasting to everlasting upon them that fear him* — is the substance Miriam is singing. The mercy is generational; the gathering is the keeping of mercy from the fathers to the children.'),
  ('luke', 1, 51, 'psalms', 89, 10, 5, E'*He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The *arm of Yahuah (the LORD)* and the *scattering of the proud* — Tehillim (Psalm) 89:10''s *thou hast broken Rahav (Rahab) in pieces, as one that is slain; thou hast scattered thine enemies with thy strong arm* — is the same architecture. The Formed-Son in the womb is the same arm now in flesh.'),
  ('luke', 1, 52, '1-samuel', 2, 7, 6, E'*He hath put down the mighty from their seats, and exalted them of low degree.* The Channah (Hannah)-pattern reversal at 1 Samuel 2:7-8 — *Yahuah (the LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up. He raiseth up the poor out of the dust, and lifteth up the beggar from the dunghill, to set them among princes* — is the substance Miriam walks into her own song.'),
  ('luke', 1, 53, '1-samuel', 2, 5, 7, E'*He hath filled the hungry with good things; and the rich he hath sent empty away.* Channah (Hannah)''s *they that were full have hired out themselves for bread; and they that were hungry ceased* (1 Samuel 2:5) is the same reversal. The post-harvest-sifting in the wilderness of the people — chaff from wheat — is what these reversals point to.'),
  ('luke', 1, 54, 'isaiah', 41, 8, 8, E'*He hath holpen his servant Yashar''el (Israel), in remembrance of his mercy.* Yashar''el-as-servant is the Yeshayahu (Isaiah) 41:8-9 substance — *thou, Yashar''el (Israel), art my servant, Ya''aqov (Jacob) whom I have chosen, the seed of Avraham (Abraham) my friend... I have not cast thee away.* The gathering is the holpen-of-the-servant; the not-cast-away is the substance.'),
  ('luke', 1, 55, 'micah', 7, 20, 9, E'*As he spake to our fathers, to Avraham (Abraham), and to his seed for ever.* Mikhah (Micah) 7:20 — *thou wilt perform the truth to Ya''aqov (Jacob), and the mercy to Avraham (Abraham), which thou hast sworn unto our fathers from the days of old* — is the same Avraham-Ya''aqov-seed-promise framework Miriam closes on. The oath stands; the gathering is the keeping.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: benedictus-as-priestly-witness-to-the-davidic-horn-and-the-avraham-oath (A.2, sort 1217)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'benedictus-as-priestly-witness-to-the-davidic-horn-and-the-avraham-oath',
    E'The Benedictus as priestly witness — the horn of salvation, the Avraham oath, the dayspring from on high',
    E'Zecharyah (Zacharias) the priest, filled with the Ruach HaKodesh (Holy Spirit), names the redemption already at the door from inside the priestly office itself. The horn-of-salvation in the house of David (v.69 — Tehillim/Psalm 132:17), the oath sworn to Avraham (vv.72-73 — Bereshit/Genesis 22:16-18), the prophet-of-the-Most-High-going-before-the-face (v.76 — Mal''aki/Malachi 3:1, Yeshayahu/Isaiah 40:3), and the dayspring-from-on-high (v.78 — Mal''aki 4:2, Yeshayahu 9:2) all carry the same diagnostic: this is the keeping of the prophetic word that was sworn from-of-old. The priestly father witnesses to his own son''s prophetic office, then names the Davidic-Messianic substance over his nephew (or cousin in some readings) in the womb. The Benedictus is the temple-priesthood''s own witness that the gospel-promised-afore is being kept now.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1217
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 1 AND sv.verse_number = 67
   AND ev.book_slug = 'luke' AND ev.chapter_number = 1 AND ev.verse_number = 79
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 1, 68, 'psalms', 41, 13, 1, E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people.* The blessing-formula echoes Tehillim (Psalm) 41:13 — *Blessed be Yahuah Elohim (the LORD God) of Yashar''el (Israel) from everlasting, and to everlasting.* The visitation-and-redemption is the prophetic-substance Zecharyah (Zacharias) names from the priestly altar.'),
  ('luke', 1, 69, 'psalms', 132, 17, 2, E'*And hath raised up an horn of salvation for us in the house of his servant David.* Tehillim (Psalm) 132:17 — *There will I make the horn of David to bud: I have ordained a lamp for mine anointed* — is the Davidic horn-of-salvation substance directly. The horn rising in the house of David is the Messianic-substance the prophets named.'),
  ('luke', 1, 71, 'psalms', 106, 10, 3, E'*That we should be saved from our enemies, and from the hand of all that hate us.* Tehillim (Psalm) 106:10 — *he saved them from the hand of him that hated them, and redeemed them from the hand of the enemy* — names the Exodus-pattern redemption-from-enemies that the new-Exodus-of-the-gathering will fulfill in full.'),
  ('luke', 1, 72, 'genesis', 22, 16, 4, E'*To perform the mercy promised to our fathers, and to remember his holy covenant; the oath which he sware to our father Avraham (Abraham).* The Bereshit (Genesis) 22:16-18 oath — *by myself have I sworn, saith Yahuah (the LORD), for because thou hast done this thing... in blessing I will bless thee, and in multiplying I will multiply thy seed... and in thy seed shall all the nations of the earth be blessed* — is the oath Zecharyah (Zacharias) names. The mercy-and-oath are paired because the oath grounds the mercy.'),
  ('luke', 1, 74, 'micah', 4, 4, 5, E'*That he would grant unto us, that we being delivered out of the hand of our enemies might serve him without fear, in holiness and righteousness before him, all the days of our life.* The serving-without-fear-in-holiness-and-righteousness is the Mikhah (Micah) 4:4 reign-on-the-earth substance — *they shall sit every man under his vine and under his fig tree; and none shall make them afraid.* The Benedictus carries the millennial-reign-on-the-earth substance in seed-form.'),
  ('luke', 1, 76, 'malachi', 3, 1, 6, E'*And thou, child, shalt be called the prophet of the Highest: for thou shalt go before the face of Yahuah (the Lord) to prepare his ways.* Mal''aki (Malachi) 3:1 — *Behold, I will send my messenger, and he shall prepare the way before me* — is the Eliyahu-pattern (Elijah-pattern) prophet''s preparation-of-the-way Yochanan (John) is being named into. The priestly father witnesses to his own son''s prophetic office.'),
  ('luke', 1, 76, 'isaiah', 40, 3, 7, E'*Thou shalt go before the face of Yahuah (the Lord) to prepare his ways.* The same Yeshayahu (Isaiah) 40:3 voice-in-the-wilderness Yochanan (John) himself will name (Luke 3:4) is named over him here by his own father. The wilderness-preparation begins with the priestly witness over the infant.'),
  ('luke', 1, 77, 'jeremiah', 31, 34, 8, E'*To give knowledge of salvation unto his people by the remission of their sins.* Yirmeyahu (Jeremiah) 31:34''s new-covenant — *I will forgive their iniquity, and I will remember their sin no more* — is the substance of the salvation Zecharyah (Zacharias) names. The knowledge-of-salvation is the new-heart knowledge the new-covenant brings.'),
  ('luke', 1, 78, 'malachi', 4, 2, 9, E'*Whereby the dayspring from on high hath visited us.* Mal''aki (Malachi) 4:2 — *unto you that fear my name shall the Sun of righteousness arise with healing in his wings* — is the dayspring-rising-with-healing substance. The Sun-of-Righteousness rising over those-who-fear-the-Name is the same dayspring Zecharyah names.'),
  ('luke', 1, 79, 'isaiah', 9, 2, 10, E'*To give light to them that sit in darkness and in the shadow of death, to guide our feet into the way of peace.* Yeshayahu (Isaiah) 9:2 — *the people that walked in darkness have seen a great light: they that dwell in the land of the shadow of death, upon them hath the light shined* — is the light-in-darkness substance directly. The Sar Shalom (Prince of Peace) of Yeshayahu 9:6 is the substance the way-of-peace points to.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:benedictus-as-priestly-witness-to-the-davidic-horn-and-the-avraham-oath | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'benedictus-as-priestly-witness-to-the-davidic-horn-and-the-avraham-oath'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:benedictus-as-priestly-witness-to-the-davidic-horn-and-the-avraham-oath | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: simeon-and-anna-as-two-witnesses-at-the-presentation-light-glory-and-the-sword (A.3, sort 1218)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'simeon-and-anna-as-two-witnesses-at-the-presentation-light-glory-and-the-sword',
    E'Shimon (Simeon) and Anna as two witnesses at the presentation — light, glory, and the sword',
    E'At the temple presentation, two witnesses stand — Shimon (Simeon) the just-and-devout, and Anna the prophetess of the tribe of Asher. The Mosaic two-witness rule (Devarim/Deuteronomy 19:15) is honored at the moment the infant Formed-Son is brought into the temple. Shimon names the light-to-the-Gentiles and the glory-of-Yashar''el (Israel) substance from Yeshayahu (Isaiah) 49:6 and Yeshayahu 42:6 — the scattered-seed-gathering reading is load-bearing; the *Gentiles* are the *ethnē*-territories the scattered are dispersed among, not categorical-Gentile-inclusion. Shimon also names the sword-piercing-the-mother (v.35), the falling-and-rising-of-many-in-Yashar''el, and the sign-spoken-against. Anna''s witness is structural: NORTHERN-TRIBE Asher in the southern temple, naming the redemption-of-Yerushalayim (Jerusalem) before the gospel begins — the two-house architecture stands at the cradle. FRAMEWORK-MAJOR: the two-house witness, the scattered-seed reading of Yeshayahu 49:6, and the sword-piercing-the-mother that prefigures the cross.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1218
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 2 AND sv.verse_number = 25
   AND ev.book_slug = 'luke' AND ev.chapter_number = 2 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 2, 25, 'isaiah', 40, 1, 1, E'*And the same man was just and devout, waiting for the consolation of Yashar''el (Israel).* The *consolation of Yashar''el* echoes Yeshayahu (Isaiah) 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* Shimon (Simeon) is waiting for the comforting-of-the-people Yeshayahu 40 names — the gathering that begins with the voice-in-the-wilderness.'),
  ('luke', 2, 30, 'isaiah', 52, 10, 2, E'*For mine eyes have seen thy salvation.* Yeshayahu (Isaiah) 52:10 — *Yahuah (the LORD) hath made bare his holy arm in the eyes of all the nations; and all the ends of the earth shall see the salvation of our Elohim (God)* — is the salvation-seen-in-the-flesh-of-the-infant. Shimon''s eyes see what Yeshayahu named as the holy arm of Yahuah made bare.'),
  ('luke', 2, 31, 'isaiah', 49, 6, 3, E'*Which thou hast prepared before the face of all people; a light to lighten the Gentiles, and the glory of thy people Yashar''el (Israel).* Yeshayahu (Isaiah) 49:6 — *I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* — is the Servant-Song substance directly. The *Gentiles* (Greek *ethnē*) are the territories of the scattered; the light reaches the scattered through reaching the territories that contain them. The *glory of thy people Yashar''el* names the same twelve-tribe-seed-of-promise the prophets named — not a metaphorical Yashar''el.'),
  ('luke', 2, 32, 'isaiah', 42, 6, 4, E'*A light to lighten the Gentiles.* Yeshayahu (Isaiah) 42:6 — *I Yahuah (the LORD) have called thee in righteousness... and give thee for a covenant of the people, for a light of the Gentiles* — is the parallel Servant-Song substance. The Servant is the covenant-of-the-people and the light-of-the-Gentiles in the same breath.'),
  ('luke', 2, 34, 'isaiah', 8, 14, 5, E'*Behold, this child is set for the fall and rising again of many in Yashar''el (Israel); and for a sign which shall be spoken against.* Yeshayahu (Isaiah) 8:14 — *And he shall be for a sanctuary; but for a stone of stumbling and for a rock of offence to both the houses of Yashar''el (Israel)* — is the falling-and-rising substance directly. The Stone-of-Stumbling Tehillim (Psalm) 118:22 substance is named over the infant Shimon (Simeon) holds.'),
  ('luke', 2, 35, 'zechariah', 12, 10, 6, E'*(Yea, a sword shall pierce through thy own soul also,) that the thoughts of many hearts may be revealed.* Zekharyah (Zechariah) 12:10 — *they shall look upon me whom they have pierced* — is the piercing-substance. The sword-piercing-the-mother prefigures the spear-piercing-the-Son; the mother carries the wound in her soul before the wound carries the Son in his side.'),
  ('luke', 2, 36, 'joshua', 19, 24, 7, E'*And there was one Anna, a prophetess, the daughter of Phanuel, of the tribe of Asher.* The naming of Anna as *of the tribe of Asher* names a NORTHERN-TRIBE daughter in the temple — the Yehoshua (Joshua) 19:24-31 territory of Asher in the northern allotment. The two-house architecture stands at the cradle: northern-tribe Asher''s prophetess names the redemption alongside southern-tribe-of-Yahudah''s Shimon.'),
  ('luke', 2, 38, 'isaiah', 52, 9, 8, E'*And spake of him to all them that looked for redemption in Yerushalayim (Jerusalem).* Yeshayahu (Isaiah) 52:9 — *Break forth into joy, sing together, ye waste places of Yerushalayim (Jerusalem): for Yahuah (the LORD) hath comforted his people, he hath redeemed Yerushalayim (Jerusalem)* — is the redemption-of-Yerushalayim Anna names. The northern-tribe prophetess witnesses to the southern-city''s redemption — the two-house architecture is whole at the cradle.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:simeon-and-anna-as-two-witnesses-at-the-presentation-light-glory-and-the-sword | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'simeon-and-anna-as-two-witnesses-at-the-presentation-light-glory-and-the-sword'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:simeon-and-anna-as-two-witnesses-at-the-presentation-light-glory-and-the-sword | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases (A.4, sort 1219)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases',
    E'The Nazareth scroll — the acceptable year stopped mid-verse, and the individual-mercy contrast cases',
    E'At the Natsareth (Nazareth) synagogue, the King reads Yeshayahu (Isaiah) 61:1-2a and stops — *the acceptable year of Yahuah (the LORD)* is fulfilled today; *the day of vengeance of our Elohim (God)* is left unread because it is not yet today. The cutting is theological. The first coming is the acceptable year of liberty-to-the-captives — the scattered-seed-gathering language being inaugurated. The day of vengeance is the dreadful day still future. Then the King points to Eliyahu (Elijah) and the widow of Tsarephath (Zarephath), and Elisha and Naaman the Syrian — the individual-mercy contrast cases the framework holds against the false-inclusion-gospel. Foreign-origin individuals receive mercy without absorption into the seed-of-promise; absorption requires the marriage covenant Rachav (Rahab) and Ruth walked through. The crowd''s murder-rage (vv.28-29 — they try to throw him off the cliff) is the read: they hear the contrast cases as a threat to the flesh-credential gospel and they want him dead for it. FRAMEWORK-MAJOR: the Spirit-anointed-Elect-One self-identification, the eschatological cut at *the acceptable year,* and the contrast-cases-as-the-tell.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1219
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 4 AND sv.verse_number = 16
   AND ev.book_slug = 'luke' AND ev.chapter_number = 4 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 4, 18, 'isaiah', 61, 1, 1, E'*The Spirit of Yahuah (the Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind, to set at liberty them that are bruised.* Yeshayahu (Isaiah) 61:1 — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (the LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound* — is the Spirit-anointed-Elect-One self-identification directly. The *liberty to the captives* is the scattered-seed gathering-language; the captives are the captives-of-the-exile-judgment that the new-Exodus will bring home.'),
  ('luke', 4, 19, 'isaiah', 61, 2, 2, E'*To preach the acceptable year of Yahuah (the Lord).* Yeshayahu (Isaiah) 61:2''s first clause — *to proclaim the acceptable year of Yahuah (the LORD)* — is the line the King reads. The next clause — *and the day of vengeance of our Elohim (God)* — is what he does NOT read. The eschatological cut is the King''s own act; the first coming is the acceptable year, the second coming is the day of vengeance.'),
  ('luke', 4, 24, 'jeremiah', 11, 21, 3, E'*No prophet is accepted in his own country.* Yirmeyahu (Jeremiah) 11:21 — *Thus saith Yahuah (the LORD) of the men of Anatot (Anathoth), that seek thy life, saying, Prophesy not in the name of Yahuah (the LORD), that thou die not by our hand* — is the prophet-rejected-in-his-own-country pattern. The Eliyahu-pattern (Elijah-pattern) prophet-rejection is the substance Yahusha names over himself at Natsareth (Nazareth).'),
  ('luke', 4, 25, '1-kings', 17, 9, 4, E'*But unto none of them was Eliyahu (Elijah) sent, save unto Tsarephath (Zarephath), a city of Tsidon (Sidon), unto a woman that was a widow.* 1 Melakhim (Kings) 17:9 — *Arise, get thee to Tsarephath (Zarephath), which belongeth to Tsidon (Sidon), and dwell there: behold, I have commanded a widow woman there to sustain thee* — is the individual-mercy case the King names. The Tsidonian widow receives mercy without absorption into the seed-of-promise. The mercy is individual; the gathering is collective.'),
  ('luke', 4, 27, '2-kings', 5, 14, 5, E'*And many lepers were in Yashar''el (Israel) in the time of Eliseus (Elisha) the prophet; and none of them was cleansed, saving Naaman the Syrian.* 2 Melakhim (Kings) 5:14 — *Then went he down, and dipped himself seven times in Yarden (Jordan), according to the saying of the man of Elohim (God): and his flesh came again like unto the flesh of a little child, and he was clean* — is the individual-mercy case for the Syrian commander. Naaman receives healing without absorption; the contrast case proves the directional non-symmetry of the seed-mechanism.'),
  ('luke', 4, 28, 'numbers', 15, 35, 6, E'*And all they in the synagogue, when they heard these things, were filled with wrath, and rose up, and thrust him out of the city, and led him unto the brow of the hill whereon their city was built, that they might cast him down headlong.* The murder-rage at the contrast cases is the read — they hear the contrast cases as a threat to the flesh-credential gospel of *we have Avraham (Abraham) to our father.* The casting-off-the-cliff is the same kind of stoning-the-prophet move Bamidbar (Numbers) 15:35 codifies as the death-penalty execution-format. The framework''s diagnostic: the system tries to kill what threatens it.'),
  ('luke', 4, 30, 'john', 8, 59, 7, E'*But he passing through the midst of them went his way.* The Yochanan (John) 8:59 parallel — *Then took they up stones to cast at him: but Yahusha (Jesus) hid himself, and went out of the temple, going through the midst of them, and so passed by* — is the same hour-not-yet pattern. The Father preserves the Son''s life until the appointed cup is drunk; not the cliff at Natsareth, not the stones at the temple — the cross at the appointed hour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:nazareth-scroll-the-acceptable-year-stopped-mid-verse-and-the-individual-mercy-contrast-cases | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: luke-3-political-and-priestly-backdrop-as-the-prophetic-clock (A.5, sort 1220, RENAMED per verifier)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'luke-3-political-and-priestly-backdrop-as-the-prophetic-clock',
    E'The political backdrop of the day — Luke''s imperial-and-priestly names as the prophetic clock',
    E'Luke uniquely opens Yochanan (John)''s investiture with a precise political-and-priestly dating: *Now in the fifteenth year of the reign of Tiberius Caesar, Pontius Pilate being governor of Yahudah (Judea), and Herod being tetrarch of Galiyl (Galilee), and his brother Philip tetrarch of Iturea and of the region of Trachonitis, and Lysanias the tetrarch of Abilene, Annas and Caiaphas being the high priests, the word of Elohim (God) came unto Yochanan (John) the son of Zecharyah (Zacharias) in the wilderness.* The naming is not decorative. It anchors the moment in real political time — the Daniyel (Daniel) 9 weeks of years are running on this clock; the fourth beast (Daniyel 7) is in the throne; the priesthood is corrupt (two high priests at once, which Torah does not allow); the territorial divisions are imperial-imposed. The Father moves the Word into the wilderness at exactly this hour — the prophetic clock is being kept, and Luke names the keeping. The Herod here is Herod Antipas, son of the infant-slaughter Herod of Matthew 2 — the herod-as-edomite-usurper pattern persists.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1220
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 3 AND sv.verse_number = 1
   AND ev.book_slug = 'luke' AND ev.chapter_number = 3 AND ev.verse_number = 2
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 3, 1, 'daniel', 9, 25, 1, E'*Now in the fifteenth year of the reign of Tiberius Caesar.* Daniyel (Daniel) 9:25''s *threescore and two weeks* clock is running on real political time. Luke''s *fifteenth year of Tiberius* is the historian-anchor that lets the reader date the moment the Word came to Yochanan (John) in real years. The Daniyel 9 clock is being kept.'),
  ('luke', 3, 1, 'daniel', 7, 23, 2, E'*Pontius Pilate being governor of Yahudah (Judea).* The Roman governorship is the fourth-beast-administration of Daniyel (Daniel) 7:23 — *the fourth beast shall be the fourth kingdom upon earth.* Pilate sits in the procuratorial seat as the local face of the iron-and-clay beast.'),
  ('luke', 3, 1, 'numbers', 24, 17, 3, E'*And Herod being tetrarch of Galiyl (Galilee).* Herod Antipas, son of the infant-slaughter Herod of Matthew 2, sits in Galiyl as the herod-as-edomite-usurper. Bamidbar (Numbers) 24:17 — *there shall come a Star out of Ya''aqov (Jacob), and a Sceptre shall rise out of Yashar''el (Israel)... and shall smite the corners of Moav (Moab), and destroy all the children of Sheth* — the legitimate sceptre-from-Yashar''el is the substance the Edomite-usurper-pattern stands against.'),
  ('luke', 3, 2, 'leviticus', 21, 10, 4, E'*Annas and Caiaphas being the high priests.* Vayikra (Leviticus) 21:10 — *And he that is the high priest among his brethren* — is the priesthood-architecture (one high priest, not two). Luke''s naming of *Annas and Caiaphas* as high priests-plural names the corruption of the priesthood at the hinge-moment. The system that will demand the King''s blood is already showing its irregularity.'),
  ('luke', 3, 2, 'jeremiah', 1, 1, 5, E'*The word of Elohim (God) came unto Yochanan (John) the son of Zecharyah (Zacharias) in the wilderness.* Yirmeyahu (Jeremiah) 1:1-2 — *The words of Yirmeyahu (Jeremiah) the son of Chilqiyahu (Hilkiah), of the priests... To whom the word of Yahuah (the LORD) came in the days of Yoshiyahu (Josiah)* — is the same priest''s-son-prophet-call pattern. The word coming to Yochanan the priest''s son in the wilderness echoes the word coming to Yirmeyahu the priest''s son in the days of the king.'),
  ('luke', 3, 2, 'ezekiel', 1, 1, 6, E'*The word of Elohim (God) came unto Yochanan (John) the son of Zecharyah (Zacharias) in the wilderness.* Yechezk''el (Ezekiel) 1:1-3''s word-of-Yahuah-coming-to-the-priest-by-the-river-Khebar is the same pattern. The priestly-prophet receives the word in the place-of-exile-or-wilderness, not in the temple. When the priesthood is corrupted (Luke 3:2 carries this), the prophet''s word comes outside the temple.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:luke-3-political-and-priestly-backdrop-as-the-prophetic-clock | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'luke-3-political-and-priestly-backdrop-as-the-prophetic-clock'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:luke-3-political-and-priestly-backdrop-as-the-prophetic-clock | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


-- ---------------------------------------------------------------------
-- Thread 6: nain-widows-son-and-the-eliyahu-tsarephath-raising-pattern (B.1, sort 1221)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'nain-widows-son-and-the-eliyahu-tsarephath-raising-pattern',
    E'The Nain widow''s son and the Eliyahu-pattern raising of the Tsarephath widow''s son',
    E'Luke alone carries this raising. *And when Yahuah (the Lord) saw her, he had compassion on her, and said unto her, Weep not. And he came and touched the bier... And he said, Young man, I say unto thee, Arise* (Luke 7:13-14). The crowd''s verdict — *That a great prophet is risen up among us; and, that Elohim (God) hath visited his people* (Luke 7:16) — names what the raising is doing: the King is walking the Eliyahu (Elijah)-pattern from 1 Melakhim (Kings) 17:17-24 where the prophet raised the son of the Tsarephath (Zarephath) widow, the same Tsarephath case the King already named as an INDIVIDUAL-MERCY contrast in Luke 4:25-26 (mercy on the widow of Tsidon (Sidon) while many widows in Yashar''el (Israel) went without). The Nain raising is Eliyahu''s miracle redone by the Son of Adam himself — confirming the messianic-age catalog of Yeshayahu (Isaiah) 26:19 / 35 / 61 where *the dead shall live* and *the King shall come to recover his people.* Framework-relevant: the Tsarephath echo carries the individual-mercy contrast that runs through the Luke material, distinguishing mercy-without-covenant-absorption (the Tsidonian widow) from the gathering of the seed-of-promise.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1221
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 7 AND sv.verse_number = 11
   AND ev.book_slug = 'luke' AND ev.chapter_number = 7 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 7, 13, '1-kings', 17, 17, 1, E'*And when Yahuah (the Lord) saw her, he had compassion on her.* The Eliyahu (Elijah)-pattern begins at 1 Melakhim (Kings) 17:17 — *And it came to pass after these things, that the son of the woman, the mistress of the house, fell sick; and his sickness was so sore, that there was no breath left in him.* The Tsarephath (Zarephath) widow''s son fell sick and died; the Nain widow''s son is being carried out for burial. Same architecture: the prophet meets the widow at the moment of her dead-son''s loss.'),
  ('luke', 7, 14, '1-kings', 17, 21, 2, E'*Young man, I say unto thee, Arise.* The King''s word is direct — no stretching-out, no calling-upon-Yahuah-three-times as Eliyahu (Elijah) did at 1 Melakhim (Kings) 17:21 (*And he stretched himself upon the child three times, and cried unto Yahuah (the LORD), and said, O Yahuah Elohai (LORD my God), I pray thee, let this child''s soul come into him again*). Eliyahu was a prophet who called upon his Elohim; the Son of Adam himself commands the rising.'),
  ('luke', 7, 15, '1-kings', 17, 23, 3, E'*And he that was dead sat up, and began to speak. And he delivered him to his mother.* The 1 Melakhim (Kings) 17:22-23 raising ends with the same line: *And Eliyahu (Elijah) took the child, and brought him down out of the chamber into the house, and delivered him unto his mother.* The Nain raising lands on the identical phrase — *delivered him to his mother* — Luke''s signal that the same architecture is at work.'),
  ('luke', 7, 16, '2-kings', 4, 35, 4, E'*That a great prophet is risen up among us; and, that Elohim (God) hath visited his people.* The crowd''s verdict ties this raising to the prophetic-tradition of raising the dead — Eliyahu (Elijah) in 1 Melakhim (Kings) 17, Elisha in 2 Melakhim 4:32-37 (the Shunammite woman''s son). The King walks both prophetic raisings into a single moment in Nain.'),
  ('luke', 7, 16, 'isaiah', 26, 19, 5, E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The crowd''s *Elohim hath visited his people* is the prophetic-register response to a raising of the dead — the messianic-age credential Yeshayahu (Isaiah) catalogued.'),
  ('luke', 7, 17, 'isaiah', 35, 10, 6, E'The Nain raising spreading throughout Yahudaea (Judaea) and the region round about is the news of the messianic-age catalog walking — *the ransomed of Yahuah (the LORD) shall return, and come to Tsiyon (Zion) with songs and everlasting joy.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:nain-widows-son-and-the-eliyahu-tsarephath-raising-pattern | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'nain-widows-son-and-the-eliyahu-tsarephath-raising-pattern'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:nain-widows-son-and-the-eliyahu-tsarephath-raising-pattern | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: woman-with-the-alabaster-box-in-the-pharisees-house-faith-saved-thee (B.2, sort 1222)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'woman-with-the-alabaster-box-in-the-pharisees-house-faith-saved-thee',
    E'The woman with the alabaster box in the Pharisee''s house — *thy faith hath saved thee*',
    E'Luke alone carries this episode (the Beit-Anyah/Bethany anointing in John 12 / Matthew 26 / Mark 14 is a different event, a different woman, a different moment). *And, behold, a woman in the city, which was a sinner, when she knew that Yahusha (Jesus) sat at meat in the Pharisee''s house, brought an alabaster box of ointment* (Luke 7:37). The Pharisee Shimon (Simon)''s silent verdict — *This man, if he were a prophet, would have known who and what manner of woman this is that toucheth him: for she is a sinner* (Luke 7:39) — is the same legal-distance-keeping the King rebukes throughout the gospels. The verdict spoken to the woman — *Thy faith hath saved thee; go in peace* (Luke 7:50) — names the same emunah-as-covenant-walking that runs through Chavaqquq (Habakkuk) 2:4, Bereshit (Genesis) 15:6, and the patriarchal-faith register. The woman is doing exactly what the patriarchs did — responding to the Son of Adam with her substance and her weeping — and the King names what is already true: she is one of the sheep who hears, revealed by her response.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1222
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 7 AND sv.verse_number = 36
   AND ev.book_slug = 'luke' AND ev.chapter_number = 7 AND ev.verse_number = 50
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 7, 37, 'mark', 14, 3, 1, E'The Lukan alabaster box is a different event from the Beit-Anyah (Bethany) anointing of Mark 14:3 / Matthew 26:7 / John 12:3 — different city, different Shimon (Simon), different woman, different occasion. The cross-reference marks the parallel so the reader does not collapse the two stories.'),
  ('luke', 7, 39, 'matthew', 9, 11, 2, E'*This man, if he were a prophet, would have known who and what manner of woman this is.* The Pharisee Shimon (Simon)''s silent verdict echoes the same legal-distance-keeping the Pharisees voiced at Mattityahu (Matthew)''s table — *Why eateth your Master with publicans and sinners?* (Matthew 9:11). The system that distances itself from the so-called-unclean cannot recognize the King when he sits with them.'),
  ('luke', 7, 47, 'genesis', 15, 6, 3, E'*Her sins, which are many, are forgiven; for she loved much: but to whom little is forgiven, the same loveth little.* The love that pours out is the response to the forgiveness already received — the same cause-and-effect of hearing that runs through every chapter: she loved because she had heard, she had heard because she was a sheep, she was a sheep from before the foundation of the world. Avraham (Abraham) believed Yahuah (the LORD), and it was counted unto him for righteousness — the same emunah-substance walking forward.'),
  ('luke', 7, 48, 'matthew', 9, 6, 4, E'*Thy sins are forgiven.* The same Son-of-Adam authority the King exercised at the healing of the palsied man in Matthew 9:6 / Mark 2:10 — *the Son of Adam hath power on earth to forgive sins.* The Pharisee Shimon (Simon)''s table is another stage on which the authority gets named.'),
  ('luke', 7, 50, 'habakkuk', 2, 4, 5, E'*Thy faith hath saved thee; go in peace.* The verdict names the same emunah-as-covenant-walking Chavaqquq (Habakkuk) 2:4 carries — *the just shall live by his faith* — the patriarchal-faith register the woman is walking inside without knowing the framework name for it. The faith does not earn the forgiveness; the faith is the response of the heart already known by the Father.'),
  ('luke', 7, 50, 'luke', 8, 48, 6, E'*Thy faith hath saved thee* lands again at Luke 8:48 with the woman with the issue, and again at Luke 17:19 with the cleansed leper, and again at Luke 18:42 with the blind man at Yericho (Jericho). Four times in Luke. The verdict is consistent: the response of faith reveals what the Father had already placed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:woman-with-the-alabaster-box-in-the-pharisees-house-faith-saved-thee | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'woman-with-the-alabaster-box-in-the-pharisees-house-faith-saved-thee'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:woman-with-the-alabaster-box-in-the-pharisees-house-faith-saved-thee | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations (B.3, sort 1223)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations',
    E'The seventy sent out — Yashar''el (Israel) numbered against the seventy nations of Bereshit (Genesis) 10',
    E'Luke alone carries this commissioning. *After these things Yahuah (the Lord) appointed other seventy also, and sent them two and two before his face into every city and place, whither he himself would come* (Luke 10:1). The number 70 is not arbitrary. Bereshit (Genesis) 10''s Table of Nations lists seventy peoples descended from Noach (Noah)''s sons; Devarim (Deuteronomy) 32:8 names how *the Most High divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* — read in the older Hebrew witness as *according to the number of the sons of Elohim,* with the seventy-bnei-Elohim and the seventy-sons-of-Yashar''el (Genesis 46:27, Exodus 1:5) mirroring each other. The seventy sent out IS a Yashar''el-being-numbered-against-the-seventy-nations register: the King is sending out his Yashar''el-sized contingent to confront the territory the Watcher-administration has held since the dispersion of nations at the tower. The framework-major substance pours out across the chapter: the satan-falling-as-lightning vision (Luke 10:18) is the Watcher-rebellion answer; the hidden-from-the-wise-revealed-to-babes (Luke 10:21-22) is the cause-and-effect-of-hearing diagnostic in compressed form. FRAMEWORK-MAJOR.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1223
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 1
   AND ev.book_slug = 'luke' AND ev.chapter_number = 10 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 10, 1, 'genesis', 10, 32, 1, E'*Yahuah (the Lord) appointed other seventy also, and sent them two and two.* The number traces directly to Bereshit (Genesis) 10:32''s Table of Nations: *These are the families of the sons of Noach (Noah), after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The Genesis 10 list contains seventy peoples — the numbering of the Most High at the dispersion. The King''s seventy sent out is a one-for-one Yashar''el-contingent answer.'),
  ('luke', 10, 1, 'deuteronomy', 32, 8, 2, E'*When the Most High divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Devarim (Deuteronomy) 32:8 names the seventy-nations / seventy-sons-of-Yashar''el mirror (older Hebrew witness: *according to the number of the sons of Elohim*) — the seventy-fold register the King''s seventy sent out walks.'),
  ('luke', 10, 1, 'genesis', 46, 27, 3, E'*All the souls of the house of Ya''aqov (Jacob), which came into Egypt, were threescore and ten.* The seventy-sons-of-Yashar''el at the entry into Egypt is the covenant-side mirror to the seventy-nations of Bereshit (Genesis) 10. The seventy sent out is Yashar''el''s twelve-tribe-and-seventy-elder constitution at the start of the gathering.'),
  ('luke', 10, 1, 'exodus', 1, 5, 4, E'*And all the souls that came out of the loins of Ya''aqov (Jacob) were seventy souls.* The Shemot (Exodus) confirmation of the seventy-house-of-Ya''aqov number.'),
  ('luke', 10, 1, 'numbers', 11, 16, 5, E'*Gather unto me seventy men of the elders of Yashar''el (Israel), whom thou knowest to be the elders of the people, and officers over them.* The seventy elders Mosheh (Moses) appoints under Yahuah''s (the LORD''s) own instruction — the seventy-Yashar''el structure repeating itself in the wilderness administration. The seventy sent out is the same Yashar''el-administrative-seventy walking into the Yashar''el-territory of the seventy nations.'),
  ('luke', 10, 9, 'matthew', 10, 7, 6, E'*Heal the sick that are therein, and say unto them, The kingdom of Elohim (God) is come nigh unto you.* The seventy carry the same charge as the Twelve of Matthew 10 / Luke 9 — heal, proclaim. The Twelve correspond to the tribes; the seventy correspond to the elders; together the constitutional shape of Yashar''el is sent out before the King.'),
  ('luke', 10, 11, 'matthew', 10, 14, 7, E'*Even the very dust of your city, which cleaveth on us, we do wipe off against you.* The shake-the-dust-off rejection-response from Mosheh''s (Moses''s) wilderness law walking into the seventy''s commission — we do not chase the nations into a worship they will not give per the framework''s reading.'),
  ('luke', 10, 18, 'revelation', 12, 9, 8, E'*I beheld ha-satan (Satan) as lightning fall from heaven.* The Watcher-rebellion answer the King names in seven words; ties to Revelation 12:7-9 where the dragon and his angels are cast out. The seventy''s territory-by-territory undoing of unclean-spirit administration IS the working-out of the lightning-fall the King saw.'),
  ('luke', 10, 19, 'genesis', 3, 15, 9, E'*Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy.* The serpent-seed-war from Bereshit (Genesis) 3:15 walks forward — the seventy are handed authority over the serpent-administration that has held the nations since the dispersion.'),
  ('luke', 10, 21, 'matthew', 11, 25, 10, E'*I thank thee, O Father, Lord of heaven and earth, that thou hast hid these things from the wise and prudent, and hast revealed them unto babes.* The synoptic-doublet of Matthew 11:25-27 lands in Luke''s seventy-commissioning context — the cause-and-effect-of-hearing diagnostic the framework names: *thou hast hid* and *hast revealed* are sovereign-election-precedes-hearing language. Lord here is vocative-to-the-Father (preserve as *Lord* per S182 NT-Lord rule).'),
  ('luke', 10, 22, 'john', 10, 14, 11, E'*No man knoweth who the Son is, but the Father; and who the Father is, but the Son, and he to whom the Son will reveal him.* The Formless-Father / Formed-Son revelation-economy named in the Markan / Matthean / Lukan doublet, paired with the Yochanan (John) 10:14-15 *I know my sheep, and am known of mine* — the same architecture of recognition running through every chapter.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-seventy-sent-out-as-yasharel-numbered-against-the-seventy-nations | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 9: good-samaritan-as-scattered-northern-witness-not-gentile-inclusion-paradigm (B.4, sort 1224)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'good-samaritan-as-scattered-northern-witness-not-gentile-inclusion-paradigm',
    E'The Good Samaritan as a scattered-northern witness — not as a Gentile-Christian inclusion paradigm',
    E'Luke alone carries this parable. *A certain lawyer stood up, and tempted him, saying, Master, what shall I do to inherit eternal life?* (Luke 10:25). The King answers with the Shema-and-Vayikra-19:18 catena, then walks the lawyer''s *who is my neighbour?* through the parable of the man fallen among thieves, passed by the priest and the Levite, and shown mercy by *a certain Samaritan* (Luke 10:33). The inherited Christian reading flattens the Samaritan into a Gentile-Christian-included-by-faith paradigm. The framework reading refuses that flattening: the Samaritans were the mixed-population the Assyrian king resettled in the territory of the divorced northern kingdom (2 Melakhim/Kings 17:24-41), among whom the residual scattered seed of the northern tribes remained. The Samaritan in the parable is a witness from the territory of the scattered, not a Gentile credentialed by belief. The King chooses the figure whom the Yahudim of his day looked down upon and shows him keeping the heart-of-the-Torah while the priest and the Levite — credentialed-by-blood, credentialed-by-office — pass by on the other side. The verdict — *Go, and do thou likewise* (Luke 10:37) — is the same 1 Yochanan (John) 2:3-4 standing test: he that saith I know him and keepeth not his commandments is a liar. The neighbor-love the Samaritan walks is the Torah walked out.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1224
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 25
   AND ev.book_slug = 'luke' AND ev.chapter_number = 10 AND ev.verse_number = 37
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 10, 27, 'deuteronomy', 6, 5, 1, E'*Thou shalt love Yahuah Elohayka (the LORD thy God) with all thy heart, and with all thy soul, and with all thy strength.* The lawyer''s recitation of the Shema — the King affirms it as the answer that already stood in the Torah.'),
  ('luke', 10, 27, 'leviticus', 19, 18, 2, E'*Thou shalt love thy neighbour as thyself: I am Yahuah (the LORD).* The second half of the catena — Vayikra (Leviticus) 19:18 the lawyer recites and the King affirms. The Torah is not abolished; it is the answer to the lawyer''s question about eternal life. *This do, and thou shalt live* (Luke 10:28) is straight Vayikra-18:5 substance.'),
  ('luke', 10, 28, 'leviticus', 18, 5, 3, E'*This do, and thou shalt live.* Vayikra (Leviticus) 18:5''s *which if a man do, he shall live in them* — the King citing the Torah as the answer to *what shall I do to inherit eternal life.*'),
  ('luke', 10, 33, '2-kings', 17, 24, 4, E'*But a certain Samaritan, as he journeyed, came where he was.* The Samaritans were the mixed-population the Assyrian king resettled in the territory of the divorced northern kingdom — *And the king of Assyria brought men from Bavel (Babylon), and from Cuthah... and placed them in the cities of Shomron (Samaria) instead of the children of Yashar''el (Israel).* The territory the Samaritan walks in is the territory of the scattered northern tribes, not a Gentile region in the inclusion-gospel sense.'),
  ('luke', 10, 33, 'john', 4, 9, 5, E'*Then saith the woman of Shomron (Samaria) unto him, How is it that thou, being a Yahudi (Jew), askest drink of me, which am a woman of Shomron (Samaria)? for the Yahudim (Jews) have no dealings with the Samaritans.* The Yochanan (John) 4 Samaritan-woman episode names the same Yahudi / Samaritan distance the parable walks against. The King''s pattern across both gospels is to use Samaritan figures as unexpected witnesses to the Torah''s heart.'),
  ('luke', 10, 34, 'hosea', 6, 6, 6, E'*And went to him, and bound up his wounds, pouring in oil and wine.* The mercy walked out is the same mercy-not-sacrifice substance of Hoshea (Hosea) 6:6 — the priest and the Levite walked past because their system was sacrifice-without-mercy; the Samaritan walked into mercy and so walked into what Yahuah desired.'),
  ('luke', 10, 37, 'micah', 6, 8, 7, E'*Go, and do thou likewise.* The verdict is the Mikhah (Micah) 6:8 walked-out — *what doth Yahuah (the LORD) require of thee, but to do justly, and to love mercy, and to walk humbly with thy Elohaykah (thy God)?* Not a new law; the Torah''s own answer the lawyer was avoiding.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:good-samaritan-as-scattered-northern-witness-not-gentile-inclusion-paradigm | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'good-samaritan-as-scattered-northern-witness-not-gentile-inclusion-paradigm'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:good-samaritan-as-scattered-northern-witness-not-gentile-inclusion-paradigm | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: martha-and-mary-the-one-thing-needful-the-word-heard (B.5, sort 1225)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'martha-and-mary-the-one-thing-needful-the-word-heard',
    E'Martha and Mary — the one thing needful, the Word heard at his feet',
    E'Luke alone carries this episode. *And she had a sister called Mary, which also sat at Yahusha''s (Jesus''s) feet, and heard his word* (Luke 10:39). Martha''s complaint — *Lord, dost thou not care that my sister hath left me to serve alone?* (Luke 10:40) — gets the gentle answer: *Martha, Martha, thou art careful and troubled about many things: but one thing is needful: and Mary hath chosen that good part, which shall not be taken away from her* (Luke 10:41-42). The Word heard at the feet is the substance — the same hearing-of-the-Shepherd''s-voice (Yochanan/John 10:27) that reveals what the Father had already placed. Mary''s posture pre-figures the Acts 22:3 *brought up at the feet of Gamliel (Gamaliel)* discipleship-posture but lands it on the King''s own feet. The framework substance: the *one thing needful* is the same hearing-precedes-walking architecture — Mosheh (Moses) at Devarim (Deuteronomy) 6:4-6 was already saying the words *shall be in thine heart,* and *thou shalt hear* before *thou shalt do.* Martha was at piece-#2 of the framework before she had let piece-#1 land.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1225
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 10 AND sv.verse_number = 38
   AND ev.book_slug = 'luke' AND ev.chapter_number = 10 AND ev.verse_number = 42
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 10, 39, 'deuteronomy', 6, 4, 1, E'*Sat at Yahusha''s (Jesus''s) feet, and heard his word.* The hearing-at-the-feet is the Shema-posture: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (the LORD our God), Yahuah (LORD) is one. And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart.* Hearing is the Torah''s own first verb; Mary walks it.'),
  ('luke', 10, 40, 'luke', 8, 21, 2, E'Martha''s *much serving* and the question of who is doing the Father''s will — the same Lukan substance at Luke 8:21 (*my mother and my brethren are these which hear the word of Elohim (God), and do it*) names hearing-before-doing as the Father''s order, not doing-before-hearing.'),
  ('luke', 10, 42, 'psalms', 27, 4, 3, E'*One thing is needful.* The Tehillim (Psalm) 27:4 *one thing have I desired of Yahuah (the LORD), that will I seek after; that I may dwell in the house of Yahuah (the LORD) all the days of my life, to behold the beauty of Yahuah (the LORD)* — the David-posture Mary is walking into without naming it.'),
  ('luke', 10, 42, 'john', 6, 68, 4, E'The *good part which shall not be taken away from her* is the same eternal-life-as-hearing-the-Word substance Kefa (Peter) names at Yochanan (John) 6:68 — *Lord, to whom shall we go? thou hast the words of eternal life* — vocative-Lord-to-Yahusha (preserve as *Lord* per S182 NT-Lord rule).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:martha-and-mary-the-one-thing-needful-the-word-heard | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'martha-and-mary-the-one-thing-needful-the-word-heard'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:martha-and-mary-the-one-thing-needful-the-word-heard | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: parable-of-the-rich-fool-laying-up-treasure-not-toward-elohim (B.6, sort 1226)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'parable-of-the-rich-fool-laying-up-treasure-not-toward-elohim',
    E'The parable of the rich fool — laying up treasure for self, not rich toward Elohim',
    E'Luke alone carries this parable. A man in the crowd asks the King to settle an inheritance dispute; the King answers with the warning — *Take heed, and beware of covetousness: for a man''s life consisteth not in the abundance of the things which he possesseth* (Luke 12:15) — and then the parable: the rich man whose ground brought forth plentifully, who pulls down his barns to build greater, who says to his soul *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19), and to whom Elohim (God) says *Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The verdict — *So is he that layeth up treasure for himself, and is not rich toward Elohim (God)* (Luke 12:21) — pairs with the broader treasure-in-heaven catena of Matthew 6 / Luke 12:33-34. Framework-substance: the rich-fool is the wisdom-stream''s standing target (Qohelet/Ecclesiastes 2''s *I made me great works* register, Tehillim 49''s *they that trust in their wealth*, Sirach 11:18-19''s near-identical parable). The post-harvest sifting tests fruit, and *much goods laid up* is not fruit.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1226
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 12 AND sv.verse_number = 13
   AND ev.book_slug = 'luke' AND ev.chapter_number = 12 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 12, 15, 'ecclesiastes', 5, 10, 1, E'*A man''s life consisteth not in the abundance of the things which he possesseth.* The Qohelet (Ecclesiastes) 5:10 substance — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.*'),
  ('luke', 12, 19, 'ecclesiastes', 8, 15, 2, E'*Take thine ease, eat, drink, and be merry.* The Qohelet (Ecclesiastes) 8:15 surface-formula *a man hath no better thing under the sun, than to eat, and to drink, and to be merry* — Qohelet''s own bracketing question the rich fool collapses into a closed answer. The rich fool reads Qohelet''s *under the sun* register and forgets the *fear Elohim (God), and keep his commandments* that closes the book.'),
  ('luke', 12, 20, 'job', 27, 8, 3, E'*Thou fool, this night thy soul shall be required of thee.* Iyov (Job) 27:8 — *For what is the hope of the hypocrite, though he hath gained, when Eloah (God) taketh away his soul?* The same architecture: the gain accumulated, the soul taken, the gain unused.'),
  ('luke', 12, 20, 'psalms', 49, 6, 4, E'The rich fool is the Tehillim (Psalm) 49 type — *They that trust in their wealth, and boast themselves in the multitude of their riches; none of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him.*'),
  ('luke', 12, 20, 'psalms', 49, 17, 5, E'*Then whose shall those things be, which thou hast provided?* The Tehillim (Psalm) 49:17 answer — *For when he dieth he shall carry nothing away: his glory shall not descend after him.* The barns get pulled down; the soul gets required; the goods get inherited by someone else.'),
  ('luke', 12, 21, 'matthew', 6, 20, 6, E'*So is he that layeth up treasure for himself, and is not rich toward Elohim (God).* The verdict ties straight into the Matthew 6:19-21 *lay not up for yourselves treasures upon earth... but lay up for yourselves treasures in heaven* — and into Luke 12:33-34 the very next pericope where the King names the same substance.'),
  ('luke', 12, 21, 'luke', 12, 33, 7, E'Luke''s own internal parallel — *Sell that ye have, and give alms; provide yourselves bags which wax not old, a treasure in the heavens that faileth not.* The rich-fool is the negative example; vv.33-34 is the positive instruction. The two pericopes are one substance.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:parable-of-the-rich-fool-laying-up-treasure-not-toward-elohim | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'parable-of-the-rich-fool-laying-up-treasure-not-toward-elohim'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:parable-of-the-rich-fool-laying-up-treasure-not-toward-elohim | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: yochanans-question-from-prison-and-the-isaiah-35-and-61-messianic-credential-catalog (B.7, sort 1227)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'yochanans-question-from-prison-and-the-isaiah-35-and-61-messianic-credential-catalog',
    E'Yochanan''s (John''s) question from prison and the Yeshayahu (Isaiah) 35 / 61 messianic-credential catalog',
    E'Synoptic with Matthew 11:2-6, but Luke positions the question right after the Nain raising — Yochanan (John)''s disciples are watching the credentials accumulate, and the King''s answer is the deliberate quotation of the messianic-age catalog the prophets had already written down. *Go your way, and tell Yochanan (John) what things ye have seen and heard; how that the blind see, the lame walk, the lepers are cleansed, the deaf hear, the dead are raised, to the poor the gospel is preached* (Luke 7:22). The catalog is a fused citation from Yeshayahu (Isaiah) 26:19, 29:18-19, 35:5-6, 42:7, and 61:1. The King is handing Yochanan''s disciples the answer the prophets had already given to *art thou he that should come?* — and lands it with the framework-relevant *blessed is he, whosoever shall not be offended in me* (Luke 7:23). The credential is the Tanakh''s own credential walking; the offense is the failure to recognize the credential when it walks.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1227
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 7 AND sv.verse_number = 18
   AND ev.book_slug = 'luke' AND ev.chapter_number = 7 AND ev.verse_number = 23
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 7, 22, 'isaiah', 35, 5, 1, E'*The blind see, the lame walk, the lepers are cleansed, the deaf hear, the dead are raised, to the poor the gospel is preached.* The catalog opens straight into Yeshayahu (Isaiah) 35:5-6: *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped. Then shall the lame man leap as an hart, and the tongue of the dumb sing.* The messianic-age catalog the prophet wrote, the King fulfills in front of Yochanan''s (John''s) disciples.'),
  ('luke', 7, 22, 'isaiah', 35, 6, 2, E'The full Yeshayahu (Isaiah) 35:6 ties — the lame leaping, the tongue of the dumb singing — the catalog the King answers Yochanan (John) with.'),
  ('luke', 7, 22, 'isaiah', 61, 1, 3, E'*To the poor the gospel is preached.* The Yeshayahu (Isaiah) 61:1 line — *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (the LORD) hath anointed me to preach good tidings unto the meek* — the credential the King had already quoted in the Natsareth (Nazareth) synagogue at Luke 4:18.'),
  ('luke', 7, 22, 'isaiah', 29, 18, 4, E'*And in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity, and out of darkness.* The Yeshayahu (Isaiah) 29:18 supplemental to the catalog the King''s answer is built from.'),
  ('luke', 7, 22, 'isaiah', 26, 19, 5, E'*Thy dead men shall live.* The dead-raised credential the King names — the same substance the Nain widow''s son walked out of in the previous pericope.'),
  ('luke', 7, 22, 'luke', 4, 18, 6, E'The Natsareth (Nazareth)-sermon-citation at Luke 4:18 — the King had already named Yeshayahu (Isaiah) 61 as his credential at the start of the gospel. The answer to Yochanan (John) is the closing-of-the-loop: the credentials he named in Natsareth are the credentials his works are now demonstrating.'),
  ('luke', 7, 23, 'john', 6, 61, 7, E'*Blessed is he, whosoever shall not be offended in me.* The framework''s offense-of-the-Word substance — the offense at the King is the offense at the gathering of the seed-of-promise on the King''s own terms, not the system''s. The same offense surfaces at Yochanan (John) 6:61 where many disciples turn back.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:yochanans-question-from-prison-and-the-isaiah-35-and-61-messianic-credential-catalog | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'yochanans-question-from-prison-and-the-isaiah-35-and-61-messianic-credential-catalog'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:yochanans-question-from-prison-and-the-isaiah-35-and-61-messianic-credential-catalog | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 13: woes-against-the-pharisees-and-lawyers-at-the-pharisees-table (B.9, sort 1228)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'woes-against-the-pharisees-and-lawyers-at-the-pharisees-table',
    E'Woes against the Pharisees and lawyers at the Pharisee''s table — the Luke 11 woes register',
    E'Synoptic substance with Matthew 23, but Luke positions the woes inside a meal at a Pharisee''s house — the King eats with them, then names what the system is. *Woe unto you, Pharisees! for ye tithe mint and rue and all manner of herbs, and pass over judgment and the love of Elohim (God): these ought ye to have done, and not to leave the other undone* (Luke 11:42). The framework''s contrary-to-Torah test walks straight: *these ought ye to have done* — the tithing of herbs Torah does name — *and not to leave the other undone* — judgment and love-of-Elohim Torah names with more weight. The Pharisaic system voids Torah by addition (the fences) and by subtraction (the heart). Luke adds the lawyer''s protest — *Master, thus saying thou reproachest us also* (Luke 11:45) — and the King''s *Woe unto you also, ye lawyers! for ye lade men with burdens grievous to be borne* (Luke 11:46). The framework-major diagnostic of the Judaizer Error is operating in front of the reader: the system that wears Torah''s robes and builds a parallel Torah on top that contradicts the original.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1228
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 11 AND sv.verse_number = 37
   AND ev.book_slug = 'luke' AND ev.chapter_number = 11 AND ev.verse_number = 54
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 11, 42, 'matthew', 23, 23, 1, E'*Woe unto you, Pharisees! for ye tithe mint and rue and all manner of herbs, and pass over judgment and the love of Elohim (God).* The synoptic parallel at Matthew 23:23 — the same tithing-of-herbs-while-passing-over-weightier-matters diagnostic.'),
  ('luke', 11, 42, 'micah', 6, 8, 2, E'*Pass over judgment and the love of Elohim (God).* The Mikhah (Micah) 6:8 substance the Pharisaic system was passing over — *to do justly, and to love mercy, and to walk humbly with thy Elohayka (thy God).*'),
  ('luke', 11, 44, 'numbers', 19, 16, 3, E'*Ye are as graves which appear not, and the men that walk over them are not aware of them.* The Bamidbar (Numbers) 19:16 substance — *whosoever toucheth one that is slain... or a grave, shall be unclean seven days.* The Pharisaic system, while claiming to be the clean ones, is the very source of the contaminating-uncleanness those who walk over them did not know they were touching.'),
  ('luke', 11, 46, 'matthew', 23, 4, 4, E'*Ye lade men with burdens grievous to be borne, and ye yourselves touch not the burdens with one of your fingers.* The synoptic parallel — the fences the system builds on top of Torah and refuses to bear themselves.'),
  ('luke', 11, 49, '2-chronicles', 24, 21, 5, E'*I will send them prophets and apostles, and some of them they shall slay and persecute.* The same prophetic-martyrdom register the King names — from Hevel (Abel) at Bereshit (Genesis) 4 to Zekharyah (Zechariah) at 2 Chronicles 24:21 (the last martyr in the Hebrew canon''s order), the system''s killing-the-prophets is the same architecture in every generation.'),
  ('luke', 11, 51, 'genesis', 4, 10, 6, E'*From the blood of Hevel (Abel) unto the blood of Zekharyah (Zechariah).* The Bereshit (Genesis) 4:10 ground-crying-out substance walked forward across the entire Tanakh-witness of prophet-martyrdoms.'),
  ('luke', 11, 52, 'matthew', 23, 13, 7, E'*Woe unto you, lawyers! for ye have taken away the key of knowledge: ye entered not in yourselves, and them that were entering in ye hindered.* The synoptic parallel at Matthew 23:13 — the *shutting up the kingdom of heaven against men* substance, locking the door from the outside.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:woes-against-the-pharisees-and-lawyers-at-the-pharisees-table | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'woes-against-the-pharisees-and-lawyers-at-the-pharisees-table'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:woes-against-the-pharisees-and-lawyers-at-the-pharisees-table | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 14: except-ye-repent-ye-shall-all-likewise-perish-the-luke-13-warning-against-the-judgment-by-disaster-misreading (C.1, sort 1229)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'except-ye-repent-ye-shall-all-likewise-perish-the-luke-13-warning-against-the-judgment-by-disaster-misreading',
    E'Except ye repent ye shall all likewise perish — the Luke 13:1-5 warning against the disaster-as-divine-judgment misreading',
    E'Lukan-specific. Luke 13:1-5 carries a framework-major teaching the inherited pulpit consistently mishandles. Pilate had mingled the blood of certain Galileans with their sacrifices; eighteen had died when the tower of Siloam fell. The crowd is reaching for the inherited reading — *they must have been worse sinners than the rest.* The King refuses the reading twice: *Suppose ye that these Galileans were sinners above all the Galileans, because they suffered such things? I tell you, Nay: but, except ye repent, ye shall all likewise perish... think ye that they were sinners above all men that dwelt in Yerushalayim (Jerusalem)? I tell you, Nay: but, except ye repent, ye shall all likewise perish.* The disaster is not the diagnostic. The *all likewise perish* is the post-harvest-sifting language Yechezk''el (Ezekiel) 20:33-38 carries — the wheat-warning, not the tare-burning. The perished are not categorical-tares; they are the unfruitful-wheat at the post-harvest sifting. FRAMEWORK-MAJOR. Iyov (Job)''s friends preached the same misreading the crowd reaches for; the King refuses it the same way the wisdom-stream refused it through Iyov''s mouth.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1229
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 1
   AND ev.book_slug = 'luke' AND ev.chapter_number = 13 AND ev.verse_number = 5
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 13, 1, 'job', 1, 21, 1, E'Iyov (Job)''s friends will preach the same misreading the crowd at Luke 13:1 is reaching for — that suffering proves prior sin. Iyov refused it; the King refuses it. The disaster is not the diagnostic.'),
  ('luke', 13, 3, 'matthew', 7, 22, 2, E'The *except ye repent ye shall all likewise perish* warning is the wheat-warning the framework holds — same substance as *Many will say to me in that day, Lord, Lord* — the post-harvest sifting tests the wheat, not the tares.'),
  ('luke', 13, 3, 'ezekiel', 18, 21, 3, E'*But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* — the repentance the King calls for at Luke 13:3 is the Tanakh''s own repentance-architecture, return to the Father AND to his ways.'),
  ('luke', 13, 1, 'john', 9, 2, 4, E'The disciples ask of the man born blind: *who did sin, this man, or his parents, that he was born blind?* The King refuses the same diagnostic in Yochanan (John) 9 that he refuses in Luke 13. Disaster and disability are not the diagnostic.'),
  ('luke', 13, 4, 'ezekiel', 20, 38, 5, E'The tower-of-Siloam dead were not worse-sinners-than-the-rest. The *all likewise perish* is the post-harvest-sifting language Yechezk''el (Ezekiel) carries — *I will purge out from among you the rebels, and them that transgress against me.* Sifting within the gathered.'),
  ('luke', 13, 5, 'matthew', 7, 21, 6, E'*Not every one that saith unto me, Lord, Lord, shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* Same standing-test the King names — repentance is the doing of the Father''s will, not the saying of his name.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:except-ye-repent-ye-shall-all-likewise-perish-the-luke-13-warning-against-the-judgment-by-disaster-misreading | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'except-ye-repent-ye-shall-all-likewise-perish-the-luke-13-warning-against-the-judgment-by-disaster-misreading'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:except-ye-repent-ye-shall-all-likewise-perish-the-luke-13-warning-against-the-judgment-by-disaster-misreading | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 15: daughter-of-avraham-bent-over-eighteen-years-and-the-shabbat-loosing-of-the-covenant-bound (C.2, sort 1230)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'daughter-of-avraham-bent-over-eighteen-years-and-the-shabbat-loosing-of-the-covenant-bound',
    E'The daughter of Avraham (Abraham) bent over eighteen years and the Shabbat-loosing of the covenant-bound',
    E'Luke-specific. The synagogue healing of the woman bent over eighteen years is structured around two framework-substantial moves: (1) the King calls her *daughter of Avraham (Abraham)* BEFORE he calls her bent-over woman — covenant-lineage named first, identity-of-the-seed restored before the body is straightened; (2) the Shabbat-loosing-of-bonds register is the heart-shabbat the framework restores against the Pharisaic-fence. The eighteen years carries the recurring covenant-oppression duration (Shoftim/Judges 3:14 — Yashar''el (Israel) served Eglon king of Moav (Moab) eighteen years). The synagogue-ruler''s appeal to *six days in which men ought to work* (Luke 13:14) is the literal-Torah text he twists into Pharisaic-fence-keeping; the King restores the day to its purpose. *Ought not this woman, being a daughter of Avraham (Abraham), whom satan hath bound, lo, these eighteen years, be loosed from this bond on the sabbath day?* (v.16) — the covenant-seed-lineage Bereshit (Genesis) 17:7 establishes is named first.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1230
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 13 AND sv.verse_number = 10
   AND ev.book_slug = 'luke' AND ev.chapter_number = 13 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 13, 11, 'judges', 3, 14, 1, E'*So the children of Yashar''el (Israel) served Eglon the king of Moav (Moab) eighteen years* — the eighteen-year bondage as the recurring covenant-oppression duration. The bent-over woman''s eighteen years carries the same compressed-witness to the covenant-people-bound-by-the-enemy substance.'),
  ('luke', 13, 12, 'isaiah', 61, 1, 2, E'*The Spirit of Yahuah (the Lord) is upon me... to proclaim liberty to the captives, and the opening of the prison to them that are bound* — the Yeshayahu (Isaiah) 61:1 liberty-to-the-captives substance is what the loosing-of-the-bent-over-woman walks. The Natsareth (Nazareth) sermon credential applied to a real bound-daughter.'),
  ('luke', 13, 14, 'exodus', 20, 8, 3, E'*Remember the sabbath day, to keep it holy... Six days shalt thou labour, and do all thy work* — the synagogue-ruler''s appeal to *six days in which men ought to work* (Luke 13:14) is the literal-Torah text he twists into Pharisaic-fence-keeping. The King restores the day to its purpose.'),
  ('luke', 13, 15, 'mark', 2, 27, 4, E'*The sabbath was made for man, and not man for the sabbath* — the King''s heart-shabbat answer to the Pharisaic fence: every man looses his ox or his ass on the Shabbat to water it; ought not this daughter of Avraham (Abraham) be loosed?'),
  ('luke', 13, 16, 'genesis', 17, 7, 5, E'*And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee* — the *daughter of Avraham (Abraham)* identification at Luke 13:16 is the covenant-seed-lineage Bereshit (Genesis) 17 establishes. She is identified by her father-in-the-covenant before she is identified by her bent-over condition.'),
  ('luke', 13, 11, '2-corinthians', 12, 7, 6, E'*Lest I should be exalted above measure through the abundance of the revelations, there was given to me a thorn in the flesh, the messenger of satan to buffet me* — Paul''s own naming of satanic-affliction-of-the-covenant-faithful. The framework holds: the enemy binds, the King looses; the affliction does not erase the covenant-identity, and the loosing belongs to the King.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:daughter-of-avraham-bent-over-eighteen-years-and-the-shabbat-loosing-of-the-covenant-bound | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'daughter-of-avraham-bent-over-eighteen-years-and-the-shabbat-loosing-of-the-covenant-bound'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:daughter-of-avraham-bent-over-eighteen-years-and-the-shabbat-loosing-of-the-covenant-bound | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 16: lowest-seat-and-the-recompense-at-the-resurrection-of-the-just (C.3, sort 1231)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'lowest-seat-and-the-recompense-at-the-resurrection-of-the-just',
    E'The lowest seat at the wedding and the recompense at the resurrection of the just',
    E'Lukan-specific. Two paired teachings at the Pharisee-ruler''s table — (a) the lowest-seat parable for the invited guests, (b) the invite-the-poor teaching for the host. The architecture is the kingdom-inversion the framework holds — the humble are exalted, the proud are abased; the recompense is at the resurrection-of-the-just, not in this age. Verse 14 names the resurrection-of-the-just explicitly — the first resurrection (Revelation 20:6) Paul confirms at 1 Thessalonians 4:16 (*the dead in Mashiach shall rise first*). Tanakh-anchor at Mishlei (Proverbs) 25:6-7 — *Put not forth thyself in the presence of the king, and stand not in the place of great men: For better it is that it be said unto thee, Come up hither.* The King is teaching from the wisdom-stream the table-guests should already know.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1231
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 14 AND sv.verse_number = 7
   AND ev.book_slug = 'luke' AND ev.chapter_number = 14 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 14, 7, 'proverbs', 25, 6, 1, E'*Put not forth thyself in the presence of the king, and stand not in the place of great men: For better it is that it be said unto thee, Come up hither; than that thou shouldest be put lower in the presence of the prince* — the direct Tanakh-source of the lowest-seat parable, in proverb-form. The King is teaching from the wisdom-stream the table-guests should already know.'),
  ('luke', 14, 11, 'matthew', 23, 12, 2, E'*And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* — the same kingdom-inversion the King teaches in the woes against the scribes-and-Pharisees. Same substance, different setting.'),
  ('luke', 14, 13, 'deuteronomy', 14, 29, 3, E'*And the Levite, (because he hath no part nor inheritance with thee,) and the stranger, and the fatherless, and the widow, which are within thy gates, shall come, and shall eat and be satisfied; that Yahuah (the LORD) thy Elohim (God) may bless thee in all the work of thine hand which thou doest* — the Devarim (Deuteronomy) 14:29 invite-the-poor substance the King walks into the supper-host teaching.'),
  ('luke', 14, 14, 'revelation', 20, 6, 4, E'*Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power* — the resurrection-of-the-just register the King names is the first-resurrection of Revelation 20:6.'),
  ('luke', 14, 14, '1-thessalonians', 4, 16, 5, E'*And the dead in Mashiach (Christ) shall rise first* — Paul''s witness to the first-resurrection register the King names at Luke 14:14.'),
  ('luke', 14, 11, 'james', 4, 10, 6, E'*Humble yourselves in the sight of Yahuah (the Lord), and he shall lift you up* — the same kingdom-inversion the framework names across the apostolic witness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:lowest-seat-and-the-recompense-at-the-resurrection-of-the-just | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'lowest-seat-and-the-recompense-at-the-resurrection-of-the-just'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:lowest-seat-and-the-recompense-at-the-resurrection-of-the-just | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 17: the-great-supper-and-the-bidden-who-refuse-and-the-gathering-from-highways-and-hedges (C.4, sort 1232)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-great-supper-and-the-bidden-who-refuse-and-the-gathering-from-highways-and-hedges',
    E'The great supper and the bidden who refuse — the gathering from highways and hedges as the scattered-seed homecoming',
    E'Lukan-version of the wedding-banquet substance (compare Matthew 22:1-14, different parable, similar architecture). Three movements: (1) the bidden-who-make-excuse — the bought-a-field, bought-five-yoke-of-oxen, married-a-wife refusers, (2) the streets-and-lanes-of-the-city gathering of the poor-maimed-halt-blind, (3) the highways-and-hedges compelling-in to fill the house. FRAMEWORK-MAJOR. Framework reading: the bidden-who-refuse are the leadership-of-the-house-of-Yahudah (Judah) who heard the call FIRST and refused — *He came unto his own, and his own received him not* (Yochanan/John 1:11). The streets-and-lanes gathering is the marginalized-within-the-covenant-territory. The highways-and-hedges compelling-in is the wide-proclamation across the territories of the scattered-seed-of-Ephraim — the lost-sheep of the house of Yashar''el (Israel) being gathered from the nations of their dispersion. Yechezk''el (Ezekiel) 37:21 *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side.* This is NOT the inherited Gentile-inclusion-by-confession parable; this is the prophetic-gathering of the scattered house. The *that my house may be filled* (v.23) is the same fullness-of-the-gathered-elect substance Romans 11:25 carries — *until the fulness of the Gentiles (the scattered-seed) be come in*.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1232
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 14 AND sv.verse_number = 15
   AND ev.book_slug = 'luke' AND ev.chapter_number = 14 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 14, 16, 'john', 1, 11, 1, E'*He came unto his own, and his own received him not* — the bidden-who-refuse-the-supper IS the leadership-of-his-own who heard the call first and refused. Same substance.'),
  ('luke', 14, 21, 'matthew', 22, 9, 2, E'*Go ye therefore into the highways, and as many as ye shall find, bid to the marriage* — the parallel wedding-banquet parable carries the same gathering-from-the-edges substance. Two parables, one architecture.'),
  ('luke', 14, 21, 'isaiah', 35, 5, 3, E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped. Then shall the lame man leap as an hart* — the poor-maimed-halt-blind of the streets-and-lanes is the same messianic-age catalog the King fulfills throughout the gospel. The supper is the messianic-feast.'),
  ('luke', 14, 23, 'ezekiel', 37, 21, 4, E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* — the highways-and-hedges gathering at Luke 14:23 is the prophetic-gathering of the scattered seed from the territories of dispersion. Same substance.'),
  ('luke', 14, 24, 'matthew', 22, 8, 5, E'*Then saith he to his servants, The wedding is ready, but they which were bidden were not worthy* — the bidden-not-worthy declaration carries through both parables. Cross-witness.'),
  ('luke', 14, 21, 'luke', 4, 18, 6, E'*He hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind* — the Natsareth-sermon credentials map onto the streets-and-lanes guests. The supper-host''s gathering IS the King''s mission scope walked out.'),
  ('luke', 14, 23, 'romans', 11, 25, 7, E'*That blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* — *the fulness* (plērōma) is the same *that my house may be filled* substance. Paul reading the gathering forward — NOT the categorical-Gentile-inclusion completion the inherited reading collapses it into. The fulness is the full-number of the scattered seed gathered home from the territories of dispersion; when that gathering is complete, the *until* lands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-great-supper-and-the-bidden-who-refuse-and-the-gathering-from-highways-and-hedges | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-great-supper-and-the-bidden-who-refuse-and-the-gathering-from-highways-and-hedges'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-great-supper-and-the-bidden-who-refuse-and-the-gathering-from-highways-and-hedges | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 18: count-the-cost-tower-builder-king-going-to-war-and-the-disciple-who-forsakes-not-all-he-hath (C.5, sort 1233)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'count-the-cost-tower-builder-king-going-to-war-and-the-disciple-who-forsakes-not-all-he-hath',
    E'Count the cost — the tower-builder, the king going to war, and the disciple who forsakes not all he hath',
    E'Lukan-specific paired-parables on the cost of discipleship. Two illustrations — the tower-builder who sits down first to count the cost and the king going to war who consults whether he can meet ten thousand with twenty thousand — bracketing the *whosoever he be of you that forsaketh not all that he hath, he cannot be my disciple* (v.33). Framework reading: the cost-of-discipleship is NOT the cost-of-entering-the-kingdom (the kingdom is given by the Father''s decree, not earned) — the cost is the cost-of-walking-the-disciple-life. The hating-father-and-mother register (v.26) is the Hebrew idiom for relative-preference, the kinship-redefinition the King walks across the gospels. Mishlei (Proverbs) 24:27 — *Prepare thy work without, and make it fit for thyself in the field; and afterwards build thine house* — is the wisdom-stream''s count-the-cost-before-building substance the King teaches from.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1233
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 14 AND sv.verse_number = 25
   AND ev.book_slug = 'luke' AND ev.chapter_number = 14 AND ev.verse_number = 33
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 14, 26, 'deuteronomy', 33, 9, 1, E'*Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren* — the Devarim (Deuteronomy) 33:9 Levitical-preference language is the Hebrew idiom the King''s *hate not his father and mother* picks up. Not literal-hatred; relative-preference: the King above the kin.'),
  ('luke', 14, 26, 'matthew', 19, 29, 2, E'*And every one that hath forsaken houses, or brethren, or sisters, or father, or mother, or wife, or children, or lands, for my name''s sake, shall receive an hundredfold* — the discipleship-cost-and-the-hundredfold-recompense the framework holds. The cost is real; the recompense is realer.'),
  ('luke', 14, 27, 'matthew', 10, 38, 3, E'*And he that taketh not his cross, and followeth after me, is not worthy of me* — the bearing-the-cross discipleship-cost the King teaches across the gospels. Cross-witness.'),
  ('luke', 14, 28, 'proverbs', 24, 27, 4, E'*Prepare thy work without, and make it fit for thyself in the field; and afterwards build thine house* — the wisdom-stream''s count-the-cost-before-building substance. The King is teaching from the proverb-discipline.'),
  ('luke', 14, 33, 'philippians', 3, 8, 5, E'*Yea doubtless, and I count all things but loss for the excellency of the knowledge of HaMashiach Yahusha (Christ Jesus) my Lord: for whom I have suffered the loss of all things* — Paul''s own walking of the *forsake all that he hath* discipleship-cost the King names.'),
  ('luke', 14, 33, 'luke', 18, 22, 6, E'*Sell all that thou hast, and distribute unto the poor, and thou shalt have treasure in heaven: and come, follow me* — the same forsake-all substance the King speaks to the rich-young-ruler at Luke 18:22.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:count-the-cost-tower-builder-king-going-to-war-and-the-disciple-who-forsakes-not-all-he-hath | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'count-the-cost-tower-builder-king-going-to-war-and-the-disciple-who-forsakes-not-all-he-hath'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:count-the-cost-tower-builder-king-going-to-war-and-the-disciple-who-forsakes-not-all-he-hath | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 19: lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property (C.6, sort 1234)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property',
    E'The lost coin — the recovery of what was always the King''s image-bearing property',
    E'Lukan-specific middle-parable of the three-lost-parables. The lost coin (drachma) carries a substance the lost-sheep parable does not — the coin is MINTED with the King''s image and stamped with his inscription. Its identity is intrinsic; its loss does not change what it IS. The woman''s diligent searching (lighting a candle, sweeping the house, seeking diligently till she finds it) IS the King''s mission to the scattered. FRAMEWORK-MAJOR. Framework reading: the coin was always covenant-property — image-stamped, name-inscribed, never not-a-coin even when lost. The recovery is recovery of what was always-the-King''s, NOT inclusion of what was never-his. The Christian-inclusion-gospel cannot carry this parable cleanly because the coin is not made-a-coin by the finding; the coin only becomes-findable by the seeking. This is the Bereshit (Genesis) 1:26-27 image-of-Elohim substance read into the gathering-architecture: the seed-of-Adam carries the image; the lost-coin carries the image-stamp; the lost-sheep-of-the-house carries the covenant-lineage. Three witnesses to one substance. Aligns with the *my sheep hear my voice, hearing reveals what was true before the foundation* architecture (Yochanan/John 10:27, Revelation 13:8, 17:8). The Hoshea (Hosea) 1:10 *ye are the sons of the living Elohim (God)* Lo-Ammi-reversal IS the substance the recovery announces; Yechezk''el (Ezekiel) 34:11-12 *I, even I, will both search my sheep, and seek them out* is the King''s own seeking-of-the-scattered the parable walks.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1234
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 8
   AND ev.book_slug = 'luke' AND ev.chapter_number = 15 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 15, 8, 'genesis', 1, 26, 1, E'*And Elohim (God) said, Let us make man in our image, after our likeness* — the image-of-Elohim stamp on the seed-of-Adam carries the same identity-by-imprint substance the lost-coin holds. The coin is what it is because of what is stamped on it.'),
  ('luke', 15, 8, 'matthew', 22, 20, 2, E'*And he saith unto them, Whose is this image and superscription? They say unto him, Caesar''s. Then saith he unto them, Render therefore unto Caesar the things which are Caesar''s; and unto Elohim (God) the things that are Elohim''s* — the render-unto-Caesar substance names the same recognition-by-imprint architecture the lost-coin parable holds.'),
  ('luke', 15, 8, 'revelation', 13, 8, 3, E'*And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world* — the names-written-from-the-foundation architecture carries the same identity-precedes-finding substance the lost-coin parable holds.'),
  ('luke', 15, 10, 'john', 10, 27, 4, E'*My sheep hear my voice, and I know them, and they follow me* — the same hearing-reveals-not-creates substance: the coin is found because it was always covenant-property; the sheep is found because it was always-a-sheep.'),
  ('luke', 15, 9, 'hosea', 1, 10, 5, E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* — the recovery-of-what-was-always-covenant the lost-coin parable carries. The Lo-Ammi-reversal of Hoshea (Hosea) 1:10 is the substance of the woman''s rejoicing when the coin is found.'),
  ('luke', 15, 10, 'ezekiel', 34, 11, 6, E'*Behold, I, even I, will both search my sheep, and seek them out. As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep* (Yechezk''el/Ezekiel 34:11-12) — the King''s own seeking-of-the-scattered substance, three parables in one passage at Luke 15. The lost-coin''s diligent-searching IS this Yechezk''el seeking walked into the woman''s house.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:lost-coin-the-recovery-of-what-was-always-the-kings-image-bearing-property | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 20: prodigal-son-and-the-elder-brother-the-two-house-gathering-of-ephraim-and-yahudah (C.7, sort 1235)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'prodigal-son-and-the-elder-brother-the-two-house-gathering-of-ephraim-and-yahudah',
    E'The prodigal son and the elder brother — the two-house gathering of Ephraim and Yahudah',
    E'Lukan-specific. The third and longest of the three-lost-parables, and the parable that carries the framework-major scattered-seed-architecture in its most complete narrative-form. Two sons, one father, one inheritance. The younger son takes his portion, goes into a far country, wastes his substance among the swine (the unclean-of-the-unclean), comes to himself in the famine, and returns. The father sees him *a great way off* and runs — the Hoshea (Hosea) 11:8 *how shall I give thee up, Ephraim?* compassion-language in flesh. The elder brother in the field, returning from his work, hears music-and-dancing, refuses to come in, complains *neither transgressed I at any time thy commandment*. The father pleads with him: *Son, thou art ever with me, and all that I have is thine. It was meet that we should make merry, and be glad: for this thy brother was dead, and is alive again; and was lost, and is found.* FRAMEWORK-MAJOR. Framework reading: (1) the younger-son is the scattered-house of Ephraim (the divorced-and-lost-among-the-nations) coming home — Hoshea (Hosea) 11:1-11, Yirmeyahu (Jeremiah) 31:9, 31:18-20, Yechezk''el (Ezekiel) 37:16-22; (2) the elder-brother is the house of Yahudah (Judah) who stayed in the father''s house, kept the form, and now resents the celebration over the gathered-prodigal-brother; (3) the father''s answer holds BOTH houses together as one family — *all that I have is thine* AND *this thy brother.* This is the two-sticks-becoming-one of Yechezk''el (Ezekiel) 37 in compressed parable-form. NOT a Gentile-inclusion parable; a scattered-seed-gathering-and-Yahudah-objection parable. The robe, the ring, the shoes, the fatted calf are the covenant-marks restored. The Hoshea 1:10 *ye are the sons of the living Elohim (God)* Lo-Ammi-reversal IS *this my son was dead, and is alive again; he was lost, and is found.*',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1235
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 15 AND sv.verse_number = 11
   AND ev.book_slug = 'luke' AND ev.chapter_number = 15 AND ev.verse_number = 32
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 15, 12, 'jeremiah', 31, 18, 1, E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah (the LORD) my Elohim (God)... Is Ephraim my dear son? is he a pleasant child?* — the Yirmeyahu (Jeremiah) 31:18-20 Ephraim-coming-home substance the prodigal walks. The younger son IS Ephraim taking his portion and going into the far country.'),
  ('luke', 15, 18, 'leviticus', 26, 40, 2, E'*If they shall confess their iniquity, and the iniquity of their fathers... then will I remember my covenant with Ya''aqov (Jacob), and also my covenant with Yitschaq (Isaac), and also my covenant with Avraham (Abraham) will I remember* — the prodigal''s repentance-speech IS the Vayikra (Leviticus) 26 covenant-confession architecture. The Father remembers the covenant when the scattered confess.'),
  ('luke', 15, 20, 'hosea', 11, 8, 3, E'*How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)? how shall I make thee as Admah? how shall I set thee as Tsevoim (Zeboim)? mine heart is turned within me, my repentings are kindled together* — the father''s *had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20) is the Hoshea (Hosea) 11:8 compassion-language of the Father over Ephraim in flesh.'),
  ('luke', 15, 24, 'hosea', 1, 10, 4, E'*And it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* — *this my son was dead, and is alive again; he was lost, and is found* IS the Lo-Ammi-to-Ammi declaration in parable-form. Hoshea (Hosea) cited at Romans 9:25-26 carries the same substance.'),
  ('luke', 15, 25, 'ezekiel', 37, 16, 5, E'The elder-brother''s objection to the welcome-home of the younger is the Yahudah-pattern objection to the gathering of the northern-house. Yechezk''el (Ezekiel) 37:16-22''s two-sticks-becoming-one is the framework''s answer: one father, one house, two sons-restored.'),
  ('luke', 15, 32, 'romans', 11, 17, 6, E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* — Paul''s olive-tree picks up the same Ephraim-and-Yahudah-as-one-tree substance the prodigal-and-elder-brother walk; the elder-brother''s objection is rebuked the way Paul rebukes Yahudaean-pride at Romans 11:18.'),
  ('luke', 15, 17, 'hosea', 11, 1, 7, E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt... I taught Ephraim also to go, taking them by their arms... I drew them with cords of a man, with bands of love* (Hoshea/Hosea 11:1-4) — the father-running-to-meet-the-returning-son carries the same drawing-with-cords-of-love substance. The Father''s pursuit of the scattered house is the architecture under the parable.'),
  ('luke', 15, 11, '1-john', 3, 1, 8, E'*Behold, what manner of love the Father hath bestowed upon us, that we should be called the sons of Elohim (God)* — the father-of-the-prodigal substance the apostolic-witness names. The Father runs; the manner of love is the running.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:prodigal-son-and-the-elder-brother-the-two-house-gathering-of-ephraim-and-yahudah | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'prodigal-son-and-the-elder-brother-the-two-house-gathering-of-ephraim-and-yahudah'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:prodigal-son-and-the-elder-brother-the-two-house-gathering-of-ephraim-and-yahudah | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 21: rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test (C.8, sort 1236)
-- VERIFIER DELTA: 1 Enoch 22:9-11 member-row REMOVED (extras quoted in summary_md only).
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test',
    E'The rich man and Lazaros — the framework-honest sheol with two compartments and the *they have Mosheh and the prophets* standing-test',
    E'Luke-specific. The parable that carries the framework''s most explicit witness to the sheol-with-two-compartments register the inherited soul-sleep doctrine and inherited eternal-conscious-torment doctrine BOTH misread. Lazaros — full of sores, laid at the rich-man''s gate, dogs licking the sores — dies and is carried by the angels into Avraham''s (Abraham''s) bosom. The rich man dies, is buried, lifts up his eyes in torments, and sees Avraham afar off and Lazaros in his bosom. *Between us and you there is a great gulf fixed* (v.26). The conscious-witness-between-death-and-resurrection register is here — the dead remember (the rich-man knows his five brethren), the dead see (across the gulf), the dead carry their identity (Lazaros is still Lazaros, the rich-man is still the rich-man). The framework holds the middle: sheol is real, conscious, two-compartmented, AND temporal pending the resurrection-and-judgment of Revelation 11:18 / Revelation 20:11-15. The inherited soul-sleep teaching erases this; the inherited eternal-conscious-torment teaching reads the torment-side as the final-eternal-destination rather than the pre-resurrection holding-state. FRAMEWORK-MAJOR. 1 Enoch 22:9-11 carries the same sheol-with-compartments witness (extras-quoted in summary; not a member-row per canon-edition scope). The closing test — *they have Mosheh (Moses) and the prophets; let them hear them. If they hear not Mosheh (Moses) and the prophets, neither will they be persuaded, though one rose from the dead* (vv.29, 31) — is the King''s own anti-antinomian standing-test fulfilled historically when Lazaros (a different Lazaros) is raised at John 11 and the chief priests seek to kill him. The rich-man''s brothers are five — five-fifths of Yahudah (Judah), the same leadership-of-the-house who refuses the resurrection of the King a chapter later.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1236
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 19
   AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 31
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 16, 22, 'genesis', 25, 8, 1, E'*Then Avraham (Abraham) gave up the ghost, and died in a good old age, an old man, and full of years; and was gathered to his people* — the *gathered to his people* register of the Tanakh names a real conscious-gathering, not annihilation. The bosom-of-Avraham (Abraham) at Luke 16:22 carries the same substance.'),
  ('luke', 16, 23, '1-samuel', 28, 13, 2, E'*And the king said unto her, Be not afraid: for what sawest thou? And the woman said unto Sha''ul (Saul), I saw elohim (gods) ascending out of the earth... And Sha''ul (Saul) perceived that it was Shemu''el (Samuel)* — the Tanakh-witness to conscious-existence in sheol. Shemu''el speaks; Sha''ul hears; the rich man and Lazaros walk the same architecture.'),
  ('luke', 16, 25, 'psalms', 49, 14, 3, E'*Like sheep they are laid in the grave; death shall feed on them; and the upright shall have dominion over them in the morning... But Elohim (God) will redeem my soul from the power of the grave (sheol): for he shall receive me* — the framework-witness to redemption-FROM-sheol for the righteous, the temporal-holding-state Lazaros is in pending the resurrection.'),
  ('luke', 16, 29, 'matthew', 5, 17, 4, E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* — *they have Mosheh (Moses) and the prophets; let them hear them* IS the King''s own anti-antinomian standing-test in compressed form. The Torah-and-prophets are sufficient; the standing-test is hearing.'),
  ('luke', 16, 31, 'john', 5, 46, 5, E'*For had ye believed Mosheh (Moses), ye would have believed me: for he wrote of me* — Yochanan (John) 5:46-47 carries the same Mosheh-and-the-prophets standing-test. The standing-test is hearing the Torah; the King is the substance the Torah testified of.'),
  ('luke', 16, 31, 'john', 11, 43, 6, E'*Lazaros, come forth... Then gathered the chief priests and the Pharisees a council, and said, What do we? for this man doeth many miracles. If we let him thus alone, all men will believe on him* — the literal-Lazaros-raised-from-the-dead at Yochanan (John) 11 is the historical-fulfillment of the Luke 16:31 parable''s prediction. The chief-priests sought to kill Lazaros (John 12:10) and did not believe; the test is fulfilled.'),
  ('luke', 16, 23, 'ezekiel', 32, 21, 7, E'*The strong among the mighty shall speak to him out of the midst of hell (sheol) with them that help him* — the conscious-speech-in-sheol register Yechezk''el (Ezekiel) 32:21 carries against the inherited soul-sleep misread. The dead speak; the parable assumes the architecture the Tanakh already named.'),
  ('luke', 16, 23, 'ecclesiastes', 9, 5, 8, E'*For the living know that they shall die: but the dead know not any thing* — the standing-test the inherited soul-sleep doctrine misreads. Read alongside the rich-man''s conscious-witness at Luke 16, the Qohelet (Ecclesiastes) register is *under-the-sun* observation-from-the-living-side, not denial of conscious-sheol from the dead-side. Tension held; both honored.'),
  ('luke', 16, 24, 'revelation', 20, 14, 9, E'*And death and hell (hadēs) were cast into the lake of fire* — the sheol-as-temporal-holding-state the rich-man-and-Lazaros parable assumes IS the sheol Revelation names being cast into the lake-of-fire at the second-resurrection-and-judgment. Sheol is not the final destination; sheol is the holding-state pending the resurrection.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:rich-man-and-lazaros-the-framework-honest-sheol-with-two-compartments-and-the-mosheh-and-the-prophets-test | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 22: the-unjust-steward-and-the-money-stewardship-discipline-in-an-unrighteous-system (C.9, sort 1237)
-- VERIFIER DELTA: Tobit 4:9-10 member-row REMOVED (extras quoted in summary_md only).
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-unjust-steward-and-the-money-stewardship-discipline-in-an-unrighteous-system',
    E'The unjust steward — money stewardship in the unrighteous-system before the books are called',
    E'Lukan-specific. One of the parables the inherited pulpit treats as confusing or shockingly amoral. The framework reading: the King is teaching wisdom-in-the-stewardship-of-mammon, NOT commending dishonesty. The steward is about to be called to account, acts shrewdly to make friends among the debtors, and the lord commends his shrewdness — *the children of this world are in their generation wiser than the children of light* (v.8). The application: use the mammon-of-unrighteousness while you have it to *make to yourselves friends* who receive you into the everlasting habitations. The Sirach 11 / Tobit 4 wisdom-stream witness names the alms-as-laid-up-treasure substance (extras-quoted in summary; not member-rows per canon-edition scope). The Daniel 4:27 *break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor* is the Tanakh-anchor. The verdict — *Ye cannot serve Elohim (God) and mammon* (v.13) — names the standing-test of the divided heart.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1237
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 16 AND sv.verse_number = 1
   AND ev.book_slug = 'luke' AND ev.chapter_number = 16 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 16, 1, 'proverbs', 22, 3, 1, E'*A prudent man foreseeth the evil, and hideth himself: but the simple pass on, and are punished* — the wisdom-stream''s foresee-the-evil substance the steward enacts in shrewd-not-righteous form. The King reads the wisdom from a negative-illustration.'),
  ('luke', 16, 9, 'matthew', 6, 19, 2, E'*Lay not up for yourselves treasures upon earth... But lay up for yourselves treasures in heaven* — the same treasure-in-heaven substance the broader catena holds. The mammon-of-unrighteousness wisely deployed becomes friends-in-the-everlasting-habitations.'),
  ('luke', 16, 9, 'daniel', 4, 27, 3, E'*Wherefore, O king, let my counsel be acceptable unto thee, and break off thy sins by righteousness, and thine iniquities by shewing mercy to the poor; if it may be a lengthening of thy tranquillity* — Daniel''s counsel to Nevukadnetsar (Nebuchadnezzar) carries the same alms-as-temporary-postponement-of-judgment substance the unjust-steward applies.'),
  ('luke', 16, 10, 'luke', 19, 17, 4, E'*Well, thou good servant: because thou hast been faithful in a very little, have thou authority over ten cities* — the *he that is faithful in that which is least is faithful also in much* substance the King speaks at Luke 19''s parable of the pounds. Cross-witness on the faithful-in-little discipline.'),
  ('luke', 16, 11, 'matthew', 25, 21, 5, E'*Well done, thou good and faithful servant: thou hast been faithful over a few things, I will make thee ruler over many things* — the parable of the talents pairs the same faithful-in-little-faithful-in-much substance.'),
  ('luke', 16, 13, 'matthew', 6, 24, 6, E'*No man can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* — the same mammon-teaching the Sermon-on-the-Mount carries. Cross-witness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-unjust-steward-and-the-money-stewardship-discipline-in-an-unrighteous-system | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-unjust-steward-and-the-money-stewardship-discipline-in-an-unrighteous-system'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-unjust-steward-and-the-money-stewardship-discipline-in-an-unrighteous-system | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 23: the-kingdom-of-elohim-is-within-you-the-in-your-midst-sense-and-the-king-standing-among-them (C.10, sort 1238)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-kingdom-of-elohim-is-within-you-the-in-your-midst-sense-and-the-king-standing-among-them',
    E'The kingdom of Elohim is within you — the in-your-midst sense and the King standing among them',
    E'Lukan-specific. The Pharisees demand of Yahusha (Jesus) when the kingdom of Elohim (God) cometh; the King answers *The kingdom of Elohim (God) cometh not with observation: Neither shall they say, Lo here! or, lo there! for, behold, the kingdom of Elohim (God) is within you* (Luke 17:20-21). The Greek *entos hymōn* — within / in-your-midst / among-you. FRAMEWORK-MAJOR. The in-your-midst sense: the King is standing in front of the Pharisees asking him the question; the kingdom IS among them, in the person of the King they refuse to recognize. NOT the inherited individualist-internalized-kingdom reading (which the framework rejects — Red Line on individualized-spiritualization). The Daniel 2:44 *in the days of these kings shall Elohim (God) of heaven set up a kingdom* is the prophetic-substance: the kingdom-stone has been cut out without hands and is standing in the temple-court.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1238
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 17 AND sv.verse_number = 20
   AND ev.book_slug = 'luke' AND ev.chapter_number = 17 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 17, 21, 'matthew', 12, 28, 1, E'*But if I cast out devils by the Spirit of Elohim (God), then the kingdom of Elohim (God) is come unto you* — the kingdom-come-among-you substance the King names elsewhere. The casting-out-of-devils IS the kingdom-in-the-midst.'),
  ('luke', 17, 21, 'mark', 1, 15, 2, E'*The time is fulfilled, and the kingdom of Elohim (God) is at hand: repent ye, and believe the gospel* — the kingdom-at-hand register the King has been carrying from Mark 1; the in-your-midst sense matures it at Luke 17:21.'),
  ('luke', 17, 21, 'john', 1, 26, 3, E'*Yochanan (John) answered them, saying, I baptize with water: but there standeth one among you, whom ye know not* — the standing-among-them-but-not-recognized substance the Baptizer names. Same in-your-midst sense.'),
  ('luke', 17, 20, 'daniel', 2, 44, 4, E'*And in the days of these kings shall Elohim (God) of heaven set up a kingdom, which shall never be destroyed: and the kingdom shall not be left to other people* — the kingdom-stone cut-out-without-hands. The Pharisees demand a sign-with-observation; the kingdom-stone is standing in front of them.'),
  ('luke', 17, 21, 'luke', 11, 20, 5, E'*But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* — the Lukan parallel to Matthew 12:28. Cross-witness within the gospel itself.'),
  ('luke', 17, 22, 'matthew', 24, 27, 6, E'*For as the lightning cometh out of the east, and shineth even unto the west; so shall also the coming of the Son of Adam (son of man) be* — the day-of-the-Son-of-Adam coming-with-observation, the not-yet register that follows the in-your-midst-now declaration. The framework holds both as one motion: kingdom-now-among-you in the King''s present-tense person, kingdom-then-with-observation at the day-of-the-Son-of-Adam''s coming.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-kingdom-of-elohim-is-within-you-the-in-your-midst-sense-and-the-king-standing-among-them | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-kingdom-of-elohim-is-within-you-the-in-your-midst-sense-and-the-king-standing-among-them'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-kingdom-of-elohim-is-within-you-the-in-your-midst-sense-and-the-king-standing-among-them | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 24: when-the-son-of-adam-cometh-shall-he-find-faith-on-the-earth-the-importunate-widow-and-the-post-harvest-sifting-standing-question (C.11, sort 1239)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'when-the-son-of-adam-cometh-shall-he-find-faith-on-the-earth-the-importunate-widow-and-the-post-harvest-sifting-standing-question',
    E'When the Son of Adam cometh, shall he find faith on the earth? — the importunate widow and the post-harvest sifting standing-question',
    E'Lukan-specific. The importunate-widow parable closes with a question that carries the framework-major standing-warning the framework holds: *Nevertheless when the Son of Adam (son of man) cometh, shall he find faith on the earth?* (v.8). Two pieces: (a) the parable itself — the widow''s day-and-night crying-out for justice from the unjust-judge, the *shall not Elohim (God) avenge his own elect, which cry day and night unto him, though he bear long with them? I tell you that he will avenge them speedily.* (b) The closing question — *shall he find faith on the earth?* — names the post-harvest-sifting hour''s standing-test on the gathered wheat. FRAMEWORK-MAJOR. The avenging-of-the-elect is the substance of Revelation 6:9-11''s souls-under-the-altar crying-out; the *bear long* is Kefa (Peter)''s *not slack concerning his promise* of 2 Peter 3:9 — the longsuffering is mercy operating toward the gathering, not slackness. The standing-test names *Many will say to me in that day, Lord, Lord* of Matthew 7:22 as the diagnostic: profession without enduring-fruit fails the standing-test.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1239
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 18 AND sv.verse_number = 1
   AND ev.book_slug = 'luke' AND ev.chapter_number = 18 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 18, 1, 'ephesians', 6, 18, 1, E'*Praying always with all prayer and supplication in the Spirit, and watching thereunto with all perseverance and supplication for all saints* — the *men ought always to pray, and not to faint* of Luke 18:1 carries the same persevering-supplication substance Paul names.'),
  ('luke', 18, 7, 'psalms', 13, 1, 2, E'*How long wilt thou forget me, O Yahuah (LORD)? for ever? how long wilt thou hide thy face from me?* — the Tehillim (Psalm) 13:1-2 day-and-night cry of the elect, the same crying-out the importunate widow walks.'),
  ('luke', 18, 7, '2-peter', 3, 9, 3, E'*Yahuah (the Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* — the *though he bear long with them* substance Kefa (Peter) names in apostolic-register. The longsuffering is not slackness; it is mercy operating toward the gathering.'),
  ('luke', 18, 7, 'revelation', 6, 9, 4, E'*I saw under the altar the souls of them that were slain for the word of Elohim (God)... How long, O Adonai (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* — the souls-under-the-altar crying-out is the same architecture the importunate widow walks. The avenging-of-the-elect is the standing-substance.'),
  ('luke', 18, 8, 'matthew', 7, 22, 5, E'*Many will say to me in that day, Lord, Lord, have we not prophesied in thy name?... And then will I profess unto them, I never knew you: depart from me, ye that work iniquity* — the same standing-test in declarative-form. The faith-the-King-finds is the diagnostic-faith of the elect, not the profession-without-fruit.'),
  ('luke', 18, 8, 'matthew', 24, 12, 6, E'*And because iniquity shall abound, the love of many shall wax cold* — the post-harvest-sifting hour''s diagnostic in Matthean register; the love-waxing-cold is the failing-faith the King''s question anticipates.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:when-the-son-of-adam-cometh-shall-he-find-faith-on-the-earth-the-importunate-widow-and-the-post-harvest-sifting-standing-question | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'when-the-son-of-adam-cometh-shall-he-find-faith-on-the-earth-the-importunate-widow-and-the-post-harvest-sifting-standing-question'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:when-the-son-of-adam-cometh-shall-he-find-faith-on-the-earth-the-importunate-widow-and-the-post-harvest-sifting-standing-question | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 25: pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form (C.12, sort 1240)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form',
    E'Pharisee and publican — the flesh-credential-vs-mercy contrast and the Judaizer architecture in parable-form',
    E'Lukan-specific. The parable that carries the framework''s central Judaizer-error diagnostic in its tightest compressed form. *Two men went up into the temple to pray; the one a Pharisee, and the other a publican. The Pharisee stood and prayed thus with himself, Elohim (God), I thank thee, that I am not as other men are, extortioners, unjust, adulterers, or even as this publican. I fast twice in the week, I give tithes of all that I possess. And the publican, standing afar off, would not lift up so much as his eyes unto heaven, but smote upon his breast, saying, Elohim (God) be merciful to me a sinner. I tell you, this man went down to his house justified rather than the other: for every one that exalteth himself shall be abased; and he that humbleth himself shall be exalted.* FRAMEWORK-MAJOR. Framework reading: this IS the Pharisaic-system-as-Judaizer-predecessor in parable-form. The Pharisee''s prayer is the architecture of the flesh-credential gospel: (1) comparison-with-others (*I am not as other men*), (2) recital-of-works (*I fast twice in the week, I give tithes*), (3) self-justification-before-Elohim. The publican''s posture is the door-the-framework-restores: (1) refusal-of-comparison, (2) no-claim-to-works, (3) appeal-to-mercy. The King''s verdict reverses the inherited-religious-judgment: the publican went down JUSTIFIED, the Pharisee did NOT. This is the Galatian-agitator architecture exposed in parable-form a generation before Paul wrote against it. The same lie wears different costumes (Red Lines #2, #11) — the Pharisee''s flesh-credential; the Galatian-agitator''s circumcision-conferring-covenant-standing (*Except ye be circumcised after the manner of Mosheh, ye cannot be saved* — Acts 15:1); modern-Christianity''s say-the-prayer-be-baptized-and-you-are-saved; modern-Hebrew-Roots-false-inclusion-by-Torah-keeping. Four costumes, one antichrist gospel of *become this and you are saved.* The publican''s mercy-posture is the homecoming the framework holds. *The just shall live by his faith* (Chavaqquq/Habakkuk 2:4) is what the publican walks; the Pharisee''s *I fast twice in the week, I give tithes* IS *works of the law* (erga nomou) in self-justifying-voice. Paul''s whole Galatians argument is this parable walked into Pisidian Antioch.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1240
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 18 AND sv.verse_number = 9
   AND ev.book_slug = 'luke' AND ev.chapter_number = 18 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 18, 11, 'galatians', 2, 16, 1, E'*Knowing that a man is not justified by the works of the law (erga nomou), but by the faith of Yahusha HaMashiach (Jesus Christ)* — the Pharisee''s *I fast twice in the week, I give tithes* IS *works of the law* in self-justifying-voice. Paul''s Galatians-argument against the flesh-credential gospel is THIS parable''s substance.'),
  ('luke', 18, 11, 'philippians', 3, 4, 2, E'*If any other man thinketh that he hath whereof he might trust in the flesh, I more: circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Binyamin (Benjamin)... But what things were gain to me, those I counted loss for HaMashiach (Christ)* — Paul''s own walking-away-from-the-Pharisee-posture in his own voice. The flesh-credentials he had, counted loss when the standing-test landed.'),
  ('luke', 18, 11, 'isaiah', 65, 5, 3, E'*Which say, Stand by thyself, come not near to me; for I am holier than thou. These are a smoke in my nose, a fire that burneth all the day* — Yeshayahu (Isaiah) 65:5''s Pharisee-posture in compressed form, named as smoke-in-Yahuah''s-nose. The parable walks Yeshayahu''s diagnostic into the temple-court.'),
  ('luke', 18, 13, 'psalms', 51, 1, 4, E'*Have mercy upon me, O Elohim (God), according to thy lovingkindness: according unto the multitude of thy tender mercies blot out my transgressions* — the publican''s *Elohim (God) be merciful to me a sinner* IS David''s Tehillim 51 prayer in compressed form. The mercy-from-the-name-of-Yahuah architecture the Tanakh holds.'),
  ('luke', 18, 13, 'psalms', 34, 18, 5, E'*Yahuah (the LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit* — the contrite-spirit posture the publican walks. The Tanakh-witness to the mercy-posture-as-the-door.'),
  ('luke', 18, 11, 'galatians', 1, 6, 6, E'The Pharisee''s prayer at Luke 18:11-12 is the *other gospel* of Galatians 1:6 in compressed parable-form: salvation-by-becoming-something — the flesh-credential gospel. The King''s verdict (*this man went down to his house justified rather than the other*, v.14) refutes the Pharisaic-system the Galatian-agitators inherited.'),
  ('luke', 18, 14, 'matthew', 23, 12, 7, E'*And whosoever shall exalt himself shall be abased; and he that shall humble himself shall be exalted* — the kingdom-inversion the King teaches across the gospels. Cross-witness on the verdict.'),
  ('luke', 18, 14, 'james', 4, 6, 8, E'*Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* — James citing the same kingdom-inversion substance.'),
  ('luke', 18, 13, 'habakkuk', 2, 4, 9, E'*The just shall live by his faith* — Chavaqquq (Habakkuk) 2:4''s prophetic-substance the publican''s mercy-posture-justified walks. The just-shall-live-by-faith register the prophet names and Paul carries to Romans, Galatians, and Hebrews IS what justifies the publican before Elohim while the Pharisee''s flesh-credentials count nothing.'),
  ('luke', 18, 11, 'acts', 15, 1, 10, E'*And certain men which came down from Yahudah (Judaea) taught the brethren, and said, Except ye be circumcised after the manner of Mosheh (Moses), ye cannot be saved* — the Judaizer-claim Acts 15:1 names IS the Pharisee-posture of Luke 18 extended into the proselyte-conversion gospel. Same flesh-credential architecture, different ritual — *become a Yahudi (Jew) and you are saved.* The framework''s central Judaizer-error diagnostic; the parable foreshadows the controversy by a generation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:pharisee-and-publican-the-flesh-credential-vs-mercy-contrast-and-the-judaizer-architecture-in-parable-form | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 26: lament-over-yerushalayim-the-days-of-visitation-and-the-70-ad-prefiguring (D.1, sort 1241)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'lament-over-yerushalayim-the-days-of-visitation-and-the-70-ad-prefiguring',
    E'Lament over Yerushalayim — the days of visitation and the 70 AD prefiguring',
    E'Luke uniquely carries the King''s lament over Yerushalayim (Jerusalem) at the descent of the Mount of Olives — *And when he was come near, he beheld the city, and wept over it, Saying, If thou hadst known, even thou, at least in this thy day, the things which belong unto thy peace! but now they are hid from thine eyes.* The lament names the days-of-visitation the city did not recognize: *thine enemies shall cast a trench about thee, and compass thee round, and keep thee in on every side, And shall lay thee even with the ground, and thy children within thee; and they shall not leave in thee one stone upon another; because thou knewest not the time of thy visitation* (vv.43-44). FRAMEWORK-MAJOR. The 70 AD Roman destruction is the historical-fulfillment in the first hinge; the still-future *day of Yahuah* gathering-against-Yerushalayim is the substance Zekharyah (Zechariah) 14:2 carries — the city given over again as a stage in the gathering-and-cleansing of the seed. The partial-restoration of Yahudah (Judah) after the Babylonian captivity reached its terminus when the city did not know its day, and the desolation that followed prefigures the still-future dreadful-day judgment.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1241
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 19 AND sv.verse_number = 41
   AND ev.book_slug = 'luke' AND ev.chapter_number = 19 AND ev.verse_number = 44
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 19, 41, 'matthew', 23, 37, 1, E'The Lukan lament at the entry and the Matthean lament at the close of the woes carry the same *would have gathered thy children together, even as a hen gathereth her chickens, and ye would not* substance — the visitation-rejected diagnostic.'),
  ('luke', 19, 43, 'daniel', 9, 26, 2, E'The Daniyel (Daniel) 9:26 *the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood* names the same destruction the King prophesies at Luke 19:43-44 — the 70 AD Roman siege as the first hinge fulfillment of the prophetic clock.'),
  ('luke', 19, 43, 'jeremiah', 6, 6, 3, E'The Yirmeyahu (Jeremiah) 6:6 *Cast ye up a bank against Yerushalayim (Jerusalem): this is the city to be visited; she is wholly oppression in the midst of her* is the Tanakh substance Luke''s *enemies shall cast a trench about thee* carries forward. Yirmeyahu names the same desolation-pattern at the Babylonian-captivity hinge that the King names at the Roman-siege hinge.'),
  ('luke', 19, 44, 'zechariah', 14, 2, 4, E'The Zekharyah (Zechariah) 14:2 *For I will gather all nations against Yerushalayim (Jerusalem) to battle; and the city shall be taken, and the houses rifled, and the women ravished* is the still-future dreadful-day judgment the 70 AD desolation prefigures — the city again given over to the nations as a stage in the gathering-and-cleansing of the seed.'),
  ('luke', 19, 44, 'micah', 3, 12, 5, E'Mikhah (Micah) 3:12''s *Therefore shall Tsion (Zion) for your sake be plowed as a field, and Yerushalayim (Jerusalem) shall become heaps, and the mountain of the house as the high places of the forest* is the Tanakh-prophetic desolation-judgment substance the King''s lament carries forward. Mikhah names the pattern; Luke records the King naming the fulfillment in tears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:lament-over-yerushalayim-the-days-of-visitation-and-the-70-ad-prefiguring | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'lament-over-yerushalayim-the-days-of-visitation-and-the-70-ad-prefiguring'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:lament-over-yerushalayim-the-days-of-visitation-and-the-70-ad-prefiguring | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 27: times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim (D.2, sort 1242)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim',
    E'The times of the Gentiles — the nations as territorial-occupier of Yerushalayim',
    E'Luke uniquely carries the *times of the Gentiles* line at the close of the desolation-of-Yerushalayim prophecy — *And they shall fall by the edge of the sword, and shall be led away captive into all nations: and Yerushalayim (Jerusalem) shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled.* FRAMEWORK-MAJOR. The *Gentiles* (*ethnē*) here is the nations-as-territorial-occupier register — the Roman administration in 70 AD, and through the long stretch of dispersion the city ground under foot under successive Caliphate and Crusader and Ottoman and modern administrations. The *times of the Gentiles* is the prophetic-window during which the city stands under non-Yashar''el (Israel) administration, with the captives led away into all nations — the same scattering-out-of-Yahudah (Judah) register the Yirmeyahu (Jeremiah) 25 / Daniyel (Daniel) 9 / Daniyel 12 architecture carries. NOT Christianity''s spiritual-Gentile-inclusion-age but the literal-nations-occupying-the-land-while-the-seed-is-scattered age, which closes when the gathering-of-the-tribes from the four winds (Yechezk''el/Ezekiel 37, Hoshea/Hosea 1, Zekharyah/Zechariah 10) restores the city to its prophetic occupants. Paul at Romans 11:25''s *fulness of the Gentiles* names the corresponding scope: the *plērōma* is the full-number of the scattered seed gathered home from the territories of dispersion — NOT Christian-Gentile-inclusion completion. When that gathering is complete, the *until* lands.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1242
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 21 AND sv.verse_number = 24
   AND ev.book_slug = 'luke' AND ev.chapter_number = 21 AND ev.verse_number = 24
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 21, 24, 'ezekiel', 39, 23, 1, E'The Yechezk''el (Ezekiel) 39:23 *the house of Yashar''el (Israel) went into captivity for their iniquity: because they trespassed against me, therefore hid I my face from them, and gave them into the hand of their enemies: so fell they all by the sword* names the captive-and-scattered substance the *led away captive into all nations* carries.'),
  ('luke', 21, 24, 'daniel', 8, 13, 2, E'The Daniyel (Daniel) 8:13-14 *How long shall be the vision concerning the daily sacrifice, and the transgression of desolation... Unto two thousand and three hundred days; then shall the sanctuary be cleansed* names the trodden-down-with-an-appointed-terminus substance the *until the times of the Gentiles be fulfilled* carries forward.'),
  ('luke', 21, 24, 'daniel', 12, 7, 3, E'Daniyel (Daniel) 12:7''s *when he shall have accomplished to scatter the power of the holy people, all these things shall be finished* names the close-of-the-scattering hinge the *until the times of the Gentiles be fulfilled* substance points toward.'),
  ('luke', 21, 24, 'zechariah', 12, 3, 4, E'The Zekharyah (Zechariah) 12:3 *And in that day will I make Yerushalayim (Jerusalem) a burdensome stone for all people: all that burden themselves with it shall be cut in pieces, though all the people of the earth be gathered together against it* names the gathered-against-Yerushalayim substance the dreadful-day brings to head.'),
  ('luke', 21, 24, 'revelation', 11, 2, 5, E'Revelation 11:2''s *But the court which is without the temple leave out, and measure it not; for it is given unto the Gentiles: and the holy city shall they tread under foot forty and two months* carries the same trodden-down-by-the-Gentiles substance in the cyclical-Revelation register that the Luke 21:24 prophecy carries in the synoptic register.'),
  ('luke', 21, 24, 'romans', 11, 25, 6, E'Romans 11:25''s *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* names the corresponding *until* of the gathering — Paul reading the same *times of the Gentiles* the King names. NOT Christian-Gentile-inclusion completion; the gathering-of-the-scattered-from-the-nations completion. The *plērōma* is the full-number of the scattered seed gathered home from the territories of dispersion; when that gathering is complete, the *until* lands.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:times-of-the-gentiles-and-the-nations-as-territorial-occupier-of-yerushalayim | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 28: two-swords-and-reckoned-among-the-transgressors-yeshayahu-53-12-citation (D.4, sort 1243)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'two-swords-and-reckoned-among-the-transgressors-yeshayahu-53-12-citation',
    E'Two swords and *reckoned among the transgressors* — the Yeshayahu (Isaiah) 53:12 citation at the changed hour',
    E'Luke uniquely carries the King''s word to the disciples about the sword in the hour-of-darkness — *But now, he that hath a purse, let him take it, and likewise his scrip: and he that hath no sword, let him sell his garment, and buy one. For I say unto you, that this that is written must yet be accomplished in me, And he was reckoned among the transgressors: for the things concerning me have an end* (Luke 22:36-37). The two-swords substance is NOT a license-to-arm; it is the changed-hour marker — the apostolic-mission of Luke 9 (*Take nothing for your journey, neither staves, nor scrip, neither bread, neither money*) is over; the hour-of-darkness has come. The King''s citation of Yeshayahu (Isaiah) 53:12 — *he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors* — names the Suffering-Servant prophecy as still-to-be-accomplished-in-him. *It is enough* (v.38) closes the misreading; when Kefa (Peter) uses one at Gethsemane the King immediately rebukes him. The kingdom is not of this world (Yochanan/John 18:36); the sword is not for the disciples'' use.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1243
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 22 AND sv.verse_number = 35
   AND ev.book_slug = 'luke' AND ev.chapter_number = 22 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 22, 37, 'isaiah', 53, 12, 1, E'Direct citation. Yeshayahu (Isaiah) 53:12''s *he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors* is the Suffering-Servant register the King takes onto himself, naming the *yet to be accomplished in me* prophetic fulfillment.'),
  ('luke', 22, 35, 'zechariah', 13, 7, 2, E'Zekharyah (Zechariah)''s *smite the shepherd, and the sheep shall be scattered* names the hour-of-darkness substance — the King going alone into the cup, the disciples scattered. The two-swords saying brackets the changed-hour.'),
  ('luke', 22, 35, 'matthew', 26, 52, 3, E'Matthew''s *Put up again thy sword into his place: for all they that take the sword shall perish with the sword* governs the misreading: the sword is not for the disciples'' use, it is the marker of the changed-hour. When Kefa (Peter) uses one at Gethsemane, the King immediately rebukes him.'),
  ('luke', 22, 35, 'luke', 9, 3, 4, E'The Lukan apostolic-mission contrast: *Take nothing for your journey, neither staves, nor scrip, neither bread, neither money* (Luke 9:3) of the Twelve commissioning, set against the changed-hour *let him take it* of Luke 22:36. The Father provided in the first commission; the hour-of-darkness asks a different posture.'),
  ('luke', 22, 35, 'john', 18, 36, 5, E'The Yochanan (John) 18:36 *My kingdom is not of this world: if my kingdom were of this world, then would my servants fight* is the King naming what the two-swords substance is NOT. The sword is changed-hour marker, not kingdom-instrument.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:two-swords-and-reckoned-among-the-transgressors-yeshayahu-53-12-citation | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'two-swords-and-reckoned-among-the-transgressors-yeshayahu-53-12-citation'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:two-swords-and-reckoned-among-the-transgressors-yeshayahu-53-12-citation | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 29: today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture (D.5, sort 1244)
-- YOSHI S185 RESOLUTION #1: paradise post-ascension relocation per Ephesians 4:8 baked into Luke 23:43 → Ephesians 4:8 member-row.
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture',
    E'Today shalt thou be with me in paradise — the sheol-with-two-compartments architecture',
    E'Luke uniquely carries the two-thieves at the cross with the second thief''s rebuke of the first, his confession of the King — *Lord, remember me when thou comest into thy kingdom* (v.42) — and the King''s answer: *Verily I say unto thee, Today shalt thou be with me in paradise* (v.43). The paradise (*paradeisos*) the King names is the righteous-compartment of sheol — Avraham''s (Abraham''s) bosom of Luke 16:19-31. The framework holds two readings as one motion: at the crucifixion-hour, sheol-with-two-compartments — the righteous-compartment IS paradise where the second thief joins the King this-day. Then between the cross and the ascension the King descended to the dead, preached (1 Kefa/Peter 3:18-20; 4:6), and at the ascension led the captives out (Ephesians 4:8) — paradise relocated with them. Post-ascension, paradise references the heavenly-register the New Testament passages name (2 Corinthians 12:4 — Paul caught up to paradise; Revelation 2:7 — paradise of Elohim in eschatological-new-Yerushalayim). FRAMEWORK-MAJOR: sheol-with-two-compartments at the crucifixion-hour, post-ascension relocation to the heavenly-register; the framework holds both as one motion in the King''s descent / preaching / leading-the-captives-out.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1244
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 39
   AND ev.book_slug = 'luke' AND ev.chapter_number = 23 AND ev.verse_number = 43
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 23, 43, 'luke', 16, 22, 1, E'The Lukan rich-man-and-Lazaros parable carries the sheol-with-two-compartments architecture explicitly — Avraham''s (Abraham''s) bosom on one side, the place-of-torment on the other, a great gulf fixed between. The paradise the King names at Luke 23:43 is the same righteous-compartment Lazaros is carried into.'),
  ('luke', 23, 43, '1-peter', 3, 18, 2, E'The 1 Kefa (Peter) 3:18-20 *being put to death in the flesh, but quickened by the Spirit: By which also he went and preached unto the spirits in prison* names the proclamation-to-the-dead substance the King''s *today shalt thou be with me in paradise* opens onto. The descent-to-the-dead between the cross and the ascension is the framework''s explicit motion.'),
  ('luke', 23, 43, '1-peter', 4, 6, 3, E'The 1 Kefa (Peter) 4:6 *For for this cause was the gospel preached also to them that are dead, that they might be judged according to men in the flesh, but live according to Elohim (God) in the spirit* names the proclamation-to-the-dead substance — the King preaches in sheol between cross and ascension.'),
  ('luke', 23, 43, 'ephesians', 4, 8, 4, E'The Ephesians 4:8 *When he ascended up on high, he led captivity captive, and gave gifts unto men* names the ascension-relocation: at the King''s word *today shalt thou be with me in paradise,* paradise was the righteous-compartment of sheol (Avraham''s bosom of Luke 16:19-31); between the cross and the ascension the King descended to the dead, preached (1 Kefa/Peter 3:18-20; 4:6), and at the ascension led the captives out — paradise relocated with them. The framework holds both readings as one motion: sheol-with-two-compartments at the crucifixion-hour, post-ascension relocation to the heavenly-register the New Testament passages reference.'),
  ('luke', 23, 43, 'john', 5, 25, 5, E'Yochanan (John) 5:25''s *Verily, verily, I say unto you, The hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live* is the gospel-preached-to-the-dead substance — the King''s voice reaches the righteous-in-sheol the way the King''s voice reaches the second thief.'),
  ('luke', 23, 43, '2-corinthians', 12, 4, 6, E'Paul''s *How that he was caught up into paradise, and heard unspeakable words* uses paradise (paradeisos) in the post-ascension heavenly-register — the destination paradise has relocated to. The same word the King uses at Luke 23:43, now naming the heavenly-with-the-Father destination after Ephesians 4:8''s relocation-motion.'),
  ('luke', 23, 43, 'revelation', 2, 7, 7, E'Revelation 2:7''s *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* uses paradise in the eschatological-new-Yerushalayim register — the destination the second thief''s *remember me when thou comest into thy kingdom* points toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:today-shalt-thou-be-with-me-in-paradise-the-sheol-with-two-compartments-architecture | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 30: father-forgive-them-the-intercession-from-the-cross-for-they-know-not-what-they-do (split from D.6, sort 1245)
-- VERIFIER SPLIT: D NEW 6 split into NEW 30 (Luke 23:34) + NEW 31 (Luke 23:46).
-- YOSHI S185 RESOLUTION #3: Luke 23:34a RETAINED as canonical-framework per S183 Mark longer-ending precedent.
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'father-forgive-them-the-intercession-from-the-cross-for-they-know-not-what-they-do',
    E'Father, forgive them — the intercession from the cross *for they know not what they do*',
    E'Luke uniquely carries the King''s first cross-word — *Father, forgive them; for they know not what they do* (Luke 23:34). The critical-text history brackets the verse; the framework retains it as canonical-framework per the S183 Mark longer-ending precedent. The intercession-from-the-cross IS the audible fulfillment of Yeshayahu (Isaiah) 53:12 — *he was numbered with the transgressors; and he bare the sin of many, and made intercession for the transgressors.* The Suffering-Servant''s intercession is not silent; it is spoken from the cross over the very men driving the nails. Kefa (Peter) reads the substance at Acts 3:17 — *through ignorance ye did it, as did also your rulers* — naming the victim-status of those who stood under the system-deception. Stephen at Acts 7:60 — *Lord, lay not this sin to their charge* — is the disciple following the King''s pattern from the execution-altar. 1 Yochanan (John) 2:1 names the standing-intercession the cross-prayer inaugurates: *we have an advocate with the Father, Yahusha (Jesus) HaMashiach (Christ) the righteous.*',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1245
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 34
   AND ev.book_slug = 'luke' AND ev.chapter_number = 23 AND ev.verse_number = 34
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 23, 34, 'isaiah', 53, 12, 1, E'The *made intercession for the transgressors* of Yeshayahu (Isaiah) 53:12 is the substance the King''s *Father, forgive them; for they know not what they do* fulfills audibly from the cross. The Suffering-Servant''s intercession is the cross-prayer; the prophecy is fulfilled in spoken-form.'),
  ('luke', 23, 34, 'acts', 7, 60, 2, E'Stephen''s dying *Lord, lay not this sin to their charge* at the stoning is the disciple following the King''s pattern — the forgiveness-asked-from-the-execution-altar substance walked by the first martyr after the cross.'),
  ('luke', 23, 34, 'acts', 3, 17, 3, E'Kefa (Peter) at Shlomo''s (Solomon''s)-porch: *And now, brethren, I wot that through ignorance ye did it, as did also your rulers* echoes the *they know not what they do* register — the King''s reading of the victim-status of those who stood under the system-deception rather than the system itself.'),
  ('luke', 23, 34, '1-john', 2, 1, 4, E'The 1 Yochanan (John) 2:1 *we have an advocate with the Father, Yahusha (Jesus) HaMashiach (Christ) the righteous* names the intercession-substance the *Father, forgive them* inaugurates audibly and Yahusha continues to exercise as the standing advocate before the Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:father-forgive-them-the-intercession-from-the-cross-for-they-know-not-what-they-do | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'father-forgive-them-the-intercession-from-the-cross-for-they-know-not-what-they-do'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:father-forgive-them-the-intercession-from-the-cross-for-they-know-not-what-they-do | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 31: into-thy-hands-i-commend-my-spirit-the-formed-son-trusting-the-formless-at-the-dying-breath (split from D.6, sort 1246)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'into-thy-hands-i-commend-my-spirit-the-formed-son-trusting-the-formless-at-the-dying-breath',
    E'Into thy hands I commend my spirit — the Formed-Son trusting the Formless at the dying breath',
    E'Luke uniquely carries the King''s last cross-word — *Father, into thy hands I commend my spirit* (Luke 23:46) — a direct citation of Tehillim (Psalm) 31:5. The Formed-Son entrusts the dying breath to the Formless-Father in the substance of the Tanakh''s own prayer. The framework reads the cross-words as the Formless-Father / Formed-Son relation under the cup: *Father* names the relation; *into thy hands* names the trust; *I commend my spirit* names the act of entrustment. Stephen at Acts 7:59 walks the disciple-pattern — *Lord Yahusha (Jesus), receive my spirit* — naming Yahusha as the Formed-receiver of the entrusted spirit, the NT-Lord-titular-preserve at the disciple''s dying-breath now load-bearing for the framework''s Christological identification. Yochanan (John) 19:30''s *It is finished* and Luke 23:46''s *into thy hands* are the parallel-substance cross-word: the work is complete; the breath is yielded to the Father.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1246
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 23 AND sv.verse_number = 46
   AND ev.book_slug = 'luke' AND ev.chapter_number = 23 AND ev.verse_number = 46
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 23, 46, 'psalms', 31, 5, 1, E'Direct citation. *Into thine hand I commit my spirit: thou hast redeemed me, Yahuah (LORD) Elohim of truth* — Tehillim (Psalm) 31:5 in David''s mouth, walked into the King''s mouth at the dying breath. The Formed-Son entrusts the spirit to the Formless-Father in the Tanakh''s own prayer.'),
  ('luke', 23, 46, 'acts', 7, 59, 2, E'Stephen''s dying *Lord Yahusha (Jesus), receive my spirit* is the disciple following the King''s pattern — into-thy-hands-substance-spoken-to-Yahusha-as-the-Formed by the man who has just seen the heavens opened. The NT-Lord-titular-preserve at this verse is load-bearing for the framework''s Christological identification.'),
  ('luke', 23, 46, 'john', 19, 30, 3, E'Yochanan (John) carries the parallel-substance cross-word — *It is finished. And he bowed his head, and gave up the ghost.* The work is complete; the breath is yielded. Luke''s *into thy hands* and Yochanan''s *it is finished* are the parallel-substance cross-word: the Formed-Son releases the spirit to the Formless-Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:into-thy-hands-i-commend-my-spirit-the-formed-son-trusting-the-formless-at-the-dying-breath | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'into-thy-hands-i-commend-my-spirit-the-formed-son-trusting-the-formless-at-the-dying-breath'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:into-thy-hands-i-commend-my-spirit-the-formed-son-trusting-the-formless-at-the-dying-breath | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 32: emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method (D.7, sort 1247)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method',
    E'Emmaus road — Mosheh (Moses) and the prophets as the substantial reading-method',
    E'Luke uniquely carries the Emmaus-road episode with the two disciples — Cleopas and his unnamed companion — walking the seven-mile journey from Yerushalayim (Jerusalem) when the resurrected King joins them unrecognized. After they pour out the events of the past three days, the King responds: *O fools, and slow of heart to believe all that the prophets have spoken: Ought not Mashiach (Christ) to have suffered these things, and to enter into his glory? And beginning at Mosheh (Moses) and all the prophets, he expounded unto them in all the scriptures the things concerning himself* (vv.25-27). FRAMEWORK-MAJOR. The Emmaus-reading-method IS the framework''s reading-method: the King is the substance the Tanakh testifies of; the reading goes Mosheh-and-the-prophets-first and finds the Mashiach throughout. Kefa (Peter) at Acts 3:18 applies it post-Pentecost; Paul at Acts 17:2-3 applies it on the synagogue circuit; 1 Kefa 1:10-11 names the Spirit-of-Mashiach-in-the-prophets as the standing-architecture. The Yochanan (John) 5:39, 46 *search the scriptures... had ye believed Mosheh, ye would have believed me* names the same standing-test.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1247
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 25
   AND ev.book_slug = 'luke' AND ev.chapter_number = 24 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 24, 27, 'john', 5, 39, 1, E'Yochanan (John) 5:39''s *Search the scriptures; for in them ye think ye have eternal life: and they are they which testify of me* is the same substance-recognition the King demonstrates on the road. The Tanakh is testifying of him; the inherited reading brackets the testimony out.'),
  ('luke', 24, 27, 'john', 5, 46, 2, E'Yochanan (John) 5:46''s *had ye believed Mosheh (Moses), ye would have believed me: for he wrote of me* — the Emmaus reading-method in compressed form. Mosheh wrote of the King; the standing-test is believing what Mosheh wrote.'),
  ('luke', 24, 27, 'acts', 3, 18, 3, E'Kefa (Peter) at Shlomo''s (Solomon''s) porch: *But those things, which Elohim (God) before had shewed by the mouth of all his prophets, that Mashiach (Christ) should suffer, he hath so fulfilled.* The Emmaus reading-method as Kefa applies it post-Pentecost.'),
  ('luke', 24, 27, 'acts', 17, 2, 4, E'Paul at Tessaloniki: *as his manner was, went in unto them, and three sabbath days reasoned with them out of the scriptures, Opening and alleging, that Mashiach (Christ) must needs have suffered, and risen again from the dead.* The Emmaus reading-method as Paul''s standard synagogue-procedure.'),
  ('luke', 24, 27, '1-peter', 1, 10, 5, E'1 Kefa (Peter) 1:10-11''s *Of which salvation the prophets have enquired and searched diligently... Searching what, or what manner of time the Spirit of Mashiach (Christ) which was in them did signify, when it testified beforehand the sufferings of Mashiach, and the glory that should follow* names the Spirit-of-Mashiach-in-the-prophets substance the Emmaus reading uncovers.'),
  ('luke', 24, 27, 'isaiah', 53, 1, 6, E'Yeshayahu (Isaiah) 53:1''s *Who hath believed our report? and to whom is the arm of Yahuah (the LORD) revealed?* is the prophetic complaint about the un-believing-of-the-report the Emmaus disciples'' slowness-of-heart embodies before the King opens their understanding.'),
  ('luke', 24, 27, 'luke', 16, 31, 7, E'The Lukan rich-man-and-Lazaros close — *If they hear not Mosheh (Moses) and the prophets, neither will they be persuaded, though one rose from the dead* — is the same Mosheh-and-the-prophets standing-test. The King''s own internal cross-witness on the reading-method.'),
  ('luke', 24, 44, 'psalms', 22, 1, 8, E'The King''s *all things must be fulfilled, which were written in the law of Mosheh (Moses), and in the prophets, and in the psalms, concerning me* (Luke 24:44) names the three-fold canon — Torah, Prophets, Tehillim — with Tehillim (Psalm) 22 as the load-bearing example of *concerning me* in the prayerbook of David. *My Elohim (God), my Elohim, why hast thou forsaken me?* (Tehillim 22:1) the King quoted on the cross IS the substance the Emmaus reading-method recognizes throughout the whole of David''s prayerbook.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:emmaus-road-mosheh-and-the-prophets-as-the-substantial-reading-method | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 33: resurrection-body-of-flesh-and-bones-the-formed-king-still-formed-after-the-resurrection (D.8, sort 1248)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'resurrection-body-of-flesh-and-bones-the-formed-king-still-formed-after-the-resurrection',
    E'Resurrection body of flesh and bones — the Formed King still Formed after the resurrection',
    E'Luke uniquely carries the upper-room appearance with the King''s specific bodily-demonstration to the disciples: *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have* (v.39), followed by the King eating a piece of broiled fish and of an honeycomb before them (vv.42-43). The flesh-and-bones substance is the framework-major Christological substance: the Formed-King is STILL FORMED after the resurrection. The resurrection is not de-bodied glorification; it is body-raised-and-glorified. Paul''s *spiritual body* (sōma pneumatikon) at 1 Corinthians 15:42-44 is not bodiless-spirit; it is body-animated-by-spirit — exactly what the flesh-and-bones the King shows the disciples is. Yochanan (John) 20''s Tomas (Thomas) episode and 1 Yochanan 1:1''s *that which we have seen with our eyes, which we have looked upon, and our hands have handled* name the same substance. Revelation 1:18''s *I am he that liveth, and was dead; and, behold, I am alive for evermore* names the standing resurrection-life of the Formed King.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1248
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 36
   AND ev.book_slug = 'luke' AND ev.chapter_number = 24 AND ev.verse_number = 43
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 24, 39, '1-corinthians', 15, 42, 1, E'Paul''s *It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body* names the resurrection-body substance the King demonstrates. The *spiritual body* (sōma pneumatikon) is not bodiless-spirit; it is body-animated-by-spirit, which is what the flesh-and-bones the King shows the disciples is.'),
  ('luke', 24, 39, 'john', 20, 24, 2, E'Yochanan (John)''s Tomas (Thomas) episode is the parallel demonstration — the King invites Tomas to *reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side.* Same flesh-and-bones substance, with the wounds-of-the-cross still present as identifying marks on the resurrected body.'),
  ('luke', 24, 39, '1-john', 1, 1, 3, E'The 1 Yochanan (John) 1:1 *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life* names the eyewitness-handling substance Luke 24:39 records.'),
  ('luke', 24, 39, 'revelation', 1, 18, 4, E'Revelation 1:18''s *I am he that liveth, and was dead; and, behold, I am alive for evermore* names the standing resurrection-life of the Formed King — the same flesh-and-bones substance Luke 24 demonstrates, now in the glorified-cloud-rider register of Revelation 1.'),
  ('luke', 24, 39, 'daniel', 12, 2, 5, E'Daniyel (Daniel) 12:2''s *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* names the resurrection-from-the-dust substance the King demonstrates as the firstfruits.'),
  ('luke', 24, 39, 'philippians', 3, 21, 6, E'Philippians 3:21''s *Who shall change our vile body, that it may be fashioned like unto his glorious body* names the prefiguring-substance — the disciples'' future resurrection-body is patterned on the King''s flesh-and-bones glorified-body that Luke 24 demonstrates. The Formed-King''s body is the firstfruits-pattern for the priestly-remnant''s body in the appointed reign.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:resurrection-body-of-flesh-and-bones-the-formed-king-still-formed-after-the-resurrection | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'resurrection-body-of-flesh-and-bones-the-formed-king-still-formed-after-the-resurrection'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:resurrection-body-of-flesh-and-bones-the-formed-king-still-formed-after-the-resurrection | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 34: ascension-blessing-hands-lifted-and-carried-up-into-heaven (D.9, sort 1249)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'ascension-blessing-hands-lifted-and-carried-up-into-heaven',
    E'Ascension — blessing with hands lifted and carried up into heaven',
    E'Luke uniquely carries the ascension-narrative at the close of the gospel — the King leads the disciples out as far as Beit-Anyah (Bethany), lifts up his hands, blesses them, and *while he blessed them, he was parted from them, and carried up into heaven* (v.51). The blessing-with-hands-lifted is the priestly-blessing posture (Vayikra/Leviticus 9:22 — Aharon (Aaron) lifting up his hand toward the people and blessing them at the close of the inaugural sacrifice). Acts 1:9-11 carries the parallel-but-fuller ascension-narrative with the cloud and the angelic *shall so come in like manner as ye have seen him go.* The destination is the right-hand position of Tehillim (Psalm) 110:1; the future-return-locus is the Mount of Olives of Zekharyah (Zechariah) 14:4. Ephesians 4:8-10 names the descended-and-ascended architecture: the King descended first into the lower parts of the earth, then ascended far above all heavens, leading captivity captive.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1249
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 24 AND sv.verse_number = 50
   AND ev.book_slug = 'luke' AND ev.chapter_number = 24 AND ev.verse_number = 53
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 24, 50, 'leviticus', 9, 22, 1, E'Vayikra (Leviticus) 9:22''s *And Aharon (Aaron) lifted up his hand toward the people, and blessed them, and came down from offering of the sin offering, and the burnt offering, and peace offerings* names the priestly-blessing-with-hands-lifted posture the King walks at the ascension. The blessing-at-the-close-of-the-sacrificial-work is the substance.'),
  ('luke', 24, 51, 'acts', 1, 9, 2, E'Acts carries the parallel-but-fuller ascension-narrative with the cloud and the angelic *shall so come in like manner as ye have seen him go.* Luke gospel-end and Acts open are the same event with different framing.'),
  ('luke', 24, 51, 'psalms', 110, 1, 3, E'Tehillim (Psalm) 110:1''s *Yahuah (the LORD) said unto my Lord, Sit thou on my right hand* names the destination of the ascension — the right-hand position of the Formed Son at the Father''s throne.'),
  ('luke', 24, 51, 'hebrews', 4, 14, 4, E'Hebrews 4:14''s *Seeing then that we have a great high priest, that is passed into the heavens, Yahusha (Jesus) the Son of Elohim (God), let us hold fast our profession* names the ascension''s high-priestly substance — the King passed into the heavens as the great High Priest of the heavenly order.'),
  ('luke', 24, 51, 'ephesians', 4, 8, 5, E'Ephesians 4:8-10''s *When he ascended up on high, he led captivity captive, and gave gifts unto men. (Now that he ascended, what is it but that he also descended first into the lower parts of the earth? He that descended is the same also that ascended up far above all heavens)* names the descended-and-ascended architecture the cross / descent-to-paradise / resurrection / ascension motion completes.'),
  ('luke', 24, 51, 'zechariah', 14, 4, 6, E'The Zekharyah (Zechariah) 14:4 *And his feet shall stand in that day upon the mount of Olives, which is before Yerushalayim (Jerusalem) on the east* names the future-return-locus — the same Mount of Olives from which the King ascended will be the locus of his return.'),
  ('luke', 24, 51, '1-peter', 3, 22, 7, E'1 Kefa (Peter) 3:22''s *Who is gone into heaven, and is on the right hand of Elohim (God); angels and authorities and powers being made subject unto him* names the post-ascension governance-architecture the seating-at-the-right-hand inaugurates.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:ascension-blessing-hands-lifted-and-carried-up-into-heaven | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'ascension-blessing-hands-lifted-and-carried-up-into-heaven'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:ascension-blessing-hands-lifted-and-carried-up-into-heaven | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 35: storm-stilled-by-the-formed-ones-rebuke-as-creation-authority (Verifier-added, sort 1250)
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'storm-stilled-by-the-formed-ones-rebuke-as-creation-authority',
    E'Storm stilled by the Formed-One''s rebuke — creation-authority in flesh on the deck',
    E'Verifier-added per the proposal-set lock. The Lukan storm-stilling at Luke 8:22-25 is a distinct episode from the walking-on-the-sea; the framework reads it as the Formed-One''s creation-authority exercised in flesh on the deck. *Master, master, we perish... Then he arose, and rebuked the wind and the raging of the water: and they ceased, and there was a calm. And he said unto them, Where is your faith? And they being afraid wondered, saying one to another, What manner of man is this! for he commandeth even the winds and water, and they obey him* (Luke 8:24-25). The rebuking-the-sea move is Tehillim (Psalm) 107:29''s *He maketh the storm a calm, so that the waves thereof are still* — Yahuah-prerogative exercised in flesh. Tehillim 89:9 — *Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them* — names the same substance. Iyov (Job) 38:11 — *Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed* — names the creation-word at which the sea was bounded. The disciples'' question *What manner of man is this?* rehearses the framework''s central identification: the one in the boat is the one who bounded the sea at creation, exercising the same authority in flesh.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1250
  FROM _s185_luke_lookup sv, _s185_luke_lookup ev
 WHERE sv.book_slug = 'luke' AND sv.chapter_number = 8 AND sv.verse_number = 22
   AND ev.book_slug = 'luke' AND ev.chapter_number = 8 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('luke', 8, 24, 'psalms', 107, 29, 1, E'*He maketh the storm a calm, so that the waves thereof are still.* Tehillim (Psalm) 107:29 names the same sea-mastery substance the King exercises on the deck — Yahuah-prerogative carried in flesh.'),
  ('luke', 8, 24, 'psalms', 89, 9, 2, E'*Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them.* Tehillim (Psalm) 89:9 names the ruling-of-the-raging-sea as Yahuah''s prerogative — the same prerogative the Formed-One carries in flesh.'),
  ('luke', 8, 24, 'job', 38, 11, 3, E'*Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed.* Iyov (Job) 38:8-11''s creation-word at which the sea was bounded — the same voice that gave the sea its bounds at creation now gives it the same word on the deck.'),
  ('luke', 8, 24, 'matthew', 8, 27, 4, E'The Matthean parallel — *What manner of man is this, that even the winds and the sea obey him!* — same disciples'' question, same framework-substance recognition.'),
  ('luke', 8, 24, 'mark', 4, 41, 5, E'The Markan parallel — *they feared exceedingly, and said one to another, What manner of man is this, that even the wind and the sea obey him?* — synoptic-witness to the same creation-authority demonstration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:storm-stilled-by-the-formed-ones-rebuke-as-creation-authority | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'storm-stilled-by-the-formed-ones-rebuke-as-creation-authority'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:storm-stilled-by-the-formed-ones-rebuke-as-creation-authority | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- BULK MEMBER-ADDITIONS TO EXISTING THREADS
-- =====================================================================
-- The drafter files identified ~200 additional Luke verse → target-verse
-- pairs whose thread_slug is an existing (non-S185-NEW) thread. Per S181 /
-- S183 discipline, extras-edition targets (1 Enoch, Jubilees, Sirach,
-- Tobit, Wisdom of Solomon, etc.) are NOT inserted here — only canon-edition
-- targets resolve via `_s185_luke_lookup`. The framework reading quotes
-- the extras inline within member_note for the reader's eye, even when
-- the cross_reference row points to a canon target.
--
-- VERIFIER DELTAS applied in this bulk pass:
--   - Drafter A Luke 2:32 attach to `i-am-statements-as-formed-cloud-rider-self-identification` REMOVED.
--   - Drafter B NEW 8 yochanan-greater converted to ATTACHes on `yochanan-as-eliyahu-pattern-prophet`.
--   - Drafter B Luke 9:54-56 keeps `shake-the-dust-off-rejection-response` AND adds `eliyahu-pattern-prophet-martyrdom`.
--   - Drafter B Luke 7:1-10 primary attach is `my-brethren-substance-distinguishing-the-seed-of-promise-from-the-categorical-nations`; cross-witness on `canaanite-woman-master`.
--   - Drafter C Luke 18:13-14 → `shake-the-dust-off-rejection-response` REJECTED (not included).
--   - Drafter C Luke 17:11-19 → `canaanite-woman-master` REJECTED (Samaritan is scattered-northern-witness per Red Line #7).
--   - Drafter D NEW 3 twelve-thrones converted to ATTACH on `the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii`.
--   - VERIFIER-ADDED rows: Luke 1:32-33 → messianic-line-preservation-by-sovereign-decree;
--     Luke 1:46-55 → scattered-seed-gathering (dual-attach with NEW 1 magnificat);
--     Luke 7:50, 8:48, 17:19, 18:42 → my-sheep-hear-my-voice-hearing-reveals-not-creates;
--     Luke 19:46 → gather-together-in-one-the-children-scattered-abroad;
--     Luke 22:42 → gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father;
--     Luke 22:69 → sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth;
--     Luke 23:46 → the-hour-and-the-cup-of-the-fathers-wrath.
--   - YOSHI #4: Luke 19:38 renders *Yahuah (the Lord)* per S182 NT-Lord-in-OT-quotation (Tehillim 118:26 Hebrew is YHWH).
--   - YOSHI #5: Luke 22:30 *krinontes* in twelve-thrones ATTACH renders as Tanakh-sense ruling/administering (Shoftim-pattern).
--   - YOSHI #6: Luke 13:34 dual-attach to scattered-seed-gathering AND the-blood-of-hevel-crying-and-the-mother-hen-gathering confirmed.
-- =====================================================================

WITH input(thread_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, member_note) AS (VALUES
  -- ===== Luke 1 — Annunciation, Magnificat, Benedictus =====
  ('scattered-seed-gathering', 1, 16, 'hosea', 1, 10, E'The angel''s word over Yochanan (John) — *and many of the children of Yashar''el (Israel) shall he turn to Yahuah (the Lord) their Elohim (God)* — is the Hoshea (Hosea) 1:10 ingathering already at the door. The Lo-Ammi to sons-of-the-living-Elohim turn begins with the Eliyahu-pattern (Elijah-pattern) prophet''s voice in the wilderness. Many — not all — because the post-harvest sifting is still future; the turning is the begin of the gathering, not the end of it.'),
  ('yochanan-as-eliyahu-pattern-prophet', 1, 17, 'malachi', 4, 5, E'*And he shall go before him in the spirit and power of Eliyahu (Elijah), to turn the hearts of the fathers to the children, and the disobedient to the wisdom of the just; to make ready a people prepared for Yahuah (the Lord).* The angel quotes Mal''aki (Malachi) 4:5-6 directly into Zecharyah (Zacharias)''s ear. Yochanan (John) is the Eliyahu-pattern; not Eliyahu himself, but the prophet in his spirit-and-power, doing the prepared-people work.'),
  ('gather-together-in-one-the-children-scattered-abroad', 1, 17, 'ezekiel', 37, 16, E'The Eliyahu-pattern prophet turning the hearts of the fathers to the children is the same two-stick reuniting work Yechezk''el (Ezekiel) 37 names. The fathers (Avraham, Yitschaq, Ya''aqov) are asleep awaiting the resurrection; the children are the scattered seed living estranged from them. Turning the children''s hearts to the fathers is the gathering already begun in the womb of Elisheva (Elizabeth).'),
  ('the-seed-of-promise-is-singular-paternal', 1, 31, '2-samuel', 7, 12, E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: and he shall reign over the house of Ya''aqov (Jacob) for ever.* The angel''s word is the 2 Samuel 7 Davidic promise landing on the paternal-seed-singular — *to thy seed, which is HaMashiach (Christ).* The throne goes to ONE seed in the line of David, not to a metaphorical extension. The *house of Ya''aqov* names all twelve tribes, not a metaphorical Yashar''el (Israel).'),
  -- VERIFIER-ADDED Luke 1:32-33 → messianic-line-preservation-by-sovereign-decree:
  ('messianic-line-preservation-by-sovereign-decree', 1, 32, '2-samuel', 7, 12, E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David.* The 2 Samuel 7:12-13 Davidic covenant preserved through the line — the angel''s naming over the unborn King secures the same paternal-seed-singular Messianic-line the Tanakh has carried under sovereign-decree from Bereshit 49:10''s scepter-not-departing onward.'),
  ('messianic-line-preservation-by-sovereign-decree', 1, 33, 'daniel', 7, 14, E'*And of his kingdom there shall be no end.* The Daniyel (Daniel) 7:14 *his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* — the angel''s declaration over Miriam (Mary) names the eternal-kingdom-of-the-Son-of-Adam preserved through Davidic-line by sovereign-decree.'),
  ('word-made-flesh-formed-of-the-formless', 1, 35, 'john', 1, 14, E'*That holy thing which shall be born of thee shall be called the Son of Elohim (God).* The Formed-one drawn from the Formless takes flesh in the womb of a daughter-of-Yashar''el (Israel). The same Word of Yochanan (John) 1:14 who *dwelt among us* is here being conceived. The angel''s word *the power of the Highest shall overshadow thee* is the Formless-Father''s act of bringing forth the Formed-Son into flesh by the Ruach HaKodesh (Holy Spirit).'),
  -- VERIFIER-ADDED Luke 1:46-55 dual-attach with NEW 1 magnificat → scattered-seed-gathering:
  ('scattered-seed-gathering', 1, 46, 'hosea', 1, 10, E'Miriam (Mary)''s Magnificat (Luke 1:46-55) carries the scattered-seed-gathering substance in song-form. The closing *He hath holpen his servant Yashar''el (Israel), in remembrance of his mercy; as he spake to our fathers, to Avraham (Abraham), and to his seed for ever* (vv.54-55) IS the Hoshea (Hosea) 1:10 reversal-architecture: the gathering is the keeping of the Avraham-seed-promise the Father swore *for ever.* Not church-replacement; covenant-keeping. (Dual-attach: also the anchor of NEW thread magnificat-as-hannah-pattern-and-the-gathering-song-of-the-daughter-of-yasharel.)'),
  ('scattered-seed-gathering', 1, 54, 'hosea', 1, 10, E'*He hath holpen his servant Yashar''el (Israel), in remembrance of his mercy; as he spake to our fathers, to Avraham (Abraham), and to his seed for ever.* The gathering Miriam (Mary) is naming is not the church-replacement gathering — it is the Avraham-seed-promise the Father swore *for ever.* The Hoshea (Hosea) 1:10 reversal is the architecture; the Magnificat is the song.'),
  ('avraham-reckoned-before-circumcision', 1, 55, 'genesis', 17, 7, E'*As he spake to our fathers, to Avraham (Abraham), and to his seed for ever.* Miriam (Mary) is naming the everlasting covenant of Bereshit (Genesis) 17:7 — *to be a Elohim (God) unto thee, and to thy seed after thee* — and locating her son inside it as the keeping of that oath. The covenant the Reformation collapsed into a faith-confession is here named by a daughter-of-Yashar''el as a paternal-seed-promise to her fathers.'),
  ('gospel-promised-afore', 1, 67, 'isaiah', 11, 1, E'*Blessed be Yahuah Elohim (the Lord God) of Yashar''el (Israel); for he hath visited and redeemed his people, and hath raised up an horn of salvation for us in the house of his servant David; as he spake by the mouth of his holy prophets, which have been since the world began.* Zecharyah (Zacharias) names exactly what *gospel-promised-afore* names — the redemption is *as he spake by the mouth of his holy prophets,* the horn-of-salvation rising in the house of David is the Yeshayahu (Isaiah) 11:1 branch out of the stem of Yishai (Jesse).'),
  ('scattered-seed-gathering', 1, 68, 'jeremiah', 31, 10, E'*He hath visited and redeemed his people... that we should be saved from our enemies, and from the hand of all that hate us.* The redemption Zecharyah (Zacharias) names is the Yirmeyahu (Jeremiah) 31:10 *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* The Benedictus is the priestly father''s song of the gathering already at the door.'),
  ('avraham-reckoned-before-circumcision', 1, 72, 'genesis', 22, 16, E'*To perform the mercy promised to our fathers, and to remember his holy covenant; the oath which he sware to our father Avraham (Abraham).* Zecharyah (Zacharias) names the Bereshit (Genesis) 22:16-18 oath — *by myself have I sworn, saith Yahuah (the LORD)... in thy seed shall all the nations of the earth be blessed.* The oath stands. The Benedictus is the priestly witness that the oath is being kept now.'),
  ('yochanan-as-eliyahu-pattern-prophet', 1, 76, 'malachi', 3, 1, E'*And thou, child, shalt be called the prophet of the Highest: for thou shalt go before the face of Yahuah (the Lord) to prepare his ways.* Zecharyah (Zacharias) quotes Mal''aki (Malachi) 3:1 over his own son. The Eliyahu-pattern prophet''s preparation-of-the-way is what the priestly father names from the priestly altar — the temple priesthood itself testifying that the day-before-the-day has arrived.'),
  -- ===== Luke 2 — Birth, Shepherds, Simeon, Anna =====
  ('pharaoh-mosheh-herod-yahusha-infant-slaughter', 2, 1, 'matthew', 2, 1, E'*And it came to pass in those days, that there went out a decree from Caesar Augustus, that all the world should be taxed.* Luke names the imperial decree as the providential mechanism that brings Miriam (Mary) to Beit-Lechem (Bethlehem) for the Mikhah (Micah) 5:2 birth-place fulfillment — the same Father who moved Pharaoh''s heart and used Herod''s reckoning is moving Caesar''s decree, all without their knowing, to bring the deliverer to the prepared place.'),
  ('trumpets-and-the-day-of-yahuah', 2, 13, 'revelation', 19, 1, E'*And suddenly there was with the angel a multitude of the heavenly host praising Elohim (God), and saying, Glory to Elohim (God) in the highest, and on earth peace, good will toward men.* The angelic multitude at the birth is the same heavenly hosts that praise around the throne in Revelation 19 — the heavens stand witness at the moment the Formed-one steps into flesh, just as they will stand witness at his return.'),
  ('gather-together-in-one-the-children-scattered-abroad', 2, 38, 'isaiah', 52, 9, E'*And she coming in that instant gave thanks likewise unto Yahuah (the Lord), and spake of him to all them that looked for redemption in Yerushalayim (Jerusalem).* Anna of the tribe of Asher — a NORTHERN-TRIBE daughter — names the redemption of Yerushalayim before it begins. The same redemption Yeshayahu (Isaiah) 52:9 names is the one the prophetess identifies in the temple. The northern witness in the southern city is the framework''s two-house architecture already standing at the cradle.'),
  ('son-of-adam-as-judge-and-ladder', 2, 49, 'john', 2, 16, E'*Wist ye not that I must be about my Father''s business?* The twelve-year-old in the temple names the Father-Son relation that the Yochanan (John) 2 cleansing of the temple names — *make not my Father''s house an house of merchandise.* The Formed-Son''s first recorded words in Luke are the same Father-naming the Yochanan gospel returns to throughout.'),
  -- ===== Luke 3 — Yochanan's Investiture, Genealogy =====
  ('yochanan-as-eliyahu-pattern-prophet', 3, 2, 'isaiah', 40, 3, E'Luke quotes Yeshayahu (Isaiah) 40:3 explicitly — *The voice of one crying in the wilderness, Prepare ye the way of Yahuah (the Lord), make his paths straight.* Yochanan''s (John''s) Eliyahu-pattern (Elijah-pattern) prophet ministry begins where the Tanakh said it would. Same scripture, same wilderness, same voice.'),
  ('scattered-seed-gathering', 3, 6, 'isaiah', 40, 5, E'*And all flesh shall see the salvation of Elohim (God).* Luke''s extension of the Yeshayahu (Isaiah) 40 citation through to v.5 is unique among the synoptics — Mark and Matthew stop at v.3. The *all flesh shall see* is the global-scope-because-the-sheep-are-scattered-through-every-nation reading, not the categorical-universal-Gentile-inclusion reading.'),
  ('watcher-rebellion-as-source-of-the-vipers', 3, 7, 'matthew', 3, 7, E'*O generation of vipers, who hath warned you to flee from the wrath to come?* Yochanan (John)''s rebuke of the Pharisees and Sadducees fires the same diagnostic Matthew 3:7 names — the *generation of vipers* identification points to the watcher-rebellion-tare-architecture that Bereshit (Genesis) 3:15 named at the gate of Eden.'),
  ('another-gospel-as-judaizer-flesh-credential', 3, 8, 'matthew', 3, 9, E'*And begin not to say within yourselves, We have Avraham (Abraham) to our father: for I say unto you, that Elohim (God) is able of these stones to raise up children unto Avraham (Abraham).* Yochanan (John) rebukes the Pharisaic flesh-credential gospel — being born a Yahudi (Jew) saves no one whose heart is not refined.'),
  ('post-harvest-sifting', 3, 17, 'matthew', 3, 12, E'*Whose fan is in his hand, and he will throughly purge his floor, and will gather the wheat into his garner; but the chaff he will burn with fire unquenchable.* The post-harvest sifting Yochanan (John) names is the wheat-from-chaff separation Yechezk''el (Ezekiel) 20:33-38 anchors. The wheat goes into the garner; the chaff is burned.'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 3, 21, 'matthew', 3, 17, E'*And it came to pass, that Yahusha (Jesus) also being baptized, and praying, the heaven was opened, and the Ruach HaKodesh (Holy Spirit) descended in a bodily shape like a dove upon him, and a voice came from heaven, which said, Thou art my beloved Son; in thee I am well pleased.* The Formless-Father''s voice names the Formed-Son in audible fashion at the moment of investiture. Luke adds *and praying,* placing the investiture inside the Son''s own prayer to the Father.'),
  ('heavens-opened-at-the-priestly-investiture', 3, 21, 'matthew', 3, 16, E'Luke uniquely says *the heaven was opened* (rather than Matthew''s *heavens were opened to him*) — the opening of heaven at the investiture is the same priestly-installation pattern 1 Enoch carries. The Son is installed in the priestly office by the Father''s voice from the open heaven.'),
  ('genealogy-as-adamic-toledot', 3, 23, 'matthew', 1, 1, E'Luke runs his genealogy backward from Yoseph (Joseph) through David, Avraham (Abraham), Noach (Noah), Shet (Seth), to *Adam, which was the son of Elohim (God)* (Luke 3:38). The Adamic toledot frame Matthew 1 opens with forward-running, Luke closes with backward-running.'),
  ('son-of-adam-as-judge-and-ladder', 3, 38, 'genesis', 5, 1, E'*Which was the son of Adam, which was the son of Elohim (God).* Luke''s genealogy lands at the same Bereshit (Genesis) 5:1 toledot of Adam that names Adam as made in the likeness of Elohim. The Son-of-Adam-as-ladder substance is anchored here.'),
  -- ===== Luke 4 — Wilderness Temptation, Nazareth Sermon =====
  ('azazel-bound-in-the-wilderness-as-the-temptation-ground', 4, 1, 'matthew', 4, 1, E'*And Yahusha (Jesus) being full of the Ruach HaKodesh (Holy Spirit) returned from Yarden (Jordan), and was led by the Spirit into the wilderness, being forty days tempted of the devil.* Luke''s wilderness is the same wilderness Matthew 4:1 names — the Azazel-bound-territory where the watcher-rebellion''s chief is restrained but still operating.'),
  ('temptation-as-mastema-architecture', 4, 3, 'matthew', 4, 3, E'*If thou be the Son of Elohim (God), command this stone that it be made bread.* The Lukan first-temptation is the Mastema-architecture-test — the satan questioning the Father''s word over the Son, the same *did Elohim (God) really say?* the serpent put in the garden.'),
  ('kingdoms-now-under-watcher-rebellion-administration', 4, 5, 'matthew', 4, 8, E'*And the devil, taking him up into an high mountain, shewed unto him all the kingdoms of the world in a moment of time. And the devil said unto him, All this power will I give thee, and the glory of them: for that is delivered unto me; and to whomsoever I will I give it.* Luke uniquely records the satan saying *that is delivered unto me* — the kingdoms-now-under-watcher-rebellion-administration substance is named by the satan''s own mouth.'),
  ('spirit-anointed-elect-one-the-spirit-of-wisdom-on-the-son-in-1-enoch', 4, 18, 'matthew', 12, 18, E'*The Spirit of Yahuah (the Lord) is upon me, because he hath anointed me to preach the gospel to the poor; he hath sent me to heal the brokenhearted, to preach deliverance to the captives, and recovering of sight to the blind, to set at liberty them that are bruised, to preach the acceptable year of Yahuah (the Lord).* Luke 4:18-19 IS the Spirit-anointed-Elect-One-self-identification — the same 1 Enoch 49 / 62 register Matthew 12:18 carries, here read by the Son from the scroll at the Natsareth (Nazareth) synagogue and applied to himself in real time. FRAMEWORK-MAJOR.'),
  ('fulfill-as-prophecy-bringing-to-pass', 4, 21, 'isaiah', 61, 1, E'*This day is this scripture fulfilled in your ears.* The King reads Yeshayahu (Isaiah) 61:1-2a and stops — and then names the fulfillment. The fulfilling-as-bringing-to-pass is the King''s own act of stopping mid-verse: *the acceptable year of Yahuah* is fulfilled today; *the day of vengeance* is left unread because it is not yet today.'),
  ('canaanite-woman-master', 4, 25, 'matthew', 15, 24, E'The King at Natsareth (Nazareth) points to Eliyahu (Elijah) and the widow of Tsarephath (Zarephath), and Elisha and Naaman the Syrian — the individual-mercy contrast cases the framework holds against the false-inclusion-gospel. These are foreign-origin individuals receiving mercy without absorption into the seed-of-promise.'),
  ('unclean-spirits-recognize-the-holy-one-of-elohim', 4, 33, 'mark', 1, 24, E'*Saying, Let us alone; what have we to do with thee, thou Yahusha (Jesus) of Natsareth (Nazareth)? art thou come to destroy us? I know thee who thou art; the Holy One of Elohim (God).* The Capernaum-synagogue unclean spirit names the King with the exact phrase the Mark 1:24 unclean spirit names. The watchers'' offspring recognize the Formed-one when he walks in.'),
  ('lost-sheep-mission-scope', 4, 43, 'matthew', 15, 24, E'*I must preach the kingdom of Elohim (God) to other cities also: for therefore am I sent.* The King''s *therefore am I sent* names the mission scope — to the lost sheep of the house of Yashar''el (Israel), city by city, through the Galilean territory where the scattered live.'),
  -- ===== Luke 5 — Catch of Fish, Leper, Paralytic, Levi, Wineskins =====
  ('animal-apocalypse-gathering-of-the-dispersed-sheep', 5, 10, 'matthew', 4, 19, E'*And Yahusha (Jesus) said unto Shimon (Simon), Fear not; from henceforth thou shalt catch men.* The Lukan call of Kefa (Peter) carries the same fishers-of-men-as-gatherers-of-the-dispersed-sheep substance Matthew 4:19 anchors. The miraculous catch (Luke 5:6-7 — nets breaking, two ships filled) is the prophetic sign-act of the great-multitude gathering.'),
  ('messiah-as-torah-affirming-healer', 5, 14, 'matthew', 8, 4, E'*And he charged him to tell no man: but go, and shew thyself to the priest, and offer for thy cleansing, according as Mosheh (Moses) commanded, for a testimony unto them.* The King sends the cleansed leper to the priest with the Vayikra (Leviticus) 14 offering — the same Torah-affirming move Matthew 8:4 carries.'),
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 5, 24, 'mark', 2, 10, E'*But that ye may know that the Son of Adam hath power upon earth to forgive sins, (he said unto the sick of the palsy,) I say unto thee, Arise, and take up thy couch, and go into thine house.* The Son-of-Adam self-identification at the paralytic-healing — *power upon earth to forgive sins* — is the same Daniyel (Daniel) 7 *Son-of-Adam* substance the King will name openly at the Sanhedrin trial.'),
  ('publicans-and-sinners-and-sirach-12-inverse', 5, 29, 'matthew', 9, 10, E'*And Levi made him a great feast in his own house: and there was a great company of publicans and of others that sat down with them. But their scribes and Pharisees murmured against his disciples, saying, Why do ye eat and drink with publicans and sinners?* The Lukan call of Levi and the table-fellowship that follows is the same Sirach-12-inverse the Matthew 9:10 catch names.'),
  ('bridegroom-messianic-identification', 5, 34, 'matthew', 9, 15, E'*Can ye make the children of the bridechamber fast, while the bridegroom is with them? But the days will come, when the bridegroom shall be taken away from them, and then shall they fast in those days.* The King''s bridegroom-self-identification names what Yeshayahu (Isaiah) 62:5 and Hoshea (Hosea) 2:19 already named — Yahuah (the LORD) is the bridegroom of his people.'),
  ('leaven-as-corruption-substance', 5, 36, 'matthew', 9, 17, E'*Neither do men put new wine into old bottles; else the new wine will burst the bottles, and be spilled, and the bottles shall perish. But new wine must be put into new bottles; and both are preserved.* The new-wine-and-old-bottles substance is the new-heart-and-new-spirit Yechezk''el (Ezekiel) 36:26-27 substance. The King''s *new wine* is not new Torah; it is the new heart that holds the same Torah without bursting.'),
  -- ===== Luke 6 — Sabbath, Twelve, Sermon on the Plain =====
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 6, 1, 'mark', 2, 23, E'The grain-plucking Shabbat controversy in Luke runs the same David-and-the-shewbread argument Mark 2:23-28 and Matthew 12:1-8 carry. *The Son of Adam is Lord also of the Shabbat.*'),
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 6, 6, 'mark', 3, 1, E'The withered-hand healing on Shabbat — *Is it lawful on the Shabbat to do good, or to do evil? to save life, or to destroy it?* — is the same heart-Shabbat-versus-Pharisaic-fence move Mark 3 and Matthew 12 carry. Luke uniquely closes with *they were filled with madness* (v.11), naming the Pharisees'' fury at the heart-Torah override of their fence-system.'),
  ('twelve-apostles-twelve-tribes-restoration-architecture', 6, 12, 'matthew', 10, 1, E'*And it came to pass in those days, that he went out into a mountain to pray, and continued all night in prayer to Elohim (God). And when it was day, he called unto him his disciples: and of them he chose twelve, whom also he named apostles.* The choosing of the twelve is the twelve-tribes-restoration architecture. Luke uniquely notes the all-night prayer that precedes the choosing.'),
  ('beatitudes-as-righteous-elect-blessing-register', 6, 20, 'matthew', 5, 3, E'The Lukan Beatitudes (Sermon on the Plain) carry the same righteous-elect-blessing-register substance Matthew 5:3 anchors — *blessed be ye poor: for yours is the kingdom of Elohim (God).* Luke''s version is shorter, second-person, and immediately followed by the *woes* (vv.24-26).'),
  ('woes-on-the-rich-and-riches-cannot-save-in-1-enoch', 6, 24, 'matthew', 19, 23, E'*But woe unto you that are rich! for ye have received your consolation.* The Lukan Woes are the 1 Enoch 94-100 woes-on-the-rich register in the King''s own mouth — the reversal-architecture Wisdom of Solomon 3 and 5 also carry. The woes are paired with the blessings so the reader hears both sides of the post-harvest sifting at once.'),
  ('mercy-on-enemies-as-the-father-pattern', 6, 27, 'matthew', 5, 43, E'*But I say unto you which hear, Love your enemies, do good to them which hate you, bless them that curse you, and pray for them which despitefully use you... Be ye therefore merciful, as your Father also is merciful.* The Lukan love-your-enemies teaching closes on the Father-pattern.'),
  ('judge-not-and-let-go-anger-in-sirach', 6, 37, 'matthew', 7, 1, E'*Judge not, and ye shall not be judged: condemn not, and ye shall not be condemned: forgive, and ye shall be forgiven: give, and it shall be given unto you.* The Lukan judge-not architecture is the same Sirach 27-28 just-judgment substance Matthew 7:1 anchors.'),
  ('by-their-fruits-and-the-utterance-of-the-heart-in-sirach', 6, 43, 'matthew', 7, 15, E'*For every tree is known by his own fruit... A good man out of the good treasure of his heart bringeth forth that which is good.* The Lukan tree-and-fruit teaching ties the fruit-diagnostic to the heart-utterance — Sirach 27:6 substance directly. The mouth speaks the heart''s abundance; the fruit reveals the tree.'),
  ('lord-lord-and-torahlessness', 6, 46, 'matthew', 7, 21, E'*And why call ye me Lord, Lord, and do not the things which I say?* The Lukan *Lord, Lord* is the same diagnostic Matthew 7:21 names — profession without obedience is identified as falsehood by the 1 Yochanan (John) 2:3-4 standard.'),
  ('wise-and-foolish-builders-and-the-heart-stablished-in-sirach', 6, 47, 'matthew', 7, 24, E'The Lukan wise-and-foolish-builders carries the same Sirach 22:16-18 heart-stablished substance Matthew 7:24-27 anchors. Luke uniquely names the *deep* — *digged deep, and laid the foundation on a rock.*'),
  -- ===== Luke 7 — Centurion, Yochanan-attaches =====
  ('my-brethren-substance-distinguishing-the-seed-of-promise-from-the-categorical-nations', 7, 9, 'matthew', 8, 10, E'*I have not found so great faith, no, not in Yashar''el (Israel).* The verdict frames the centurion''s faith against the seed-of-promise body — the framework''s individual-mercy carveout per Red Line #7. The Gentile centurion receives mercy without absorption; the seed-of-promise body remains the audience of the gathering.'),
  ('canaanite-woman-master', 7, 1, 'matthew', 8, 5, E'The centurion at Capernaum is the parallel individual-mercy case to the Canaanite woman at Matthew 15 / Mark 7 — a Gentile-origin individual receiving mercy without absorption into the seed-of-promise. (Cross-witness on canaanite-woman-master; primary thread is my-brethren-substance per verifier.)'),
  ('yochanan-as-eliyahu-pattern-prophet', 7, 27, 'malachi', 3, 1, E'*This is he, of whom it is written, Behold, I send my messenger before thy face, which shall prepare thy way before thee.* The King''s own Mal''aki (Malachi) 3:1 attribution of Yochanan (John) as the Eliyahu (Elijah)-pattern messenger.'),
  ('yochanan-as-eliyahu-pattern-prophet', 7, 28, 'matthew', 11, 11, E'*Among those that are born of women there is not a greater prophet than Yochanan (John) the Baptist: but he that is least in the kingdom of Elohim (God) is greater than he.* The synoptic parallel at Matthew 11:11 — the King''s verdict on Yochanan as the Eliyahu-pattern messenger; the *least in the kingdom is greater* names the architecture of the new-covenant restoration giving those who enter the kingdom a covenant-position Yochanan''s prophetic office did not occupy.'),
  ('yochanan-as-eliyahu-pattern-prophet', 7, 29, 'john', 10, 27, E'*And all the people that heard him, and the publicans, justified Elohim (God), being baptized with the baptism of Yochanan (John). But the Pharisees and lawyers rejected the counsel of Elohim (God) against themselves, being not baptized of him.* The hearing-and-turning the King names — *my sheep hear my voice* (John 10:27). The publicans heard; the system-credentialed rejected.'),
  ('yochanan-as-eliyahu-pattern-prophet', 7, 33, '1-kings', 19, 8, E'*For Yochanan (John) the Baptist came neither eating bread nor drinking wine.* The Eliyahu (Elijah)-pattern ascetic-register the King names as Yochanan''s signature, matching Eliyahu''s wilderness-fasting at 1 Melakhim (Kings) 19:8.'),
  ('eliyahu-pattern-prophet-martyrdom', 7, 24, '1-kings', 19, 10, E'The reed-shaken-with-the-wind verdict the King refuses on Yochanan (John)''s behalf — Yochanan is the Eliyahu (Elijah)-pattern prophet, including the prophetic-martyrdom register Eliyahu walked under Yzevel (Jezebel).'),
  -- VERIFIER-ADDED Luke 7:50 → my-sheep-hear-my-voice:
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 7, 50, 'john', 10, 27, E'*Thy faith hath saved thee; go in peace.* The first of four Lukan *thy faith hath saved/made-thee-whole* verdicts (Luke 7:50; 8:48; 17:19; 18:42). The faith that saves is the response of the sheep who hears the shepherd''s voice — hearing reveals what the Father had already placed.'),
  -- ===== Luke 8 — Sower, Lamp, Family, Gadarene, Talitha Cumi =====
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 8, 4, 'matthew', 13, 3, E'The parable of the sower in Luke''s register — same architecture as Matthew 13 / Mark 4. The four soils walk the cause-and-effect-of-hearing diagnostic: the seed is one, the soil reveals what is already true of each hearer.'),
  ('parables-of-the-kingdom-and-the-cause-and-effect-of-hearing', 8, 10, 'matthew', 13, 11, E'*Unto you it is given to know the mysteries of the kingdom of Elohim (God): but to others in parables; that seeing they might not see, and hearing they might not understand.* The cause-and-effect-of-hearing the King states explicitly — the parables are not pedagogy designed to clarify; they are the mechanism by which the Father reveals to the elect.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 8, 8, 'john', 10, 27, E'*He that hath ears to hear, let him hear.* The same hearing-architecture Yochanan (John) 10:27 names — the sheep hear and turn, the hearing reveals what the Father had placed.'),
  ('kinship-redefinition-kingdom-family', 8, 21, 'matthew', 12, 50, E'*My mother and my brethren are these which hear the word of Elohim (God), and do it.* The framework-substance: hearing-and-doing reveals the family. The cause-and-effect-of-hearing diagnostic in compressed form.'),
  ('gadarene-demoniac-legion-and-the-eastern-territory-of-the-scattered', 8, 26, 'mark', 5, 1, E'The Lukan parallel to the Markan Gerasene-demoniac (Luke renders it Gadarene). Same architecture — the King crosses the sea to the eastern shore (territory of Reuven (Reuben) / Gad / half-Manasseh), legion cast into swine, delivered man becomes first proclaimer.'),
  ('talitha-cumi-and-the-twelve-year-resurrection-of-the-daughter-of-the-house', 8, 41, 'mark', 5, 21, E'The Lukan parallel to the Markan raising of Yair''s (Jairus''s) daughter, paired with the woman with the issue of blood — both twelve-year-women. Luke renders the Aramaic *Talitha cumi* differently (just *Maid, arise,* Luke 8:54), but the framework architecture is the same.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 8, 48, 'john', 10, 27, E'*Daughter, thy faith hath made thee whole; go in peace.* The second of four Lukan *thy faith hath saved/made-thee-whole* verdicts. The hearing reveals what the Father had placed; the *daughter* address names her in the seed-of-promise.'),
  -- ===== Luke 9 — Twelve sent, Feeding 5000, Confession, Transfiguration =====
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 9, 1, 'matthew', 10, 5, E'The Twelve sent out at Luke 9 — the same commissioning architecture as Matthew 10, working out the gathering of the scattered seed first through Yashar''eli (Israelite) territory.'),
  ('shake-the-dust-off-rejection-response', 9, 5, 'matthew', 10, 14, E'*Whosoever will not receive you, when ye go out of that city, shake off the very dust from your feet for a testimony against them.* The framework''s reading: the pursuit ends where the rejection lands; we do not chase the nations into a worship they will not give.'),
  ('wilderness-feeding-as-messianic-banquet-pre-figuration', 9, 10, 'matthew', 14, 13, E'The feeding of the five thousand in Luke''s register — the same wilderness-feeding-as-messianic-banquet substance with the twelve baskets answering the twelve tribes.'),
  ('caesarea-philippi-confession-the-rock-the-keys-the-assembly', 9, 18, 'matthew', 16, 13, E'Luke renders Kefa''s (Peter''s) confession in a quieter register — *the Mashiach (Christ) of Elohim (God)* (Luke 9:20). Same architecture as Matthew 16 / Mark 8.'),
  ('first-passion-prediction-and-the-must-of-the-passion', 9, 21, 'matthew', 16, 21, E'*The Son of Adam must suffer many things... and be slain, and be raised the third day.* The first-passion-prediction in Luke''s register — the *must* (Greek *dei*) of the suffering, the Yeshayahu (Isaiah) 53 / Tehillim (Psalm) 22 architecture the King is walking toward consciously.'),
  ('take-up-the-cross-discipleship-cost', 9, 23, 'matthew', 16, 24, E'*If any man will come after me, let him deny himself, and take up his cross daily, and follow me.* Luke alone adds *daily* — the cross is a daily walking, not a one-time-transaction.'),
  ('the-formless-father-and-the-formed-son-witnessed-in-ascension-of-isaiah', 9, 28, 'matthew', 17, 1, E'The Lukan Transfiguration parallel — Mosheh (Moses) and Eliyahu (Elijah) appearing in glory, the Father-voice naming *This is my beloved Son: hear him* (Luke 9:35). The Formless-Father / Formed-Son architecture witnessed in the Ascension of Isaiah 9-10 seventh-heaven framing.'),
  ('father-voice-naming-the-son-of-adam-at-the-investiture', 9, 35, 'matthew', 17, 5, E'*This is my beloved Son: hear him.* The Father-voice at the Transfiguration, paired with the Father-voice at the baptism (Luke 3:22) — the same naming of the Son the prophetic / extra-canonical witnesses also carry.'),
  ('the-son-of-adam-glorified-in-1-enoch-throne-vision-and-parables', 9, 32, 'matthew', 17, 2, E'*They saw his glory, and the two men that stood with him.* The Lukan emphasis on the glory of the Transfiguration ties straight to the 1 Enoch 14 / 46 / 49 / 62 Son-of-Adam-in-glorified-form witness.'),
  -- Luke 9:54-56 — VERIFIER REDIRECT: keep shake-the-dust-off AND add eliyahu-pattern-prophet-martyrdom:
  ('shake-the-dust-off-rejection-response', 9, 54, 'matthew', 10, 14, E'The Samaritan village rejection — the disciples'' *Lord, wilt thou that we command fire to come down from heaven, and consume them, even as Eliyahu (Elijah) did?* (Luke 9:54) is the wrong application of the Eliyahu (Elijah)-prophetic register. The King''s rebuke — *the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:56) — names the seventy-sent-out posture of v.5: rejection means shaking-the-dust-off, not calling-fire-down.'),
  ('eliyahu-pattern-prophet-martyrdom', 9, 54, '2-kings', 1, 10, E'The disciples invoked Eliyahu''s (Elijah''s) call-down-fire-from-heaven precedent (2 Melakhim/Kings 1:10) by name — *even as Eliyahu (Elijah) did.* The King rebukes the application: Yochanan (John) walked Eliyahu''s pattern unto martyrdom, but the consume-them-with-fire move is not the Eliyahu-pattern the Son of Adam came to walk. The pattern the King will walk is the rejected-prophet''s substance laid down — death poured out, not fire called down.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 9, 57, 'john', 10, 27, E'The would-be-disciples sayings — *Lord, suffer me first to go and bury my father* (Luke 9:59); *Lord, I will follow thee; but let me first go bid them farewell* (Luke 9:61) — name the cause-and-effect-of-hearing diagnostic: the sheep hear and turn, the half-hearted-hearing fails under the test of the cost.'),
  -- ===== Luke 10 — Seventy return, Lord's Prayer (NOT here — under NEW 8/9), Beelzebub =====
  ('binding-of-the-watchers-typological-anchor-for-binding-the-strong-man', 10, 17, 'matthew', 12, 28, E'*And the seventy returned again with joy, saying, Lord, even the devils are subject unto us through thy name* (Luke 10:17). The seventy''s authority over the devils is the working-out of the binding-the-strong-man substance the King had already named — the Watcher-administration being undone in territory the seventy walked.'),
  ('kingdoms-now-under-watcher-rebellion-administration', 10, 18, 'daniel', 7, 25, E'*I beheld ha-satan (Satan) as lightning fall from heaven.* The Watcher-rebellion / kingdoms-under-the-administration substance — the seventy''s territory-by-territory undoing of the unclean-spirit administration IS the working-out of the lightning-fall the King saw.'),
  -- ===== Luke 11 — Lord's Prayer, Beelzebub, Unclean spirit return, Sign of Yonah, Single eye =====
  ('forgive-thy-neighbour-as-sirach-and-the-lords-prayer', 11, 1, 'matthew', 6, 9, E'The Lukan version of the Lord''s Prayer — same Father / kingdom / daily-bread / forgiveness-as-we-forgive / temptation architecture as Matthew 6:9-13.'),
  ('binding-of-the-watchers-typological-anchor-for-binding-the-strong-man', 11, 14, 'matthew', 12, 28, E'The Lukan Beelzebub-controversy and the divided-house argument — same architecture as Matthew 12 / Mark 3, with the *stronger-than-he* binding-the-strong-man substance the framework reads as the Watcher-binding architecture from 1 Enoch 10 / Jubilees 10.'),
  ('adam-and-the-inherited-evil-heart-needing-the-new-heart-cleansing', 11, 24, 'matthew', 12, 43, E'The return of the unclean spirit with seven worse than himself — the empty-house architecture pointing to the new-heart cleansing without which exorcism is incomplete. Same substance as Matthew 12:43-45.'),
  ('sign-of-yonah-resurrection-credential', 11, 29, 'matthew', 12, 39, E'*No sign shall be given it, but the sign of Yonah (Jonah) the prophet.* Luke''s version emphasizes the preaching-as-the-sign more than Matthew''s three-days-three-nights emphasis, but the same Yonah-as-resurrection-credential substance.'),
  ('the-single-eye-of-issachar-and-the-evil-eye-of-sirach', 11, 33, 'matthew', 6, 22, E'*The light of the body is the eye: therefore when thine eye is single, thy whole body also is full of light.* Same single-eye-and-body-full-of-light architecture as Matthew 6:22-23.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 11, 27, 'john', 10, 27, E'*Yea rather, blessed are they that hear the word of Elohim (God), and keep it.* Luke alone carries the woman''s blessing-of-the-womb and the King''s correction — the blessedness is not by physical-lineage to him as a son-of-Adam by birth, but by hearing-and-keeping the Word.'),
  ('kinship-redefinition-kingdom-family', 11, 27, 'matthew', 12, 50, E'The same hearing-and-doing-reveals-the-family substance the King had named at Luke 8:21. Luke''s twin pericope.'),
  -- ===== Luke 12 — Leaven, Fear-not, Spirit-teach, Treasure, Watchful, Stewards, Fire-division =====
  ('leaven-as-corruption-substance', 12, 1, 'matthew', 16, 6, E'*Beware ye of the leaven of the Pharisees, which is hypocrisy.* Luke specifies the leaven as hypocrisy in plain words — the framework-substance of the Pharisaic-system-as-fermenting-corruption.'),
  ('names-in-the-books-of-life-not-blotted-out-in-1-enoch-103', 12, 8, 'matthew', 10, 32, E'*Whosoever shall confess me before men, him shall the Son of Adam also confess before the angels of Elohim (God): But he that denieth me before men shall be denied before the angels of Elohim (God).* The confess-or-deny architecture tied to the books-of-life.'),
  ('blasphemy-against-the-ruach-warning', 12, 10, 'matthew', 12, 31, E'*Unto him that blasphemeth against the Ruach HaKodesh (Holy Spirit) it shall not be forgiven.* Luke''s version preserves the warning the framework reads as the no-place-of-repentance for the hardened disposition.'),
  ('treasures-laid-up-by-the-open-hand-in-tobit-and-sirach', 12, 33, 'matthew', 6, 19, E'*Provide yourselves bags which wax not old, a treasure in the heavens that faileth not... For where your treasure is, there will your heart be also.* The treasure-in-heaven substance — same architecture as Matthew 6:19-21 and the Tobit / Sirach wisdom-stream witness.'),
  ('the-righteous-in-the-fathers-hand-in-wisdom', 12, 22, 'matthew', 6, 25, E'The consider-the-lilies / consider-the-ravens architecture — same substance as Matthew 6:25-34 with the Lukan addition of *Fear not, little flock; for it is your Father''s good pleasure to give you the kingdom* (Luke 12:32).'),
  ('the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon', 12, 42, 'matthew', 24, 45, E'The faithful and wise steward, the much-given-much-required architecture — same substance as Matthew 24:45-51.'),
  ('grace-and-the-opportunity-that-can-be-lost', 12, 47, 'matthew', 25, 14, E'*That servant, which knew his lord''s will, and prepared not himself, neither did according to his will, shall be beaten with many stripes.* The framework''s post-harvest-sifting substance — names get blotted out for lawlessness in the watching wheat. *Much given, much required* (Luke 12:48) is the standard.'),
  ('family-division-in-the-day-of-destruction-in-1-enoch', 12, 49, 'matthew', 10, 34, E'*I am come to send fire on the earth... Suppose ye that I am come to give peace on earth? I tell you, Nay; but rather division.* Same family-division architecture as Matthew 10:34-36; the seed-war runs at the family-level.'),
  ('post-harvest-sifting', 12, 54, 'ezekiel', 20, 33, E'The discerning-the-time / reconciling-with-the-adversary register — the framework''s substance of recognizing the appointed-hour while it is still being walked toward. The wheat that does not discern is the unfruitful-wheat the warning falls on.'),
  -- ===== Luke 13 — Except-ye-repent (NEW 14), fig tree, daughter-of-Avraham (NEW 15), Yerushalayim lament =====
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 13, 29, 'matthew', 8, 11, E'*And they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God)* (Luke 13:29) — the four-winds gathering language. NOT the inherited Gentile-inclusion gospel; the prophetic-gathering of the scattered seed of Yashar''el (Israel) from the territories of dispersion. Yeshayahu (Isaiah) 43:5-6 substance.'),
  -- VERIFIER-CONFIRMED Luke 13:34 DUAL-ATTACH:
  ('scattered-seed-gathering', 13, 34, 'hosea', 1, 9, E'*O Yerushalayim (Jerusalem), Yerushalayim (Jerusalem), which killest the prophets, and stonest them that are sent unto thee; how often would I have gathered thy children together, as a hen doth gather her brood under her wings, and ye would not!* (Luke 13:34) — the gathering-substance the King names with his own voice, in the same scattered-seed register the rest of the prophetic-tradition carries.'),
  ('the-blood-of-hevel-crying-and-the-mother-hen-gathering-in-1-enoch-and-2-esdras', 13, 34, 'matthew', 23, 37, E'The same mother-hen-gathering lament Yahusha (Jesus) speaks twice — at Luke 13:34 over Yerushalayim (Jerusalem), and at Matthew 23:37 in the temple discourse. The two registers carry the same substance: *how often would I have gathered thy children together, as a hen doth gather her brood under her wings, and ye would not!* (Dual-attach confirmed per Yoshi S185 #6: Lukan placement distinct from Matt 23:37-39 placement, intentional.)'),
  ('leaven-as-corruption-substance', 13, 20, 'matthew', 13, 33, E'*It is like leaven, which a woman took and hid in three measures of meal, till the whole was leavened* (Luke 13:20-21) — the framework reading of leaven across the gospels is the corruption-substance, not the kingdom-growth-substance the inherited pulpit teaches.'),
  -- ===== Luke 14 — Shabbat-dropsy, lowest-seat (NEW 16), great supper (NEW 17), count cost (NEW 18) =====
  ('shabbat-controversy-heart-shabbat-vs-pharisaic-fence', 14, 1, 'mark', 2, 27, E'The Shabbat-healing of the man with dropsy at the Pharisee-ruler''s house. The King asks *Is it lawful to heal on the sabbath day?* (v.3) — they hold their peace. Same heart-shabbat the framework restores — the day-Yahuah-hallowed is for the people, not against the people.'),
  ('take-up-the-cross-discipleship-cost', 14, 27, 'matthew', 16, 24, E'*And whosoever doth not bear his cross, and come after me, cannot be my disciple* (Luke 14:27) — the bearing-the-cross discipleship-cost the King teaches across the gospels.'),
  ('kinship-redefinition-kingdom-family', 14, 26, 'mark', 3, 33, E'*If any man come to me, and hate not his father, and mother, and wife, and children, and brethren, and sisters, yea, and his own life also, he cannot be my disciple* (Luke 14:26) — the same kinship-redefinition Yahusha (Jesus) walks at Mark 3:33''s *Who is my mother, or my brethren?* The Hebrew idiom for relative-preference, not literal-hatred.'),
  -- ===== Luke 15 — Three lost parables =====
  ('scattered-seed-gathering', 15, 4, 'hosea', 1, 9, E'The lost-sheep parable, Lukan placement. *What man of you, having an hundred sheep, if he lose one of them, doth not leave the ninety and nine in the wilderness, and go after that which is lost, until he find it?* Read in the framework as the scattered-seed-gathering architecture — the lost-sheep IS the scattered-seed-of-the-north coming home.'),
  ('other-sheep-and-the-lost-house-of-yashar-el', 15, 4, 'john', 10, 16, E'The lost-sheep parable of Luke 15 is the same lost-sheep the King names at Yochanan (John) 10:16 (*And other sheep I have, which are not of this fold: them also I must bring*) and Matthew 15:24 (*I am not sent but unto the lost sheep of the house of Yashar''el (Israel)*). Three witnesses across the gospels to the one substance.'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 15, 4, 'john', 10, 27, E'The lost-sheep parable''s shepherd-finds-the-sheep cause-and-effect carries the same hearing-reveals-not-creates architecture the framework names. The sheep does not become-a-sheep by being-found; the sheep was-a-sheep before it wandered, IS-a-sheep when it is lost, and IS-found because the shepherd-knows-his-own.'),
  ('grace-and-the-opportunity-that-can-be-lost', 15, 18, 'ezekiel', 18, 21, E'The prodigal''s repentance-speech: *Father, I have sinned against heaven, and before thee, And am no more worthy to be called thy son: make me as one of thy hired servants* (vv.18-19). Read against Yechezk''el (Ezekiel) 18:21 (*But if the wicked will turn from all his sins... he shall surely live*) — the wilderness son returning carries the same architecture.'),
  ('new-heart', 15, 17, 'ezekiel', 36, 26, E'The prodigal''s *he came to himself* (v.17) — the heart-turn that precedes the homecoming. Read against the new-heart promise (Yechezk''el/Ezekiel 36:26-27): *A new heart also will I give you, and a new spirit will I put within you.* The framework reads the prodigal''s coming-to-himself as the new-heart turn.'),
  -- ===== Luke 16 — Unjust steward, Mosheh-and-prophets (NEW 21/22), divorce =====
  ('riches-as-snare-and-stumblingblock-in-sirach', 16, 13, 'matthew', 6, 24, E'*No servant can serve two masters: for either he will hate the one, and love the other; or else he will hold to the one, and despise the other. Ye cannot serve Elohim (God) and mammon* (Luke 16:13). The Lukan placement closes the unjust-steward parable with the same mammon-teaching the Sermon-on-the-Mount carries at Matthew 6:24.'),
  ('pharisaic-traditions-make-the-commandment-of-none-effect', 16, 14, 'mark', 7, 13, E'*And the Pharisees also, who were covetous, heard all these things: and they derided him. And he said unto them, Ye are they which justify yourselves before men; but Elohim (God) knoweth your hearts: for that which is highly esteemed among men is abomination in the sight of Elohim (God)* (Luke 16:14-15).'),
  ('heart-torah-not-abolition', 16, 17, 'matthew', 5, 17, E'*And it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). The immediate-corrective to v.16''s *The law and the prophets were until Yochanan (John): since that time the kingdom of Elohim (God) is preached, and every man presseth into it.* Verse 16 MUST NOT be read as Torah-abolished — verse 17 is the King''s own anti-antinomian guard.'),
  ('fulfill-as-prophecy-bringing-to-pass', 16, 16, 'matthew', 5, 17, E'*The law and the prophets were until Yochanan (John): since that time the kingdom of Elohim (God) is preached, and every man presseth into it. And it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:16-17). The Lukan two-verse pair holds Torah-and-prophets-until-Yochanan together with one-tittle-shall-not-fail.'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 16, 19, 'matthew', 13, 24, E'The rich-man-and-Lazaros parable. FRAMEWORK-MAJOR for the framework-honest sheol-and-resurrection register. Two men, two outcomes — Lazaros carried by the angels into Avraham''s (Abraham''s) bosom; the rich-man lifting up his eyes in torments. *And beside all this, between us and you there is a great gulf fixed.*'),
  ('scripture-twisting-and-the-harmonization-discipline', 16, 29, '2-peter', 3, 15, E'*They have Mosheh (Moses) and the prophets; let them hear them... If they hear not Mosheh (Moses) and the prophets, neither will they be persuaded, though one rose from the dead* (Luke 16:29, 31). The standing-test the King names: hear Torah and the prophets.'),
  -- ===== Luke 17 — Offences, ten lepers (NOT canaanite-woman — verifier rejected), kingdom-within, day-of-Son-of-Adam =====
  ('post-harvest-sifting', 17, 1, 'ezekiel', 20, 33, E'*It is impossible but that offences will come: but woe unto him, through whom they come! It were better for him that a millstone were hanged about his neck, and he cast into the sea, than that he should offend one of these little ones* (Luke 17:1-2). The offences-warning carries the post-harvest-sifting register.'),
  ('the-watcher-rebellion-as-the-stumbling-block-architecture-in-1-enoch', 17, 1, 'matthew', 18, 6, E'The Lukan stumblingblock-warning sits in the same Watcher-rebellion-as-stumbling-block architecture the Matthean parallel carries. The little-ones are the gathered-seed; the stumbling-architecture is the corruption-from-without-and-from-within.'),
  ('effort-over-accomplishment', 17, 3, 'proverbs', 24, 16, E'*And if he trespass against thee seven times in a day, and seven times in a day turn again to thee, saying, I repent; thou shalt forgive him* (Luke 17:4). The same Elohim who says the just man falleth seven times and riseth again (Mishlei/Proverbs 24:16) also says forgive seven times in a day.'),
  ('scattered-seed-gathering', 17, 11, 'hosea', 1, 9, E'The ten-lepers, of whom only the Samaritan returns to glorify Elohim (God). *Were there not ten cleansed? but where are the nine? There are not found that returned to give glory to Elohim (God), save this stranger* (Luke 17:17-18). Framework reading: the Samaritan is the scattered-seed-of-the-north remembering the covenant — the lost-house-of-Yashar''el thanksgiving in compressed form.'),
  -- VERIFIER REJECTED: Luke 17:11-19 → canaanite-woman-master (Samaritan is scattered-northern-witness per Red Line #7).
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 17, 19, 'john', 10, 27, E'*Arise, go thy way: thy faith hath made thee whole.* The third of four Lukan *thy faith hath saved/made-thee-whole* verdicts. The Samaritan returning to thank — the response of the sheep who hears the shepherd''s voice.'),
  ('wheat-and-tares-the-post-harvest-sifting-architecture', 17, 34, 'matthew', 13, 24, E'*Two shall be in one bed; the one shall be taken, and the other shall be left.* The Lukan day-of-the-Son-of-Adam (son of man) teaching — the same post-harvest-sifting architecture: at the appointed hour, the wheat and the tares are separated where they stand.'),
  ('the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables', 17, 24, 'matthew', 24, 27, E'*For as the lightning, that lighteneth out of the one part under heaven, shineth unto the other part under heaven; so shall also the Son of Adam (son of man) be in his day* (Luke 17:24). The lightning-from-east-to-west visibility-of-the-coming substance.'),
  ('the-days-of-noach-and-the-watcher-rebellion-judgment-pattern-in-1-enoch-and-jubilees', 17, 26, 'matthew', 24, 37, E'*And as it was in the days of Noach (Noah), so shall it be also in the days of the Son of Adam (son of man)... Likewise also as it was in the days of Lot* (Luke 17:26, 28). The Lukan version of the Noach-comparison adds the Lot-comparison.'),
  -- ===== Luke 18 — Importunate widow (NEW 24), Pharisee/publican (NEW 25), rich young ruler, blind man =====
  -- VERIFIER REJECTED: Luke 18:13-14 → shake-the-dust-off-rejection-response.
  ('grace-and-the-opportunity-that-can-be-lost', 18, 9, 'ezekiel', 18, 21, E'The Pharisee-and-publican parable. The publican smites upon his breast, saying *Elohim (God) be merciful to me a sinner* — the contrite-spirit posture the framework names. Yechezk''el (Ezekiel) 18:21''s repentance-from-sins architecture is the substance the publican walks.'),
  ('erga-nomou-as-flesh-credential-system', 18, 11, 'galatians', 2, 16, E'The Pharisee-and-publican parable as the gospel-substance of *works of the law* (erga nomou) read in compressed form. The Pharisee''s *I fast twice in the week, I give tithes of all that I possess* (v.12) is the flesh-credential-system in self-justifying-voice. Paul''s whole Galatians argument against the circumcision-party''s flesh-credential gospel reads as Luke 18:11-12.'),
  ('another-gospel-as-judaizer-flesh-credential', 18, 11, 'galatians', 1, 6, E'The Pharisee''s prayer at Luke 18:11-12 is the *other gospel* of Galatians 1:6 in compressed parable-form: salvation-by-becoming-something — the flesh-credential gospel. The King''s verdict refutes the Pharisaic-system the Galatian-agitators inherited.'),
  ('parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness', 18, 18, 'matthew', 25, 14, E'The rich-young-ruler — the inverse of the good-and-faithful-servant. The ruler is given the talent (*sell all that thou hast, and distribute unto the poor*, v.22), and walks away sorrowful.'),
  ('woes-on-the-rich-and-riches-cannot-save-in-1-enoch', 18, 18, 'matthew', 19, 23, E'The Lukan rich-young-ruler parallel to Matthew 19, where the woes-on-the-rich architecture from 1 Enoch 94-100 carries the same substance. *It is easier for a camel to go through a needle''s eye, than for a rich man to enter into the kingdom of Elohim (God).*'),
  ('formed-as-the-only-good-and-the-formless-as-the-source', 18, 18, 'mark', 10, 18, E'*And a certain ruler asked him, saying, Good Master, what shall I do to inherit eternal life? And Yahusha (Jesus) said unto him, Why callest thou me good? none is good, save one, that is, Elohim (God)* (Luke 18:18-19). The Lukan parallel to Mark 10:18 — same Formed-pointing-to-the-Formless register the S183 thread carries.'),
  ('first-passion-prediction-and-the-must-of-the-passion', 18, 31, 'matthew', 16, 21, E'The third passion-prediction at Luke 18:31-33. *Behold, we go up to Yerushalayim (Jerusalem), and all things that are written by the prophets concerning the Son of Adam (son of man) shall be accomplished. For he shall be delivered unto the Gentiles, and shall be mocked, and spitefully entreated.*'),
  ('son-of-david-messianic-recognition-by-marginalized', 18, 35, 'matthew', 9, 27, E'The blind man at Yericho (Jericho). *Yahusha (Jesus), thou Son of David, have mercy on me* (Luke 18:38). The Son-of-David Messianic-recognition cry from the marginalized — the same pattern the framework names across the gospels.'),
  ('messiah-as-torah-affirming-healer', 18, 42, 'acts', 3, 6, E'*Receive thy sight: thy faith hath saved thee. And immediately he received his sight, and followed him, glorifying Elohim (God): and all the people, when they saw it, gave praise unto Elohim (God)* (Luke 18:42-43).'),
  ('my-sheep-hear-my-voice-hearing-reveals-not-creates', 18, 42, 'john', 10, 27, E'*Receive thy sight: thy faith hath saved thee.* The fourth of four Lukan *thy faith hath saved/made-thee-whole* verdicts. The blind man at Yericho (Jericho) hearing the King''s voice — the sheep hearing the shepherd.'),
  -- ===== Luke 19 — Zakkay, pounds parable, triumphal entry, lament (NEW 26), temple cleansing =====
  ('lost-sheep-mission-scope', 19, 10, 'matthew', 10, 6, E'The King''s standing programmatic statement at Zakkay''s (Zacchaeus''s) house — *the Son of Adam is come to seek and to save that which was lost* — names the same mission scope Matt 10:6 and 15:24 carry: the lost sheep of the house of Yashar''el (Israel). The seeking-and-saving is the gathering-of-the-scattered, not categorical-nations inclusion.'),
  ('other-sheep-and-the-lost-house-of-yashar-el', 19, 10, 'john', 10, 16, E'The *that which was lost* of Luke 19:10 and the *other sheep* of Yochanan (John) 10:16 carry the same scattered-seed substance. The King is at the publican''s table identifying him as a son of Avraham (Abraham) because the seeking-mission is to the seed already covenant, scattered into the toll-collecting margins of the Roman administration.'),
  ('scattered-seed-gathering', 19, 9, 'hosea', 1, 9, E'Zakkay (Zacchaeus) is *a son of Avraham (Abraham)* whose covenant identity was buried under his publican standing. The King''s recognition at v.9 — *This day is salvation come to this house, forsomuch as he also is a son of Avraham (Abraham)* — is the Lo-Ammi-reversal pattern.'),
  ('parable-of-the-talents-stewardship-and-the-unprofitable-servant-cast-into-outer-darkness', 19, 11, 'matthew', 25, 14, E'Luke''s pounds-parable is a distinct parable from Matt 25''s talents, but the trade-the-deposit-and-give-account architecture is the same: the King going to receive a kingdom and returning to reckon what each servant did with what was entrusted.'),
  ('davidic-messianic-king-meek-on-the-foal-in-testaments-xii-and-2-maccabees', 19, 28, 'matthew', 21, 1, E'Luke carries the same Zekharyah (Zechariah) 9:9 meek-on-the-colt entry as Matt 21, with the Lukan-specific *Blessed be the King that cometh in the name of Yahuah (the Lord): peace in heaven, and glory in the highest* (v.38) echoing the angelic-host birth-announcement of Luke 2:14. YOSHI #4: v.38 renders *Yahuah (the Lord)* per S182 NT-Lord-in-OT-quotation rule (Tehillim/Psalm 118:26 Hebrew is YHWH).'),
  ('temple-cleansing-and-the-maccabean-rededication-architecture', 19, 45, 'matthew', 21, 12, E'Luke compresses the temple-cleansing to two verses, but the *house of prayer* citation (Yeshayahu/Isaiah 56:7) and the *den of thieves* citation (Yirmeyahu/Jeremiah 7:11) carry the same Maccabean-rededication architecture the existing thread names. The Yeshayahu 56 citation is load-bearing — the *house of prayer for all people* register is gathering-of-the-scattered language, not categorical-Gentile-inclusion.'),
  -- VERIFIER-ADDED Luke 19:46 → gather-together-in-one-the-children-scattered-abroad:
  ('gather-together-in-one-the-children-scattered-abroad', 19, 46, 'isaiah', 56, 7, E'*My house shall be called the house of prayer.* Yeshayahu (Isaiah) 56:7''s *for mine house shall be called an house of prayer for all people* names the gathering-substance: the house-of-prayer is the gathering-point where the scattered come home. The Lukan citation in the temple-cleansing names the temple''s purpose as gathering-of-the-children-scattered-abroad — not categorical-Gentile-inclusion, but the scattered-seed-of-Yashar''el gathered to the Father''s house.'),
  -- ===== Luke 20 — Wicked husbandmen, render unto Caesar, Sadducee question, David's Lord =====
  ('wicked-husbandmen-prophets-slain-house-desolate-and-the-tribes-gathered-as-from-the-beginning', 20, 9, 'matthew', 21, 33, E'Luke''s wicked-husbandmen carries the synoptic substance — the vineyard of Yashar''el (Israel), the servants slain, the beloved son cast out, and the citation of Tehillim (Psalm) 118:22''s *the stone which the builders rejected, the same is become the head of the corner* (v.17). Luke uniquely adds *Whosoever shall fall upon that stone shall be broken; but on whomsoever it shall fall, it will grind him to powder* (v.18).'),
  ('render-unto-caesar-and-the-image-of-elohim-stamped-on-man-in-sirach-and-wisdom-of-solomon', 20, 20, 'matthew', 22, 15, E'Luke carries the synoptic tribute-question with the same denarius and image-and-superscription substance. The King''s answer divides the false-binary: render the image-of-Caesar back to Caesar, and render the image-of-Elohim (which is man himself, Bereshit/Genesis 1:27) back to Elohim.'),
  ('the-resurrection-of-the-righteous-witnessed-by-the-mother-and-seven-sons-and-the-wisdom-stream', 20, 27, 'matthew', 22, 23, E'Luke carries the Sadducee-question on resurrection with the same Mosheh-at-the-bush citation (Shemot/Exodus 3:6) and the same *Elohim (God) is not the Elohim (God) of the dead, but of the living* answer. Luke uniquely names those *worthy to obtain that world, and the resurrection from the dead* (v.35).'),
  ('tehillim-110-1-davids-lord-formed-at-the-right-hand', 20, 41, 'mark', 12, 35, E'Luke carries the synoptic David''s-Lord question — *Yahuah (the LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool* (Tehillim/Psalm 110:1) — with the same Formless-Father-naming-the-Formed-Son architecture the framework reads.'),
  ('the-pride-and-religious-status-architecture-in-sirach', 20, 45, 'matthew', 23, 1, E'Luke compresses the woes-against-scribes to three verses, carrying the *love greetings in the markets, and the highest seats in the synagogues, and the chief rooms at feasts* — the same religious-status-architecture Matt 23 unfolds at length.'),
  -- ===== Luke 21 — Widow's mite, Olivet =====
  ('compassion-on-the-bruised-cry-of-the-widow-and-orphan-in-sirach', 21, 1, 'matthew', 12, 20, E'The widow at the treasury — *of her penury hath cast in all the living that she had* — carries the mercy-on-the-bruised register: the kingdom''s reckoning is by the bruised-reed measure, not by the gold-laden-rich measure the temple-administration was built around. The King is reading the offering by the heart, not by the sum.'),
  ('abomination-of-desolation-daniel-9-and-12-standing-where-it-ought-not', 21, 20, 'mark', 13, 14, E'Luke uniquely names the desolation-by-armies-compassing rather than the abomination-of-desolation grammar Matt and Mark carry: *And when ye shall see Yerushalayim (Jerusalem) compassed with armies, then know that the desolation thereof is nigh.* Same prophetic substance (the Daniyel 9 / Daniyel 12 desolation), differently rendered.'),
  ('the-mount-of-olives-vision-and-the-gathering-of-the-tribes-in-testaments-of-naphtali-and-asher', 21, 5, 'matthew', 24, 3, E'Luke carries the Olivet setup — the temple-stones-not-one-upon-another prophecy and the disciples'' twofold question — though Luke compresses *what shall be the sign of thy coming, and of the end of the world* into *when shall these things be? and what sign will there be?*'),
  ('the-signs-of-the-end-and-the-ten-tribes-gathered-in-2-esdras', 21, 8, 'matthew', 24, 10, E'Luke carries the wars-and-rumours-of-wars, the kingdoms-against-kingdoms, the famines-and-pestilences, and the persecution-and-betrayal-by-family signs with the synoptic substance. Luke uniquely promises *I will give you a mouth and wisdom, which all your adversaries shall not be able to gainsay nor resist* (v.15).'),
  ('the-gathering-of-the-elect-from-the-four-winds-in-1-enochs-animal-apocalypse-and-parables', 21, 25, 'matthew', 24, 27, E'Luke carries the *Son of Adam coming in a cloud with power and great glory* (v.27) — kbar-enash cloud-rider architecture from Daniyel (Daniel) 7:13. Luke uniquely adds *And when these things begin to come to pass, then look up, and lift up your heads; for your redemption draweth nigh* (v.28).'),
  ('the-faithful-and-wise-servant-and-the-day-of-visitation-in-sirach-and-wisdom-of-solomon', 21, 34, 'matthew', 24, 45, E'Luke''s *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam* (v.36) carries the same watch-and-be-found-faithful register the Matt 24 watching-servant carries.'),
  -- ===== Luke 22 — Last Supper, Iscariot, Sanhedrin trial =====
  -- VERIFIER CONVERSION: D NEW 3 twelve-thrones → ATTACH on the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii (Matt 19:27 anchor):
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'matthew', 19, 28, E'*Ye are they which have continued with me in my temptations. And I appoint unto you a kingdom, as my Father hath appointed unto me; That ye may eat and drink at my table in my kingdom, and sit on thrones judging the twelve tribes of Yashar''el (Israel).* Luke uniquely positions the twelve-thrones / twelve-tribes-judging promise inside the Last Supper rather than at the rich-young-ruler hinge (where Matt 19:28 places it). Matthew anchors *in the regeneration when the Son of Adam shall sit in the throne of his glory, ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el.* YOSHI #5: *judging* renders as Tanakh-sense ruling/administering (Shoftim-pattern), not narrower judicial-sentence — the twelve apostles administering / ruling the twelve tribes in the kingdom on the Shoftim-pattern Mosheh (Moses) established.'),
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'ezekiel', 37, 24, E'Yechezk''el (Ezekiel) 37:24-25''s *And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them* names the Davidic-King-over-the-restored-twelve-tribes architecture the twelve-thrones promise sits inside.'),
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'revelation', 3, 21, E'Revelation 3:21''s *To him that overcometh will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* echoes the throne-with-the-King substance the appointed-kingdom carries.'),
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'revelation', 20, 4, E'Revelation 20:4''s *I saw thrones, and they sat upon them, and judgment was given unto them... and they lived and reigned with Mashiach (Christ) a thousand years* names the millennial-thrones substance the apostles'' twelve-thrones promise inaugurates.'),
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'revelation', 1, 6, E'Revelation 1:6''s *and hath made us kings and priests unto Elohim (God) and his Father* names the kingdom-of-priests substance the twelve-thrones administration sits inside.'),
  ('the-gathering-of-the-twelve-tribes-and-the-thrones-of-judgment-in-jubilees-sirach-wisdom-and-testaments-xii', 22, 28, 'isaiah', 25, 6, E'Yeshayahu (Isaiah) 25:6''s *And in this mountain shall Yahuah Tseva''ot (the LORD of hosts) make unto all people a feast of fat things, a feast of wines on the lees, of fat things full of marrow* names the Messianic-banquet substance the *that ye may eat and drink at my table in my kingdom* directly carries.'),
  ('the-betrayer-the-double-tongue-and-the-watch-against-temptation-in-sirach', 22, 1, 'matthew', 26, 14, E'Luke carries the Yahudah-Iscariot (Judas Iscariot) betrayal-arrangement with the synoptic substance, uniquely naming *Then entered satan into Yahudah surnamed Iscariot, being of the number of the twelve* (v.3) — the same seed-war diagnostic Yochanan/John 13 carries.'),
  ('last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament', 22, 14, 'matthew', 26, 26, E'Luke carries the synoptic Pesach-cup, bread-broken, and *This cup is the new testament in my blood, which is shed for you* (v.20) — the Yirmeyahu (Jeremiah) 31:31 new-covenant-cut-in-his-blood substance. Luke uniquely brackets the bread-and-cup with the Pesach-rememberance frame (vv.15-16).'),
  ('the-blood-of-the-new-covenant-and-the-faithful-unto-death-for-the-covenant-in-1-and-2-maccabees', 22, 20, 'matthew', 26, 17, E'Luke''s *new testament in my blood, which is shed for you* carries the same Maccabean-faithful-unto-death prefiguring the existing thread names — the new-covenant-cut-in-his-blood register.'),
  ('post-harvest-sifting', 22, 31, 'matthew', 7, 21, E'The King to Kefa (Peter): *satan hath desired to have you, that he may sift you as wheat: But I have prayed for thee, that thy faith fail not* (Luke 22:31-32). The sifting language is the post-harvest substance — the wheat tested before the gathering.'),
  -- VERIFIER-ADDED Luke 22:42 → gethsemane-cup-of-suffering:
  ('gethsemane-cup-of-suffering-and-the-sons-substantial-submission-to-the-father', 22, 42, 'matthew', 26, 39, E'*Father, if thou be willing, remove this cup from me: nevertheless not my will, but thine, be done* (Luke 22:42). The Gethsemane prayer — the Formed-Son''s substantial submission to the Formless-Father over the cup. The cup-of-the-Father''s-wrath the King about to drink, named in Yeshayahu (Isaiah) 51:17, 22; Yirmeyahu (Jeremiah) 25:15. The synoptic parallel at Matthew 26:39 carries the same Father-Son submission-substance.'),
  -- VERIFIER-ADDED Luke 22:69 → sanhedrin-trial-tehillim-110-and-daniel-7:
  ('sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth', 22, 69, 'psalms', 110, 1, E'*Hereafter shall the Son of Adam (son of man) sit on the right hand of the power of Elohim (God)* (Luke 22:69). The King''s direct citation at the Sanhedrin trial of Tehillim (Psalm) 110:1 — *Yahuah (the LORD) said unto my Lord, Sit thou on my right hand.* The Formed-Son names his own destination at the right hand of the Formless-Father in the very moment of condemnation. The Daniyel (Daniel) 7:13-14 Son-of-Adam cloud-rider claim joined to the Tehillim 110 right-hand-session.'),
  -- ===== Luke 23 — Barabbas, cross, darkness, veil =====
  ('barabbas-as-the-substituted-prisoner-and-the-prefiguring-of-the-substitutionary-lamb', 23, 18, 'mark', 15, 6, E'Luke carries the Barabbas-released-the-Righteous-One-condemned synoptic substance — the crowd cries *Away with this man, and release unto us Bar-Abba* (v.18), and Pilate delivers Yahusha (Jesus) to their will (v.25).'),
  ('the-faithful-righteous-suffering-unto-death-and-the-atoning-blood-architecture-in-4-maccabees', 23, 33, 'matthew', 27, 42, E'Luke carries the substitutionary-atoning-blood architecture with synoptic substance — the King silent before his accusers, the mockery from those who pass by, the *if thou be the King of the Yahudim (Jews), save thyself* (v.37), and the death-as-faithful-unto-death the 4 Maccabees prefiguring names.'),
  ('the-day-of-the-most-high-cosmic-darkness-and-the-resurrection-of-the-righteous-in-2-esdras-and-2-baruch', 23, 44, 'matthew', 27, 45, E'Luke carries the cosmic-darkness-over-the-land from the sixth to the ninth hour with the synoptic substance, uniquely naming *the sun was darkened* (v.45) — the day-of-the-Most-High substance the 2 Esdras / 2 Baruch witness frames around the cross.'),
  ('veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross', 23, 45, 'matthew', 27, 51, E'Luke carries the veil-of-the-temple-rent-in-the-midst — the same substantial-access-through-the-cross substance, though Luke places the veil-rending *before* the King''s last cry rather than after, and uses the *in the midst* (eis meson) rather than Matt/Mark''s *from the top to the bottom* — the framework substance unchanged.'),
  ('the-temple-veil-rent-and-the-way-back-into-the-most-holy-place-opened-in-2-baruch-and-testaments-xii', 23, 45, 'matthew', 27, 51, E'Luke carries the way-back-into-the-Most-Holy-Place-opened substance the 2 Baruch / Testaments XII witness frames.'),
  -- VERIFIER-ADDED Luke 23:46 → the-hour-and-the-cup-of-the-fathers-wrath:
  ('the-hour-and-the-cup-of-the-fathers-wrath', 23, 46, 'isaiah', 51, 17, E'*Father, into thy hands I commend my spirit* (Luke 23:46). The cup of the Father''s wrath that the King has now drunk completely — Yeshayahu (Isaiah) 51:17''s *thou hast drunken the dregs of the cup of trembling, and wrung them out* is the substance the King''s dying-breath releases back to the Father. The cup at Gethsemane (Luke 22:42) and the cup-finished at Luke 23:46 are the same cup, drunk to the dregs and yielded back. (Dual-attach: also the anchor of NEW 31 into-thy-hands-i-commend-my-spirit.)'),
  -- ===== Luke 24 — Resurrection, Emmaus (NEW 32), flesh-and-bones (NEW 33), ascension (NEW 34) =====
  ('women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance', 24, 1, 'matthew', 28, 1, E'Luke carries the women-at-the-tomb-as-first-witnesses substance — Miriam Magdalit (Mary Magdalene), Yochanah (Joanna), Miriam mother of Ya''aqov, and others. The framework-major women-first-witnesses pattern walked into Luke.'),
  ('the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance', 24, 1, 'matthew', 28, 1, E'Luke carries the resurrection-vindication substance with the angels'' *Why seek ye the living among the dead? He is not here, but is risen* (vv.5-6) — the Tehillim 16 *thou wilt not leave my soul in sheol* and Tehillim 22 vindication substance.'),
  ('great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance', 24, 47, 'matthew', 28, 19, E'The *among all nations, beginning at Yerushalayim (Jerusalem)* (v.47) is panta-ta-ethnē-as-SCOPE-of-proclamation language — the same gathering-of-the-scattered-from-every-nation substance the Matt 28 commission carries. The *beginning at Yerushalayim* is the gathering-out-of-Yahudah-first register; the *all nations* is the territories-of-the-scattered, not the categorical-Gentile-inclusion.'),
  ('panta-ta-ethne-as-the-scope-of-proclamation-because-the-sheep-are-scattered-in-jubilees-and-2-esdras-13', 24, 47, 'matthew', 28, 19, E'Luke''s *among all nations* carries the same panta-ta-ethnē-as-SCOPE substance the existing thread names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:' || i.thread_slug || E' | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s185_luke_lookup sv ON sv.book_slug = 'luke' AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s185_luke_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link these cross_references rows to their existing threads.
-- We re-walk the input list inside the JOIN so each row attaches to the
-- correct existing thread by slug. sort_order is assigned via ROW_NUMBER
-- partitioned by thread_id, starting at 100 so we do not collide with
-- any existing member sort_orders in those threads.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id,
       100 + ROW_NUMBER() OVER (PARTITION BY t.id
                                ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                         tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON x.note LIKE 'thread:' || t.slug || ' | %'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE sb.slug = 'luke'
   AND x.source = 'manual'
   AND t.sort_order NOT BETWEEN 1216 AND 1250
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 185 luke migration complete.'
