-- =====================================================================
-- Session 212 — John extras-library (outside-canon) cross-references
-- =====================================================================
-- Fills the John gap identified at S212: the existing John xref
-- migration carried ZERO outside-canon member rows (extras were quoted in
-- summary_md only / never inserted). This migration adds the missing
-- edition-aware cross-references + framework threads connecting John
-- verses to the full restored library (Apocrypha, 1 Enoch, Jubilees,
-- Jasher, Testaments XII / Pseudepigrapha, etc.), per the S194 full-library
-- authoring requirement and the Come-and-See posture (quote in full,
-- stand-alone italics, curated + framework-bearing rows only).
--
-- Assembled from per-chapter-range minion fragments (S212 wave). Every
-- target tuple verified against the parsed editions (verify_fidelity.py:
-- 202/202 faithful; verify_offset.py clean). Sacred names restored;
-- son-of-man -> Son of Adam; English book-name slug fragments.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- Apply (from Yoshi's Mac Terminal):
--   python3 api/apply_migration.py data-schema/migrations/session212_john_extras_cross_references.sql
-- =====================================================================

\echo 'Session 212 — John extras-library cross-references starting...'
BEGIN;

-- ----- fragment: minion_john_01.sql -----
-- =====================================================================
-- S212 minion — John 1 (the prologue) extras-library cross-references
-- =====================================================================
-- Range:  JOHN 1 only (the prologue — Logos / the Word made flesh,
--         light/darkness, the Lamb of Elohim, the calling of disciples,
--         "come and see", the Son of Adam at v.51).
-- Tag:    j01   (temp view _s212_j01_lookup)
-- Sort band: 3000-3029
--
-- WHY THIS ADD. The S181 John migration (session181_john_xref_threads.sql)
-- seeded John 1's canon-tier threads — word-made-flesh-formed-of-the-
-- formless (John 1:1-18 ↔ Genesis / Psalms / Proverbs / Exodus / Isaiah,
-- all canon), the Lamb-of-Elohim thread (John 1:29 ↔ Exodus 12 / Isaiah
-- 53), and the born-not-of-blood thread (John 1:11-13 ↔ Hosea 1). None of
-- those inserted outside-canon (extras-library) member rows. The canon
-- thread already canon-anchors the Wisdom-at-creation register at
-- Proverbs 8:22 (Wisdom personified, present at creation); this migration
-- completes that register from the Hebrew library's deuterocanon and
-- pseudepigrapha, where the Word/Wisdom Christology of the prologue was
-- already being walked — the Formed drawn from the Formless, the breath
-- and effulgence of the Most High, Wisdom tabernacling among Yashar'el,
-- Wisdom finding no place to dwell, and the Son of Adam named before
-- creation as the light. Complement, not duplicate: every target below is
-- an extras-library verse, and no thread slug collides with the existing
-- canon John 1 threads or the existing Mark/Luke/Matthew threads (the
-- pre-existing son-of-adam-as-judge-and-ladder is a Mark canon→canon
-- thread on Daniel 7 / Genesis 3 / Psalm 8 — unrelated to this John 1:51
-- extras add).
--
-- Four new threads at tier_required='extras':
--   1. john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon
--        (sort 3000)  — targets: apocrypha (Wisdom of Solomon)
--   2. john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24
--        (sort 3001)  — targets: apocrypha (Ecclesiasticus / Sirach)
--   3. john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42
--        (sort 3002)  — targets: enoch (1 Enoch)
--   4. john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46
--        (sort 3003)  — targets: enoch (1 Enoch)
--
-- 16 cross_references rows, 16 thread_member rows, all extras-tier.
-- Every member-note quotes the target IN FULL in italics with the
-- citation in parentheses (come-and-see), with sacred names restored and
-- son-of-man → son-of-Adam everywhere. Idempotent: ON CONFLICT DO NOTHING
-- on every INSERT. No BEGIN/COMMIT — orchestrator wraps the transaction.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j01 tag).
CREATE TEMP VIEW _s212_j01_lookup AS
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
-- Insert 16 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  -- Thread 1: john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon
  ('canon', 'john', 1, 1, 'apocrypha', 'the-wisdom-of-solomon', 9, 1,
   E'*O Yahuah (God) of my fathers, and Yahuah (God) of mercy, who have made all things with your word* (Wisdom of Solomon 9:1). The Hebrew library names the Word as the agent through whom the Most High made all things — the same naming John 1:1-3 opens with: *In the beginning was the Word ... All things were made by him; and without him was not any thing made that was made.* The Word is not a late Greek import into the gospel; the deuterocanon was already confessing the Most High''s creating-Word.'),
  ('canon', 'john', 1, 3, 'apocrypha', 'the-wisdom-of-solomon', 9, 9,
   E'*And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments* (Wisdom of Solomon 9:9). Wisdom present with the Most High at the making of the world is the same architecture John 1:1-3 walks: *the same was in the beginning with Elohim (God) ... all things were made by him.* The Formed was with the Formless before the world was, and the world was made through him.'),
  ('canon', 'john', 1, 4, 'apocrypha', 'the-wisdom-of-solomon', 7, 26,
   E'*For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness* (Wisdom of Solomon 7:26). The Formed drawn from the Formless is named here as the brightness/effulgence of the everlasting light and the image of the Most High''s goodness — the exact architecture of John 1:4''s *in him was life; and the life was the light of men.* The light of men is the brightness of the everlasting light, the unspotted mirror of the One no eye sees.'),
  ('canon', 'john', 1, 14, 'apocrypha', 'the-wisdom-of-solomon', 7, 25,
   E'*For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her* (Wisdom of Solomon 7:25). The Formed is the breath of the power and the pure influence flowing from the glory of the Almighty — the Formless source, the glory of the Almighty, expressing itself in the Formed. *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father)* (John 1:14): the glory beheld in flesh is the glory the breath flows from.'),
  ('canon', 'john', 1, 14, 'apocrypha', 'the-wisdom-of-solomon', 7, 22,
   E'*For wisdom, which is the worker of all things, taught me: for in her is an understanding spirit holy, one only, manifold, subtil, lively, clear, undefiled, plain, not subject to hurt, loving the thing that is good* (Wisdom of Solomon 7:22). Wisdom as *the worker of all things* is the maker-Word of John 1:3, *all things were made by him*; the holy understanding spirit in her is the Formed one full of *grace and truth* (John 1:14). The deuterocanon names the worker; the gospel names the worker made flesh.'),

  -- Thread 2: john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24
  ('canon', 'john', 1, 14, 'apocrypha', 'ecclesiasticus', 24, 3,
   E'*I came out of the mouth of the Most High, and covered the earth as a cloud* (Ecclesiasticus 24:3). Wisdom proceeding from the mouth of the Most High is the same procession John 1:1-14 walks — the Word with Elohim (God) in the beginning, who *was made flesh, and dwelt among us.* The Word came out of the Formless source as Wisdom came out of the mouth of the Most High; the gospel names where she came to rest: in flesh, tabernacling among us.'),
  ('canon', 'john', 1, 14, 'apocrypha', 'ecclesiasticus', 24, 8,
   E'*So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (Ecclesiasticus 24:8). Wisdom''s tabernacle caused to rest, her dwelling set in Jacob and Yashar''el (Israel), is the architecture John 1:14''s *dwelt among us* — the Greek *eskēnōsen,* tabernacled — walks. The Word made flesh pitched his tabernacle among the covenant people the Hebrew library said Wisdom was sent to dwell with.'),
  ('canon', 'john', 1, 11, 'apocrypha', 'ecclesiasticus', 24, 9,
   E'*He created me from the beginning before the world, and I shall never fail* (Ecclesiasticus 24:9). Wisdom created/begotten before the world, sent to dwell in the inheritance of Yahuah (God), stands behind John 1:11''s *he came unto his own, and his own received him not.* The one who was before the world came to the very people Wisdom was sent to tabernacle among — and his own received him not. The Hebrew library names the sending; the gospel names the refusal.'),

  -- Thread 3: john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42
  ('canon', 'john', 1, 10, 'enoch', '1-enoch', 42, 1,
   E'*Wisdom found no place where she might dwell; then a dwelling-place was assigned her in the heavens* (1 Enoch 42:1). The Enochic library names the dark inverse of the prologue: Wisdom found no place to dwell on the earth she had made. John 1:10''s *he was in the world, and the world was made by him, and the world knew him not* walks the same architecture — the maker comes to what he made, and finds no place there.'),
  ('canon', 'john', 1, 11, 'enoch', '1-enoch', 42, 2,
   E'*Wisdom went forth to make her dwelling among the children of men, but she found no dwelling-place: Wisdom returned to her place, and took her seat among the angels* (1 Enoch 42:2). Wisdom going forth to the children of men and finding no dwelling-place is the exact architecture of John 1:11: *he came unto his own, and his own received him not.* The Word came to his own and was not received; the Hebrew library had already named the rejection of the one sent to dwell among men.'),

  -- Thread 4: john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46
  ('canon', 'john', 1, 1, 'enoch', '1-enoch', 48, 2,
   E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). The Son of Adam named before the Head of Days in the Enochic Parables is the pre-existent Formed one John 1:1 opens with: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The named-before-the-Head-of-Days and the with-Elohim-in-the-beginning are the same eternal standing of the Formed before the Formless source.'),
  ('canon', 'john', 1, 1, 'enoch', '1-enoch', 48, 3,
   E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). His name named before the sun and stars were made is the pre-creation standing of John 1:1-2 — *the same was in the beginning with Elohim (God).* The Word was before the things made through him; the Enochic library names the same priority of the Son of Adam over the whole creation.'),
  ('canon', 'john', 1, 9, 'enoch', '1-enoch', 48, 4,
   E'*He shall be a staff to the righteous whereon to stay themselves and not fall, And he shall be the light of the Gentiles, And the hope of those who are troubled of heart* (1 Enoch 48:4). The Son of Adam as *the light* is the architecture of John 1:9: *that was the true Light, which lighteth every man that cometh into the world.* The Enochic library names the light shining beyond the covenant fence — for the troubled of heart and the nations — the same true Light the prologue names lighting every man.'),
  ('canon', 'john', 1, 18, 'enoch', '1-enoch', 46, 3,
   E'*This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). The Son of Adam who reveals all the hidden treasures is the declarer of John 1:18: *no man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The Formed who stands beside the Head of Days reveals what the Formless source keeps hidden — he declares him.'),
  ('canon', 'john', 1, 4, 'enoch', '1-enoch', 49, 1,
   E'*For wisdom is poured out like water, And glory faileth not before him for evermore* (1 Enoch 49:1). Wisdom poured out like water before the Elect One, whose glory never fails, is the life-and-light of John 1:4: *in him was life; and the life was the light of men.* The Enochic library names the inexhaustible life and unfailing glory the gospel names as the life that was the light of men.'),
  ('canon', 'john', 1, 51, 'enoch', '1-enoch', 46, 1,
   E'*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels* (1 Enoch 46:1). The Son of Adam beside the Head of Days, the heaven open to the seer, is the architecture of John 1:51: *hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* The Enochic vision and the gospel name the same Son of Adam at the open heaven, the point of contact between the heavens and the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j01_lookup sv ON sv.edition_slug = i.src_edition
                          AND sv.book_slug    = i.src_slug
                          AND sv.chapter_number = i.src_ch
                          AND sv.verse_number  = i.src_v
  JOIN _s212_j01_lookup tv ON tv.edition_slug = i.tgt_edition
                          AND tv.book_slug    = i.tgt_slug
                          AND tv.chapter_number = i.tgt_ch
                          AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon',
       'The Word and Wisdom — the Formed drawn from the Formless in Wisdom of Solomon',
       E'John 1:1-14''s prologue Christology — the Word with Elohim (God) in the beginning, the maker of all things, the life that was the light of men, made flesh and dwelling among us — was already being walked in the Hebrew library''s Wisdom of Solomon. The canon John 1 thread anchors the Wisdom-at-creation register at Proverbs 8:22; the deuterocanon carries the same architecture in even sharper terms. Wisdom of Solomon 9:1 names the creating-Word: *O Yahuah (God) of my fathers, and Yahuah (God) of mercy, who have made all things with your word.* Wisdom of Solomon 9:9 names Wisdom present at the making of the world: *and wisdom was with you ... and was present when you madest the world.* Wisdom of Solomon 7:25-26 names the Formed drawn from the Formless directly: *she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty ... the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* Wisdom of Solomon 7:22 names Wisdom as *the worker of all things.* The Formless source is the glory of the Almighty no eye sees; the Formed is the breath, the brightness, the image, the worker — the Word that *was made flesh, and dwelt among us.* The Hebrew library names the architecture; the gospel names the architecture made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 3000
  FROM _s212_j01_lookup sv, _s212_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24',
       'The Word tabernacling among Yashar''el — Wisdom dwelling in Sirach 24',
       E'John 1:14''s *the Word was made flesh, and dwelt among us* — the Greek *eskēnōsen,* tabernacled among us — walks the architecture Ecclesiasticus (Sirach) 24 already carries: Wisdom proceeding from the Most High and sent to tabernacle among the covenant people. Sirach 24:3 names the procession: *I came out of the mouth of the Most High, and covered the earth as a cloud.* Sirach 24:8 names the tabernacling: *the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Sirach 24:9 names the pre-creation standing: *he created me from the beginning before the world, and I shall never fail.* The Word came out of the Formless source as Wisdom came out of the mouth of the Most High; the Word pitched his tabernacle in flesh as Wisdom''s tabernacle was caused to rest in Jacob and Yashar''el (Israel). John 1:11''s *he came unto his own, and his own received him not* lands against the same sending: the one who was before the world came to the very people Wisdom was sent to dwell among, and his own received him not. The Hebrew library names the sending and the dwelling; the gospel names the dwelling in flesh and the refusal.',
       sv.verse_id, ev.verse_id, 'extras', 3001
  FROM _s212_j01_lookup sv, _s212_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 11
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42',
       'The Word found no place to dwell — Wisdom rejected in 1 Enoch 42',
       E'John 1:10-11''s reception-failure — *he was in the world, and the world was made by him, and the world knew him not. He came unto his own, and his own received him not* — has its sharpest extras-library parallel in 1 Enoch 42, where Wisdom finds no place to dwell among men. 1 Enoch 42:1 names the failure: *Wisdom found no place where she might dwell; then a dwelling-place was assigned her in the heavens.* 1 Enoch 42:2 lands it at the rejection: *Wisdom went forth to make her dwelling among the children of men, but she found no dwelling-place: Wisdom returned to her place, and took her seat among the angels.* The maker comes to what he made and is not known; the one sent comes to his own and is not received. The Enochic library names the dark inverse of the tabernacling Sirach 24 hoped for and the prologue announces — Wisdom went forth and found no dwelling-place, the very architecture John 1:10-11 walks. The gospel does not soften the rejection; it names it as the Hebrew library named it, and then carries the prologue forward to the ones who *received him* (John 1:12).',
       sv.verse_id, ev.verse_id, 'extras', 3002
  FROM _s212_j01_lookup sv, _s212_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46',
       'The light and the Son of Adam named before creation in 1 Enoch 48, 49, 46',
       E'John 1''s prologue names the Word before creation (vv.1-3), the life that was the light of men (v.4), the true Light that lighteth every man (v.9), the only begotten Son who declares the Father (v.18), and the Son of Adam at the open heaven (v.51). The Enochic Parables (1 Enoch 37-71) carry the same figure in the same registers. 1 Enoch 48:2-3 names the Son of Adam before creation: *that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days. Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* — the pre-existent standing of the Word *in the beginning with Elohim (God)* (John 1:1-2). 1 Enoch 48:4 names the light: *he shall be ... the light of the Gentiles, And the hope of those who are troubled of heart* — the true Light that *lighteth every man* (John 1:9). 1 Enoch 49:1 names the inexhaustible life: *wisdom is poured out like water, And glory faileth not before him for evermore* — the life that *was the light of men* (John 1:4). 1 Enoch 46:3 names the declarer: *this is the Son of Adam ... who revealeth all the treasures of that which is hidden* — the only begotten Son who *hath declared him* (John 1:18). 1 Enoch 46:1 names the open-heaven vision of the Son of Adam beside the Head of Days — the architecture of John 1:51''s *ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* The Enochic library names the Son of Adam named before creation as the light and the declarer; the gospel names the same Son of Adam made flesh, the true Light, who declares the Father he came from. (This is the named Son of Adam standing beside the Head of Days — title-naming, not the kaph-comparative of Daniel 7:13 / Revelation 1:13 / 14:14.)',
       sv.verse_id, ev.verse_id, 'extras', 3003
  FROM _s212_j01_lookup sv, _s212_j01_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 1 AND ev.verse_number = 51
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 9:1 — *who have made all things with your word.* The Most High''s creating-Word; John 1:1-3''s *all things were made by him* walks the same naming.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 9 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 9:9 — *and wisdom was with you ... and was present when you madest the world.* Wisdom present with the Most High at creation; John 1:1-3''s *the same was in the beginning with Elohim (God) ... all things were made by him.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 3
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 9 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 7:26 — *the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The Formed drawn from the Formless; John 1:4''s *the life was the light of men.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 4
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 26
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 7:25 — *the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty.* The Formed flowing from the Formless glory; John 1:14''s *we beheld his glory ... of the only begotten of the Father.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 7:22 — *wisdom, which is the worker of all things, taught me.* Wisdom the worker of all things; John 1:3''s *all things were made by him* and John 1:14''s *full of grace and truth.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-and-wisdom-the-formed-drawn-from-the-formless-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 7 AND tv.verse_number = 22
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* Wisdom proceeding from the Most High; John 1:14''s Word who came out of the Formless and *was made flesh.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:8 — *he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* Wisdom''s tabernacle set in Yashar''el (Israel); John 1:14''s *dwelt* (*eskēnōsen,* tabernacled) *among us.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 24:9 — *he created me from the beginning before the world, and I shall never fail.* Wisdom before the world, sent to the inheritance; John 1:11''s *he came unto his own, and his own received him not* — the one before the world came to the people Wisdom was sent to.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-tabernacling-among-yasharel-and-wisdom-dwelling-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 42:1 — *Wisdom found no place where she might dwell; then a dwelling-place was assigned her in the heavens.* The maker finds no place in what she made; John 1:10''s *the world was made by him, and the world knew him not.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 10
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 42 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 42:2 — *Wisdom went forth to make her dwelling among the children of men, but she found no dwelling-place.* The one sent to dwell among men finds no place; John 1:11''s *he came unto his own, and his own received him not.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-word-found-no-place-to-dwell-and-wisdom-rejected-in-1-enoch-42'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 11
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 42 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 48:2 — *that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Son of Adam named before the Head of Days; John 1:1''s Word *in the beginning with Elohim (God).*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:3 — *before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* The name before all creation; John 1:1-2''s Word before the things made through him.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:4 — *he shall be ... the light of the Gentiles, And the hope of those who are troubled of heart.* The Son of Adam as the light; John 1:9''s *true Light, which lighteth every man that cometh into the world.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 9
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 48 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 49:1 — *wisdom is poured out like water, And glory faileth not before him for evermore.* The inexhaustible life and unfailing glory; John 1:4''s *in him was life; and the life was the light of men.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 4
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 49 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 46:3 — *this is the Son of Adam ... who revealeth all the treasures of that which is hidden.* The declarer of the hidden; John 1:18''s *the only begotten Son, which is in the bosom of the Father, he hath declared him.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 18
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 46:1 — *with Him was another being whose countenance had the appearance of a man ... like one of the holy angels.* The Son of Adam beside the Head of Days at the open heaven; John 1:51''s *ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j01_lookup sv, _s212_j01_lookup tv
 WHERE t.slug = 'john-1-the-light-and-the-son-of-adam-named-before-creation-in-1-enoch-48-49-46'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 1 AND sv.verse_number = 51
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_john_02_04.sql -----
-- =====================================================================
-- S212 Gospel extras-library cross-references — JOHN 2, 3, 4
-- =====================================================================
-- Range: John 2 (temple cleansing), John 3 (Nicodemus / born-again /
--   new heart, the Son of Adam come down from heaven), John 4 (the
--   woman of Samaria / living water / worship in spirit and truth).
-- Tag: j0204    Temp view: _s212_j0204_lookup
-- sort_order band: 3030-3059
--
-- John 2 already carries canon threads (session194: cana-new-wine,
-- zeal-for-thine-house, destroy-this-temple) and John 3/4 carry canon
-- threads (session181: born-from-above v3-8, lifted-up v14, son-of-
-- adam-as-judge-and-ladder, salvation-is-of-the-yahudim v22). Those
-- migrations targeted canon only and never inserted extras-library
-- member rows. This fragment ADDS the missing outside-canon (extras)
-- threads the three chapters warrant — it does not duplicate the canon
-- threads.
--
-- FOUR new extras-tier threads:
--   1. john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
--        target editions: jubilees (Jubilees 1)                 (sort 3030)
--   2. john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
--        target editions: apocrypha (Baruch 3-4)                (sort 3031)
--   3. john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
--        target editions: apocrypha (Ecclesiasticus / Sirach 24) (sort 3032)
--   4. john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
--        target editions: apocrypha (1 Maccabees 4, 2 Maccabees 10) (sort 3033)
--
-- 13 extras-tier cross_references rows; 13 thread_member rows.
-- John 2 receives ONE extras thread (the Maccabean rededication) — its
-- water-to-wine + body-as-temple material is canon-substantial and
-- adds no framework-bearing extras connection at the required rigour,
-- so only the cleansing draws an extras add. No chapter in the range
-- was found to warrant zero extras.
--
-- Every quoted verse pulled live from the parsed editions; sacred names
-- restored per the voice convention; son-of-man -> Son of Adam applied.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (edition-aware, S135 pattern).
CREATE TEMP VIEW _s212_j0204_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id  = e.id
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
-- Insert 13 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
  ('canon', 'john', 3, 3, 'jubilees', 'jubilees', 1, 20,
   '*Let Your mercy, O Yahuah (God), be lifted up upon Your people, and create in them an upright spirit, and let not the spirit of Beliar rule over them ... create in them a clean heart and a holy spirit, and let them not be ensnared in their sins from henceforth until eternity.* (Jubilees 1:20) Mosheh (Moses) prays for the very thing Yahusha (Jesus) tells Nicodemus is required to *see the kingdom of Elohim (God)* — a clean heart and a holy spirit created in the people from above. The new birth of John 3:3 is not a new religion but the clean-heart-and-holy-spirit creation the Hebrew library names as the work of mercy lifted upon the covenant people, not a credential the flesh can manufacture.'),
  ('canon', 'john', 3, 5, 'jubilees', 'jubilees', 1, 23,
   '*And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them so that they shall not turn away from Me from that day to eternity.* (Jubilees 1:23) *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5) walks the same architecture the Hebrew library already named: the cleansing (water) and the created holy spirit (Spirit) are one act of Yahuah (God) upon the circumcised heart. The born-of-water-and-Spirit of John 3 is the heart-circumcision and holy-spirit-creation of Jubilees 1, not a sacrament severed from the heart-Torah it writes.'),
  ('canon', 'john', 3, 6, 'jubilees', 'jubilees', 1, 24,
   '*And their souls will cleave to Me and to all My commandments, and they will fulfil My commandments, and I shall be their Father and they will be My children.* (Jubilees 1:24) *That which is born of the Spirit is spirit* (John 3:6) names the Spirit-wrought life the Hebrew library describes as the soul that cleaves to Yahuah (God) and fulfils His commandments. The Spirit-birth does not lead away from the commandments; it produces the soul that cleaves to them — the same Spirit who spoke at Sinai writing the Torah inward and making the born-again a child of the Father.'),
  ('canon', 'john', 3, 7, 'jubilees', 'jubilees', 1, 25,
   '*And they will all be called children of the living Elohim (God), and every angel and every spirit will know ... that these are My children, and that I am their Father.* (Jubilees 1:25) *Ye must be born again* (John 3:7) is the doorway into the *children of the living Elohim (God)* the Hebrew library names as the destination of the heart-circumcision. The new birth makes the willing into the children-of-the-living the prophets promised the gathered house — the same sonship Hoshea (Hosea) named for the scattered who were once *not my people.*'),

  -- Thread 2: john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 29,
   '*Who has gone up into heaven, and taken her, and brought her down from the clouds?* (Baruch 3:29) The Hebrew library asks the rhetorical question — no son of Adam can ascend to heaven to fetch the wisdom of Elohim (God) down. *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13) is the answer the question waited for: the One who came down is the only One who was ever up there to bring it. The ascent the wisdom-stream says no man can make is the descent the Formed Son already made.'),
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 30,
   '*Who has gone over the sea, and found her, and will bring her for pure gold?* (Baruch 3:30) The wisdom-stream stacks the impossibility — wisdom cannot be reached over the sea any more than up to heaven; she is past the searching of the son of Adam. John 3:13''s *no man hath ascended up to heaven, but he that came down from heaven* names the One who did not have to search for her because He came down from where she dwells. The reaching the Hebrew library forecloses to man is answered by the descent of the Son of Adam.'),
  ('canon', 'john', 3, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 37,
   '*Afterward did he shew himself upon earth, and conversed with men.* (Baruch 3:37) The Hebrew library closes the wisdom-search by naming the descent: the One who alone knows wisdom *shewed himself upon earth, and conversed with men.* This is the substance of John 3:13 — the Son of Adam who *came down from heaven* is the One Baruch says shewed himself on earth and walked among men, the wisdom no man could fetch down now standing in flesh in front of Nicodemus.'),
  ('canon', 'john', 3, 12, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1,
   '*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* (Baruch 4:1) The wisdom Baruch 3 says no man could ascend to fetch is here named plainly as the Torah, *the law that endureth for ever.* Yahusha''s (Jesus'') rebuke at John 3:12 — *if I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* — falls on a *master of Yashar''el (Israel)* who held the book of the commandments yet could not see the heavenly thing the book pointed toward. The Torah endures for ever; the One who came down from heaven is the wisdom it was always carrying.'),

  -- Thread 3: john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
  ('canon', 'john', 4, 14, 'apocrypha', 'ecclesiasticus', 24, 21,
   '*They that eat me shall yet be hungry, and they that drink me shall yet be thirsty.* (Ecclesiasticus / Sirach 24:21) Wisdom names her own limit in the Hebrew library: the one who drinks of her *shall yet be thirsty* — the study returns one again and again to the well. *Whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) is the answer to the wisdom-stream''s own confession. The Formed one is not the abolition of the wisdom that left the drinker thirsty; He is the well springing up within, the substance the Torah-wisdom drew the thirsty toward.'),
  ('canon', 'john', 4, 10, 'apocrypha', 'ecclesiasticus', 24, 19,
   '*Come to me, all you that be desirous of me, and fill yourselves with my fruits.* (Ecclesiasticus / Sirach 24:19) Wisdom calls the desirous to come and be filled — the same invitation Yahusha (Jesus) extends at the well: *if thou knewest the gift of Elohim (God) ... thou wouldest have asked of him, and he would have given thee living water* (John 4:10). The Hebrew library''s *come to me ... and fill yourselves* is the wisdom-call the living-water offer fulfils; the gift of Elohim (God) the woman did not yet know is the wisdom-fountain standing at Ya''aqov''s (Jacob''s) well asking her for a drink.'),
  ('canon', 'john', 4, 22, 'apocrypha', 'ecclesiasticus', 24, 23,
   '*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Ecclesiasticus / Sirach 24:23) The Hebrew library identifies wisdom as the Torah given as a heritage to the congregations of Ya''aqov (Jacob) — the covenant-knowledge the house of the covenant carries. *Salvation is of the Yahudim (Jews)* (John 4:22) names the same thing to the woman of Samaria: the wisdom, the covenant, the heritage was kept in the line of Yahudah (Judah), and the well of living water now offered to the scattered northern house flows from that kept inheritance, not from a rival mountain.'),

  -- Thread 4: john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
  ('canon', 'john', 2, 16, 'apocrypha', '1-maccabees', 4, 36,
   '*Then said Judas and his brothers, Behold, our enemies are discomfited: let us go up to cleanse and dedicate the sanctuary.* (1 Maccabees 4:36) The Hebrew library carries the prior cleansing of the defiled house — the Hasmonean *go up to cleanse and dedicate the sanctuary.* *Make not my Father''s house an house of merchandise* (John 2:16) is the same purging-of-the-defiled-house motion, now in the hand of the One whose house it is. The Maccabees cleansed the sanctuary the heathen profaned; the Formed one cleanses the court the traders profaned, the Lord of the house returning to purge His own.'),
  ('canon', 'john', 2, 15, 'apocrypha', '2-maccabees', 10, 2,
   '*But the altars which the heathen had built in the open street, and also the chapels, they pulled down.* (2 Maccabees 10:2) The rededication tears down what defiled the holy ground. *And when he had made a scourge of small cords, he drove them all out of the temple* (John 2:15) walks the same architecture: the casting-out of the defilement that had encroached on the house of prayer. The Hebrew library''s pulling-down of the heathen altars is the prior enacted purging the Formed one recapitulates with the scourge, reclaiming the gathering-court for the gathering it was built for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j0204_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j0204_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1',
       'Born again — the new heart and clean spirit of Jubilees 1',
       E'Yahusha (Jesus) tells Nicodemus, a *master of Yashar''el (Israel),* that he must be *born again ... of water and of the Spirit* to enter the kingdom of Elohim (God) — and is met with bewilderment that a teacher of the covenant should not already know this. The inherited reading hears a new-religion entry-rite. The Hebrew library hears the new-heart promise Mosheh (Moses) prayed for and Yahuah (God) answered on Sinai: the clean heart and holy spirit created in the willing, the foreskin of the heart circumcised, the soul made to cleave to the commandments, the people called children of the living Elohim (God).\n\n*Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God). That which is born of the flesh is flesh; and that which is born of the Spirit is spirit ... Ye must be born again.* (John 3:5-7)\n\n*Create in them a clean heart and a holy spirit, and let them not be ensnared in their sins ... And after this they will turn to Me in all uprightness and with all (their) heart and with all (their) soul, and I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit, and I shall cleanse them ... And their souls will cleave to Me and to all My commandments ... And they will all be called children of the living Elohim (God).* (Jubilees 1:20, 23-25)\n\nThe born-of-water-and-Spirit of John 3 is the cleansing-and-holy-spirit-creation Jubilees 1 already names as a single act of Yahuah (God) upon the circumcised heart. The new birth is not a credential the flesh can manufacture — *that which is born of the flesh is flesh* — and it is not a severing from the Torah. The same Spirit-creation that makes the new heart makes *the soul cleave to all My commandments;* the Spirit-birth writes the Torah inward, it does not abolish it. And the destination is the *children of the living Elohim (God)* the prophets promised the gathered house, the sonship Hoshea (Hosea) named for the scattered who were once *not my people.* Nicodemus held the book that promised this; the new birth is the heart-Torah of the covenant he taught coming to pass in the willing.',
       sv.verse_id, ev.verse_id, 'extras', 3030
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3',
       'No man ascended to bring wisdom down — the Son of Adam came down (Baruch 3)',
       E'Pressing past Nicodemus'' bewilderment, Yahusha (Jesus) says the heavenly things are beyond a teacher who will not believe the earthly, and grounds it in a claim about who alone has been in heaven: *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The Hebrew library had asked the matching question for centuries — who can go up to heaven and bring the wisdom of Elohim (God) down? — and answered that no son of Adam can; she is past the searching of man, until the One who alone knows her *shewed himself upon earth.*\n\n*If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things? And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* (John 3:12-13)\n\n*Who has gone up into heaven, and taken her, and brought her down from the clouds? Who has gone over the sea, and found her, and will bring her for pure gold? ... Afterward did he shew himself upon earth, and conversed with men. This is the book of the commandments of Yahuah (God), and the law that endureth for ever.* (Baruch 3:29-30, 37; 4:1)\n\nBaruch stacks the impossibility — wisdom cannot be fetched down from the clouds or found over the sea by the reach of the son of Adam — and then names the descent that answered it: the One who alone knows her *shewed himself upon earth, and conversed with men.* That is the substance of John 3:13. The ascent the wisdom-stream forecloses to man is the descent the Formed Son already made; no man went up to bring wisdom down, because the wisdom *came down from heaven* of Himself. And the wisdom Baruch names is no abstraction — it is *the book of the commandments ... the law that endureth for ever.* The *master of Yashar''el (Israel)* held that enduring book and still could not see the heavenly thing it carried, because the wisdom it pointed toward was the Son of Adam standing in flesh in front of him.',
       sv.verse_id, ev.verse_id, 'extras', 3031
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 12
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 3 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24',
       'Living water that ends the thirst — the wisdom-well of Sirach 24',
       E'At Ya''aqov''s (Jacob''s) well in Samaria — the heartland of the scattered northern house — Yahusha (Jesus) offers a woman *living water,* a *well of water springing up into everlasting life* that ends thirst forever. The Hebrew library''s wisdom-stream had named both the call and its own limit: wisdom invites the desirous to come and be filled, yet confesses that *they that drink me shall yet be thirsty* — the study returns the drinker again and again to the well. The living water Yahusha (Jesus) gives is the answer to that confession.\n\n*Whosoever drinketh of this water shall thirst again: But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life.* (John 4:13-14)\n\n*Come to me, all you that be desirous of me, and fill yourselves with my fruits ... They that eat me shall yet be hungry, and they that drink me shall yet be thirsty ... All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* (Ecclesiasticus / Sirach 24:19, 21, 23)\n\nWisdom''s *come to me ... and fill yourselves* is the same call Yahusha (Jesus) extends — *if thou knewest the gift of Elohim (God) ... he would have given thee living water.* But the wisdom-stream says her drinkers *shall yet be thirsty,* and the Formed one says His water means the drinker *shall never thirst,* a well springing up within. He is not the abolition of the wisdom that left the drinker thirsty; Sirach 24:23 names that wisdom as *the law which Moses commanded for an heritage to the congregations of Jacob,* and Yahusha (Jesus) is the substance the Torah-wisdom drew the thirsty toward. *Salvation is of the Yahudim (Jews)* — the covenant-heritage was kept in the line of Yahudah (Judah), and the living water now offered to the scattered northern house at the well flows from that kept inheritance, not from a rival mountain. The wisdom that left them thirsty pointed to the well that does not.',
       sv.verse_id, ev.verse_id, 'extras', 3032
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 4 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees',
       'The temple cleansed — the Maccabean rededication of the defiled house',
       E'Yahusha (Jesus) drives the traders out of the temple courts with a scourge of cords and forbids that His *Father''s house* be made *an house of merchandise.* The inherited reading frames a protest against commerce. The Hebrew library carries the prior enacted purging the cleansing recapitulates: the Hasmonean rededication, when the defiled sanctuary was cleansed, the heathen altars torn down, and the house given back to the worship it was built for.\n\n*And when he had made a scourge of small cords, he drove them all out of the temple ... and said unto them that sold doves, Take these things hence; make not my Father''s house an house of merchandise.* (John 2:15-16)\n\n*Then said Judas and his brothers, Behold, our enemies are discomfited: let us go up to cleanse and dedicate the sanctuary.* (1 Maccabees 4:36)\n\n*But the altars which the heathen had built in the open street, and also the chapels, they pulled down. And having cleansed the temple they made another altar.* (2 Maccabees 10:2-3)\n\nThe Maccabees *went up to cleanse and dedicate the sanctuary* the heathen had profaned, pulling down the altars that defiled the holy ground. The Formed one walks the same purging-of-the-defiled-house motion — but where the Hasmoneans cleansed a sanctuary defiled from outside by the heathen, the Lord of the house returns to purge a court defiled from inside by a credential-merchandise that had taken over the very space appointed to receive the gathered outcasts of Yashar''el (Israel). The scourge of cords is the rededication in the hand of the One whose house it is: the prior cleansing was a shadow; the cleansing at the feast is the Owner of the house reclaiming the gathering-court for the gathering.',
       sv.verse_id, ev.verse_id, 'extras', 3033
  FROM _s212_j0204_lookup sv, _s212_j0204_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 2 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 1:20 — *create in them a clean heart and a holy spirit, and let them not be ensnared in their sins from henceforth until eternity.* Mosheh (Moses) prays for the clean-heart-and-holy-spirit creation John 3:3 names as required to see the kingdom; the new birth is the work of mercy lifted on the people, not a flesh-credential.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 3
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 1:23 — *I shall circumcise the foreskin of their heart ... and I shall create in them a holy spirit, and I shall cleanse them.* The born-of-water-and-Spirit of John 3:5 is the heart-circumcision (water/cleansing) and holy-spirit-creation (Spirit) named as one act upon the heart in the Hebrew library.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 5
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 1:24 — *their souls will cleave to Me and to all My commandments, and they will fulfil My commandments, and I shall be their Father and they will be My children.* *That which is born of the Spirit is spirit* (John 3:6): the Spirit-birth produces the soul that cleaves to the commandments — the Spirit writes the Torah inward, never away from it.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 6
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 24
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 1:25 — *they will all be called children of the living Elohim (God) ... and I am their Father.* *Ye must be born again* (John 3:7) is the doorway into the children-of-the-living the Hebrew library names as the destination of the heart-circumcision — the sonship promised the gathered who were once *not my people.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-born-again-the-new-heart-and-clean-spirit-in-jubilees-1'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 7
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 1 AND tv.verse_number = 25
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 3:29 — *Who has gone up into heaven, and taken her, and brought her down from the clouds?* The Hebrew library''s rhetorical question; John 3:13''s *no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam* is the answer — the descent that no ascent could accomplish.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 29
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 3:30 — *Who has gone over the sea, and found her, and will bring her for pure gold?* Wisdom is past the reach of the son of Adam over the sea as well as up to heaven; John 3:13 names the One who did not have to search because He came down from where she dwells.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 30
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:37 — *Afterward did he shew himself upon earth, and conversed with men.* The Hebrew library names the descent that answered the wisdom-search; this is the substance of John 3:13''s Son of Adam who *came down from heaven* — the wisdom no man could fetch down now standing in flesh.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 13
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 3 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Baruch 4:1 — *This is the book of the commandments of Yahuah (God), and the law that endureth for ever.* The wisdom Baruch 3 says no man could ascend to fetch is named plainly as the Torah; John 3:12''s rebuke falls on a *master of Yashar''el (Israel)* who held that enduring book yet could not see the heavenly thing it carried.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-3-no-man-ascended-to-bring-wisdom-down-the-son-of-adam-came-down-in-baruch-3'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 3 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Wisdom''s come-and-be-filled call is the same invitation Yahusha (Jesus) extends at John 4:10 — *if thou knewest the gift of Elohim (God) ... he would have given thee living water.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 10
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 24:21 — *they that eat me shall yet be hungry, and they that drink me shall yet be thirsty.* Wisdom confesses her own limit; John 4:14''s *whosoever drinketh of the water that I shall give him shall never thirst ... a well of water springing up into everlasting life* is the answer the wisdom-stream waited for.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 14
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 21
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Wisdom is the Torah-heritage kept in the covenant line; John 4:22''s *salvation is of the Yahudim (Jews)* names the same kept inheritance the living water now flows from to the scattered house.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-4-living-water-and-the-wisdom-that-leaves-still-thirsty-in-sirach-24'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 4 AND sv.verse_number = 22
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 4:36 — *let us go up to cleanse and dedicate the sanctuary.* The Hasmonean cleansing of the defiled house; John 2:16''s *make not my Father''s house an house of merchandise* is the same purging motion, now in the hand of the One whose house it is.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '1-maccabees' AND tv.chapter_number = 4 AND tv.verse_number = 36
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 10:2 — *the altars which the heathen had built ... they pulled down.* The rededication tears down the defilement; John 2:15''s *he drove them all out of the temple* with the scourge of cords walks the same casting-out of what encroached on the house of prayer.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j0204_lookup sv, _s212_j0204_lookup tv
 WHERE t.slug = 'john-2-the-temple-cleansed-and-the-maccabean-rededication-in-1-and-2-maccabees'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 2 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-maccabees' AND tv.chapter_number = 10 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- =====================================================================
-- END S212 JOHN 2/3/4 extras fragment
-- =====================================================================

-- ----- fragment: minion_john_05_08.sql -----
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

-- ----- fragment: minion_john_09_12.sql -----
-- =====================================================================
-- S212 minion — JOHN 9-12 outside-canon (extras-library) cross-references
-- =====================================================================
-- Range:   John 9, 10, 11, 12
-- Tag:     j0912   (temp view _s212_j0912_lookup)
-- Band:    sort_order 3090-3119
--
-- Promotes framework-bearing extras-library connections into real
-- edition-aware member rows for the John 9-12 reading. John 9 already
-- carries canon threads from session194 (light-of-the-world, for-judgment,
-- cast-out-of-the-synagogue); this fragment ADDS extras threads only and
-- does not duplicate those. Mark/Luke/John carried ZERO outside-canon
-- xrefs before this S212 pass; this is the John 9-12 slice.
--
-- The reading: John 9 (the man born blind washes and comes seeing, then
-- worships the Son of Elohim — *one thing I know, that, whereas I was
-- blind, now I see*); John 10 (the Good Shepherd, *my sheep hear my
-- voice*, and the *other sheep I have, which are not of this fold* — the
-- gathering of the scattered house); John 11 (the raising of Lazaros and
-- *I am the resurrection, and the life*; Caiaphas prophesying that he
-- should *gather together in one the children of Elohim that were
-- scattered abroad*); John 12 (the triumphal entry, *the hour is come,
-- that the Son of Adam should be glorified*, the corn of wheat that dies,
-- and *I, if I be lifted up from the earth, will draw all men unto me*).
--
-- Five NEW extras-tier threads:
--   1. john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit       (3090)
--        target editions: apocrypha (Tobit)
--   2. john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13     (3091)
--        target editions: apocrypha (2 Esdras / 4 Ezra)
--   3. john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch  (3092)
--        target editions: apocrypha (2 Esdras), enoch (1 Enoch)
--   4. john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach (3093)
--        target editions: apocrypha (Baruch, Ecclesiasticus / Sirach)
--   5. john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables (3094)
--        target editions: enoch (1 Enoch)
--
-- 16 new cross_references rows + 16 new thread_member rows, all at
-- tier_required='extras'. Every member-note passes the 12 Red Lines and
-- the 12-point editorial checklist.
--
-- CHAPTER WITH NO EXTRAS ADD: John 12's *corn of wheat* (v.24) warrants
-- NO extras thread. The seed-that-dies-to-bear-much-fruit is a death-
-- yields-resurrection-fruit substance; the extras-library's seed material
-- (2 Esdras 4 / 8 / 9) is sown-word-and-harvest substance, framed toward
-- who-is-saved at the threshing, not toward a single seed dying to
-- multiply — and that harvest substance is already carried in existing
-- threads (seed-of-good-and-evil-sown-in-the-heart-of-adam-in-2-esdras,
-- and the harvest/sifting cluster). Forcing a corn-of-wheat extras pairing
-- would be a TSK-style dump, not a framework-bearing connection. John 12's
-- framework-bearing extras add lands instead at v.23 (the Son of Adam
-- glorified) where the Enochic Parables carry the exact enthronement
-- substance.
--
-- Quote-don't-cite: every verse quoted in full, in italics, citation in
-- parentheses. Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- No BEGIN/COMMIT/\echo — the orchestrator wraps one transaction per gospel.
-- =====================================================================

-- Verse-lookup temp view. Every scripture-level extras edition seeded for
-- V1, plus canon.
CREATE TEMP VIEW _s212_j0912_lookup AS
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
-- Insert 16 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit
  ('canon', 'john', 9, 7, 'apocrypha', 'tobit', 11, 11,
   E'*And took hold of his father: and he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* Tobit 11:11 names the eyes-opened architecture in the Hebrew library — the blind father whose sight is restored by the appointed means. John 9:7''s *Go, wash in the pool of Siloam ... He went his way therefore, and washed, and came seeing* walks the same architecture: the Formed one applies clay and sends to the water, and the man born blind comes seeing. The Hebrew library carries the eyes-opened pattern; the gospel walks it as the messianic credential — *since the world began was it not heard that any man opened the eyes of one that was born blind* (John 9:32).'),
  ('canon', 'john', 9, 7, 'apocrypha', 'tobit', 11, 13,
   E'*And the whiteness pilled away from the corners of his eyes: and when he saw his son, he fell upon his neck.* Tobit 11:13 names the whiteness-peeled-away moment the sight is given. John 9 walks the same in the man who *received sight* and would not be talked out of what he knew: *one thing I know, that, whereas I was blind, now I see* (John 9:25). The Hebrew library names the restored sight; the gospel names the restored sight that the restored man defends against the whole court.'),
  ('canon', 'john', 9, 38, 'apocrypha', 'tobit', 11, 14,
   E'*And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever; and blessed are all yours holy angels.* Tobit 11:14 names the response to the opened eyes — the blessing of the name of Yahuah (God) the moment sight is restored. John 9:38''s *Lord, I believe. And he worshipped him* walks the same architecture: the man whose eyes were opened falls in worship before the Son of Elohim (God) who opened them. The Hebrew library blesses the name at the restored sight; the gospel worships the Formed one who restored it.'),
  ('canon', 'john', 9, 38, 'apocrypha', 'tobit', 11, 15,
   E'*For you have scourged, and have taken pity on me: for, behold, I see my son Tobias. And his son went in rejoicing.* Tobit 11:15 names the scourged-then-pitied architecture — the affliction borne, then the mercy of the opened eyes, then rejoicing. John 9 walks the same arc: the man born blind, who *neither hath this man sinned, nor his parents: but that the works of Elohim (God) should be made manifest in him* (John 9:3), receives the mercy of sight and ends in worship. The Hebrew library names the pity in the restored sight; the gospel names the works of Elohim (God) made manifest in it.'),

  -- Thread 2: john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13
  ('canon', 'john', 10, 16, 'apocrypha', '2-esdras', 13, 40,
   E'*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive, and he carried them over the waters, and so came they into another land.* 2 Esdras 13:40 names the ten tribes of the scattered house explicitly — the very sheep John 10:16''s *other sheep I have, which are not of this fold* names. The *other sheep* are not the nations grafted in by confession; they are the scattered house of Yashar''el (Israel) carried over the waters in the Assyrian captivity, named tribe-by-tribe in the Hebrew library. The Shepherd says *them also I must bring* — the gathering of the carried-away ten tribes the vision names.'),
  ('canon', 'john', 10, 16, 'apocrypha', '2-esdras', 13, 47,
   E'*The Highest shall stay the springs of the stream again, that they may go through: therefore sawest you the multitude with peace.* 2 Esdras 13:47 names the gathering-home of the scattered ten tribes — the Most High staying the river so the carried-away may cross back. John 10:16''s *them also I must bring; and they shall hear my voice; and there shall be one fold, and one shepherd* walks the same gathering: the scattered house brought home into one fold under one Shepherd. The Hebrew library names the road home for the ten tribes; the gospel names the Shepherd who brings them and the one fold they are gathered into.'),
  ('canon', 'john', 10, 27, 'apocrypha', '2-esdras', 13, 33,
   E'*And when all the people hear his voice, every man shall in their own land leave the battle they have one against another.* 2 Esdras 13:33 names the hearing-of-the-voice of the Son who is declared — the people hearing his voice and turning. John 10:27''s *my sheep hear my voice, and I know them, and they follow me* walks the same architecture: the hearing reveals the sheep. The Hebrew library names the voice of the declared Son that the people hear; the gospel names the same voice the sheep hear and follow, because the hearing discloses what they already were.'),

  -- Thread 3: john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch
  ('canon', 'john', 11, 24, 'apocrypha', '2-esdras', 7, 32,
   E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* 2 Esdras 7:32 names the resurrection-at-the-last-day architecture — the earth restoring the sleeping, the dust giving back those in silence. Martha''s *I know that he shall rise again in the resurrection at the last day* (John 11:24) names the same Hebrew library hope. The earth giving back its dead is the resurrection the Hebrew library held; the raising of Lazaros at John 11:43-44 is the firstfruit-sign of it — *Lazarus, come forth.*'),
  ('canon', 'john', 11, 25, 'enoch', '1-enoch', 51, 1,
   E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise.* 1 Enoch 51:1 names the earth-and-Sheol-give-back-their-dead architecture, and the arising of the Elect One at the resurrection. John 11:25''s *I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* walks the same architecture: the Formed one is himself the resurrection the Hebrew library awaited, the Elect One whose arising brings the dead back from the earth, from Sheol, from death''s keeping.'),
  ('canon', 'john', 11, 25, 'enoch', '1-enoch', 51, 2,
   E'*And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* 1 Enoch 51:2 names the choosing-of-the-righteous at the resurrection — the day of salvation drawn nigh. John 11:25-26''s *he that believeth in me, though he were dead, yet shall he live: and whosoever liveth and believeth in me shall never die* walks the same architecture: the resurrection-and-the-life chooses the believing from among the dead. The Hebrew library names the Elect One choosing the righteous at the resurrection; the gospel names the Formed one who is the resurrection doing the same choosing.'),

  -- Thread 4: john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37,
   E'*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* Baruch 4:37 names the gathering-of-the-scattered-children architecture — the sons sent away in the scattering, gathered home from east to west by the word of the Holy One. John 11:52''s *and not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* walks the same architecture: the death of the Formed one gathers the scattered children home. The Hebrew library names the children gathered by the word of the Holy One; the gospel names the One whose death gathers them into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5,
   E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch 5:5 names the children-gathered-from-the-west-to-the-east architecture again, doubled with Baruch 4:37 for emphasis — the scattered children brought home by the word of the Holy One. John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same Hebrew library gathering: the scattered children of the covenant brought home into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 9,
   E'*For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him.* Baruch 5:9 names the leading-home-of-Yashar''el (Israel) — the gathering completed, the scattered led home in the light of the glory. John 11:52''s gathering of the scattered children into one is the gospel-form of the same homecoming the Hebrew library names: Yashar''el (Israel) led home with joy in the glory, the children scattered abroad gathered into one.'),
  ('canon', 'john', 11, 52, 'apocrypha', 'ecclesiasticus', 36, 11,
   E'*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gather-all-the-tribes-of-Jacob prayer in the Hebrew library''s wisdom-stream — the explicit petition for the gathering of the scattered tribes back into the inheritance, *as from the beginning.* John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same architecture: the gathering Caiaphas prophesies without understanding is the gathering of all the tribes of Jacob the Hebrew library was already praying for. The wisdom-stream prays it; the gospel names the death that accomplishes it.'),

  -- Thread 5: john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables
  ('canon', 'john', 12, 23, 'enoch', '1-enoch', 62, 7,
   E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.* 1 Enoch 62:7 names the Son of Adam declared by Yahuah (God) of Spirits — the named Son of Adam, born unto righteousness, standing in the Parables. John 12:23''s *the hour is come, that the Son of Adam should be glorified* walks the same architecture: the Son of Adam the Hebrew library names is the Formed one whose hour of glorification has come. The Hebrew library names the Son of Adam beside the Head of Days; the gospel names the hour that Son of Adam is glorified — through the lifting-up of the cross.'),
  ('canon', 'john', 12, 23, 'enoch', '1-enoch', 62, 2,
   E'*And when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits ... Then shall they all speak with one voice, And bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* 1 Enoch 62:2 names the glorifying-of-the-name architecture at the Son of Adam''s enthronement. John 12:23 and 12:28''s *the hour is come, that the Son of Adam should be glorified ... Father, glorify thy name. Then came there a voice from heaven, saying, I have both glorified it, and will glorify it again* walk the same architecture: the hour of the Son of Adam''s glorifying is the hour the Father''s name is glorified. The Hebrew library names the name glorified at the Son of Adam''s investiture; the gospel names the Father''s voice glorifying the name at the hour of the Son of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j0912_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j0912_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 5 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit',
       E'The eyes opened and the blessing of the name in Tobit',
       E'The man born blind washes in the pool of Siloam — *which is by interpretation, Sent* — and comes seeing; and when the Formed one finds him after the court has cast him out, he worships. The inherited reading treats the healing as a stand-alone wonder. The Hebrew library''s own eyes-opened narrative reads it as a known pattern carried forward: the blindness borne, the appointed means applied, the sight restored, and the name of Yahuah (God) blessed in worship.\n\n*And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* (John 9:7)\n\n*And he said, Lord, I believe. And he worshipped him.* (John 9:38)\n\n*And took hold of his father: and he strake of the gall on his fathers'' eyes ... And the whiteness pilled away from the corners of his eyes ... And he wept, and said, Blessed art you, O Yahuah (God), and blessed is your name for ever.* (Tobit 11:11, 13, 14)\n\nTobit''s blindness is borne and then healed by the appointed means — the gall applied, the whiteness peeled away, the sight restored — and the first thing the seeing man does is bless the name of Yahuah (God) for ever. The man born blind walks the same arc: his blindness is *that the works of Elohim (God) should be made manifest in him* (John 9:3), the clay and the washing are the appointed means, and the seeing man ends not in self-congratulation but in worship of the Son of Elohim (God) who opened his eyes. The Hebrew library names the eyes-opened pattern and the blessing of the name that answers it; the gospel walks the same pattern and names the Formed one as the One the restored sight worships. *One thing I know, that, whereas I was blind, now I see* (John 9:25) is the testimony the whole court cannot talk the seeing man out of — the restored sight defending itself against the credential-system that cast him out.',
       sv.verse_id, ev.verse_id, 'extras', 3090
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 9 AND ev.verse_number = 38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13',
       E'The other sheep and the ten tribes gathered in 2 Esdras 13',
       E'The Good Shepherd names sheep beyond the fold standing in front of him: *and other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* The inherited reading hears *other sheep* as the nations brought into the church by confession. The framework hears the Tanakh''s own scattered-house language — and the Hebrew library names the scattered house tribe-by-tribe: the ten tribes carried away in the Assyrian captivity, gathered home by the Most High.\n\n*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16)\n\n*My sheep hear my voice, and I know them, and they follow me.* (John 10:27)\n\n*Those are the ten tribes, which were carried away prisoners out of their own land in the time of Osea the king, whom Salmanasar the king of Assyria led away captive ... The Highest shall stay the springs of the stream again, that they may go through ... And when all the people hear his voice, every man shall in their own land leave the battle they have one against another.* (2 Esdras 13:40, 47, 33)\n\nThe *other sheep* are not the nations grafted in by a new mechanism; they are the scattered house of Yashar''el (Israel) — the ten northern tribes the Assyrian captivity carried over the waters, named explicitly in the Hebrew library''s vision of the Son who is declared. The Shepherd says *them also I must bring,* and the vision names the road home: the Most High staying the river so the carried-away may cross back into one fold. And the mechanism is the same in both: *when all the people hear his voice* they turn — the hearing reveals the sheep, exactly as John 10:27 names it. *My sheep hear my voice* is not a creating but a disclosing; the scattered house hears because the scattered house was always the Shepherd''s. The gathering of the carried-away ten tribes is the gathering the Good Shepherd discourse walks.',
       sv.verse_id, ev.verse_id, 'extras', 3091
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 10 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch',
       E'The resurrection and the life — the earth giving back its dead in 2 Esdras and 1 Enoch',
       E'At the grave of Lazaros, Martha confesses the resurrection-at-the-last-day, and the Formed one answers with a name: *I am the resurrection, and the life.* The inherited reading treats the raising of Lazaros as a stand-alone miracle and the saying as a comfort. The Hebrew library names the architecture the saying stands on: the earth, Sheol, and death itself giving back the dead at the resurrection, and the Elect One arising to choose the righteous from among them.\n\n*Martha saith unto him, I know that he shall rise again in the resurrection at the last day. Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live: and whosoever liveth and believeth in me shall never die.* (John 11:24-26)\n\n*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32)\n\n*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise, And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* (1 Enoch 51:1-2)\n\nMartha''s hope — *the resurrection at the last day* — is the Hebrew library''s own hope: the earth restoring the sleeping, the dust giving back those in silence, Sheol and death giving back what they hold. And the Hebrew library binds that resurrection to a person: the Elect One who arises and chooses the righteous from among the raised. John 11:25 lands the same architecture in the first person — the Formed one is himself the resurrection the Hebrew library awaited, the Elect One whose arising brings the dead back from the earth, from Sheol, from death''s keeping. The raising of Lazaros — *Lazarus, come forth* — is the firstfruit-sign of it: the head doing in one grave what the whole gathered body will follow him through at the last day.',
       sv.verse_id, ev.verse_id, 'extras', 3092
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach',
       E'Gather together the scattered children — from east to west in Baruch and Sirach',
       E'Caiaphas, meaning only to engineer a death that will protect the nation, prophesies more than he knows: the Formed one will die *not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad.* The inherited reading reads *scattered abroad* as the dispersion of believers generally. The framework hears the prophets'' own gathering-language — and the Hebrew library names it precisely: the scattered children sent away in the exile, gathered home from east to west by the word of the Holy One.\n\n*And this spake he not of himself: but being high priest that year, he prophesied that Yahusha (Jesus) should die for that nation; And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad.* (John 11:51-52)\n\n*Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* (Baruch 4:37)\n\n*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One ... For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* (Baruch 5:5, 9)\n\n*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* (Sirach 36:11)\n\nThe children Caiaphas unwittingly names are the scattered children of the covenant — the sons sent away in the scattering, whom the Hebrew library sees gathered home from east to west by the word of the Holy One, led home in the light of the glory. The wisdom-stream prays the petition outright: *gather all the tribes of Jacob together ... as from the beginning.* The gathering John 11:52 names is not the inclusion of unrelated peoples by a new mechanism; it is the homecoming of the scattered children of Elohim (God) the prophets and the wisdom-stream had been awaiting and praying for. The high priest engineers a death; the death he engineers is the very thing that gathers the scattered tribes of Jacob into one.',
       sv.verse_id, ev.verse_id, 'extras', 3093
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 51
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 11 AND ev.verse_number = 52
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables',
       E'The hour is come — the Son of Adam glorified and enthroned in the Enochic Parables',
       E'When the Greeks at the feast ask to see him, the Formed one answers not with an audience but with the hour: *the hour is come, that the Son of Adam should be glorified.* The inherited reading hears *glorified* as a euphemism for the crucifixion. The framework hears the full weight: the Son of Adam is a named figure in the Hebrew library — declared by Yahuah (God) of Spirits, enthroned beside the Head of Days — and his glorifying is the investiture the Parables already wrote, reached by way of the lifting-up.\n\n*And Yahusha (Jesus) answered them, saying, The hour is come, that the Son of Adam should be glorified.* (John 12:23)\n\n*Father, glorify thy name. Then came there a voice from heaven, saying, I have both glorified it, and will glorify it again.* (John 12:28)\n\n*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not.* (1 Enoch 62:7)\n\n*And when he shall lift up his face To judge their secret ways by the word of the name of Yahuah (God) of Spirits ... Then shall they all speak with one voice, And bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* (1 Enoch 62:2)\n\nThe Son of Adam is not a veil over a generic human; the Hebrew library names him — *this is the Son of Adam who is born unto righteousness* — declared by Yahuah (God) of Spirits, the righteousness of the Head of Days never forsaking him. The Parables glorify the name at the Son of Adam''s enthronement; John 12:28 lands the same architecture in the Father''s own voice from heaven: *Father, glorify thy name ... I have both glorified it, and will glorify it again.* The hour of the Son of Adam''s glorifying is the hour the Father''s name is glorified. And the path to the enthronement the Parables describe runs through the lifting-up: *I, if I be lifted up from the earth, will draw all men unto me* (John 12:32). The Son of Adam the Hebrew library names beside the Head of Days is the Formed one whose hour has come — glorified through the cross, drawing the gathered home.',
       sv.verse_id, ev.verse_id, 'extras', 3094
  FROM _s212_j0912_lookup sv, _s212_j0912_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 12 AND ev.verse_number = 28
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 11:11 — *he strake of the gall on his fathers'' eyes, saying, Be of good hope, my father.* The eyes-opened-by-the-appointed-means architecture; John 9:7''s *go, wash in the pool of Siloam ... and came seeing* walks the same.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 11:13 — *the whiteness pilled away from the corners of his eyes.* The whiteness-peeled-away moment of restored sight; John 9:25''s *whereas I was blind, now I see* names the same restored sight, defended against the court.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 11:14 — *Blessed art you, O Yahuah (God), and blessed is your name for ever.* The blessing-of-the-name at the restored sight; John 9:38''s *Lord, I believe. And he worshipped him* walks the same — worship of the Son of Elohim (God) who opened the eyes.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 11:15 — *you have scourged, and have taken pity on me ... And his son went in rejoicing.* The scourged-then-pitied arc ending in rejoicing; John 9''s man born blind, that the works of Elohim (God) be made manifest, ends in worship.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-9-the-eyes-opened-and-the-blessing-of-the-name-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 9 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 11 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 13:40 — *those are the ten tribes, which were carried away prisoners ... and he carried them over the waters.* The scattered house named tribe-by-tribe; John 10:16''s *other sheep ... not of this fold* are the carried-away ten tribes, not the nations grafted in.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 40
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Esdras 13:47 — *the Highest shall stay the springs of the stream again, that they may go through.* The road home for the scattered ten tribes; John 10:16''s *them also I must bring ... one fold, and one shepherd* names the Shepherd who brings them home.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 47
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Esdras 13:33 — *when all the people hear his voice ... every man shall in their own land leave the battle.* The hearing-of-the-voice that turns the people; John 10:27''s *my sheep hear my voice ... and they follow me* walks the same — hearing discloses the sheep.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-10-other-sheep-and-the-ten-tribes-gathered-in-2-esdras-13'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 10 AND sv.verse_number = 27
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 13 AND tv.verse_number = 33
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence.* The resurrection-at-the-last-day Martha confesses (John 11:24); the raising of Lazaros is its firstfruit-sign.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 7 AND tv.verse_number = 32
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 51:1 — *the earth also give back that which has been entrusted to it, And Sheol also shall give back ... For in those days the Elect One shall arise.* The earth-and-Sheol-give-back-their-dead at the Elect One''s arising; John 11:25''s *I am the resurrection, and the life* names the Formed one as that resurrection.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 51:2 — *he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* The Elect One choosing the righteous at the resurrection; John 11:25-26''s *though he were dead, yet shall he live* walks the same choosing.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-the-resurrection-and-the-earth-giving-back-its-dead-in-2-esdras-and-1-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 25
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 51 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Baruch 4:37 — *your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One.* The scattered children gathered home; John 11:52''s *gather together in one the children of Elohim (God) that were scattered abroad* walks the same.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 4 AND tv.verse_number = 37
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Baruch 5:5 — *behold your children gathered from the west to the east by the word of the Holy One.* The gathering-of-the-children doubled with Baruch 4:37; John 11:52''s scattered children gathered into one walks the same Hebrew library homecoming.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:9 — *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory.* The leading-home of Yashar''el (Israel); John 11:52''s gathering of the scattered children into one is the gospel-form of the same homecoming.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'baruch-with-the-letter-of-jeremiah' AND tv.chapter_number = 5 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The wisdom-stream''s explicit gathering-prayer; John 11:52''s gathering Caiaphas prophesies is the gathering of all the tribes of Jacob the Hebrew library prays for.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-11-gather-together-the-scattered-children-from-east-to-west-in-baruch-and-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 11 AND sv.verse_number = 52
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 62:7 — *This is the Son of Adam who is born unto righteousness ... the righteousness of the Head of Days forsakes him not.* The named Son of Adam declared by Yahuah (God) of Spirits; John 12:23''s *the hour is come, that the Son of Adam should be glorified* names the hour that Son of Adam is glorified.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 62:2 — *then shall they all ... bless and glorify and extol and laud the name of Yahuah (God) of Spirits.* The glorifying-of-the-name at the Son of Adam''s enthronement; John 12:28''s *Father, glorify thy name ... I have both glorified it, and will glorify it again* walks the same — the hour of the Son of Adam is the hour the name is glorified.'
  FROM cross_reference_threads t, cross_references x, _s212_j0912_lookup sv, _s212_j0912_lookup tv
 WHERE t.slug = 'john-12-the-son-of-adam-glorified-and-enthroned-in-1-enoch-parables'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 12 AND sv.verse_number = 23
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 62 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- CHAPTERS 9-12 COMPLETE

-- ----- fragment: minion_john_13_17.sql -----
-- =====================================================================
-- S212 minion — John 13-17 extras-library cross-references
-- =====================================================================
-- Range:  John 13, 14, 15, 16, 17 (footwashing / the new commandment;
--         "in my Father's house many mansions" / the Way; the Comforter
--         / Spirit of truth / Ruach HaKodesh; the true vine and the
--         branches; the world's hatred without a cause; the high-priestly
--         prayer / "that they all may be one" / keeping them from the evil
--         one).
-- Tag:    j1317  (temp view _s212_j1317_lookup)
-- Band:   sort_order 3120-3149
-- Output: scratch_xref/minion_john_13_17.sql
--
-- John has ZERO outside-canon cross-references in its prior migrations
-- (session181 canon threads; session194 canon threads for John 2, 7, 9,
-- 16). This fragment adds the framework-bearing EXTRAS-tier connections
-- the chapters warrant, complementing — not duplicating — the existing
-- canon threads. Session194's John 16 canon threads (the-comforter...,
-- your-sorrow-turned-into-joy..., i-have-overcome-the-world...) and
-- session181's John 17:9 canon thread (kosmos-and-the-prayer-not-for-the-
-- world) all target canon; the four threads below are all extras-tier and
-- carry distinct slugs, so they ADD rather than overwrite.
--
-- New extras threads (4):
--   1. john-13-15-the-new-commandment-love-one-another-in-the-testaments-of-gad-and-benjamin   (3120)
--        targets: pseudepigrapha (Testaments of the XII Patriarchs — Gad, Benjamin)
--   2. john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras            (3121)
--        targets: apocrypha (Ecclesiasticus / Sirach; 2 Esdras)
--   3. john-15-the-worlds-hatred-and-the-hatred-of-the-devil-in-the-testament-of-gad           (3122)
--        targets: pseudepigrapha (Testaments of the XII Patriarchs — Gad)
--   4. john-14-16-the-spirit-of-truth-who-testifies-and-reproves-in-the-testament-of-judah     (3123)
--        targets: pseudepigrapha (Testaments of the XII Patriarchs — Judah)
--
-- Chapters with no extras add:
--   * John 14 — the framework-bearing material (the Way / "no man cometh
--     unto the Father but by me"; the Comforter named the Ruach HaKodesh)
--     is carried at the canon level and at the Spirit-of-truth extras
--     thread (#4, anchored 14:16). No further standalone extras thread is
--     warranted from the seeded editions at the rigour the migration
--     requires; the candidate parallels are canon-anchored.
--   * John 17 — the high-priestly prayer (manifesting the Name, "that they
--     all may be one," keeping them from the evil one) is carried by the
--     canon threads (kosmos-and-the-prayer-not-for-the-world, session181)
--     and the Name / oneness material is canon-anchored (Yahuah's Name on
--     the gathered, Ezekiel 36; the gathering "in one," John 11:52). No
--     framework-bearing extras connection from the seeded editions clears
--     the bar without straining the parsed-edition text (the cleanest
--     witness, the 2 Baruch vine vision, does not parse cleanly enough in
--     the available source to quote in full per the come-and-see rule).
--
-- 11 new cross_references rows, all tier_required='extras'
--   (Thread 1: 3, Thread 2: 4, Thread 3: 2, Thread 4: 2).
-- 11 new thread_member rows.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view — every scripture-level extras edition seeded
-- for V1, plus canon.
CREATE TEMP VIEW _s212_j1317_lookup AS
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
  -- Thread 1: the new commandment / love one another (Testaments of Gad and Benjamin)
  ('canon', 'john', 13, 34, 'pseudepigrapha', 'testaments-xii', 62, 2,
   E'*love one another in deed, and in word, and in the inclination of the soul.* The Testament of Gad (DB ch 62 v.2) carries the love-one-another command in the patriarch''s own testimony to his sons — and Gad names it out of his own repentance for the hatred he bore against Joseph his brother. Yahusha''s (Jesus'') *a new commandment I give unto you, That ye love one another* (John 13:34) is *new* not because the Hebrew library never named brotherly love, but because he loves *as I have loved you* — the patriarch''s heart-command brought to its measure in the Formed one''s own laying-down of his life. The wisdom of the fathers already pressed the command on the twelve sons of Yashar''el (Israel); the gospel binds it to the cross.'),
  ('canon', 'john', 15, 12, 'pseudepigrapha', 'testaments-xii', 63, 7,
   E'*Put away, therefore, jealousy from your souls, and love one another with uprightness of heart.* The Testament of Gad (DB ch 63 v.7) closes the patriarch''s exhortation with the same love-one-another command, named with *uprightness of heart* — the inward singleness from which the love must come. John 15:12''s *This is my commandment, That ye love one another, as I have loved you* walks the same architecture: the love is not sentiment but the uprightness of heart the fathers commanded, now measured by the love of the One who calls the disciples friends and lays down his life for them.'),
  ('canon', 'john', 15, 13, 'pseudepigrapha', 'testaments-xii', 89, 5,
   E'*And him that hath the grace of a good spirit he loveth as his own soul.* The Testament of Benjamin (DB ch 89 v.5) names the love-thy-brother-as-thine-own-soul measure in the patriarch''s good-mind teaching — the good man *loveth the righteous as his own soul,* shielding, showing mercy, overcoming evil with good. John 15:13''s *Greater love hath no man than this, that a man lay down his life for his friends* lands the same architecture at its furthest reach: the love-as-thine-own-soul of the fathers'' testimony brought to the laying-down of the soul itself. The Hebrew library named the measure; the gospel walks it to the cross.'),

  -- Thread 2: the true vine / Yashar'el as the chosen vine (Sirach and 2 Esdras)
  ('canon', 'john', 15, 1, 'apocrypha', '2-esdras', 5, 23,
   E'*O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* 2 Esdras 5:23 names the one-chosen-vine architecture in Ezra''s own prayer — out of every tree of the earth, Yahuah (God) chose one vine, and that vine is the chosen people Yashar''el (Israel). Yahusha''s (Jesus'') *I am the true vine, and my Father is the husbandman* (John 15:1) stands on this Hebrew library figure: Yashar''el (Israel) was the vine Yahuah (God) chose and tended, and the Formed one declares himself the *true* vine in whom the chosen vine is gathered and made to bear. The figure is not invented at the supper; it is the canon''s own vine-of-Yahuah figure brought to its centre.'),
  ('canon', 'john', 15, 1, 'apocrypha', 'ecclesiasticus', 24, 17,
   E'*As the vine brought I forth pleasant savour, and my flowers are the fruit of honour and riches.* Ecclesiasticus (Sirach) 24:17 names Wisdom-as-the-vine in the great Wisdom-hymn — the same Wisdom who, commanded by the Creator, took root in Jacob and Yashar''el (Israel): *Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel)* (24:8). John 15:1''s *I am the true vine* gathers this figure: the Wisdom-vine planted in Jacob, which the wisdom-stream then names outright as the Torah (24:23), is the vine the Formed one declares himself to be — the Word made flesh, the true vine in whom the branches abide and bear.'),
  ('canon', 'john', 15, 5, 'apocrypha', 'ecclesiasticus', 24, 23,
   E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* Ecclesiasticus (Sirach) 24:23 names the Wisdom-vine of the hymn as the Torah itself — the book of the covenant, the law Moses commanded as the inheritance of Jacob. John 15:5''s *I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing* walks the same architecture: to abide in the true vine is to abide in the Word the Father spoke, the covenant-Torah the wisdom-stream named as the vine — for the branch bears nothing severed from the vine, as the keeper bears nothing severed from the Word.'),
  ('canon', 'john', 15, 8, 'apocrypha', '2-esdras', 5, 27,
   E'*And among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* 2 Esdras 5:27 names the one-chosen-people who were given the approved law — the vine of v.23 read as the covenant people themselves, set apart and given the Torah. John 15:8''s *Herein is my Father glorified, that ye bear much fruit; so shall ye be my disciples* walks the same architecture: the chosen vine is chosen to bear, and the fruit it bears glorifies the husbandman. The Hebrew library names the chosen people given the law to bear fruit; the gospel names the bearing of fruit as the glory of the Father and the mark of the disciple abiding in the true vine.'),

  -- Thread 3: the world's hatred / the hatred of the devil (Testament of Gad)
  ('canon', 'john', 15, 18, 'pseudepigrapha', 'testaments-xii', 61, 1,
   E'*Hatred, therefore, is evil, for it constantly mateth with lying, speaking against the truth; and it maketh small things to be great, and causeth the light to be darkness, and calleth the sweet bitter, and teacheth slander, and kindleth wrath, and stirreth up war, and violence and all covetousness; it filleth the heart with evils and devilish poison.* The Testament of Gad (DB ch 61 v.1) names hatred as the inversion-engine that speaks against the truth, calls light darkness, and fills the heart with devilish poison. John 15:18''s *If the world hate you, ye know that it hated me before it hated you* names the same hatred turned against the Formed one and his own: the world''s hatred is not reasoned offence but the devil''s poison the patriarch warned against, the hatred that calls the Light of the world darkness.'),
  ('canon', 'john', 15, 23, 'pseudepigrapha', 'testaments-xii', 61, 2,
   E'*These things, therefore, I say to you from experience, my children, that ye may drive forth hatred, which is of the devil, and cleave to the love of Elohim (God).* The Testament of Gad (DB ch 61 v.2) names hatred outright as *of the devil* — the very poison Gad repented of, set against the love of Elohim (God) the new commandment presses. John 15:23''s *He that hateth me hateth my Father also* lands the same architecture at its root: the hatred of the world for the Formed one is hatred of the Father who sent him, because hatred is of the devil and cannot abide the Light. The patriarch traced the hatred to its source; the gospel names the One it strikes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j1317_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j1317_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 4's cross_reference rows (separate VALUES block so the Spirit-of-
-- truth member can reuse the same target verse at two source anchors).
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES
  ('canon', 'john', 16, 8, 'pseudepigrapha', 'testaments-xii', 35, 5,
   E'*And the spirit of truth testifieth all things, and accuseth all; and the sinner is burnt up by his own heart, and cannot raise his face to the judge.* The Testament of Judah (DB ch 35 v.5) names *the spirit of truth* by the very title Yahusha (Jesus) uses — the Spirit who testifies all things and accuses, before whom the sinner is burnt up by his own heart. John 16:8''s *And when he is come, he will reprove the world of sin, and of righteousness, and of judgment* walks the same architecture: the Comforter, the Spirit of truth, does the reproving / accusing work the Hebrew library already named the spirit of truth doing. The convicting work is not a new office; it is the spirit of truth the patriarch named, now sent from the Father by the Son.'),
  ('canon', 'john', 14, 17, 'pseudepigrapha', 'testaments-xii', 35, 4,
   E'*And there is no time at which the works of men can be hid; for on the heart itself have they been written down before the Lord.* The Testament of Judah (DB ch 35 v.4) names the spirit-of-truth''s inward work — the works of men written on the heart itself, hidden from no time before Yahuah (the Lord). John 14:17''s *Even the Spirit of truth; whom the world cannot receive, because it seeth him not, neither knoweth him: but ye know him; for he dwelleth with you, and shall be in you* walks the same architecture: the Spirit of truth is the inward witness, dwelling within and writing on the heart, whom the world cannot receive because it knows him not. The wisdom of the fathers named the spirit of truth''s inward writing; the gospel names the indwelling the disciples receive.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j1317_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j1317_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 4 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-13-15-the-new-commandment-love-one-another-in-the-testaments-of-gad-and-benjamin',
       E'The new commandment — love one another — in the Testaments of Gad and Benjamin',
       E'John 13:34-35''s *a new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another* — pressed again at John 15:12-13 and 15:17 — reads against the love-one-another exhortations the patriarchs gave their sons in the Hebrew library. The Testament of Gad (DB ch 62 v.2) commands it out of repentance for hatred borne against a brother: *love one another in deed, and in word, and in the inclination of the soul.* The Testament of Gad (DB ch 63 v.7) closes with the same: *Put away, therefore, jealousy from your souls, and love one another with uprightness of heart.* The Testament of Benjamin (DB ch 89 v.5) names the measure — love-as-thine-own-soul: *And him that hath the grace of a good spirit he loveth as his own soul.* The command to love the brother was already pressed on the twelve sons of Yashar''el (Israel); what makes the gospel''s commandment *new* is the measure — *as I have loved you* — the love of the Formed one carried to the laying-down of his life (John 15:13). The Hebrew library named the command and the measure of the soul; the gospel binds both to the cross.',
       sv.verse_id, ev.verse_id, 'extras', 3120
  FROM _s212_j1317_lookup sv, _s212_j1317_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 13 AND sv.verse_number = 34
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 15 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras',
       E'The true vine and Yashar''el as the chosen vine in Sirach and 2 Esdras',
       E'John 15:1-8''s *I am the true vine, and my Father is the husbandman ... I am the vine, ye are the branches* stands on the Hebrew library''s own figure of Yashar''el (Israel) as the vine Yahuah (God) chose and tended. 2 Esdras 5:23 names it in Ezra''s prayer: *O Yahuah (God) that bearest rule, of every wood of the earth, and of all the trees thereof, you have chosen you one only vine* — and 5:27 reads the vine as the chosen people given the approved law: *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* Ecclesiasticus (Sirach) 24 names Wisdom-as-the-vine, commanded by the Creator to take root in Jacob and Yashar''el (Israel): *As the vine brought I forth pleasant savour, and my flowers are the fruit of honour and riches* (24:17) — and the hymn then names the Wisdom-vine outright as the Torah: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (24:23). The Formed one''s *I am the TRUE vine* gathers both streams: the chosen vine that is the chosen people, and the Wisdom-vine that is the Word the Father spoke. To abide in him is to abide in the Word; the branch severed from the vine bears nothing, as the keeper severed from the Word bears nothing. The fruit borne glorifies the husbandman (15:8) — the chosen vine bearing the fruit it was chosen to bear.',
       sv.verse_id, ev.verse_id, 'extras', 3121
  FROM _s212_j1317_lookup sv, _s212_j1317_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 15 AND ev.verse_number = 8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-15-the-worlds-hatred-and-the-hatred-of-the-devil-in-the-testament-of-gad',
       E'The world''s hatred and the hatred of the devil in the Testament of Gad',
       E'John 15:18-25''s *If the world hate you, ye know that it hated me before it hated you ... He that hateth me hateth my Father also ... They hated me without a cause* reads against the Testament of Gad''s diagnosis of hatred as the devil''s poison. The Testament of Gad (DB ch 61 v.1) names hatred as the inversion-engine that *speaketh against the truth ... causeth the light to be darkness, and calleth the sweet bitter ... and filleth the heart with evils and devilish poison.* The Testament of Gad (DB ch 61 v.2) traces it to its source: *drive forth hatred, which is of the devil, and cleave to the love of Elohim (God).* The patriarch had repented of the very hatred he warns against — the hatred he bore against Joseph his brother. The world''s hatred for the Formed one and his own is not reasoned offence; it is the devil''s poison the patriarch named, the hatred that calls the Light of the world darkness and strikes the Father through the Son. The hatred *without a cause* (15:25, citing the Tanakh) is exactly the causeless hatred Gad traced to the devil — and the love-one-another command of the new-commandment thread is the cleaving-to-the-love-of-Elohim the patriarch set against it.',
       sv.verse_id, ev.verse_id, 'extras', 3122
  FROM _s212_j1317_lookup sv, _s212_j1317_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 18
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 15 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-14-16-the-spirit-of-truth-who-testifies-and-reproves-in-the-testament-of-judah',
       E'The Spirit of truth who testifies and reproves in the Testament of Judah',
       E'John names the Comforter *the Spirit of truth* four times across these chapters (14:17, 15:26, 16:13) and names his reproving work at 16:8 — *he will reprove the world of sin, and of righteousness, and of judgment.* The Testament of Judah (DB ch 35 v.5) names the same title doing the same work in the Hebrew library: *And the spirit of truth testifieth all things, and accuseth all; and the sinner is burnt up by his own heart, and cannot raise his face to the judge.* The Testament of Judah (DB ch 35 v.4) names the inward register — *on the heart itself have they been written down before the Lord* — the spirit of truth''s writing on the heart that no time can hide, the same inward indwelling John 14:17 names: *he dwelleth with you, and shall be in you.* The convicting, testifying, heart-searching work of the Spirit of truth is not a new office invented at the supper; it is the spirit of truth the patriarch named, now sent from the Father by the Son to dwell within the gathered. (The canon witnesses to this thread — Ezekiel 36:27''s Spirit who causes the walking in the statutes, Isaiah 59:21''s Spirit-and-words bound forever — are carried in the session194 canon Comforter thread; this thread adds the Hebrew library''s own *spirit of truth* by name.)',
       sv.verse_id, ev.verse_id, 'extras', 3123
  FROM _s212_j1317_lookup sv, _s212_j1317_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 14 AND sv.verse_number = 16
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 16 AND ev.verse_number = 13
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: the new commandment / love one another
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Testament of Gad (DB ch 62 v.2) — *love one another in deed, and in word, and in the inclination of the soul.* The patriarch commands brotherly love out of his own repentance for hatred; John 13:34''s *a new commandment ... that ye love one another* presses the same, made new by the measure *as I have loved you.*'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-13-15-the-new-commandment-love-one-another-in-the-testaments-of-gad-and-benjamin'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 13 AND sv.verse_number = 34
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 62 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Testament of Gad (DB ch 63 v.7) — *Put away, therefore, jealousy from your souls, and love one another with uprightness of heart.* The same love-one-another command, named with the uprightness of heart from which it must come; John 15:12''s *This is my commandment, That ye love one another, as I have loved you* walks the same at the measure of the cross.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-13-15-the-new-commandment-love-one-another-in-the-testaments-of-gad-and-benjamin'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 12
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 63 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Testament of Benjamin (DB ch 89 v.5) — *And him that hath the grace of a good spirit he loveth as his own soul.* The love-as-thine-own-soul measure in the good-mind teaching; John 15:13''s *Greater love hath no man than this, that a man lay down his life for his friends* lands the same measure at the laying-down of the soul itself.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-13-15-the-new-commandment-love-one-another-in-the-testaments-of-gad-and-benjamin'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 13
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 89 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: the true vine / Yashar'el as the chosen vine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:23 — *of every wood of the earth, and of all the trees thereof, you have chosen you one only vine.* Ezra''s prayer names the one chosen vine; John 15:1''s *I am the true vine* gathers the Hebrew library''s figure of Yashar''el (Israel) as the vine Yahuah (God) chose and tended.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus (Sirach) 24:17 — *As the vine brought I forth pleasant savour, and my flowers are the fruit of honour and riches.* Wisdom-as-the-vine, commanded to take root in Jacob and Yashar''el (Israel) (24:8); John 15:1''s *true vine* gathers the Wisdom-vine the wisdom-stream then names as the Torah (24:23).'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus (Sirach) 24:23 — *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob.* The Wisdom-vine named outright as the Torah; John 15:5''s *I am the vine, ye are the branches ... without me ye can do nothing* — to abide in the true vine is to abide in the Word the Father spoke.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 24 AND tv.verse_number = 23
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Esdras 5:27 — *among all the multitudes of people you have gotten you one people: and to this people, whom you lovedst, you gavest a law that is approved of all.* The chosen vine read as the chosen people given the approved law; John 15:8''s *Herein is my Father glorified, that ye bear much fruit* — the chosen vine bearing the fruit it was chosen to bear, to the glory of the husbandman.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-true-vine-and-yasharel-as-the-chosen-vine-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 8
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 27
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: the world's hatred / the hatred of the devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Testament of Gad (DB ch 61 v.1) — *Hatred ... mateth with lying, speaking against the truth ... causeth the light to be darkness ... and filleth the heart with evils and devilish poison.* Hatred as the inversion-engine that calls the Light darkness; John 15:18''s *If the world hate you, ye know that it hated me before it hated you* names the same poison turned against the Formed one and his own.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-worlds-hatred-and-the-hatred-of-the-devil-in-the-testament-of-gad'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 18
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 61 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Testament of Gad (DB ch 61 v.2) — *drive forth hatred, which is of the devil, and cleave to the love of Elohim (God).* Hatred traced outright to the devil; John 15:23''s *He that hateth me hateth my Father also* lands the same at its root — the world''s hatred strikes the Father through the Son, because hatred is of the devil and cannot abide the Light.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-15-the-worlds-hatred-and-the-hatred-of-the-devil-in-the-testament-of-gad'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 15 AND sv.verse_number = 23
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 61 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the Spirit of truth who testifies and reproves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Testament of Judah (DB ch 35 v.5) — *And the spirit of truth testifieth all things, and accuseth all; and the sinner is burnt up by his own heart, and cannot raise his face to the judge.* The Hebrew library names *the spirit of truth* doing the reproving / accusing work; John 16:8''s *he will reprove the world of sin, and of righteousness, and of judgment* walks the same office, now sent from the Father by the Son.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-14-16-the-spirit-of-truth-who-testifies-and-reproves-in-the-testament-of-judah'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 16 AND sv.verse_number = 8
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 35 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Testament of Judah (DB ch 35 v.4) — *on the heart itself have they been written down before the Lord.* The spirit-of-truth''s inward writing on the heart, hidden from no time; John 14:17''s *the Spirit of truth ... he dwelleth with you, and shall be in you* names the same inward indwelling the world cannot receive because it knows him not.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1317_lookup sv, _s212_j1317_lookup tv
 WHERE t.slug = 'john-14-16-the-spirit-of-truth-who-testifies-and-reproves-in-the-testament-of-judah'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 14 AND sv.verse_number = 17
   AND tv.edition_slug = 'pseudepigrapha' AND tv.book_slug = 'testaments-xii' AND tv.chapter_number = 35 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_john_18_21.sql -----
-- =====================================================================
-- S212 minion — John 18-21 extras-library cross-references
-- =====================================================================
-- Range : John 18, 19, 20, 21 (arrest / "I am he", trial before Pilate /
--         "my kingdom is not of this world" / "what is truth",
--         crucifixion / "it is finished" / the pierced side /
--         "they shall look on him whom they pierced", resurrection /
--         Mary at the tomb, doubting Thomas / "my Lord and my Elohim",
--         the breakfast / "feed my sheep" / restoration of Peter).
-- Tag        : j1821   (temp view _s212_j1821_lookup)
-- Sort band  : 3150-3179
--
-- John carried ZERO outside-canon cross-references before this fragment;
-- the existing John migrations (S181, S194) are all canon->canon
-- (Tanakh) threads. This fragment promotes the framework-bearing
-- extras-library witness the passion/resurrection/restoration narrative
-- warrants into real edition-aware member rows.
--
-- Two new extras-tier threads:
--   1. john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon
--        (sort 3150) — target edition: apocrypha (Wisdom of Solomon 2)
--   2. john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras
--        (sort 3151) — target editions: apocrypha (Sirach 18, 2 Esdras 5)
--
-- John 20 (resurrection / Mary at the tomb / doubting Thomas) receives
-- NO new extras add: the vindication-of-the-righteous and souls-in-the-
-- Father's-hand registers of Wisdom 3 and 5 are already carried by the
-- synoptic-gospel threads in the corpus (the-resurrection-of-the-
-- righteous-vindicated-and-shining-in-wisdom-of-solomon-3-and-5, souls-
-- of-the-righteous-in-yahuah-hand-in-wisdom-3-and-5, the-gates-of-sheol-
-- and-the-resurrection-substance), and John 20's distinct contribution
-- (the bodily-resurrection eyewitness, Thomas' *my Lord and my Elohim*)
-- does not surface a NEW framework-bearing extras connection at the
-- rigour this migration requires. The vindication of the righteous one
-- is already named within Thread 1 below (Wisdom 2 ends with the
-- shameful death; the vindication is the answer the chapter gives).
--
-- 9 cross_references rows, 9 thread_members rows, all tier_required='extras'.
-- Every member-note passes the 12 Red Lines + 12-point editorial checklist.
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

-- Verse-lookup temp view (uniquely named with the j1821 tag).
CREATE TEMP VIEW _s212_j1821_lookup AS
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
  -- Thread 1: john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon
  ('canon', 'john', 18, 3, 'apocrypha', 'the-wisdom-of-solomon', 2, 12,
   E'*Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* (Wisdom of Solomon 2:12) The Hebrew library''s wisdom-stream names the architecture the arrest at John 18:3 walks: the band of men and officers from the chief priests *lie in wait for the righteous* one because he is *clean contrary* to their doings and *upbraideth* them with their offending the law. The plot against the righteous one is not a New Testament novelty; the wisdom-stream had already named the lying-in-wait of the ungodly against the just man who reproves them.'),
  ('canon', 'john', 19, 7, 'apocrypha', 'the-wisdom-of-solomon', 2, 13,
   E'*He professeth to have the knowledge of Yahuah (God): and he calls himself the child of Yahuah (God).* (Wisdom of Solomon 2:13) The charge the Yahudim (Jews) bring at John 19:7 — *we have a law, and by our law he ought to die, because he made himself the Son of Elohim (God)* — is the exact accusation the wisdom-stream put in the mouth of the ungodly against the righteous one: that *he calls himself the child of Yahuah (God).* The self-designation that the ungodly treat as the capital offence in Wisdom 2 is the self-designation the chief priests treat as the capital offence at the trial.'),
  ('canon', 'john', 18, 38, 'apocrypha', 'the-wisdom-of-solomon', 2, 16,
   E'*We are esteemed of him as counterfeits: he abstaineth from our ways as from filthiness: he pronounceth the end of the just to be blessed, and makes his boast that Yahuah (God) is his father.* (Wisdom of Solomon 2:16) The righteous one of the wisdom-stream is grievous to the ungodly precisely because his life is of *another fashion* and he *makes his boast that Yahuah (God) is his father.* John 18:38''s Pilate finds *no fault at all* in him, yet the chief priests press for his death on exactly the ground the wisdom-stream named — that he claims the Father as his own. The fault the ungodly find is not a crime; it is the righteousness that reproves them.'),
  ('canon', 'john', 19, 5, 'apocrypha', 'the-wisdom-of-solomon', 2, 19,
   E'*Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* (Wisdom of Solomon 2:19) The wisdom-stream names the scourging-and-mockery program the ungodly devise for the righteous one: *examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* John 19:1-5 walks the same — Pilate scourges him, the soldiers crown him with thorns and smite him, and he is brought forth meek and patient under the *despitefulness and torture* the wisdom-stream had already named as the test the ungodly impose on the just.'),
  ('canon', 'john', 19, 6, 'apocrypha', 'the-wisdom-of-solomon', 2, 20,
   E'*Let us condemn him with a shameful death: for by his own saying he shall be respected.* (Wisdom of Solomon 2:20) This is the wisdom-stream''s framework-bearing sentence for the crucifixion: the ungodly resolve to *condemn him with a shameful death.* John 19:6''s *crucify him, crucify him* is that resolve enacted — the shameful death the wisdom-stream named, demanded by the chief priests against the righteous one who called Yahuah (God) his father. The crucifixion is the shameful death the wisdom-stream foretold the ungodly would impose on the just man.'),
  ('canon', 'john', 19, 30, 'apocrypha', 'the-wisdom-of-solomon', 2, 18,
   E'*For if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies.* (Wisdom of Solomon 2:18) The wisdom-stream put the mocking test in the mouth of the ungodly: if the just man is truly the son of Yahuah (God), let his Father deliver him from his enemies'' hand. John 19:30''s *it is finished* answers the test not by escape but by completion — the just man who is the Son does not come down from the cross; he finishes the work, and the vindication the ungodly demanded as proof comes in the resurrection the wisdom-stream itself names three verses on, *the souls of the righteous are in the hand of Yahuah (God).*')
  ,
  -- Thread 2: john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras
  ('canon', 'john', 21, 16, 'apocrypha', 'ecclesiasticus', 18, 13,
   E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* (Sirach / Ecclesiasticus 18:13) The wisdom-stream names the shepherd-architecture John 21:16''s *feed my sheep* commission walks: Yahuah (God) *reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The risen Messiah hands the shepherd-charge to Peter — to nurture and bring again the flock the way the wisdom-stream names the Father himself shepherding. The reproof-and-restoration the wisdom-stream names of the Father is the very pattern enacted on Peter (reproved by the threefold question, restored by the threefold charge) and then committed to him for the sheep.'),
  ('canon', 'john', 21, 15, 'apocrypha', '2-esdras', 5, 18,
   E'*Up then, and eat bread, and forsake us not, as the shepherd that leaveth his flock in the hands of cruel wolves.* (2 Esdras 5:18) The wisdom-stream names the failure the restoration of Peter answers: the shepherd who *leaveth his flock in the hands of cruel wolves* is the shepherd who forsakes. Peter, who forsook and denied his Master three times, is here charged three times — *feed my lambs ... feed my sheep ... feed my sheep* — not to be the shepherd who leaves the flock to the wolves, but the one who eats the bread the risen Messiah set before him and does not forsake. The negative image of the abandoning shepherd is the exact ground the threefold recommission reverses.'),
  ('canon', 'john', 21, 17, 'apocrypha', 'ecclesiasticus', 18, 14,
   E'*He has mercy on them that receive discipline, and that diligently seek after his judgments.* (Sirach / Ecclesiasticus 18:14) The wisdom-stream names the mercy-on-the-disciplined register the restoration of Peter walks: Yahuah (God) *has mercy on them that receive discipline.* Peter, grieved at the third asking, receives the discipline of the threefold question that answers his threefold denial, and the mercy lands not in condemnation but in the threefold charge to *feed my sheep.* The wisdom-stream had already named the architecture: the mercy of the Father falls on the one who receives the discipline and seeks his judgments.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s212_j1821_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s212_j1821_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 2 new extras-tier threads.
-- ---------------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon',
       'The righteous son condemned with a shameful death in Wisdom of Solomon',
       E'The trial-and-crucifixion narrative of John 18-19 walks an architecture the Hebrew library''s wisdom-stream named centuries before — the ungodly plotting the death of the righteous one who calls Yahuah (God) his father. Wisdom of Solomon 2 lays out the whole program in the mouth of the ungodly. They *lie in wait for the righteous; because he is not for our turn ... he upbraideth us with our offending the law* (Wisdom 2:12) — the band that arrests him at John 18:3. They name his offence: *he professeth to have the knowledge of Yahuah (God): and he calls himself the child of Yahuah (God)* (Wisdom 2:13) — the exact charge of John 19:7, *he made himself the Son of Elohim (God).* They are grievous-to because *he makes his boast that Yahuah (God) is his father* (Wisdom 2:16) — the claim Pilate finds *no fault* in (John 18:38) but the chief priests press to death. They resolve to *examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (Wisdom 2:19) — the scourging and crowning of John 19:1-5. They resolve to *condemn him with a shameful death* (Wisdom 2:20) — the *crucify him* of John 19:6. And they mock the test that the cross answers: *if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies* (Wisdom 2:18) — the test John 19:30''s *it is finished* answers not by escape but by completion, with the vindication coming in the resurrection the same wisdom-stream names three verses on (*the souls of the righteous are in the hand of Yahuah (God)*). The wisdom-stream had already named the plot, the charge, the torture, the shameful death, and the vindication; the gospel walks the same architecture on the body of the Formed one.',
       sv.verse_id, ev.verse_id, 'extras', 3150
  FROM _s212_j1821_lookup sv, _s212_j1821_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 3
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 19 AND ev.verse_number = 30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras',
       'The shepherd who brings again the flock in Sirach and 2 Esdras',
       E'John 21:15-17''s threefold *feed my lambs ... feed my sheep ... feed my sheep* — the restoration of Peter, who had denied his Master three times, recommissioned three times as shepherd of the flock — walks a shepherd-architecture the Hebrew library''s wisdom-stream already carries. Sirach (Ecclesiasticus) 18:13 names the Father''s own shepherding: *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The reproof-and-bring-again pattern named of the Father is the exact pattern enacted on Peter — reproved by the threefold question that answers his threefold denial, brought again by the threefold charge — and then committed to him for the sheep. Sirach 18:14 names the mercy-on-the-disciplined register: *he has mercy on them that receive discipline* — the mercy that lands on Peter grieved at the third asking not as condemnation but as the charge to feed the sheep. And 2 Esdras 5:18 names the failure the restoration reverses: *forsake us not, as the shepherd that leaveth his flock in the hands of cruel wolves* — the abandoning shepherd Peter had been when he denied, and the abandoning shepherd the recommission charges him never again to be. The wisdom-stream names the Father who reproves and brings again his flock, the mercy on the one who receives discipline, and the shepherd who must not forsake the flock to the wolves; the gospel hands that whole shepherd-charge to the restored Peter for the lost sheep.',
       sv.verse_id, ev.verse_id, 'extras', 3151
  FROM _s212_j1821_lookup sv, _s212_j1821_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'john' AND ev.chapter_number = 21 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 2:12 — *therefore let us lie in wait for the righteous; because he is not for our turn ... he upbraideth us with our offending the law.* The lying-in-wait of the ungodly against the just man who reproves them; John 18:3''s band of men and officers walks the same arrest of the righteous one.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 3
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 2:13 — *he professeth to have the knowledge of Yahuah (God): and he calls himself the child of Yahuah (God).* The exact charge of John 19:7 — *he made himself the Son of Elohim (God)* — the self-designation the ungodly treat as the capital offence.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 2:16 — *he makes his boast that Yahuah (God) is his father.* The righteous one is grievous to the ungodly because he claims the Father as his own; John 18:38''s Pilate finds *no fault at all,* yet the chief priests press for death on exactly this ground.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 18 AND sv.verse_number = 38
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:19 — *let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience.* The scourging-and-mockery program the ungodly devise for the righteous one; John 19:1-5 walks the same despitefulness and torture, the meek one brought forth.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 19
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 2:20 — *let us condemn him with a shameful death: for by his own saying he shall be respected.* The framework-bearing sentence for the crucifixion; John 19:6''s *crucify him, crucify him* enacts the shameful death the wisdom-stream named the ungodly would impose on the just.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 2:18 — *if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies.* The mocking test the cross answers; John 19:30''s *it is finished* answers not by escape but by completion, the vindication coming in the resurrection the wisdom-stream names three verses on.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-18-the-righteous-son-condemned-with-a-shameful-death-in-wisdom-of-solomon'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 19 AND sv.verse_number = 30
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:18 — *forsake us not, as the shepherd that leaveth his flock in the hands of cruel wolves.* The negative image the restoration reverses; Peter, who forsook and denied three times, is charged three times at John 21:15 onward not to be the shepherd who leaves the flock to the wolves.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 15
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = '2-esdras' AND tv.chapter_number = 5 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach (Ecclesiasticus) 18:13 — *the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock.* The Father''s own shepherding-architecture; John 21:16''s *feed my sheep* hands that reprove-and-bring-again charge to the restored Peter for the flock.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 18 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach (Ecclesiasticus) 18:14 — *he has mercy on them that receive discipline, and that diligently seek after his judgments.* The mercy-on-the-disciplined register; Peter, grieved at the third asking, receives the discipline of the threefold question and the mercy lands as the charge to feed the sheep.'
  FROM cross_reference_threads t, cross_references x,
       _s212_j1821_lookup sv, _s212_j1821_lookup tv
 WHERE t.slug = 'john-21-the-shepherd-who-brings-again-the-flock-in-sirach-and-2-esdras'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'john' AND sv.chapter_number = 21 AND sv.verse_number = 17
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 18 AND tv.verse_number = 14
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 212 — John extras-library cross-references complete.'
