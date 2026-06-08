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
