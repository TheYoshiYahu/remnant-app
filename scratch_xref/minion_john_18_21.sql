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
