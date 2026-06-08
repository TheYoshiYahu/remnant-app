-- =====================================================================
-- S212 minion — John 5-8 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:    John 5, 6, 7, 8
-- Tag:      j0508   (temp view _s212_j0508_lookup)
-- Sort band: 3060-3089
-- Output:   scratch_xref/minion_john_05_08.sql
--
-- These are the MISSING extras-tier (outside-canon) member rows for the
-- John 5-8 stretch. Mark/Luke/John carried zero outside-canon cross-refs;
-- John's existing canon threads (S181, S194) quote canon only. This
-- fragment ADDS framework-bearing extras connections without duplicating
-- the canon threads already in place:
--   - S181 `bread-from-heaven-manna-and-the-formed` (John 6:32-58, canon:
--     Exodus 16, Deuteronomy 8, Psalm 78) — we ADD the angels'-food /
--     angels'-bread + word-not-fruit extras register from Wisdom of
--     Solomon 16 and 2 Esdras 1.
--   - S181 `i-am-statements-as-formed-cloud-rider-self-identification`
--     (John 8:58, canon: Exodus 3:14, Isaiah 43) — we ADD the
--     name-named-before-creation / wisdom-from-eternity extras register
--     from 1 Enoch 48 and Sirach 24.
--   - S194 already covers John 7:37-39 (rivers of living water) and
--     7:16-24 / 7:40-44 at the canon level. John 7's living-water and
--     prophet-debate material is canon-anchored and does not surface a
--     new framework-bearing extras connection at the required rigour
--     beyond what S194 holds, so NO new John-7 extras thread is added
--     here (the 1 Enoch 48:1 fountain-of-wisdom material sits closest to
--     the John 8:58 eternity register, where it is placed below).
--
-- New PROPOSED extras-tier threads (all John-prefixed, English book-name
-- slugs, checked against EXISTING_SLUGS.txt):
--   1. john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch   (sort 3060)
--        targets: enoch (1 Enoch 51, 61, 62)
--   2. john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras     (sort 3061)
--        targets: apocrypha (Wisdom of Solomon 16, 2 Esdras 1)
--   3. john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach (sort 3062)
--        targets: enoch (1 Enoch 48), apocrypha (Ecclesiasticus / Sirach 24)
--
-- 9 cross_references rows, 9 thread_members rows, all tier_required='extras'.
-- Every quoted verse pulled directly from the parsed editions; sacred
-- names restored; son-of-man -> son-of-Adam (Enoch's named title preserved,
-- not the kaph-comparative cases).
--
-- No BEGIN/COMMIT/\echo here — the orchestrator wraps one transaction per
-- gospel. Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with this minion's tag).
CREATE TEMP VIEW _s212_j0508_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah',
       'sonnini-acts-29'
   );

