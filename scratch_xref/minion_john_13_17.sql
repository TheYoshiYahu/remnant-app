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
