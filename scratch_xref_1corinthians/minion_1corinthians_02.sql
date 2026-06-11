-- ----- fragment: minion_1corinthians_02.sql (S228 1 Corinthians 2) -----
-- =====================================================================
-- S228 minion — 1 CORINTHIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 CORINTHIANS 2 (16 verses) — the hidden wisdom and the spiritual man.
-- Tag: co02 (temp view _s228_co02_lookup).
-- Sort band: floor 6625, step 3 (6625, 6628, 6631 used; under 6650).
-- Source is ALWAYS the canon 1 Corinthians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul, having declared the cross the power and wisdom of Elohim (God), now unfolds
-- the WISDOM hidden from the rulers of this age. *We speak the wisdom of Elohim (God) in a mystery,
-- even the hidden wisdom, which Elohim (God) ordained before the world* (2:7) — the wisdom *which
-- none of the princes of this world knew: for had they known it, they would not have crucified Yahuah
-- (Lord) of glory* (2:8). It is *revealed... by his Spirit: for the Spirit searcheth all things, yea,
-- the deep things of Elohim (God)* (2:10). The *natural man* who *receiveth not the things of the
-- Spirit* against *he that is spiritual* is NOT body/soul dualism (no platonic split) — it is the man
-- without the Spirit who cannot DISCERN the revealed wisdom versus the man given the Spirit who can.
-- Two explicit Tanakh citations anchor the chapter: 2:9 cites Isaiah 64:4 (*eye hath not seen... the
-- things which Elohim (God) hath prepared for them that love him*) and 2:16 cites Isaiah 40:13 (*who
-- hath known the mind of Yahuah (Lord)*) — and Paul caps it: *But we have the mind of Messiah
-- (Christ).* NT-Lord rule: 2:16's *mind of Yahuah (Lord)* is the OT YHWH citation (pull renders
-- Yahuah (Lord)); preserve exactly. The richest extras witness is Wisdom of Solomon — the ungodly who
-- *knew not the mysteries of Yahuah (God)* (Wisdom 2:21-22), the souls of the righteous whose *hope is
-- full of immortality* (Wisdom 3:4), and the wisdom *sent from above* that alone discloses the counsel
-- of Elohim (God) (Wisdom 9:13-17); Sirach 1 on wisdom created before all things and *given to them
-- that love him.*
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5   not with excellency of speech, but in demonstration of the Spirit and power
--           Tanakh: none warranted (the cross-as-wisdom root carried in ch1's apparatus; v.1-5 is
--                   Paul's manner, not a citation)
--           Extras: none warranted   NT: none warranted
--   v.6-8   the hidden wisdom ordained before the world, which the princes of this world knew not
--           Tanakh: none warranted (Isaiah 64:4 is the v.9 citation, kept in its own thread)
--           Extras: Wisdom 9:13-17 (who hath known the counsel of Yahuah (God)... send thy Ruach
--                   HaKodesh from above), Sirach 1:1-10 (wisdom created before all things, given to
--                   them that love him), Wisdom 2:21-22 (the ungodly knew not the mysteries of Yahuah
--                   (God), wickedness blinded them — the princes who crucified)
--           NT: none warranted (no Tanakh quotation here; the cross is carried in prose)
--   v.9     Eye hath not seen... the things which Elohim (God) hath prepared for them that love him
--           Tanakh: Isaiah 64:4 (since the beginning of the world... neither hath the eye seen, O
--                   Elohim (God), beside thee, what he hath prepared for him that waiteth for him) [CITATION]
--           Extras: Wisdom 3:1-9 (the souls of the righteous... their hope is full of immortality —
--                   the reward the ungodly did not discern)
--           NT: none warranted
--   v.10-13 the Spirit searcheth the deep things of Elohim (God); spiritual things compared
--           Tanakh: none warranted (the searching Spirit is carried in the v.16 mind-of-the-Lord thread)
--           Extras: Wisdom 9:13-17 woven (the counsel of Yahuah (God) known only by the Spirit sent
--                   from above) — folded into the hidden-wisdom thread
--           NT: none warranted
--   v.14-15 the natural man vs the spiritual man — discernment by the Spirit
--           Tanakh: none warranted   Extras: none warranted (no body/soul-dualism root to honor;
--                   forcing one would invite the platonic misreading the frame forbids)
--           NT: none warranted
--   v.16    who hath known the mind of Yahuah (Lord)... But we have the mind of Messiah (Christ)
--           Tanakh: Isaiah 40:13 (Who hath directed the Spirit of Yahuah (LORD), or being his
--                   counsellor hath taught him?) [CITATION]
--           Extras: none warranted (Wisdom 9 carried in the hidden-wisdom thread)
--           NT: Romans 11:34 (For who hath known the mind of Yahuah (Lord)? or who hath been his
--                   counsellor? — Paul citing the same Isaiah 40:13)
--
-- THREADS (slug -> target libraries):
--   6625 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9   (Extras)
--   6628 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64  (Tanakh + Extras)
--   6631 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40  (Tanakh + NT)
-- =====================================================================

CREATE TEMP VIEW _s228_co02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9
  ('canon', '1-corinthians', 2, 7, 'apocrypha', 'the-wisdom-of-solomon', 9, 13, 'extras', E'*For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is? For the thoughts of mortal men are miserable, and our devices are but uncertain.* (Wisdom of Solomon 9:13-14). The Hebrew library asks the very question Paul answers: man cannot know the counsel of Yahuah (God) by his own thought. So Paul says *we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory* (1 Corinthians 2:7) — a wisdom no *device* of mortal men could reach, hidden until Elohim (God) himself disclosed it.'),
  ('canon', '1-corinthians', 2, 10, 'apocrypha', 'the-wisdom-of-solomon', 9, 17, 'extras', E'*And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom of Solomon 9:17). The library names the only way the counsel of Elohim (God) is ever known: he must *send your Ruach HaKodesh (Holy Spirit) from above.* This is exactly Paul''s claim — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* (1 Corinthians 2:10). The deep things no man reaches are searched out by the Spirit sent from above; the hidden wisdom is opened only by the Ruach HaKodesh (Holy Spirit), not by *man''s wisdom.*'),
  ('canon', '1-corinthians', 2, 9, 'apocrypha', 'ecclesiasticus', 1, 10, 'extras', E'*She is with all flesh according to his gift, and he has given her to them that love him.* (Sirach 1:10). Sirach says wisdom is *created before all things* (Sirach 1:4) and *given to them that love him* — and Paul speaks of the hidden wisdom *which Elohim (God) ordained before the world* (1 Corinthians 2:7), the things *which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). The same two marks meet: wisdom set before the world began, and reserved for *them that love him.* What Sirach names as the gift of the fear of Yahuah (God) is the very wisdom Paul says the rulers of this age could not see.'),
  ('canon', '1-corinthians', 2, 8, 'apocrypha', 'the-wisdom-of-solomon', 2, 22, 'extras', E'*As for the mysteries of Yahuah (God), they knew them not: neither hoped they for the wages of righteousness, nor discerned a reward for blameless souls.* (Wisdom of Solomon 2:22). The ungodly of Wisdom plot against the righteous man because *their own wickedness has blinded them* (Wisdom 2:21) — *the mysteries of Yahuah (God), they knew them not.* Paul says the same of the rulers who crucified the Messiah: the hidden wisdom *none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:8). The blindness to the mystery is the blindness that condemned the just One; the princes did not know, and so they crucified the Lord of glory.'),
  -- thread: 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64
  ('canon', '1-corinthians', 2, 9, 'canon', 'isaiah', 64, 4, 'free', E'*For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him.* (Isaiah 64:4). This is the *as it is written* Paul cites: *Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). Isaiah''s prophet, longing for Yahuah (LORD) to rend the heavens and come down, confesses that no eye has seen what Elohim (God) prepares for *him that waiteth for him* — and Paul declares those prepared things now revealed by the Spirit to *them that love him,* the hidden wisdom unveiled to the gathered.'),
  ('canon', '1-corinthians', 2, 9, 'apocrypha', 'the-wisdom-of-solomon', 3, 4, 'extras', E'*For though they be punished in the sight of men, yet is their hope full of immortality.* (Wisdom of Solomon 3:4). The library tells what the eye of the ungodly cannot see: *the souls of the righteous are in the hand of Yahuah (God)... their hope is full of immortality* (Wisdom 3:1,4), a reward *the ungodly... neither hoped... nor discerned* (Wisdom 2:22). This is the unseen thing Paul means — *the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9), which *eye hath not seen.* The reward hidden from the world''s wisdom is the immortal hope kept for the righteous, prepared before the world and disclosed by the Spirit.'),
  -- thread: 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40
  ('canon', '1-corinthians', 2, 16, 'canon', 'isaiah', 40, 13, 'free', E'*Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13). This is the Tanakh word Paul cites: *For who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16). Isaiah''s question demands the answer *no one* — no man directs the Spirit of Yahuah (LORD) or teaches him. Yet Paul adds the astonishing turn: *But we have the mind of Messiah (Christ).* What no man could know of himself, the gathered are given in the Messiah — not that they instruct Yahuah (Lord), but that by the Spirit they share the very mind of the Formed Son.'),
  ('canon', '1-corinthians', 2, 16, 'canon', 'romans', 11, 34, 'free', E'*For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Paul quotes the same Isaiah 40:13 word in Romans, marvelling at *the depth of the riches both of the wisdom and knowledge of Elohim (God)* whose *ways past finding out.* Here in Corinth he cites it again — *who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16) — and answers it from the side of grace: the unsearchable mind no counsellor ever taught is now given to his people, for *we have the mind of Messiah (Christ).* The two passages set the same question; the wisdom hidden in Elohim (God) is opened to those who have the Spirit.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s228_co02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s228_co02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9',
       E'The hidden wisdom ordained before the world, which the princes knew not (Wisdom of Solomon 9, Sirach 1)',
       E'Paul speaks a wisdom that is not of this age: *we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory: Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory* (1 Corinthians 2:7-8). The Hebrew library had already framed this exact mystery. Wisdom of Solomon asks Paul''s question and gives Paul''s answer: *For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is? For the thoughts of mortal men are miserable, and our devices are but uncertain* (Wisdom 9:13-14) — and the only opening of that counsel is from above: *your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (Wisdom 9:17). This is precisely how Paul says the hidden wisdom is reached — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* (1 Corinthians 2:10). Sirach adds the two marks of this wisdom: it was *created before all things* and is *given to them that love him* (Sirach 1:4,10) — the same wisdom *ordained before the world* and prepared *for them that love him* (1 Corinthians 2:7,9). And the library names why the rulers missed it: the ungodly, *their own wickedness has blinded them,* for *the mysteries of Yahuah (God), they knew them not* (Wisdom 2:21-22). That blindness to the mystery is the blindness that crucified the just One — *had they known it, they would not have crucified Yahuah (Lord) of glory.* The wisdom of Elohim (God) is no philosophy of the wise but a mystery hidden from the world''s rulers and disclosed by the Ruach HaKodesh (Holy Spirit) to those who love him.',
       sv.verse_id, ev.verse_id, 'extras', 6625
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64',
       E'Eye hath not seen the things prepared for them that love him (Isaiah 64)',
       E'Paul caps the hidden wisdom with a written word: *But as it is written, Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9). The citation is Isaiah''s: *For since the beginning of the world men have not heard, nor perceived by the ear, neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him* (Isaiah 64:4). Isaiah''s prophet, longing for Yahuah (LORD) to *rend the heavens* and *come down,* confesses that no eye, no ear, no heart of man has reached what Elohim (God) prepares for the one who waits on him — and Paul declares those prepared things now revealed by the Spirit to *them that love him,* the gathered who receive the mystery. The restored library tells what that unseen thing is: *the souls of the righteous are in the hand of Yahuah (God)... their hope is full of immortality* (Wisdom of Solomon 3:1,4) — a reward the ungodly *neither hoped... nor discerned* (Wisdom 2:22). The thing eye hath not seen is the immortal hope kept for the righteous, prepared before the world and hidden from the world''s wisdom, opened to those who love Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 6628
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40',
       E'Who hath known the mind of Yahuah (Lord)? But we have the mind of Messiah (Isaiah 40)',
       E'Paul ends the chapter on a question and a gift. The question is Isaiah''s: *For who hath known the mind of Yahuah (Lord), that he may instruct him?* (1 Corinthians 2:16), citing *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13). Isaiah''s demand answers itself — no one directs the Spirit of Yahuah (LORD) or teaches him; the Creator of the ends of the earth has no counsellor and *there is no searching of his understanding* (Isaiah 40:28). Paul cites this same word in Romans, bowing before *the depth of the riches both of the wisdom and knowledge of Elohim (God)*: *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Here in Corinth he turns it toward grace. The unsearchable mind no man ever taught is now shared with his people: *But we have the mind of Messiah (Christ)* (1 Corinthians 2:16). This is not that the gathered instruct Yahuah (Lord), but that by the Spirit who *searcheth... the deep things of Elohim (God)* (1 Corinthians 2:10) they are given the mind of the Formed Son — the natural man cannot discern these things, but *he that is spiritual judgeth all things* (1 Corinthians 2:15), for the hidden wisdom is opened to those who have the Spirit.',
       sv.verse_id, ev.verse_id, 'free', 6631
  FROM _s228_co02_lookup sv, _s228_co02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='1-corinthians' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 9:13 — *For what man is he that can know the counsel of Yahuah (God)?* the library''s question that the hidden wisdom *which Elohim (God) ordained before the world* (1 Corinthians 2:7) answers.'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 9:17 — *except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above* the counsel known only by the Spirit sent from above; *the Spirit searcheth... the deep things of Elohim (God)* (1 Corinthians 2:10).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Sirach 1:10 — wisdom *given to them that love him,* and *created before all things* (Sirach 1:4); the wisdom *ordained before the world,* prepared *for them that love him* (1 Corinthians 2:7,9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 2:22 — *the mysteries of Yahuah (God), they knew them not,* the ungodly whom *wickedness has blinded* (Wisdom 2:21); the princes who *would not have crucified Yahuah (Lord) of glory* had they known (1 Corinthians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-the-hidden-wisdom-ordained-before-the-world-wisdom-of-solomon-9'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 64:4 — *neither hath the eye seen, O Elohim (God), beside thee, what he hath prepared for him that waiteth for him* the written word Paul cites: *Eye hath not seen... the things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:4 — *their hope is full of immortality,* the reward of the righteous the ungodly *neither hoped... nor discerned* (Wisdom 2:22); the unseen *things which Elohim (God) hath prepared for them that love him* (1 Corinthians 2:9).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-eye-hath-not-seen-the-things-prepared-for-them-that-love-him-isaiah-64'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:13 — *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* the citation behind *who hath known the mind of Yahuah (Lord)... But we have the mind of Messiah (Christ)* (1 Corinthians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:34 — *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* Paul citing the same Isaiah 40:13, the unsearchable mind now given: *we have the mind of Messiah (Christ)* (1 Corinthians 2:16).'
  FROM cross_reference_threads t, cross_references x, _s228_co02_lookup sv, _s228_co02_lookup tv
 WHERE t.slug='1-corinthians-2-who-hath-known-the-mind-of-the-lord-we-have-the-mind-of-messiah-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