-- ---------------------------------------------------------------------
-- Insert 9 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch
  ('canon', 'john', 5, 25, 'enoch', '1-enoch', 51, 1,
   '*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes ... For in those days the Elect One shall arise.* 1 Enoch 51:1 names the resurrection architecture John 5:25 walks: *the hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live.* The graves and Sheol giving back what is entrusted to them is the Hebrew library''s register for the same dead-shall-hear-and-live event the Formed one names at the pool of Bethesda discourse. The Elect One arises in the same hour the entrusted dead are given back.'),
  ('canon', 'john', 5, 22, 'enoch', '1-enoch', 51, 3,
   '*And the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* 1 Enoch 51:3 names the all-judgment-committed-to-the-Elect-One architecture John 5:22 walks: *the Father judgeth no man, but hath committed all judgment unto the Son.* The Hebrew library had already seated the Elect One on the throne of Yahuah (God) of Spirits, glorified and given the secrets of wisdom and counsel — the same handing-over of judgment to the Son the Formed one names in his own mouth in John 5.'),
  ('canon', 'john', 5, 27, 'enoch', '1-enoch', 61, 8,
   '*And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* 1 Enoch 61:8 names the Head-of-Days-seats-the-Elect-One-to-judge architecture John 5:27 walks: *and hath given him authority to execute judgment also, because he is the Son of Adam.* The Hebrew library''s parables seat the figure on the throne of glory to weigh the deeds of all in the balance — the very judgment-authority the Formed one says the Father gave him precisely *because he is the Son of Adam.* The Adamic-lineage weight of the title is the ground of the judgment in both registers.'),
  ('canon', 'john', 5, 27, 'enoch', '1-enoch', 62, 2,
   '*And when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits ... then shall they all speak with one voice, And bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* 1 Enoch 62:2 — read with 62:7, *this is the Son of Adam who is born unto righteousness* — names the Son of Adam seated to judge the secret ways of all, the same figure John 5:27 names: *the Son of Adam* given authority to execute judgment. The Hebrew library''s parables make explicit what John 5 compresses: the one given the judgment is named the Son of Adam, the Adamic-seed figure enthroned to judge.'),

  -- Thread 2: john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras
  ('canon', 'john', 6, 31, 'apocrypha', 'the-wisdom-of-solomon', 16, 20,
   '*Instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste.* Wisdom of Solomon 16:20 names the manna as *angels'' food ... bread prepared without their labour ... agreeing to every taste* — the Hebrew library''s register for the wilderness bread the crowd cites at John 6:31: *our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat.* The wisdom-stream had already named the manna heaven-sent and labourless, serving every taste; the Formed one takes the same bread-from-heaven tradition and lands it on his own body as the true bread the manna prefigured.'),
  ('canon', 'john', 6, 32, 'apocrypha', 'the-wisdom-of-solomon', 16, 26,
   '*That your children, O Yahuah (God), whom you lovest, might know, that it is not the growing of fruits that nourishes man: but that it is your word, which preserves them that put their trust in you.* Wisdom of Solomon 16:26 names the substance the manna was teaching — *it is not the growing of fruits that nourishes man, but thy word* — the wisdom-stream''s reading of the manna as a sign pointing to the word that sustains. John 6:32-33''s *my Father giveth you the true bread from heaven ... the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world* lands that word on the Formed one in flesh: the Word made flesh is the word the manna pointed toward, taken into the inward man.'),
  ('canon', 'john', 6, 33, 'apocrypha', '2-esdras', 1, 19,
   '*Then had I pity upon your mournings, and gave you manna to eat; so you did eat angels'' bread.* 2 Esdras 1:19 names the wilderness manna as *angels'' bread* given out of the Father''s pity on the hungry people — the same heaven-sent provision John 6:33 walks: *the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world.* The Hebrew library names the bread the fathers ate as angels'' bread; the Formed one names himself as the bread of Elohim (God) come down from heaven, the substance the angels'' bread of the wilderness was prefiguring.'),

  -- Thread 3: john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach
  ('canon', 'john', 8, 58, 'enoch', '1-enoch', 48, 3,
   '*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* 1 Enoch 48:3 names the Son of Adam (48:2) as named before the sun, the signs, and the stars were made — the Hebrew library''s register for the before-creation existence John 8:58 names: *Before Abraham was, I am.* The wisdom-stream and the parables had already placed the figure''s name before the foundation of the world; the Formed one names his own *I am* as reaching back before Avraham (Abraham), the same eternity the parables assign to the named Son of Adam.'),
  ('canon', 'john', 8, 58, 'apocrypha', 'ecclesiasticus', 24, 9,
   '*He created me from the beginning before the world, and I shall never fail.* Sirach (Ecclesiasticus) 24:9 — Wisdom''s own testimony, *I came out of the mouth of the Most High* (24:3), created before the world and never failing — names the from-eternity register John 8:58 walks: *Before Abraham was, I am.* The Hebrew library''s Wisdom speaks her own before-the-world existence and her dwelling in Ya''aqov (Jacob) and Yashar''el (Israel) (24:8); the Formed Word names the same eternity in the first person, the *I am* who is before Avraham (Abraham), come to tabernacle among his own.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j0508_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j0508_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 3 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch',
       E'The dead shall hear his voice — the Elect One seated to judge in 1 Enoch',
       E'John 5:21-29 hands the resurrection-of-the-dead and the whole of judgment to the Son: *the Father judgeth no man, but hath committed all judgment unto the Son* (v.22); *the hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live* (v.25); *and hath given him authority to execute judgment also, because he is the Son of Adam* (v.27). The Hebrew library''s parables of 1 Enoch carry the same architecture at the verse-level. The graves and Sheol giving back their dead, and the Elect One arising in that same hour: *and in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received ... For in those days the Elect One shall arise* (1 Enoch 51:1). The handing of all judgment to the enthroned figure: *and the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him* (1 Enoch 51:3). And the seating of the figure on the throne of glory to judge — the figure named the Son of Adam: *and the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance* (1 Enoch 61:8); *and when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits* (1 Enoch 62:2), of whom Yahuah (God) of Spirits says *this is the Son of Adam who is born unto righteousness* (1 Enoch 62:7). John 5 names precisely what the parables name: the Son of Adam, the Adamic-seed figure, given the dead-shall-hear voice and the throne of judgment by the Father. The Adamic-lineage weight of the title — *because he is the Son of Adam* — is the ground of the committed judgment in both registers.',
       sv.verse_id, ev.verse_id, 'extras', 3060
  FROM _s212_j0508_lookup sv, _s212_j0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 22
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 5 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras',
       E'Angels'' food and the word that nourishes — Wisdom of Solomon and 2 Esdras',
       E'John 6''s bread-from-heaven discourse opens with the crowd citing the wilderness manna: *our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* (v.31). The Formed one answers by taking the manna-tradition and landing it on his own body: *my Father giveth you the true bread from heaven. For the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world* (vv.32-33). The Hebrew library had already read the manna twice over — as angels''-food and as a sign pointing past the bread to the word that sustains. Wisdom of Solomon 16:20 names the manna heaven-sent and serving every taste: *instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste.* Wisdom of Solomon 16:26 names the substance the manna was teaching: *that it is not the growing of fruits that nourishes man: but that it is your word, which preserves them that put their trust in you* — the wisdom-stream''s own reading of the manna as a sign of the word that nourishes, the same reading the Formed one presses when he names himself the true bread. And 2 Esdras 1:19 names the wilderness bread in the same register: *then had I pity upon your mournings, and gave you manna to eat; so you did eat angels'' bread.* The Hebrew library names the manna as angels'' bread that was teaching the people to live by the word; the Word made flesh names himself as the true bread that endures unto everlasting life, the substance the angels'' bread of the wilderness prefigured. (Complements the canon manna thread that anchors John 6 to Exodus 16, Deuteronomy 8, and Psalm 78.)',
       sv.verse_id, ev.verse_id, 'extras', 3061
  FROM _s212_j0508_lookup sv, _s212_j0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 31
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 6 AND ev.verse_number = 35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach',
       E'His name named before creation — wisdom from eternity in 1 Enoch and Sirach',
       E'John 8:58''s *Verily, verily, I say unto you, Before Abraham was, I am* names the Formed one''s existence before Avraham (Abraham) — the same before-creation register the Hebrew library carries for the named Son of Adam and for Wisdom from the mouth of the Most High. 1 Enoch 48:2-3 places the figure''s name before the making of the sun and stars: *and at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days. Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* — and 48:6 adds *he hath been chosen and hidden before Him, Before the creation of the world and for evermore.* Sirach (Ecclesiasticus) 24 carries Wisdom''s own from-eternity testimony: *I came out of the mouth of the Most High, and covered the earth as a cloud* (24:3), *he created me from the beginning before the world, and I shall never fail* (24:9), with her tabernacle commanded to rest *in Jacob* and her inheritance *in Yashar''el (Israel)* (24:8). The Hebrew library had already placed the figure''s name before the sun and the stars and Wisdom''s existence before the world; the Formed Word names the same eternity in the first person — the *I am* who is before Avraham (Abraham), the Word who came out of the mouth of the Most High to tabernacle among his own. (Complements the canon *I am* thread that anchors John 8:58 to Exodus 3:14 and Isaiah 43.)',
       sv.verse_id, ev.verse_id, 'extras', 3062
  FROM _s212_j0508_lookup sv, _s212_j0508_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 8 AND ev.verse_number = 58
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 51:1 — *and in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received ... For in those days the Elect One shall arise.* The graves and Sheol giving back their dead in the hour the Elect One arises; John 5:25''s *the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live* walks the same resurrection-hour architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 51:3 — *and the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* All-given-to-the-enthroned-Elect-One; John 5:22''s *the Father judgeth no man, but hath committed all judgment unto the Son* walks the same handing-over.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 22
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 61:8 — *and the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* The Head of Days seats the figure on the throne of glory to judge; John 5:27''s *and hath given him authority to execute judgment also, because he is the Son of Adam* walks the same enthroned-to-judge architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 61 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 62:2 (with 62:7, *this is the Son of Adam who is born unto righteousness*) — *and when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits.* The Son of Adam seated to judge the secret ways of all; John 5:27 names the same figure given judgment *because he is the Son of Adam.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-5-the-dead-shall-hear-his-voice-and-the-elect-one-seated-to-judge-in-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 5 AND sv.verse_number = 27
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 16:20 — *instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste.* The manna named angels'' food, heaven-sent and labourless; John 6:31''s *our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* cites the same wilderness bread.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 31
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 16 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 16:26 — *that it is not the growing of fruits that nourishes man: but that it is your word, which preserves them that put their trust in you.* The wisdom-stream''s reading of the manna as a sign of the word that nourishes; John 6:32-33''s *true bread from heaven ... the bread of Elohim (God) ... giveth life unto the world* lands that word on the Word made flesh.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 32
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 16 AND tv.verse_number = 26
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 1:19 — *then had I pity upon your mournings, and gave you manna to eat; so you did eat angels'' bread.* The wilderness manna named angels'' bread given out of the Father''s pity; John 6:33''s *the bread of Elohim (God) is he which cometh down from heaven, and giveth life unto the world* names the Formed one as the substance the angels'' bread prefigured.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-6-angels-food-and-the-word-that-nourishes-in-wisdom-of-solomon-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 6 AND sv.verse_number = 33
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 1 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 48:3 (with 48:2, the Son of Adam named in the presence of Yahuah (God) of Spirits) — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The figure''s name before sun, signs, and stars; John 8:58''s *Before Abraham was, I am* names the same before-creation existence in the first person.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach (Ecclesiasticus) 24:9 (with 24:3, *I came out of the mouth of the Most High*) — *he created me from the beginning before the world, and I shall never fail.* Wisdom''s own from-eternity testimony, created before the world and dwelling in Ya''aqov (Jacob) and Yashar''el (Israel); John 8:58''s *Before Abraham was, I am* names the same eternity in the Formed Word who came to tabernacle among his own.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0508_lookup sv, _s212_j0508_lookup tv
 WHERE t.slug = 'john-8-58-his-name-named-before-creation-and-wisdom-from-eternity-in-1-enoch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 8 AND sv.verse_number = 58
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
